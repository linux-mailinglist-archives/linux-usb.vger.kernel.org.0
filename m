Return-Path: <linux-usb+bounces-14398-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BB1966549
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 17:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4825285348
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 15:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159CE1B5311;
	Fri, 30 Aug 2024 15:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GH8Vv0Zq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6A31B1D42
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 15:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725031477; cv=none; b=qrn3R2n2YnUUssbj5HR9fCNlRTFNhDWO2TCr1yHf9Wnqr7nsfJ3aeSRF7UjdneV2QCk0btIBnHHIOO4yOi7pN+SSPhjP+w00pjvM7veRJTV1adqsYpbJPa1sltc5O+J71tPfLMlMXE2ozWfkJ6fRb8wuPvDoqM2HedyBuKwPcAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725031477; c=relaxed/simple;
	bh=y3G75Sxycr4SXNQRm3vvkou9hTLu/dECBZzXpy8AR1g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dt6AxiZG+Mpf+LdamiUxvcMQ6tbhnxC21aYGQ2dCCLg9hcmwygeQhCZPOvaUrH7QslOGg9Atvjl/fZa0SNnFLNeHf/2ne/AKQT+Qa9F11XkUJOA6Agtm48xGYBTkVN1RtUUgqmmDQr5hOvYtDDG9/6XbhpV9nC7OlH6uAaiRMf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GH8Vv0Zq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725031476; x=1756567476;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y3G75Sxycr4SXNQRm3vvkou9hTLu/dECBZzXpy8AR1g=;
  b=GH8Vv0Zq95+npGozYYH4KEOye0+VSYytyzWYpV/7DjlyB8mLJmkb9ynv
   BArv7BximJF3cPi30RIvV07uYNQhCbOdFGS0/BDv0+eOtFrTdH7/k24fq
   Oqr87WuSb6IjH92LxUbx11jbUXYq+GXfwsYAZpU2u6e2RlnSloIK4DJzE
   O9EeXLLCPAZ5SZYmUVE61xbJErRVK2fiDEXHOnZoaMMEuT3XEPSyZIThM
   JYnMS/7AkNRzHacnjWpNyunexKz9lJkt8NtaYc/mc6E9/xku6ajJLuPvE
   B9SojoS6qkfX0AZVuxrh+4vr9gm3xyNavwvtRy6cujVcGcUT03/dmi7OX
   A==;
X-CSE-ConnectionGUID: z7LmwSLDSL6e9OaGfWhZPA==
X-CSE-MsgGUID: MTsUO8W+TluuTP6TWdiIFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23861945"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="23861945"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 08:24:35 -0700
X-CSE-ConnectionGUID: llR6Bi/mRQevARFhNEircw==
X-CSE-MsgGUID: FQi63AU0QY6ja7JRz5RfAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="63981646"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 30 Aug 2024 08:24:33 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	mika.westerberg@linux.intel.com,
	mario.limonciello@amd.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 1/4] xhci: Add USB4 tunnel detection for USB3 devices on Intel hosts
Date: Fri, 30 Aug 2024 18:26:27 +0300
Message-Id: <20240830152630.3943215-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240830152630.3943215-1-mathias.nyman@linux.intel.com>
References: <20240830152630.3943215-1-mathias.nyman@linux.intel.com>
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
v2:
 minor return statement change, open up "return !!x"

 drivers/usb/host/xhci-ext-caps.h |  5 +++++
 drivers/usb/host/xhci-hub.c      | 31 +++++++++++++++++++++++++++++++
 drivers/usb/host/xhci.c          | 11 +++++++++++
 drivers/usb/host/xhci.h          |  1 +
 4 files changed, 48 insertions(+)

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
index 61f083de6e19..4ba910eadd3f 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -752,6 +752,37 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
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
+
+		if (readl(base + offset) & XHCI_INTEL_SPR_TUNEN)
+			return true;
+	}
+
+	return false;
+}
+
 void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
 			 u32 link_state)
 {
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index efdf4c228b8c..1ea2c91106b7 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4525,6 +4525,17 @@ static int xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev)
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
index ebd0afd59a60..aa1062a595b6 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1929,6 +1929,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue, u16 wIndex,
 int xhci_hub_status_data(struct usb_hcd *hcd, char *buf);
 int xhci_find_raw_port_number(struct usb_hcd *hcd, int port1);
 struct xhci_hub *xhci_get_rhub(struct usb_hcd *hcd);
+bool xhci_port_is_tunneled(struct xhci_hcd *xhci, struct xhci_port *port);
 
 void xhci_hc_died(struct xhci_hcd *xhci);
 
-- 
2.25.1


