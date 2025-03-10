Return-Path: <linux-usb+bounces-21600-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE18CA59938
	for <lists+linux-usb@lfdr.de>; Mon, 10 Mar 2025 16:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A3761683BD
	for <lists+linux-usb@lfdr.de>; Mon, 10 Mar 2025 15:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9BD22B8D2;
	Mon, 10 Mar 2025 15:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JwTV5FsI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5624F374EA
	for <linux-usb@vger.kernel.org>; Mon, 10 Mar 2025 15:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741619437; cv=none; b=uTOYYivqOJVKmtoAHYNQsKjAs7I0bgnGXLaxCm0LxuOFyFXb7IYpQ5MGE4luRTtQ1n+URgGFZ0kyutJ0it/QEeHbRg3YSeyYPheTA7ypKXYlMVluUTBoewg+pJMFN7kKlREJhSY4V9HbDytuMSLiXsp8FMgEXFy6Z5cQk5bvZR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741619437; c=relaxed/simple;
	bh=1jQDvHW/Nt9lqsSdZOvO+XRoFJ1lrCgt1Is62V7ylnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qxbFZjxkRQUJjh+n1dVuYPXvu8Jl9NOE21UNzdWCFHQaXaAiAAKTERcOiyb3uxb8D2ORKUBpRGFRWG+RsKlp+I9iA8NkIMuyc04jD38CijI2A0kw5IiaZ5049ad7Y/qiT59dPe5tdnnkkTOfAMuueBRiCAkWu/SQJvEuF7EXTRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JwTV5FsI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741619436; x=1773155436;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1jQDvHW/Nt9lqsSdZOvO+XRoFJ1lrCgt1Is62V7ylnc=;
  b=JwTV5FsIYzk5MmGqoA2R4Td2bYV8bbZoeu50CVzjOylxzi1DkpC24rLA
   3gtKrWSLWLfKPQjNLGmkK54eLUS36NYcViZT+iRC3kebhBzl92E9ycqPf
   OT95DwcPp6xCyyiO6GaOVis6p3n3zU27ujUVXEzzEZQ3H3u+wNZCODMO9
   zBNDL5d0EPlxU3e2S+HaKpjzSpKBJhtfCA2qVVu2B6Wjk+es9vd5LW3SU
   eMI7W8WvZqjJe6bhPqEQQKUTb3DwDtaJZgSlsTjLN+hpRLUcEopfETnSs
   VFFWkHGb69f9MccAXpEU31rHlTOaUF9P5yf2zGS+MLEGZShtBJ7qC+Stp
   A==;
X-CSE-ConnectionGUID: idoVBq1xSzqm6X5Ts7ckGQ==
X-CSE-MsgGUID: B1lPEucCRLyyRtpywWb/4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42654909"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="42654909"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 08:10:36 -0700
X-CSE-ConnectionGUID: wtrNa+YaQeeRLAmvItHkJg==
X-CSE-MsgGUID: Ok//cL+lT/yKdWoUePLXlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="120532673"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa007.jf.intel.com with ESMTP; 10 Mar 2025 08:10:31 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>,
	liudingyuan@huawei.com,
	patchwork-bot@kernel.org,
	mricon@kernel.org,
	<linux-usb@vger.kernel.org>
Cc: f.fangjian@huawei.com,
	kangfenglong@huawei.com,
	yangxingui@huawei.com,
	fengsheng5@huawei.com,
	lingmingqiang@huawei.com,
	liulongfang@huawei.com,
	zhonghaoquan@hisilicon.com,
	yanzhili7@huawei.com,
	huyihua4@huawei.com,
	prime.zeng@hisilicon.com,
	shenjian15@huawei.com,
	liuyonglong@huawei.com,
	jonathan.cameron@huawei.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFT PATCH] xhci: Limit time spent with interrupts disabled during bus resume
Date: Mon, 10 Mar 2025 17:11:22 +0200
Message-ID: <20250310151122.3783030-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d12c09e6-79f6-4490-ae24-a5c8f30c94a8@linux.intel.com>
References: <d12c09e6-79f6-4490-ae24-a5c8f30c94a8@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current xhci bus resume implementation prevents xHC host from generating
interrupts during high-speed USB 2 and super-speed USB 3 bus resume.

Only reason to disable interrupts during bus resume would be to prevent
the interrupt handler from interfering with the resume process of USB 2
ports.

Host initiated resume of USB 2 ports is done in two stages.

The xhci driver first transitions the port from 'U3' to 'Resume' state,
then wait in Resume for 20ms, and finally moves port to U0 state.
xhci driver can't prevent interrupts by taking and keeping the xhci
spinlock with spin_lock_irqsave() due to this 20ms sleep.

Limit interrupt disabling to the USB 2 port resume case only.
resuming USB 2 ports in bus resume is only done in special cases where
USB 2 ports had to be forced to suspend during bus suspend.

The current way of preventing interrupts by clearing the 'Interrupt
Enable' (INTE) bit in USBCMD register won't prevent the Interrupter
registers 'Interrupt Pending' (IP), 'Event Handler Busy' (EHB) and
USBSTS register Event Interrupt (EINT) bits from being set.

New interrupts can't be issued before those bits are properly clered.

Disable interrupts by clearing the interrupter register 'Interrupt
Enable' (IE) bit instead. This way IP, EHB and INTE won't be set
before IE is enabled again and a new interrupt is triggered.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 30 ++++++++++++++++--------------
 drivers/usb/host/xhci.c     |  4 ++--
 drivers/usb/host/xhci.h     |  2 ++
 3 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 9693464c0520..d11b60f705bb 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1870,9 +1870,10 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 	int max_ports, port_index;
 	int sret;
 	u32 next_state;
-	u32 temp, portsc;
+	u32 portsc;
 	struct xhci_hub *rhub;
 	struct xhci_port **ports;
+	bool disabled_irq = false;
 
 	rhub = xhci_get_rhub(hcd);
 	ports = rhub->ports;
@@ -1888,17 +1889,20 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 		return -ESHUTDOWN;
 	}
 
-	/* delay the irqs */
-	temp = readl(&xhci->op_regs->command);
-	temp &= ~CMD_EIE;
-	writel(temp, &xhci->op_regs->command);
-
 	/* bus specific resume for ports we suspended at bus_suspend */
-	if (hcd->speed >= HCD_USB3)
+	if (hcd->speed >= HCD_USB3) {
 		next_state = XDEV_U0;
-	else
+	} else {
 		next_state = XDEV_RESUME;
-
+		if (bus_state->bus_suspended) {
+			/*
+			 * prevent port event interrupts from interfering
+			 * with usb2 port resume process
+			 */
+			xhci_disable_interrupter(xhci->interrupters[0]);
+			disabled_irq = true;
+		}
+	}
 	port_index = max_ports;
 	while (port_index--) {
 		portsc = readl(ports[port_index]->addr);
@@ -1966,11 +1970,9 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 	(void) readl(&xhci->op_regs->command);
 
 	bus_state->next_statechange = jiffies + msecs_to_jiffies(5);
-	/* re-enable irqs */
-	temp = readl(&xhci->op_regs->command);
-	temp |= CMD_EIE;
-	writel(temp, &xhci->op_regs->command);
-	temp = readl(&xhci->op_regs->command);
+	/* re-enable interrupter */
+	if (disabled_irq)
+		xhci_enable_interrupter(xhci->interrupters[0]);
 
 	spin_unlock_irqrestore(&xhci->lock, flags);
 	return 0;
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 0c22b78358b9..ad229cb9a90b 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -322,7 +322,7 @@ static void xhci_zero_64b_regs(struct xhci_hcd *xhci)
 		xhci_info(xhci, "Fault detected\n");
 }
 
-static int xhci_enable_interrupter(struct xhci_interrupter *ir)
+int xhci_enable_interrupter(struct xhci_interrupter *ir)
 {
 	u32 iman;
 
@@ -335,7 +335,7 @@ static int xhci_enable_interrupter(struct xhci_interrupter *ir)
 	return 0;
 }
 
-static int xhci_disable_interrupter(struct xhci_interrupter *ir)
+int xhci_disable_interrupter(struct xhci_interrupter *ir)
 {
 	u32 iman;
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 6c00062a9acc..10572336fabe 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1891,6 +1891,8 @@ int xhci_alloc_tt_info(struct xhci_hcd *xhci,
 		struct usb_tt *tt, gfp_t mem_flags);
 int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
 				    u32 imod_interval);
+int xhci_enable_interrupter(struct xhci_interrupter *ir);
+int xhci_disable_interrupter(struct xhci_interrupter *ir);
 
 /* xHCI ring, segment, TRB, and TD functions */
 dma_addr_t xhci_trb_virt_to_dma(struct xhci_segment *seg, union xhci_trb *trb);
-- 
2.43.0


