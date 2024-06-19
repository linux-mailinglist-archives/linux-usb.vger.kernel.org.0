Return-Path: <linux-usb+bounces-11436-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E2C90EBE5
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 15:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2EEACB265AB
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 13:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B1514F9C9;
	Wed, 19 Jun 2024 13:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAqxHcoi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40D4145B09
	for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2024 13:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718802076; cv=none; b=k2bN293ye4MLnnzhQBIlhz0mjvfM3WPck9A7f4rOdypfSN36ifmi+CVJ31H/eVPGojSyPFkqIADGXO7IgJ8/FC74uTlAlGO1rvxvIiUBjyppPe4QNy5HXsKInyXEATmF2g41qFgc3BHd5k/1HeqqqFiEfgzKHr5V9T/QXm7LZ/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718802076; c=relaxed/simple;
	bh=ErXBcQVpgZwVMiOGg1Byo/CgnZ1ue/CgTDjsTMPKvUk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m9tiN1ZPuQLSmxqZTcyUflHlX9gCt1fTsmLkFZ99B0L26M34pSqNwYQFNjlXdnaZ9AnWu3zxsBVd4zzzcwIgWwa6SNCUrdoKjMMfaY+28Yz8ZRIPg6mQY5ynDZgVjrMMV8sIuuyQpLzbO+6o1n4sqnLw8eLZuEXg3xMvGZB1UX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAqxHcoi; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718802076; x=1750338076;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ErXBcQVpgZwVMiOGg1Byo/CgnZ1ue/CgTDjsTMPKvUk=;
  b=AAqxHcoiIXbPjPVFW+5+Sihpb4GVnDZTIiupaT7lCqAiF4Z2Yh9g6dNu
   cGxUFn5xYMIGV4oskacwXmIJ600jF/Oenhg5gz56HTdBsIkcTm6M0EHSi
   XioI0VeeMzgR6jCLnVB+7E5WBpeqXvr14SKk33R4l7Nr3c3VcrLrO8lfK
   ZWdqZBDcXrEtSt4Y3eSYNCd5cN+RHxixUI65yxzr95E6T3IMPdE+JbLZ9
   Qf6MWM5UqkiFf+XyPsnT4FzeJs0QA9sOhhQV1ZeCaC8/Ft9oXwiWvqPTC
   pAguBEnzYJiYkig5PbZA5WPSR/Gqk0HQShsokg+CROgebzvFgcOKVRCpI
   A==;
X-CSE-ConnectionGUID: VrvpUzUxSL6nT9wFFr2NQQ==
X-CSE-MsgGUID: Cn6s3UA+TjWLUAbFA1N/xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15868291"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="15868291"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 06:01:15 -0700
X-CSE-ConnectionGUID: txj8F0Q1TRueFL2a662Fqw==
X-CSE-MsgGUID: T/p/uuDQTPe890GWf+9yKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="47040468"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa004.jf.intel.com with ESMTP; 19 Jun 2024 06:01:13 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <linux-usb@vger.kernel.org>,
	<gregkh@linuxfoundation.org>
Cc: mika.westerberg@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 1/4] xhci: Add USB4 tunnel detection for USB3 devices on Intel hosts
Date: Wed, 19 Jun 2024 16:03:02 +0300
Message-Id: <20240619130305.2617784-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240619130305.2617784-1-mathias.nyman@linux.intel.com>
References: <20240619130305.2617784-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Knowledge about tunneled devices is useful in order to correctly describe
the relationship between tunneled USB3 device and USB4 Host Interface,
ensuring proper suspend and resume order, and to be able to power down
Thunderbolt if there is no need for tunneling.

Intel hosts share if a USB3 connection is native or tunneled via vendor
specific "SPR eSS PORT" registers.

These vendor registers are available if host supports a vendor specific
SPR shadow extended capability with ID 206. Registers are per USB3 port
and 0x20 apart.

Knowing the tunneling status of the device connected to roothub is enough
as all its children will have the same status.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ext-caps.h |  5 +++++
 drivers/usb/host/xhci-hub.c      | 29 +++++++++++++++++++++++++++++
 drivers/usb/host/xhci.c          | 11 +++++++++++
 drivers/usb/host/xhci.h          |  1 +
 4 files changed, 46 insertions(+)

diff --git a/drivers/usb/host/xhci-ext-caps.h b/drivers/usb/host/xhci-ext-caps.h
index 96eb36a58738..67ecf7320c62 100644
--- a/drivers/usb/host/xhci-ext-caps.h
+++ b/drivers/usb/host/xhci-ext-caps.h
@@ -42,6 +42,7 @@
 #define XHCI_EXT_CAPS_DEBUG	10
 /* Vendor caps */
 #define XHCI_EXT_CAPS_VENDOR_INTEL	192
+#define XHCI_EXT_CAPS_INTEL_SPR_SHADOW	206
 /* USB Legacy Support Capability - section 7.1.1 */
 #define XHCI_HC_BIOS_OWNED	(1 << 16)
 #define XHCI_HC_OS_OWNED	(1 << 24)
@@ -64,6 +65,10 @@
 #define XHCI_HLC               (1 << 19)
 #define XHCI_BLC               (1 << 20)
 
+/* Intel SPR shadow capability */
+#define XHCI_INTEL_SPR_ESS_PORT_OFFSET  0x8ac4	/* SuperSpeed port control */
+#define XHCI_INTEL_SPR_TUNEN	BIT(4)		/* Tunnel mode enabled */
+
 /* command register values to disable interrupts and halt the HC */
 /* start/stop HC execution - do not write unless HC is halted*/
 #define XHCI_CMD_RUN		(1 << 0)
diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 61f083de6e19..a8043c15a390 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -752,6 +752,35 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
 	return xhci_reset(xhci, XHCI_RESET_SHORT_USEC);
 }
 
+/**
+ * xhci_port_is_tunneled() - Check if USB3 connection is tunneled over USB4
+ * @xhci: xhci host controller
+ * @port: USB3 port to be checked.
+ *
+ * Some hosts can detect if a USB3 connection is native USB3 or tunneled over
+ * USB4. Intel hosts expose this via vendor specific extended capability 206
+ * eSS PORT registers TUNEN (tunnel enabled) bit.
+ *
+ * A USB3 device must be connected to the port to detect the tunnel.
+ *
+ * Return: true if USB3 connection is tunneled over USB4
+ */
+bool xhci_port_is_tunneled(struct xhci_hcd *xhci, struct xhci_port *port)
+{
+	void __iomem *base;
+	u32 offset;
+
+	base = &xhci->cap_regs->hc_capbase;
+	offset = xhci_find_next_ext_cap(base, 0, XHCI_EXT_CAPS_INTEL_SPR_SHADOW);
+
+	if (offset && offset <= XHCI_INTEL_SPR_ESS_PORT_OFFSET) {
+		offset = XHCI_INTEL_SPR_ESS_PORT_OFFSET + port->hcd_portnum * 0x20;
+		return !!(readl(base + offset) & XHCI_INTEL_SPR_TUNEN);
+	}
+
+	return false;
+}
+
 void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
 			 u32 link_state)
 {
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 37eb37b0affa..a85173098de1 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4513,6 +4513,17 @@ static int xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev)
 	struct xhci_port *port;
 	u32 capability;
 
+	/* Check if USB3 device at root port is tunneled over USB4 */
+	if (hcd->speed >= HCD_USB3 && !udev->parent->parent) {
+		port = xhci->usb3_rhub.ports[udev->portnum - 1];
+
+		if (xhci_port_is_tunneled(xhci, port))
+			dev_dbg(&udev->dev, "tunneled over USB4 link\n");
+		else
+			dev_dbg(&udev->dev, "native USB 3.x link\n");
+		return 0;
+	}
+
 	if (hcd->speed >= HCD_USB3 || !udev->lpm_capable || !xhci->hw_lpm_support)
 		return 0;
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 78d014c4d884..d9f706d80ac6 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1926,6 +1926,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue, u16 wIndex,
 int xhci_hub_status_data(struct usb_hcd *hcd, char *buf);
 int xhci_find_raw_port_number(struct usb_hcd *hcd, int port1);
 struct xhci_hub *xhci_get_rhub(struct usb_hcd *hcd);
+bool xhci_port_is_tunneled(struct xhci_hcd *xhci, struct xhci_port *port);
 
 void xhci_hc_died(struct xhci_hcd *xhci);
 
-- 
2.25.1


