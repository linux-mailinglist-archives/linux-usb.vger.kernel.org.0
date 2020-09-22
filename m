Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96FC8274099
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 13:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgIVLVw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 07:21:52 -0400
Received: from mx2.suse.de ([195.135.220.15]:37326 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbgIVLVv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 07:21:51 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600773710;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc; bh=PfmCcgEWFUe5gSUt+rUCF5D83LJQw2gbytbY2DB1JFg=;
        b=tS/6ob5FZmRoMzJifhgDI1mgCloMw78fCMQ+rzdEqh8uK9wSjSLLMaRQCU4wpnxOXQPBqG
        R99PJiwrgE/08EyWgKzm0ooq9vXNh+Vm6HM/bZJ1KCRodL+TRqZpBuIXGs+4x19cOIG+gM
        WPCsQRmInHoTmAsTQAWAvgSa/nsdvSA=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C0815AD3C;
        Tue, 22 Sep 2020 11:22:26 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Subject: [RFC] fixes for hangs and error reporting in CDC_WDM
Date:   Tue, 22 Sep 2020 13:21:19 +0200
Message-Id: <20200922112126.16919-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Stress testing has shown that CDC-WDM has some issues with hangs
and error reporting

1. wakeups are not correctly handled in multhreaded environments
2. unresponsive hardware is not handled
3. errors are not correctly reported. This needs flush() to be
implemented.

This version makes wdm_flush() use interruptible sleep.

For easier review all squashed together:

--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -58,6 +58,9 @@ MODULE_DEVICE_TABLE (usb, wdm_ids);
 
 #define WDM_MAX                        16
 
+/* flush() is uninterruptible, but we cannot wait forever */
+#define WDM_FLUSH_TIMEOUT      (30 * HZ)
+
 /* CDC-WMC r1.1 requires wMaxCommand to be "at least 256 decimal (0x100)" */
 #define WDM_DEFAULT_BUFSIZE    256
 
@@ -151,7 +154,7 @@ static void wdm_out_callback(struct urb *urb)
        kfree(desc->outbuf);
        desc->outbuf = NULL;
        clear_bit(WDM_IN_USE, &desc->flags);
-       wake_up(&desc->wait);
+       wake_up_all(&desc->wait);
 }
 
 static void wdm_in_callback(struct urb *urb)
@@ -393,6 +396,9 @@ static ssize_t wdm_write
        if (test_bit(WDM_RESETTING, &desc->flags))
                r = -EIO;
 
+       if (test_bit(WDM_DISCONNECTING, &desc->flags))
+               r = -ENODEV;
+
        if (r < 0) {
                rv = r;
                goto out_free_mem_pm;
@@ -424,6 +430,7 @@ static ssize_t wdm_write
        if (rv < 0) {
                desc->outbuf = NULL;
                clear_bit(WDM_IN_USE, &desc->flags);
+               wake_up_all(&desc->wait); /* for flush() */
                dev_err(&desc->intf->dev, "Tx URB error: %d\n", rv);
                rv = usb_translate_errors(rv);
                goto out_free_mem_pm;
@@ -583,11 +590,39 @@ static ssize_t wdm_read
        return rv;
 }
 
+/*
+ * The difference to flush is that we wait forever. If you don't like
+ * that behavior, you need to send a signal.
+ */
+
+static int wdm_fsync(struct file *file, loff_t start, loff_t end, int datasync)
+{
+       struct wdm_device *desc = file->private_data;
+       int rv;
+
+       rv = wait_event_interruptible(desc->wait,
+                       !test_bit(WDM_IN_USE, &desc->flags) ||
+                       test_bit(WDM_DISCONNECTING, &desc->flags));
+
+       if (test_bit(WDM_DISCONNECTING, &desc->flags))
+               return -ENODEV;
+       if (rv < 0)
+               return -EINTR;
+
+       spin_lock_irq(&desc->iuspin);
+       rv = desc->werr;
+       desc->werr = 0;
+       spin_unlock_irq(&desc->iuspin);
+
+       return usb_translate_errors(rv);
+}
+
 static int wdm_flush(struct file *file, fl_owner_t id)
 {
        struct wdm_device *desc = file->private_data;
+       int rv;
 
-       wait_event(desc->wait,
+       rv = wait_event_interruptible_timeout(desc->wait,
                        /*
                         * needs both flags. We cannot do with one
                         * because resetting it would cause a race
@@ -595,16 +630,27 @@ static int wdm_flush(struct file *file, fl_owner_t id)
                         * a disconnect
                         */
                        !test_bit(WDM_IN_USE, &desc->flags) ||
-                       test_bit(WDM_DISCONNECTING, &desc->flags));
+                       test_bit(WDM_DISCONNECTING, &desc->flags),
+                       WDM_FLUSH_TIMEOUT);
 
-       /* cannot dereference desc->intf if WDM_DISCONNECTING */
+       /*
+        * to report the correct error.
+        * This is best effort
+        * We are inevitably racing with the hardware.
+        */
        if (test_bit(WDM_DISCONNECTING, &desc->flags))
                return -ENODEV;
-       if (desc->werr < 0)
-               dev_err(&desc->intf->dev, "Error in flush path: %d\n",
-                       desc->werr);
+       if (!rv)
+               return -EIO;
+       if (rv < 0)
+               return -EINTR;
+
+       spin_lock_irq(&desc->iuspin);
+       rv = desc->werr;
+       desc->werr = 0;
+       spin_unlock_irq(&desc->iuspin);
 
-       return usb_translate_errors(desc->werr);
+       return usb_translate_errors(rv);
 }
 
 static __poll_t wdm_poll(struct file *file, struct poll_table_struct *wait)
@@ -729,6 +775,7 @@ static const struct file_operations wdm_fops = {
        .owner =        THIS_MODULE,
        .read =         wdm_read,
        .write =        wdm_write,
+       .fsync =        wdm_fsync,
        .open =         wdm_open,
        .flush =        wdm_flush,
        .release =      wdm_release,


