// *************************************************************************************************
//
//      Copyright (C) 2009 Texas Instruments Incorporated - http://www.ti.com/
//
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
//
// *************************************************************************************************
// Temperature measurement functions.
// *************************************************************************************************
/* A macro that generates a bit mask according to a given bit number.
 * Example:
 * - BIT(0) expands to 1 (== 0x01)
 * - BIT(3) expands to 8 (== 0x08)
 */
#define BIT(x) (1uL << (x))

// *************************************************************************************************
// Include section

// system
#include "project.h"

// driver
#include "display.h"
#include "bmp_as.h"
#include "as.h"
#include "buzzer.h"

// logic
#include "acceleration.h"
#include "user.h"

#include <stdio.h>

// *************************************************************************************************
// Global Variable section
struct accel sAccel;

// Conversion values from data to mgrav taken from BMA250 datasheet (rev 1.05, figure 4)
	const unsigned short bmp_mgrav_per_bit[7] = { 16, 31, 63, 125, 250, 500, 1000 };

int counter=0;
// *************************************************************************************************
// Extern section

// *************************************************************************************************
// @fn          reset_acceleration
// @brief       Reset acceleration variables.
// @param       none
// @return      none
// *************************************************************************************************
void reset_acceleration(void)
{
    // Start with Y-axis display
    sAccel.view_style = DISPLAY_ACCEL_Y;

    // Clear timeout counter
    sAccel.timeout = 0;

    // Default mode is off
    sAccel.mode = ACCEL_MODE_OFF;
}

// *************************************************************************************************
// @fn          sx_acceleration
// @brief       Acceleration direct function. Button UP switches between X/Y/Z values.
// @param       unsigned char line         LINE2
// @return      none
// *************************************************************************************************
void sx_acceleration(unsigned char line)
{
    if (++sAccel.view_style > 2)
        sAccel.view_style = 0;

    // Reset current acceleration value
    sAccel.data = 0;
    sAccel.data_x = 0;
    sAccel.data_y = 0;

    // Get data from sensor
	if (bmp_used)
	{
        bmp_as_get_data(sAccel.xyz);
	}
}

// *************************************************************************************************
// @fn          acceleration_value_is_positive
// @brief       Returns 1 if 2's complement number is positive
// @param       unsigned char value        2's complement number
// @return      unsigned char                      1 = number is positive, 0 = number is negavtive
// *************************************************************************************************
unsigned char acceleration_value_is_positive(unsigned char value)
{
    return ((value & BIT7) == 0);
}

// *************************************************************************************************
// @fn          convert_acceleration_value_to_mgrav
// @brief       Converts measured value to mgrav units
// @param       unsigned char value        g data from sensor
// @return      unsigned short                     Acceleration (mgrav)
// *************************************************************************************************
unsigned short convert_acceleration_value_to_mgrav(unsigned char value)
{
    unsigned short result;
    unsigned char i;

    if (!acceleration_value_is_positive(value))
    {
        // Convert 2's complement negative number to positive number
        value = ~value;
        value += 1;
    }

    result = 0;
    for (i = 0; i < 7; i++)
    {
    	if (bmp_used)
    	{
            result += ((value & (BIT(i))) >> i) * bmp_mgrav_per_bit[i];
    	}
    }

    return (result);
}

// *************************************************************************************************
// @fn          is_acceleration_measurement
// @brief       Returns 1 if acceleration is currently measured.
// @param       none
// @return      unsigned char              1 = acceleration measurement ongoing
// *************************************************************************************************
unsigned char is_acceleration_measurement(void)
{
    return ((sAccel.mode == ACCEL_MODE_ON) && (sAccel.timeout > 0));
}

// *************************************************************************************************
// @fn          do_acceleration_measurement
// @brief       Get sensor data and store in sAccel struct
// @param       none
// @return      none
// *************************************************************************************************
void do_acceleration_measurement(void)
{
    // Get data from sensor
	if (bmp_used)
	{
        bmp_as_get_data(sAccel.xyz);
	}

    // Set display update flag
    display.flag.update_acceleration = 1;

//    unsigned char raw_data;
//    unsigned short accel_data;
//
//    raw_data = sAccel.xyz[1];
//
//    accel_data = convert_acceleration_value_to_mgrav(raw_data) / 10;
////            // Filter acceleration
//    accel_data = (unsigned short) ((accel_data * 0.2) + (sAccel.data * 0.8));
//
//    // Store average acceleration
//    //sAccel.data = accel_data;
//
//    if (accel_data==35){
//            start_buzzer(2, BUZZER_ON_TICKS, BUZZER_OFF_TICKS);
//    }
}

// *************************************************************************************************
// @fn          display_acceleration
// @brief       Display routine.
// @param       unsigned char line                 LINE1
//                              unsigned char update               DISPLAY_LINE_UPDATE_FULL, DISPLAY_LINE_CLEAR
// @return      none
// *************************************************************************************************
void display_acceleration(unsigned char line, unsigned char update)
{
    unsigned char *str;
    unsigned char *str_counter;
    unsigned char raw_data;
    unsigned char raw_data_x, raw_data_y;
    unsigned short accel_data;
    unsigned short accel_data_x, accel_data_y;

    int upCounter=0;
    int downCounter=0;
//    int counter=0;

    // Show warning if acceleration sensor was not initialised properly
    if (!as_ok)
    {
        display_chars(LCD_SEG_L1_2_0, (unsigned char *) "ERR", SEG_ON);
    }
    else
    {
        // Redraw whole screen
        if (update == DISPLAY_LINE_UPDATE_FULL)
        {
            {
                // Start acceleration sensor
                if (!is_acceleration_measurement())
                {
                    // Clear previous acceleration value
                    sAccel.data = 0;
                    sAccel.data_x = 0;
                    sAccel.data_y = 0;

                    // Start sensor
                	if (bmp_used)
                	{
                        bmp_as_start();
                	}

                    // Set timeout counter
                    sAccel.timeout = ACCEL_MEASUREMENT_TIMEOUT;

                    // Set mode
                    sAccel.mode = ACCEL_MODE_ON;

                    // Start with Y-axis values
                    sAccel.view_style = DISPLAY_ACCEL_Y;
                }

                // Display decimal point
                display_symbol(LCD_SEG_L1_DP1, SEG_ON);
            }
        }
        else if (update == DISPLAY_LINE_UPDATE_PARTIAL)
        {
            // Convert X/Y/Z values to mg


            switch (sAccel.view_style)
            {
                case DISPLAY_ACCEL_X:
                case DISPLAY_ACCEL_Y:

                    raw_data_x = sAccel.xyz[0];
                    raw_data_y = sAccel.xyz[1];
                    //display_char(LCD_SEG_L1_3, 'X', SEG_ON);



                    break;
                default:
                    raw_data = sAccel.xyz[1];
                    //display_char(LCD_SEG_L1_3, 'Z', SEG_ON);

                    break;
            }

            accel_data = convert_acceleration_value_to_mgrav(raw_data) / 10;
//            // Filter acceleration
            accel_data = (unsigned short) ((accel_data * 0.2) + (sAccel.data * 0.8));
            sAccel.data = accel_data;

            accel_data_x = convert_acceleration_value_to_mgrav(raw_data_x) / 10;
            accel_data_x = (unsigned short) ((accel_data_x * 0.2) + (sAccel.data_x * 0.8));
            accel_data_y = convert_acceleration_value_to_mgrav(raw_data_y) / 10;
            accel_data_y = (unsigned short) ((accel_data_y * 0.2) + (sAccel.data_y * 0.8));

            // Store average acceleration

            sAccel.data_x = accel_data_x;
            sAccel.data_y = accel_data_y;

            // Display acceleration in x.xx format
            str = int_to_array(accel_data, 3, 0); // edit here
            display_chars(LCD_SEG_L1_2_0, str, SEG_ON);

                        if (accel_data_x==35){
                        		start_buzzer(2, BUZZER_ON_TICKS, BUZZER_OFF_TICKS);
                        		counter+=1;
                        	}



        if (accel_data_y==60 ){
        		start_buzzer(2, BUZZER_ON_TICKS, BUZZER_OFF_TICKS);
        		counter+=1;
        	}
        	str_counter = int_to_array(counter, 4, 0);
        	display_chars(LCD_SEG_L1_2_0, str_counter, SEG_ON);
        	//printf("hello %d\n" , counter);
        }

//            if (accel_data_x>=35 && accel_data_x<=55){
//            	if (accel_data_y>=25 && accel_data_y<=55){
//            		start_buzzer(2, BUZZER_ON_TICKS, BUZZER_OFF_TICKS);
//            	}
//            }

//            //Up Counter
//            if (accel_data_x==55 && accel_data_y <= 60 && accel_data_y >= 54){
//            	upCounter = 1;
//            	start_buzzer(5, BUZZER_ON_TICKS, BUZZER_OFF_TICKS);
//
//
//            }
//            //Down Counter
//            if (accel_data_x==85 && accel_data_y <= 15 && accel_data_y > 0){
//            	downCounter = 1;
//                start_buzzer(5, BUZZER_ON_TICKS, BUZZER_OFF_TICKS);
//            }
//            if (upCounter == 1 && downCounter ==1){
//            	counter += 1;
//            	upCounter = 0;
//            	downCounter = 0;
//            	str_counter = int_to_array(downCounter, 4, 0);
//	            display_chars(LCD_SEG_L1_2_0, str_counter, SEG_ON);
//            }

        else if (update == DISPLAY_LINE_CLEAR)
        {
            // Stop acceleration sensor
        	if (bmp_used)
        	{
                bmp_as_stop();
        	}

            // Clear mode
            sAccel.mode = ACCEL_MODE_OFF;

            // Clean up display
            display_symbol(LCD_SEG_L1_DP1, SEG_OFF);
            display_symbol(LCD_SYMB_ARROW_UP, SEG_OFF);
            display_symbol(LCD_SYMB_ARROW_DOWN, SEG_OFF);
        }
    }
}
