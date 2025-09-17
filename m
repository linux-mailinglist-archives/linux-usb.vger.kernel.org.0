Return-Path: <linux-usb+bounces-28219-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CED4B7F04B
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 15:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F6FF625B28
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 13:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F8D32E73C;
	Wed, 17 Sep 2025 12:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hLCpVxwO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D183632E750
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758113948; cv=none; b=IMeehA35BlLEii2V+5wbxgius4llPj+iEIqpUxh0UFCD1hdh4mRh2/3nJL0rlOrI8slQ1TYFHQXU75a7gNnM3JMO8vOn2yrm/StV53/TmjBi+cfU7nSGJfSNJEbGUgbnnIylB88zcyeDWzbUlvt2LK7F8RKunCY+ZBeZHhMO4zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758113948; c=relaxed/simple;
	bh=zzIgCMZ2l/tq4v5p9LfrxgsDuhzO7EBVKmeGOFDy4fg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Itgqs8CNOwzpbiw7XfsWu0Fb5lulBpTQLUckPEiSQIY1aJRJP/wXooUDVkECVv9Ji6ti/VvN70hAUt3+OMz9GyKTxYYBlTV24suoHfSUhGJVxT/wovKKGepm4h90W1FrCXAEEVuUW2Gjs/nFcXlXSEyQHHUTFMPvPysEwZwo3c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hLCpVxwO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758113947; x=1789649947;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zzIgCMZ2l/tq4v5p9LfrxgsDuhzO7EBVKmeGOFDy4fg=;
  b=hLCpVxwO//FQW0ZYDuTQ5ffbDHzhvPhDqKbHPSKle8/LCnTnz+SJyJCI
   AoMvsmxRyz3w0/z6j8r3Do9m69cThRAjyCs/AK8dgDSS7tQY9nKEXt02z
   Cfrcu4UoyXr1zyOuJVIW6sX+jlGPvXvTiV8Kl2aiELpDiXPmVMlYF+VBR
   JGqCYrkJ/vV1j0MbP+NX9XK/rIwIP+vla/OUvalqkARHKd/Fvvx74O10D
   mgh8hQJeW2YS+qk3EcE9ZjwuCV2vzwT+GoA3NuOPef509riT69luUDEoz
   Oj8rbbwq3EdyuMDpydy0JVlSVYV6B5fCxdovpa/sMCEoWfGLRAoVOB0Nu
   w==;
X-CSE-ConnectionGUID: ezszYsBuTk2u79HMSZw8vA==
X-CSE-MsgGUID: c795A6i4TdywFwOhRy+xyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60527420"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="60527420"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 05:59:07 -0700
X-CSE-ConnectionGUID: HJ4QWD1mTEmt3uJ1xnn/Rw==
X-CSE-MsgGUID: abdadrVHTCe8pXdrWg0iqg==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 17 Sep 2025 05:59:05 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id B01EE98; Wed, 17 Sep 2025 14:59:04 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	peter.chen@kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 7/8] usb: xhci: implement USB Port Register Set struct
Date: Wed, 17 Sep 2025 14:58:48 +0200
Message-ID: <20250917125850.3380560-8-niklas.neronin@linux.intel.com>
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

Refactor the 'xhci_port' struct by changing the 'addr' field from a
'__le32' pointer to a pointer to the 'xhci_port_regs' struct.

Previously, the 'xhci_port' struct contained a '__le32' pointer named addr,
which pointed to the Host Controller USB Port Register Set.
Accessing specific registers required using a macro,
such as port->addr + PORTHLPMC, which was less readable.

Before:
 port->addr
 port->addr + PORTPMSC
 port->addr + PORTLI
 port->addr + PORTHLPMC

After:
 port->addr->portsc
 port->addr->portpmsc
 port->addr->portli
 port->addr->porthlmpc

This change simplifies the code by directly accessing the registers through
the 'xhci_port_regs' struct, making it more intuitive and easier to
follow.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 16 ++++++++--------
 drivers/usb/host/xhci-mem.c |  2 +-
 drivers/usb/host/xhci.c     | 29 ++++++++++++++---------------
 drivers/usb/host/xhci.h     |  7 +------
 4 files changed, 24 insertions(+), 30 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 68fecda9d48d..35d893b7151b 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -683,9 +683,9 @@ static void xhci_port_set_test_mode(struct xhci_hcd *xhci,
 
 	/* xhci only supports test mode for usb2 ports */
 	port = xhci->usb2_rhub.ports[wIndex];
-	temp = readl(port->addr + PORTPMSC);
+	temp = readl(&port->addr->portpmsc);
 	temp |= test_mode << PORT_TEST_MODE_SHIFT;
-	writel(temp, port->addr + PORTPMSC);
+	writel(temp, &port->addr->portpmsc);
 	xhci->test_mode = test_mode;
 	if (test_mode == USB_TEST_FORCE_ENABLE)
 		xhci_start(xhci);
@@ -1288,7 +1288,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				retval = -EINVAL;
 				break;
 			}
-			port_li = readl(port->addr + PORTLI);
+			port_li = readl(&port->addr->portli);
 			status = xhci_get_ext_port_status(temp, port_li);
 			put_unaligned_le32(status, &buf[4]);
 		}
@@ -1520,18 +1520,18 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		case USB_PORT_FEAT_U1_TIMEOUT:
 			if (hcd->speed < HCD_USB3)
 				goto error;
-			temp = readl(port->addr + PORTPMSC);
+			temp = readl(&port->addr->portpmsc);
 			temp &= ~PORT_U1_TIMEOUT_MASK;
 			temp |= PORT_U1_TIMEOUT(timeout);
-			writel(temp, port->addr + PORTPMSC);
+			writel(temp, &port->addr->portpmsc);
 			break;
 		case USB_PORT_FEAT_U2_TIMEOUT:
 			if (hcd->speed < HCD_USB3)
 				goto error;
-			temp = readl(port->addr + PORTPMSC);
+			temp = readl(&port->addr->portpmsc);
 			temp &= ~PORT_U2_TIMEOUT_MASK;
 			temp |= PORT_U2_TIMEOUT(timeout);
-			writel(temp, port->addr + PORTPMSC);
+			writel(temp, &port->addr->portpmsc);
 			break;
 		case USB_PORT_FEAT_TEST:
 			/* 4.19.6 Port Test Modes (USB2 Test Mode) */
@@ -1962,7 +1962,7 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 
 	/* poll for U0 link state complete, both USB2 and USB3 */
 	for_each_set_bit(port_index, &bus_state->bus_suspended, BITS_PER_LONG) {
-		sret = xhci_handshake(ports[port_index]->addr, PORT_PLC,
+		sret = xhci_handshake(&ports[port_index]->addr->portsc, PORT_PLC,
 				      PORT_PLC, 10 * 1000);
 		if (sret) {
 			xhci_warn(xhci, "port %d-%d resume PLC timeout\n",
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 5d5b7ae978c0..14779ae0515d 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2204,7 +2204,7 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 		return -ENOMEM;
 
 	for (i = 0; i < num_ports; i++) {
-		xhci->hw_ports[i].addr = &xhci->op_regs->port_regs[i].portsc;
+		xhci->hw_ports[i].addr = &xhci->op_regs->port_regs[i];
 		xhci->hw_ports[i].hw_portnum = i;
 
 		init_completion(&xhci->hw_ports[i].rexit_done);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index e43501a8ab55..45e3b2d9415b 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -44,12 +44,12 @@ MODULE_PARM_DESC(quirks, "Bit flags for quirks to be enabled as default");
 void xhci_set_portsc(struct xhci_port *port, u32 val)
 {
 	trace_xhci_set_portsc(port, val);
-	writel(val, port->addr);
+	writel(val, &port->addr->portsc);
 }
 
 u32 xhci_get_portsc(struct xhci_port *port)
 {
-	return readl(port->addr);
+	return readl(&port->addr->portsc);
 }
 
 static bool td_on_ring(struct xhci_td *td, struct xhci_ring *ring)
@@ -4633,7 +4633,7 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 {
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
 	struct xhci_port **ports;
-	__le32 __iomem	*pm_addr, *hlpm_addr;
+	struct xhci_port_regs __iomem *port_regs;
 	u32		pm_val, hlpm_val, field;
 	unsigned int	port_num;
 	unsigned long	flags;
@@ -4658,9 +4658,8 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 
 	ports = xhci->usb2_rhub.ports;
 	port_num = udev->portnum - 1;
-	pm_addr = ports[port_num]->addr + PORTPMSC;
-	pm_val = readl(pm_addr);
-	hlpm_addr = ports[port_num]->addr + PORTHLPMC;
+	port_regs = ports[port_num]->addr;
+	pm_val = readl(&port_regs->portpmsc);
 
 	xhci_dbg(xhci, "%s port %d USB2 hardware LPM\n",
 		 str_enable_disable(enable), port_num + 1);
@@ -4689,30 +4688,30 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 			spin_lock_irqsave(&xhci->lock, flags);
 
 			hlpm_val = xhci_calculate_usb2_hw_lpm_params(udev);
-			writel(hlpm_val, hlpm_addr);
+			writel(hlpm_val, &port_regs->porthlmpc);
 			/* flush write */
-			readl(hlpm_addr);
+			readl(&port_regs->porthlmpc);
 		} else {
 			hird = xhci_calculate_hird_besl(xhci, udev);
 		}
 
 		pm_val &= ~PORT_HIRD_MASK;
 		pm_val |= PORT_HIRD(hird) | PORT_RWE | PORT_L1DS(udev->slot_id);
-		writel(pm_val, pm_addr);
-		pm_val = readl(pm_addr);
+		writel(pm_val, &port_regs->portpmsc);
+		pm_val = readl(&port_regs->portpmsc);
 		pm_val |= PORT_HLE;
-		writel(pm_val, pm_addr);
+		writel(pm_val, &port_regs->portpmsc);
 		/* flush write */
-		readl(pm_addr);
+		readl(&port_regs->portpmsc);
 	} else {
 		pm_val &= ~(PORT_HLE | PORT_RWE | PORT_HIRD_MASK | PORT_L1DS_MASK);
-		writel(pm_val, pm_addr);
+		writel(pm_val, &port_regs->portpmsc);
 		/* flush write */
-		readl(pm_addr);
+		readl(&port_regs->portpmsc);
 		if (udev->usb2_hw_lpm_besl_capable) {
 			spin_unlock_irqrestore(&xhci->lock, flags);
 			xhci_change_max_exit_latency(xhci, udev, 0);
-			readl_poll_timeout(ports[port_num]->addr, pm_val,
+			readl_poll_timeout(&ports[port_num]->addr->portsc, pm_val,
 					   (pm_val & PORT_PLS_MASK) == XDEV_U0,
 					   100, 10000);
 			return 0;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 67ea03b20bee..40a90a0713a0 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -66,11 +66,6 @@ struct xhci_cap_regs {
 	/* Reserved up to (CAPLENGTH - 0x1C) */
 };
 
-#define PORTSC		0
-#define PORTPMSC	1
-#define PORTLI		2
-#define PORTHLPMC	3
-
 /*
  * struct xhci_port_regs - Host Controller USB Port Register Set. xHCI spec 5.4.8
  * @portsc:	Port Status and Control
@@ -1469,7 +1464,7 @@ struct xhci_port_cap {
 };
 
 struct xhci_port {
-	__le32 __iomem		*addr;
+	struct xhci_port_regs __iomem	*addr;
 	int			hw_portnum;
 	int			hcd_portnum;
 	struct xhci_hub		*rhub;
-- 
2.50.1


