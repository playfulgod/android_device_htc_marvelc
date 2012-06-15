/*
 * Copyright (C) 2009 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


#include <linux/input.h>

#include "recovery_ui.h"
#include "common.h"
#include "extendedcommands.h"

char* MENU_HEADERS[] = { "Use home-menu to highlight and search to select.",
                         "",
                         NULL };

char* MENU_ITEMS[] = { "Reboot system now",
                       "Apply update.zip",
                       "Factory Reset",
                       "Wipe Cache",
                       "Choose Zip To Install",
                       "Backup/Restore",
                       "Mounts/Storage",
                       "Extras",
                       "Power Off",
			NULL };

int device_recovery_start() {
    return 0;
}

int device_toggle_display(volatile char* key_pressed, int key_code) { 
    return key_code == 23; // keypad d key
}

int device_reboot_now(volatile char* key_pressed, int key_code) {
    // Reboot if the power key is pressed five times in a row, with
    // no other keys in between.
    static int presses = 0;
    if (key_code == 116) { // power button
        ++presses;
        return presses == 5;
    } else {
        presses = 0;
        return 0;
    }
}

int device_handle_key(int key_code, int visible) {
    if (visible) {
        switch (key_code) {
            case 115:  // side volume up button
	    case 102:  // home button
                return HIGHLIGHT_UP;

            case 114:  // side volume down button
	    case 139:  // menu button
                return HIGHLIGHT_DOWN;

            case 116:  // power key 
	    case 217:  // search button
                return SELECT_ITEM;
            
            case 158: // back cap key
                if (!get_allow_toggle_display())
                    return GO_BACK;
        }
    }

    return NO_ACTION;
}

int device_perform_action(int which) {
    return which;
}

int device_wipe_data() {
    return 0;
}
