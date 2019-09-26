Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5879BEE20
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2019 11:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727670AbfIZJMr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Sep 2019 05:12:47 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38338 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbfIZJMr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Sep 2019 05:12:47 -0400
Received: by mail-lf1-f67.google.com with SMTP id u28so1125452lfc.5
        for <linux-usb@vger.kernel.org>; Thu, 26 Sep 2019 02:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E6Ii7hCmgGJll6q9WG6b8f58XKzO8877IKSX+QpN4qo=;
        b=YI3wutf/ElDRx7XsXYi1NP8BhzFETZjFGBLDIQLm38+BbPY26+I/xvVl4Kf2KG0wc5
         dq6wB8l0tMVH98FJU/oJr7+mCBvmXb5LQIVMepDoMnA9QrnK2bLP/nBGIDyN7qFpvsQg
         lFjWaHbHf+WGCvSjHMQJbZDIY5XVTKbkv6xSZhlxvRqRDfj7+9iHnWXNtOn57PwF394Y
         7S8DE69/l43fW0jJx64IIw252+c4m/1cSuo1+i1fMYTXlXOomK9o1iXDmOMewKrhyrpa
         VrWZVfXnLNSK0wVbyrqrDFIhAEc0l1c35hiUV39zWa98hNSLPSTqMcBl/NT6LS8vLoIC
         QnJg==
X-Gm-Message-State: APjAAAVLfwckmUe06azdqhK1JNi2nVXvC02xn+5cIRxJ82LOQhfvGFq/
        10PoTcEemdZWOoCuDus720c=
X-Google-Smtp-Source: APXvYqxIDREq4E80Ti66gvr0+gA6T790Z2yvXkLHsAgcATwR+2W94XAqfOo6dZrfVRsE4UoLsCB7Xw==
X-Received: by 2002:a19:6001:: with SMTP id u1mr1529141lfb.50.1569489165002;
        Thu, 26 Sep 2019 02:12:45 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id r22sm377634ljr.43.2019.09.26.02.12.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 02:12:43 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iDPpR-0006Qb-U9; Thu, 26 Sep 2019 11:12:49 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/4] USB: usblcd: drop redundant lcd mutex
Date:   Thu, 26 Sep 2019 11:12:22 +0200
Message-Id: <20190926091228.24634-4-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190926091228.24634-1-johan@kernel.org>
References: <20190926091228.24634-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop the redundant lcd mutex introduced by commit 925ce689bb31 ("USB:
autoconvert trivial BKL users to private mutex") which replaced an
earlier BKL use.

The lock serialised calls to open() against other open() and a custom
ioctl() returning the bcdDevice (sic!), but neither is needed.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/usblcd.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/usb/misc/usblcd.c b/drivers/usb/misc/usblcd.c
index b898650a5570..732eb1f81368 100644
--- a/drivers/usb/misc/usblcd.c
+++ b/drivers/usb/misc/usblcd.c
@@ -30,7 +30,6 @@
 #define IOCTL_GET_DRV_VERSION	2
 
 
-static DEFINE_MUTEX(lcd_mutex);
 static const struct usb_device_id id_table[] = {
 	{ .idVendor = 0x10D2, .match_flags = USB_DEVICE_ID_MATCH_VENDOR, },
 	{ },
@@ -81,12 +80,10 @@ static int lcd_open(struct inode *inode, struct file *file)
 	struct usb_interface *interface;
 	int subminor, r;
 
-	mutex_lock(&lcd_mutex);
 	subminor = iminor(inode);
 
 	interface = usb_find_interface(&lcd_driver, subminor);
 	if (!interface) {
-		mutex_unlock(&lcd_mutex);
 		printk(KERN_ERR "USBLCD: %s - error, can't find device for minor %d\n",
 		       __func__, subminor);
 		return -ENODEV;
@@ -101,13 +98,11 @@ static int lcd_open(struct inode *inode, struct file *file)
 	r = usb_autopm_get_interface(interface);
 	if (r < 0) {
 		kref_put(&dev->kref, lcd_delete);
-		mutex_unlock(&lcd_mutex);
 		return r;
 	}
 
 	/* save our object in the file's private structure */
 	file->private_data = dev;
-	mutex_unlock(&lcd_mutex);
 
 	return 0;
 }
@@ -176,14 +171,12 @@ static long lcd_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 	switch (cmd) {
 	case IOCTL_GET_HARD_VERSION:
-		mutex_lock(&lcd_mutex);
 		bcdDevice = le16_to_cpu((dev->udev)->descriptor.bcdDevice);
 		sprintf(buf, "%1d%1d.%1d%1d",
 			(bcdDevice & 0xF000)>>12,
 			(bcdDevice & 0xF00)>>8,
 			(bcdDevice & 0xF0)>>4,
 			(bcdDevice & 0xF));
-		mutex_unlock(&lcd_mutex);
 		if (copy_to_user((void __user *)arg, buf, strlen(buf)) != 0)
 			return -EFAULT;
 		break;
-- 
2.23.0

