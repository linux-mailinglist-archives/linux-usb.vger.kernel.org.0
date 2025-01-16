Return-Path: <linux-usb+bounces-19404-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B54A13A38
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 13:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F3833A7BED
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 12:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F1B1DED56;
	Thu, 16 Jan 2025 12:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="f302/3y+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7411DED40;
	Thu, 16 Jan 2025 12:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737031924; cv=none; b=U8+ryqRgSMBglJGmChtDy0N1d2zJKOWaXf5Qufsa7LdS1N/RKRrg8p+2YVaPw7O5IYVVHYn/GDa4lC8Q0GgyDEwjP+RfUo/+YmXLIZWBLW405wbWkPrDCoS07xAJBt/RP0iDnc2MZNk4WJO6xYTgi4qhYvl19frNbtz0KVPXk/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737031924; c=relaxed/simple;
	bh=v5laMh0gjEOKAnXQzO0bHV/PXWNmD49X03E2+MPkDzM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=s4SqLlphchEFFva83ISgyW7uE3cE8hkufW8ce+wYeiRH0fJaXvO6BgKY6EWdrNN+T8fSXBZDc9VNBbCOc4zh8NSwvhfQxFuKBFIyy+CdsJTaA97LVKsrfBqIIgL+ZByDcA729FddhcC3FSTQM6vhl2BX2FB+hTwAGxLkhc91Jvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=f302/3y+; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: a6e10b26d40811efbd192953cf12861f-20250116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=F1fKyQy/cFaLxw+/Fu4T05W5G/OWq4qpRxkiUE1pqFA=;
	b=f302/3y+Ij9Pb6eRXr0AMAwikIFjPQfGDHwOaKj9+3wUw/dOgPKbVOraWq7brDmk+739Akeegnzbl/N/EC+s2GWvfQ7WaYuJa6/2woj+R7+ASbaYvekqW2R4m6yAmPNnII6qZocsoZYSzkLSDYXA0qfvSjfVfsJtHR7OxRdC+mE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:b9577e59-9a11-4b72-a73c-e40924573cb7,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:60aa074,CLOUDID:db4d2485-0f10-4f52-bb41-91703793d3e4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a6e10b26d40811efbd192953cf12861f-20250116
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1932707511; Thu, 16 Jan 2025 20:51:49 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 16 Jan 2025 20:51:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 16 Jan 2025 20:51:47 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>
Subject: [PATCH] usb: host: xhci-plat: add support compatible ID PNP0D15
Date: Thu, 16 Jan 2025 20:51:41 +0800
Message-ID: <20250116125141.25856-1-chunfeng.yun@mediatek.com>
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

Add support compatible ID PNP0D15 which declare that the xHCI
controller doesn't support standard debug capability.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-plat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index e6c9006bd568..248a34fbeb14 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -566,6 +566,7 @@ EXPORT_SYMBOL_GPL(xhci_plat_pm_ops);
 static const struct acpi_device_id usb_xhci_acpi_match[] = {
 	/* XHCI-compliant USB Controller */
 	{ "PNP0D10", },
+	{ "PNP0D15", },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, usb_xhci_acpi_match);
-- 
2.46.0


