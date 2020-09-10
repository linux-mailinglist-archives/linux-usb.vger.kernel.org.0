Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 213142645EC
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 14:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729911AbgIJMX6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Sep 2020 08:23:58 -0400
Received: from mx2.suse.de ([195.135.220.15]:53628 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730507AbgIJMVc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Sep 2020 08:21:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 664D8B016;
        Thu, 10 Sep 2020 12:21:33 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 1/6] CDC-WDM: fix hangs in flush()
Date:   Thu, 10 Sep 2020 14:21:00 +0200
Message-Id: <20200910122105.13398-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In a multithreaded scenario  a flush() and a write() may be waiting for the same
IO to complete. Hence completion of output must use wake_up_all(),
even in error handling, while a flush may be waiting for an intended but
not started Io.

Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index e3db6fbeadef..adb3fc307083 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -151,7 +151,7 @@ static void wdm_out_callback(struct urb *urb)
 	kfree(desc->outbuf);
 	desc->outbuf = NULL;
 	clear_bit(WDM_IN_USE, &desc->flags);
-	wake_up(&desc->wait);
+	wake_up_all(&desc->wait);
 }
 
 static void wdm_in_callback(struct urb *urb)
@@ -424,6 +424,7 @@ static ssize_t wdm_write
 	if (rv < 0) {
 		desc->outbuf = NULL;
 		clear_bit(WDM_IN_USE, &desc->flags);
+		wake_up_all(&desc->wait); /* for flush() */
 		dev_err(&desc->intf->dev, "Tx URB error: %d\n", rv);
 		rv = usb_translate_errors(rv);
 		goto out_free_mem_pm;
@@ -586,6 +587,7 @@ static ssize_t wdm_read
 static int wdm_flush(struct file *file, fl_owner_t id)
 {
 	struct wdm_device *desc = file->private_data;
+	int rv;
 
 	wait_event(desc->wait,
 			/*
@@ -600,11 +602,12 @@ static int wdm_flush(struct file *file, fl_owner_t id)
 	/* cannot dereference desc->intf if WDM_DISCONNECTING */
 	if (test_bit(WDM_DISCONNECTING, &desc->flags))
 		return -ENODEV;
-	if (desc->werr < 0)
+	rv = desc->werr;
+	if (rv < 0)
 		dev_err(&desc->intf->dev, "Error in flush path: %d\n",
-			desc->werr);
+			rv);
 
-	return usb_translate_errors(desc->werr);
+	return usb_translate_errors(rv);
 }
 
 static __poll_t wdm_poll(struct file *file, struct poll_table_struct *wait)
-- 
2.16.4

