Return-Path: <linux-usb+bounces-29460-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEF8BF0D68
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 13:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 06BD74F3D91
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 11:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67CDA2FE596;
	Mon, 20 Oct 2025 11:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="KD88SiSC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AE22FCBF5
	for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 11:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760959726; cv=none; b=mTUYxDcPSUizYVJwrTBmj+23ImTYrD+wRy8UOPKMkNdjvaBUkukvMsYbQdALpvEQ/bvYbT5NSuKbSGkAI0sPem60s2m6O/YPCnYIuq55EdAOEC6yk86fi9ihwcTqvoifhpF+JYMXh9Beypntk2AJu4R+KUJmppEkM5n/rjJfjg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760959726; c=relaxed/simple;
	bh=2Y3zHvVYYIYQnqesMghSGh2XAgx9XoH6mHeizRVZVBg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=WQ3FQTJ/i1Rzk+EX++5bvRJvrop7ZsQGhoSHRnlaNHnLcOLgNtS+m+gYUjGgzHmzlMlPnSNNWzdL8gQV4bquazcNDMC1s3kcgNJUiL+q951J9vC5C1/7ZypaZi+kuGvA+j6CgyGjMY7eX9/Y5gCwMa2X6Hu7P5iL9JN5PBKvtyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=KD88SiSC; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251020112842epoutp022404410144c26f311c18138f512cefcb~wL4mY6aV91405214052epoutp028
	for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 11:28:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251020112842epoutp022404410144c26f311c18138f512cefcb~wL4mY6aV91405214052epoutp028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760959722;
	bh=d99WqiMlUBdTn6PeQ7Q3ge6pHf5Tl/n9lfXTYKrLsvU=;
	h=From:To:Cc:Subject:Date:References:From;
	b=KD88SiSCoV3S38aXH9Bg4ihl0vpPz4M7B1iRxbzMFbcOhpunGfgqY+zYPEb8FZddz
	 lAufT55YPYHWPR0J8KVpusiVJE4lEn3fJlZDhBdvpph/ct8K9E5+OU4LU60bAP1whr
	 T5JRHU7X/DcbhocbOyDbm89Dom0wfBOJxV5m0YJ4=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20251020112841epcas5p1a97db509a86daa8f3f9a5963dd333458~wL4lygz6T2814728147epcas5p14;
	Mon, 20 Oct 2025 11:28:41 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.94]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cqtV06lXrz6B9m5; Mon, 20 Oct
	2025 11:28:40 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20251020112840epcas5p28d8eded5200f096e7b80f71899371f2c~wL4kUxNyC0411004110epcas5p2S;
	Mon, 20 Oct 2025 11:28:40 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251020112838epsmtip26e0c8e69e04935bcd5cc27809ad2cd82~wL4ir1jis2749127491epsmtip2Q;
	Mon, 20 Oct 2025 11:28:38 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com, Pritam Manohar Sutar
	<pritam.sutar@samsung.com>
Subject: [PATCH] usb: dwc3: Allow usb role swich control from userspace
Date: Mon, 20 Oct 2025 17:07:23 +0530
Message-Id: <20251020113723.553843-1-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251020112840epcas5p28d8eded5200f096e7b80f71899371f2c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251020112840epcas5p28d8eded5200f096e7b80f71899371f2c
References: <CGME20251020112840epcas5p28d8eded5200f096e7b80f71899371f2c@epcas5p2.samsung.com>

There is a possibility of user needs for USB mode switching on boards
that lack external hardware support for dynamic host/device role
detection.

Add an `allow_userspace_control` flag to handle such cases. When
enabled, it exposes a sysfs attribute that allows userspace to switch
the USB role manually between host and device. This provides flexibility
for platforms that cannot rely on hardware-based mode detection.

The role switch can be done as below
echo host > /sys/class/usb_role/<ADDR>.usb-role-switch/role
echo device > /sys/class/usb_role/<ADDR>.usb-role-switch/role

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
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


