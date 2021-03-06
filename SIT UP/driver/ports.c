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
// Button entry functions.
// *************************************************************************************************

// system
#include "project.h"

// driver
#include "ports.h"
#include "buzzer.h"
#include "bmp_as.h"
#include "as.h"
#include "timer.h"
#include "display.h"

// logic
#include "stopwatch.h"

// Macro for button IRQ
#define IRQ_TRIGGERED(flags, bit)               ((flags & bit) == bit)

// *************************************************************************************************
// Global Variable section
volatile s_button_flags button;
volatile struct struct_button sButton;

// *************************************************************************************************
// Extern section
extern void (*fptr_Timer0_A3_function)(void);

// *************************************************************************************************
// @fn          init_buttons
// @brief       Init and enable button interrupts.
// @param       none
// @return      none
// *************************************************************************************************
void init_buttons(void)
{
    // Set button ports to input
    BUTTONS_DIR &= ~ALL_BUTTONS;

    // Enable internal pull-downs
    BUTTONS_OUT &= ~ALL_BUTTONS;
    BUTTONS_REN |= ALL_BUTTONS;

    // IRQ triggers on rising edge
    BUTTONS_IES &= ~ALL_BUTTONS;

    // Reset IRQ flags
    BUTTONS_IFG &= ~ALL_BUTTONS;

    // Enable button interrupts
    BUTTONS_IE |= ALL_BUTTONS;
}

// *************************************************************************************************
// @fn          PORT2_ISR
// @brief       Interrupt service routine for
//                                      - buttons
//                                      - acceleration sensor INT1
// @param       none
// @return      none
// *************************************************************************************************
#pragma vector=PORT2_VECTOR
__interrupt void PORT2_ISR(void)
{
    // Clear flags
    unsigned char int_flag, int_enable;
    unsigned char buzzer = 0;

    // Remember interrupt enable bits
    int_enable = BUTTONS_IE;

    if ((!button.flag.star_long) && (!button.flag.num_long))
    {
        // Clear button flags
        button.all_flags = 0;

        // Store valid button interrupt flag
        int_flag = BUTTONS_IFG & int_enable;

        {
            // Debounce buttons
            if ((int_flag & ALL_BUTTONS) != 0)
            {
                // Disable PORT2 IRQ
                __disable_interrupt();
                BUTTONS_IE = 0x00;
                __enable_interrupt();

                // Debounce delay 1
                Timer0_A4_Delay(CONV_MS_TO_TICKS(BUTTONS_DEBOUNCE_TIME_IN));
            }

            // ---------------------------------------------------
            // STAR button IRQ
            if (IRQ_TRIGGERED(int_flag, BUTTON_STAR_PIN))
            {
                // Filter bouncing noise
                if (BUTTON_STAR_IS_PRESSED)
                {
                    button.flag.star = 1;
                    button.flag.star_not_long = 0;
                    // Generate button click
                    buzzer = 1;
                }
                else if ((BUTTONS_IES & BUTTON_STAR_PIN) == BUTTON_STAR_PIN)
                {
                    button.flag.star = 1;
                    button.flag.star_not_long = 0;
                    BUTTONS_IES &= ~BUTTON_STAR_PIN;
                }
            }
            // ---------------------------------------------------
            // NUM button IRQ
            else if (IRQ_TRIGGERED(int_flag, BUTTON_NUM_PIN))
            {
                // Filter bouncing noise
                if (BUTTON_NUM_IS_PRESSED)
                {
                    button.flag.num = 1;
                    button.flag.num_not_long = 0;
                    // Generate button click
                    buzzer = 1;
                }
                else if ((BUTTONS_IES & BUTTON_NUM_PIN) == BUTTON_NUM_PIN)
                {
                    button.flag.num = 1;
                    button.flag.num_not_long = 0;
                    BUTTONS_IES &= ~BUTTON_NUM_PIN;
                }
            }

            // ---------------------------------------------------
            // DOWN button IRQ
            else if (IRQ_TRIGGERED(int_flag, BUTTON_DOWN_PIN))
            {
                // Filter bouncing noise
                if (BUTTON_DOWN_IS_PRESSED)
                {
                    button.flag.down = 1;

                    // Generate button click
                    buzzer = 1;

                    // Faster reaction for stopwatch stop button press
                    if (is_stopwatch() && !sys.flag.lock_buttons)
                    {
                        stop_stopwatch();
                        button.flag.down = 0;
                    }
                }
            }
        }

        // ---------------------------------------------------
        // Acceleration sensor IRQ
        if (IRQ_TRIGGERED(int_flag, AS_INT_PIN))
        {
            // Get data from sensor
            request.flag.acceleration_measurement = 1;
        }

    }
    // Reenable PORT2 IRQ
    __disable_interrupt();
    BUTTONS_IFG = 0x00;
    BUTTONS_IE = int_enable;
    __enable_interrupt();

    // Exit from LPM3/LPM4 on RETI
    __bic_SR_register_on_exit(LPM4_bits);
}
