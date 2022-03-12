Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6844D70DA
	for <lists+linux-usb@lfdr.de>; Sat, 12 Mar 2022 21:28:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbiCLU3u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 12 Mar 2022 15:29:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbiCLU3u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 12 Mar 2022 15:29:50 -0500
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B98618EB41
        for <linux-usb@vger.kernel.org>; Sat, 12 Mar 2022 12:28:39 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 1007120AAAED
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
Subject: [PATCH 2/2] usb: host: uhci: remove #define EXTRA_SPACE
Date:   Sat, 12 Mar 2022 23:28:34 +0300
Message-ID: <20220312202834.11700-3-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20220312202834.11700-1-s.shtylyov@omp.ru>
References: <20220312202834.11700-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The UHCI driver's debugging code used a lot of sprintf() calls with the
large buffers, leaving 1024 bytes at the end of the buffers to handle
buffer overflow. As that code was changed to call scnprintf() instead,
there's no more buffer overflow, so we don't need #define EXTRA_SPACE
anymore...

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 drivers/usb/host/uhci-debug.c | 5 +----
 drivers/usb/host/uhci-hcd.c   | 2 +-
 drivers/usb/host/uhci-q.c     | 2 +-
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/uhci-debug.c b/drivers/usb/host/uhci-debug.c
index b5425dbd3e2d..db854b41dcb9 100644
--- a/drivers/usb/host/uhci-debug.c
+++ b/drivers/usb/host/uhci-debug.c
@@ -17,8 +17,6 @@
 
 #include "uhci-hcd.h"
 
-#define EXTRA_SPACE	1024
-
 static struct dentry *uhci_debugfs_root;
 
 #ifdef CONFIG_DYNAMIC_DEBUG
@@ -496,8 +494,7 @@ static int uhci_debug_open(struct inode *inode, struct file *file)
 	up->size = 0;
 	spin_lock_irqsave(&uhci->lock, flags);
 	if (uhci->is_initialized)
-		up->size = uhci_sprint_schedule(uhci, up->data,
-					MAX_OUTPUT - EXTRA_SPACE);
+		up->size = uhci_sprint_schedule(uhci, up->data, MAX_OUTPUT);
 	spin_unlock_irqrestore(&uhci->lock, flags);
 
 	file->private_data = up;
diff --git a/drivers/usb/host/uhci-hcd.c b/drivers/usb/host/uhci-hcd.c
index d90b869f5f40..9ebe6f32c1d9 100644
--- a/drivers/usb/host/uhci-hcd.c
+++ b/drivers/usb/host/uhci-hcd.c
@@ -480,7 +480,7 @@ static irqreturn_t uhci_irq(struct usb_hcd *hcd)
 				if (debug > 1 && errbuf) {
 					/* Print the schedule for debugging */
 					uhci_sprint_schedule(uhci, errbuf,
-						ERRBUF_LEN - EXTRA_SPACE);
+						ERRBUF_LEN);
 					lprintk(errbuf);
 				}
 				uhci_hc_died(uhci);
diff --git a/drivers/usb/host/uhci-q.c b/drivers/usb/host/uhci-q.c
index 35fcb826152c..34cce3ee2bb3 100644
--- a/drivers/usb/host/uhci-q.c
+++ b/drivers/usb/host/uhci-q.c
@@ -1199,7 +1199,7 @@ static int uhci_result_common(struct uhci_hcd *uhci, struct urb *urb)
 				if (debug > 1 && errbuf) {
 					/* Print the chain for debugging */
 					uhci_show_qh(uhci, urbp->qh, errbuf,
-						ERRBUF_LEN - EXTRA_SPACE, 0);
+						ERRBUF_LEN, 0);
 					lprintk(errbuf);
 				}
 			}
-- 
2.26.3
