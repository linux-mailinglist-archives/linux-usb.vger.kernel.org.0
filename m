Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5963A78D8EB
	for <lists+linux-usb@lfdr.de>; Wed, 30 Aug 2023 20:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236113AbjH3Sbf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Aug 2023 14:31:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244066AbjH3M2k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Aug 2023 08:28:40 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D7E7107;
        Wed, 30 Aug 2023 05:28:31 -0700 (PDT)
X-UUID: b6c73d32473011eeb20a276fd37b9834-20230830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1vZun6j2yJpxfnq4tpFgf6GZ6tvCUCf5zOrZq3z/J84=;
        b=pCFPMweqghVnT6LR626fqBAycBefRpd/NJMAsSBJvnxYgaQa6U3so/fiiVfFTfWhgXa4hpxqJqQ9EZ6i/JQgkmHbrqArZpMelqppmsuKIFcz4w8oc0wY5rO1amvx29nbpzz/wnt7qMAYnfX7Peo7EluDSdbq2qTQ++E5ISDBBpQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:6d96243f-67d7-4dcf-9911-e27300405529,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:99995c13-4929-4845-9571-38c601e9c3c9,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
        NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b6c73d32473011eeb20a276fd37b9834-20230830
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 385206113; Wed, 30 Aug 2023 20:28:24 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 30 Aug 2023 20:28:23 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 30 Aug 2023 20:28:23 +0800
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
Subject: [PATCH 2/2] usb: xhci-mtk: improve split scheduling by separate IN/OUT budget
Date:   Wed, 30 Aug 2023 20:28:20 +0800
Message-ID: <20230830122820.18859-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230830122820.18859-1-chunfeng.yun@mediatek.com>
References: <20230830122820.18859-1-chunfeng.yun@mediatek.com>
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

Calculate the IN/OUT budget separately to improve the bandwidth schedule,
meanwhile should avoid Start-Split token overlap between IN and OUT
endpoints, and take into account the FS/LS bandwidth boundary in each
microframe and also in each FS frame.
Calculate the budget for SS of OUT eps and CS of IN eps, but not include
extra-cs, and always add at most extra-cs allowed.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 305 ++++++++++++++++++++++++++++----
 drivers/usb/host/xhci-mtk.h     |  13 +-
 2 files changed, 278 insertions(+), 40 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 93d962b159b4..6c63c346f154 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -19,6 +19,11 @@
 #define HS_BW_BOUNDARY	6144
 /* usb2 spec section11.18.1: at most 188 FS bytes per microframe */
 #define FS_PAYLOAD_MAX 188
+#define LS_PAYLOAD_MAX 18
+/* section 11.18.1, per fs frame */
+#define FS_BW_BOUNDARY	1157
+#define LS_BW_BOUNDARY	144
+
 /*
  * max number of microframes for split transfer, assume extra-cs budget is 0
  * for fs isoc in : 1 ss + 1 idle + 6 cs (roundup(1023/188))
@@ -437,6 +442,23 @@ static u32 get_max_bw(struct mu3h_sch_bw_info *sch_bw,
 	return max_bw;
 }
 
+/*
+ * for OUT: get first SS consumed bw;
+ * for IN: get first CS consumed bw;
+ */
+static u16 get_fs_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
+{
+	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
+	u16 fs_bw;
+
+	if (sch_ep->ep_type == ISOC_OUT_EP || sch_ep->ep_type == INT_OUT_EP)
+		fs_bw = tt->fs_bus_bw_out[XHCI_MTK_BW_INDEX(offset)];
+	else	/* skip ss + idle */
+		fs_bw = tt->fs_bus_bw_in[XHCI_MTK_BW_INDEX(offset + CS_OFFSET)];
+
+	return fs_bw;
+}
+
 static void update_bus_bw(struct mu3h_sch_bw_info *sch_bw,
 	struct mu3h_sch_ep_info *sch_ep, bool used)
 {
@@ -455,40 +477,117 @@ static void update_bus_bw(struct mu3h_sch_bw_info *sch_bw,
 	}
 }
 
-static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
+static int check_ls_budget_microframes(struct mu3h_sch_ep_info *sch_ep, int offset)
+{
+	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
+	int i;
+
+	if (sch_ep->speed != USB_SPEED_LOW)
+		return 0;
+
+	if (sch_ep->ep_type == INT_OUT_EP)
+		i = XHCI_MTK_BW_INDEX(offset);
+	else if (sch_ep->ep_type == INT_IN_EP)
+		i = XHCI_MTK_BW_INDEX(offset + CS_OFFSET); /* skip ss + idle */
+	else
+		return -EINVAL;
+
+	if (tt->ls_bus_bw[i] + sch_ep->maxpkt > LS_PAYLOAD_MAX)
+		return -ESCH_BW_OVERFLOW;
+
+	return 0;
+}
+
+static int check_fs_budget_microframes(struct mu3h_sch_ep_info *sch_ep, int offset)
 {
 	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
 	u32 tmp;
-	int base;
+	int i, k;
+
+	/*
+	 * for OUT eps, will transfer exactly assigned length of data,
+	 * so can't allocate more than 188 bytes;
+	 * but it's not for IN eps, usually it can't receive full
+	 * 188 bytes in a uframe, if it not assign full 188 bytes,
+	 * can add another one;
+	 */
+	for (i = 0; i < sch_ep->num_budget_microframes; i++) {
+		k = XHCI_MTK_BW_INDEX(offset + i);
+		if (sch_ep->ep_type == ISOC_OUT_EP || sch_ep->ep_type == INT_OUT_EP)
+			tmp = tt->fs_bus_bw_out[k] + sch_ep->bw_budget_table[i];
+		else /* ep_type : ISOC IN / INTR IN */
+			tmp = tt->fs_bus_bw_in[k];
+
+		if (tmp > FS_PAYLOAD_MAX)
+			return -ESCH_BW_OVERFLOW;
+	}
+
+	return 0;
+}
+
+static int check_fs_budget_frames(struct mu3h_sch_ep_info *sch_ep, int offset)
+{
+	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
+	u32 head, tail;
 	int i, j, k;
 
+	/* bugdet scheduled may cross at most two fs frames */
+	j = XHCI_MTK_BW_INDEX(offset) / UFRAMES_PER_FRAME;
+	k = XHCI_MTK_BW_INDEX(offset + sch_ep->num_budget_microframes - 1) / UFRAMES_PER_FRAME;
+
+	if (j != k) {
+		head = tt->fs_frame_bw[j];
+		tail = tt->fs_frame_bw[k];
+	} else {
+		head = tt->fs_frame_bw[j];
+		tail = 0;
+	}
+
+	j = roundup(offset, UFRAMES_PER_FRAME);
+	for (i = 0; i < sch_ep->num_budget_microframes; i++) {
+		if ((offset + i) < j)
+			head += sch_ep->bw_budget_table[i];
+		else
+			tail += sch_ep->bw_budget_table[i];
+	}
+
+	if (head > FS_BW_BOUNDARY || tail > FS_BW_BOUNDARY)
+		return -ESCH_BW_OVERFLOW;
+
+	return 0;
+}
+
+static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
+{
+	int i, base;
+	int ret = 0;
+
 	for (i = 0; i < sch_ep->num_esit; i++) {
 		base = offset + i * sch_ep->esit;
 
-		/*
-		 * Compared with hs bus, no matter what ep type,
-		 * the hub will always delay one uframe to send data
-		 */
-		for (j = 0; j < sch_ep->num_budget_microframes; j++) {
-			k = XHCI_MTK_BW_INDEX(base + j);
-			tmp = tt->fs_bus_bw[k] + sch_ep->bw_budget_table[j];
-			if (tmp > FS_PAYLOAD_MAX)
-				return -ESCH_BW_OVERFLOW;
-		}
+		ret = check_ls_budget_microframes(sch_ep, base);
+		if (ret)
+			goto err;
+
+		ret = check_fs_budget_microframes(sch_ep, base);
+		if (ret)
+			goto err;
+
+		ret = check_fs_budget_frames(sch_ep, base);
+		if (ret)
+			goto err;
 	}
 
-	return 0;
+err:
+	return ret;
 }
 
-static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
+static int check_ss_and_cs(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 {
 	u32 start_ss, last_ss;
 	u32 start_cs, last_cs;
 
-	if (!sch_ep->sch_tt)
-		return 0;
-
-	start_ss = offset % 8;
+	start_ss = offset % UFRAMES_PER_FRAME;
 
 	if (sch_ep->ep_type == ISOC_OUT_EP) {
 		last_ss = start_ss + sch_ep->cs_count - 1;
@@ -501,6 +600,7 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 			return -ESCH_SS_Y6;
 
 	} else {
+		/* maxpkt <= 1023, cs <= 6 */
 		u32 cs_count = DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
 
 		/*
@@ -511,7 +611,7 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 			return -ESCH_SS_Y6;
 
 		/* one uframe for ss + one uframe for idle */
-		start_cs = (start_ss + CS_OFFSET) % 8;
+		start_cs = (start_ss + CS_OFFSET) % UFRAMES_PER_FRAME;
 		last_cs = start_cs + cs_count - 1;
 		if (last_cs > 7)
 			return -ESCH_CS_OVERFLOW;
@@ -525,25 +625,149 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 
 	}
 
+	return 0;
+}
+
+/*
+ * when isoc-out transfers 188 bytes in a uframe, and send isoc/intr's
+ * ss token in the uframe, may cause 'bit stuff error' in downstream
+ * port;
+ * when isoc-out transfer less than 188 bytes in a uframe, shall send
+ * isoc-in's ss after isoc-out's ss (but hw can't ensure the sequence,
+ * so just avoid overlap).
+ */
+static int check_isoc_ss_overlap(struct mu3h_sch_ep_info *sch_ep, u32 offset)
+{
+	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
+	int base;
+	int i, j, k;
+
+	if (!tt)
+		return 0;
+
+	for (i = 0; i < sch_ep->num_esit; i++) {
+		base = offset + i * sch_ep->esit;
+
+		if (sch_ep->ep_type == ISOC_OUT_EP) {
+			for (j = 0; j < sch_ep->num_budget_microframes; j++) {
+				k = XHCI_MTK_BW_INDEX(base + j + CS_OFFSET);
+				/* use cs to indicate existence of in-ss @(base+j) */
+				if (tt->fs_bus_bw_in[k])
+					return -ESCH_SS_OVERLAP;
+			}
+		} else if (sch_ep->ep_type == ISOC_IN_EP || sch_ep->ep_type == INT_IN_EP) {
+			k = XHCI_MTK_BW_INDEX(base);
+			/* only check IN's ss */
+			if (tt->fs_bus_bw_out[k])
+				return -ESCH_SS_OVERLAP;
+		}
+	}
+
+	return 0;
+}
+
+static int check_sch_tt_budget(struct mu3h_sch_ep_info *sch_ep, u32 offset)
+{
+	int ret;
+
+	ret = check_ss_and_cs(sch_ep, offset);
+	if (ret)
+		return ret;
+
+	ret = check_isoc_ss_overlap(sch_ep, offset);
+	if (ret)
+		return ret;
+
 	return check_fs_bus_bw(sch_ep, offset);
 }
 
+/* allocate microframes in the ls/fs frame */
+static int alloc_sch_portion_of_frame(struct mu3h_sch_ep_info *sch_ep)
+{
+	struct mu3h_sch_bw_info *sch_bw = sch_ep->bw_info;
+	const u32 bw_boundary = get_bw_boundary(sch_ep->speed);
+	u32 bw_max, fs_bw_min;
+	u32 offset, offset_min;
+	u16 fs_bw;
+	int frames;
+	int i, j;
+	int ret;
+
+	frames = sch_ep->esit / UFRAMES_PER_FRAME;
+
+	for (i = 0; i < UFRAMES_PER_FRAME; i++) {
+		fs_bw_min = FS_PAYLOAD_MAX;
+		offset_min = XHCI_MTK_MAX_ESIT;
+
+		for (j = 0; j < frames; j++) {
+			offset = (i + j * UFRAMES_PER_FRAME) % sch_ep->esit;
+
+			ret = check_sch_tt_budget(sch_ep, offset);
+			if (ret)
+				continue;
+
+			/* check hs bw domain */
+			bw_max = get_max_bw(sch_bw, sch_ep, offset);
+			if (bw_max > bw_boundary) {
+				ret = -ESCH_BW_OVERFLOW;
+				continue;
+			}
+
+			/* use best-fit between frames */
+			fs_bw = get_fs_bw(sch_ep, offset);
+			if (fs_bw < fs_bw_min) {
+				fs_bw_min = fs_bw;
+				offset_min = offset;
+			}
+
+			if (!fs_bw_min)
+				break;
+		}
+
+		/* use first-fit between microframes in a frame */
+		if (offset_min < XHCI_MTK_MAX_ESIT)
+			break;
+	}
+
+	if (offset_min == XHCI_MTK_MAX_ESIT)
+		return -ESCH_BW_OVERFLOW;
+
+	sch_ep->offset = offset_min;
+
+	return 0;
+}
+
 static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
 {
 	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
+	u16 *fs_bus_bw;
 	u32 base;
-	int i, j, k;
+	int i, j, k, f;
 
+	if (sch_ep->ep_type == ISOC_OUT_EP || sch_ep->ep_type == INT_OUT_EP)
+		fs_bus_bw = tt->fs_bus_bw_out;
+	else
+		fs_bus_bw = tt->fs_bus_bw_in;
 
 	for (i = 0; i < sch_ep->num_esit; i++) {
 		base = sch_ep->offset + i * sch_ep->esit;
 
 		for (j = 0; j < sch_ep->num_budget_microframes; j++) {
 			k = XHCI_MTK_BW_INDEX(base + j);
-			if (used)
-				tt->fs_bus_bw[k] += (u16)sch_ep->bw_budget_table[j];
-			else
-				tt->fs_bus_bw[k] -= (u16)sch_ep->bw_budget_table[j];
+			f = k / UFRAMES_PER_FRAME;
+			if (used) {
+				if (sch_ep->speed == USB_SPEED_LOW)
+					tt->ls_bus_bw[k] += (u8)sch_ep->bw_budget_table[j];
+
+				fs_bus_bw[k] += (u16)sch_ep->bw_budget_table[j];
+				tt->fs_frame_bw[f] += (u16)sch_ep->bw_budget_table[j];
+			} else {
+				if (sch_ep->speed == USB_SPEED_LOW)
+					tt->ls_bus_bw[k] -= (u8)sch_ep->bw_budget_table[j];
+
+				fs_bus_bw[k] -= (u16)sch_ep->bw_budget_table[j];
+				tt->fs_frame_bw[f] -= (u16)sch_ep->bw_budget_table[j];
+			}
 		}
 	}
 
@@ -566,7 +790,8 @@ static int load_ep_bw(struct mu3h_sch_bw_info *sch_bw,
 	return 0;
 }
 
-static int check_sch_bw(struct mu3h_sch_ep_info *sch_ep)
+/* allocate microframes for hs/ss/ssp */
+static int alloc_sch_microframes(struct mu3h_sch_ep_info *sch_ep)
 {
 	struct mu3h_sch_bw_info *sch_bw = sch_ep->bw_info;
 	const u32 bw_boundary = get_bw_boundary(sch_ep->speed);
@@ -574,16 +799,12 @@ static int check_sch_bw(struct mu3h_sch_ep_info *sch_ep)
 	u32 worst_bw;
 	u32 min_bw = ~0;
 	int min_index = -1;
-	int ret = 0;
 
 	/*
 	 * Search through all possible schedule microframes.
 	 * and find a microframe where its worst bandwidth is minimum.
 	 */
 	for (offset = 0; offset < sch_ep->esit; offset++) {
-		ret = check_sch_tt(sch_ep, offset);
-		if (ret)
-			continue;
 
 		worst_bw = get_max_bw(sch_bw, sch_ep, offset);
 		if (worst_bw > bw_boundary)
@@ -593,21 +814,29 @@ static int check_sch_bw(struct mu3h_sch_ep_info *sch_ep)
 			min_bw = worst_bw;
 			min_index = offset;
 		}
-
-		/* use first-fit for LS/FS */
-		if (sch_ep->sch_tt && min_index >= 0)
-			break;
-
-		if (min_bw == 0)
-			break;
 	}
 
 	if (min_index < 0)
-		return ret ? ret : -ESCH_BW_OVERFLOW;
+		return -ESCH_BW_OVERFLOW;
 
 	sch_ep->offset = min_index;
 
-	return load_ep_bw(sch_bw, sch_ep, true);
+	return 0;
+}
+
+static int check_sch_bw(struct mu3h_sch_ep_info *sch_ep)
+{
+	int ret;
+
+	if (sch_ep->sch_tt)
+		ret = alloc_sch_portion_of_frame(sch_ep);
+	else
+		ret = alloc_sch_microframes(sch_ep);
+
+	if (ret)
+		return ret;
+
+	return load_ep_bw(sch_ep->bw_info, sch_ep, true);
 }
 
 static void destroy_sch_ep(struct xhci_hcd_mtk *mtk, struct usb_device *udev,
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index ef8af20b5e88..865b55e23b15 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -30,12 +30,21 @@
 #define XHCI_MTK_MAX_ESIT	(1 << 6)
 #define XHCI_MTK_BW_INDEX(x)	((x) & (XHCI_MTK_MAX_ESIT - 1))
 
+#define UFRAMES_PER_FRAME	8
+#define XHCI_MTK_FRAMES_CNT	(XHCI_MTK_MAX_ESIT / UFRAMES_PER_FRAME)
+
 /**
- * @fs_bus_bw: array to keep track of bandwidth already used for FS
+ * @fs_bus_bw_out: save bandwidth used by FS/LS OUT eps in each uframes
+ * @fs_bus_bw_in: save bandwidth used by FS/LS IN eps in each uframes
+ * @ls_bus_bw: save bandwidth used by LS eps in each uframes
+ * @fs_frame_bw: save bandwidth used by FS/LS eps in each FS frames
  * @ep_list: Endpoints using this TT
  */
 struct mu3h_sch_tt {
-	u32 fs_bus_bw[XHCI_MTK_MAX_ESIT];
+	u16 fs_bus_bw_out[XHCI_MTK_MAX_ESIT];
+	u16 fs_bus_bw_in[XHCI_MTK_MAX_ESIT];
+	u8 ls_bus_bw[XHCI_MTK_MAX_ESIT];
+	u16 fs_frame_bw[XHCI_MTK_FRAMES_CNT];
 	struct list_head ep_list;
 };
 
-- 
2.18.0

