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

#ifndef PROJECT_H_
#define PROJECT_H_

// *************************************************************************************************
// Include section
#include <cc430x613x.h>

// Conversion from msec to ACLK timer ticks
#define CONV_MS_TO_TICKS(msec)                          (((msec) * 32768) / 1000)

// Set of system flags
typedef union
{
    struct
    {
        unsigned short idle_timeout : 1;             // Timeout after inactivity
        unsigned short idle_timeout_enabled : 1;     // When in set mode, timeout after a given period
        unsigned short lock_buttons : 1;             // Lock buttons
        unsigned short mask_buzzer : 1;              // Do not output buzz for next button event
        unsigned short up_down_repeat_enabled : 1;   // While in set_value(), create virtual UP/DOWN button events
        unsigned short use_metric_units : 1;         // 1 = Use metric units, 0 = use English units
        unsigned short delay_over : 1;               // 1 = Timer delay over
    } flag;
    unsigned short all_flags;                        // Shortcut to all system flags (for reset)
} s_system_flags;
extern volatile s_system_flags sys;

// Set of request flags
typedef union
{
    struct
    {
        unsigned short acceleration_measurement : 1; // 1 = Measure acceleration
        unsigned short buzzer : 1;                   // 1 = Output buzzer
    } flag;
    unsigned short all_flags;                        // Shortcut to all request flags (for reset)
} s_request_flags;
extern volatile s_request_flags request;

// Set of message flags
typedef union
{
    struct
    {
        unsigned short prepare : 1;                  // 1 = Wait for clock tick, then set
                                          	  	  	  // display.flag.show_message flag
        unsigned short show : 1;                     // 1 = Display message now
        unsigned short erase : 1;                    // 1 = Erase message
        unsigned short type_locked : 1;              // 1 = Show "buttons are locked" in Line2
        unsigned short type_unlocked : 1;            // 1 = Show "buttons are unlocked" in Line2
    } flag;
    unsigned short all_flags;                        // Shortcut to all message flags (for reset)
} s_message_flags;
extern volatile s_message_flags message;

// Global flag set if Bosch sensors are used
extern unsigned char bmp_used;

#endif                                    /*PROJECT_H_ */
