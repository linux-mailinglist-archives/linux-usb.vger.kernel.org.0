Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D37C04AE3E1
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 23:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386291AbiBHWYE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 17:24:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386518AbiBHUtJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 15:49:09 -0500
Received: from smtp1.lauterbach.com (smtp1.lauterbach.com [62.154.241.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B11C2C0612C0
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 12:49:08 -0800 (PST)
Received: (qmail 7513 invoked by uid 484); 8 Feb 2022 20:49:07 -0000
X-Qmail-Scanner-Diagnostics: from ingpc2.intern.lauterbach.com by smtp1.lauterbach.com (envelope-from <ingo.rohloff@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(10.2.10.44):. 
 Processed in 0.064764 secs); 08 Feb 2022 20:49:07 -0000
Received: from ingpc2.intern.lauterbach.com (Authenticated_SSL:irohloff@[10.2.10.44])
          (envelope-sender <ingo.rohloff@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <gregkh@linuxfoundation.org>; 8 Feb 2022 20:49:06 -0000
From:   Ingo Rohloff <ingo.rohloff@lauterbach.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu
Cc:     linux-usb@vger.kernel.org,
        Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH 1/1] USB: usbfs: Use a spinlock instead of atomic accesses to tally used memory.
Date:   Tue,  8 Feb 2022 21:48:58 +0100
Message-Id: <20220208204858.3406-2-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220208204858.3406-1-ingo.rohloff@lauterbach.com>
References: <20220208204858.3406-1-ingo.rohloff@lauterbach.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

While the fromer code imposes a limit on the used memory, it might be over
pessimistic (even if this is unlikely).

Example scenario:
8 threads running in parallel, all entering
"usbfs_increase_memory_usage()" at the same time.
The atomic accesses in "usbfs_increase_memory_usage()" could be
serialized like this:
  8 x "atomic64_add"
  8 x "atomic64_read"
If the 8 x "atomic64_add" raise "usbfs_memory_usage" above the limit,
then all 8 calls of "usbfs_increase_memory_usage()" will return with
-ENOMEM.  If you instead serialize over the whole access to
"usbfs_memory_usage" by using a spinlock, some of these calls will
succeed.

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
---
 drivers/usb/core/devio.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index fa66e6e58792..522b170c42de 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -139,30 +139,43 @@ MODULE_PARM_DESC(usbfs_memory_mb,
 /* Hard limit, necessary to avoid arithmetic overflow */
 #define USBFS_XFER_MAX         (UINT_MAX / 2 - 1000000)
 
-static atomic64_t usbfs_memory_usage;	/* Total memory currently allocated */
+static DEFINE_SPINLOCK(usbfs_memory_usage_lock);
+static u64 usbfs_memory_usage;	/* Total memory currently allocated */
 
 /* Check whether it's okay to allocate more memory for a transfer */
 static int usbfs_increase_memory_usage(u64 amount)
 {
-	u64 lim;
+	u64 lim, total_mem;
+	unsigned long flags;
+	int ret;
 
-	lim = READ_ONCE(usbfs_memory_mb);
+	lim = usbfs_memory_mb;
 	lim <<= 20;
 
-	atomic64_add(amount, &usbfs_memory_usage);
-
-	if (lim > 0 && atomic64_read(&usbfs_memory_usage) > lim) {
-		atomic64_sub(amount, &usbfs_memory_usage);
-		return -ENOMEM;
-	}
+	ret = 0;
+	spin_lock_irqsave(&usbfs_memory_usage_lock, flags);
+	total_mem = usbfs_memory_usage + amount;
+	if (lim > 0 && total_mem > lim)
+		ret = -ENOMEM;
+	else
+		usbfs_memory_usage = total_mem;
+	spin_unlock_irqrestore(&usbfs_memory_usage_lock, flags);
 
-	return 0;
+	return ret;
 }
 
 /* Memory for a transfer is being deallocated */
 static void usbfs_decrease_memory_usage(u64 amount)
 {
-	atomic64_sub(amount, &usbfs_memory_usage);
+	u64 total_mem;
+	unsigned long flags;
+
+	spin_lock_irqsave(&usbfs_memory_usage_lock, flags);
+	total_mem = usbfs_memory_usage;
+	if (amount > total_mem)
+		amount = total_mem;
+	usbfs_memory_usage = total_mem - amount;
+	spin_unlock_irqrestore(&usbfs_memory_usage_lock, flags);
 }
 
 static int connected(struct usb_dev_state *ps)
-- 
2.17.1

