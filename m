Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF13D1FFA3
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2019 08:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbfEPGkS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 May 2019 02:40:18 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:3361 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726221AbfEPGkS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 May 2019 02:40:18 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cdd05a70000>; Wed, 15 May 2019 23:39:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 15 May 2019 23:40:16 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 15 May 2019 23:40:16 -0700
Received: from HQMAIL112.nvidia.com (172.18.146.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 May
 2019 06:40:16 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL112.nvidia.com
 (172.18.146.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 May
 2019 06:40:16 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 16 May 2019 06:40:15 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.65.118]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cdd05cd0001>; Wed, 15 May 2019 23:40:15 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V3 1/8] phy: tegra: xusb: t210: add XUSB dual mode support
Date:   Thu, 16 May 2019 12:09:25 +0530
Message-ID: <1557988772-15406-2-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557988775; bh=mKGZzaOBp+7NCJorfrQx+zipuIh8FqNwI6uEvceEA3w=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=rAf6zhHop+vsWPFQIjIQ+cyOoADDLx4fbNRcOpyPPSQoWqJXr6pszIjxWA8z0AI5C
         iyhCoYEm06LfynpLgkFI3a0YRJtDpVOEFmV34306qZqGEDW5mW0AFVMzIATkAo/6Kt
         1eBj8zxl4KzfRJ9HNqh/Z79Gdqj/amjMdoMRU/NxBCPpS0DueieGp7LAJ6UWm0eX2m
         NQaUwOTdiWPEZdU7Y06riwl26bdEUkX9Z+f0rRNwpiaKIKep6ZQnFVEvujbaYoqrUP
         iT5h6XUm9MELH7hFal4XXgci8vSG1DfwcsphvMmrsCyKPkmGVhlnBrbJ5Dmo39zJfQ
         TFUyITE+vmtUw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Configure the port capabilities based on usb_dr_mode settings.

Based on work by JC Kuo <jckuo@nvidia.com>.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
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

