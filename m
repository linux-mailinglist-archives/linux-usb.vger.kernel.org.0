Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C721C2774E3
	for <lists+linux-usb@lfdr.de>; Thu, 24 Sep 2020 17:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728357AbgIXPJs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 11:09:48 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:59829 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728285AbgIXPJs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 11:09:48 -0400
Received: from fsav302.sakura.ne.jp (fsav302.sakura.ne.jp [153.120.85.133])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 08OF9iqm095236;
        Fri, 25 Sep 2020 00:09:44 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav302.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp);
 Fri, 25 Sep 2020 00:09:44 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 08OF9h7I095232
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Fri, 25 Sep 2020 00:09:44 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: [PATCH] USB: cdc-wdm: Make wdm_flush() interruptible and add
 wdm_fsync().
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To:     Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Mork <bjorn@mork.no>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        USB list <linux-usb@vger.kernel.org>,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <1590408381.2838.4.camel@suse.com>
 <CAAeHK+ww0YLUKGjQF5KfzoUUsdfLJdv5guUXRq4q46VfPiQubQ@mail.gmail.com>
 <27b7545e-8f41-10b8-7c02-e35a08eb1611@i-love.sakura.ne.jp>
 <CAAeHK+ww0u0G94z_Y7VXLCVTQVZ9thO0q69n+Fj3jKT6MtpPng@mail.gmail.com>
 <20200528194057.GA21709@rowland.harvard.edu>
 <CAAeHK+ySAnU03cvg1=+yHh0YK1UFO4mrv-N9FcDDMt_0AfGZSQ@mail.gmail.com>
 <20200528205807.GB21709@rowland.harvard.edu>
 <1590852311.14886.3.camel@suse.com>
 <20200530154728.GB29298@rowland.harvard.edu>
 <0c43caf8-1135-1d38-cb57-9c0f84c4394d@i-love.sakura.ne.jp>
 <254939d4-f3a1-8c7e-94e5-9862c02774fa@i-love.sakura.ne.jp>
 <CAAeHK+w+wBNksK_wpczad3AU4oLQRsjL_5G8p1R55Zh_FLhprg@mail.gmail.com>
 <c85331fc-874c-6e46-a77f-0ef1dc075308@i-love.sakura.ne.jp>
 <b347b882-a986-24c6-2b37-0b1a092931b9@i-love.sakura.ne.jp>
 <1593674666.3609.3.camel@suse.com>
 <f6de3d3a-6825-1904-65f4-8d96594a9846@i-love.sakura.ne.jp>
 <c7e9ab26-7a6b-7adb-0208-cf946a97b7d8@i-love.sakura.ne.jp>
Message-ID: <b27841ab-a88c-13e2-a66f-6df7af1f46b4@i-love.sakura.ne.jp>
Date:   Fri, 25 Sep 2020 00:09:41 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c7e9ab26-7a6b-7adb-0208-cf946a97b7d8@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Based on https://lkml.kernel.org/r/20200923092136.14824-1-oneukum@suse.com from Oliver Neukum <oneukum@suse.com>:

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
Signed-off-by: Oliver Neukum <oneukum@suse.com>
Debugged-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
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

