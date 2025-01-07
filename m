Return-Path: <linux-usb+bounces-19071-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D49A8A040FD
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 14:39:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04AC97A05AF
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 13:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04541F0E2E;
	Tue,  7 Jan 2025 13:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="GoCmkDYV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCBB273FD
	for <linux-usb@vger.kernel.org>; Tue,  7 Jan 2025 13:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736257167; cv=none; b=tdH2c8wV8iDtGSGAOx5H01hn2hGWMFA9+O/WntNywlq4GiXqHb7nY/CJdzI8njM9Lt0nqGAxnelDWAJf2G4ICsyN+42NY5ZoPJcLAffoCJxlTZpeQMrqq+LM3h1FUfdk7z21zXC30O24HGdr7SQ+6GqYdTzRUj5+92DQAJuApbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736257167; c=relaxed/simple;
	bh=anR295dsYLaPZMGJqRadGXRXwUp8EaI7n9P8OHjUspA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SwKaFx9WgjDOQpfFCS10bHMMvbsECYuedQh3Trr4L6A2QbOhv2IOk7OcW50iGfJBqb+1PLM5YJaTArlE2hy13BxwG78+N64kLwKt7iDOeRp6EVU/rlulDEtNo4V5+vW/WF01+/6tOUqrOPiqGk0sG/SeeN7ajf49GWLxerhJEKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=GoCmkDYV; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1736257152;
	bh=Jwz9VBmRlX+Is2NqzUvb2PX5ziUNiqVFpfw8i6EXWf0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=GoCmkDYVVMcjpA4dAfT0V0Jo/1FooaYOAo1gd5gD7doN8xy+yinRreK7vT1KCogWU
	 ruTH/njcAqopOAhY73ejoo331/l03YwwIvqXa45ixhurU6iFjAcssDUxCXnLXoKmPe
	 SI8cAbanon2SUVA73I7YtysptHKMsT6bO2YOsN/k=
X-QQ-mid: bizesmtpip4t1736257142tuu34xk
X-QQ-Originating-IP: v4T783SAuQhS+1f6RBJR3A4D2pB/VYrLfcMPIalcI6c=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 07 Jan 2025 21:38:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7022212570655544969
From: WangYuli <wangyuli@uniontech.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	niklas.neronin@linux.intel.com,
	quic_wcheng@quicinc.com,
	andriy.shevchenko@linux.intel.com,
	michal.pecio@gmail.com,
	guanwentao@uniontech.com,
	zhanjun@uniontech.com,
	bigeasy@linutronix.de,
	balbi@ti.com,
	hkallweit1@gmail.com,
	wangyuli@uniontech.com,
	raoxu@uniontech.com
Subject: [PATCH v3] usb: host: xhci-plat: Assign shared_hcd->rsrc_start
Date: Tue,  7 Jan 2025 21:38:54 +0800
Message-ID: <186B9F56972457B4+20250107133854.172309-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Mf2c2cXG8XEiFrWxhKZiynLnbajFCeRwtnYpPGOYtxNzUOB6iP25z1jm
	/BAWuAJ227Ow1Zzbekyj5Vhw9JpIL4X6SXSuj8LpPxD8oAsrtj0mqiBvQj/ucghhKtxhWu7
	vcRoJ/gKCFluIYSRDMvvo8OB5/EIsBwZPsxiXHwf1H0C9Sjh1Lf76j10SfOPMNZ+hHs80Ww
	Si7s4TTKwJpNWpBEKlK06tgM1DddrcnweQLsP9WJZBlgK6AueoSGa2z65ChpFw9LDIvrlWG
	lTbGYJJk1OFmFY/LsDV2yWUIkjcqHvSGpcOqDD6UYEJ4sBro6uefBJp1CoFhrzhslqZVOrI
	uJvCsOXatognVBbkDti4IurYOdZEjxMfX8iFya3oXnRxg9vue5IJ7ul7Hgs5s6G6nftJLmX
	lvDkarlvcaKGWuyzoYylX9DX34sLTEkuYsS7ULf2GhE1nAwpqb/weGuzeqieOhMjtduZ7TD
	5hRBGOeHFdoB+YqFzoHK6WlISjmyRTUQN3GSUgzmO52k7pZPyXOfRkjMWVhWPHLpZe6mdF5
	nEzTLEEhX8JW9TqNAS5Hw8m1GtDV9SfReYp5cnYZU0nSYXNz6DInXpxTjsDQmSOns2HB3ic
	HYlBSXJYPkUHzg/meRdmz+aXeJDtzUp7sbXMwJ2Q3ag1Azd4WvyHRRLUekapW/tRYPsg9eM
	jnvPnuqlzg/MfNoszm09TB3qEN48kzf5P+qCxLOg2WtKDiBrIVVQmV3iPzolO3s+ST4SFFT
	7tqcX4twVt9V7G5gvND8i0Fq9RMJKnnwJOa+qWp0L+xBpqA2k6veegxs8iMich5wDlF4lZz
	pLF6vtv17kDqsdbwaJ0kBzn1Fv0MI/3ZmeHO8TdpbZN/6D6zltojGyVboo9EDdfWUfUk+9f
	IjVt8gNjGfPhpufiwjV87/7h1Or/JvROV48NTqcpqrcA4/zz/o/7yvFqHC1XtYKRrz980Kb
	K+gmFH637R388bMPVHjTyu//i1aWgMdGpMKoSZTG8F9BTTb0thvTAZdaVizE13g3PVBGDW+
	glup5LkahAgKSG8nmn+mM3IgLQ2ag=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

When inserting a USB device, examining hcd->rsrc_start can be
helpful in identifying which hcd is mounted, as the physical
address represented here is typically unique.

The following code snippet demonstrates this:
  struct usb_hcd *hcd = bus_to_hcd(udev->bus);
  unsigned long long usb_hcd_addr = (unsigned long long)hcd->rsrc_start;

However, this approach has limitations now. For USB hosts with an
MMIO interface, the effectiveness of this method is restricted to
USB 2.0.

Because commit 3429e91a661e ("usb: host: xhci: add platform driver
support") assigned res->start to hcd->rsrc_start. But
shared_hcd->rsrc_start remains unassigned, which is also necessary
in certain scenarios.

Fixes: 3429e91a661e ("usb: host: xhci: add platform driver support")
Co-developed-by: Xu Rao <raoxu@uniontech.com>
Signed-off-by: Xu Rao <raoxu@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
--
Changlog:
 *v1 -> v2: Move code changes for commit e0fe986972f5 ("usb: host:
xhci-plat: prepare operation w/o shared hcd").
  v2 -> v3: Add the "Fixes" tag and fix a typo in commit message.
---
 drivers/usb/host/xhci-plat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index e6c9006bd568..457e839b9b53 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -329,6 +329,8 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 		usb3_hcd->can_do_streams = 1;
 
 	if (xhci->shared_hcd) {
+		xhci->shared_hcd->rsrc_start = hcd->rsrc_start;
+		xhci->shared_hcd->rsrc_len = hcd->rsrc_len;
 		ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
 		if (ret)
 			goto put_usb3_hcd;
-- 
2.47.1


