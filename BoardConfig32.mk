#
# Copyright (C) 2018 The TwrpBuilder Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
ifneq ($(filter msm8974 msm8227 msm8627 msm8230 apq8030 msm8630 msm8930 msm8930AA apq8060A msm8260A msm8660A msm8960 MPQ8064 msm8674 msm8274 apq8084,$(TARGET_BOARD_PLATFORM)),)
TARGET_CPU_VARIANT := krait
TARGET_RECOVERY_QCOM_RTC_FIX := true
else 
TARGET_CPU_VARIANT := cortex-a9
endif

# TWRP
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
ifeq ($(TW_THEME),)
TW_THEME := portrait_hdpi
endif
RECOVERY_SDCARD_ON_DATA := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
