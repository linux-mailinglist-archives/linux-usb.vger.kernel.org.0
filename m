Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC3F187C8
	for <lists+linux-usb@lfdr.de>; Thu,  9 May 2019 11:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbfEIJbg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 May 2019 05:31:36 -0400
Received: from mx2.suse.de ([195.135.220.15]:59316 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726428AbfEIJbf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 May 2019 05:31:35 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id E4ECDAB6D;
        Thu,  9 May 2019 09:31:33 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     miquel@df.uba.ar, gregKH@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv3 3/4] rio500: simplify locking
Date:   Thu,  9 May 2019 11:31:00 +0200
Message-Id: <20190509093101.11450-3-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190509093101.11450-1-oneukum@suse.com>
References: <20190509093101.11450-1-oneukum@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Admitting that there can be only one device allows us
to drop any pretense about locking one device or
a table of devices.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/misc/rio500.c | 43 ++++++++++++++++---------------------------
 1 file changed, 16 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/misc/rio500.c b/drivers/usb/misc/rio500.c
index a1832c195b5f..a0574f54738f 100644
--- a/drivers/usb/misc/rio500.c
+++ b/drivers/usb/misc/rio500.c
@@ -51,7 +51,6 @@ struct rio_usb_data {
         char *obuf, *ibuf;              /* transfer buffers */
         char bulk_in_ep, bulk_out_ep;   /* Endpoint assignments */
         wait_queue_head_t wait_q;       /* for timeouts */
-	struct mutex lock;          /* general race avoidance */
 };
 
 static DEFINE_MUTEX(rio500_mutex);
@@ -63,10 +62,8 @@ static int open_rio(struct inode *inode, struct file *file)
 
 	/* against disconnect() */
 	mutex_lock(&rio500_mutex);
-	mutex_lock(&(rio->lock));
 
 	if (rio->isopen || !rio->present) {
-		mutex_unlock(&(rio->lock));
 		mutex_unlock(&rio500_mutex);
 		return -EBUSY;
 	}
@@ -74,7 +71,6 @@ static int open_rio(struct inode *inode, struct file *file)
 
 	init_waitqueue_head(&rio->wait_q);
 
-	mutex_unlock(&(rio->lock));
 
 	dev_info(&rio->rio_dev->dev, "Rio opened.\n");
 	mutex_unlock(&rio500_mutex);
@@ -88,7 +84,6 @@ static int close_rio(struct inode *inode, struct file *file)
 
 	/* against disconnect() */
 	mutex_lock(&rio500_mutex);
-	mutex_lock(&(rio->lock));
 
 	rio->isopen = 0;
 	if (!rio->present) {
@@ -100,7 +95,6 @@ static int close_rio(struct inode *inode, struct file *file)
 	} else {
 		dev_info(&rio->rio_dev->dev, "Rio closed.\n");
 	}
-	mutex_unlock(&(rio->lock));
 	mutex_unlock(&rio500_mutex);
 	return 0;
 }
@@ -115,7 +109,7 @@ static long ioctl_rio(struct file *file, unsigned int cmd, unsigned long arg)
 	int retries;
 	int retval=0;
 
-	mutex_lock(&(rio->lock));
+	mutex_lock(&rio500_mutex);
         /* Sanity check to make sure rio is connected, powered, etc */
         if (rio->present == 0 || rio->rio_dev == NULL) {
 		retval = -ENODEV;
@@ -259,7 +253,7 @@ static long ioctl_rio(struct file *file, unsigned int cmd, unsigned long arg)
 
 
 err_out:
-	mutex_unlock(&(rio->lock));
+	mutex_unlock(&rio500_mutex);
 	return retval;
 }
 
@@ -279,12 +273,12 @@ write_rio(struct file *file, const char __user *buffer,
 	int errn = 0;
 	int intr;
 
-	intr = mutex_lock_interruptible(&(rio->lock));
+	intr = mutex_lock_interruptible(&rio500_mutex);
 	if (intr)
 		return -EINTR;
         /* Sanity check to make sure rio is connected, powered, etc */
         if (rio->present == 0 || rio->rio_dev == NULL) {
-		mutex_unlock(&(rio->lock));
+		mutex_unlock(&rio500_mutex);
 		return -ENODEV;
 	}
 
@@ -307,7 +301,7 @@ write_rio(struct file *file, const char __user *buffer,
 				goto error;
 			}
 			if (signal_pending(current)) {
-				mutex_unlock(&(rio->lock));
+				mutex_unlock(&rio500_mutex);
 				return bytes_written ? bytes_written : -EINTR;
 			}
 
@@ -345,12 +339,12 @@ write_rio(struct file *file, const char __user *buffer,
 		buffer += copy_size;
 	} while (count > 0);
 
-	mutex_unlock(&(rio->lock));
+	mutex_unlock(&rio500_mutex);
 
 	return bytes_written ? bytes_written : -EIO;
 
 error:
-	mutex_unlock(&(rio->lock));
+	mutex_unlock(&rio500_mutex);
 	return errn;
 }
 
@@ -367,12 +361,12 @@ read_rio(struct file *file, char __user *buffer, size_t count, loff_t * ppos)
 	char *ibuf;
 	int intr;
 
-	intr = mutex_lock_interruptible(&(rio->lock));
+	intr = mutex_lock_interruptible(&rio500_mutex);
 	if (intr)
 		return -EINTR;
 	/* Sanity check to make sure rio is connected, powered, etc */
         if (rio->present == 0 || rio->rio_dev == NULL) {
-		mutex_unlock(&(rio->lock));
+		mutex_unlock(&rio500_mutex);
 		return -ENODEV;
 	}
 
@@ -383,11 +377,11 @@ read_rio(struct file *file, char __user *buffer, size_t count, loff_t * ppos)
 
 	while (count > 0) {
 		if (signal_pending(current)) {
-			mutex_unlock(&(rio->lock));
+			mutex_unlock(&rio500_mutex);
 			return read_count ? read_count : -EINTR;
 		}
 		if (!rio->rio_dev) {
-			mutex_unlock(&(rio->lock));
+			mutex_unlock(&rio500_mutex);
 			return -ENODEV;
 		}
 		this_read = (count >= IBUF_SIZE) ? IBUF_SIZE : count;
@@ -405,7 +399,7 @@ read_rio(struct file *file, char __user *buffer, size_t count, loff_t * ppos)
 			count = this_read = partial;
 		} else if (result == -ETIMEDOUT || result == 15) {	/* FIXME: 15 ??? */
 			if (!maxretry--) {
-				mutex_unlock(&(rio->lock));
+				mutex_unlock(&rio500_mutex);
 				dev_err(&rio->rio_dev->dev,
 					"read_rio: maxretry timeout\n");
 				return -ETIME;
@@ -415,19 +409,19 @@ read_rio(struct file *file, char __user *buffer, size_t count, loff_t * ppos)
 			finish_wait(&rio->wait_q, &wait);
 			continue;
 		} else if (result != -EREMOTEIO) {
-			mutex_unlock(&(rio->lock));
+			mutex_unlock(&rio500_mutex);
 			dev_err(&rio->rio_dev->dev,
 				"Read Whoops - result:%d partial:%u this_read:%u\n",
 				result, partial, this_read);
 			return -EIO;
 		} else {
-			mutex_unlock(&(rio->lock));
+			mutex_unlock(&rio500_mutex);
 			return (0);
 		}
 
 		if (this_read) {
 			if (copy_to_user(buffer, ibuf, this_read)) {
-				mutex_unlock(&(rio->lock));
+				mutex_unlock(&rio500_mutex);
 				return -EFAULT;
 			}
 			count -= this_read;
@@ -435,7 +429,7 @@ read_rio(struct file *file, char __user *buffer, size_t count, loff_t * ppos)
 			buffer += this_read;
 		}
 	}
-	mutex_unlock(&(rio->lock));
+	mutex_unlock(&rio500_mutex);
 	return read_count;
 }
 
@@ -500,8 +494,6 @@ static int probe_rio(struct usb_interface *intf,
 	}
 	dev_dbg(&intf->dev, "ibuf address:%p\n", rio->ibuf);
 
-	mutex_init(&(rio->lock));
-
 	usb_set_intfdata (intf, rio);
 	rio->present = 1;
 bail_out:
@@ -519,12 +511,10 @@ static void disconnect_rio(struct usb_interface *intf)
 	if (rio) {
 		usb_deregister_dev(intf, &usb_rio_class);
 
-		mutex_lock(&(rio->lock));
 		if (rio->isopen) {
 			rio->isopen = 0;
 			/* better let it finish - the release will do whats needed */
 			rio->rio_dev = NULL;
-			mutex_unlock(&(rio->lock));
 			mutex_unlock(&rio500_mutex);
 			return;
 		}
@@ -536,7 +526,6 @@ static void disconnect_rio(struct usb_interface *intf)
 		dev_info(&intf->dev, "USB Rio disconnected.\n");
 
 		rio->present = 0;
-		mutex_unlock(&(rio->lock));
 	}
 	mutex_unlock(&rio500_mutex);
 }
-- 
2.16.4

