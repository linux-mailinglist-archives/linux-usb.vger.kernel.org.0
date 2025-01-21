Return-Path: <linux-usb+bounces-19563-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5673A18073
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 15:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 319E7164494
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 14:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242E91F4E47;
	Tue, 21 Jan 2025 14:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aG9mkTjb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C3A1F37D1;
	Tue, 21 Jan 2025 14:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737471032; cv=none; b=Rdf9fy4Om8bBV1l34/A8H8n6X0B9H+T4/lyKSWMGI2csAnmmGq60raNDzT/zKOATHH2MKHlsj9CCKNpPJYFpfMEx/NmnBjqa+61s13pIcgIq1CA+nl0UJDGVt5AtGk764aMHwNZFGIDNaRvfGW+EVmsFEd27OeaetrteBGETNP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737471032; c=relaxed/simple;
	bh=ZLnMpdUl8NcY5kgzTuqtk8Z491b642rZj8JClq7C37k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Et9klYzFDXfcX1Xn6ipw0kVrnchT7sjwx+yv9PZMlZe+siXnvFzZiJg6ffTcKiiWQnVaO4FjlEOjj3Dq34TKw8E6IlrGR3ZxGqBl0AuGVwuaevhRCM4OxVGoR3CprTdMbt30xGqSW4OdDsCgvAN6GJn5+vh6SEGQfdbPaxjQKgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=aG9mkTjb; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 09c1eb64d80711efbd192953cf12861f-20250121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ddRp4IKh0ObprFE1vqoDa9K2zIlik7OZ3G9EpYAp4ek=;
	b=aG9mkTjbKrxDaaYIHW1tn5+BP1UszMbBuVMakXb16mMx7u/zx+JRGVX4sxLNnf2ZFlyMnuBiV/89ZQpvR7vQ2XnogAV5EqTtHEm82joE4UnupuxR3dF1pZ43LUJdo1rI+eEKJGoIraT3knRNpj4tlt5+D2ZwCr2eH9KhRbHyZhY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:075a14ad-94d3-4264-9bef-a6a5051c8c30,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:60aa074,CLOUDID:af543e0f-078a-483b-8929-714244d25c49,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 09c1eb64d80711efbd192953cf12861f-20250121
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 909434500; Tue, 21 Jan 2025 22:50:21 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 21 Jan 2025 22:50:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 21 Jan 2025 22:50:19 +0800
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
Subject: [PATCH v2 1/4] dt-bindings: usb: mtk-xhci: add support mt8196
Date: Tue, 21 Jan 2025 22:50:05 +0800
Message-ID: <20250121145008.22936-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.46.0
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
control is different, add some specific versions for them, and add
a new compatilbe for mt8196.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml          | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index ef3143f4b794..cacb3d3dc4ac 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -36,6 +36,7 @@ properties:
           - mediatek,mt8188-xhci
           - mediatek,mt8192-xhci
           - mediatek,mt8195-xhci
+          - mediatek,mt8196-xhci
           - mediatek,mt8365-xhci
       - const: mediatek,mtk-xhci
 
@@ -164,7 +165,10 @@ properties:
             104 - used by mt8195, IP1, specific 1.04;
             105 - used by mt8195, IP2, specific 1.05;
             106 - used by mt8195, IP3, specific 1.06;
-          enum: [1, 2, 101, 102, 103, 104, 105, 106]
+            107 - used by mt8196, IP0, specific 1.07;
+            108 - used by mt8196, IP1, specific 1.08;
+            109 - used by mt8196, IP2, specific 1.09;
+          enum: [1, 2, 101, 102, 103, 104, 105, 106, 107, 108, 109]
 
   mediatek,u3p-dis-msk:
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.46.0


