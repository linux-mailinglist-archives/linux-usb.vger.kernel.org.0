Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D6230B600
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 04:44:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231503AbhBBDoH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 22:44:07 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:54194 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231492AbhBBDoG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Feb 2021 22:44:06 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AD0084014D;
        Tue,  2 Feb 2021 03:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612237385; bh=BWdruNwtky104owNHJKz0l2PkUzzVgT0ZBN7bDedu7g=;
        h=Date:In-Reply-To:References:From:Subject:To:From;
        b=RRW2fZ/BPQXOnZ9x6Z3/evYqs3EvaXCS7Zfod5VG/VykczB/aneA4jbaMUQK8sRa1
         FQlIjom1SHGa1DHNKZqSliGaM6Ur83u3gFNWmwhBbhB/FfYPmdrVX6rRhkCi0dOHLo
         rdPZTFfXxsFjUh0/IS9sV5jixIEJAo1VF0W/tMhAKhT09C3M7gEZ2G67Kf7n6llCcK
         /B0QSnHffNVJwv++ZpJ9Jjy0KDjDQmoqIip4sb0r4gtK9wSjaWUkmGoJcGNVUGwjDI
         p2EM4olkld1G42lo2vg+xPyQE4nhDAWDhYTw7iBTuSEl0EPrPiU9PLWQ2mSjBpdZ8K
         xzQBuoRAUCASQ==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 99B11A006F;
        Tue,  2 Feb 2021 03:43:04 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 01 Feb 2021 19:43:04 -0800
Date:   Mon, 01 Feb 2021 19:43:04 -0800
Message-Id: <a6c57f1987a0ea0fec3c1c3e200843b7417d53b3.1612237179.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
References: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 8/8] usb: xhci: Remove unused function
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Now that we replaced the xhci_create_usb3_bos_desc() function. We can
remove it along with the static usb_bos_descriptor structure.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/host/xhci-hub.c | 147 ------------------------------------
 1 file changed, 147 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index c095c30212e5..411d5ae9f501 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -20,39 +20,6 @@
 #define	PORT_RWC_BITS	(PORT_CSC | PORT_PEC | PORT_WRC | PORT_OCC | \
 			 PORT_RC | PORT_PLC | PORT_PE)
 
-/* USB 3 BOS descriptor and a capability descriptors, combined.
- * Fields will be adjusted and added later in xhci_create_usb3_bos_desc()
- */
-static u8 usb_bos_descriptor [] = {
-	USB_DT_BOS_SIZE,		/*  __u8 bLength, 5 bytes */
-	USB_DT_BOS,			/*  __u8 bDescriptorType */
-	0x0F, 0x00,			/*  __le16 wTotalLength, 15 bytes */
-	0x1,				/*  __u8 bNumDeviceCaps */
-	/* First device capability, SuperSpeed */
-	USB_DT_USB_SS_CAP_SIZE,		/*  __u8 bLength, 10 bytes */
-	USB_DT_DEVICE_CAPABILITY,	/* Device Capability */
-	USB_SS_CAP_TYPE,		/* bDevCapabilityType, SUPERSPEED_USB */
-	0x00,				/* bmAttributes, LTM off by default */
-	USB_5GBPS_OPERATION, 0x00,	/* wSpeedsSupported, 5Gbps only */
-	0x03,				/* bFunctionalitySupport,
-					   USB 3.0 speed only */
-	0x00,				/* bU1DevExitLat, set later. */
-	0x00, 0x00,			/* __le16 bU2DevExitLat, set later. */
-	/* Second device capability, SuperSpeedPlus */
-	0x1c,				/* bLength 28, will be adjusted later */
-	USB_DT_DEVICE_CAPABILITY,	/* Device Capability */
-	USB_SSP_CAP_TYPE,		/* bDevCapabilityType SUPERSPEED_PLUS */
-	0x00,				/* bReserved 0 */
-	0x23, 0x00, 0x00, 0x00,		/* bmAttributes, SSAC=3 SSIC=1 */
-	0x01, 0x00,			/* wFunctionalitySupport */
-	0x00, 0x00,			/* wReserved 0 */
-	/* Default Sublink Speed Attributes, overwrite if custom PSI exists */
-	0x34, 0x00, 0x05, 0x00,		/* 5Gbps, symmetric, rx, ID = 4 */
-	0xb4, 0x00, 0x05, 0x00,		/* 5Gbps, symmetric, tx, ID = 4 */
-	0x35, 0x40, 0x0a, 0x00,		/* 10Gbps, SSP, symmetric, rx, ID = 5 */
-	0xb5, 0x40, 0x0a, 0x00,		/* 10Gbps, SSP, symmetric, tx, ID = 5 */
-};
-
 static int xhci_fill_default_ssp_attr(struct xhci_hcd *xhci,
 		struct usb_ssp_cap_descriptor *ssp_cap)
 {
@@ -327,120 +294,6 @@ static int xhci_create_usb3x_bos_desc(struct xhci_hcd *xhci, char *buf,
 	return le16_to_cpu(bos->wTotalLength);
 }
 
-static __maybe_unused int xhci_create_usb3_bos_desc(struct xhci_hcd *xhci, char *buf,
-				     u16 wLength)
-{
-	struct xhci_port_cap *port_cap = NULL;
-	int i, ssa_count;
-	u32 temp;
-	u16 desc_size, ssp_cap_size, ssa_size = 0;
-	bool usb3_1 = false;
-
-	desc_size = USB_DT_BOS_SIZE + USB_DT_USB_SS_CAP_SIZE;
-	ssp_cap_size = sizeof(usb_bos_descriptor) - desc_size;
-
-	/* does xhci support USB 3.1 Enhanced SuperSpeed */
-	for (i = 0; i < xhci->num_port_caps; i++) {
-		if (xhci->port_caps[i].maj_rev == 0x03 &&
-		    xhci->port_caps[i].min_rev >= 0x01) {
-			usb3_1 = true;
-			port_cap = &xhci->port_caps[i];
-			break;
-		}
-	}
-
-	if (usb3_1) {
-		/* does xhci provide a PSI table for SSA speed attributes? */
-		if (port_cap->psi_count) {
-			/* two SSA entries for each unique PSI ID, RX and TX */
-			ssa_count = port_cap->psi_uid_count * 2;
-			ssa_size = ssa_count * sizeof(u32);
-			ssp_cap_size -= 16; /* skip copying the default SSA */
-		}
-		desc_size += ssp_cap_size;
-	}
-	memcpy(buf, &usb_bos_descriptor, min(desc_size, wLength));
-
-	if (usb3_1) {
-		/* modify bos descriptor bNumDeviceCaps and wTotalLength */
-		buf[4] += 1;
-		put_unaligned_le16(desc_size + ssa_size, &buf[2]);
-	}
-
-	if (wLength < USB_DT_BOS_SIZE + USB_DT_USB_SS_CAP_SIZE)
-		return wLength;
-
-	/* Indicate whether the host has LTM support. */
-	temp = readl(&xhci->cap_regs->hcc_params);
-	if (HCC_LTC(temp))
-		buf[8] |= USB_LTM_SUPPORT;
-
-	/* Set the U1 and U2 exit latencies. */
-	if ((xhci->quirks & XHCI_LPM_SUPPORT)) {
-		temp = readl(&xhci->cap_regs->hcs_params3);
-		buf[12] = HCS_U1_LATENCY(temp);
-		put_unaligned_le16(HCS_U2_LATENCY(temp), &buf[13]);
-	}
-
-	/* If PSI table exists, add the custom speed attributes from it */
-	if (usb3_1 && port_cap->psi_count) {
-		u32 ssp_cap_base, bm_attrib, psi, psi_mant, psi_exp;
-		int offset;
-
-		ssp_cap_base = USB_DT_BOS_SIZE + USB_DT_USB_SS_CAP_SIZE;
-
-		if (wLength < desc_size)
-			return wLength;
-		buf[ssp_cap_base] = ssp_cap_size + ssa_size;
-
-		/* attribute count SSAC bits 4:0 and ID count SSIC bits 8:5 */
-		bm_attrib = (ssa_count - 1) & 0x1f;
-		bm_attrib |= (port_cap->psi_uid_count - 1) << 5;
-		put_unaligned_le32(bm_attrib, &buf[ssp_cap_base + 4]);
-
-		if (wLength < desc_size + ssa_size)
-			return wLength;
-		/*
-		 * Create the Sublink Speed Attributes (SSA) array.
-		 * The xhci PSI field and USB 3.1 SSA fields are very similar,
-		 * but link type bits 7:6 differ for values 01b and 10b.
-		 * xhci has also only one PSI entry for a symmetric link when
-		 * USB 3.1 requires two SSA entries (RX and TX) for every link
-		 */
-		offset = desc_size;
-		for (i = 0; i < port_cap->psi_count; i++) {
-			psi = port_cap->psi[i];
-			psi &= ~USB_SSP_SUBLINK_SPEED_RSVD;
-			psi_exp = XHCI_EXT_PORT_PSIE(psi);
-			psi_mant = XHCI_EXT_PORT_PSIM(psi);
-
-			/* Shift to Gbps and set SSP Link BIT(14) if 10Gpbs */
-			for (; psi_exp < 3; psi_exp++)
-				psi_mant /= 1000;
-			if (psi_mant >= 10)
-				psi |= BIT(14);
-
-			if ((psi & PLT_MASK) == PLT_SYM) {
-			/* Symmetric, create SSA RX and TX from one PSI entry */
-				put_unaligned_le32(psi, &buf[offset]);
-				psi |= 1 << 7;  /* turn entry to TX */
-				offset += 4;
-				if (offset >= desc_size + ssa_size)
-					return desc_size + ssa_size;
-			} else if ((psi & PLT_MASK) == PLT_ASYM_RX) {
-				/* Asymetric RX, flip bits 7:6 for SSA */
-				psi ^= PLT_MASK;
-			}
-			put_unaligned_le32(psi, &buf[offset]);
-			offset += 4;
-			if (offset >= desc_size + ssa_size)
-				return desc_size + ssa_size;
-		}
-	}
-	/* ssa_size is 0 for other than usb 3.1 hosts */
-	return desc_size + ssa_size;
-}
-
 static void xhci_common_hub_descriptor(struct xhci_hcd *xhci,
 		struct usb_hub_descriptor *desc, int ports)
 {
-- 
2.28.0

