Return-Path: <linux-usb+bounces-4102-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBB7810A6A
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 07:36:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FA781C20B1D
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 06:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1F712B81;
	Wed, 13 Dec 2023 06:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LC4YDiav"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4910FE3;
	Tue, 12 Dec 2023 22:35:57 -0800 (PST)
X-UUID: da7b963a998111eeba30773df0976c77-20231213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wT6L12FQNaWx6Rm0cYBfdK4wwQwZV9ZOJPOa++K3K/g=;
	b=LC4YDiav+nghYdp1mi1zHiGBfiZNPHmfD6QTGeBA4SAH6H4nl5m9tdg47hH2v1tVDkvVuIUOhuiJHCYqfc3NQnG0T1FCi1YSi+dfOmXS8Ch9bLGkkUYriNqYCuzjnzVZsqxEZA1DHrV6IS1T5vBWSOnHWg6e+p3ctL12e8wIByA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:7479b175-1874-48ca-af8a-25a4e4329f16,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:5f6e1ebd-2ac7-4da2-9f94-677a477649d9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: da7b963a998111eeba30773df0976c77-20231213
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 334278013; Wed, 13 Dec 2023 14:35:49 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 13 Dec 2023 14:35:47 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 13 Dec 2023 14:35:46 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mathias Nyman
	<mathias.nyman@intel.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Macpaul Lin
	<macpaul.lin@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8195: Add mediatek,rxfifo-depth to cherry
Date: Wed, 13 Dec 2023 14:35:43 +0800
Message-ID: <20231213063543.12435-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231213063543.12435-1-chunfeng.yun@mediatek.com>
References: <20231213063543.12435-1-chunfeng.yun@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.493100-8.000000
X-TMASE-MatchedRID: 6pbNFWS8cDvREKzvS64+oUAoPtuOD8baBdebOqawiLsUta+LQgEZMA4D
	QawrW+a/bhd2wSXB2al2ke9pVPnlKW94Ipa1otxo98sqn8kK3uF9LQinZ4QefOYQ3zcXToXr+gt
	Hj7OwNO2OhzOa6g8KrdEifc9nolYfTA0OZlrhcEd8tH5vvpYSxTzEkZW7fanljQJquhmJPATW0/
	74iSYj85QfOBeKyB45Yu4o39ob+Xo7BmSr5gys2eLDq7G+Ik/yv22xKJRyIGVDnOxozmpp1r+Wv
	XJiKHRLMw/B2eF7ydmUTGVAhB5EbQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.493100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7076D785627DCAEAF457C7A3EF026C5B2281C7455469107C4ADE47F566AFBC692000:8
X-MTK: N

Add the quirk property "mediatek,rxfifo-depth" to work around Gen1 isoc-in
transfer issue which send out unexpected ACK even after device already
finished the burst transfer with a short patcket, specially for a 4K
camera device.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index dd5b89b73190..2f2133931846 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1185,6 +1185,7 @@ &xhci0 {
 
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	vbus-supply = <&usb_vbus>;
+	mediatek,rxfifo-depth;
 };
 
 &xhci1 {
@@ -1192,6 +1193,7 @@ &xhci1 {
 
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	vbus-supply = <&usb_vbus>;
+	mediatek,rxfifo-depth;
 };
 
 &xhci2 {
-- 
2.25.1


