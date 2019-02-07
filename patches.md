Following patches are required from ROM side:

- To boot during non-enforcing dm-verity/AVB, update_verifier needs to be patched, otherwise, the device will keep rebooting on the splash screen.

  **This patch is no longer required**

  **[[PATCH]](http://gerrit.aospextended.com/c/AospExtended/platform_bootable_recovery/+/693)**

- To display proper/latest Security Patch Level and Build ID in ROM, Base and Settings app needs to be patched.

   **[[PATCH-1]](http://gerrit.aospextended.com/c/AospExtended/platform_frameworks_base/+/364)** **[[PATCH-2]](http://gerrit.aospextended.com/c/AospExtended/platform_frameworks_base/+/365)** **[[PATCH-3]](http://gerrit.aospextended.com/c/AospExtended/platform_packages_apps_Settings/+/376)** **[[PATCH-4]](http://gerrit.aospextended.com/c/AospExtended/platform_packages_apps_Settings/+/377)**

- To boot with source built boot image, we need to patch the Security Patch Level in the boot image so that keymaster doesn't crash on boot. Another approach would be to import mkbootimgtool in the device tree and patch Security Patch Level manually or adding a release tool to take care of this. I prefer to patch ROM for now.

  **[[PATCH]](http://gerrit.aospextended.com/c/AospExtended/platform_build/+/802)**

**All of these patches will be and must be dropped when device tree will support the building of open source vendor.**
