Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71F0415E5A
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2019 09:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbfEGHjJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 May 2019 03:39:09 -0400
Received: from mx2.suse.de ([195.135.220.15]:57308 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726908AbfEGHjG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 May 2019 03:39:06 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 298EBAECE;
        Tue,  7 May 2019 07:39:05 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregKH@linuxfoundation.org, miquel@df.uba.ar,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv2 1/4] rio500: refuse more than one device at a time
Date:   Tue,  7 May 2019 09:38:34 +0200
Message-Id: <20190507073837.19234-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This driver is using a global variable. It cannot handle more than
one device at a time. The issue has been existing since the dawn
of the driver.

V2: Fixed locking in probe()
    Fixed Documentation

Signed-off-by: Oliver Neukum <oneukum@suse.com>
Reported-by: syzbot+35f04d136fc975a70da4@syzkaller.appspotmail.com
---
 drivers/usb/misc/rio500.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/rio500.c b/drivers/usb/misc/rio500.c
index 13e4889bc34f..fa921ae60ffa 100644
--- a/drivers/usb/misc/rio500.c
+++ b/drivers/usb/misc/rio500.c
@@ -447,15 +447,23 @@ static int probe_rio(struct usb_interface *intf,
 {
 	struct usb_device *dev = interface_to_usbdev(intf);
 	struct rio_usb_data *rio = &rio_instance;
-	int retval;
+	int retval = 0;
 
-	dev_info(&intf->dev, "USB Rio found at address %d\n", dev->devnum);
+	mutex_lock(&rio500_mutex);
+	if (rio->present) {
+		dev_info(&intf->dev, "Second USB Rio at address %d refused\n", dev->devnum);
+		retval = -EBUSY;
+		goto bail_out;
+	} else {
+		dev_info(&intf->dev, "USB Rio found at address %d\n", dev->devnum);
+	}
 
 	retval = usb_register_dev(intf, &usb_rio_class);
 	if (retval) {
 		dev_err(&dev->dev,
 			"Not able to get a minor for this device.\n");
-		return -ENOMEM;
+		retval = -ENOMEM;
+		goto bail_out;
 	}
 
 	rio->rio_dev = dev;
@@ -464,7 +472,8 @@ static int probe_rio(struct usb_interface *intf,
 		dev_err(&dev->dev,
 			"probe_rio: Not enough memory for the output buffer\n");
 		usb_deregister_dev(intf, &usb_rio_class);
-		return -ENOMEM;
+		retval = -ENOMEM;
+		goto bail_out;
 	}
 	dev_dbg(&intf->dev, "obuf address:%p\n", rio->obuf);
 
@@ -473,7 +482,8 @@ static int probe_rio(struct usb_interface *intf,
 			"probe_rio: Not enough memory for the input buffer\n");
 		usb_deregister_dev(intf, &usb_rio_class);
 		kfree(rio->obuf);
-		return -ENOMEM;
+		retval = -ENOMEM;
+		goto bail_out;
 	}
 	dev_dbg(&intf->dev, "ibuf address:%p\n", rio->ibuf);
 
@@ -481,8 +491,10 @@ static int probe_rio(struct usb_interface *intf,
 
 	usb_set_intfdata (intf, rio);
 	rio->present = 1;
+bail_out:
+	mutex_unlock(&rio500_mutex);
 
-	return 0;
+	return retval;
 }
 
 static void disconnect_rio(struct usb_interface *intf)
-- 
2.16.4

