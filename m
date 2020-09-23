Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8B2F27544F
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 11:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgIWJWI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 05:22:08 -0400
Received: from mx2.suse.de ([195.135.220.15]:53646 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726524AbgIWJWG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Sep 2020 05:22:06 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600852924;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=2uWvnpc3bmPq2wl5EDlk5vxdx9IFG3yUbr1P4YdA22Y=;
        b=FBqil4qIOg+4F8DPQ7hm8QEU1Hc1EiZ7z8tjzfOG+Zm/heJnwiD5RvcX/spwnrzl91alH8
        52/sQaj0ClMlLeDbiK0G3+C8Hq+Mk0xnd3aukuUu3eYMMeWk58fiNGUYUDW9U2RP7GNOWb
        f+lKqWpDMGxGR0Voy2ibxOB7PMeBWj8=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A625FAB3E;
        Wed, 23 Sep 2020 09:22:41 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org, gregKH@linuxfoundation.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 1/7] CDC-WDM: fix hangs in flush() in multithreaded cases
Date:   Wed, 23 Sep 2020 11:21:30 +0200
Message-Id: <20200923092136.14824-2-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200923092136.14824-1-oneukum@suse.com>
References: <20200923092136.14824-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In a multithreaded scenario an arbitrary number of threads
can be in wdm_write() and in wdm_flush(). Hence whenever
WDM_IN_USE is reset, all possible waiters need to be notified.
This is true whether this is due to IO completing or
to an error starting IO.

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

