Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C672F16BAE1
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2020 08:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729390AbgBYHkX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Feb 2020 02:40:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:59700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728983AbgBYHkX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 25 Feb 2020 02:40:23 -0500
Received: from localhost.localdomain (unknown [101.229.0.15])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C130321927;
        Tue, 25 Feb 2020 07:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582616423;
        bh=H0iy/RTg8MCCkLKTaY98xa58S+bn/tzHtxirIaJMV+I=;
        h=From:To:Cc:Subject:Date:From;
        b=ZUB/1aVqudGN+LKAD9yNwJGi0fR2c5qUvLzAWxXJFTaARGmpEl9d6imKArmym+q+n
         +LiRGJFYSyyZRg8R6ju4foJfPQzrSbCyiDZ25s6NFCdZZvrCFixVDHIdHkzpxfncdw
         gn+I1MRh70YSCwNdBqpy/v2QNYYbjPdHmC00zBZA=
From:   Peter Chen <peter.chen@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     linux-imx@nxp.com, jun.li@nxp.com, frank.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] usb: chipidea: udc: add sg list support
Date:   Tue, 25 Feb 2020 15:40:07 +0800
Message-Id: <20200225074007.10740-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

For low system memory system (eg, 265M), it may met OOM issue if the request
buffer is large (eg, 64KB). We ran out below OOM issue for f_fs. Luckily,
the f_fs supports sg list now, the OOM issue is fixed with this patch.

ufb: page allocation failure: order:4, mode:0x40cc0(GFP_KERNEL|__GFP_COMP), nodemask=(null),cpuset=/,mems_allowed=0
CPU: 2 PID: 370 Comm: ufb Not tainted 5.4.3-1.1.0+g54b3750d61fd #1
Hardware name: NXP i.MX8MNano DDR4 EVK board (DT)
Call trace:
 dump_backtrace+0x0/0x140
 show_stack+0x14/0x20
 dump_stack+0xb4/0xf8
 warn_alloc+0xec/0x158
 __alloc_pages_slowpath+0x9cc/0x9f8
 __alloc_pages_nodemask+0x21c/0x280
 alloc_pages_current+0x7c/0xe8
 kmalloc_order+0x1c/0x88
 __kmalloc+0x25c/0x298
 ffs_epfile_io.isra.0+0x20c/0x7d0
 ffs_epfile_read_iter+0xa8/0x188
 new_sync_read+0xe4/0x170
 __vfs_read+0x2c/0x40
 vfs_read+0xc8/0x1a0
 ksys_read+0x68/0xf0
 __arm64_sys_read+0x18/0x20
 el0_svc_common.constprop.0+0x68/0x160
 el0_svc_handler+0x20/0x80
 el0_svc+0x8/0xc
Mem-Info:
active_anon:2856 inactive_anon:5269 isolated_anon:12
 active_file:5238 inactive_file:18803 isolated_file:0
 unevictable:0 dirty:22 writeback:416 unstable:0
 slab_reclaimable:4073 slab_unreclaimable:3408
 mapped:727 shmem:7393 pagetables:37 bounce:0
 free:4104 free_pcp:118 free_cma:0
Node 0 active_anon:11436kB inactive_anon:21076kB active_file:20988kB inactive_file:75216kB unevictable:0kB isolated(ano
Node 0 DMA32 free:16820kB min:1808kB low:2260kB high:2712kB active_anon:11436kB inactive_anon:21076kB active_file:2098B
lowmem_reserve[]: 0 0 0
Node 0 DMA32: 508*4kB (UME) 242*8kB (UME) 730*16kB (UM) 21*32kB (UME) 5*64kB (UME) 2*128kB (M) 0*256kB 0*512kB 0*1024kB
Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=1048576kB
Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=32768kB
Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=2048kB
Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=64kB
31455 total pagecache pages
0 pages in swap cache
Swap cache stats: add 0, delete 0, find 0/0
Free swap  = 0kB
Total swap = 0kB
65536 pages RAM
0 pages HighMem/MovableOnly
10766 pages reserved
0 pages cma reserved
0 pages hwpoisoned
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/udc.c | 172 ++++++++++++++++++++++++++++++-------
 1 file changed, 142 insertions(+), 30 deletions(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index ffa6caee1f3b..b42d60113288 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -400,31 +400,18 @@ static inline u8 _usb_addr(struct ci_hw_ep *ep)
 	return ((ep->dir == TX) ? USB_ENDPOINT_DIR_MASK : 0) | ep->num;
 }
 
-/**
- * _hardware_enqueue: configures a request at hardware level
- * @hwep:   endpoint
- * @hwreq:  request
- *
- * This function returns an error code
- */
-static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
+static int prepare_td_for_non_sg(struct ci_hw_ep *hwep,
+		struct ci_hw_req *hwreq)
 {
-	struct ci_hdrc *ci = hwep->ci;
-	int ret = 0;
 	unsigned rest = hwreq->req.length;
 	int pages = TD_PAGE_COUNT;
-	struct td_node *firstnode, *lastnode;
-
-	/* don't queue twice */
-	if (hwreq->req.status == -EALREADY)
-		return -EALREADY;
-
-	hwreq->req.status = -EALREADY;
+	int ret = 0;
 
-	ret = usb_gadget_map_request_by_dev(ci->dev->parent,
-					    &hwreq->req, hwep->dir);
-	if (ret)
-		return ret;
+	if (rest == 0) {
+		ret = add_td_to_list(hwep, hwreq, 0);
+		if (ret < 0)
+			return ret;
+	}
 
 	/*
 	 * The first buffer could be not page aligned.
@@ -433,18 +420,13 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 	if (hwreq->req.dma % PAGE_SIZE)
 		pages--;
 
-	if (rest == 0) {
-		ret = add_td_to_list(hwep, hwreq, 0);
-		if (ret < 0)
-			goto done;
-	}
-
 	while (rest > 0) {
 		unsigned count = min(hwreq->req.length - hwreq->req.actual,
-					(unsigned)(pages * CI_HDRC_PAGE_SIZE));
+			(unsigned)(pages * CI_HDRC_PAGE_SIZE));
+
 		ret = add_td_to_list(hwep, hwreq, count);
 		if (ret < 0)
-			goto done;
+			return ret;
 
 		rest -= count;
 	}
@@ -453,9 +435,138 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 	    && (hwreq->req.length % hwep->ep.maxpacket == 0)) {
 		ret = add_td_to_list(hwep, hwreq, 0);
 		if (ret < 0)
-			goto done;
+			return ret;
 	}
 
+	return ret;
+}
+
+static int add_td_to_list_sg(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq,
+			  struct scatterlist *s, unsigned length)
+{
+	int i;
+	u32 temp;
+	struct td_node *lastnode, *node = kzalloc(sizeof(struct td_node),
+						  GFP_ATOMIC);
+
+	if (node == NULL)
+		return -ENOMEM;
+
+	node->ptr = dma_pool_zalloc(hwep->td_pool, GFP_ATOMIC, &node->dma);
+	if (node->ptr == NULL) {
+		kfree(node);
+		return -ENOMEM;
+	}
+
+	node->ptr->token = cpu_to_le32(length << __ffs(TD_TOTAL_BYTES));
+	node->ptr->token &= cpu_to_le32(TD_TOTAL_BYTES);
+	node->ptr->token |= cpu_to_le32(TD_STATUS_ACTIVE);
+	if (hwep->type == USB_ENDPOINT_XFER_ISOC && hwep->dir == TX) {
+		u32 mul = hwreq->req.length / hwep->ep.maxpacket;
+
+		if (hwreq->req.length == 0
+				|| hwreq->req.length % hwep->ep.maxpacket)
+			mul++;
+		node->ptr->token |= cpu_to_le32(mul << __ffs(TD_MULTO));
+	}
+
+	temp = (u32) (sg_dma_address(s) + hwreq->req.actual);
+	for (i = 0; i < TD_PAGE_COUNT; i++)
+		node->ptr->page[i] = cpu_to_le32(temp + i * CI_HDRC_PAGE_SIZE);
+
+	hwreq->req.actual += length;
+
+	if (!list_empty(&hwreq->tds)) {
+		/* get the last entry */
+		lastnode = list_entry(hwreq->tds.prev,
+				struct td_node, td);
+		lastnode->ptr->next = cpu_to_le32(node->dma);
+	}
+
+	INIT_LIST_HEAD(&node->td);
+	list_add_tail(&node->td, &hwreq->tds);
+
+	return 0;
+}
+
+static int prepare_td_per_sg(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq,
+		struct scatterlist *s)
+{
+	unsigned rest = sg_dma_len(s);
+	int ret = 0;
+
+	hwreq->req.actual = 0;
+	while (rest > 0) {
+		unsigned count = min(rest,
+				(unsigned)(TD_PAGE_COUNT * CI_HDRC_PAGE_SIZE));
+
+		ret = add_td_to_list_sg(hwep, hwreq, s, count);
+		if (ret < 0)
+			return ret;
+
+		rest -= count;
+	}
+
+	return ret;
+}
+
+static int prepare_td_for_sg(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
+{
+	struct usb_request *req = &hwreq->req;
+	struct scatterlist *s = req->sg;
+	int ret;
+
+	if (!s || req->zero || req->length == 0) {
+		dev_err(hwep->ci->dev, "not supported operation for sg\n");
+		return -EINVAL;
+	}
+
+	do {
+		if (sg_dma_address(s) % PAGE_SIZE) {
+			dev_err(hwep->ci->dev, "non-page aligned sg\n");
+			return -EINVAL;
+		}
+
+		ret = prepare_td_per_sg(hwep, hwreq, s);
+		if (ret)
+			return ret;
+	} while ((s = sg_next(s)));
+
+	return ret;
+}
+
+/**
+ * _hardware_enqueue: configures a request at hardware level
+ * @hwep:   endpoint
+ * @hwreq:  request
+ *
+ * This function returns an error code
+ */
+static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
+{
+	struct ci_hdrc *ci = hwep->ci;
+	int ret = 0;
+	struct td_node *firstnode, *lastnode;
+
+	/* don't queue twice */
+	if (hwreq->req.status == -EALREADY)
+		return -EALREADY;
+
+	hwreq->req.status = -EALREADY;
+
+	ret = usb_gadget_map_request_by_dev(ci->dev->parent,
+					    &hwreq->req, hwep->dir);
+	if (ret)
+		return ret;
+
+	if (hwreq->req.num_mapped_sgs)
+		ret = prepare_td_for_sg(hwep, hwreq);
+	else
+		ret = prepare_td_for_non_sg(hwep, hwreq);
+
+	if (ret)
+		return ret;
+
 	firstnode = list_first_entry(&hwreq->tds, struct td_node, td);
 
 	lastnode = list_entry(hwreq->tds.prev,
@@ -1935,6 +2046,7 @@ static int udc_start(struct ci_hdrc *ci)
 	ci->gadget.max_speed    = USB_SPEED_HIGH;
 	ci->gadget.name         = ci->platdata->name;
 	ci->gadget.otg_caps	= otg_caps;
+	ci->gadget.sg_supported = 1;
 
 	if (ci->platdata->flags & CI_HDRC_REQUIRES_ALIGNED_DMA)
 		ci->gadget.quirk_avoids_skb_reserve = 1;
-- 
2.17.1

