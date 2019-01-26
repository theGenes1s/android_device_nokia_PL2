#
# Copyright (C) 2018 The Android Open-Source Project
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
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit common aosp configuration with telephony
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# AB update support
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS := system

PRODUCT_PACKAGES += \
    update_engine \
    update_verifier

# Camera
PRODUCT_PACKAGES += \
    Snap

# Copy different zygote settings for vendor
PRODUCT_COPY_FILES += \
    system/core/rootdir/init.zygote64_32.rc:root/init.zygote64_32.rc \
    system/core/rootdir/init.zygote32_64.rc:root/init.zygote32_64.rc

# The Messaging app:
#   Needed for android.telecom.cts.ExtendedInCallServiceTest#testOnCannedTextResponsesLoaded
PRODUCT_PACKAGES += \
    messaging

# Telephony:
#   Provide a default APN configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/apns-conf.xml:system/etc/apns-conf.xml

# NFC
PRODUCT_PACKAGES += \
    NfcNci

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/libnfc-nci.conf:system/etc/libnfc-nci.conf

# Support for the O-MR1 devices
PRODUCT_COPY_FILES += \
    build/make/target/product/vndk/init.gsi.rc:system/etc/init/init.gsi.rc \
    build/make/target/product/vndk/init.vndk-27.rc:system/etc/init/gsi/init.vndk-27.rc

# Name space configuration file for non-enforcing VNDK
PRODUCT_PACKAGES += \
    ld.config.vndk_lite.txt
