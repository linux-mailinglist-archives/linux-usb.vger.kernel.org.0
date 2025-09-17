Return-Path: <linux-usb+bounces-28222-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D70CB7F141
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 15:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D301D2A069D
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 13:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381E2335927;
	Wed, 17 Sep 2025 12:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="epP62MDW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1484B32E75B
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 12:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758113949; cv=none; b=mqCU1o5ujyJr32BPqgp2z9BQYqG/llbooI/MsndDVo1mOOG8pK7DTqqOsTF0uRKlZlQcmN/HRyGMZuzpaZaXQCnZG4qdV+nCcDr9Nvir3kdYHbvYXa6KaI9WuJVxuxYyMJsOGiyNT84lzRHBjC1e6dQajbbE+etQtGGCXxP3wfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758113949; c=relaxed/simple;
	bh=tJmbSBg9FSeGkeAJExNk2JFOB9yn6JhwfnHUSPOoV8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ElTTfMSfcDn205hXPSFkt/BJdquHT0JIGPHFnjoVpu2MQunqmu2VjVIiVuUmZFK/P9kj7FN1zNZWEscKWouqsjI2+uqey+M/hL7j5sTpqOYXwRHvCXEC2K2l7/paN1JmiZisxtZJzJIne0f7y6/OttlrSKe03alkK0Td8YXSKOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=epP62MDW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758113948; x=1789649948;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tJmbSBg9FSeGkeAJExNk2JFOB9yn6JhwfnHUSPOoV8E=;
  b=epP62MDWVvLVZrHzQrwMtBsEga3TIMggIhv/bGGC+IRNqXR5Jzw2rmD0
   0LezzobuXYijpkjzVMlhKCYByXzxjLOjiBp253JIrob/x4mTJi4bUQnTh
   KyAOmLiKCTCkr6cpm55yS8PjNkcJ4KQZaCJvlTyY3zcFcdti0WzZ2RNEE
   akB9tTCYVEzvPASWEP+vHDdkQzzPF5z+4yL907rJYk6iltLC8TpK+jXaR
   cPbWMbAB/DLb35+ivAunUE4a3e/raYjjXBSeERCNSsbT+zgeDKtYgI2mT
   jiXGXrVlRs7wuKfhlcIvQb8lgh3n1yXrm88h0oV8gFMwMGM7KEPkMEIvx
   w==;
X-CSE-ConnectionGUID: 4F3ivZeoRZ6YACzLNZwKcQ==
X-CSE-MsgGUID: JYUjFtxnQt2WudDBIoD25A==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60484592"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="60484592"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 05:59:07 -0700
X-CSE-ConnectionGUID: Mtzg72a5TPGp0Dx3z2Ln8A==
X-CSE-MsgGUID: rlnO7y2iS8iWVNlmd6EHig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="175159049"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 17 Sep 2025 05:59:05 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 2F83299; Wed, 17 Sep 2025 14:59:05 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	peter.chen@kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 8/8] usb: xhci: rename Port Register Set pointer in struct 'xhci_port'
Date: Wed, 17 Sep 2025 14:58:49 +0200
Message-ID: <20250917125850.3380560-9-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250917125850.3380560-1-niklas.neronin@linux.intel.com>
References: <20250917125850.3380560-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the Host Controller USB Port Register Set pointer in the 'xhci_port'
struct from "addr" to "port_reg". This new name accurately reflects the
purpose of the pointer.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 16 ++++++++--------
 drivers/usb/host/xhci-mem.c |  2 +-
 drivers/usb/host/xhci.c     | 28 ++++++++++++++--------------
 drivers/usb/host/xhci.h     |  2 +-
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 35d893b7151b..aa17c40736f5 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -683,9 +683,9 @@ static void xhci_port_set_test_mode(struct xhci_hcd *xhci,
 
 	/* xhci only supports test mode for usb2 ports */
 	port = xhci->usb2_rhub.ports[wIndex];
-	temp = readl(&port->addr->portpmsc);
+	temp = readl(&port->port_reg->portpmsc);
 	temp |= test_mode << PORT_TEST_MODE_SHIFT;
-	writel(temp, &port->addr->portpmsc);
+	writel(temp, &port->port_reg->portpmsc);
 	xhci->test_mode = test_mode;
 	if (test_mode == USB_TEST_FORCE_ENABLE)
 		xhci_start(xhci);
@@ -1288,7 +1288,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				retval = -EINVAL;
 				break;
 			}
-			port_li = readl(&port->addr->portli);
+			port_li = readl(&port->port_reg->portli);
 			status = xhci_get_ext_port_status(temp, port_li);
 			put_unaligned_le32(status, &buf[4]);
 		}
@@ -1520,18 +1520,18 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		case USB_PORT_FEAT_U1_TIMEOUT:
 			if (hcd->speed < HCD_USB3)
 				goto error;
-			temp = readl(&port->addr->portpmsc);
+			temp = readl(&port->port_reg->portpmsc);
 			temp &= ~PORT_U1_TIMEOUT_MASK;
 			temp |= PORT_U1_TIMEOUT(timeout);
-			writel(temp, &port->addr->portpmsc);
+			writel(temp, &port->port_reg->portpmsc);
 			break;
 		case USB_PORT_FEAT_U2_TIMEOUT:
 			if (hcd->speed < HCD_USB3)
 				goto error;
-			temp = readl(&port->addr->portpmsc);
+			temp = readl(&port->port_reg->portpmsc);
 			temp &= ~PORT_U2_TIMEOUT_MASK;
 			temp |= PORT_U2_TIMEOUT(timeout);
-			writel(temp, &port->addr->portpmsc);
+			writel(temp, &port->port_reg->portpmsc);
 			break;
 		case USB_PORT_FEAT_TEST:
 			/* 4.19.6 Port Test Modes (USB2 Test Mode) */
@@ -1962,7 +1962,7 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 
 	/* poll for U0 link state complete, both USB2 and USB3 */
 	for_each_set_bit(port_index, &bus_state->bus_suspended, BITS_PER_LONG) {
-		sret = xhci_handshake(&ports[port_index]->addr->portsc, PORT_PLC,
+		sret = xhci_handshake(&ports[port_index]->port_reg->portsc, PORT_PLC,
 				      PORT_PLC, 10 * 1000);
 		if (sret) {
 			xhci_warn(xhci, "port %d-%d resume PLC timeout\n",
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 14779ae0515d..3e871e207585 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2204,7 +2204,7 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 		return -ENOMEM;
 
 	for (i = 0; i < num_ports; i++) {
-		xhci->hw_ports[i].addr = &xhci->op_regs->port_regs[i];
+		xhci->hw_ports[i].port_reg = &xhci->op_regs->port_regs[i];
 		xhci->hw_ports[i].hw_portnum = i;
 
 		init_completion(&xhci->hw_ports[i].rexit_done);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 45e3b2d9415b..210b554deea2 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -44,12 +44,12 @@ MODULE_PARM_DESC(quirks, "Bit flags for quirks to be enabled as default");
 void xhci_set_portsc(struct xhci_port *port, u32 val)
 {
 	trace_xhci_set_portsc(port, val);
-	writel(val, &port->addr->portsc);
+	writel(val, &port->port_reg->portsc);
 }
 
 u32 xhci_get_portsc(struct xhci_port *port)
 {
-	return readl(&port->addr->portsc);
+	return readl(&port->port_reg->portsc);
 }
 
 static bool td_on_ring(struct xhci_td *td, struct xhci_ring *ring)
@@ -4633,7 +4633,7 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 {
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
 	struct xhci_port **ports;
-	struct xhci_port_regs __iomem *port_regs;
+	struct xhci_port_regs __iomem *port_reg;
 	u32		pm_val, hlpm_val, field;
 	unsigned int	port_num;
 	unsigned long	flags;
@@ -4658,8 +4658,8 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 
 	ports = xhci->usb2_rhub.ports;
 	port_num = udev->portnum - 1;
-	port_regs = ports[port_num]->addr;
-	pm_val = readl(&port_regs->portpmsc);
+	port_reg = ports[port_num]->port_reg;
+	pm_val = readl(&port_reg->portpmsc);
 
 	xhci_dbg(xhci, "%s port %d USB2 hardware LPM\n",
 		 str_enable_disable(enable), port_num + 1);
@@ -4688,30 +4688,30 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 			spin_lock_irqsave(&xhci->lock, flags);
 
 			hlpm_val = xhci_calculate_usb2_hw_lpm_params(udev);
-			writel(hlpm_val, &port_regs->porthlmpc);
+			writel(hlpm_val, &port_reg->porthlmpc);
 			/* flush write */
-			readl(&port_regs->porthlmpc);
+			readl(&port_reg->porthlmpc);
 		} else {
 			hird = xhci_calculate_hird_besl(xhci, udev);
 		}
 
 		pm_val &= ~PORT_HIRD_MASK;
 		pm_val |= PORT_HIRD(hird) | PORT_RWE | PORT_L1DS(udev->slot_id);
-		writel(pm_val, &port_regs->portpmsc);
-		pm_val = readl(&port_regs->portpmsc);
+		writel(pm_val, &port_reg->portpmsc);
+		pm_val = readl(&port_reg->portpmsc);
 		pm_val |= PORT_HLE;
-		writel(pm_val, &port_regs->portpmsc);
+		writel(pm_val, &port_reg->portpmsc);
 		/* flush write */
-		readl(&port_regs->portpmsc);
+		readl(&port_reg->portpmsc);
 	} else {
 		pm_val &= ~(PORT_HLE | PORT_RWE | PORT_HIRD_MASK | PORT_L1DS_MASK);
-		writel(pm_val, &port_regs->portpmsc);
+		writel(pm_val, &port_reg->portpmsc);
 		/* flush write */
-		readl(&port_regs->portpmsc);
+		readl(&port_reg->portpmsc);
 		if (udev->usb2_hw_lpm_besl_capable) {
 			spin_unlock_irqrestore(&xhci->lock, flags);
 			xhci_change_max_exit_latency(xhci, udev, 0);
-			readl_poll_timeout(&ports[port_num]->addr->portsc, pm_val,
+			readl_poll_timeout(&ports[port_num]->port_reg->portsc, pm_val,
 					   (pm_val & PORT_PLS_MASK) == XDEV_U0,
 					   100, 10000);
 			return 0;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 40a90a0713a0..86edc4297929 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1464,7 +1464,7 @@ struct xhci_port_cap {
 };
 
 struct xhci_port {
-	struct xhci_port_regs __iomem	*addr;
+	struct xhci_port_regs __iomem	*port_reg;
 	int			hw_portnum;
 	int			hcd_portnum;
 	struct xhci_hub		*rhub;
-- 
2.50.1


