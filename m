Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E708B27AFE1
	for <lists+linux-usb@lfdr.de>; Mon, 28 Sep 2020 16:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgI1OSH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 10:18:07 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:53010 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbgI1OSG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Sep 2020 10:18:06 -0400
Received: from fsav101.sakura.ne.jp (fsav101.sakura.ne.jp [27.133.134.228])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 08SEI4Wh050365;
        Mon, 28 Sep 2020 23:18:04 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav101.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav101.sakura.ne.jp);
 Mon, 28 Sep 2020 23:18:04 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav101.sakura.ne.jp)
Received: from localhost.localdomain (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 08SEHx39050281
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Mon, 28 Sep 2020 23:18:04 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To:     Greg KH <greg@kroah.com>, Oliver Neukum <oneukum@suse.com>
Cc:     andreyknvl@google.com, arnd@arndb.de, bjorn@mork.no,
        colin.king@canonical.com, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu,
        syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com,
        syzkaller-bugs@googlegroups.com, torvalds@linux-foundation.org,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH (repost)] USB: cdc-wdm: Make wdm_flush() interruptible and add wdm_fsync().
Date:   Mon, 28 Sep 2020 23:17:55 +0900
Message-Id: <20200928141755.3476-1-penguin-kernel@I-love.SAKURA.ne.jp>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <b27841ab-a88c-13e2-a66f-6df7af1f46b4@i-love.sakura.ne.jp>
References: <b27841ab-a88c-13e2-a66f-6df7af1f46b4@i-love.sakura.ne.jp>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Oliver Neukum <oneukum@suse.com>

syzbot is reporting hung task at wdm_flush() [1], for there is a circular
dependency that wdm_flush() from flip_close() for /dev/cdc-wdm0 forever
waits for /dev/raw-gadget to be closed while close() for /dev/raw-gadget
cannot be called unless close() for /dev/cdc-wdm0 completes.

Tetsuo Handa considered that such circular dependency is an usage error [2]
which corresponds to an unresponding broken hardware [3]. But Alan Stern
responded that we should be prepared for such hardware [4]. Therefore,
this patch changes wdm_flush() to use wait_event_interruptible_timeout()
which gives up after 30 seconds, for hardware that remains silent must be
ignored. The 30 seconds are coming out of thin air.

Changing wait_event() to wait_event_interruptible_timeout() makes error
reporting from close() syscall less reliable. To compensate it, this patch
also implements wdm_fsync() which does not use timeout. Those who want to
be very sure that data has gone out to the device are now advised to call
fsync(), with a caveat that fsync() can return -EINVAL when running on
older kernels which do not implement wdm_fsync().

This patch also fixes three more problems (listed below) found during
exhaustive discussion and testing.

  Since multiple threads can concurrently call wdm_write()/wdm_flush(),
  we need to use wake_up_all() whenever clearing WDM_IN_USE in order to
  make sure that all waiters are woken up. Also, error reporting needs
  to use fetch-and-clear approach in order not to report same error for
  multiple times.

  Since wdm_flush() checks WDM_DISCONNECTING, wdm_write() should as well
  check WDM_DISCONNECTING.

  In wdm_flush(), since locks are not held, it is not safe to dereference
  desc->intf after checking that WDM_DISCONNECTING is not set [5]. Thus,
  remove dev_err() from wdm_flush().

[1] https://syzkaller.appspot.com/bug?id=e7b761593b23eb50855b9ea31e3be5472b711186
[2] https://lkml.kernel.org/r/27b7545e-8f41-10b8-7c02-e35a08eb1611@i-love.sakura.ne.jp
[3] https://lkml.kernel.org/r/79ba410f-e0ef-2465-b94f-6b9a4a82adf5@i-love.sakura.ne.jp
[4] https://lkml.kernel.org/r/20200530011040.GB12419@rowland.harvard.edu
[5] https://lkml.kernel.org/r/c85331fc-874c-6e46-a77f-0ef1dc075308@i-love.sakura.ne.jp

Reported-by: syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>
Co-developed-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Oliver Neukum <oneukum@suse.com>
Cc: Alan Stern <stern@rowland.harvard.edu>
---
 drivers/usb/class/cdc-wdm.c | 72 ++++++++++++++++++++++++++++---------
 1 file changed, 55 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index 7f5de956a2fc..02d0cfd23bb2 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -58,6 +58,9 @@ MODULE_DEVICE_TABLE (usb, wdm_ids);
 
 #define WDM_MAX			16
 
+/* we cannot wait forever at flush() */
+#define WDM_FLUSH_TIMEOUT	(30 * HZ)
+
 /* CDC-WMC r1.1 requires wMaxCommand to be "at least 256 decimal (0x100)" */
 #define WDM_DEFAULT_BUFSIZE	256
 
@@ -151,7 +154,7 @@ static void wdm_out_callback(struct urb *urb)
 	kfree(desc->outbuf);
 	desc->outbuf = NULL;
 	clear_bit(WDM_IN_USE, &desc->flags);
-	wake_up(&desc->wait);
+	wake_up_all(&desc->wait);
 }
 
 static void wdm_in_callback(struct urb *urb)
@@ -393,6 +396,9 @@ static ssize_t wdm_write
 	if (test_bit(WDM_RESETTING, &desc->flags))
 		r = -EIO;
 
+	if (test_bit(WDM_DISCONNECTING, &desc->flags))
+		r = -ENODEV;
+
 	if (r < 0) {
 		rv = r;
 		goto out_free_mem_pm;
@@ -424,6 +430,7 @@ static ssize_t wdm_write
 	if (rv < 0) {
 		desc->outbuf = NULL;
 		clear_bit(WDM_IN_USE, &desc->flags);
+		wake_up_all(&desc->wait); /* for wdm_wait_for_response() */
 		dev_err(&desc->intf->dev, "Tx URB error: %d\n", rv);
 		rv = usb_translate_errors(rv);
 		goto out_free_mem_pm;
@@ -583,28 +590,58 @@ static ssize_t wdm_read
 	return rv;
 }
 
-static int wdm_flush(struct file *file, fl_owner_t id)
+static int wdm_wait_for_response(struct file *file, long timeout)
 {
 	struct wdm_device *desc = file->private_data;
+	long rv; /* Use long here because (int) MAX_SCHEDULE_TIMEOUT < 0. */
+
+	/*
+	 * Needs both flags. We cannot do with one because resetting it would
+	 * cause a race with write() yet we need to signal a disconnect.
+	 */
+	rv = wait_event_interruptible_timeout(desc->wait,
+			      !test_bit(WDM_IN_USE, &desc->flags) ||
+			      test_bit(WDM_DISCONNECTING, &desc->flags),
+			      timeout);
 
-	wait_event(desc->wait,
-			/*
-			 * needs both flags. We cannot do with one
-			 * because resetting it would cause a race
-			 * with write() yet we need to signal
-			 * a disconnect
-			 */
-			!test_bit(WDM_IN_USE, &desc->flags) ||
-			test_bit(WDM_DISCONNECTING, &desc->flags));
-
-	/* cannot dereference desc->intf if WDM_DISCONNECTING */
+	/*
+	 * To report the correct error. This is best effort.
+	 * We are inevitably racing with the hardware.
+	 */
 	if (test_bit(WDM_DISCONNECTING, &desc->flags))
 		return -ENODEV;
-	if (desc->werr < 0)
-		dev_err(&desc->intf->dev, "Error in flush path: %d\n",
-			desc->werr);
+	if (!rv)
+		return -EIO;
+	if (rv < 0)
+		return -EINTR;
+
+	spin_lock_irq(&desc->iuspin);
+	rv = desc->werr;
+	desc->werr = 0;
+	spin_unlock_irq(&desc->iuspin);
+
+	return usb_translate_errors(rv);
+
+}
+
+/*
+ * You need to send a signal when you react to malicious or defective hardware.
+ * Also, don't abort when fsync() returned -EINVAL, for older kernels which do
+ * not implement wdm_flush() will return -EINVAL.
+ */
+static int wdm_fsync(struct file *file, loff_t start, loff_t end, int datasync)
+{
+	return wdm_wait_for_response(file, MAX_SCHEDULE_TIMEOUT);
+}
 
-	return usb_translate_errors(desc->werr);
+/*
+ * Same with wdm_fsync(), except it uses finite timeout in order to react to
+ * malicious or defective hardware which ceased communication after close() was
+ * implicitly called due to process termination.
+ */
+static int wdm_flush(struct file *file, fl_owner_t id)
+{
+	return wdm_wait_for_response(file, WDM_FLUSH_TIMEOUT);
 }
 
 static __poll_t wdm_poll(struct file *file, struct poll_table_struct *wait)
@@ -729,6 +766,7 @@ static const struct file_operations wdm_fops = {
 	.owner =	THIS_MODULE,
 	.read =		wdm_read,
 	.write =	wdm_write,
+	.fsync =	wdm_fsync,
 	.open =		wdm_open,
 	.flush =	wdm_flush,
 	.release =	wdm_release,
-- 
2.25.1

