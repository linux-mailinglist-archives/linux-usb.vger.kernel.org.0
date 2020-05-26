Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CABD31C0DF5
	for <lists+linux-usb@lfdr.de>; Fri,  1 May 2020 08:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728258AbgEAGCm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 May 2020 02:02:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:37214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726452AbgEAGCm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 1 May 2020 02:02:42 -0400
Received: from localhost.localdomain (unknown [180.171.74.255])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 18BDD2070B;
        Fri,  1 May 2020 06:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588312960;
        bh=oqPqubbr8WRy4yWEvFWfPAbcMwnTUmzjUHasrLuAdwU=;
        h=From:To:Cc:Subject:Date:From;
        b=bfZVj2EgVK/8eogc0sY8IXvqxeZepZKk2UGaOs2yHXc1ZYSMNMxi6b+Pk33Gpj6AV
         sn91P6UTuQqfgg55BXGg4GCpggnV/0WXW42i81MTGou36a1eQXEh8YppayySg+auVS
         W7Kyx70xNfNw72HY2YlWzgF+8uh9m3FEd1FMHab0=
From:   Peter Chen <peter.chen@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     linux-imx@nxp.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] usb: chipidea: udc: add software sg list support
Date:   Fri,  1 May 2020 14:02:23 +0800
Message-Id: <20200501060223.23715-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

The chipidea controller doesn't support short transfer for sg list,
so we still keep setting IOC per TD, otherwise, there will be no interrupt
for short transfer. Each TD has five entries for data buffer, each data
buffer could be non-countinuous 4KB buffer, so it could handle
up to 5 sg buffers one time. The benefit of this patch is avoiding
OOM for low memory system(eg, 256MB) during large USB transfers, see
below for detail. The non-sg handling has not changed.

ufb: page allocation failure: order:4, mode:0x40cc0(GFP_KERNEL|__GFP_COMP),
nodemask=(null),cpuset=/,mems_allowed=0
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

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/ci.h  |   1 +
 drivers/usb/chipidea/udc.c | 163 +++++++++++++++++++++++++++++--------
 drivers/usb/chipidea/udc.h |   1 +
 3 files changed, 133 insertions(+), 32 deletions(-)

diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
index 644ecaef17ee..0697eb980e5f 100644
--- a/drivers/usb/chipidea/ci.h
+++ b/drivers/usb/chipidea/ci.h
@@ -25,6 +25,7 @@
 #define TD_PAGE_COUNT      5
 #define CI_HDRC_PAGE_SIZE  4096ul /* page size for TD's */
 #define ENDPT_MAX          32
+#define CI_MAX_BUF_SIZE	(TD_PAGE_COUNT * CI_HDRC_PAGE_SIZE)
 
 /******************************************************************************
  * REGISTERS
diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index da70fbe7ca4c..db0cfde0cc3c 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -338,7 +338,7 @@ static int hw_usb_reset(struct ci_hdrc *ci)
  *****************************************************************************/
 
 static int add_td_to_list(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq,
-			  unsigned length)
+			unsigned int length, struct scatterlist *s)
 {
 	int i;
 	u32 temp;
@@ -366,7 +366,13 @@ static int add_td_to_list(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq,
 		node->ptr->token |= cpu_to_le32(mul << __ffs(TD_MULTO));
 	}
 
-	temp = (u32) (hwreq->req.dma + hwreq->req.actual);
+	if (s) {
+		temp = (u32) (sg_dma_address(s) + hwreq->req.actual);
+		node->td_remaining_size = CI_MAX_BUF_SIZE - length;
+	} else {
+		temp = (u32) (hwreq->req.dma + hwreq->req.actual);
+	}
+
 	if (length) {
 		node->ptr->page[0] = cpu_to_le32(temp);
 		for (i = 1; i < TD_PAGE_COUNT; i++) {
@@ -400,6 +406,122 @@ static inline u8 _usb_addr(struct ci_hw_ep *ep)
 	return ((ep->dir == TX) ? USB_ENDPOINT_DIR_MASK : 0) | ep->num;
 }
 
+static int prepare_td_for_non_sg(struct ci_hw_ep *hwep,
+		struct ci_hw_req *hwreq)
+{
+	unsigned int rest = hwreq->req.length;
+	int pages = TD_PAGE_COUNT;
+	int ret = 0;
+
+	if (rest == 0) {
+		ret = add_td_to_list(hwep, hwreq, 0, NULL);
+		if (ret < 0)
+			return ret;
+	}
+
+	/*
+	 * The first buffer could be not page aligned.
+	 * In that case we have to span into one extra td.
+	 */
+	if (hwreq->req.dma % PAGE_SIZE)
+		pages--;
+
+	while (rest > 0) {
+		unsigned int count = min(hwreq->req.length - hwreq->req.actual,
+			(unsigned int)(pages * CI_HDRC_PAGE_SIZE));
+
+		ret = add_td_to_list(hwep, hwreq, count, NULL);
+		if (ret < 0)
+			return ret;
+
+		rest -= count;
+	}
+
+	if (hwreq->req.zero && hwreq->req.length && hwep->dir == TX
+	    && (hwreq->req.length % hwep->ep.maxpacket == 0)) {
+		ret = add_td_to_list(hwep, hwreq, 0, NULL);
+		if (ret < 0)
+			return ret;
+	}
+
+	return ret;
+}
+
+static int prepare_td_per_sg(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq,
+		struct scatterlist *s)
+{
+	unsigned int rest = sg_dma_len(s);
+	int ret = 0;
+
+	hwreq->req.actual = 0;
+	while (rest > 0) {
+		unsigned int count = min_t(unsigned int, rest,
+				CI_MAX_BUF_SIZE);
+
+		ret = add_td_to_list(hwep, hwreq, count, s);
+		if (ret < 0)
+			return ret;
+
+		rest -= count;
+	}
+
+	return ret;
+}
+
+static void ci_add_buffer_entry(struct td_node *node, struct scatterlist *s)
+{
+	int empty_td_slot_index = (CI_MAX_BUF_SIZE - node->td_remaining_size)
+			/ CI_HDRC_PAGE_SIZE;
+	int i;
+
+	node->ptr->token +=
+		cpu_to_le32(sg_dma_len(s) << __ffs(TD_TOTAL_BYTES));
+
+	for (i = empty_td_slot_index; i < TD_PAGE_COUNT; i++) {
+		u32 page = (u32) sg_dma_address(s) +
+			(i - empty_td_slot_index) * CI_HDRC_PAGE_SIZE;
+
+		page &= ~TD_RESERVED_MASK;
+		node->ptr->page[i] = cpu_to_le32(page);
+	}
+}
+
+static int prepare_td_for_sg(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
+{
+	struct usb_request *req = &hwreq->req;
+	struct scatterlist *s = req->sg;
+	int ret = 0, i = 0;
+	struct td_node *node = NULL;
+
+	if (!s || req->zero || req->length == 0) {
+		dev_err(hwep->ci->dev, "not supported operation for sg\n");
+		return -EINVAL;
+	}
+
+	while (i++ < req->num_mapped_sgs) {
+		if (sg_dma_address(s) % PAGE_SIZE) {
+			dev_err(hwep->ci->dev, "not page aligned sg buffer\n");
+			return -EINVAL;
+		}
+
+		if (node && (node->td_remaining_size >= sg_dma_len(s))) {
+			ci_add_buffer_entry(node, s);
+			node->td_remaining_size -= sg_dma_len(s);
+		} else {
+			ret = prepare_td_per_sg(hwep, hwreq, s);
+			if (ret)
+				return ret;
+
+			node = list_entry(hwreq->tds.prev,
+				struct td_node, td);
+		}
+
+		s = sg_next(s);
+	}
+
+	return ret;
+}
+
 /**
  * _hardware_enqueue: configures a request at hardware level
  * @hwep:   endpoint
@@ -411,8 +533,6 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 {
 	struct ci_hdrc *ci = hwep->ci;
 	int ret = 0;
-	unsigned rest = hwreq->req.length;
-	int pages = TD_PAGE_COUNT;
 	struct td_node *firstnode, *lastnode;
 
 	/* don't queue twice */
@@ -426,35 +546,13 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 	if (ret)
 		return ret;
 
-	/*
-	 * The first buffer could be not page aligned.
-	 * In that case we have to span into one extra td.
-	 */
-	if (hwreq->req.dma % PAGE_SIZE)
-		pages--;
-
-	if (rest == 0) {
-		ret = add_td_to_list(hwep, hwreq, 0);
-		if (ret < 0)
-			goto done;
-	}
-
-	while (rest > 0) {
-		unsigned count = min(hwreq->req.length - hwreq->req.actual,
-					(unsigned)(pages * CI_HDRC_PAGE_SIZE));
-		ret = add_td_to_list(hwep, hwreq, count);
-		if (ret < 0)
-			goto done;
-
-		rest -= count;
-	}
+	if (hwreq->req.num_mapped_sgs)
+		ret = prepare_td_for_sg(hwep, hwreq);
+	else
+		ret = prepare_td_for_non_sg(hwep, hwreq);
 
-	if (hwreq->req.zero && hwreq->req.length && hwep->dir == TX
-	    && (hwreq->req.length % hwep->ep.maxpacket == 0)) {
-		ret = add_td_to_list(hwep, hwreq, 0);
-		if (ret < 0)
-			goto done;
-	}
+	if (ret)
+		return ret;
 
 	firstnode = list_first_entry(&hwreq->tds, struct td_node, td);
 
@@ -1941,6 +2039,7 @@ static int udc_start(struct ci_hdrc *ci)
 	ci->gadget.max_speed    = USB_SPEED_HIGH;
 	ci->gadget.name         = ci->platdata->name;
 	ci->gadget.otg_caps	= otg_caps;
+	ci->gadget.sg_supported = 1;
 
 	if (ci->platdata->flags & CI_HDRC_REQUIRES_ALIGNED_DMA)
 		ci->gadget.quirk_avoids_skb_reserve = 1;
diff --git a/drivers/usb/chipidea/udc.h b/drivers/usb/chipidea/udc.h
index 32b56f84f77a..5193df1e18c7 100644
--- a/drivers/usb/chipidea/udc.h
+++ b/drivers/usb/chipidea/udc.h
@@ -61,6 +61,7 @@ struct td_node {
 	struct list_head	td;
 	dma_addr_t		dma;
 	struct ci_hw_td		*ptr;
+	int			td_remaining_size;
 };
 
 /**
-- 
2.17.1

