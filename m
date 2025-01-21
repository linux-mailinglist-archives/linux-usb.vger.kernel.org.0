Return-Path: <linux-usb+bounces-19564-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF936A1807C
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 15:52:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8561A7A4D7C
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 14:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B541F4E55;
	Tue, 21 Jan 2025 14:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="j51aJDNX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AA21F3FF4;
	Tue, 21 Jan 2025 14:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737471032; cv=none; b=BkWitm9aVLM+VlTC7axn53ujmfubZ6VZUzkabHGnjkyL36d6grCXkFW7mWzsgCRUbs8nMNwHuGdi5SbHGqT8RzCtj//ozMC+HD6jC0hIVjseGrSYN+JozkOSKyT++b/glvD/aiHwG9PrHjQVD56gMqmL6HT9ZaDdN5aU0xUtSJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737471032; c=relaxed/simple;
	bh=SaborgKAZFRe+7oce5sucsfA+cmb+ADRiGukIZIgxNk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=af4SyaFCtmpFfisN0mLIpWwJeXjwMwgeBia3eFC03CU4/5RfdIOQnvnhywfTgMklQHhOHn4ErJVTP/RMxoaV+LAiav53FabezSiCl6IxuJBpniFitUD2AqqjLa7+GjKUbMnv2glS7qRZN0Qu16d1LKWIhJRvhg8MkmtVRyevxTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=j51aJDNX; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 0ab5b4bad80711ef99858b75a2457dd9-20250121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sJC2wcDTAclKhIOa1ToaJ+Xh1voHR2PxPljq1LT1sxE=;
	b=j51aJDNXHu+ptfs2/iwXuB3ofSQ/j/ynR0eIiiaUg9FZo6y91TrYdtZh8XUJ6po2Yy0D/Go7+IFU7bbF84QLQIcHpEvPSlZFeX5scfeejQJOPBeqvWdAPW73bKi6slsr4RxDw66yRXy1/H2Pj/zGLuvdFnuNWBSHIM3T63UFyb0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:a8b7b18b-1889-4239-bf91-d82d24255dd9,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:60aa074,CLOUDID:bb543e0f-078a-483b-8929-714244d25c49,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 0ab5b4bad80711ef99858b75a2457dd9-20250121
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1003085179; Tue, 21 Jan 2025 22:50:22 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 21 Jan 2025 22:50:21 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 21 Jan 2025 22:50:20 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/4] usb: mtk-xhci: add support remote wakeup of mt8196
Date: Tue, 21 Jan 2025 22:50:07 +0800
Message-ID: <20250121145008.22936-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250121145008.22936-1-chunfeng.yun@mediatek.com>
References: <20250121145008.22936-1-chunfeng.yun@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

There are three USB controllers on mt8196, each controller's wakeup
control is different, add some specific versions for them.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: modify marcos name
---
 drivers/usb/host/xhci-mtk.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 904831344440..3f8e37b25322 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -113,6 +113,14 @@
 #define WC1_IS_P_95		BIT(12)
 #define WC1_IS_EN_P0_95		BIT(6)
 
+/* mt8196 */
+#define PERI_WK_CTRL0_8196	0x08
+#define WC0_IS_EN_P0_96		BIT(0)
+#define WC0_IS_EN_P1_96		BIT(7)
+
+#define PERI_WK_CTRL1_8196	0x10
+#define WC1_IS_EN_P2_96		BIT(0)
+
 /* mt2712 etc */
 #define PERI_SSUSB_SPM_CTRL	0x0
 #define SSC_IP_SLEEP_EN	BIT(4)
@@ -129,6 +137,9 @@ enum ssusb_uwk_vers {
 	SSUSB_UWK_V1_4,		/* mt8195 IP1 */
 	SSUSB_UWK_V1_5,		/* mt8195 IP2 */
 	SSUSB_UWK_V1_6,		/* mt8195 IP3 */
+	SSUSB_UWK_V1_7,		/* mt8196 IP0 */
+	SSUSB_UWK_V1_8,		/* mt8196 IP1 */
+	SSUSB_UWK_V1_9,		/* mt8196 IP2 */
 };
 
 /*
@@ -381,6 +392,21 @@ static void usb_wakeup_ip_sleep_set(struct xhci_hcd_mtk *mtk, bool enable)
 		msk = WC0_IS_EN_P3_95 | WC0_IS_C_95(0x7) | WC0_IS_P_95;
 		val = enable ? (WC0_IS_EN_P3_95 | WC0_IS_C_95(0x1)) : 0;
 		break;
+	case SSUSB_UWK_V1_7:
+		reg = mtk->uwk_reg_base + PERI_WK_CTRL0_8196;
+		msk = WC0_IS_EN_P0_96;
+		val = enable ? msk : 0;
+		break;
+	case SSUSB_UWK_V1_8:
+		reg = mtk->uwk_reg_base + PERI_WK_CTRL0_8196;
+		msk = WC0_IS_EN_P1_96;
+		val = enable ? msk : 0;
+		break;
+	case SSUSB_UWK_V1_9:
+		reg = mtk->uwk_reg_base + PERI_WK_CTRL1_8196;
+		msk = WC1_IS_EN_P2_96;
+		val = enable ? msk : 0;
+		break;
 	case SSUSB_UWK_V2:
 		reg = mtk->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
 		msk = SSC_IP_SLEEP_EN | SSC_SPM_INT_EN;
-- 
2.46.0


