Return-Path: <linux-usb+bounces-18971-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60494A0159C
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jan 2025 16:44:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CF4B18834CB
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jan 2025 15:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A0C1C3C04;
	Sat,  4 Jan 2025 15:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="dLyvLMoO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DE11C1F23
	for <linux-usb@vger.kernel.org>; Sat,  4 Jan 2025 15:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736005476; cv=none; b=o5arU/YBfIAl1HEe1CqCjXJzbn87gMrRlidX/gXlNBClcouNxBkwvAVktkjDDRT0cx8gxMpl8vr3428VAWq+9Qb/MJErel1j8w3xxcFllkw/0PFKiHx4fhJZQb8cKWRfC9dDvPygRe3vR6KveqYyxrNB+ElEoL4h2leuHbACHnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736005476; c=relaxed/simple;
	bh=kFeqrAqXccBgLLqwQbFf4kM9CWXzXJ2FCtfoIE8oAeI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e+XqZPuvdHhWEzjw/YpREXAbqwH1CvpLHG+fXD5gn+FLR1S8Uv3lnc+rR9xaQjBsX3kZQFvsJ15gaLkYqYG/nn0zto/YaKLSkH7Gb8DqnSslDd/5rvWAn+9mSEb0/ZbkAEOAkoRR2gP6SsIoZIsDAWMWWZZi23GbcG/Ageu7uPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=dLyvLMoO; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1736005456;
	bh=s/Zi94DxekvcQ0+OqbLAnT4W07KfhdhwNJ+YjfK9Pbs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=dLyvLMoOEFrK15seWSn5JXQ6rg6OuT1bxapt0wylVNfQUXlZsVrts7zU53RGHUq6m
	 QVlTpjuiJAydkyY0tKCB1CQRKps9JDWjh7FuwctRWC4+U9T/F58G609UH6u/ZZ48+k
	 3X8IudtG7nH53Qtc2fqDwaMQhFrOW/x64D8HtbDs=
X-QQ-mid: bizesmtpip4t1736005446ts6qc7b
X-QQ-Originating-IP: PAL671qYWvWGxJZO4YSzNxJE8sPV9AU9fj56G+mev4Q=
Received: from avenger-OMEN-by-HP-Gaming-Lapto ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 04 Jan 2025 23:44:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 442894868819710046
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
	sarah.a.sharp@linux.intel.com,
	WangYuli <wangyuli@uniontech.com>,
	Xu Rao <raoxu@uniontech.com>
Subject: [PATCH] usb: host: xhci-plat: Assign shared_hcd->rsrc_start
Date: Sat,  4 Jan 2025 23:43:53 +0800
Message-ID: <8AC53C0500C2C839+20250104154353.93075-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MGjb3fpSAlbposCPlAHZfhfpfYTOL/R6W5CX49hcHc1140ll5787iQz+
	M0oEiEkcpNrLX22c8AlCEEecB4+S1s6cr5b+fl0CizWf+Q13iHEd/JAezZgsoxRkAoP2VbT
	mtwOPndZb5pARWfTEl83VEiNui1tcB2M4cRhMtiD3Ab8LWxmlIC1kNHGWEVYc11W1FzE5pe
	KE3tTs92KBKdfp/p2zguE53MlNT/5XiOhI3NvNbD41W0ShGfyiw3k5jGGg/Ck5fH1zWJZKK
	9SKAzGn7gfboXYk7yJtGZwYibLOOr4MKavV5R1BnXcVCTytrpjICeHzW02iUncdYIiHp60S
	5EJL0B+bEiXDE+SYdoW0Ivg0qMgXpxTdyInCRM9kEAXqSqyzVhfXzfUie7HiKRlGOYpM03j
	+zXQw0Ge+ZzoJBZqMIRKWjIgp8xU7ESp+nOo8ejtSgOurrDY/fx9getyFWTSAL6HuVmbe18
	/7dttN/hZYSBHKkarV/o5HeAm9hypRCipshRbPUM/a+9gHHx4+902RbI+H0BwlAwHLy6Vdv
	ovqh1CdABRS+9C5Wt9nzR2BIwLVXL2RM0YQyIy4Ek0FJFAfqCORdNbnb2lK3eriwdZDZg1E
	gE8RdPgVIsjYbr7XB0nUtprdtjVgXmZhX5FO0JeXZehcBuOaHuGJ/dSXwDpW38UyUiBEs/T
	dSZJ8HhRqEQDQj7QWMEfeEvgjJKhp2AHr1mjvEwNSQxhNzJjm49uvk/Cu4ItSsqOUAvR3hI
	zUw9ABH3Q9gA+x/4t4K3WFCVRbue0AdFpttElQ6gSxbnSjnYV5p4FX4f2ojw498x1x9W1SG
	jcM1bEDrR2F42V09OuBbjl6jEjkTVvj62TwKF9ZJHXGOsDpAIl7/iv/ZDKNcJQhzpE2g4ct
	UJVYI+BpLUQDKsuTK8UGQe6gVJkTQ2G8ZFeZOq7pwACwDS60DbZgxU5KAgR/Cwra8VrcHWy
	+TIHteORm5k21sSGUR0mGCIjngrOozeMb8/l93m+zaL8mTJrwVwagyRBbHGE/8ASOOeICIr
	LWkpAvn7gam5LxAq8oYWobNHf0WcYUEAE1JeyLIA==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
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

Becase commit 3429e91a661e ("usb: host: xhci: add platform driver
support") assigned res->start to hcd->rsrc_start. But
shared_hcd->rsrc_start remains unassigned, which is also necessary
in certain scenarios.

Co-developed-by: Xu Rao <raoxu@uniontech.com>
Signed-off-by: Xu Rao <raoxu@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/usb/host/xhci-plat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index e6c9006bd568..56a65ddb7e4c 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -328,6 +328,9 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 	if (usb3_hcd && HCC_MAX_PSA(xhci->hcc_params) >= 4)
 		usb3_hcd->can_do_streams = 1;
 
+	xhci->shared_hcd->rsrc_start = hcd->rsrc_start;
+	xhci->shared_hcd->rsrc_len = hcd->rsrc_len;
+
 	if (xhci->shared_hcd) {
 		ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
 		if (ret)
-- 
2.45.2


