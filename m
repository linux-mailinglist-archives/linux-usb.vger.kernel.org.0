Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B323D0148
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 21:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729385AbfJHTix (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 15:38:53 -0400
Received: from smtp1.lauterbach.com ([62.154.241.196]:55775 "EHLO
        smtp1.lauterbach.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727336AbfJHTix (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Oct 2019 15:38:53 -0400
X-Greylist: delayed 399 seconds by postgrey-1.27 at vger.kernel.org; Tue, 08 Oct 2019 15:38:52 EDT
Received: (qmail 12580 invoked by uid 484); 8 Oct 2019 19:32:11 -0000
X-Qmail-Scanner-Diagnostics: from 10.2.10.40 by smtp1.lauterbach.com (envelope-from <ingo.rohloff@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(10.2.10.40):. 
 Processed in 0.657286 secs); 08 Oct 2019 19:32:11 -0000
Received: from unknown (HELO ingpc3.intern.lauterbach.com) (Authenticated_SSL:irohloff@[10.2.10.40])
          (envelope-sender <ingo.rohloff@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <linux-usb@vger.kernel.org>; 8 Oct 2019 19:32:10 -0000
Date:   Tue, 8 Oct 2019 21:32:10 +0200
From:   Ingo Rohloff <ingo.rohloff@lauterbach.com>
To:     linux-usb@vger.kernel.org, linux-hotplug@vger.kernel.org
Subject: [PATCH] usbfs: Suppress uevents for claiminterface/releaseinterface
Message-ID: <20191008213200.68194e8c@ingpc3.intern.lauterbach.com>
Organization: Lauterbach GmbH
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/gJAXmtNmZiC7T.k+mMSUEjR"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--MP_/gJAXmtNmZiC7T.k+mMSUEjR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

With recent Ubuntu 18/Linux Mint 19.2 etc, lots of user space programs 
(in particular systemd/eudev/upowerd) have problems with the "BIND/UNBIND" 
events produced since kernel 4.13.
Some problems are described, when googling for
  linux "usb" "bind event"

Now this might be blamed on these particular user space programs.
But: This also means that programs accessing a USB device via the generic 
usbfs layer can easily flood the kernel and all user space programs listening 
to uevents with tons of BIND/UNBIND events by calling

    ioctl(usbfd, USBDEVFS_CLAIMINTERFACE, &intf);
    ioctl(usbfd, USBDEVFS_RELEASEINTERFACE, &intf);

in a tight loop.
Of course this is an extreme example, but I have a use case where exactly 
this happens (running Linux Mint 19.2).
The result is that "systemd-udev" needs > 100% CPU and 
upowerd spams the system log with messages about "bind/unbind" events.

I am also not sure if these particular bind/unbind events contain any useful 
information; these events just mean an arbitrary user space program has 
bound/unbound from a particular USB interface.

The following patch tries to suppress emission of uevents 
for USB interfaces which are claimed/released via usbfs.

I am not sure if this is the right way to do it, but at least 
it seems to do what I intended...

with best regards
  Ingo Rohloff

--MP_/gJAXmtNmZiC7T.k+mMSUEjR
Content-Type: text/x-patch
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename=0001-USB-usbfs-Suppress-emission-of-uevents-for-interface.patch

=46rom 57970b0a5a36809ddb8f15687c18ca2147dc73bd Mon Sep 17 00:00:00 2001
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
Date: Tue, 8 Oct 2019 20:27:57 +0200
Subject: [PATCH] USB: usbfs: Suppress emission of uevents for interfaces
 handled via usbfs.

commit 1455cf8dbfd0
("driver core: emit uevents when device is bound to a driver")
added BIND and UNBIND events when a driver is bound/unbound
to a physical device.

For USB devices which are handled via the generic usbfs layer
(via libusb for example). This is problematic:
Each time a user space program calls
   ioctl(usb_fd, USBDEVFS_CLAIMINTERFACE, &usb_intf_nr);
and then later
   ioctl(usb_fd, USBDEVFS_RELEASEINTERFACE, &usb_intf_nr);
The kernel will now produce a BIND/UNBIND event, which
does not really contain any useful information.

Additionally this easily allows a user space program to run a
DoS attack against programs which listen to uevents
(in particular systemd/eudev/upowerd):
A malicious user space program just has to call in a tight loop

    ioctl(usbfd, USBDEVFS_CLAIMINTERFACE, &intf);
    ioctl(usbfd, USBDEVFS_RELEASEINTERFACE, &intf);

with this loop the malicious user space program floods
the kernel and all programs listening to uevents with
tons of BIND/UNBIND events.

The following patch tries to suppress uevents for interfaces
claimed via usbfs.
---
 drivers/usb/core/devio.c  | 7 ++++++-
 drivers/usb/core/driver.c | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 3f899552f6e3..a1af1d9b2ae7 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -764,8 +764,13 @@ static int claimintf(struct usb_dev_state *ps, unsigne=
d int ifnum)
 	intf =3D usb_ifnum_to_if(dev, ifnum);
 	if (!intf)
 		err =3D -ENOENT;
-	else
+	else {
+		/* suppress uevents for devices handled by usbfs */
+		dev_set_uevent_suppress(&intf->dev, 1);
 		err =3D usb_driver_claim_interface(&usbfs_driver, intf, ps);
+		if (err !=3D 0)
+			dev_set_uevent_suppress(&intf->dev, 0);
+	}
 	if (err =3D=3D 0)
 		set_bit(ifnum, &ps->ifclaimed);
 	return err;
diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 2b27d232d7a7..6a15bc5c2869 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -594,6 +594,8 @@ void usb_driver_release_interface(struct usb_driver *dr=
iver,
 	 */
 	if (device_is_registered(dev)) {
 		device_release_driver(dev);
+		/* make sure we allow uevents again */
+		dev_set_uevent_suppress(dev, 0);
 	} else {
 		device_lock(dev);
 		usb_unbind_interface(dev);
--=20
2.17.1


--MP_/gJAXmtNmZiC7T.k+mMSUEjR--
