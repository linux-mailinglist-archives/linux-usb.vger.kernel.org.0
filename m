Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1990E78D89F
	for <lists+linux-usb@lfdr.de>; Wed, 30 Aug 2023 20:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235057AbjH3Sa6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Aug 2023 14:30:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244065AbjH3M2j (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Aug 2023 08:28:39 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D85ACCF;
        Wed, 30 Aug 2023 05:28:31 -0700 (PDT)
X-UUID: b6c5b9ee473011eeb20a276fd37b9834-20230830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=AWvQXGpiHRQf+kFSEUvTHSu75pX9oCjeaDF6wySaVIc=;
        b=bgNEHIB7uEeJZjec76Prga0Cb/GrW8McVqSti515nQ2xoQqAEzo8ROmCgDB2kOdJqPL/OPzdSDOClC7jV18eCbWjsxZe0NExJDHjZcaZDz/UOMDwmGo2Kd8weTB9MMvSXzpyKiPqiN4y/X8/bN6U/tr0NmwgxaCtycNnKg8GqKQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:e6f7e766-ba51-487f-abee-e4a4cbfba5c7,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:98995c13-4929-4845-9571-38c601e9c3c9,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
        NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b6c5b9ee473011eeb20a276fd37b9834-20230830
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1534289783; Wed, 30 Aug 2023 20:28:24 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 30 Aug 2023 20:28:23 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 30 Aug 2023 20:28:22 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] usb: xhci-mtk: add a bandwidth budget table
Date:   Wed, 30 Aug 2023 20:28:19 +0800
Message-ID: <20230830122820.18859-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,RDNS_NONE,
        SPF_HELO_PASS,T_SPF_TEMPERROR,UNPARSEABLE_RELAY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In order to estimate when fs/ls transactions appear on a downstream bus,
the host must calculate a best case full-speed budget, use a table to
track how many bytes occure in each microframe.
This patch is prepared for introducing an improved bandwidth scheduling.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 113 +++++++++++++++++++++++---------
 drivers/usb/host/xhci-mtk.h     |   4 +-
 2 files changed, 85 insertions(+), 32 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 579899eb24c1..93d962b159b4 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -19,6 +19,13 @@
 #define HS_BW_BOUNDARY	6144
 /* usb2 spec section11.18.1: at most 188 FS bytes per microframe */
 #define FS_PAYLOAD_MAX 188
+/*
+ * max number of microframes for split transfer, assume extra-cs budget is 0
+ * for fs isoc in : 1 ss + 1 idle + 6 cs (roundup(1023/188))
+ */
+#define TT_MICROFRAMES_MAX	8
+/* offset from SS for fs/ls isoc/intr ep (ss + idle) */
+#define CS_OFFSET	2
 
 #define DBG_BUF_EN	64
 
@@ -237,17 +244,26 @@ static void drop_tt(struct usb_device *udev)
 
 static struct mu3h_sch_ep_info *
 create_sch_ep(struct xhci_hcd_mtk *mtk, struct usb_device *udev,
-	      struct usb_host_endpoint *ep)
+	      struct usb_host_endpoint *ep, struct xhci_ep_ctx *ep_ctx)
 {
 	struct mu3h_sch_ep_info *sch_ep;
 	struct mu3h_sch_bw_info *bw_info;
 	struct mu3h_sch_tt *tt = NULL;
+	u32 len;
 
 	bw_info = get_bw_info(mtk, udev, ep);
 	if (!bw_info)
 		return ERR_PTR(-ENODEV);
 
-	sch_ep = kzalloc(sizeof(*sch_ep), GFP_KERNEL);
+	if (is_fs_or_ls(udev->speed))
+		len = TT_MICROFRAMES_MAX;
+	else if ((udev->speed >= USB_SPEED_SUPER) &&
+		 usb_endpoint_xfer_isoc(&ep->desc))
+		len = get_esit(ep_ctx);
+	else
+		len = 1;
+
+	sch_ep = kzalloc(struct_size(sch_ep, bw_budget_table, len), GFP_KERNEL);
 	if (!sch_ep)
 		return ERR_PTR(-ENOMEM);
 
@@ -279,7 +295,11 @@ static void setup_sch_info(struct xhci_ep_ctx *ep_ctx,
 	u32 mult;
 	u32 esit_pkts;
 	u32 max_esit_payload;
+	u32 bw_per_microframe;
+	u32 *bwb_table;
+	int i;
 
+	bwb_table = sch_ep->bw_budget_table;
 	ep_type = CTX_TO_EP_TYPE(le32_to_cpu(ep_ctx->ep_info2));
 	maxpkt = MAX_PACKET_DECODED(le32_to_cpu(ep_ctx->ep_info2));
 	max_burst = CTX_TO_MAX_BURST(le32_to_cpu(ep_ctx->ep_info2));
@@ -313,7 +333,7 @@ static void setup_sch_info(struct xhci_ep_ctx *ep_ctx,
 		 * opportunities per microframe
 		 */
 		sch_ep->pkts = max_burst + 1;
-		sch_ep->bw_cost_per_microframe = maxpkt * sch_ep->pkts;
+		bwb_table[0] = maxpkt * sch_ep->pkts;
 	} else if (sch_ep->speed >= USB_SPEED_SUPER) {
 		/* usb3_r1 spec section4.4.7 & 4.4.8 */
 		sch_ep->cs_count = 0;
@@ -330,6 +350,7 @@ static void setup_sch_info(struct xhci_ep_ctx *ep_ctx,
 		if (ep_type == INT_IN_EP || ep_type == INT_OUT_EP) {
 			sch_ep->pkts = esit_pkts;
 			sch_ep->num_budget_microframes = 1;
+			bwb_table[0] = maxpkt * sch_ep->pkts;
 		}
 
 		if (ep_type == ISOC_IN_EP || ep_type == ISOC_OUT_EP) {
@@ -346,18 +367,52 @@ static void setup_sch_info(struct xhci_ep_ctx *ep_ctx,
 				DIV_ROUND_UP(esit_pkts, sch_ep->pkts);
 
 			sch_ep->repeat = !!(sch_ep->num_budget_microframes > 1);
+			bw_per_microframe = maxpkt * sch_ep->pkts;
+
+			for (i = 0; i < sch_ep->num_budget_microframes - 1; i++)
+				bwb_table[i] = bw_per_microframe;
+
+			/* last one <= bw_per_microframe */
+			bwb_table[i] = maxpkt * esit_pkts - i * bw_per_microframe;
 		}
-		sch_ep->bw_cost_per_microframe = maxpkt * sch_ep->pkts;
 	} else if (is_fs_or_ls(sch_ep->speed)) {
 		sch_ep->pkts = 1; /* at most one packet for each microframe */
 
 		/*
-		 * num_budget_microframes and cs_count will be updated when
+		 * @cs_count will be updated to add extra-cs when
 		 * check TT for INT_OUT_EP, ISOC/INT_IN_EP type
+		 * @maxpkt <= 1023;
 		 */
 		sch_ep->cs_count = DIV_ROUND_UP(maxpkt, FS_PAYLOAD_MAX);
 		sch_ep->num_budget_microframes = sch_ep->cs_count;
-		sch_ep->bw_cost_per_microframe = min_t(u32, maxpkt, FS_PAYLOAD_MAX);
+
+		/* init budget table */
+		if (ep_type == ISOC_OUT_EP) {
+			for (i = 0; i < sch_ep->cs_count - 1; i++)
+				bwb_table[i] = FS_PAYLOAD_MAX;
+
+			bwb_table[i] = maxpkt - i * FS_PAYLOAD_MAX;
+		} else if (ep_type == INT_OUT_EP) {
+			/* only first one used (maxpkt <= 64), others zero */
+			bwb_table[0] = maxpkt;
+		} else { /* INT_IN_EP or ISOC_IN_EP */
+			bwb_table[0] = 0; /* start split */
+			bwb_table[1] = 0; /* idle */
+			/*
+			 * @cs_count will be updated according to cs position
+			 * (add 1 or 2 extra-cs), but assume only first
+			 * @num_budget_microframes elements will be used later,
+			 * although in fact it does not (extra-cs budget many receive
+			 * some data for IN ep);
+			 * @cs_count is 1 for INT_IN_EP (maxpkt <= 64);
+			 */
+			for (i = 0; i < sch_ep->cs_count - 1; i++)
+				bwb_table[i + CS_OFFSET] = FS_PAYLOAD_MAX;
+
+			bwb_table[i + CS_OFFSET] = maxpkt - i * FS_PAYLOAD_MAX;
+			/* ss + idle */
+			sch_ep->num_budget_microframes += CS_OFFSET;
+		}
 	}
 }
 
@@ -374,7 +429,7 @@ static u32 get_max_bw(struct mu3h_sch_bw_info *sch_bw,
 
 		for (j = 0; j < sch_ep->num_budget_microframes; j++) {
 			k = XHCI_MTK_BW_INDEX(base + j);
-			bw = sch_bw->bus_bw[k] + sch_ep->bw_cost_per_microframe;
+			bw = sch_bw->bus_bw[k] + sch_ep->bw_budget_table[j];
 			if (bw > max_bw)
 				max_bw = bw;
 		}
@@ -385,16 +440,18 @@ static u32 get_max_bw(struct mu3h_sch_bw_info *sch_bw,
 static void update_bus_bw(struct mu3h_sch_bw_info *sch_bw,
 	struct mu3h_sch_ep_info *sch_ep, bool used)
 {
-	int bw_updated;
 	u32 base;
-	int i, j;
-
-	bw_updated = sch_ep->bw_cost_per_microframe * (used ? 1 : -1);
+	int i, j, k;
 
 	for (i = 0; i < sch_ep->num_esit; i++) {
 		base = sch_ep->offset + i * sch_ep->esit;
-		for (j = 0; j < sch_ep->num_budget_microframes; j++)
-			sch_bw->bus_bw[XHCI_MTK_BW_INDEX(base + j)] += bw_updated;
+		for (j = 0; j < sch_ep->num_budget_microframes; j++) {
+			k = XHCI_MTK_BW_INDEX(base + j);
+			if (used)
+				sch_bw->bus_bw[k] += sch_ep->bw_budget_table[j];
+			else
+				sch_bw->bus_bw[k] -= sch_ep->bw_budget_table[j];
+		}
 	}
 }
 
@@ -414,7 +471,7 @@ static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
 		 */
 		for (j = 0; j < sch_ep->num_budget_microframes; j++) {
 			k = XHCI_MTK_BW_INDEX(base + j);
-			tmp = tt->fs_bus_bw[k] + sch_ep->bw_cost_per_microframe;
+			tmp = tt->fs_bus_bw[k] + sch_ep->bw_budget_table[j];
 			if (tmp > FS_PAYLOAD_MAX)
 				return -ESCH_BW_OVERFLOW;
 		}
@@ -454,25 +511,18 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 			return -ESCH_SS_Y6;
 
 		/* one uframe for ss + one uframe for idle */
-		start_cs = (start_ss + 2) % 8;
+		start_cs = (start_ss + CS_OFFSET) % 8;
 		last_cs = start_cs + cs_count - 1;
-
 		if (last_cs > 7)
 			return -ESCH_CS_OVERFLOW;
 
+		/* add extra-cs */
+		cs_count += (last_cs == 7) ? 1 : 2;
 		if (cs_count > 7)
 			cs_count = 7; /* HW limit */
 
 		sch_ep->cs_count = cs_count;
-		/* ss, idle are ignored */
-		sch_ep->num_budget_microframes = cs_count;
 
-		/*
-		 * if interval=1, maxp >752, num_budge_micoframe is larger
-		 * than sch_ep->esit, will overstep boundary
-		 */
-		if (sch_ep->num_budget_microframes > sch_ep->esit)
-			sch_ep->num_budget_microframes = sch_ep->esit;
 	}
 
 	return check_fs_bus_bw(sch_ep, offset);
@@ -481,17 +531,20 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
 {
 	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
-	int bw_updated;
 	u32 base;
-	int i, j;
+	int i, j, k;
 
-	bw_updated = sch_ep->bw_cost_per_microframe * (used ? 1 : -1);
 
 	for (i = 0; i < sch_ep->num_esit; i++) {
 		base = sch_ep->offset + i * sch_ep->esit;
 
-		for (j = 0; j < sch_ep->num_budget_microframes; j++)
-			tt->fs_bus_bw[XHCI_MTK_BW_INDEX(base + j)] += bw_updated;
+		for (j = 0; j < sch_ep->num_budget_microframes; j++) {
+			k = XHCI_MTK_BW_INDEX(base + j);
+			if (used)
+				tt->fs_bus_bw[k] += (u16)sch_ep->bw_budget_table[j];
+			else
+				tt->fs_bus_bw[k] -= (u16)sch_ep->bw_budget_table[j];
+		}
 	}
 
 	if (used)
@@ -651,7 +704,7 @@ static int add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 
 	xhci_dbg(xhci, "%s %s\n", __func__, decode_ep(ep, udev->speed));
 
-	sch_ep = create_sch_ep(mtk, udev, ep);
+	sch_ep = create_sch_ep(mtk, udev, ep, ep_ctx);
 	if (IS_ERR_OR_NULL(sch_ep))
 		return -ENOMEM;
 
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index faaaf05e36ce..ef8af20b5e88 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -58,7 +58,6 @@ struct mu3h_sch_bw_info {
  * @num_esit: number of @esit in a period
  * @num_budget_microframes: number of continuous uframes
  *		(@repeat==1) scheduled within the interval
- * @bw_cost_per_microframe: bandwidth cost per microframe
  * @hentry: hash table entry
  * @endpoint: linked into bandwidth domain which it belongs to
  * @tt_endpoint: linked into mu3h_sch_tt's list which it belongs to
@@ -83,12 +82,12 @@ struct mu3h_sch_bw_info {
  *		times; 1: distribute the (bMaxBurst+1)*(Mult+1) packets
  *		according to @pkts and @repeat. normal mode is used by
  *		default
+ * @bw_budget_table: table to record bandwidth budget per microframe
  */
 struct mu3h_sch_ep_info {
 	u32 esit;
 	u32 num_esit;
 	u32 num_budget_microframes;
-	u32 bw_cost_per_microframe;
 	struct list_head endpoint;
 	struct hlist_node hentry;
 	struct list_head tt_endpoint;
@@ -108,6 +107,7 @@ struct mu3h_sch_ep_info {
 	u32 pkts;
 	u32 cs_count;
 	u32 burst_mode;
+	u32 bw_budget_table[];
 };
 
 #define MU3C_U3_PORT_MAX 4
-- 
2.18.0

