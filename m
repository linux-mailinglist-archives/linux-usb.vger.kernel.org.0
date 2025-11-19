Return-Path: <linux-usb+bounces-30723-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEDCC6F56A
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D7281500570
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1082F60A1;
	Wed, 19 Nov 2025 14:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1SZks9m"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8267836C0CB
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 14:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562311; cv=none; b=OEwmfqg4qSK2MDci+MFSHHyJAowMh5hiu62OOdZRgunFNwJWx2jW/QNgQHNg8TyNb/qayL34iCAC0ic5yS52j60AOxdHEJUDXuJzMa05C0zjbZAgWAHkspL5+AtayjdE8Or3Z3sTETiJxj26/I7fPLZ/QO4ARI4QOb7brtWA7OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562311; c=relaxed/simple;
	bh=kOcZda2x7JPb7PjBiI2ZsBWq3ctpLNRz3gdR7OR6wTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EIBq9TSRKMIn0SKyFkBOPI3bKjYH8FzMNgCLL7VXmdrd/dyp7uWwkZrVtGgjwr2GxD5LPVlzTinjACdgILcY2kGIVW+zKR8sibWoMM+kgPHF5Gz6MouTtcEfJ5Pl5gdSrZsKQwm1n7E0OmwnlssFK+18qXVKqWuDmGR7lsE15PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1SZks9m; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763562310; x=1795098310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kOcZda2x7JPb7PjBiI2ZsBWq3ctpLNRz3gdR7OR6wTw=;
  b=B1SZks9mkesqbPZPQB5Mo4gxONpiEiFXfKipeBopfoeSwJTds7TSslpg
   UxPkx2gdjTY8NzoP0QYmAvTWeAYqkL3L1RAGY7VMN9kicTcZR//mOC53Y
   bW3PGZk2wVdofKN6kFpHX7vwFSLgeGVxPBx2S4ni2juIpZvgbXOMdglGf
   5v9Gy9s6BvPVY50OXDfV/xt8ujE+hniIl04NZQeHMAdqJTaWDeHRumPxR
   1V7sw22kvSMgD4FMcZNEOfbuenGO6BtwGoVjUsU4yhC0Iv6uZfcMWbPyr
   n1MOBGHkT+EzwVh/6xxbsf2oyB8ikqe9lYrU37thwZ2qPkeTUsaCtqI3b
   g==;
X-CSE-ConnectionGUID: G/UlQot2TP6aurfmt+7YeA==
X-CSE-MsgGUID: CfMcV+fdTDSBzHqauDOYxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65645606"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65645606"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:25:10 -0800
X-CSE-ConnectionGUID: CVegh4WOTrSbOzv36AK7jg==
X-CSE-MsgGUID: p2/5w4akSK+0CF6JQKtv0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221992230"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:25:08 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 22/23] usb: xhci: standardize single bit-field macros
Date: Wed, 19 Nov 2025 16:24:16 +0200
Message-ID: <20251119142417.2820519-23-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
References: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Convert single bit-field macros to simple masks. The change makes the
masks more universal. Multi bit-field macros are changed in the next
commit. After both changes, all masks in xhci-caps.h will follow the
same format. I plan to introduce this change to all xhci macros.

Bit shift operations on a 32-bit signed can be problematic on some
architectures. Instead use BIT() macro, which returns a 64-bit unsigned
value. This ensures that the shift operation is performed on an unsigned
type, which is safer and more portable across different architectures.
Using unsigned integers for bit shifts avoids issues related to sign bits
and ensures consistent behavior.

Switch from 32-bit to 64-bit?
As far as I am aware, this does not cause any issues.
Performing bitwise operations between 32 and 64 bit values, the smaller
operand is promoted to match the size of the larger one, resulting in a
64-bit operation. This promotion extends the 32-bit value to 64 bits,
by zero-padding (for unsigned).

Will the change to 64-bit slow down the xhci driver?
On a 64-bit architecture - No. On a 32-bit architecture, yes? but in my
opinion the performance decrease does not outweigh the readability and
other benefits of using BIT() macro.

Why not use FIELD_GET() and FIELD_PREP()?
While they can be used for single bit macros, I prefer to use simple
bitwise operation directly. Because, it takes less space, is less overhead
and is as clear as if using FIELD_GET() and FIELD_PREP().

Why not use test_bit() macro?
Same reason as with FIELD_GET() and FIELD_PREP().

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-caps.h    | 48 +++++++++++++++++----------------
 drivers/usb/host/xhci-debugfs.c |  2 +-
 drivers/usb/host/xhci-hub.c     |  6 ++---
 drivers/usb/host/xhci-mem.c     |  7 +++--
 drivers/usb/host/xhci-ring.c    |  8 +++---
 drivers/usb/host/xhci-trace.h   |  2 +-
 drivers/usb/host/xhci.c         |  2 +-
 7 files changed, 38 insertions(+), 37 deletions(-)

diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
index 99557df89f88..52153c4a43a8 100644
--- a/drivers/usb/host/xhci-caps.h
+++ b/drivers/usb/host/xhci-caps.h
@@ -4,6 +4,8 @@
  * xHCI Specification Section 5.3, Revision 1.2.
  */
 
+#include <linux/bits.h>
+
 /* hc_capbase - bitmasks */
 /* bits 7:0 - Capability Registers Length */
 #define HC_LENGTH(p)		((p) & 0xff)
@@ -32,7 +34,7 @@
  * xHCI specification section 5.3.4.
  */
 #define HCS_IST_VALUE(p)	((p) & 0x7)
-#define HCS_IST_UNIT(p)		((p) & (1 << 3))
+#define HCS_IST_UNIT		BIT(3)
 /* bits 7:4 - Event Ring Segment Table Max, 2^(n) */
 #define HCS_ERST_MAX(p)		(((p) >> 4) & 0xf)
 /* bits 20:8 - Rsvd */
@@ -52,28 +54,28 @@
 
 /* HCCPARAMS1 - hcc_params - bitmasks */
 /* bit 0 - 64-bit Addressing Capability */
-#define HCC_64BIT_ADDR(p)	((p) & (1 << 0))
+#define HCC_64BIT_ADDR		BIT(0)
 /* bit 1 - BW Negotiation Capability */
-#define HCC_BANDWIDTH_NEG(p)	((p) & (1 << 1))
+#define HCC_BANDWIDTH_NEG	BIT(1)
 /* bit 2 - Context Size */
-#define HCC_64BYTE_CONTEXT(p)	((p) & (1 << 2))
-#define CTX_SIZE(_hcc)		(HCC_64BYTE_CONTEXT(_hcc) ? 64 : 32)
+#define HCC_64BYTE_CONTEXT	BIT(2)
+#define CTX_SIZE(_hcc)		(_hcc & HCC_64BYTE_CONTEXT ? 64 : 32)
 /* bit 3 - Port Power Control */
-#define HCC_PPC(p)		((p) & (1 << 3))
+#define HCC_PPC			BIT(3)
 /* bit 4 - Port Indicators */
-#define HCS_INDICATOR(p)	((p) & (1 << 4))
+#define HCS_INDICATOR		BIT(4)
 /* bit 5 - Light HC Reset Capability */
-#define HCC_LIGHT_RESET(p)	((p) & (1 << 5))
+#define HCC_LIGHT_RESET		BIT(5)
 /* bit 6 - Latency Tolerance Messaging Capability */
-#define HCC_LTC(p)		((p) & (1 << 6))
+#define HCC_LTC			BIT(6)
 /* bit 7 - No Secondary Stream ID Support */
-#define HCC_NSS(p)		((p) & (1 << 7))
+#define HCC_NSS			BIT(7)
 /* bit 8 - Parse All Event Data */
 /* bit 9 - Short Packet Capability */
-#define HCC_SPC(p)		((p) & (1 << 9))
+#define HCC_SPC			BIT(9)
 /* bit 10 - Stopped EDTLA Capability */
 /* bit 11 - Contiguous Frame ID Capability */
-#define HCC_CFC(p)		((p) & (1 << 11))
+#define HCC_CFC			BIT(11)
 /* bits 15:12 - Max size for Primary Stream Arrays, 2^(n+1) */
 #define HCC_MAX_PSA(p)		(1 << ((((p) >> 12) & 0xf) + 1))
 /* bits 31:16 - xHCI Extended Capabilities Pointer, from PCI base: 2^(n) */
@@ -91,26 +93,26 @@
 
 /* HCCPARAMS2 - hcc_params2 - bitmasks */
 /* bit 0 - U3 Entry Capability */
-#define	HCC2_U3C(p)		((p) & (1 << 0))
+#define	HCC2_U3C		BIT(0)
 /* bit 1 - Configure Endpoint Command Max Exit Latency Too Large Capability */
-#define	HCC2_CMC(p)		((p) & (1 << 1))
+#define	HCC2_CMC		BIT(1)
 /* bit 2 - Force Save Context Capabilitu */
-#define	HCC2_FSC(p)		((p) & (1 << 2))
+#define	HCC2_FSC		BIT(2)
 /* bit 3 - Compliance Transition Capability, false: compliance is enabled by default */
-#define	HCC2_CTC(p)		((p) & (1 << 3))
+#define	HCC2_CTC		BIT(3)
 /* bit 4 - Large ESIT Payload Capability, true: HC support ESIT payload > 48k */
-#define	HCC2_LEC(p)		((p) & (1 << 4))
+#define	HCC2_LEC		BIT(4)
 /* bit 5 - Configuration Information Capability */
-#define	HCC2_CIC(p)		((p) & (1 << 5))
+#define	HCC2_CIC		BIT(5)
 /* bit 6 - Extended TBC Capability, true: Isoc burst count > 65535 */
-#define	HCC2_ETC(p)		((p) & (1 << 6))
+#define	HCC2_ETC		BIT(6)
 /* bit 7 - Extended TBC TRB Status Capability */
-#define HCC2_ETC_TSC(p)         ((p) & (1 << 7))
+#define HCC2_ETC_TSC		BIT(7)
 /* bit 8 - Get/Set Extended Property Capability */
-#define HCC2_GSC(p)             ((p) & (1 << 8))
+#define HCC2_GSC		BIT(8)
 /* bit 9 - Virtualization Based Trusted I/O Capability */
-#define HCC2_VTC(p)             ((p) & (1 << 9))
+#define HCC2_VTC		BIT(9)
 /* bit 10 - Rsvd */
 /* bit 11 - HC support Double BW on a eUSB2 HS ISOC EP */
-#define HCC2_EUSB2_DIC(p)       ((p) & (1 << 11))
+#define HCC2_EUSB2_DIC		BIT(11)
 /* bits 31:12 - Rsvd */
diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index ae50b667a548..5322911576eb 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -355,7 +355,7 @@ static ssize_t xhci_port_write(struct file *file,  const char __user *ubuf,
 
 	if (!strncmp(buf, "compliance", 10)) {
 		/* If CTC is clear, compliance is enabled by default */
-		if (!HCC2_CTC(xhci->hcc_params2))
+		if (!(xhci->hcc_params2 & HCC2_CTC))
 			return count;
 		spin_lock_irqsave(&xhci->lock, flags);
 		/* compliance mode can only be enabled on ports in RxDetect */
diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index cf358e5c6642..04cc3d681495 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -110,7 +110,7 @@ static int xhci_create_usb3x_bos_desc(struct xhci_hcd *xhci, char *buf,
 	ss_cap->bU2DevExitLat = 0; /* set later */
 
 	reg = readl(&xhci->cap_regs->hcc_params);
-	if (HCC_LTC(reg))
+	if (reg & HCC_LTC)
 		ss_cap->bmAttributes |= USB_LTM_SUPPORT;
 
 	if ((xhci->quirks & XHCI_LPM_SUPPORT)) {
@@ -263,7 +263,7 @@ static void xhci_common_hub_descriptor(struct xhci_hcd *xhci,
 	desc->bNbrPorts = ports;
 	temp = 0;
 	/* Bits 1:0 - support per-port power switching, or power always on */
-	if (HCC_PPC(xhci->hcc_params))
+	if (xhci->hcc_params & HCC_PPC)
 		temp |= HUB_CHAR_INDV_PORT_LPSM;
 	else
 		temp |= HUB_CHAR_NO_LPSM;
@@ -1400,7 +1400,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			 * automatically entered as on 1.0 and prior.
 			 */
 			if (link_state == USB_SS_PORT_LS_COMP_MOD) {
-				if (!HCC2_CTC(xhci->hcc_params2)) {
+				if (!(xhci->hcc_params2 & HCC2_CTC)) {
 					xhci_dbg(xhci, "CTC flag is 0, port already supports entering compliance mode\n");
 					break;
 				}
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 2bbbf64a32c8..c708bdd69f16 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -463,7 +463,7 @@ struct xhci_container_ctx *xhci_alloc_container_ctx(struct xhci_hcd *xhci,
 		return NULL;
 
 	ctx->type = type;
-	ctx->size = HCC_64BYTE_CONTEXT(xhci->hcc_params) ? 2048 : 1024;
+	ctx->size = xhci->hcc_params & HCC_64BYTE_CONTEXT ? 2048 : 1024;
 	if (type == XHCI_CTX_TYPE_INPUT)
 		ctx->size += CTX_SIZE(xhci->hcc_params);
 
@@ -1344,7 +1344,7 @@ static u32 xhci_get_endpoint_mult(struct xhci_hcd *xhci,
 	bool lec;
 
 	/* xHCI 1.1 with LEC set does not use mult field, except intel eUSB2 */
-	lec = xhci->hci_version > 0x100 && HCC2_LEC(xhci->hcc_params2);
+	lec = xhci->hci_version > 0x100 && (xhci->hcc_params2 & HCC2_LEC);
 
 	/* eUSB2 double isoc bw devices are the only USB2 devices using mult */
 	if (usb_endpoint_is_hs_isoc_double(udev, ep) &&
@@ -1433,8 +1433,7 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 	ring_type = usb_endpoint_type(&ep->desc);
 
 	/* Ensure host supports double isoc bandwidth for eUSB2 devices */
-	if (usb_endpoint_is_hs_isoc_double(udev, ep) &&
-	    !HCC2_EUSB2_DIC(xhci->hcc_params2))	{
+	if (usb_endpoint_is_hs_isoc_double(udev, ep) && !(xhci->hcc_params2 & HCC2_EUSB2_DIC))	{
 		dev_dbg(&udev->dev, "Double Isoc Bandwidth not supported by xhci\n");
 		return -EINVAL;
 	}
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 104fd6f83265..2247fd9dd163 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3966,7 +3966,7 @@ static int xhci_ist_microframes(struct xhci_hcd *xhci)
 {
 	int ist = HCS_IST_VALUE(xhci->hcs_params2);
 
-	if (HCS_IST_UNIT(xhci->hcs_params2))
+	if (xhci->hcs_params2 & HCS_IST_UNIT)
 		ist *= 8;
 	return ist;
 }
@@ -4135,7 +4135,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		/* use SIA as default, if frame id is used overwrite it */
 		sia_frame_id = TRB_SIA;
 		if (!(urb->transfer_flags & URB_ISO_ASAP) &&
-		    HCC_CFC(xhci->hcc_params)) {
+		    (xhci->hcc_params & HCC_CFC)) {
 			frame_id = xhci_get_isoc_frame_id(xhci, urb, i);
 			if (frame_id >= 0)
 				sia_frame_id = TRB_FRAME_ID(frame_id);
@@ -4219,7 +4219,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	}
 
 	/* store the next frame id */
-	if (HCC_CFC(xhci->hcc_params))
+	if (xhci->hcc_params & HCC_CFC)
 		xep->next_frame_id = urb->start_frame + num_tds * urb->interval;
 
 	if (xhci_to_hcd(xhci)->self.bandwidth_isoc_reqs == 0) {
@@ -4298,7 +4298,7 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
 	check_interval(urb, ep_ctx);
 
 	/* Calculate the start frame and put it in urb->start_frame. */
-	if (HCC_CFC(xhci->hcc_params) && !list_empty(&ep_ring->td_list)) {
+	if ((xhci->hcc_params & HCC_CFC) && !list_empty(&ep_ring->td_list)) {
 		if (GET_EP_CTX_STATE(ep_ctx) ==	EP_STATE_RUNNING) {
 			urb->start_frame = xep->next_frame_id;
 			goto skip_start_over;
diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index 8e5b8e1282f7..724cba2dbb78 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -81,7 +81,7 @@ DECLARE_EVENT_CLASS(xhci_log_ctx,
 	),
 	TP_fast_assign(
 
-		__entry->ctx_64 = HCC_64BYTE_CONTEXT(xhci->hcc_params);
+		__entry->ctx_64 = xhci->hcc_params & HCC_64BYTE_CONTEXT;
 		__entry->ctx_type = ctx->type;
 		__entry->ctx_dma = ctx->dma;
 		__entry->ctx_va = ctx->bytes;
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 1e4032bf1223..57a74ffadc24 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5495,7 +5495,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 
 	/* Set dma_mask and coherent_dma_mask to 64-bits,
 	 * if xHC supports 64-bit addressing */
-	if (HCC_64BIT_ADDR(xhci->hcc_params) &&
+	if ((xhci->hcc_params & HCC_64BIT_ADDR) &&
 			!dma_set_mask(dev, DMA_BIT_MASK(64))) {
 		xhci_dbg(xhci, "Enabling 64-bit DMA addresses.\n");
 		dma_set_coherent_mask(dev, DMA_BIT_MASK(64));
-- 
2.43.0


