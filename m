Return-Path: <linux-usb+bounces-18972-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6120CA015AA
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jan 2025 16:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B317E1884282
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jan 2025 15:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2E8A932;
	Sat,  4 Jan 2025 15:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="ej3sXfnq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EFE1922E6;
	Sat,  4 Jan 2025 15:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736005911; cv=none; b=XSfpGEHW/vBowf+2cIueDL8U3Z75LJRsKD26k0XPP7RFP32Hh/7ApwIuNW3uZlbY9i0Mhj93FSq+F1L5vP7o+SmIx7k+wTGw20UshlhJP/1y6slPeUWSWmA70I5V4otsqlUyva9k4iakFlfgVP/bNNg1M8NUxTefaoq7fUdyHUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736005911; c=relaxed/simple;
	bh=6K5dR5nOUprM1DvrCky9/PSJUU1/CGijKZhz26qS8PE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ap4ZWiSbRIqaBMryQiveKoJgbyPs7Jsd6hmkY7uz8UYzrOobPJylvbqE3J5a8QCnfIH6so5wG+68cmQRwnPU8LHgdUkNXyPnSYvVguZqLrWTUJnY0BIFiFVPca8qXJT2B7ceSUQEpDl44K+xVDEBdd0a7KyCFJoW8CJrJuLIPdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=ej3sXfnq; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1736005898;
	bh=7APZL8RDq4kaB9p03uGgj3jtf6vZKn9R4E1Oxpe29mM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ej3sXfnqV/WKEfydTF1FcG2bCvM8+cEvhDQBkyVG5FrOSM7EVwMv51x0fDxcnrqq5
	 OBu0oMf+YqH7lcPPoFh3eqeb560l62AUjg8QUhRsJlQcwFbYJ09ZbXvvhjm/UQBtHM
	 LvFe2QmoKTAJhLJLUEWk8Z4PfdTbJnTNlR2POW+M=
X-QQ-mid: bizesmtpip2t1736005888tiwbf2j
X-QQ-Originating-IP: 46IlzuVfXhEaPVJD3XEB8DfCtzPpjpLIOoZzFv2UrDQ=
Received: from avenger-OMEN-by-HP-Gaming-Lapto ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 04 Jan 2025 23:51:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6075248717850738852
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
	hkallweit1@gmail.com,
	WangYuli <wangyuli@uniontech.com>,
	Xu Rao <raoxu@uniontech.com>
Subject: [PATCH v2] usb: host: xhci-plat: Assign shared_hcd->rsrc_start
Date: Sat,  4 Jan 2025 23:51:11 +0800
Message-ID: <7ECE325975663D2D+20250104155111.100597-1-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: MsthqgywqSPpubSNCOXx9PA0yVFs/fvlc49iLpUUycMDz6PHbbsN68Qa
	svb5tep/WlEQlmg5TKs4COr+88oYo0mmBnQpLAxGdZjdo82g9fasCa9zs8muEIJyAzmy8j7
	ZmiERhAJUfCGRFUs94JAfzzgMtF5sTgWh8ziaIQh5bp88kd0sL+yoYxYAN/2ssz1m2pfcBF
	q7H6jDl+dNytBkB+ucv3UxI8Y6H4sMDam6f2wFM1NW3aOi2auw3/KqqJO1+0k9JyA/O8/kj
	pSZqsVsCJ7MUGkEsAXMCoqucqDMDZqNbwD/dt4eCHiuUAppEh6EE/bYbH+K2nmdldlincHh
	KPSQbyQtRAUKoprw6JYW+MHGsGUFcFSaxI/P//Loj8diJZh6TaVXeNB6LQBKa+4w5f4EgNK
	p2JtXJ4h+uOBDdEFUFaTfx0h2EkifyyUx9/Q+jojl9nPnU+8qdRHXaxFgUDSMMYSVxgd9xh
	4m4ql+XknIFYBfDLi0f9oey2Voss/M4zNkRuJnUhLlSWGaZr24O5/gSqbi08pjX1FMIU26e
	gUfO9sqgrf5R4fDfUTWqYS25ZfGyjNyjCxXhFPpw7FixOQifDL9NDP7D3htqlcZWfWr5Gui
	ALOWFeikZgD8eHbSUe/jfVCXGtTKXUWKmiTKntN4lllzjQ46ZqC6zWyc2Jll+Bs6qf8lCfd
	jQ6bMFzr+4M3FD07Mis/5Kq3YIt2oc4V49AjWrmPA0daK723UXuWmVv/MaR/smVw8lZ9Prb
	8Qway1v6t6I09T51LzSqGWi4DQZsZQI+l3VFpSgLV0cUjto5/+8yz84QfRuSlTN8klpLAgm
	ATT9K9c6yy2TA6T5XJDbqubgskqNhHd7kyjrOX5wjCGLry0702oz/JHbfXUeGUSHJFuPpfd
	V6RkGBtkxFuoaZpze7/pKb+Bu/Oa91z5tIC1k4d4nZwzkIPv2yjftdE9eKGKkooK4cnAcjp
	9JzaPihjVJv0yR+JsuronIE+hsKy7w+FpO8VopPQMRScZ6kmmCRA/8JSKZ/Xhr9y8tGPmQl
	NQ0Qnf/crwVUlpkur871P0mKzI8OekD1rE8xy34Q9ZDBidpTCi8RV8dMaQBU2LzNZa6LJPX
	+481DK1cu7uFK6JzUhIIUHMuD46agyWVHIW2e8xl8GQ
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
--
Changlog:
  v1 -> v2: Move code changes for commit e0fe986972f5 ("usb: host:
xhci-plat: prepare operation w/o shared hcd").
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
2.45.2


