Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35BA685EBB
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 11:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732628AbfHHJiP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 05:38:15 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:3547 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732589AbfHHJiO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Aug 2019 05:38:14 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d4bed870000>; Thu, 08 Aug 2019 02:38:15 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 08 Aug 2019 02:38:13 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 08 Aug 2019 02:38:13 -0700
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 8 Aug
 2019 09:38:13 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by hqmail110.nvidia.com
 (172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 8 Aug
 2019 09:38:13 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 8 Aug 2019 09:38:13 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.65.118]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d4bed820001>; Thu, 08 Aug 2019 02:38:12 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V6 1/8] phy: tegra: xusb: Add XUSB dual mode support on Tegra210
Date:   Thu, 8 Aug 2019 15:07:19 +0530
Message-ID: <1565257046-9890-2-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565257046-9890-1-git-send-email-nkristam@nvidia.com>
References: <1565257046-9890-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1565257095; bh=uplC7C3AwS9xTkDY3gNfmGlsF18xBuoOOiOFKVwMsSg=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=ppnd6lSdxJJa0eScu5EokX/wBS/gGz5rS+dtjRVtFnaS5nm8E+o8abGrfEPzw6qM3
         7Pon3fGLn0hH5HXjtox8pXnSPJe+D2lqgMJ2PzSgxTWU1wXctdpbOGBQhhewjJxh66
         Oz5d9RXzcQ6ufWS/0z7p4R3ne3A4opeAvV2kiL8lLf8LidSrRdrilY8XD4zO31IZp7
         yLZfzjF2uGMze4SI2cUZuscIVnFoVjAy+05QBVhIK+JdpzRt+vHcmjn7L3O/A650aE
         hDMMIICpc6aGKfKQPOiz1kSeyseG+q9obmfl0rf4sNrzJK4IloYAxVJhxBXkTr7Mly
         5Vb33ouaS9NSQ==
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
 drivers/phy/tegra/xusb-tegra210.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index 0c0df68..0351c4a 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -39,7 +39,10 @@
 #define XUSB_PADCTL_USB2_PAD_MUX_USB2_BIAS_PAD_XUSB 0x1
 
 #define XUSB_PADCTL_USB2_PORT_CAP 0x008
+#define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_DISABLED(x) (0x0 << ((x) * 4))
 #define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_HOST(x) (0x1 << ((x) * 4))
+#define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_DEVICE(x) (0x2 << ((x) * 4))
+#define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_OTG(x) (0x3 << ((x) * 4))
 #define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_MASK(x) (0x3 << ((x) * 4))
 
 #define XUSB_PADCTL_SS_PORT_MAP 0x014
@@ -64,6 +67,7 @@
 #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(x) (0x084 + (x) * 0x40)
 #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_SHIFT 7
 #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_MASK 0x3
+#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_VAL 0x1
 #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_FIX18 (1 << 6)
 
 #define XUSB_PADCTL_USB2_OTG_PADX_CTL0(x) (0x088 + (x) * 0x40)
@@ -957,7 +961,14 @@ static int tegra210_usb2_phy_power_on(struct phy *phy)
 
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
@@ -989,7 +1000,12 @@ static int tegra210_usb2_phy_power_on(struct phy *phy)
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

