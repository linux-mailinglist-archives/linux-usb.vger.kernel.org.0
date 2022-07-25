Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C98957F9A3
	for <lists+linux-usb@lfdr.de>; Mon, 25 Jul 2022 08:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbiGYGx1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Jul 2022 02:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232177AbiGYGxY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Jul 2022 02:53:24 -0400
Received: from ZXSHCAS1.zhaoxin.com (ZXSHCAS1.zhaoxin.com [210.0.225.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 149511055A;
        Sun, 24 Jul 2022 23:53:20 -0700 (PDT)
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHCAS1.zhaoxin.com
 (10.28.252.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 25 Jul
 2022 14:52:52 +0800
Received: from L440.zhaoxin.com (10.29.8.21) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 25 Jul
 2022 14:52:52 +0800
From:   Weitao Wang <WeitaoWang-oc@zhaoxin.com>
To:     <stern@rowland.harvard.edu>, <gregkh@linuxfoundation.org>,
        <kishon@ti.com>, <dianders@chromium.org>, <s.shtylyov@omp.ru>,
        <mka@chromium.org>, <ming.lei@canonical.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <tonywwang@zhaoxin.com>, <weitaowang@zhaoxin.com>
Subject: [PATCH v2] USB: HCD: Fix URB giveback issue in tasklet function
Date:   Mon, 25 Jul 2022 14:52:51 +0800
Message-ID: <20220725065251.832087-1-WeitaoWang-oc@zhaoxin.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.29.8.21]
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Usb core introduce the mechanism of giveback of URB in tasklet context to
reduce hardware interrupt handling time. On some test situation(such as
FIO with 4KB block size), when tasklet callback function called to
giveback URB, interrupt handler add URB node to the bh->head list also.
If check bh->head list again after finish all URB giveback of local_list,
then it may introduce a "dynamic balance" between giveback URB and add URB
to bh->head list. This tasklet callback function may not exit for a long
time, which will cause other tasklet function calls to be delayed. Some
real-time applications(such as KB and Mouse) will see noticeable lag.

Fix this issue by taking new URBs giveback in next tasklet function call.
Add a member high_prio for structure giveback_urb_bh and replace the local
high_prio_bh variable with this structure member in usb_hcd_giveback_urb.

Fixes: 94dfd7edfd5c ("USB: HCD: support giveback of URB in tasklet context")
Signed-off-by: Weitao Wang <WeitaoWang-oc@zhaoxin.com>
---
v1->v2:
 - Fix compile warning by remove label "restart".
 - Modify the patch description info.
 - Change structure member from hi_priority to high_prio.

 drivers/usb/core/hcd.c  | 25 ++++++++++++++-----------
 include/linux/usb/hcd.h |  1 +
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 06eea8848ccc..1feb9a604380 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1691,7 +1691,6 @@ static void usb_giveback_urb_bh(struct tasklet_struct *t)
 
 	spin_lock_irq(&bh->lock);
 	bh->running = true;
- restart:
 	list_replace_init(&bh->head, &local_list);
 	spin_unlock_irq(&bh->lock);
 
@@ -1705,10 +1704,16 @@ static void usb_giveback_urb_bh(struct tasklet_struct *t)
 		bh->completing_ep = NULL;
 	}
 
-	/* check if there are new URBs to giveback */
+	/* giveback new URBs next time to prevent this function from
+	 * not exiting for a long time.
+	 */
 	spin_lock_irq(&bh->lock);
-	if (!list_empty(&bh->head))
-		goto restart;
+	if (!list_empty(&bh->head)) {
+		if (bh->high_prio)
+			tasklet_hi_schedule(&bh->bh);
+		else
+			tasklet_schedule(&bh->bh);
+	}
 	bh->running = false;
 	spin_unlock_irq(&bh->lock);
 }
@@ -1737,7 +1742,7 @@ static void usb_giveback_urb_bh(struct tasklet_struct *t)
 void usb_hcd_giveback_urb(struct usb_hcd *hcd, struct urb *urb, int status)
 {
 	struct giveback_urb_bh *bh;
-	bool running, high_prio_bh;
+	bool running;
 
 	/* pass status to tasklet via unlinked */
 	if (likely(!urb->unlinked))
@@ -1748,13 +1753,10 @@ void usb_hcd_giveback_urb(struct usb_hcd *hcd, struct urb *urb, int status)
 		return;
 	}
 
-	if (usb_pipeisoc(urb->pipe) || usb_pipeint(urb->pipe)) {
+	if (usb_pipeisoc(urb->pipe) || usb_pipeint(urb->pipe))
 		bh = &hcd->high_prio_bh;
-		high_prio_bh = true;
-	} else {
+	else
 		bh = &hcd->low_prio_bh;
-		high_prio_bh = false;
-	}
 
 	spin_lock(&bh->lock);
 	list_add_tail(&urb->urb_list, &bh->head);
@@ -1763,7 +1765,7 @@ void usb_hcd_giveback_urb(struct usb_hcd *hcd, struct urb *urb, int status)
 
 	if (running)
 		;
-	else if (high_prio_bh)
+	else if (bh->high_prio)
 		tasklet_hi_schedule(&bh->bh);
 	else
 		tasklet_schedule(&bh->bh);
@@ -2959,6 +2961,7 @@ int usb_add_hcd(struct usb_hcd *hcd,
 
 	/* initialize tasklets */
 	init_giveback_urb_bh(&hcd->high_prio_bh);
+	hcd->high_prio_bh.high_prio = 1;
 	init_giveback_urb_bh(&hcd->low_prio_bh);
 
 	/* enable irqs just before we start the controller,
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index 2c1fc9212cf2..98d1921f02b1 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -66,6 +66,7 @@
 
 struct giveback_urb_bh {
 	bool running;
+	bool high_prio;
 	spinlock_t lock;
 	struct list_head  head;
 	struct tasklet_struct bh;
-- 
2.32.0
