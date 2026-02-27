Return-Path: <linux-usb+bounces-33785-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AaYFpicoWl8ugQAu9opvQ
	(envelope-from <linux-usb+bounces-33785-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 14:31:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C6D1B7ACA
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 14:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4742C30371B7
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 13:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D36B2C178D;
	Fri, 27 Feb 2026 13:31:00 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A9923A9B3
	for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 13:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.154.241.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772199060; cv=none; b=Z2v+gtimwGkuVF9ibxPeaiyOo7DpPlZleGNdTmGJChFV3OgvfUzirVHWNoxh0WuYFT4pjYjwcIZZvuQyv9XYB7Qeft+cEMSdZNFG+4gdewWBaNCtHRd9tt7El+YHguTi+C54iKMVe6W6XLsZWwEBIY8RnSRfDy/PZi/G6gZ812k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772199060; c=relaxed/simple;
	bh=N3eFkx0LcXEfYJKA8WCjfy0LfzH5T8IHpzjoSyfXaMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C443sVpEF1bL1MNTfr0d66l+PK4Gvab6AsCv42UXK2CxJGOFIMaWI1vg5NqxV1VWUD+w/yFxRpNDmpiTZe+9e1A5oqzksLRrI8ef5QCFjXou1otRdXDExjAfXepzNto/qrv0B/DNWD3pGvw9jLEpCO09UVqQJWFTpxedOlNsevQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com; spf=pass smtp.mailfrom=lauterbach.com; arc=none smtp.client-ip=62.154.241.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id 21B174BBCEB3;
	Fri, 27 Feb 2026 14:30:51 +0100 (CET)
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH v3 1/1] usb: dwc3: Support USB3340x ULPI PHY high-speed negotiation.
Date: Fri, 27 Feb 2026 14:30:38 +0100
Message-ID: <20260227133038.45150-2-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227133038.45150-1-ingo.rohloff@lauterbach.com>
References: <20260227133038.45150-1-ingo.rohloff@lauterbach.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 166a2dfb-2e12-4590-8fa5-72e30323519f
X-Bm-Transport-Timestamp: 1772199051191
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33785-lists,linux-usb=lfdr.de];
	DMARC_NA(0.00)[lauterbach.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[ingo.rohloff@lauterbach.com,linux-usb@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lauterbach.com:mid,lauterbach.com:email,microchip.com:url]
X-Rspamd-Queue-Id: F3C6D1B7ACA
X-Rspamd-Action: no action

The Microchip USB3340x ULPI PHY requires a delay when switching to the
high-speed transmitter. See:
    http://ww1.microchip.com/downloads/en/DeviceDoc/80000645A.pdf
    Module 2 "Device Enumeration Failure with Link IP Systems"

For details on the behavior and fix, refer to the AMD (formerly Xilinx)
forum post: "USB stuck in full speed mode with USB3340 ULPI PHY, ZynqMP."

This patch uses the USB PHY Vendor-ID and Product-ID to detect the
USB3340 PHY and then applies the necessary fix if this PHY is found.

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
---
 drivers/usb/dwc3/core.c | 16 +++++++++++++++
 drivers/usb/dwc3/core.h |  4 ++++
 drivers/usb/dwc3/ulpi.c | 43 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index cacc4ec9f7ce..cc1818635eb4 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -782,6 +782,20 @@ static int dwc3_hs_phy_setup(struct dwc3 *dwc, int index)
 	return 0;
 }
 
+static void dwc3_hs_apply_ulpi_quirks(struct dwc3 *dwc)
+{
+	if (dwc->enable_usb2_transceiver_delay) {
+		int index;
+		u32 reg;
+
+		for (index = 0; index < dwc->num_usb2_ports; index++) {
+			reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(index));
+			reg |= DWC3_GUSB2PHYCFG_XCVRDLY;
+			dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(index), reg);
+		}
+	}
+}
+
 /**
  * dwc3_phy_setup - Configure USB PHY Interface of DWC3 Core
  * @dwc: Pointer to our controller context structure
@@ -1361,6 +1375,8 @@ int dwc3_core_init(struct dwc3 *dwc)
 			return ret;
 		}
 		dwc->ulpi_ready = true;
+
+		dwc3_hs_apply_ulpi_quirks(dwc);
 	}
 
 	if (!dwc->phys_ready) {
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 67bcc8dccc89..94a2a55518c9 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -302,6 +302,7 @@
 #define DWC3_GUSB2PHYCFG_SUSPHY		BIT(6)
 #define DWC3_GUSB2PHYCFG_ULPI_UTMI	BIT(4)
 #define DWC3_GUSB2PHYCFG_ENBLSLPM	BIT(8)
+#define DWC3_GUSB2PHYCFG_XCVRDLY        BIT(9)
 #define DWC3_GUSB2PHYCFG_PHYIF(n)	(n << 3)
 #define DWC3_GUSB2PHYCFG_PHYIF_MASK	DWC3_GUSB2PHYCFG_PHYIF(1)
 #define DWC3_GUSB2PHYCFG_USBTRDTIM(n)	(n << 10)
@@ -1163,6 +1164,8 @@ struct dwc3_glue_ops {
  *	3	- Reserved
  * @dis_metastability_quirk: set to disable metastability quirk.
  * @dis_split_quirk: set to disable split boundary.
+ * @enable_usb2_transceiver_delay: Set to insert a delay before the
+ *                  assertion of the TxValid signal during a HS Chirp.
  * @sys_wakeup: set if the device may do system wakeup.
  * @wakeup_configured: set if the device is configured for remote wakeup.
  * @suspended: set to track suspend event due to U3/L2.
@@ -1406,6 +1409,7 @@ struct dwc3 {
 	unsigned		dis_metastability_quirk:1;
 
 	unsigned		dis_split_quirk:1;
+	unsigned		enable_usb2_transceiver_delay:1;
 	unsigned		async_callbacks:1;
 	unsigned		sys_wakeup:1;
 	unsigned		wakeup_configured:1;
diff --git a/drivers/usb/dwc3/ulpi.c b/drivers/usb/dwc3/ulpi.c
index 57daad15f502..e1a1a58f862c 100644
--- a/drivers/usb/dwc3/ulpi.c
+++ b/drivers/usb/dwc3/ulpi.c
@@ -14,6 +14,8 @@
 #include "core.h"
 #include "io.h"
 
+#define USB_VENDOR_MICROCHIP 0x0424
+
 #define DWC3_ULPI_ADDR(a) \
 		((a >= ULPI_EXT_VENDOR_SPECIFIC) ? \
 		DWC3_GUSB2PHYACC_ADDR(ULPI_ACCESS_EXTENDED) | \
@@ -83,6 +85,45 @@ static const struct ulpi_ops dwc3_ulpi_ops = {
 	.write = dwc3_ulpi_write,
 };
 
+static void dwc3_ulpi_detect_quirks(struct dwc3 *dwc)
+{
+	int ret;
+	u16 vendor_id, product_id;
+
+	/* Test the interface */
+	ret = dwc3_ulpi_write(dwc->dev, ULPI_SCRATCH, 0xaa);
+	if (ret < 0)
+		return;
+
+	ret = dwc3_ulpi_read(dwc->dev, ULPI_SCRATCH);
+	if (ret < 0)
+		return;
+
+	if (ret != 0xaa)
+		return;
+
+	vendor_id = dwc3_ulpi_read(dwc->dev, ULPI_VENDOR_ID_LOW);
+	vendor_id |= dwc3_ulpi_read(dwc->dev, ULPI_VENDOR_ID_HIGH) << 8;
+
+	product_id = dwc3_ulpi_read(dwc->dev, ULPI_PRODUCT_ID_LOW);
+	product_id |= dwc3_ulpi_read(dwc->dev, ULPI_PRODUCT_ID_HIGH) << 8;
+
+	pr_info(
+		"dwc3_ulpi: VendorID 0x%04x, ProductID 0x%04x\n",
+		vendor_id, product_id
+	);
+	switch (vendor_id) {
+	case USB_VENDOR_MICROCHIP:
+		switch (product_id) {
+		case 0x0009:
+			/* Microchip USB3340 ULPI PHY */
+			dwc->enable_usb2_transceiver_delay = true;
+			break;
+		}
+		break;
+	}
+}
+
 int dwc3_ulpi_init(struct dwc3 *dwc)
 {
 	/* Register the interface */
@@ -92,6 +133,8 @@ int dwc3_ulpi_init(struct dwc3 *dwc)
 		return PTR_ERR(dwc->ulpi);
 	}
 
+	dwc3_ulpi_detect_quirks(dwc);
+
 	return 0;
 }
 
-- 
2.52.0


