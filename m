Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C7C26D861
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 12:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgIQKGj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 06:06:39 -0400
Received: from mx2.suse.de ([195.135.220.15]:37634 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726200AbgIQKGb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Sep 2020 06:06:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=cantorsusede;
        t=1600337189;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=qJjJjJ8liZ8RUpbm0zpKhZs3JIhUIbUCld6FGwXTjKs=;
        b=PIaZ+rXSorAdAh162z73PZQvKAGnxBZ4OGHujbrK0kDJJsrBfLvTwI47jpjWYl3NbfW0Ea
        4qpjnrZnIt/ofnvfUq/oUjl7wOPT2SBNpf+lP+kOZqIDSh5RtdoFPOAG5qn4BZfYXthfAc
        GTnVD7NINvT1SgxDXPUmXTK40Ue7z9G7qrYlX+vkW3rGyoLAAAk11fEmaf7EK3gayNPm+C
        oC9o0GSvF8uAKwa1DoFG7jBPMD+9r4lSnTotTPHeFtmgR7PtkhR1FsDtM8iHrfDMkRW8qa
        vqJ/4zPp5NLPnzda8YkKbKibx/bopt3QN+j+k3tAD+wLPdBqYhrqHmgUbTJKpg==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id EC395AD73;
        Thu, 17 Sep 2020 10:07:02 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 2/7] CDC-WDM: introduce a timeout in flush()
Date:   Thu, 17 Sep 2020 12:06:09 +0200
Message-Id: <20200917100614.1010-3-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200917100614.1010-1-oneukum@suse.com>
References: <20200917100614.1010-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Malicious or defective hardware may cease communication while
flush() is running. In last consequence we need a timeout,
as hardware that remains silent must be ignored.

The 30 seconds are coming out of thin air.

Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index adb3fc307083..fef011dc8dc4 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -58,6 +58,9 @@ MODULE_DEVICE_TABLE (usb, wdm_ids);
 
 #define WDM_MAX			16
 
+/* flush() is uninterruptible, but we cannot wait forever */
+#define WDM_FLUSH_TIMEOUT	(30 * HZ)
+
 /* CDC-WMC r1.1 requires wMaxCommand to be "at least 256 decimal (0x100)" */
 #define WDM_DEFAULT_BUFSIZE	256
 
@@ -589,7 +592,7 @@ static int wdm_flush(struct file *file, fl_owner_t id)
 	struct wdm_device *desc = file->private_data;
 	int rv;
 
-	wait_event(desc->wait,
+	rv = wait_event_timeout(desc->wait,
 			/*
 			 * needs both flags. We cannot do with one
 			 * because resetting it would cause a race
@@ -597,11 +600,15 @@ static int wdm_flush(struct file *file, fl_owner_t id)
 			 * a disconnect
 			 */
 			!test_bit(WDM_IN_USE, &desc->flags) ||
-			test_bit(WDM_DISCONNECTING, &desc->flags));
+			test_bit(WDM_DISCONNECTING, &desc->flags),
+			WDM_FLUSH_TIMEOUT);
 
 	/* cannot dereference desc->intf if WDM_DISCONNECTING */
 	if (test_bit(WDM_DISCONNECTING, &desc->flags))
 		return -ENODEV;
+	if (!rv)
+		return -EIO;
+
 	rv = desc->werr;
 	if (rv < 0)
 		dev_err(&desc->intf->dev, "Error in flush path: %d\n",
@@ -662,6 +669,8 @@ static int wdm_open(struct inode *inode, struct file *file)
 	/* using write lock to protect desc->count */
 	mutex_lock(&desc->wlock);
 	if (!desc->count++) {
+		/* in case flush() had timed out */
+		usb_kill_urb(desc->command);
 		desc->werr = 0;
 		desc->rerr = 0;
 		rv = usb_submit_urb(desc->validity, GFP_KERNEL);
-- 
2.16.4

