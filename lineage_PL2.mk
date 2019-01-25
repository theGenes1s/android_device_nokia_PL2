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

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from PL2 device
$(call inherit-product, device/nokia/PL2/device.mk)

# Enable A/B update
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := system
PRODUCT_PACKAGES += \
    update_engine \
    update_verifier

PRODUCT_NAME := lineage_PL2
PRODUCT_DEVICE := PL2
PRODUCT_MANUFACTURER := FIH
PRODUCT_BRAND := Nokia

PRODUCT_GMS_CLIENTID_BASE := android-hmd

TARGET_VENDOR_PRODUCT_NAME := PL2
TARGET_VENDOR_DEVICE_NAME := PL2

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=PL2 \
    PRODUCT_NAME=PL2 \
    PRIVATE_BUILD_DESC="Plate2_00WW-user 9 PPR1.180610.011 00WW_3_260 release-keys"

BUILD_FINGERPRINT := Nokia/Plate2_00WW/PL2_sprout:9/PPR1.180610.011/00WW_3_260:user/release-keys
