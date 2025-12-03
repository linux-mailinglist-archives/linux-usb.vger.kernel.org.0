Return-Path: <linux-usb+bounces-31118-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D5AC9D81B
	for <lists+linux-usb@lfdr.de>; Wed, 03 Dec 2025 02:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7F273A873C
	for <lists+linux-usb@lfdr.de>; Wed,  3 Dec 2025 01:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E54B22D7B5;
	Wed,  3 Dec 2025 01:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="omxm5Ibs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B695E21ADA7;
	Wed,  3 Dec 2025 01:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764725755; cv=none; b=LhZY4jR/5cwlT+g8lhfZYvBwDXFyB8fsnkToNIiY+BZ60bKmDnjrsxGaJzPgGqU8I0jedQk5iYkBjypAZLZq+LRz85xl7gJA4AQliO4bOBJHAKw5JObvCC2+cDbRFPS08WlcF4mY875Im+1QQWxgAGdqck6MtYBhjH1GG310gik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764725755; c=relaxed/simple;
	bh=qPifGEbWXqz3abMRJjR2zImBvQvH6gmQ0cmH5vJ9DTE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eyYjyE3fcUgyxuwMLtS84TWwfixc4N2oh0Woo/uNPLN0ugDB6GB4WuXUBB/H/yJTb8V1Rt+UgLbwY/wpK5OKLoYqfR3pPCoNtB6L+qvWTh9qMrVn/2gqQ5LyhnnimW0Nx9Cb6rfkwirZjG0QeK8Oy4pSUSyDVL3bwYS0M6aPcDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=omxm5Ibs; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 61bca762cfe811f0b33aeb1e7f16c2b6-20251203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=akNpouvmuxWGyea2eYHQtYaML0UvO0Ocaga8OlPp7/Q=;
	b=omxm5IbsD3qBuDEJY272C3VIlDqZCYCtjDoylcTFxbYv4A6rb1O47QwkkN+AgsALWnvA3F/JuvVnoQh3aUj/9PYYhekTYX0I4oqttzQOdDxDhHqAJxzXd1c0j9vjGqPTa3b+1nvAMwFV1cBWXPEb5r9mKSdT5OKTWghsfJMSYq8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:34368261-496e-4466-a538-7727e646020d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:71b8c1a9-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 61bca762cfe811f0b33aeb1e7f16c2b6-20251203
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <mingjin.ge@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 653593021; Wed, 03 Dec 2025 09:35:42 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 3 Dec 2025 09:35:41 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 3 Dec 2025 09:35:41 +0800
From: Mingjin Ge <mingjin.ge@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Mingjin Ge <mingjin.ge@mediatek.com>
Subject: [PATCH 1/1] usb: mtk-xhci: add support remote wakeup of mt8189
Date: Wed, 3 Dec 2025 09:34:50 +0800
Message-ID: <20251203013521.2038888-2-mingjin.ge@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251203013521.2038888-1-mingjin.ge@mediatek.com>
References: <20251203013521.2038888-1-mingjin.ge@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add remote wakeup configuration for the mt8189 in xhci-mtk driver.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Signed-off-by: Mingjin Ge <mingjin.ge@mediatek.com>
---
 drivers/usb/host/xhci-mtk.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 8da05e9dfa28..134a46907db5 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -96,6 +96,10 @@
 #define WC0_IS_P	BIT(12)	/* polarity */
 #define WC0_IS_EN	BIT(6)
 
+/* mt8189*/
+#define PERI_WK_CTRL0_8189	0x0
+#define WC0_IS_EN_P_89		BIT(18)
+
 /* mt8192 */
 #define WC0_SSUSB0_CDEN		BIT(6)
 #define WC0_IS_SPM_EN		BIT(1)
@@ -140,6 +144,7 @@ enum ssusb_uwk_vers {
 	SSUSB_UWK_V1_7,		/* mt8196 IP0 */
 	SSUSB_UWK_V1_8,		/* mt8196 IP1 */
 	SSUSB_UWK_V1_9,		/* mt8196 IP2 */
+	SSUSB_UWK_V1_10,	/* mt8189 IP all */
 };
 
 /*
@@ -407,6 +412,11 @@ static void usb_wakeup_ip_sleep_set(struct xhci_hcd_mtk *mtk, bool enable)
 		msk = WC1_IS_EN_P2_96;
 		val = enable ? msk : 0;
 		break;
+	case SSUSB_UWK_V1_10:
+		reg = mtk->uwk_reg_base + PERI_WK_CTRL0_8189;
+		msk = WC0_IS_EN_P_89;
+		val = enable ? msk : 0;
+		break;
 	case SSUSB_UWK_V2:
 		reg = mtk->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
 		msk = SSC_IP_SLEEP_EN | SSC_SPM_INT_EN;
-- 
2.45.2


