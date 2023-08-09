Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB8F774FF7
	for <lists+linux-usb@lfdr.de>; Wed,  9 Aug 2023 02:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231430AbjHIAoi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 20:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231414AbjHIAoh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 20:44:37 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 7D1581BF4
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 17:44:36 -0700 (PDT)
Received: (qmail 178256 invoked by uid 1000); 8 Aug 2023 20:44:35 -0400
Date:   Tue, 8 Aug 2023 20:44:35 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: Remove Wireless USB and UWB documentation
Message-ID: <015d4310-bcd3-4ba4-9a0e-3664f281a9be@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Support for Wireless USB and Ultra WideBand was removed in 2020 by
commit caa6772db4c1 ("Staging: remove wusbcore and UWB from the kernel
tree.").  But the documentation files were left behind.

Let's get rid of that out-of-date documentation.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---

 CREDITS                                             |   11 -
 Documentation/ABI/testing/sysfs-bus-umc             |   28 ---
 Documentation/ABI/testing/sysfs-bus-usb             |   34 ----
 Documentation/ABI/testing/sysfs-class-uwb_rc        |  156 --------------------
 Documentation/ABI/testing/sysfs-class-uwb_rc-wusbhc |   57 -------
 Documentation/ABI/testing/sysfs-wusb_cbaf           |  101 ------------
 Documentation/admin-guide/kernel-parameters.txt     |    2 
 Documentation/driver-api/usb/usb.rst                |    3 
 Documentation/usb/authorization.rst                 |    9 -
 9 files changed, 5 insertions(+), 396 deletions(-)

Index: usb-devel/Documentation/ABI/testing/sysfs-bus-umc
===================================================================
--- usb-devel.orig/Documentation/ABI/testing/sysfs-bus-umc
+++ /dev/null
@@ -1,28 +0,0 @@
-What:           /sys/bus/umc/
-Date:           July 2008
-KernelVersion:  2.6.27
-Contact:        David Vrabel <david.vrabel@csr.com>
-Description:
-                The Wireless Host Controller Interface (WHCI)
-                specification describes a PCI-based device with
-                multiple capabilities; the UWB Multi-interface
-                Controller (UMC).
-
-                The umc bus presents each of the individual
-                capabilties as a device.
-
-What:           /sys/bus/umc/devices/.../capability_id
-Date:           July 2008
-KernelVersion:  2.6.27
-Contact:        David Vrabel <david.vrabel@csr.com>
-Description:
-                The ID of this capability, with 0 being the radio
-                controller capability.
-
-What:           /sys/bus/umc/devices/.../version
-Date:           July 2008
-KernelVersion:  2.6.27
-Contact:        David Vrabel <david.vrabel@csr.com>
-Description:
-                The specification version this capability's hardware
-                interface complies with.
Index: usb-devel/Documentation/ABI/testing/sysfs-bus-usb
===================================================================
--- usb-devel.orig/Documentation/ABI/testing/sysfs-bus-usb
+++ usb-devel/Documentation/ABI/testing/sysfs-bus-usb
@@ -28,40 +28,6 @@ Description:
 		drivers, non-authorized one are not.  By default, wired
 		USB devices are authorized.
 
-		Certified Wireless USB devices are not authorized
-		initially and should be (by writing 1) after the
-		device has been authenticated.
-
-What:		/sys/bus/usb/device/.../wusb_cdid
-Date:		July 2008
-KernelVersion:	2.6.27
-Contact:	David Vrabel <david.vrabel@csr.com>
-Description:
-		For Certified Wireless USB devices only.
-
-		A devices's CDID, as 16 space-separated hex octets.
-
-What:		/sys/bus/usb/device/.../wusb_ck
-Date:		July 2008
-KernelVersion:	2.6.27
-Contact:	David Vrabel <david.vrabel@csr.com>
-Description:
-		For Certified Wireless USB devices only.
-
-		Write the device's connection key (CK) to start the
-		authentication of the device.  The CK is 16
-		space-separated hex octets.
-
-What:		/sys/bus/usb/device/.../wusb_disconnect
-Date:		July 2008
-KernelVersion:	2.6.27
-Contact:	David Vrabel <david.vrabel@csr.com>
-Description:
-		For Certified Wireless USB devices only.
-
-		Write a 1 to force the device to disconnect
-		(equivalent to unplugging a wired USB device).
-
 What:		/sys/bus/usb/drivers/.../new_id
 Date:		October 2011
 Contact:	linux-usb@vger.kernel.org
Index: usb-devel/Documentation/ABI/testing/sysfs-wusb_cbaf
===================================================================
--- usb-devel.orig/Documentation/ABI/testing/sysfs-wusb_cbaf
+++ /dev/null
@@ -1,101 +0,0 @@
-What:           /sys/bus/usb/drivers/wusb_cbaf/.../wusb_*
-Date:           August 2008
-KernelVersion:  2.6.27
-Contact:        David Vrabel <david.vrabel@csr.com>
-Description:
-                Various files for managing Cable Based Association of
-                (wireless) USB devices.
-
-                The sequence of operations should be:
-
-                1. Device is plugged in.
-
-                2. The connection manager (CM) sees a device with CBA capability.
-                   (the wusb_chid etc. files in /sys/devices/blah/OURDEVICE).
-
-                3. The CM writes the host name, supported band groups,
-                   and the CHID (host ID) into the wusb_host_name,
-                   wusb_host_band_groups and wusb_chid files. These
-                   get sent to the device and the CDID (if any) for
-                   this host is requested.
-
-                4. The CM can verify that the device's supported band
-                   groups (wusb_device_band_groups) are compatible
-                   with the host.
-
-                5. The CM reads the wusb_cdid file.
-
-                6. The CM looks it up its database.
-
-                   - If it has a matching CHID,CDID entry, the device
-                     has been authorized before and nothing further
-                     needs to be done.
-
-                   - If the CDID is zero (or the CM doesn't find a
-                     matching CDID in its database), the device is
-                     assumed to be not known.  The CM may associate
-                     the host with device by: writing a randomly
-                     generated CDID to wusb_cdid and then a random CK
-                     to wusb_ck (this uploads the new CC to the
-                     device).
-
-                     CMD may choose to prompt the user before
-                     associating with a new device.
-
-                7. Device is unplugged.
-
-                References:
-                  [WUSB-AM]
-			    Association Models Supplement to the
-                            Certified Wireless Universal Serial Bus
-                            Specification, version 1.0.
-
-What:           /sys/bus/usb/drivers/wusb_cbaf/.../wusb_chid
-Date:           August 2008
-KernelVersion:  2.6.27
-Contact:        David Vrabel <david.vrabel@csr.com>
-Description:
-                The CHID of the host formatted as 16 space-separated
-                hex octets.
-
-                Writes fetches device's supported band groups and the
-                the CDID for any existing association with this host.
-
-What:           /sys/bus/usb/drivers/wusb_cbaf/.../wusb_host_name
-Date:           August 2008
-KernelVersion:  2.6.27
-Contact:        David Vrabel <david.vrabel@csr.com>
-Description:
-                A friendly name for the host as a UTF-8 encoded string.
-
-What:           /sys/bus/usb/drivers/wusb_cbaf/.../wusb_host_band_groups
-Date:           August 2008
-KernelVersion:  2.6.27
-Contact:        David Vrabel <david.vrabel@csr.com>
-Description:
-                The band groups supported by the host, in the format
-                defined in [WUSB-AM].
-
-What:           /sys/bus/usb/drivers/wusb_cbaf/.../wusb_device_band_groups
-Date:           August 2008
-KernelVersion:  2.6.27
-Contact:        David Vrabel <david.vrabel@csr.com>
-Description:
-                The band groups supported by the device, in the format
-                defined in [WUSB-AM].
-
-What:           /sys/bus/usb/drivers/wusb_cbaf/.../wusb_cdid
-Date:           August 2008
-KernelVersion:  2.6.27
-Contact:        David Vrabel <david.vrabel@csr.com>
-Description:
-                The device's CDID formatted as 16 space-separated hex
-                octets.
-
-What:           /sys/bus/usb/drivers/wusb_cbaf/.../wusb_ck
-Date:           August 2008
-KernelVersion:  2.6.27
-Contact:        David Vrabel <david.vrabel@csr.com>
-Description:
-                Write 16 space-separated random, hex octets to
-                associate with the device.
Index: usb-devel/Documentation/admin-guide/kernel-parameters.txt
===================================================================
--- usb-devel.orig/Documentation/admin-guide/kernel-parameters.txt
+++ usb-devel/Documentation/admin-guide/kernel-parameters.txt
@@ -6607,7 +6607,7 @@
 
 	usbcore.authorized_default=
 			[USB] Default USB device authorization:
-			(default -1 = authorized except for wireless USB,
+			(default -1 = authorized (same as 1),
 			0 = not authorized, 1 = authorized, 2 = authorized
 			if device connected to internal port)
 
Index: usb-devel/Documentation/driver-api/usb/usb.rst
===================================================================
--- usb-devel.orig/Documentation/driver-api/usb/usb.rst
+++ usb-devel/Documentation/driver-api/usb/usb.rst
@@ -771,8 +771,7 @@ Speed may be:
 	======= ======================================================
 	1.5	Mbit/s for low speed USB
 	12	Mbit/s for full speed USB
-	480	Mbit/s for high speed USB (added for USB 2.0);
-		also used for Wireless USB, which has no fixed speed
+	480	Mbit/s for high speed USB (added for USB 2.0)
 	5000	Mbit/s for SuperSpeed USB (added for USB 3.0)
 	======= ======================================================
 
Index: usb-devel/Documentation/usb/authorization.rst
===================================================================
--- usb-devel.orig/Documentation/usb/authorization.rst
+++ usb-devel/Documentation/usb/authorization.rst
@@ -33,12 +33,9 @@ Remove the lock down::
 
 	$ echo 1 > /sys/bus/usb/devices/usbX/authorized_default
 
-By default, Wired USB devices are authorized by default to
-connect. Wireless USB hosts deauthorize by default all new connected
-devices (this is so because we need to do an authentication phase
-before authorizing). Writing "2" to the authorized_default attribute
-causes kernel to only authorize by default devices connected to internal
-USB ports.
+By default, all USB devices are authorized.  Writing "2" to the
+authorized_default attribute causes the kernel to authorize by default
+only devices connected to internal USB ports.
 
 
 Example system lockdown (lame)
Index: usb-devel/Documentation/ABI/testing/sysfs-class-uwb_rc
===================================================================
--- usb-devel.orig/Documentation/ABI/testing/sysfs-class-uwb_rc
+++ /dev/null
@@ -1,156 +0,0 @@
-What:           /sys/class/uwb_rc
-Date:           July 2008
-KernelVersion:  2.6.27
-Contact:        linux-usb@vger.kernel.org
-Description:
-                Interfaces for WiMedia Ultra Wideband Common Radio
-                Platform (UWB) radio controllers.
-
-                Familiarity with the ECMA-368 'High Rate Ultra
-                Wideband MAC and PHY Specification' is assumed.
-
-What:           /sys/class/uwb_rc/beacon_timeout_ms
-Date:           July 2008
-KernelVersion:  2.6.27
-Description:
-                If no beacons are received from a device for at least
-                this time, the device will be considered to have gone
-                and it will be removed.  The default is 3 superframes
-                (~197 ms) as required by the specification.
-
-What:           /sys/class/uwb_rc/uwb<N>/
-Date:           July 2008
-KernelVersion:  2.6.27
-Contact:        linux-usb@vger.kernel.org
-Description:
-                An individual UWB radio controller.
-
-What:           /sys/class/uwb_rc/uwb<N>/beacon
-Date:           July 2008
-KernelVersion:  2.6.27
-Contact:        linux-usb@vger.kernel.org
-Description:
-                Write:
-
-                <channel>
-
-                to force a specific channel to be used when beaconing,
-                or, if <channel> is -1, to prohibit beaconing.  If
-                <channel> is 0, then the default channel selection
-                algorithm will be used.  Valid channels depends on the
-                radio controller's supported band groups.
-
-                Reading returns the currently active channel, or -1 if
-                the radio controller is not beaconing.
-
-What:           /sys/class/uwb_rc/uwb<N>/ASIE
-Date:           August 2014
-KernelVersion:  3.18
-Contact:        linux-usb@vger.kernel.org
-Description:
-
-                The application-specific information element (ASIE)
-                included in this device's beacon, in space separated
-                hex octets.
-
-                Reading returns the current ASIE.  Writing replaces
-                the current ASIE with the one written.
-
-What:           /sys/class/uwb_rc/uwb<N>/scan
-Date:           July 2008
-KernelVersion:  2.6.27
-Contact:        linux-usb@vger.kernel.org
-Description:
-                Write:
-
-                <channel> <type> [<bpst offset>]
-
-                to start (or stop) scanning on a channel.  <type> is one of:
-
-		   ==   =======================================
-                    0   scan
-                    1   scan outside BP
-                    2   scan while inactive
-                    3   scanning disabled
-                    4   scan (with start time of <bpst offset>)
-		   ==   =======================================
-
-What:           /sys/class/uwb_rc/uwb<N>/mac_address
-Date:           July 2008
-KernelVersion:  2.6.27
-Contact:        linux-usb@vger.kernel.org
-Description:
-                The EUI-48, in colon-separated hex octets, for this
-                radio controller.  A write will change the radio
-                controller's EUI-48 but only do so while the device is
-                not beaconing or scanning.
-
-What:           /sys/class/uwb_rc/uwb<N>/wusbhc
-Date:           July 2008
-KernelVersion:  2.6.27
-Contact:        linux-usb@vger.kernel.org
-Description:
-                A symlink to the device (if any) of the WUSB Host
-                Controller PAL using this radio controller.
-
-What:           /sys/class/uwb_rc/uwb<N>/<EUI-48>/
-Date:           July 2008
-KernelVersion:  2.6.27
-Contact:        linux-usb@vger.kernel.org
-Description:
-                A neighbour UWB device that has either been detected
-                as part of a scan or is a member of the radio
-                controllers beacon group.
-
-What:           /sys/class/uwb_rc/uwb<N>/<EUI-48>/BPST
-Date:           July 2008
-KernelVersion:  2.6.27
-Contact:        linux-usb@vger.kernel.org
-Description:
-                The time (using the radio controllers internal 1 ms
-                interval superframe timer) of the last beacon from
-                this device was received.
-
-What:           /sys/class/uwb_rc/uwb<N>/<EUI-48>/DevAddr
-Date:           July 2008
-KernelVersion:  2.6.27
-Contact:        linux-usb@vger.kernel.org
-Description:
-                The current DevAddr of this device in colon separated
-                hex octets.
-
-What:           /sys/class/uwb_rc/uwb<N>/<EUI-48>/EUI_48
-Date:           July 2008
-KernelVersion:  2.6.27
-Contact:        linux-usb@vger.kernel.org
-Description:
-
-                The EUI-48 of this device in colon separated hex
-                octets.
-
-What:           /sys/class/uwb_rc/uwb<N>/<EUI-48>/IEs
-Date:           July 2008
-KernelVersion:  2.6.27
-Contact:        linux-usb@vger.kernel.org
-Description:
-                The latest IEs included in this device's beacon, in
-                space separated hex octets with one IE per line.
-
-What:           /sys/class/uwb_rc/uwb<N>/<EUI-48>/LQE
-Date:           July 2008
-KernelVersion:  2.6.27
-Contact:        linux-usb@vger.kernel.org
-Description:
-                Link Quality Estimate - the Signal to Noise Ratio
-                (SNR) of all packets received from this device in dB.
-                This gives an estimate on a suitable PHY rate. Refer
-                to [ECMA-368] section 13.3 for more details.
-
-What:           /sys/class/uwb_rc/uwb<N>/<EUI-48>/RSSI
-Date:           July 2008
-KernelVersion:  2.6.27
-Contact:        linux-usb@vger.kernel.org
-Description:
-                Received Signal Strength Indication - the strength of
-                the received signal in dB.  LQE is a more useful
-                measure of the radio link quality.
Index: usb-devel/Documentation/ABI/testing/sysfs-class-uwb_rc-wusbhc
===================================================================
--- usb-devel.orig/Documentation/ABI/testing/sysfs-class-uwb_rc-wusbhc
+++ /dev/null
@@ -1,57 +0,0 @@
-What:           /sys/class/uwb_rc/uwb<N>/wusbhc/wusb_chid
-Date:           July 2008
-KernelVersion:  2.6.27
-Contact:        David Vrabel <david.vrabel@csr.com>
-Description:
-                Write the CHID (16 space-separated hex octets) for this host controller.
-                This starts the host controller, allowing it to accept connection from
-                WUSB devices.
-
-                Set an all zero CHID to stop the host controller.
-
-What:           /sys/class/uwb_rc/uwb<N>/wusbhc/wusb_trust_timeout
-Date:           July 2008
-KernelVersion:  2.6.27
-Contact:        David Vrabel <david.vrabel@csr.com>
-Description:
-                Devices that haven't sent a WUSB packet to the host
-                within 'wusb_trust_timeout' ms are considered to have
-                disconnected and are removed.  The default value of
-                4000 ms is the value required by the WUSB
-                specification.
-
-                Since this relates to security (specifically, the
-                lifetime of PTKs and GTKs) it should not be changed
-                from the default.
-
-What:           /sys/class/uwb_rc/uwb<N>/wusbhc/wusb_phy_rate
-Date:           August 2009
-KernelVersion:  2.6.32
-Contact:        David Vrabel <david.vrabel@csr.com>
-Description:
-                The maximum PHY rate to use for all connected devices.
-                This is only of limited use for testing and
-                development as the hardware's automatic rate
-                adaptation is better then this simple control.
-
-                Refer to [ECMA-368] section 10.3.1.1 for the value to
-                use.
-
-What:           /sys/class/uwb_rc/uwb<N>/wusbhc/wusb_dnts
-Date:           June 2013
-KernelVersion:  3.11
-Contact:        Thomas Pugliese <thomas.pugliese@gmail.com>
-Description:
-                The device notification time slot (DNTS) count and inverval in
-                milliseconds that the WUSB host should use.  This controls how
-                often the devices will have the opportunity to send
-                notifications to the host.
-
-What:           /sys/class/uwb_rc/uwb<N>/wusbhc/wusb_retry_count
-Date:           June 2013
-KernelVersion:  3.11
-Contact:        Thomas Pugliese <thomas.pugliese@gmail.com>
-Description:
-                The number of retries that the WUSB host should attempt
-                before reporting an error for a bus transaction.  The range of
-                valid values is [0..15], where 0 indicates infinite retries.
Index: usb-devel/CREDITS
===================================================================
--- usb-devel.orig/CREDITS
+++ usb-devel/CREDITS
@@ -666,11 +666,6 @@ S: Tamsui town, Taipei county,
 S: Taiwan 251
 S: Republic of China
 
-N: Reinette Chatre
-E: reinette.chatre@intel.com
-D: WiMedia Link Protocol implementation
-D: UWB stack bits and pieces
-
 N: Michael Elizabeth Chastain
 E: mec@shout.net
 D: Configure, Menuconfig, xconfig
@@ -3023,12 +3018,6 @@ S: Demonstratsii 8-382
 S: Tula 300000
 S: Russia
 
-N: Inaky Perez-Gonzalez
-E: inaky.perez-gonzalez@intel.com
-D: UWB stack, HWA-RC driver and HWA-HC drivers
-D: Wireless USB additions to the USB stack
-D: WiMedia Link Protocol bits and pieces
-
 N: Gordon Peters
 E: GordPeters@smarttech.com
 D: Isochronous receive for IEEE 1394 driver (OHCI module).
