Return-Path: <linux-usb+bounces-37219-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GErhAjRCAWpwTAEAu9opvQ
	(envelope-from <linux-usb+bounces-37219-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 04:43:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C0150744B
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 04:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 844E830054DB
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 02:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB41A307492;
	Mon, 11 May 2026 02:42:53 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022137.outbound.protection.outlook.com [40.107.75.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E812F1FC7;
	Mon, 11 May 2026 02:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778467373; cv=fail; b=aF0e3e5y7FzOmHJuxowQftA03NOzYpsvFPYY7r2SLAzGDPTZdLAt19em08dK5EtZ1XYg2d8v/8tR2YjKha1KHiSOM43MTB3dkwZ1UWkuh9vUUDnmqPXTmUagDbi0t30AxBcfpTV0pvQtrxWywi7wr6cw/O3l5xCVQq2C5re9OD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778467373; c=relaxed/simple;
	bh=ObGe+2iWOQor1HiS2eQ5wIwMbacz7sOWLhSTlNSifW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g9SYgyzez9VM/pYMas7fRjJj6n0WkZylxsOGPyBlBr0orbz90huh4omW493HX9dGEDcFA9epluedivlSIW9ES6CtaVqVfrnsN5OaUgT9i+NSrV4xlNLb2lRgQj3D85NhwSS8+9Xl1t+8O4pdLzOfEy/VlCVl9HC3LLSnbXURFpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9UHlrm9/LjX912IvByR6UUjElgiIx1l1jJSnT7fDP4J/83LZbM417o/eSDRu8JHAMkM1NvvJBds/vEh4yD/TXPUqiTQcK37HdXLj0iCx4uyB3eWYtBKUNE9uxDZ2o1sjstWoHFd+h+IHZvD5hFQ0M/VkAdGDt60QVNA7G30PKUaaLqjPq4bLv6NZ0zSCcfymBmZnu/QdGBQKnPOk5jW6dooJQo8rG6YV2y7vj3zpTgIdLek/veky/sIhPxaW8/bYNtyZVdF8RzTA1M/eTjKzSI6TWsWZuCk8P8dTmZr22bl9isqXOA0YloDeGBI0eQLt4L9riVwKO5Uz9L0X8JWXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmUHPYJIwZDjfsYgFoVhdKgoC5ImH9Iy1EdH1fpFJrk=;
 b=XonwnC8FjIEsp3z/yXXQCvrOi/JF6hxzaX4+cBYAb6SHyTnk+/Xk+OAs2jlNBfuyqdjzHaWMMelH/fmaQYMad9Eim9QZ7AwsZthHI/F56xfnAx4rRqnErTjxqm0MGFSX88jReExw7eBP1+mk5S21x0jqWR+9D52VMBX+RNQNZR1Y1jYrbwW3bhl6S9O4HQkcFyyHk2uTSwPF2FOAL00p3s7lf9LlPCGybrsF2VO9Ym+q3HI48uaWE4d79AjBQ9mMEx9LcmdnTd40kBOnzZ+s4CQrPEa1oqHef+f/qx8aePpp2C0I/0rX1+v/w61aP5jRQy+Zu7YPMCxOb5wYQGzCOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0005.apcprd02.prod.outlook.com (2603:1096:4:194::6) by
 SG2PR06MB5312.apcprd06.prod.outlook.com (2603:1096:4:1b9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.22; Mon, 11 May 2026 02:42:46 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:4:194:cafe::de) by SI2PR02CA0005.outlook.office365.com
 (2603:1096:4:194::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.22 via Frontend Transport; Mon,
 11 May 2026 02:42:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 02:42:45 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 5853D4126F95;
	Mon, 11 May 2026 10:42:45 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	pawell@cadence.com,
	rogerq@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH 4/4] arm64: dts: cix: add Sky1 USB4 and USB5 controllers
Date: Mon, 11 May 2026 10:42:44 +0800
Message-ID: <20260511024244.981941-5-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260511024244.981941-1-peter.chen@cixtech.com>
References: <20260511024244.981941-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|SG2PR06MB5312:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a0a59ca8-a684-4f64-162a-08deaf06fbae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DEaK1zW2XNt1dZvSrLk5R1iHlcet4ZfFNEwcY4XIKUjBp4NPNoKEh1dB2Bc+AXTovj659dPsAmmIFExt89GhIqgxRJoF6ZyyaCK75F00laq2vwTyb0j4WyFThMuXxNw2vTen9GvWn1B7lcdVcluUsJR//7fiZ7k6DZ5UCRCitDtQN+GEaHAMGm8ACKzD1XJjAR0MFAc5Y5xwpz2EYL8qclqyc8NjgOBykTXNloQ7HribUzGUsczirpdJwgB/tS2hnTxYS4KOUUzbhKZevWdMpaZYs0MPsTpJv+YlF8PFHov94EkGu2WaWVHK0Ug0L2OZAqmGgV2Mlsp9yxgSo4dvVbDhQ81wiokqbO+Vs9MfB5JbpmZ4osaS/FjtrudUvvnm8fpteJxy43VeWUXEHahpmDJyAZTlvrnAx8WA4yzguWhDKZxEdh0wojAOzmPsna7SwYOQR86bHNUKcj8wJswnNzUXbGlaYMc8g9vviXEeRfrUSY3IdBpLMHhiypqPAk8PDLcxYYpceYaV7l1N2uXP9pHejb4m3+aIqUt1k1dpfbjQ0rf3tXhCSzD+R2WkPam7DI5Ycxs4mj+BF4C8TogeSOkS+yaia2lQ4V+O+6w387lEECOc5maUad8worpw0NavCnUbEC6jPciv/QfHYabFuP4yKjqUtd8GYuGNUF52yCP52fonbDMphYgq9vduj3RWXInfa7r9uzA+3XnwNwFmArSxAS928cISL/D5CEp4MjE=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	l34P4BTKUncrnc9rw9wsFP9bdu5WzhZwLXxPerfYfXGz9YTMn32nQhECxS6Mp0qFdgabEuNe1OY1qhwqAE8mHDeSGa3hLtp3BXEsO95fbsxaiQ7ldkGdwo1OcpNPHySuWZvhSh3ySPYHMVvOWxTX+K8g/IWdOUwoYWOvzIhS1pzB5HdUK17MtUKqvs5AqexSQRI4pi+ajkWyqCYgJUtgq3MCD3QRTcAKD7uv5C/ST+0B+GyBqSg8g61wowUxv6vdaVfyhy41y6HKYoH75ZnYOYFVzEwaqb1oWJr0Zfc6HxmD+A+HBens1KfHOZ14b8GPx4fRAC4tE8b+YktsGAgJWA5d8Vt3LpCHnx/FGS0wPWMcOovw/DVZxzmD/B5sNXS1VgajU32PRgYCN5phMxA5L7uAlVmRlj1zorllhd0GbaSiDLxRjvNYuGYoIBjW7ToW
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 02:42:45.8730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a59ca8-a684-4f64-162a-08deaf06fbae
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5312
X-Rspamd-Queue-Id: 98C0150744B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DMARC_NA(0.00)[cixtech.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37219-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@cixtech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.626];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the Sky1 USB4 and USB5 Cadence USB3 controller nodes with their
registers, interrupts, clocks, resets and S5 syscon control. Enable both
ports on the Orion O6 board in host mode with the required VBUS pinctrl.

Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts | 30 ++++++++++
 arch/arm64/boot/dts/cix/sky1.dtsi         | 68 +++++++++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
index e39c87774c12..d1e2afceea15 100644
--- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
+++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
@@ -80,6 +80,22 @@ pins {
 
 		};
 	};
+
+	pinctrl_usb4: usb4-power-on-cfg {
+		pins {
+			pinmux = <CIX_PAD_GPIO041_FUNC_USB_DRIVE_VBUS4>;
+			bias-pull-down;
+			drive-strength = <8>;
+		};
+	};
+
+	pinctrl_usb5: usb5-power-on-cfg {
+		pins {
+			pinmux = <CIX_PAD_GPIO042_FUNC_USB_DRIVE_VBUS5>;
+			bias-pull-down;
+			drive-strength = <8>;
+		};
+	};
 };
 
 &pcie_x8_rc {
@@ -117,3 +133,17 @@ &s5_gpio2 {
 &uart2 {
 	status = "okay";
 };
+
+&usb4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb4>;
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usb5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb5>;
+	dr_mode = "host";
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index bb5cfb1f2113..9f7d9ad6586c 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -6,6 +6,8 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/cix,sky1.h>
+#include <dt-bindings/phy/phy.h>
+#include <dt-bindings/reset/cix,sky1-s5-system-control.h>
 #include "sky1-power.h"
 
 / {
@@ -504,6 +506,72 @@ mbox_ap2sfh: mailbox@80a0000 {
 			cix,mbox-dir = "tx";
 		};
 
+		usb4: usb@91d0000 {
+			compatible = "cix,sky1-usb3", "cix,cdns-usb3";
+			reg = <0x00 0x91d0000 0x00 0x4000>,
+					<0x00 0x91d4000 0x00 0x4000>,
+					<0x00 0x91d8000 0x00 0x8000>,
+					<0x00 0x91c0314 0x00 0x4>;
+			reg-names = "otg", "dev", "xhci", "glue";
+
+			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>,	/* host irq */
+					<GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>,	/* peripheral irq */
+					<GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH 0>,	/* otgirq */
+					<GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>;	/* wakeup irq */
+			interrupt-names = "host",
+					"peripheral",
+					"otg",
+					"wakeup";
+
+			resets = <&s5_syscon SKY1_USBC_SS2_PRST_N>,
+				<&s5_syscon SKY1_USBC_SS2_RST_N>;
+			reset-names = "prst", "rst";
+
+			clocks = <&scmi_clk CLK_TREE_USB3A_H0_CLK_SOF>,
+				<&scmi_clk CLK_TREE_USB3A_0_AXI_GATE>,
+				<&scmi_clk CLK_TREE_USB3A_H0_CLK_LPM>,
+				<&scmi_clk CLK_TREE_USB3A_0_APB_GATE>;
+			clock-names = "sof", "aclk", "lpm", "pclk";
+
+			cix,syscon-usb = <&s5_syscon>;
+			dma-coherent;
+			maximum-speed = "super-speed-plus";
+			dr_mode = "otg";
+		};
+
+		usb5: usb@91e0000 {
+			compatible = "cix,sky1-usb3", "cix,cdns-usb3";
+			reg = <0x00 0x91e0000 0x00 0x4000>,
+					<0x00 0x91e4000 0x00 0x4000>,
+					<0x00 0x91e8000 0x00 0x8000>,
+					<0x00 0x91c0324 0x00 0x4>;
+			reg-names = "otg", "dev", "xhci", "glue";
+
+			interrupts = <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH 0>,	/* host irq */
+					<GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH 0>,	/* peripheral irq */
+					<GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH 0>,	/* otgirq */
+					<GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH 0>;	/* wakeup irq */
+			interrupt-names = "host",
+					"peripheral",
+					"otg",
+					"wakeup";
+
+			resets = <&s5_syscon SKY1_USBC_SS3_PRST_N>,
+				<&s5_syscon SKY1_USBC_SS3_RST_N>;
+			reset-names = "prst", "rst";
+
+			clocks = <&scmi_clk CLK_TREE_USB3A_H1_CLK_SOF>,
+				<&scmi_clk CLK_TREE_USB3A_1_AXI_GATE>,
+				<&scmi_clk CLK_TREE_USB3A_H1_CLK_LPM>,
+				<&scmi_clk CLK_TREE_USB3A_1_APB_GATE>;
+			clock-names = "sof", "aclk", "lpm", "pclk";
+
+			cix,syscon-usb = <&s5_syscon>;
+			dma-coherent;
+			maximum-speed = "super-speed-plus";
+			dr_mode = "otg";
+		};
+
 		pcie_x8_rc: pcie@a010000 {
 			compatible = "cix,sky1-pcie-host";
 			reg = <0x00 0x0a010000 0x00 0x10000>,
-- 
2.50.1


