Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA346173565
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2020 11:35:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbgB1Kfn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Feb 2020 05:35:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:45016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726063AbgB1Kfn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 28 Feb 2020 05:35:43 -0500
Received: from localhost.localdomain (unknown [222.65.251.82])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 43D9F246A8;
        Fri, 28 Feb 2020 10:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582886142;
        bh=wp6XMdSNw04JjTxVtUpLjO6Mx3otLshpjG+hwuGWf0k=;
        h=From:To:Cc:Subject:Date:From;
        b=Q5orTx4ueA9Leiij0cEeachUk8CC90tf2e0iURZ5nJPDJ/BByoUcm6a55o19MKWsV
         G7vMnQ14MBnpZ47m4t3E9ekOu0caiTwMDu/jjIZ7oumt0Q0eqLHAKCdylDprgKSwFh
         uiv3eyBK6A01fXVUeoVkQx4lDTGuD8LGFT6S21Gg=
From:   Peter Chen <peter.chen@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 1/1] usb: chipidea: udc: add sg list support
Date:   Fri, 28 Feb 2020 18:35:26 +0800
Message-Id: <20200228103526.21454-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

For low system memory system (eg, 256MB), it may met OOM issue if the
request buffer is large (eg, 64KB). We ran out below OOM issue for f_fs.
Luckily, the f_fs supports sg list now, the OOM issue is fixed with
this patch.

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
Changes for v2:
- Reuse add_td_to_list for sg case
- Fix some checkpatch warnings
- Add review-by from NXP internal review

 drivers/usb/chipidea/udc.c | 127 +++++++++++++++++++++++++++----------
 1 file changed, 95 insertions(+), 32 deletions(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index ffa6caee1f3b..94feaecc6059 100644
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
@@ -366,7 +366,11 @@ static int add_td_to_list(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq,
 		node->ptr->token |= cpu_to_le32(mul << __ffs(TD_MULTO));
 	}
 
-	temp = (u32) (hwreq->req.dma + hwreq->req.actual);
+	if (s)
+		temp = (u32) (sg_dma_address(s) + hwreq->req.actual);
+	else
+		temp = (u32) (hwreq->req.dma + hwreq->req.actual);
+
 	if (length) {
 		node->ptr->page[0] = cpu_to_le32(temp);
 		for (i = 1; i < TD_PAGE_COUNT; i++) {
@@ -400,6 +404,88 @@ static inline u8 _usb_addr(struct ci_hw_ep *ep)
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
+		unsigned int count = min(rest,
+			(unsigned int)(TD_PAGE_COUNT * CI_HDRC_PAGE_SIZE));
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
+		ret = prepare_td_per_sg(hwep, hwreq, s);
+		if (ret)
+			return ret;
+	} while ((s = sg_next(s)));
+
+	return ret;
+}
+
 /**
  * _hardware_enqueue: configures a request at hardware level
  * @hwep:   endpoint
@@ -411,8 +497,6 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 {
 	struct ci_hdrc *ci = hwep->ci;
 	int ret = 0;
-	unsigned rest = hwreq->req.length;
-	int pages = TD_PAGE_COUNT;
 	struct td_node *firstnode, *lastnode;
 
 	/* don't queue twice */
@@ -426,35 +510,13 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
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
 
@@ -1935,6 +1997,7 @@ static int udc_start(struct ci_hdrc *ci)
 	ci->gadget.max_speed    = USB_SPEED_HIGH;
 	ci->gadget.name         = ci->platdata->name;
 	ci->gadget.otg_caps	= otg_caps;
+	ci->gadget.sg_supported = 1;
 
 	if (ci->platdata->flags & CI_HDRC_REQUIRES_ALIGNED_DMA)
 		ci->gadget.quirk_avoids_skb_reserve = 1;
-- 
2.17.1

