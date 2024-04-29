Return-Path: <linux-usb+bounces-9902-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C200D8B5AB9
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 16:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8119F284A2E
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 14:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E2A7A15C;
	Mon, 29 Apr 2024 14:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RYqZSvY/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB127580B
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 14:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399273; cv=none; b=qtkyOW/Q4NQIt1Z1G3123M51gwoX9P7/BcfzA5H8zD5FvxGBHBQ80Dk3Y1EmZJjx3/Ve5FCBIlR/1fIQFWbu+Q2ewbbS6yEmwIgtJ8rsu6Qp9Uyp+tPVFrVY9cIhSl7dxJf1fFeWceHpyeEhRJKt597wK85W3hzIEwfQTJt0JsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399273; c=relaxed/simple;
	bh=61nePizSv2lbpRAvQQgT5lWNxRYmKYIsnIKUv6mk8ss=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LRPualD35vZa6eaYWV8vo2qSLSs+8Hi4LEHW2AOdC9q/xJd9oXVTMcNIE7e59L4PndFut2CcWS4qDqu5EfGfZbpuzMwdWXnfbt+PTB8XaHxAORFjFmIo2wCqi2NUCG+HcGLBhiw/40xAQ7Jm786iYh9m8KId4pL4FoS3Ch7oR7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RYqZSvY/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714399272; x=1745935272;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=61nePizSv2lbpRAvQQgT5lWNxRYmKYIsnIKUv6mk8ss=;
  b=RYqZSvY//nPBgqAuVObLLBYbsyp6K7uPxhZrWOUk2CeMxkdE9CVcZxps
   eoQWf/fg7p19fTY93pwuWaYqOp1jbP5p41P/Mtr5mhIJWYLNoFTDRgbVi
   My2XOBESYTNzVr703F4yj6HiWK2PcMvzEs4hclNEoIuxa58x0Dcekq/HQ
   KHYV4JP/4/XIJYP34gprSfcB4AMkzaMfxWBo+Cowqxz2h/UtIKqLJiE3Y
   Kmem9h5mENBpzEwvtqFxATCedaH4LQD8EyiysTEPk5PWhjdSBTxW8hJ2p
   QMpfHX9an/34HUtavm2a9mj8AlBc0zYVV6YHPLBh+vOfaUAFyu19+Jxis
   g==;
X-CSE-ConnectionGUID: btygtLVBS42LHbMdCE6eig==
X-CSE-MsgGUID: Vv6tilyAQ06nJ10AHnvBZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9911456"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9911456"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 07:01:11 -0700
X-CSE-ConnectionGUID: /oJnT4zYTp+f5g32dFcT3Q==
X-CSE-MsgGUID: K0wl/2aZRdiVlPoWoUQZBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26521802"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2024 07:01:09 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 09/18] xhci: remove XHCI_TRUST_TX_LENGTH quirk
Date: Mon, 29 Apr 2024 17:02:36 +0300
Message-Id: <20240429140245.3955523-10-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
References: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If this quirk was set then driver would treat transfer events with
'Success' completion code as 'Short packet' if there were untransferred
bytes left.

This is so common that turn it into default behavior.

xhci_warn_ratelimited() is no longer used after this, so remove it.

A success event with untransferred bytes left doesn't always mean a
misbehaving controller. If there was an error mid a multi-TRB TD it's
allowed to issue a success event for the last TRB in that TD.

See xhci 1.2 spec 4.9.1 Transfer Descriptors

"Note: If an error is detected while processing a multi-TRB TD, the xHC
 shall generate a Transfer Event for the TRB that the error was detected
 on with the appropriate error Condition Code, then may advance to the
 next TD. If in the process of advancing to the next TD, a Transfer TRB
 is encountered with its IOC flag set, then the Condition Code of the
 Transfer Event generated for that Transfer TRB should be Success,
 because there was no error actually associated with the TRB that
 generated the Event. However, an xHC implementation may redundantly
 assert the original error Condition Code."

Co-developed-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c  | 15 ++-------------
 drivers/usb/host/xhci-rcar.c |  6 ++----
 drivers/usb/host/xhci-ring.c | 15 +++++----------
 drivers/usb/host/xhci.h      |  4 +---
 4 files changed, 10 insertions(+), 30 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 93b697648018..653b47c45591 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -270,17 +270,12 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 				"QUIRK: Fresco Logic revision %u "
 				"has broken MSI implementation",
 				pdev->revision);
-		xhci->quirks |= XHCI_TRUST_TX_LENGTH;
 	}
 
 	if (pdev->vendor == PCI_VENDOR_ID_FRESCO_LOGIC &&
 			pdev->device == PCI_DEVICE_ID_FRESCO_LOGIC_FL1009)
 		xhci->quirks |= XHCI_BROKEN_STREAMS;
 
-	if (pdev->vendor == PCI_VENDOR_ID_FRESCO_LOGIC &&
-			pdev->device == PCI_DEVICE_ID_FRESCO_LOGIC_FL1100)
-		xhci->quirks |= XHCI_TRUST_TX_LENGTH;
-
 	if (pdev->vendor == PCI_VENDOR_ID_NEC)
 		xhci->quirks |= XHCI_NEC_HOST;
 
@@ -307,11 +302,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 		xhci->quirks |= XHCI_RESET_ON_RESUME;
 	}
 
-	if (pdev->vendor == PCI_VENDOR_ID_AMD) {
-		xhci->quirks |= XHCI_TRUST_TX_LENGTH;
-		if (pdev->device == 0x43f7)
-			xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
-	}
+	if (pdev->vendor == PCI_VENDOR_ID_AMD && pdev->device == 0x43f7)
+		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
 
 	if ((pdev->vendor == PCI_VENDOR_ID_AMD) &&
 		((pdev->device == PCI_DEVICE_ID_AMD_PROMONTORYA_4) ||
@@ -399,12 +391,10 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	if (pdev->vendor == PCI_VENDOR_ID_ETRON &&
 			pdev->device == PCI_DEVICE_ID_EJ168) {
 		xhci->quirks |= XHCI_RESET_ON_RESUME;
-		xhci->quirks |= XHCI_TRUST_TX_LENGTH;
 		xhci->quirks |= XHCI_BROKEN_STREAMS;
 	}
 	if (pdev->vendor == PCI_VENDOR_ID_RENESAS &&
 	    pdev->device == 0x0014) {
-		xhci->quirks |= XHCI_TRUST_TX_LENGTH;
 		xhci->quirks |= XHCI_ZERO_64B_REGS;
 	}
 	if (pdev->vendor == PCI_VENDOR_ID_RENESAS &&
@@ -434,7 +424,6 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	}
 	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
 		pdev->device == PCI_DEVICE_ID_ASMEDIA_1042A_XHCI) {
-		xhci->quirks |= XHCI_TRUST_TX_LENGTH;
 		xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
 	}
 	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index ab9c5969e462..8b357647728c 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -214,8 +214,7 @@ static int xhci_rcar_resume_quirk(struct usb_hcd *hcd)
  */
 #define SET_XHCI_PLAT_PRIV_FOR_RCAR(firmware)				\
 	.firmware_name = firmware,					\
-	.quirks = XHCI_NO_64BIT_SUPPORT | XHCI_TRUST_TX_LENGTH |	\
-		  XHCI_SLOW_SUSPEND,					\
+	.quirks = XHCI_NO_64BIT_SUPPORT |  XHCI_SLOW_SUSPEND,		\
 	.init_quirk = xhci_rcar_init_quirk,				\
 	.plat_start = xhci_rcar_start,					\
 	.resume_quirk = xhci_rcar_resume_quirk,
@@ -229,8 +228,7 @@ static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen3 = {
 };
 
 static const struct xhci_plat_priv xhci_plat_renesas_rzv2m = {
-	.quirks = XHCI_NO_64BIT_SUPPORT | XHCI_TRUST_TX_LENGTH |
-		  XHCI_SLOW_SUSPEND,
+	.quirks = XHCI_NO_64BIT_SUPPORT | XHCI_SLOW_SUSPEND,
 	.init_quirk = xhci_rzv2m_init_quirk,
 	.plat_start = xhci_rzv2m_start,
 };
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 0a7c70ae5edc..07c529e072c9 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2397,8 +2397,7 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 			break;
 		if (remaining) {
 			frame->status = short_framestatus;
-			if (xhci->quirks & XHCI_TRUST_TX_LENGTH)
-				sum_trbs_for_length = true;
+			sum_trbs_for_length = true;
 			break;
 		}
 		frame->status = 0;
@@ -2648,15 +2647,11 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	 * transfer type
 	 */
 	case COMP_SUCCESS:
-		if (EVENT_TRB_LEN(le32_to_cpu(event->transfer_len)) == 0)
-			break;
-		if (xhci->quirks & XHCI_TRUST_TX_LENGTH ||
-		    ep_ring->last_td_was_short)
+		if (EVENT_TRB_LEN(le32_to_cpu(event->transfer_len)) != 0) {
 			trb_comp_code = COMP_SHORT_PACKET;
-		else
-			xhci_warn_ratelimited(xhci,
-					      "WARN Successful completion on short TX for slot %u ep %u: needs XHCI_TRUST_TX_LENGTH quirk?\n",
-					      slot_id, ep_index);
+			xhci_dbg(xhci, "Successful completion on short TX for slot %u ep %u with last td short %d\n",
+				 slot_id, ep_index, ep_ring->last_td_was_short);
+		}
 		break;
 	case COMP_SHORT_PACKET:
 		break;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 8c96dd6ef3d4..933f8a296014 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1588,7 +1588,7 @@ struct xhci_hcd {
 #define XHCI_RESET_ON_RESUME	BIT_ULL(7)
 #define	XHCI_SW_BW_CHECKING	BIT_ULL(8)
 #define XHCI_AMD_0x96_HOST	BIT_ULL(9)
-#define XHCI_TRUST_TX_LENGTH	BIT_ULL(10)
+#define XHCI_TRUST_TX_LENGTH	BIT_ULL(10) /* Deprecated */
 #define XHCI_LPM_SUPPORT	BIT_ULL(11)
 #define XHCI_INTEL_HOST		BIT_ULL(12)
 #define XHCI_SPURIOUS_REBOOT	BIT_ULL(13)
@@ -1725,8 +1725,6 @@ static inline bool xhci_has_one_roothub(struct xhci_hcd *xhci)
 	dev_err(xhci_to_hcd(xhci)->self.controller , fmt , ## args)
 #define xhci_warn(xhci, fmt, args...) \
 	dev_warn(xhci_to_hcd(xhci)->self.controller , fmt , ## args)
-#define xhci_warn_ratelimited(xhci, fmt, args...) \
-	dev_warn_ratelimited(xhci_to_hcd(xhci)->self.controller , fmt , ## args)
 #define xhci_info(xhci, fmt, args...) \
 	dev_info(xhci_to_hcd(xhci)->self.controller , fmt , ## args)
 
-- 
2.25.1


