Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 215D530B5FF
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 04:44:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbhBBDoC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 22:44:02 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:54180 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231492AbhBBDoA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Feb 2021 22:44:00 -0500
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 99A9140131;
        Tue,  2 Feb 2021 03:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612237379; bh=XyOjkyqboCMi8d+WCgT9iWiLyTZMLjjLfwcF3EMhmr8=;
        h=Date:In-Reply-To:References:From:Subject:To:From;
        b=QvkL09qJ3RBJURK9AxkZr68C7U8o99avp62Hu0MXUroVfoxYGL/Bn0pXn+yVWRgV/
         1wv+g8TXtbbZL6rqrTyjdgmhSlsTCb5Vsafie9mDDWCJTmsOcf3xfbdyBOA9Nn6cfU
         grE9rDyJqGoLFiZCX6LzszRRa2jnakg0Lp+tgL4ZHREh5P7bvEoR/J6mmqJsi9QMSK
         IJo32KepACq8/T3Q3XcMpSIvV+1CL5lw1lDfyyUWi4M3OVn1//7lkRuTHg9keY0tS/
         6lnWRGOLid5qJCAfuwHe81Jj49TMxG9covjuUnaoH+7CJR9cMXINzlXPXHCLPRfVIb
         ocg9Ke5Jhvo5A==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 85F94A007C;
        Tue,  2 Feb 2021 03:42:58 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 01 Feb 2021 19:42:58 -0800
Date:   Mon, 01 Feb 2021 19:42:58 -0800
Message-Id: <f242d50158030eaa93235c54f29d14290b04f71e.1612237179.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
References: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 7/8] usb: xhci: Rewrite xhci_create_usb3_bos_desc()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The current xhci_create_usb3_bos_desc() uses a static bos structure and
various magic numbers and offset making it difficult to extend support
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
 drivers/usb/host/xhci-hub.c | 279 +++++++++++++++++++++++++++++++++++-
 1 file changed, 277 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 74c497fd3476..c095c30212e5 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -11,6 +11,7 @@
 
 #include <linux/slab.h>
 #include <asm/unaligned.h>
+#include <linux/bitfield.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -52,7 +53,281 @@ static u8 usb_bos_descriptor [] = {
 	0xb5, 0x40, 0x0a, 0x00,		/* 10Gbps, SSP, symmetric, tx, ID = 5 */
 };
 
-static int xhci_create_usb3_bos_desc(struct xhci_hcd *xhci, char *buf,
+static int xhci_fill_default_ssp_attr(struct xhci_hcd *xhci,
+		struct usb_ssp_cap_descriptor *ssp_cap)
+{
+	u32 attr;
+	u8 ssac;
+	int i;
+
+	attr = le32_to_cpu(ssp_cap->bmAttributes);
+	ssac = FIELD_GET(USB_SSP_SUBLINK_SPEED_ATTRIBS, attr);
+
+	/* Currently we only support USB 3.1 and 3.2 */
+	if (ssac != 3 && ssac != 7)
+		return -EINVAL;
+
+	/*
+	 * Map default xHCI port speed ID to SSID:
+	 *  SSID 4 = Symmetric SSP Gen1x1
+	 *  SSID 5 = Symmetric SSP Gen2x1
+	 *  SSID 6 = Symmetric SSP Gen1x2
+	 *  SSID 7 = Symmetric SSP Gen2x2
+	 */
+	for (i = 0; i < ssac + 1; i++) {
+		u8 ssid;
+		u8 type;
+		u8 lp;
+		u16 mantissa;
+
+		ssid = (i >> 1) + 4;
+
+		if (ssid > 4)
+			lp = USB_SSP_SUBLINK_SPEED_LP_SSP;
+		else
+			lp = USB_SSP_SUBLINK_SPEED_LP_SS;
+
+		if (ssid == 5 || ssid == 7)
+			mantissa = 10;
+		else
+			mantissa = 5;
+
+		if (i % 2)
+			type = USB_SSP_SUBLINK_SPEED_ST_SYM_TX;
+		else
+			type = USB_SSP_SUBLINK_SPEED_ST_SYM_RX;
+
+		ssp_cap->bmSublinkSpeedAttr[i] =
+			cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_SSID,
+					       ssid) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSE,
+					       USB_SSP_SUBLINK_SPEED_LSE_GBPS) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST, type) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LP, lp) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSM,
+					       mantissa));
+	}
+
+	return 0;
+}
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
+		/* Two SSA entries for each unique PSI ID, RX and TX */
+		if (port_cap->psi_count)
+			ssac = port_cap->psi_uid_count * 2 - 1;
+		else if (bcdUSB == 0x0320)
+			ssac = 7;
+		else
+			ssac = 3;
+
+		if (port_cap->psi_count)
+			ssic = port_cap->psi_count - 1;
+		else
+			ssic = (ssac + 1) / 2 - 1;
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
+		int ret;
+
+		ret = xhci_fill_default_ssp_attr(xhci, ssp_cap);
+		if (ret)
+			return ret;
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
@@ -1137,7 +1412,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		if (hcd->speed < HCD_USB3)
 			goto error;
 
-		retval = xhci_create_usb3_bos_desc(xhci, buf, wLength);
+		retval = xhci_create_usb3x_bos_desc(xhci, buf, wLength);
 		spin_unlock_irqrestore(&xhci->lock, flags);
 		return retval;
 	case GetPortStatus:
-- 
2.28.0

