Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE28CDC140
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2019 11:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409845AbfJRJjW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Oct 2019 05:39:22 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:16348 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407427AbfJRJjV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Oct 2019 05:39:21 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5da9884c0000>; Fri, 18 Oct 2019 02:39:24 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 18 Oct 2019 02:39:19 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 18 Oct 2019 02:39:19 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 18 Oct
 2019 09:39:19 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 18 Oct 2019 09:39:19 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.66.147]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5da988430002>; Fri, 18 Oct 2019 02:39:18 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>, <kishon@ti.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V11 02/11] phy: tegra: xusb: Add usb3 port fake support on Tegra210
Date:   Fri, 18 Oct 2019 15:08:07 +0530
Message-ID: <1571391496-20834-3-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571391496-20834-1-git-send-email-nkristam@nvidia.com>
References: <1571391496-20834-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1571391564; bh=QsSZEDq8PkVrsmOxkPx4EBlDxs1Mat8fn0AnI2zDt38=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=pkYIPRiLZlrSmVDg0GFIC2zKXLAGD5jipSHcSPBa7vlWiXG6dkTDSSocasKpNTHBd
         FOcmMBzqy3bPMVvew1gGY0fcRkEtXtvzQ5NsQEtLy87x/wphpAJGqo3ZQEohtabVMX
         w1gE9GCmZ+EDjZPLF/Fn3Cs/zs+sKagp3fzqrV8i0Mz7SHjCDwfCeu+7a/EtW/L4eH
         9hBZ2qx8waiHCHGHzY8qvStLUZamaxBngktIOQHKp0vWQ93kNWOTs0C9r8TWUY/Vq9
         5fP1khc27gA45QzGUfF1abg+8kXuYcJQYY9KogpNVnu+KD7O58q6CSoXGldvPUlQ9a
         GiEvFVNjxuCoQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tegra210, usb2 only otg/peripheral ports dont work in device mode.
They need an assosciated usb3 port to work in device mode. Identify
an unused usb3 port and assign it as a fake USB3 port to USB2 only
port whose mode is otg/peripheral.

Based on work by BH Hsieh <bhsieh@nvidia.com>.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
 drivers/phy/tegra/xusb-tegra210.c | 56 +++++++++++++++++++++++++++++++++
 drivers/phy/tegra/xusb.c          | 65 +++++++++++++++++++++++++++++++++++++++
 drivers/phy/tegra/xusb.h          |  2 ++
 3 files changed, 123 insertions(+)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index 0351c4a..8c31f03 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -50,6 +50,7 @@
 #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_SHIFT(x) ((x) * 5)
 #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(x) (0x7 << ((x) * 5))
 #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(x, v) (((v) & 0x7) << ((x) * 5))
+#define XUSB_PADCTL_SS_PORT_MAP_PORT_DISABLED 0x7
 
 #define XUSB_PADCTL_ELPG_PROGRAM1 0x024
 #define XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_VCORE_DOWN (1 << 31)
@@ -944,6 +945,34 @@ static int tegra210_usb2_phy_power_on(struct phy *phy)
 
 	priv = to_tegra210_xusb_padctl(padctl);
 
+	if (port->usb3_port_fake != -1) {
+		value = padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
+		value &= ~XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(
+					port->usb3_port_fake);
+		value |= XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(
+					port->usb3_port_fake, index);
+		padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
+
+		value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+		value &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_VCORE_DOWN(
+					port->usb3_port_fake);
+		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
+
+		usleep_range(100, 200);
+
+		value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+		value &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(
+					port->usb3_port_fake);
+		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
+
+		usleep_range(100, 200);
+
+		value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+		value &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(
+					port->usb3_port_fake);
+		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
+	}
+
 	value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
 	value &= ~((XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_SQUELCH_LEVEL_MASK <<
 		    XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_SQUELCH_LEVEL_SHIFT) |
@@ -1078,6 +1107,32 @@ static int tegra210_usb2_phy_power_off(struct phy *phy)
 
 	mutex_lock(&padctl->lock);
 
+	if (port->usb3_port_fake != -1) {
+		value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+		value |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(
+					port->usb3_port_fake);
+		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
+
+		usleep_range(100, 200);
+
+		value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+		value |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(
+					port->usb3_port_fake);
+		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
+
+		usleep_range(250, 350);
+
+		value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+		value |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_VCORE_DOWN(
+					port->usb3_port_fake);
+		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
+
+		value = padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
+		value |= XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(port->usb3_port_fake,
+					XUSB_PADCTL_SS_PORT_MAP_PORT_DISABLED);
+		padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
+	}
+
 	if (WARN_ON(pad->enable == 0))
 		goto out;
 
@@ -2052,6 +2107,7 @@ const struct tegra_xusb_padctl_soc tegra210_xusb_padctl_soc = {
 	.ops = &tegra210_xusb_padctl_ops,
 	.supply_names = tegra210_xusb_padctl_supply_names,
 	.num_supplies = ARRAY_SIZE(tegra210_xusb_padctl_supply_names),
+	.need_fake_usb3_port = true,
 };
 EXPORT_SYMBOL_GPL(tegra210_xusb_padctl_soc);
 
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 2ea8497..b4b217e 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -800,9 +800,62 @@ static void __tegra_xusb_remove_ports(struct tegra_xusb_padctl *padctl)
 	}
 }
 
+static int tegra_xusb_find_unused_usb3_port(struct tegra_xusb_padctl *padctl)
+{
+	struct device_node *np;
+	unsigned int i;
+
+	for (i = 0; i < padctl->soc->ports.usb3.count; i++) {
+		np = tegra_xusb_find_port_node(padctl, "usb3", i);
+		if (!np || !of_device_is_available(np))
+			return i;
+	}
+
+	return -ENODEV;
+}
+
+static bool tegra_xusb_port_is_companion(struct tegra_xusb_usb2_port *usb2)
+{
+	unsigned int i;
+	struct tegra_xusb_usb3_port *usb3;
+	struct tegra_xusb_padctl *padctl = usb2->base.padctl;
+
+	for (i = 0; i < padctl->soc->ports.usb3.count; i++) {
+		usb3 = tegra_xusb_find_usb3_port(padctl, i);
+		if (usb3 && usb3->port == usb2->base.index)
+			return true;
+	}
+
+	return false;
+}
+
+static int tegra_xusb_update_usb3_fake_port(struct tegra_xusb_usb2_port *usb2)
+{
+	int fake;
+
+	/* Disable usb3_port_fake usage by default and assign if needed */
+	usb2->usb3_port_fake = -1;
+
+	if ((usb2->mode == USB_DR_MODE_OTG ||
+	     usb2->mode == USB_DR_MODE_PERIPHERAL) &&
+		!tegra_xusb_port_is_companion(usb2)) {
+		fake = tegra_xusb_find_unused_usb3_port(usb2->base.padctl);
+		if (fake < 0) {
+			dev_err(&usb2->base.dev, "no unused USB3 ports available\n");
+			return -ENODEV;
+		}
+
+		dev_dbg(&usb2->base.dev, "Found unused usb3 port: %d\n", fake);
+		usb2->usb3_port_fake = fake;
+	}
+
+	return 0;
+}
+
 static int tegra_xusb_setup_ports(struct tegra_xusb_padctl *padctl)
 {
 	struct tegra_xusb_port *port;
+	struct tegra_xusb_usb2_port *usb2;
 	unsigned int i;
 	int err = 0;
 
@@ -832,6 +885,18 @@ static int tegra_xusb_setup_ports(struct tegra_xusb_padctl *padctl)
 			goto remove_ports;
 	}
 
+	if (padctl->soc->need_fake_usb3_port) {
+		for (i = 0; i < padctl->soc->ports.usb2.count; i++) {
+			usb2 = tegra_xusb_find_usb2_port(padctl, i);
+			if (!usb2)
+				continue;
+
+			err = tegra_xusb_update_usb3_fake_port(usb2);
+			if (err < 0)
+				goto remove_ports;
+		}
+	}
+
 	list_for_each_entry(port, &padctl->ports, list) {
 		err = port->ops->enable(port);
 		if (err < 0)
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index 093076c..bd91832 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -291,6 +291,7 @@ struct tegra_xusb_usb2_port {
 	struct regulator *supply;
 	enum usb_dr_mode mode;
 	bool internal;
+	int usb3_port_fake;
 };
 
 static inline struct tegra_xusb_usb2_port *
@@ -389,6 +390,7 @@ struct tegra_xusb_padctl_soc {
 
 	const char * const *supply_names;
 	unsigned int num_supplies;
+	bool need_fake_usb3_port;
 };
 
 struct tegra_xusb_padctl {
-- 
2.7.4

