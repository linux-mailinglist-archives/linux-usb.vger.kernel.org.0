Return-Path: <linux-usb+bounces-12815-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0559444BC
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 08:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FAC7B21C74
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 06:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D05B1586C8;
	Thu,  1 Aug 2024 06:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mSzYBltB"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012055.outbound.protection.outlook.com [52.101.66.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B955158555;
	Thu,  1 Aug 2024 06:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722494939; cv=fail; b=WmiI9lZ4XRNjgUuY4Wnelf8/7iv2z1551uRXMXVQCmRW1PehZUPTSInRs4oYhTu7VmNb8bV5faaoLBQHE30GS6gHwZgJceqIhp9c/apJoPfDwXVU9xu/NhPgIhqCBqoJ4yWEeM99sRkHCL+s+SDehUDL4LbTp6a5zObt+3hQHNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722494939; c=relaxed/simple;
	bh=6Og0oyQgcWza4t5cQ/eK0Q4lM3PT386+BCI+Dj64gGg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oIi1JJ/QVbGmXTBb6Nth3jp8oPacKzd9zvXZNPgxqe/5orwa32iN/xWoI4p3Uq0c9MtwYc6Hn6Y6JBI15Im06Nr26IOoZVVjfVProvkbG1lt6Y5ZzOLvWMt7KG97lP5QEeOPTtNS59McYCHYVtCYRbwcb3VuQ1bWkcoenLPhDsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mSzYBltB; arc=fail smtp.client-ip=52.101.66.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMmIHHHXKOULM5we4sgBeN0RWmdxoMrVsS5LazjuO/3o+5iacERgFjTSP9M3qlP/GJ8PJmQyW2XTaPB+ihaDS4MQmj+qCyK8o7uXdtWuEfP/BS9+TA/rLT7irsSljgFdK8u5sBas4igg/RSNg9nvjOFysXm3IHrAd2DM+oNpmjts8mqNVPNvq54xmChgoAljSMTvi8A9ZFYjlLfb8p7tIABRDXDAzeIcYvOwhP37WlKTHjIroTnz2AmhfdRw2DS8oCBLO5IlZTB4dWfcVHW5UGYNqbUSfLvHq/dG+Hs1dtJ8tFsLh5vV8yx9+nMAvVk1mbDbDbhMBby6uFlHqziktg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEL6XlZCPmyxH5Xn20lMlOCjvMSCMq5lt0IW8kXXVI0=;
 b=h1bKdrpoG9+jT5DxIsQAoBgwhPPtjM76HQw+ZqDDrYPQiTXgchtvqaLmA3lGEZXWMILcdi5j66WUsyw6tjwVlIgGL41DIWs2cydaIBjW3cns8U3vr2qrysIiL1aai4pqaZiKqMH4OvDpNWsYXKPT1tNrq5TEQsx+wu8sTa1LBKSVpxoviHBMiQQisKgTGSQPtOen9MIonc4H/Nq78E8IrYwxLcsg8oQPvmJENhBkHPOlTTt4H5j616Yy3myfzYFNQgWCKpamWQtyTZon6L4UhMKu3iKkdp4RLvRqJhAY3ytAzeO2EpZnn2qrGHJb3h6EexYsJHwOy8U3a6ml/umO/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEL6XlZCPmyxH5Xn20lMlOCjvMSCMq5lt0IW8kXXVI0=;
 b=mSzYBltBf7jaRe9sxDR68nlfeivZfXGjTEcYr/aqdaIKq9H9z2i+W7FBWAoAgsGL4+yHyM2uhZ9OU0qjg8Bp+j4jvJ/ajQnd6If2g/9KM73JgAHMJj5pXk56bc7kSK77QdsV52OuFRRbXFz+nxPQNBg/QXcH5BhnfFQxK20Pbx1H+wccH0RuNJrUsXscJEGuyBmSgwk//rl8Vdu99UoJEdut+3O+i+EVjLKBc47kokKdn+kk2bcx6kKb+q2OLy7GqqHR2WAoyLClF9M/OVHVDWRsirK7r7j1/noCBeAdVeyl+X6ioMxr4WL8RMCiqloDMqK7AA3+YeEx+AnhkUxXgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB8732.eurprd04.prod.outlook.com (2603:10a6:20b:43f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Thu, 1 Aug
 2024 06:48:56 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Thu, 1 Aug 2024
 06:48:56 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: andersson@kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com
Subject: [PATCH v2 3/3] arm64: dts: imx8mq-evk: add typec node
Date: Thu,  1 Aug 2024 14:49:07 +0800
Message-Id: <20240801064907.3818939-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801064907.3818939-1-xu.yang_2@nxp.com>
References: <20240801064907.3818939-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::14) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM9PR04MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a45f871-bb35-465f-e4b4-08dcb1f60363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ztDEWG+hHX3RXkfH6EPM+7NeWhaWapkQ3fvKvj6PQxTVCO1yhkZX7/bobkq5?=
 =?us-ascii?Q?2KB0L80JW7wcpT+0+6PUpuxCMm2Zgd/PIH6vs5YE17wVkoGcqeD4wbBPjb6L?=
 =?us-ascii?Q?QbDpf1j8WMt9FakQsvD02x1IXmtZQ6jTmgvg7dDQlu2lN+2wyEfkbOXIZ41r?=
 =?us-ascii?Q?Vy0Emq1CuRAJiiG04HIiSUAI2I5nc6B+0qAiUUEWy9MsUNedDtYtvVBxk5ID?=
 =?us-ascii?Q?yGzmW57vbcSONDHp8/cupCtMIJKw5mgaJ456XunW4WvAd+5RYLX1/ek/76ao?=
 =?us-ascii?Q?RcBABj/mxOhm/9am6kVUNo0Jr3V0xKGe59R7XrM6l+Nlpnur5jPi0XA+ZJjn?=
 =?us-ascii?Q?g03Kfgxoe8uwPUIGY2rVCLkMdNIzUWfulcrqf1Iz192J3Xt0nYeAu+5w9Wa0?=
 =?us-ascii?Q?h4FvWED/of0weJJ/T4xMcKWCVP91rRXGqQoHJnRlWf2drlQp14jA/d8wAQiJ?=
 =?us-ascii?Q?xL5p/QKnZlQKJvfK2A/qVJbAGrwGOhwxEb61Wl8WN/JvMjmycWM0ybmU8VUQ?=
 =?us-ascii?Q?LLp7KfPzZ+0CMrmzHKhp2f21HoTjVUQJw2hXv5yTqELora0cgY/NyefHkSqa?=
 =?us-ascii?Q?akV28EEzY1RK48N9CWxF4zPCCoXg6QY7VK/+AGF2iMYZXJMk95lfYga9Dm1Q?=
 =?us-ascii?Q?/8l/pcSr+4pLFD/NzdQhjtH1OtOly6LmtGgUJntMSjoyrpvM1hu9TyURPpLD?=
 =?us-ascii?Q?HCTrqkWCs74fXQE4scX533Q6GS9iYb/YN31tWH1DRqO+3vNznfuc/EOGi6R5?=
 =?us-ascii?Q?X+hplAlrpqRJIetbjVny43GAHI4EP6bw4ppsok16vsNlXqInQ4u/zwWC8VA0?=
 =?us-ascii?Q?ZWiCUt108O/6JvLQGUMuSc3O3F89LrAclKkaT4xwlsiAnIxFBH76nPzY6q1F?=
 =?us-ascii?Q?GyedYeo2TGzmbgbDT7Y6OuxR2eL0kcRWLG9poSYZAE6lU6xyjy4YsSlhkhlA?=
 =?us-ascii?Q?w3JgOwOmQ+2I2296hOz5BAvSOuHd0Xk59VctdB/KElE/BStSC6mjcwVqgXyX?=
 =?us-ascii?Q?5AX984ZP2rz3MgLZki0hwGHmVFrJWsmTPpCoZb0c7n046HTnP0TuTF4VXzFD?=
 =?us-ascii?Q?D2J1PAN8YXADc7wZLh+p2X3pYEPCKX8QroVunoDGcBSsD/l5GaXeaAyzVXv4?=
 =?us-ascii?Q?Rqmg/2yZQCEnBtb9u9QhuWf6Y5+ME50klP2Jwm39d8grur4L64tDz8J1wKfJ?=
 =?us-ascii?Q?0fku7n90xU1HEc0a7MGYxfxmqk84O7bqFmteYa5b3tfkymL9c3pKkgwib6O7?=
 =?us-ascii?Q?WblX99IcrZPwl6L0Jjk4BsVQRCEHcDBi7u7agwKBhKMbG/S6G9MylWnZHBih?=
 =?us-ascii?Q?ht+dxNjYWP3dhOa7hMG1N5vU2b40QDfVWxPiZaQesqbwUz0ddX/GEsJdaHcc?=
 =?us-ascii?Q?hjjKTwEKWOJvsWhCYt2m0kWozXwgSNm3019yJq36YJbv36gZiQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d3n+KHUZ2pw1wuW3VOWRsTTokEpqDk/cmQPY7Hr5dNAgjjihv2FYHDgJYQPt?=
 =?us-ascii?Q?IB3e6inYBktXbm4FSKct9nLrKwrev98DxqHtRiEwh6ziAIhZOZpw6pTZYB7W?=
 =?us-ascii?Q?VVNMneaWIHXLNAJMXJXR1Yhyzl2kUSW3SvttYwa2ECZnIxkEU/AuapZtj78N?=
 =?us-ascii?Q?HzMod9dM4dN1ricIV9kBQWY/U06mji0TmiHrDOMjR9hNIg1p3Ez3jp736CfW?=
 =?us-ascii?Q?u0e0YjYFImha8vk6xUyKoGDFuevRMcDjevQU9oH4cVicNKOFezBIcuZc+Fo3?=
 =?us-ascii?Q?e/Qds+HAjSscxwvupD6pfNgoKSJxj1IroS0gkMMnjGCxSuYhwUyyQ2sdBozm?=
 =?us-ascii?Q?tUDIVOmUaezh5VhWFT9hojsF1WdLsfb6FBtk7A89e9Zkj8MrsXot41WZnhV9?=
 =?us-ascii?Q?ZFrL+TpfeXINECAEr+MlyBi/hFi1dfq+JLfynq+AkRNyrKBXCGZiQu+APLtR?=
 =?us-ascii?Q?WcgH1mPgMdJ51WphKU0ZW+LbuPb04ENRJ3cs0F4NUQ50tmawJ7Kms5Kpt/dv?=
 =?us-ascii?Q?3Ult0xgFYz/d6U9qRyeePCWM2aoUyEthBBNmnqASJYJFrHx6oLrnTa4il+U9?=
 =?us-ascii?Q?tqsBUWj8nU4kBKzJKtHl0pC/nrP7P8PQOtrJUxYGej82Ux8XGqCc04s6dAm9?=
 =?us-ascii?Q?BXsiIcQhpwR8PdSXmDg1u+92dF/vwLdNPoOmC7CUoAepuHORQNj5IqbwfGdT?=
 =?us-ascii?Q?FssDzuiST2HDcBbRf9TsOQDlqbgXucxGzdweUcSSDVH+RzS1jbKWv1k8QtVu?=
 =?us-ascii?Q?PxXcEZErBsc1qk4uiSOhUntZYSurFl1b1l4A78zxbOVbp5woCCu7oiGyk38H?=
 =?us-ascii?Q?D1IyV2v0IPT8Pm1eBq1UlAwD9uFystvgJOWTZBwWyIv5cTtMBgBDpSayNidU?=
 =?us-ascii?Q?tKiAQU3Oc213ggl835R5e9MT5e6a7kVI98mb7ZUHdfLlBVJWplTV7nNr+HYs?=
 =?us-ascii?Q?EbKqNK3/WDNra4liaxOXB6MK746SM3z+Z2AdEpQWeFAG2PLiW6bUMYyIm3Hp?=
 =?us-ascii?Q?ZT9kupKIbZS2kjuqxsYuIDw0chbRTLg/VGXak4+8iDHqoYQjps/OLPPsZZFD?=
 =?us-ascii?Q?6Sdp8D1wVcJDu7NoVYQZqz78nN7iZsc3xYyM9w0IzGTz4MAYFgA4MJybEdM8?=
 =?us-ascii?Q?4eCg6W4cmJ0QjK1gVFQN9JspAJgllQlVwf2o3RkoXBxCKl35tDyWkkW8d55D?=
 =?us-ascii?Q?Zm3cC7/3mwRHcBtt2szD5L6UoTYtTYSWdlR3W4JK/30VC7DMN+cgV3xugQWr?=
 =?us-ascii?Q?y1dMPODtYrdFBeyMl+pafAr2CABKkmqFSOJ2h4gLV8jw+5TwEoJbGbBLP4ty?=
 =?us-ascii?Q?LCwmgOrlT+tjqZdeoLh2bCF1UqGxfSEYzCO1F+Z+Jbf38Db3wA01QiPqEY/B?=
 =?us-ascii?Q?ers7ai4ZgzmFeAa/iX6OIkFYcQFgJgdWj+L66rYJY79NDCbRLS047hsnmDa3?=
 =?us-ascii?Q?uoIzNh01HuDqvbP0lmTLtAFFlAnOdiHoq+WXbREeKHikvVaf2CvYfu2i+aU/?=
 =?us-ascii?Q?4NJ6a70sO3ePeSAhSVpOj8N5EyFApAYgRmQnmDIyL8+x3wMwL5LFXq7UIx2/?=
 =?us-ascii?Q?I9RAO6/9LXMtLW7nsZiNn+/IcIYj8of/r4/0n64m?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a45f871-bb35-465f-e4b4-08dcb1f60363
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:48:55.9870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RE580ARO1qP0BRrPDZKMx8/L0eBX3GJLnw16uht1HdWwc3b8WJA4IrzYFTqDovHxNnax3x8oBzfnNqXlRJWgyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8732

The first port of USB with type-C connector, which has dual data
role and dual power role.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - modify endpoint label
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 93 ++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index 7507548cdb16..8169ed7c7968 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -6,6 +6,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/usb/pd.h>
 #include "imx8mq.dtsi"
 
 / {
@@ -27,6 +28,20 @@ pcie0_refclk: pcie0-refclk {
 		clock-frequency = <100000000>;
 	};
 
+	ptn36043: typec-mux {
+		compatible = "nxp,ptn36043", "gpio-sbu-mux";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec_mux>;
+		select-gpios =<&gpio3 15 GPIO_ACTIVE_LOW>;
+		orientation-switch;
+
+		port {
+			usb3_data_ss: endpoint {
+				remote-endpoint = <&typec_con_ss>;
+			};
+		};
+	};
+
 	reg_pcie1: regulator-pcie {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -315,6 +330,50 @@ vgen6_reg: vgen6 {
 			};
 		};
 	};
+
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+
+		usb_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+				     PDO_VAR(5000, 20000, 3000)>;
+			op-sink-microwatt = <15000000>;
+			self-powered;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					typec_con_hs: endpoint {
+						remote-endpoint = <&usb3_data_hs>;
+					};
+				};
+
+
+				port@1 {
+					reg = <1>;
+
+					typec_con_ss: endpoint {
+						remote-endpoint = <&usb3_data_ss>;
+					};
+				};
+			};
+		};
+	};
 };
 
 &lcdif {
@@ -445,6 +504,28 @@ &uart1 {
 	status = "okay";
 };
 
+&usb3_phy0 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+	status = "okay";
+
+	port {
+		usb3_data_hs: endpoint {
+			remote-endpoint = <&typec_con_hs>;
+		};
+	};
+};
+
 &usb3_phy1 {
 	status = "okay";
 };
@@ -597,6 +678,18 @@ MX8MQ_IOMUXC_SPDIF_RX_SPDIF1_IN		0xd6
 		>;
 	};
 
+	pinctrl_typec: typecgrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_NAND_CE2_B_GPIO3_IO3		0x17059
+		>;
+	};
+
+	pinctrl_typec_mux: typecmuxgrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_NAND_RE_B_GPIO3_IO15		0x16
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_UART1_RXD_UART1_DCE_RX		0x49
-- 
2.34.1


