Return-Path: <linux-usb+bounces-31117-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7F6C9D815
	for <lists+linux-usb@lfdr.de>; Wed, 03 Dec 2025 02:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E3F3F34AE24
	for <lists+linux-usb@lfdr.de>; Wed,  3 Dec 2025 01:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997A9226CF7;
	Wed,  3 Dec 2025 01:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="THhyfwgb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D2921ADA7;
	Wed,  3 Dec 2025 01:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764725737; cv=none; b=m19kyX2HYjzzcZp745kbtCBgTt8/j3lZCsECTcf1mUwsVgmChVmFAvaro8seIslJH61nFC55/96REHHYhJRDjFrQctIIQwgb7dNNec4aKayq1yeCyPbgnkD0R8JBzVUBr9pO7sbxC9JEdF2oe0a9MXY2vTOKKT9F6OYb5aBLke0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764725737; c=relaxed/simple;
	bh=DRK2TmseIckZ0ih72RQOHGhvDpI304WQAJgqg97+DK0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LoSY9xJq3V9UfZHlmvSliiIQ3UuwOVhcIIZURbrDFI6RM01ep9fY1DrBLyVcpmJ6qUzD0dD6M378waM/k2TdrfAr5HyajaJzCWO1oAer2+FLxSRvr5IXcZbB18O0OgVGIOqj7y3dTWd9LRMqlV62jLsie2KFE9btnT7GqQo2Ywo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=THhyfwgb; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 58b22afccfe811f0b2bf0b349165d6e0-20251203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=HPYfASO2JEwDfZ2TFadZRQFA8PMGaUrnYLkRlqeqMwc=;
	b=THhyfwgbvu5GyaRqJ9NlwLUwgr8u/j/Aets8s+3VnCa5cTKBRN2hrNPAwOH66L9biCvfgHHOPuEreYCtyqhkwo4YK5AH+GU4dQc8HlAo+39HYqF3Ov5IbNQynNLQSaTmvIqSCK7sQHHj4pVFGH/8lJMeDGpOkB79IBK+IjzhdRQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:18bbee3c-e9de-4bcc-aa05-7793ab844249,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:a4b05502-1fa9-44eb-b231-4afc61466396,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|102|817|836|888|898,TC:-5,Content
	:-10|-8|-5|14|50,EDM:-3,IP:nil,URL:0,File:130,RT:-1,Bulk:nil,QS:nil,BEC:ni
	l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 58b22afccfe811f0b2bf0b349165d6e0-20251203
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <mingjin.ge@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1796488780; Wed, 03 Dec 2025 09:35:27 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 3 Dec 2025 09:35:25 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 3 Dec 2025 09:35:25 +0800
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
Subject: [PATCH 0/1] add support remote wakeup of mt8189
Date: Wed, 3 Dec 2025 09:34:49 +0800
Message-ID: <20251203013521.2038888-1-mingjin.ge@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

> This series is based on linux-next, tag: next-20251201.
> 
> Changes in v1:
> There are five USB controllers on mt8189,
> each controller's wakeup control is the same.
> Add a new specific version for them.

Mingjin Ge (1):
  usb: mtk-xhci: add support remote wakeup of mt8189

 drivers/usb/host/xhci-mtk.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.45.2


