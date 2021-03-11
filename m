Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE60336AE1
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 04:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbhCKDni (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 22:43:38 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:50246 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230052AbhCKDng (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Mar 2021 22:43:36 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C6C04C0A3B;
        Thu, 11 Mar 2021 03:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1615434215; bh=iwmDQ2nikjZvptdzPW0+FAypfhypJN38hHSubHSyhrA=;
        h=Date:In-Reply-To:References:From:Subject:To:From;
        b=V6BwwexaZl5grdURj+uOy5V2D6pOS34sFKYhvc6to+1hw6TWZqYKiDrzD6dwD/oPb
         wTezYsQ8et4XW8GhcTvgI1eb5jTDdTAbER7cJsGF0syjdwTuiJdlv6Vg6GGTUawP0w
         ISUfd3SshBsQxifOxTiRFhdbJObAdalxEPcbxxkU5Ulgsa4UQMxzKE4qzj9pXzM0lk
         Ef4EvZQHxGcBTgPlaVkHKYw/pZPeiPQxI9HzTu6EYMILSdB8Y0p4o213xBJ2QWN7bc
         xNRXOHZqL/5hnEMATvY9Oprz8jPpt9S+P5Wh4JyuItvyvKGxBBQ2o16yv7MVBqkvPn
         572cdJqyG20lg==
Received: from lab-vbox (unknown [10.205.137.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 8BB49A006F;
        Thu, 11 Mar 2021 03:43:34 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Wed, 10 Mar 2021 19:43:34 -0800
Date:   Wed, 10 Mar 2021 19:43:34 -0800
Message-Id: <ce0acbbd0bd3c3c3a08e6418ab3bdb431a44bbfd.1615432770.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1615432770.git.Thinh.Nguyen@synopsys.com>
References: <cover.1615432770.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v3 8/8] usb: xhci: Remove unused function
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
 Changes in v3:
 - None
 Changes in v2:
 - None

 drivers/usb/host/xhci-hub.c | 147 ------------------------------------
 1 file changed, 147 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index eddd139c2260..e9b18fc17617 100644
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
 /* Default sublink speed attribute of each lane */
 static u32 ssp_cap_default_ssa[] = {
 	0x00050034, /* USB 3.0 SS Gen1x1 id:4 symmetric rx 5Gbps */
@@ -285,120 +252,6 @@ static int xhci_create_usb3x_bos_desc(struct xhci_hcd *xhci, char *buf,
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

