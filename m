Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0AA0D3F10
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 13:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbfJKLzX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 07:55:23 -0400
Received: from smtp1.lauterbach.com ([62.154.241.196]:55761 "EHLO
        smtp1.lauterbach.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727541AbfJKLzX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Oct 2019 07:55:23 -0400
Received: (qmail 20354 invoked by uid 484); 11 Oct 2019 11:55:20 -0000
X-Qmail-Scanner-Diagnostics: from 10.2.10.44 by smtp1.lauterbach.com (envelope-from <ingo.rohloff@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(10.2.10.44):. 
 Processed in 0.085656 secs); 11 Oct 2019 11:55:20 -0000
Received: from unknown (HELO ingpc2.intern.lauterbach.com) (Authenticated_SSL:irohloff@[10.2.10.44])
          (envelope-sender <ingo.rohloff@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <gregkh@linuxfoundation.org>; 11 Oct 2019 11:55:19 -0000
From:   Ingo Rohloff <ingo.rohloff@lauterbach.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-hotplug@vger.kernel.org,
        Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH v2] usb: usbfs: Suppress problematic bind and unbind uevents.
Date:   Fri, 11 Oct 2019 13:55:18 +0200
Message-Id: <20191011115518.2801-1-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

commit 1455cf8dbfd0 ("driver core: emit uevents when device is bound
to a driver") added bind and unbind uevents when a driver is bound or
unbound to a physical device.

For USB devices which are handled via the generic usbfs layer (via
libusb for example), this is problematic:
Each time a user space program calls
   ioctl(usb_fd, USBDEVFS_CLAIMINTERFACE, &usb_intf_nr);
and then later
   ioctl(usb_fd, USBDEVFS_RELEASEINTERFACE, &usb_intf_nr);
The kernel will now produce a bind or unbind event, which does not
really contain any useful information.

This allows a user space program to run a DoS attack against programs
which listen to uevents (in particular systemd/eudev/upowerd):
A malicious user space program just has to call in a tight loop

   ioctl(usb_fd, USBDEVFS_CLAIMINTERFACE, &usb_intf_nr);
   ioctl(usb_fd, USBDEVFS_RELEASEINTERFACE, &usb_intf_nr);

With this loop the malicious user space program floods the kernel and
all programs listening to uevents with tons of bind and unbind
events.

This patch suppresses uevents for ioctls USBDEVFS_CLAIMINTERFACE and
USBDEVFS_RELEASEINTERFACE.

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
---

Notes:
    v2:
    Patch only single file (devio.c), try to only suppress uevents while
    usb_driver_claim_interface/usb_driver_release_interface are called.
    Try to restore old state of dev->kobj.uevent_suppress.

 drivers/usb/core/devio.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 3f899552f6e3..6ca40d135430 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -764,8 +764,15 @@ static int claimintf(struct usb_dev_state *ps, unsigned int ifnum)
 	intf = usb_ifnum_to_if(dev, ifnum);
 	if (!intf)
 		err = -ENOENT;
-	else
+	else {
+		unsigned int old_suppress;
+
+		/* suppress uevents while claiming interface */
+		old_suppress = dev_get_uevent_suppress(&intf->dev);
+		dev_set_uevent_suppress(&intf->dev, 1);
 		err = usb_driver_claim_interface(&usbfs_driver, intf, ps);
+		dev_set_uevent_suppress(&intf->dev, old_suppress);
+	}
 	if (err == 0)
 		set_bit(ifnum, &ps->ifclaimed);
 	return err;
@@ -785,7 +792,13 @@ static int releaseintf(struct usb_dev_state *ps, unsigned int ifnum)
 	if (!intf)
 		err = -ENOENT;
 	else if (test_and_clear_bit(ifnum, &ps->ifclaimed)) {
+		unsigned int old_suppress;
+
+		/* suppress uevents while releasing interface */
+		old_suppress = dev_get_uevent_suppress(&intf->dev);
+		dev_set_uevent_suppress(&intf->dev, 1);
 		usb_driver_release_interface(&usbfs_driver, intf);
+		dev_set_uevent_suppress(&intf->dev, old_suppress);
 		err = 0;
 	}
 	return err;
-- 
2.17.1

