Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D398F31B9
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2019 15:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbfKGOpG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Nov 2019 09:45:06 -0500
Received: from mx2.suse.de ([195.135.220.15]:42934 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726231AbfKGOpG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 7 Nov 2019 09:45:06 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 4073FB4DD;
        Thu,  7 Nov 2019 14:45:05 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     keithp@keithp.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>, Oliver Neukum <oneukum@suse.de>
Subject: [PATCH] USB: chaoskey: fix error case of a timeout
Date:   Thu,  7 Nov 2019 15:28:56 +0100
Message-Id: <20191107142856.16774-2-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191107142856.16774-1-oneukum@suse.com>
References: <20191107142856.16774-1-oneukum@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In case of a timeout or if a signal aborts a read
communication with the device needs to be ended
lest we overwrite an active URB the next time we
do IO to the device, as the URB may still be active.

Signed-off-by: Oliver Neukum <oneukum@suse.de>
---
 drivers/usb/misc/chaoskey.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/chaoskey.c b/drivers/usb/misc/chaoskey.c
index 34e6cd6f40d3..87067c3d6109 100644
--- a/drivers/usb/misc/chaoskey.c
+++ b/drivers/usb/misc/chaoskey.c
@@ -384,13 +384,17 @@ static int _chaoskey_fill(struct chaoskey *dev)
 		!dev->reading,
 		(started ? NAK_TIMEOUT : ALEA_FIRST_TIMEOUT) );
 
-	if (result < 0)
+	if (result < 0) {
+		usb_kill_urb(dev->urb);
 		goto out;
+	}
 
-	if (result == 0)
+	if (result == 0) {
 		result = -ETIMEDOUT;
-	else
+		usb_kill_urb(dev->urb);
+	} else {
 		result = dev->valid;
+	}
 out:
 	/* Let the device go back to sleep eventually */
 	usb_autopm_put_interface(dev->interface);
@@ -526,7 +530,21 @@ static int chaoskey_suspend(struct usb_interface *interface,
 
 static int chaoskey_resume(struct usb_interface *interface)
 {
+	struct chaoskey *dev;
+	struct usb_device *udev = interface_to_usbdev(interface);
+
 	usb_dbg(interface, "resume");
+	dev = usb_get_intfdata(interface);
+
+	/*
+	 * We may have lost power.
+	 * In that case the device that needs a long time
+	 * for the first requests needs an extended timeout
+	 * again
+	 */
+	if (le16_to_cpu(udev->descriptor.idVendor) == ALEA_VENDOR_ID)
+		dev->reads_started = false;
+
 	return 0;
 }
 #else
-- 
2.16.4

