Return-Path: <linux-usb+bounces-29612-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8417CC05268
	for <lists+linux-usb@lfdr.de>; Fri, 24 Oct 2025 10:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE2B21896575
	for <lists+linux-usb@lfdr.de>; Fri, 24 Oct 2025 08:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0CC305E3B;
	Fri, 24 Oct 2025 08:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OnXWkd2L"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48C6303A29
	for <linux-usb@vger.kernel.org>; Fri, 24 Oct 2025 08:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761295584; cv=none; b=LokUeNSr46o8I+QuxiYruilxpzgUWsqh0vkHfvg/JIRHsjIxfMnq/7+WazyyOfTZQMBfCyAj3voyvhkgluFeHKYDh5WEo64c8Vg9xg3jPKOUvdbPEXltVt3cG9OFgyA6fPO8niNwflUQq2XHcYsAMPgTRgTGcreNQlkYHpqwDt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761295584; c=relaxed/simple;
	bh=ayhlzx/vDW7RzSzImPHDdqt7SJ15b+qd1tcUvLLy7cg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=DsC7WeHRqUQqEyPepFtdV8M8Sy5bb0uoL0AJEsjfd6GosnM/scvDSMh8OE2InA2SASGRcDJ2tiMBy71n9lUawhWyqIQCWx5fa3BmSQxjV7VNymWj4JQtkExrN4+88cnjaFWFBAyWrZrac9fbFOiS018fzcmXffObyhIO9D4blZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=OnXWkd2L; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251024084619epoutp03135ea73716f92dc45570742ef488f38b~xYP98KLpQ2301723017epoutp03j
	for <linux-usb@vger.kernel.org>; Fri, 24 Oct 2025 08:46:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251024084619epoutp03135ea73716f92dc45570742ef488f38b~xYP98KLpQ2301723017epoutp03j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761295579;
	bh=Y9f4xNgwsSogW30q4hGrX3EKPf7RBNjTePBnXDJDViI=;
	h=From:To:Cc:Subject:Date:References:From;
	b=OnXWkd2L8fwLtzSYnluWuRewH6YvCKPJvJLL6PK8EveokejWkbFh2YQ9URBTdFN9w
	 QP0CAE6ss25e5eYUHzv5nNPZr548g9JZTFHEoLE5VE3+7VcC8Gi3quS3F4GfdUPcfJ
	 K3JGoG6Uub/Y8mYy589sPWfOq3/bKYK/AueNx1k0=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20251024084619epcas5p206e9a5ca00598de80e973089374948ef~xYP9lnHAh1747217472epcas5p2B;
	Fri, 24 Oct 2025 08:46:19 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.94]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ctGhp2HR2z6B9mB; Fri, 24 Oct
	2025 08:46:18 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20251024084617epcas5p362dde79d9729000cf3345a68db1157ce~xYP8NSx2w2243422434epcas5p3e;
	Fri, 24 Oct 2025 08:46:17 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251024084615epsmtip2459e38e9dd0d72cccc6bc8363fdb4920~xYP56A_0N2244222442epsmtip20;
	Fri, 24 Oct 2025 08:46:14 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com, Pritam Manohar Sutar
	<pritam.sutar@samsung.com>
Subject: [PATCH v2] usb: dwc3: Allow usb role swich control from userspace
Date: Fri, 24 Oct 2025 14:24:55 +0530
Message-Id: <20251024085455.789555-1-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251024084617epcas5p362dde79d9729000cf3345a68db1157ce
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251024084617epcas5p362dde79d9729000cf3345a68db1157ce
References: <CGME20251024084617epcas5p362dde79d9729000cf3345a68db1157ce@epcas5p3.samsung.com>

There is a possibility of user needs for USB mode switching on boards
that lack external hardware support for dynamic host/device role
detection. This is particularly relevant in automotive applications
where userspace applications need to switch USB roles (host to device)
at runtime for CarPlay/Android Auto integration.

Add an `allow_userspace_control` flag to handle such cases. When
enabled, it exposes a sysfs attribute that allows userspace to switch
the USB role manually between host and device. This provides flexibility
for platforms that cannot rely on hardware-based mode detection.

The role switch can be done as below
echo host > /sys/class/usb_role/<ADDR>.usb-role-switch/role
echo device > /sys/class/usb_role/<ADDR>.usb-role-switch/role

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
Changes in v2:
  - updated commit message by mentioning usecase for this change.
  - added 'Acked-by' tag
  Link for v1: https://lore.kernel.org/linux-usb/20251020113723.553843-1-pritam.sutar@samsung.com/

 drivers/usb/dwc3/drd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 4c91240eb429..589bbeb27454 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -515,6 +515,7 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 	dwc3_role_switch.set = dwc3_usb_role_switch_set;
 	dwc3_role_switch.get = dwc3_usb_role_switch_get;
 	dwc3_role_switch.driver_data = dwc;
+	dwc3_role_switch.allow_userspace_control = true;
 	dwc->role_sw = usb_role_switch_register(dwc->dev, &dwc3_role_switch);
 	if (IS_ERR(dwc->role_sw))
 		return PTR_ERR(dwc->role_sw);
--
2.34.1


