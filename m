Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92A193B2F3
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 12:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389309AbfFJKTc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 06:19:32 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:15636 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389291AbfFJKTb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jun 2019 06:19:31 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cfe2eb30000>; Mon, 10 Jun 2019 03:19:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 10 Jun 2019 03:19:30 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 10 Jun 2019 03:19:30 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Jun
 2019 10:19:29 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 10 Jun 2019 10:19:30 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.65.118]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cfe2eaf0000>; Mon, 10 Jun 2019 03:19:29 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V4 1/8] phy: tegra: xusb: t210: add XUSB dual mode support
Date:   Mon, 10 Jun 2019 15:49:02 +0530
Message-ID: <1560161949-26031-2-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560161949-26031-1-git-send-email-nkristam@nvidia.com>
References: <1560161949-26031-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560161971; bh=/weiYn4MWFg07I0Q451sy4ZS9uWNb+MsH29Wx7eurN0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=T2Spu86vvLtTRX3IEtNAGI3UUQ9YIamO+z1CxfIA9jiAh3eCi9DqKAqQVIg3Po7eD
         i/ftFc8FkDYxYjfM09AXrNH7EWK6WwMLGsrffgC2dH7G6C90Fd4yfzEtGBWqZmfe6B
         QTcfV9uClg3QRjzuyQUqU6/FvDn4/oupcgv8u6NbOqCgEYq0fKE022oh96jnvdZxhN
         fFj2SRLKU+5R4IR5u3Av8cKWDAQmb19r3kqsCPZf5KgI4hAFYruxwQYX7rweIKAVs5
         WQmF17fQ36xPdx49okE6SpjhtLEUAYRadbaWv/EedcVfUvjeocUjnDEIexg2s+tzS5
         FUJpNFk6KXGKA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Configure the port capabilities based on usb_dr_mode settings.

Based on work by JC Kuo <jckuo@nvidia.com>.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
Reviewed-by: JC Kuo <jckuo@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
 drivers/phy/tegra/xusb-tegra210.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index 05bee32..4beebcc 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (c) 2014, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2014-2019, NVIDIA CORPORATION.  All rights reserved.
  * Copyright (C) 2015 Google, Inc.
  *
  * This program is free software; you can redistribute it and/or modify it
@@ -47,7 +47,10 @@
 #define XUSB_PADCTL_USB2_PAD_MUX_USB2_BIAS_PAD_XUSB 0x1
 
 #define XUSB_PADCTL_USB2_PORT_CAP 0x008
+#define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_DISABLED(x) (0x0 << ((x) * 4))
 #define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_HOST(x) (0x1 << ((x) * 4))
+#define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_DEVICE(x) (0x2 << ((x) * 4))
+#define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_OTG(x) (0x3 << ((x) * 4))
 #define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_MASK(x) (0x3 << ((x) * 4))
 
 #define XUSB_PADCTL_SS_PORT_MAP 0x014
@@ -72,6 +75,7 @@
 #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(x) (0x084 + (x) * 0x40)
 #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_SHIFT 7
 #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_MASK 0x3
+#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_VAL 0x1
 #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_FIX18 (1 << 6)
 
 #define XUSB_PADCTL_USB2_OTG_PADX_CTL0(x) (0x088 + (x) * 0x40)
@@ -965,7 +969,14 @@ static int tegra210_usb2_phy_power_on(struct phy *phy)
 
 	value = padctl_readl(padctl, XUSB_PADCTL_USB2_PORT_CAP);
 	value &= ~XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_MASK(index);
-	value |= XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_HOST(index);
+	if (port->mode == USB_DR_MODE_UNKNOWN)
+		value |= XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_DISABLED(index);
+	else if (port->mode == USB_DR_MODE_PERIPHERAL)
+		value |= XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_DEVICE(index);
+	else if (port->mode == USB_DR_MODE_HOST)
+		value |= XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_HOST(index);
+	else if (port->mode == USB_DR_MODE_OTG)
+		value |= XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_OTG(index);
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_PORT_CAP);
 
 	value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
@@ -997,7 +1008,12 @@ static int tegra210_usb2_phy_power_on(struct phy *phy)
 			     XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
 	value &= ~(XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_MASK <<
 		   XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_SHIFT);
-	value |= XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_FIX18;
+	if (port->mode == USB_DR_MODE_HOST)
+		value |= XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_FIX18;
+	else
+		value |=
+		      XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_VAL <<
+		      XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_SHIFT;
 	padctl_writel(padctl, value,
 		      XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
 
-- 
2.7.4

