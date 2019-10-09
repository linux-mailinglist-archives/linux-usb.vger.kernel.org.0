Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0B8D0AF5
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 11:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730674AbfJIJV5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 05:21:57 -0400
Received: from smtp1.lauterbach.com ([62.154.241.196]:34371 "EHLO
        smtp1.lauterbach.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730660AbfJIJV4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 05:21:56 -0400
Received: (qmail 5713 invoked by uid 484); 9 Oct 2019 09:21:54 -0000
X-Qmail-Scanner-Diagnostics: from 10.2.10.40 by smtp1.lauterbach.com (envelope-from <ingo.rohloff@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(10.2.10.40):. 
 Processed in 0.085783 secs); 09 Oct 2019 09:21:54 -0000
Received: from unknown (HELO ingpc3.intern.lauterbach.com) (Authenticated_SSL:irohloff@[10.2.10.40])
          (envelope-sender <ingo.rohloff@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <linux-usb@vger.kernel.org>; 9 Oct 2019 09:21:54 -0000
Date:   Wed, 9 Oct 2019 11:21:53 +0200
From:   Ingo Rohloff <ingo.rohloff@lauterbach.com>
To:     linux-usb@vger.kernel.org, linux-hotplug@vger.kernel.org
Subject: [PATCH] USB: usbfs: Suppress emission of uevents for interfaces
 handled via usbfs.
Message-ID: <20191009112141.04bd42a1@ingpc3.intern.lauterbach.com>
Organization: Lauterbach GmbH
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


commit 1455cf8dbfd0
("driver core: emit uevents when device is bound to a driver")
added bind/unbind uevents when a driver is bound/unbound
to a physical device.

For USB devices which are handled via the generic usbfs layer
(via libusb for example), this is problematic:
Each time a user space program calls
   ioctl(usb_fd, USBDEVFS_CLAIMINTERFACE, &usb_intf_nr);
and then later
   ioctl(usb_fd, USBDEVFS_RELEASEINTERFACE, &usb_intf_nr);
The kernel will now produce a bind/unbind event,
which does not really contain any useful information.

This allows a user space program to run a DoS attack against
programs which listen to uevents (in particular systemd/eudev/upowerd):
A malicious user space program just has to call in a tight loop

   ioctl(usb_fd, USBDEVFS_CLAIMINTERFACE, &usb_intf_nr);
   ioctl(usb_fd, USBDEVFS_RELEASEINTERFACE, &usb_intf_nr);

With this loop the malicious user space program floods
the kernel and all programs listening to uevents with
tons of bind/unbind events.

This patch suppresses uevents for interfaces claimed via usbfs.

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
---
 drivers/usb/core/devio.c  | 7 ++++++-
 drivers/usb/core/driver.c | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 3f899552f6e3..a1af1d9b2ae7 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -764,8 +764,13 @@ static int claimintf(struct usb_dev_state *ps, unsigned int ifnum)
 	intf = usb_ifnum_to_if(dev, ifnum);
 	if (!intf)
 		err = -ENOENT;
-	else
+	else {
+		/* suppress uevents for devices handled by usbfs */
+		dev_set_uevent_suppress(&intf->dev, 1);
 		err = usb_driver_claim_interface(&usbfs_driver, intf, ps);
+		if (err != 0)
+			dev_set_uevent_suppress(&intf->dev, 0);
+	}
 	if (err == 0)
 		set_bit(ifnum, &ps->ifclaimed);
 	return err;
diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 2b27d232d7a7..6a15bc5c2869 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -594,6 +594,8 @@ void usb_driver_release_interface(struct usb_driver *driver,
 	 */
 	if (device_is_registered(dev)) {
 		device_release_driver(dev);
+		/* make sure we allow uevents again */
+		dev_set_uevent_suppress(dev, 0);
 	} else {
 		device_lock(dev);
 		usb_unbind_interface(dev);
-- 
2.17.1

