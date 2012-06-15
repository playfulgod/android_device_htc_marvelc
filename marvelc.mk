#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissioframeworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xmlns and
# limitations under the License.
#


DEVICE_PACKAGE_OVERLAYS := device/htc/marvelc/overlay

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/marvelc/key/marvelc-keypad.kl:system/usr/keylayout/marvelc-keypad.kl \
    device/htc/marvelc/key/marvelc-keypad.kcm.bin:system/usr/keychars/marvelc-keypad.kcm.bin \
    device/htc/marvelc/key/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl

PRODUCT_COPY_FILES += \
    device/htc/marvelc/ueventd.marvelc.rc:root/ueventd.marvelc.rc\
    device/htc/marvelc/init.marvelc.rc:root/init.marvelc.rc \
    device/htc/marvelc/apns-conf.xml:/system/etc/apns-conf.xml

# For emmc phone storage
PRODUCT_PROPERTY_OVERRIDES += \
    ro.phone_storage = 0


# This is a 512MB device, so 32mb heapsize
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=32m

$(call inherit-product-if-exists, vendor/htc/marvelc/marvelc-vendor.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    settings.display.autobacklight=1 \
    settings.display.brightness=143 \
    ro.com.google.locationfeatures = 1 \
    ro.media.dec.aud.wma.enabled=1 \
    ro.media.dec.vid.wmv.enabled=1 \
    dalvik.vm.dexopt-flags=m=y \
    net.bt.name=Marvelc \
    ro.config.sync=yes

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/marvelc/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES += \
    librs_jni \
    lights.marvelc \
    gralloc.msm7k \
    libOmxCore \
    sensors.marvelc \
    gps.marvelc \
    com.android.future.usb.accessory

PRODUCT_COPY_FILES += \
    device/htc/marvelc/vold.fstab:system/etc/vold.fstab \
    device/common/gps/gps.conf_US:system/etc/gps.conf

# Kernel modules

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/marvelc/prebuilt/zImage
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Prebuilt Modules
PRODUCT_COPY_FILES += \
    device/htc/marvelc/prebuilt/bcm4329.ko:/system/lib/modules/bcm4329.ko \
    device/htc/marvelc/prebuilt/hostap.ko:/system/lib/modules/hostap.ko \
    device/htc/marvelc/prebuilt/lib80211.ko:/system/lib/modules/lib80211.ko \
    device/htc/marvelc/prebuilt/lib80211_crypt_ccmp.ko:/system/lib/modules/lib80211_crypt_ccmp.ko \
    device/htc/marvelc/prebuilt/lib80211_crypt_tkip.ko:/system/lib/modules/lib80211_crypt_tkip.ko \
    device/htc/marvelc/prebuilt/lib80211_crypt_wep.ko:/system/lib/modules/lib80211_crypt_wep.ko \
    device/htc/marvelc/prebuilt/michael_mic.ko:/system/lib/modules/michael_mic.ko \
    device/htc/marvelc/prebuilt/ssb.ko:/system/lib/modules/ssb.ko \
    device/htc/marvelc/firmware/bcm4329.hcd:/system/etc/firmware/bcm4329.hcd \
    device/htc/marvelc/firmware/fw_bcm4329.bin:/system/etc/firmware/fw_bcm4329.bin \
    device/htc/marvelc/firmware/fw_bcm4329_apsta.bin:/system/etc/firmware/fw_bcm4329_apsta.bin

# media profiles and capabilities spec
$(call inherit-product, device/htc/marvelc/media_a1026.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)


PRODUCT_NAME := HTC_marvelc
PRODUCT_DEVICE := marvelc
