// *************************************************************************************************
//      Copyright (C) 2009 Texas Instruments Incorporated - http://www.ti.com/
//
//        Redistribution and use in source and binary forms, with or without
//        modification, are permitted provided that the following conditions
//        are met:
//
//          Redistributions of source code must retain the above copyright
//          notice, this list of conditions and the following disclaimer.
//
//          Redistributions in binary form must reproduce the above copyright
//          notice, this list of conditions and the following disclaimer in the
//          documentation and/or other materials provided with the
//          distribution.
//
//          Neither the name of Texas Instruments Incorporated nor the names of
//          its contributors may be used to endorse or promote products derived
//          from this software without specific prior written permission.
//
//        THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
//        "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
//        LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
//        A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
//        OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
//        SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
//        LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
//        DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
//        THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//        (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
//        OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// *************************************************************************************************
// Stopwatch functions.
// *************************************************************************************************
// Include section

// system
#include "project.h"
#include <string.h>

// driver
#include "stopwatch.h"
#include "ports.h"
#include "display.h"
#include "timer.h"
#include "buzzer.h"

// logic
#include "menu.h"

// *************************************************************************************************
// Prototypes section
void start_stopwatch(void);
void stop_stopwatch(void);
void reset_stopwatch(void);
void countdownTimer(void);
void update_stopwatch_timer(void);
void mx_stopwatch(unsigned char line);
void sx_stopwatch(unsigned char line);
void display_stopwatch(unsigned char line, unsigned char update);

// *************************************************************************************************
// Global Variable section
struct stopwatch sStopwatch;

// *************************************************************************************************
// @fn          update_stopwatch_timer
// @brief       Set new compare time for next 1/1Hz or 1/100Hz interrupt. Takes care for exact 1
// second timing.
// @param       ticks (1 tick = 1/32768 sec)
// @return      none
// *************************************************************************************************
void update_stopwatch_timer(void)
{
    unsigned short value;

    // Load CCR register with next capture time

        // Timer interrupts occur every 32768/100 = 328 ACLK
        // --> stopwatch runs too slow (1 sec nominal != 100 interupts * 328 ACLK = 32800 ACLK =
        // 1.00098 sec)
        // --> ideally correct timer value every 10 ticks by (32768 - 32800)/10 = 3.2
        // --> correct timer value every 10Hz by 3,
        // --> correct timer value every 1Hz correct by 5
        value = TA0CCR2 + STOPWATCH_100HZ_TICK;

        if (sStopwatch.swtIs1Hz)
        {
            value -= 5;
            sStopwatch.swtIs1Hz = 0;
            sStopwatch.swtIs10Hz = 0;
        }
        else if (sStopwatch.swtIs10Hz)
        {
            value -= 3;
            sStopwatch.swtIs10Hz = 0;
        }

    // Update CCR
    TA0CCR2 = value;
}

/****************************************************************************************************/
/*	This function address the function of doing the 1 milisecond reduction for the countdown timer	*/
/*	It is called by the 1/100Hz Interrupt to do the reduction									  	*/
/*	Author: Soh Yun Yong																		  	*/
/*	Created in: 01 - Sep 2015																 		*/
/*	Updated: 03 - Dec 2015																  			*/
/****************************************************************************************************/
void countdownTimer(void)
{
    static unsigned char delay = 0;

    // Add 1/100 sec
	sStopwatch.time[7]--;

    // Draw flag minimizes display update activity
    // swt.drawFlag = 1: second L
    // swt.drawFlag = 2: second H/L
    // swt.drawFlag = 3: minutes L, second H/L
    // swt.drawFlag = 4: minutes H/L, second H/L
    // swt.drawFlag = 5: hours L, minutes H/L, second H/L
    // swt.drawFlag = 6: hours H/L, minutes H/L, second H/L
    // swt.drawFlag = 7: 1/10 sec, 1/100 sec
    // swt.drawFlag = 8: 1/100 sec (every 17/100 sec to reduce display draw activity)
    if (delay++ > 17)
    {
        sStopwatch.drawFlag = 8;
        delay = 0;
    }

    // Add 1/10 sec
    if (sStopwatch.time[7] == 0x2f)

    {
        sStopwatch.time[7] = '9';

        sStopwatch.time[6]--;

        // 1/10Hz trigger
        sStopwatch.swtIs10Hz = 1;

        // Update draw flag
        sStopwatch.drawFlag = 7;
    }

    // Second overflow?
    if (sStopwatch.time[6] == 0x2f)
    {
        // Reset draw flag
        sStopwatch.drawFlag = 1;

        // 1Hz trigger
        sStopwatch.swtIs1Hz = 1;

        // 30 sec Buzzer Alert
        if ( (sStopwatch.time[4] == 0x33) && (sStopwatch.time[5] == 0x30) )
        {
        	start_buzzer(3, BUZZER_ON_TICKS, BUZZER_OFF_TICKS);
        }

        // 20 sec Buzzer Alert
        if ( (sStopwatch.time[4] == 0x32) && (sStopwatch.time[5] == 0x30) )
        {
        	start_buzzer(2, BUZZER_ON_TICKS, BUZZER_OFF_TICKS);
        }

        // 10 sec Buzzer Alert
        if ( (sStopwatch.time[4] == 0x31) && (sStopwatch.time[5] == 0x30) )
        {
        	start_buzzer(1, BUZZER_ON_TICKS, BUZZER_OFF_TICKS);
        }

        if ( (sStopwatch.time[4] == 0x30) && (sStopwatch.time[5] == 0x30) )
        {
        	// Buzzer when the time has ended.
        	start_buzzer(5, CONV_MS_TO_TICKS(200), BUZZER_OFF_TICKS);
        	stop_stopwatch();

            // Clear counter
            memcpy(sStopwatch.time, "00000000", sizeof(sStopwatch.time));
        	display_stopwatch(2, DISPLAY_LINE_UPDATE_FULL);
        }
        else
        {
            // Add data
              sStopwatch.time[6] = '9';
              sStopwatch.time[5]--;                      // second  L (0 - 9)

              if (sStopwatch.time[5] == 0x2f)
              {
                  sStopwatch.drawFlag++;                 // 2
                  sStopwatch.time[5] = '9';
                  sStopwatch.time[4]--;                  // second  H (0 - 5)
              }
        }
    }

    // Always set display update flag
    display.flag.update_stopwatch = 1;
}

// *************************************************************************************************
// @fn          reset_stopwatch
// @brief       Clears stopwatch counter and sets stopwatch state to off.
// @param       none
// @return      none
// *************************************************************************************************
void reset_stopwatch(void)
{
    // Clear counter
    memcpy(sStopwatch.time, "00006000", sizeof(sStopwatch.time));

    // Clear trigger
    sStopwatch.swtIs10Hz = 0;   // 1/10Hz trigger
    sStopwatch.swtIs1Hz = 0;    // 1Hz trigger

    // Init stopwatch state 'Off'
    sStopwatch.state = STOPWATCH_STOP;
}

// *************************************************************************************************
// @fn          is_stopwatch
// @brief       Is stopwatch operating and visible?
// @param       none
// @return      1=STOPWATCH_RUN, 0=other states
// *************************************************************************************************
unsigned char is_stopwatch(void)
{
    return ((sStopwatch.state == STOPWATCH_RUN) && (ptrMenu_L2 == &menu_L2_Stopwatch));
}

// *************************************************************************************************
// @fn          start_stopwatch
// @brief       Starts stopwatch timer interrupt and sets stopwatch state to on.
// @param       none
// @return      none
// *************************************************************************************************
void start_stopwatch(void)
{
    // Set stopwatch run flag
    sStopwatch.state = STOPWATCH_RUN;

    // Init CCR register with current time
    TA0CCR2 = TA0R;

    // Load CCR register with next capture time
    update_stopwatch_timer();

    // Reset IRQ flag
    TA0CCTL2 &= ~CCIFG;

    // Enable timer interrupt
    TA0CCTL2 |= CCIE;

    // Set stopwatch icon
    display_symbol(LCD_ICON_STOPWATCH, SEG_ON);
}

// *************************************************************************************************
// @fn          stop_stopwatch
// @brief       Stops stopwatch timer interrupt and sets stopwatch state to off.
//                              Does not reset stopwatch count.
// @param       none
// @return      none
// *************************************************************************************************
void stop_stopwatch(void)
{
    // Clear timer interrupt enable
    TA0CCTL2 &= ~CCIE;

    // Clear stopwatch run flag
    sStopwatch.state = STOPWATCH_STOP;

    // Clear stopwatch icon
    display_symbol(LCD_ICON_STOPWATCH, SEG_OFF);

    // Call draw routine immediately
    display_stopwatch(LINE2, DISPLAY_LINE_UPDATE_FULL);
}

// *************************************************************************************************
// @fn          mx_stopwatch
// @brief       Stopwatch set routine. Mx stops stopwatch and resets count.
// @param       unsigned char line LINE2
// @return      none
// *************************************************************************************************
void mx_stopwatch(unsigned char line)
{
    // Stop stopwatch
    stop_stopwatch();

    // Reset stopwatch count
    reset_stopwatch();

    // Display "00:00:00"
    display_stopwatch(line, DISPLAY_LINE_UPDATE_FULL);
}

// *************************************************************************************************
// @fn          sx_stopwatch
// @brief       Stopwatch direct function. Button DOWN starts/stops stopwatch, but does not reset
// count.
// @param       unsigned char line LINE2
// @return      none
// *************************************************************************************************
void sx_stopwatch(unsigned char line)
{
    // DOWN: RUN, STOP
    if (button.flag.down)
    {
        if (sStopwatch.state == STOPWATCH_STOP)
        {
            // (Re)start stopwatch
            start_stopwatch();
        }
        else
        {
            // Stop stopwatch
            stop_stopwatch();
        }

    }
}

// *************************************************************************************************
// @fn          display_stopwatch
// @brief       Stopwatch user routine. Sx starts/stops stopwatch, but does not reset count.
// @param       unsigned char line LINE2
//                              unsigned char update       DISPLAY_LINE_UPDATE_PARTIAL,
// DISPLAY_LINE_UPDATE_FULL
// @return      none
// *************************************************************************************************
void display_stopwatch(unsigned char line, unsigned char update)
{
    // Partial line update only
    if (update == DISPLAY_LINE_UPDATE_PARTIAL)
    {
        if (display.flag.update_stopwatch)
        {
        	// Check draw flag to minimize workload
        	if (sStopwatch.drawFlag != 0)
        	{
        		switch (sStopwatch.drawFlag)
        	    {
        	    	case 4:
        	        	display_char(LCD_SEG_L2_5, sStopwatch.time[2], SEG_ON);
        	        case 3:
        	        	display_char(LCD_SEG_L2_4, sStopwatch.time[3], SEG_ON);
        	        case 2:
        	        	display_char(LCD_SEG_L2_3, sStopwatch.time[4], SEG_ON);
        	        case 1:
        	            display_char(LCD_SEG_L2_2, sStopwatch.time[5], SEG_ON);
        	        case 7:
        	            display_char(LCD_SEG_L2_1, sStopwatch.time[6], SEG_ON);
        	        case 8:
        	            display_char(LCD_SEG_L2_0, sStopwatch.time[7], SEG_ON);
        	    }
        	}
        }
    }
    // Redraw whole line
    else if (update == DISPLAY_LINE_UPDATE_FULL)
    {
        // Display MM:SS:hh
        display_chars(LCD_SEG_L2_5_0, sStopwatch.time + 2, SEG_ON);

        display_symbol(LCD_SEG_L2_COL1, SEG_ON);
        display_symbol(LCD_SEG_L2_COL0, SEG_ON);
    }
}
