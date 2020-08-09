Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D20CC23FF29
	for <lists+linux-usb@lfdr.de>; Sun,  9 Aug 2020 18:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgHIQNB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Aug 2020 12:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbgHIQM6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Aug 2020 12:12:58 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3FBFC061786
        for <linux-usb@vger.kernel.org>; Sun,  9 Aug 2020 09:12:56 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id g6so7039170ljn.11
        for <linux-usb@vger.kernel.org>; Sun, 09 Aug 2020 09:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndmsystems-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UEpCtsZEvZZgbvhsQBYBWkiCjgyox61Emg/c1y2ZN3I=;
        b=d43EQWhnMIUnO0ayF/xBZT66+CQu7CKKb9TlQuBYJY4hAWz5E8yZRWDTEdRQnG2kqu
         L61G1YrcApisjNwWDUvL4ubvfMXQrCIB5FxuoJU/2qtM5OuABh8ga92lCA7AoPtaKYcK
         5mt9H91rLaEnDHSTHv6nSqQ8iFr2UNaToaQckqZWfqkLttr+uy6icA5qVu2f62rE4kCf
         H9k6PJjAP4YHc0P7f3sXBiUv/8J4KEm5GfWiLGUpHDU45ePXR2jZ6S+UhLVhPHoHSJk5
         9oP0jZItKO3v8hjrcF4KROr+5jFbL6fRtl0TjGcufpp7Kh8mYSRsiXAbsUkMLu9p9VWU
         dXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UEpCtsZEvZZgbvhsQBYBWkiCjgyox61Emg/c1y2ZN3I=;
        b=TDNotpo2bi+3D9roXGFybspZfGT5iPJgD+Im9V2nsuwEBaBRrYydiGz/WQkdom3f4Q
         YmMwaEtnCU4v7LSfEUfamjXh/hZavSU7ck5tb/M8GdDsjhrcxiDV9w2MpSf4txePSnAT
         pDuzH7rYVpqDPfVoZRtytW/hU4J+N7ZvpybeM95zjLV7Fc/VCsZIW7m3SPkAvYrR4B3f
         SEt4R3fobQDIB1Agao7g2jWj5FNuTqmsR76K7m1aaioqyk2xOK7ee7oPJdli/6jc0MsC
         7apyhmnhY2F6OtC4qs1hGUCw+S2oiFoZ0eAtmYwJrTmRd9nYoEuiwj3wTkVo+/MWqDdh
         0TfA==
X-Gm-Message-State: AOAM530NvPeq/rW28nAQ+jZXTy9OtnlAWk8ppSnIYyoY849CQQntEUx4
        wjh6mAyewfWtTRECaIPt22v92A==
X-Google-Smtp-Source: ABdhPJxXNK/GX8iSF0+tUBzVrcJpI1Es27dIWpe2bDfWKcMa57w6DbPTwf60cmVZckN83ZjxqYj20w==
X-Received: by 2002:a2e:9c0b:: with SMTP id s11mr9170576lji.117.1596989571429;
        Sun, 09 Aug 2020 09:12:51 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:4a:1645::2])
        by smtp.googlemail.com with ESMTPSA id r14sm9066069lfe.29.2020.08.09.09.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 09:12:50 -0700 (PDT)
From:   Sergey Korolev <s.korolev@ndmsystems.com>
Cc:     s.korolev@ndmsystems.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Rob Gill <rrobgill@protonmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Johan Hovold <johan@kernel.org>,
        Nishad Kamdar <nishadkamdar@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] USB: core: remove polling for /sys/kernel/debug/usb/devices
Date:   Sun,  9 Aug 2020 19:12:30 +0300
Message-Id: <20200809161233.13135-1-s.korolev@ndmsystems.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The latest reference to usbfs_conn_disc_event() removed in
commit fb28d58b72aa ("USB: remove CONFIG_USB_DEVICEFS")
in 2012 and now a user poll() waits infinitely for content changes.

Signed-off-by: Sergey Korolev <s.korolev@ndmsystems.com>
---
 drivers/usb/core/devices.c | 41 --------------------------------------
 drivers/usb/core/usb.h     |  1 -
 2 files changed, 42 deletions(-)

diff --git a/drivers/usb/core/devices.c b/drivers/usb/core/devices.c
index 696b2b692b83..1ef2de6e375a 100644
--- a/drivers/usb/core/devices.c
+++ b/drivers/usb/core/devices.c
@@ -39,7 +39,6 @@
 #include <linux/fs.h>
 #include <linux/mm.h>
 #include <linux/gfp.h>
-#include <linux/poll.h>
 #include <linux/usb.h>
 #include <linux/usbdevice_fs.h>
 #include <linux/usb/hcd.h>
@@ -97,22 +96,6 @@ static const char format_endpt[] =
 /* E:  Ad=xx(s) Atr=xx(ssss) MxPS=dddd Ivl=D?s */
   "E:  Ad=%02x(%c) Atr=%02x(%-4s) MxPS=%4d Ivl=%d%cs\n";
 
-/*
- * Wait for an connect/disconnect event to happen. We initialize
- * the event counter with an odd number, and each event will increment
- * the event counter by two, so it will always _stay_ odd. That means
- * that it will never be zero, so "event 0" will never match a current
- * event, and thus 'poll' will always trigger as readable for the first
- * time it gets called.
- */
-static struct device_connect_event {
-	atomic_t count;
-	wait_queue_head_t wait;
-} device_event = {
-	.count = ATOMIC_INIT(1),
-	.wait = __WAIT_QUEUE_HEAD_INITIALIZER(device_event.wait)
-};
-
 struct class_info {
 	int class;
 	char *class_name;
@@ -146,12 +129,6 @@ static const struct class_info clas_info[] = {
 
 /*****************************************************************/
 
-void usbfs_conn_disc_event(void)
-{
-	atomic_add(2, &device_event.count);
-	wake_up(&device_event.wait);
-}
-
 static const char *class_decode(const int class)
 {
 	int ix;
@@ -623,25 +600,7 @@ static ssize_t usb_device_read(struct file *file, char __user *buf,
 	return total_written;
 }
 
-/* Kernel lock for "lastev" protection */
-static __poll_t usb_device_poll(struct file *file,
-				    struct poll_table_struct *wait)
-{
-	unsigned int event_count;
-
-	poll_wait(file, &device_event.wait, wait);
-
-	event_count = atomic_read(&device_event.count);
-	if (file->f_version != event_count) {
-		file->f_version = event_count;
-		return EPOLLIN | EPOLLRDNORM;
-	}
-
-	return 0;
-}
-
 const struct file_operations usbfs_devices_fops = {
 	.llseek =	no_seek_end_llseek,
 	.read =		usb_device_read,
-	.poll =		usb_device_poll,
 };
diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
index 98e7d1ee63dc..c893f54a3420 100644
--- a/drivers/usb/core/usb.h
+++ b/drivers/usb/core/usb.h
@@ -191,7 +191,6 @@ extern const struct attribute_group *usb_interface_groups[];
 extern struct usb_driver usbfs_driver;
 extern const struct file_operations usbfs_devices_fops;
 extern const struct file_operations usbdev_file_operations;
-extern void usbfs_conn_disc_event(void);
 
 extern int usb_devio_init(void);
 extern void usb_devio_cleanup(void);
-- 
2.20.1

