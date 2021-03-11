Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D21F7336ADF
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 04:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231142AbhCKDni (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 22:43:38 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:38288 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230495AbhCKDn3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Mar 2021 22:43:29 -0500
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 65C2A407E0;
        Thu, 11 Mar 2021 03:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1615434209; bh=cip8LPhpB7ZWMkUB+SzQ+V38zGWgg+LFDlfH9WwMqtI=;
        h=Date:In-Reply-To:References:From:Subject:To:From;
        b=IFyLSIzCu1Z/6o2N7KIsKLVn23eKBEB/cHJD35iziwhFrrX2bLOF0wKizPeMoNa/c
         Qo8QHOUwht1qK+qZw8m6MeCLylrfeHH2LSCjrAfwxFKcriwIdOOG/jAK35csgMU1TJ
         Tk3rstarVP1zDvccnD11I3uKy4sluVUJBe1yT4VmFxLT9qIt9YdzZMvsFY4Wdvy2Qh
         U7cAqXkdBGJM5IblT3QJ4YXAVXQdckIlLJr6yU5j70tArpYaJTsVRCG+hK7zZ8CoKP
         s6RCOKMgaT/HmDzbmWCrbDjUMIQO7Xpp0tKn0N+DwKg1qCHAbB+yltS9GA6BDKTsLT
         zmBOLsFeIF5Bw==
Received: from lab-vbox (unknown [10.205.137.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 44EA0A0096;
        Thu, 11 Mar 2021 03:43:28 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Wed, 10 Mar 2021 19:43:28 -0800
Date:   Wed, 10 Mar 2021 19:43:28 -0800
Message-Id: <19cd09b03f96346996270579fd27d38b8a6844aa.1615432770.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1615432770.git.Thinh.Nguyen@synopsys.com>
References: <cover.1615432770.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v3 7/8] usb: xhci: Rewrite xhci_create_usb3_bos_desc()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The current xhci_create_usb3_bos_desc() uses a static bos u8 array and
various magic numbers and offsets making it difficult to extend support
for USB 3.2. Let's rewrite this entire function to support dual-lane in
USB 3.2.

The hub driver matches the port speed ID from the extended port status
to the SSID of the sublink speed attributes to detect if the device
supports SuperSpeed Plus. Currently we don't provide the default gen1x2
and gen2x2 sublink speed capability descriptor for USB 3.2 roothub. The
USB stack depends on this to detect and match the correct speed.
In addition, if the xHCI host provides Protocol Speed ID (PSI)
capability, then make sure to convert Protocol Speed ID Mantissa and
Exponent (PSIM & PSIE) to lane speed for gen1x2 and gen2x2.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v3:
- None
Changes in v2:
- Use static array for SSA per Mathias suggestion
- Check bcdUSB >= 0x320 instead of bcdUSB == 0x320 per Mathias suggestion
- When host uses custom PSI, SSIC is the psi_uid_count and not SSAC. I missed
  this when transferring the previous logic over. Previous implementation
  was incorrect. Let's fix it here.

 drivers/usb/host/xhci-hub.c | 237 +++++++++++++++++++++++++++++++++++-
 1 file changed, 235 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 74c497fd3476..eddd139c2260 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -11,6 +11,7 @@
 
 #include <linux/slab.h>
 #include <asm/unaligned.h>
+#include <linux/bitfield.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -52,7 +53,239 @@ static u8 usb_bos_descriptor [] = {
 	0xb5, 0x40, 0x0a, 0x00,		/* 10Gbps, SSP, symmetric, tx, ID = 5 */
 };
 
-static int xhci_create_usb3_bos_desc(struct xhci_hcd *xhci, char *buf,
+/* Default sublink speed attribute of each lane */
+static u32 ssp_cap_default_ssa[] = {
+	0x00050034, /* USB 3.0 SS Gen1x1 id:4 symmetric rx 5Gbps */
+	0x000500b4, /* USB 3.0 SS Gen1x1 id:4 symmetric tx 5Gbps */
+	0x000a4035, /* USB 3.1 SSP Gen2x1 id:5 symmetric rx 10Gbps */
+	0x000a40b5, /* USB 3.1 SSP Gen2x1 id:5 symmetric tx 10Gbps */
+	0x00054036, /* USB 3.2 SSP Gen1x2 id:6 symmetric rx 5Gbps */
+	0x000540b6, /* USB 3.2 SSP Gen1x2 id:6 symmetric tx 5Gbps */
+	0x000a4037, /* USB 3.2 SSP Gen2x2 id:7 symmetric rx 10Gbps */
+	0x000a40b7, /* USB 3.2 SSP Gen2x2 id:7 symmetric tx 10Gbps */
+};
+
+static int xhci_create_usb3x_bos_desc(struct xhci_hcd *xhci, char *buf,
+				      u16 wLength)
+{
+	struct usb_bos_descriptor	*bos;
+	struct usb_ss_cap_descriptor	*ss_cap;
+	struct usb_ssp_cap_descriptor	*ssp_cap;
+	struct xhci_port_cap		*port_cap = NULL;
+	u16				bcdUSB;
+	u32				reg;
+	u32				min_rate = 0;
+	u8				min_ssid;
+	u8				ssac;
+	u8				ssic;
+	int				offset;
+	int				i;
+
+	/* BOS descriptor */
+	bos = (struct usb_bos_descriptor *)buf;
+	bos->bLength = USB_DT_BOS_SIZE;
+	bos->bDescriptorType = USB_DT_BOS;
+	bos->wTotalLength = cpu_to_le16(USB_DT_BOS_SIZE +
+					USB_DT_USB_SS_CAP_SIZE);
+	bos->bNumDeviceCaps = 1;
+
+	/* Create the descriptor for port with the highest revision */
+	for (i = 0; i < xhci->num_port_caps; i++) {
+		u8 major = xhci->port_caps[i].maj_rev;
+		u8 minor = xhci->port_caps[i].min_rev;
+		u16 rev = (major << 8) | minor;
+
+		if (i == 0 || bcdUSB < rev) {
+			bcdUSB = rev;
+			port_cap = &xhci->port_caps[i];
+		}
+	}
+
+	if (bcdUSB >= 0x0310) {
+		if (port_cap->psi_count) {
+			u8 num_sym_ssa = 0;
+
+			for (i = 0; i < port_cap->psi_count; i++) {
+				if ((port_cap->psi[i] & PLT_MASK) == PLT_SYM)
+					num_sym_ssa++;
+			}
+
+			ssac = port_cap->psi_count + num_sym_ssa - 1;
+			ssic = port_cap->psi_uid_count - 1;
+		} else {
+			if (bcdUSB >= 0x0320)
+				ssac = 7;
+			else
+				ssac = 3;
+
+			ssic = (ssac + 1) / 2 - 1;
+		}
+
+		bos->bNumDeviceCaps++;
+		bos->wTotalLength = cpu_to_le16(USB_DT_BOS_SIZE +
+						USB_DT_USB_SS_CAP_SIZE +
+						USB_DT_USB_SSP_CAP_SIZE(ssac));
+	}
+
+	if (wLength < USB_DT_BOS_SIZE + USB_DT_USB_SS_CAP_SIZE)
+		return wLength;
+
+	/* SuperSpeed USB Device Capability */
+	ss_cap = (struct usb_ss_cap_descriptor *)&buf[USB_DT_BOS_SIZE];
+	ss_cap->bLength = USB_DT_USB_SS_CAP_SIZE;
+	ss_cap->bDescriptorType = USB_DT_DEVICE_CAPABILITY;
+	ss_cap->bDevCapabilityType = USB_SS_CAP_TYPE;
+	ss_cap->bmAttributes = 0; /* set later */
+	ss_cap->wSpeedSupported = cpu_to_le16(USB_5GBPS_OPERATION);
+	ss_cap->bFunctionalitySupport = USB_LOW_SPEED_OPERATION;
+	ss_cap->bU1devExitLat = 0; /* set later */
+	ss_cap->bU2DevExitLat = 0; /* set later */
+
+	reg = readl(&xhci->cap_regs->hcc_params);
+	if (HCC_LTC(reg))
+		ss_cap->bmAttributes |= USB_LTM_SUPPORT;
+
+	if ((xhci->quirks & XHCI_LPM_SUPPORT)) {
+		reg = readl(&xhci->cap_regs->hcs_params3);
+		ss_cap->bU1devExitLat = HCS_U1_LATENCY(reg);
+		ss_cap->bU2DevExitLat = cpu_to_le16(HCS_U2_LATENCY(reg));
+	}
+
+	if (wLength < le16_to_cpu(bos->wTotalLength))
+		return wLength;
+
+	if (bcdUSB < 0x0310)
+		return le16_to_cpu(bos->wTotalLength);
+
+	ssp_cap = (struct usb_ssp_cap_descriptor *)&buf[USB_DT_BOS_SIZE +
+		USB_DT_USB_SS_CAP_SIZE];
+	ssp_cap->bLength = USB_DT_USB_SSP_CAP_SIZE(ssac);
+	ssp_cap->bDescriptorType = USB_DT_DEVICE_CAPABILITY;
+	ssp_cap->bDevCapabilityType = USB_SSP_CAP_TYPE;
+	ssp_cap->bReserved = 0;
+	ssp_cap->wReserved = 0;
+	ssp_cap->bmAttributes =
+		cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_ATTRIBS, ssac) |
+			    FIELD_PREP(USB_SSP_SUBLINK_SPEED_IDS, ssic));
+
+	if (!port_cap->psi_count) {
+		for (i = 0; i < ssac + 1; i++)
+			ssp_cap->bmSublinkSpeedAttr[i] =
+				cpu_to_le32(ssp_cap_default_ssa[i]);
+
+		min_ssid = 4;
+		goto out;
+	}
+
+	offset = 0;
+	for (i = 0; i < port_cap->psi_count; i++) {
+		u32 psi;
+		u32 attr;
+		u8 ssid;
+		u8 lp;
+		u8 lse;
+		u8 psie;
+		u16 lane_mantissa;
+		u16 psim;
+		u16 plt;
+
+		psi = port_cap->psi[i];
+		ssid = XHCI_EXT_PORT_PSIV(psi);
+		lp = XHCI_EXT_PORT_LP(psi);
+		psie = XHCI_EXT_PORT_PSIE(psi);
+		psim = XHCI_EXT_PORT_PSIM(psi);
+		plt = psi & PLT_MASK;
+
+		lse = psie;
+		lane_mantissa = psim;
+
+		/* Shift to Gbps and set SSP Link Protocol if 10Gpbs */
+		for (; psie < USB_SSP_SUBLINK_SPEED_LSE_GBPS; psie++)
+			psim /= 1000;
+
+		if (!min_rate || psim < min_rate) {
+			min_ssid = ssid;
+			min_rate = psim;
+		}
+
+		/* Some host controllers don't set the link protocol for SSP */
+		if (psim >= 10)
+			lp = USB_SSP_SUBLINK_SPEED_LP_SSP;
+
+		/*
+		 * PSIM and PSIE represent the total speed of PSI. The BOS
+		 * descriptor SSP sublink speed attribute lane mantissa
+		 * describes the lane speed. E.g. PSIM and PSIE for gen2x2
+		 * is 20Gbps, but the BOS descriptor lane speed mantissa is
+		 * 10Gbps. Check and modify the mantissa value to match the
+		 * lane speed.
+		 */
+		if (bcdUSB == 0x0320 && plt == PLT_SYM) {
+			/*
+			 * The PSI dword for gen1x2 and gen2x1 share the same
+			 * values. But the lane speed for gen1x2 is 5Gbps while
+			 * gen2x1 is 10Gbps. If the previous PSI dword SSID is
+			 * 5 and the PSIE and PSIM match with SSID 6, let's
+			 * assume that the controller follows the default speed
+			 * id with SSID 6 for gen1x2.
+			 */
+			if (ssid == 6 && psie == 3 && psim == 10 && i) {
+				u32 prev = port_cap->psi[i - 1];
+
+				if ((prev & PLT_MASK) == PLT_SYM &&
+				    XHCI_EXT_PORT_PSIV(prev) == 5 &&
+				    XHCI_EXT_PORT_PSIE(prev) == 3 &&
+				    XHCI_EXT_PORT_PSIM(prev) == 10) {
+					lse = USB_SSP_SUBLINK_SPEED_LSE_GBPS;
+					lane_mantissa = 5;
+				}
+			}
+
+			if (psie == 3 && psim > 10) {
+				lse = USB_SSP_SUBLINK_SPEED_LSE_GBPS;
+				lane_mantissa = 10;
+			}
+		}
+
+		attr = (FIELD_PREP(USB_SSP_SUBLINK_SPEED_SSID, ssid) |
+			FIELD_PREP(USB_SSP_SUBLINK_SPEED_LP, lp) |
+			FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSE, lse) |
+			FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSM, lane_mantissa));
+
+		switch (plt) {
+		case PLT_SYM:
+			attr |= FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST,
+					   USB_SSP_SUBLINK_SPEED_ST_SYM_RX);
+			ssp_cap->bmSublinkSpeedAttr[offset++] = cpu_to_le32(attr);
+
+			attr &= ~USB_SSP_SUBLINK_SPEED_ST;
+			attr |= FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST,
+					   USB_SSP_SUBLINK_SPEED_ST_SYM_TX);
+			ssp_cap->bmSublinkSpeedAttr[offset++] = cpu_to_le32(attr);
+			break;
+		case PLT_ASYM_RX:
+			attr |= FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST,
+					   USB_SSP_SUBLINK_SPEED_ST_ASYM_RX);
+			ssp_cap->bmSublinkSpeedAttr[offset++] = cpu_to_le32(attr);
+			break;
+		case PLT_ASYM_TX:
+			attr |= FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST,
+					   USB_SSP_SUBLINK_SPEED_ST_ASYM_TX);
+			ssp_cap->bmSublinkSpeedAttr[offset++] = cpu_to_le32(attr);
+			break;
+		}
+	}
+out:
+	ssp_cap->wFunctionalitySupport =
+		cpu_to_le16(FIELD_PREP(USB_SSP_MIN_SUBLINK_SPEED_ATTRIBUTE_ID,
+				       min_ssid) |
+			    FIELD_PREP(USB_SSP_MIN_RX_LANE_COUNT, 1) |
+			    FIELD_PREP(USB_SSP_MIN_TX_LANE_COUNT, 1));
+
+	return le16_to_cpu(bos->wTotalLength);
+}
+
+static __maybe_unused int xhci_create_usb3_bos_desc(struct xhci_hcd *xhci, char *buf,
 				     u16 wLength)
 {
 	struct xhci_port_cap *port_cap = NULL;
@@ -1137,7 +1370,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		if (hcd->speed < HCD_USB3)
 			goto error;
 
-		retval = xhci_create_usb3_bos_desc(xhci, buf, wLength);
+		retval = xhci_create_usb3x_bos_desc(xhci, buf, wLength);
 		spin_unlock_irqrestore(&xhci->lock, flags);
 		return retval;
 	case GetPortStatus:
-- 
2.28.0

