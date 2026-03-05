Return-Path: <linux-usb+bounces-34076-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YI54NNNzqWl77wAAu9opvQ
	(envelope-from <linux-usb+bounces-34076-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 13:15:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D0D21169C
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 13:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79D7630692F2
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 12:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF92390CB8;
	Thu,  5 Mar 2026 12:15:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3925C396B6F
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 12:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.154.241.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772712907; cv=none; b=MRixyPzQMy7aGb9QxclqirAeYgVhrhiaIPLadkOGClqe+YtU2rBJH1HszLNuWGKOFCg5g6rQiRyQsQCyImClVjDccPporLDJSvH3QWymyqX4/TCjVrdYOpZ7iRsA6vrswQoQjoX+gW8JHBkpDVbiJdXpd4bm6H9TMDvd26jHtzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772712907; c=relaxed/simple;
	bh=Sx/V9+/HQIZ2kgY3ErU1BOulf8bqq0ZuHIzPkfWOggI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OOXAorA5hG4uF/TiOgZ9FmUBFb5x6E2OKLZwSqZ89TtplrfBLweTrvfoDKY8WItekwVhA8Er1PzCjTHGn7U8VQycJyn9Q5qr96J3jOa3YgozEULE6779A/ObuwxGwYpdo6eHLyALwUQv89E6lcMYYsckctGLt6cfdqABaCUISwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com; spf=pass smtp.mailfrom=lauterbach.com; arc=none smtp.client-ip=62.154.241.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id A56D748FB988;
	Thu, 05 Mar 2026 13:15:01 +0100 (CET)
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH v5 1/1] usb: dwc3: Support USB3340x ULPI PHY high-speed negotiation.
Date: Thu,  5 Mar 2026 13:14:52 +0100
Message-ID: <20260305121452.54082-2-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305121452.54082-1-ingo.rohloff@lauterbach.com>
References: <20260305121452.54082-1-ingo.rohloff@lauterbach.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 166a2dfb-2e12-4590-8fa5-72e30323519f
X-Bm-Transport-Timestamp: 1772712901731
X-Rspamd-Queue-Id: 64D0D21169C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34076-lists,linux-usb=lfdr.de];
	DMARC_NA(0.00)[lauterbach.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[ingo.rohloff@lauterbach.com,linux-usb@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,microchip.com:url]
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
 drivers/usb/dwc3/core.c | 20 ++++++++++++++++++++
 drivers/usb/dwc3/core.h |  4 ++++
 drivers/usb/dwc3/ulpi.c | 25 +++++++++++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index cacc4ec9f7ce..58899b1fa96d 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -782,6 +782,24 @@ static int dwc3_hs_phy_setup(struct dwc3 *dwc, int index)
 	return 0;
 }
 
+static void dwc3_ulpi_setup(struct dwc3 *dwc)
+{
+	int index;
+	u32 reg;
+
+	/* Don't do anything if there is no ULPI PHY */
+	if (!dwc->ulpi)
+		return;
+
+	if (dwc->enable_usb2_transceiver_delay) {
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
@@ -1363,6 +1381,8 @@ int dwc3_core_init(struct dwc3 *dwc)
 		dwc->ulpi_ready = true;
 	}
 
+	dwc3_ulpi_setup(dwc);
+
 	if (!dwc->phys_ready) {
 		ret = dwc3_core_get_phy(dwc);
 		if (ret)
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 67bcc8dccc89..7d0845184223 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -302,6 +302,7 @@
 #define DWC3_GUSB2PHYCFG_SUSPHY		BIT(6)
 #define DWC3_GUSB2PHYCFG_ULPI_UTMI	BIT(4)
 #define DWC3_GUSB2PHYCFG_ENBLSLPM	BIT(8)
+#define DWC3_GUSB2PHYCFG_XCVRDLY	BIT(9)
 #define DWC3_GUSB2PHYCFG_PHYIF(n)	(n << 3)
 #define DWC3_GUSB2PHYCFG_PHYIF_MASK	DWC3_GUSB2PHYCFG_PHYIF(1)
 #define DWC3_GUSB2PHYCFG_USBTRDTIM(n)	(n << 10)
@@ -1163,6 +1164,8 @@ struct dwc3_glue_ops {
  *	3	- Reserved
  * @dis_metastability_quirk: set to disable metastability quirk.
  * @dis_split_quirk: set to disable split boundary.
+ * @enable_usb2_transceiver_delay: Set to insert a delay before the
+ *			assertion of the TxValid signal during a HS Chirp.
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
index 57daad15f502..a256b7f5d78b 100644
--- a/drivers/usb/dwc3/ulpi.c
+++ b/drivers/usb/dwc3/ulpi.c
@@ -10,10 +10,13 @@
 #include <linux/delay.h>
 #include <linux/time64.h>
 #include <linux/ulpi/regs.h>
+#include <linux/ulpi/driver.h>
 
 #include "core.h"
 #include "io.h"
 
+#define USB_VENDOR_MICROCHIP 0x0424
+
 #define DWC3_ULPI_ADDR(a) \
 		((a >= ULPI_EXT_VENDOR_SPECIFIC) ? \
 		DWC3_GUSB2PHYACC_ADDR(ULPI_ACCESS_EXTENDED) | \
@@ -83,6 +86,26 @@ static const struct ulpi_ops dwc3_ulpi_ops = {
 	.write = dwc3_ulpi_write,
 };
 
+static void dwc3_ulpi_detect_config(struct dwc3 *dwc)
+{
+	struct ulpi *ulpi = dwc->ulpi;
+
+	switch (ulpi->id.vendor) {
+	case USB_VENDOR_MICROCHIP:
+		switch (ulpi->id.product) {
+		case 0x0009:
+			/* Microchip USB3340 ULPI PHY */
+			dwc->enable_usb2_transceiver_delay = true;
+			break;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+}
+
 int dwc3_ulpi_init(struct dwc3 *dwc)
 {
 	/* Register the interface */
@@ -92,6 +115,8 @@ int dwc3_ulpi_init(struct dwc3 *dwc)
 		return PTR_ERR(dwc->ulpi);
 	}
 
+	dwc3_ulpi_detect_config(dwc);
+
 	return 0;
 }
 
-- 
2.52.0


