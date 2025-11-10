Return-Path: <linux-usb+bounces-30296-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A09CC477DD
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 16:22:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D47B1888F9C
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 15:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C772B24E4AF;
	Mon, 10 Nov 2025 15:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l2ek5Jd4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DCB2522A7
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 15:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762787724; cv=none; b=RngXU7OHgdPzDrsoS2s7m7hDdDQ/GqRfq6OdcsxNZ1ipEyGJG0edZpBGi0HxBWpY+Ap8mMYu7+9OPKmjixbu2D1Fjl3DJK+VrEp9l2baJfhPszsmIbdz8qKQeNfvVLv2RS2SqAp3n8FUDEV0mnY0XHGBgfS04L+HJENWCU8K+po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762787724; c=relaxed/simple;
	bh=oI4TdBPEht8jEkJC1kdoTvAMLqUSXbOZJhuSzLwu7uI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mzAy8c7MZYtDE/MCfyys142VTidWDcyKLn8PvjqNW9YE8xwrunsF2SOS8u4yxTwMCQd7fb7SipPDjoMG03ehkJSAAEVZpIxXazakrNGzWpMRsytOY/d6Yj4RYUhWOMXlu87gZzd26UNi9s2Fxcfqe/e0YS61q15Yqf73S9B2gsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l2ek5Jd4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762787722; x=1794323722;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oI4TdBPEht8jEkJC1kdoTvAMLqUSXbOZJhuSzLwu7uI=;
  b=l2ek5Jd4i1fLzE/ve/C7AN+ELgRn/PSUrAiaXTzFShKxqlgbFGRfe6qD
   4ketSRm26E/IL8CSu8RadHKeNtLlhcEbxEyT85OKlrN7wUf+OKrQ9icE4
   kmw9nNMpyadAb5sbIaIKKIBWWyIjuaa+7KboURyeMhMCl9S/qj9hUt+Ih
   DcqPIBbhZudyqyRXysgR6JsDALvXmPKo4LuVZyXuqFeV/dJIlunSinHQ6
   a1pt4WqfoqtCLr4GSFSD7ivLe1kNVhFbdjCYRXbZpgu4lRRumWaSwnEh5
   RH3wCDwCM7QrcWsZ96JufbOx3Z1d6e34abfL+T2vP6jHvfajO1LVTlyt5
   g==;
X-CSE-ConnectionGUID: H/52K0W/T9i9vEvfcNkQyQ==
X-CSE-MsgGUID: oMXzjRA0RvOQrq4LOGMwgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64767793"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64767793"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 07:15:22 -0800
X-CSE-ConnectionGUID: wn+56dhiR82XwYmFUrXZFQ==
X-CSE-MsgGUID: Mbhl2ZxoTXyI1NYu48ehhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="219353916"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 10 Nov 2025 07:15:21 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 1A75795; Mon, 10 Nov 2025 16:15:20 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 11/13] usb: xhci: standardize single bit-field macros
Date: Mon, 10 Nov 2025 16:14:48 +0100
Message-ID: <20251110151450.635410-12-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110151450.635410-1-niklas.neronin@linux.intel.com>
References: <20251110151450.635410-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-caps.h    | 50 +++++++++++++++++----------------
 drivers/usb/host/xhci-debugfs.c |  2 +-
 drivers/usb/host/xhci-hub.c     |  6 ++--
 drivers/usb/host/xhci-mem.c     |  7 ++---
 drivers/usb/host/xhci-ring.c    |  8 +++---
 drivers/usb/host/xhci-trace.h   |  2 +-
 drivers/usb/host/xhci.c         |  2 +-
 7 files changed, 39 insertions(+), 38 deletions(-)

diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
index 99557df89f88..89dd46767885 100644
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
@@ -52,30 +54,30 @@
 
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
-#define HCC_MAX_PSA(p)		(1 << ((((p) >> 12) & 0xf) + 1))
+#define HCC_MAX_PSA(p)		BIT(((((p) >> 12) & 0xf) + 1))
 /* bits 31:16 - xHCI Extended Capabilities Pointer, from PCI base: 2^(n) */
 #define HCC_EXT_CAPS(p)		(((p) >> 16) & 0xffff)
 
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
index f0475cf8eef8..e45545fa3c66 100644
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
index e7c1952cffc5..422028ebce49 100644
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
index 98abf86e0910..06ff712c9cbe 100644
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
index 7b7c61d79d0a..8d69f82a997c 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3988,7 +3988,7 @@ static int xhci_ist_in_microseconds(u32 hcs_params2)
 {
 	int ist = HCS_IST_VALUE(hcs_params2);
 
-	if (HCS_IST_UNIT(hcs_params2))
+	if (hcs_params2 & HCS_IST_UNIT)
 		ist *= 8;
 	return ist;
 }
@@ -4157,7 +4157,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		/* use SIA as default, if frame id is used overwrite it */
 		sia_frame_id = TRB_SIA;
 		if (!(urb->transfer_flags & URB_ISO_ASAP) &&
-		    HCC_CFC(xhci->hcc_params)) {
+		    (xhci->hcc_params & HCC_CFC)) {
 			frame_id = xhci_get_isoc_frame_id(xhci, urb, i);
 			if (frame_id >= 0)
 				sia_frame_id = TRB_FRAME_ID(frame_id);
@@ -4241,7 +4241,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	}
 
 	/* store the next frame id */
-	if (HCC_CFC(xhci->hcc_params))
+	if (xhci->hcc_params & HCC_CFC)
 		xep->next_frame_id = urb->start_frame + num_tds * urb->interval;
 
 	if (xhci_to_hcd(xhci)->self.bandwidth_isoc_reqs == 0) {
@@ -4320,7 +4320,7 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
 	check_interval(urb, ep_ctx);
 
 	/* Calculate the start frame and put it in urb->start_frame. */
-	if (HCC_CFC(xhci->hcc_params) && !list_empty(&ep_ring->td_list)) {
+	if ((xhci->hcc_params & HCC_CFC) && !list_empty(&ep_ring->td_list)) {
 		if (GET_EP_CTX_STATE(ep_ctx) ==	EP_STATE_RUNNING) {
 			urb->start_frame = xep->next_frame_id;
 			goto skip_start_over;
diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index bf13da417f8e..c6baf82912de 100644
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
index 2015d37f863e..c7a377b34661 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5483,7 +5483,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 
 	/* Set dma_mask and coherent_dma_mask to 64-bits,
 	 * if xHC supports 64-bit addressing */
-	if (HCC_64BIT_ADDR(xhci->hcc_params) &&
+	if ((xhci->hcc_params & HCC_64BIT_ADDR) &&
 			!dma_set_mask(dev, DMA_BIT_MASK(64))) {
 		xhci_dbg(xhci, "Enabling 64-bit DMA addresses.\n");
 		dma_set_coherent_mask(dev, DMA_BIT_MASK(64));
-- 
2.50.1


