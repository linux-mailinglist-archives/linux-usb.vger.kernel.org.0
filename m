Return-Path: <linux-usb+bounces-12559-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 234F993EF7B
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 10:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A12111F211AC
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 08:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F22213AA26;
	Mon, 29 Jul 2024 08:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CEfrBMtN"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012041.outbound.protection.outlook.com [52.101.66.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F5A13A3FF;
	Mon, 29 Jul 2024 08:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722240631; cv=fail; b=Whpm6yJmCScJicNxei4hZ7buj0Ld4VTesxXGDh1pXq2XJbv/DD5Zw8ojaBFYj3F8R0pKL2DXpUHCRLBq6aoPPe4Z55yzRCJSrxr6PVFvGi3Ej3sWBBEzAaXl4Qh3GUiFOypdDzYcxGERV6zzbMGpwXBU2ybpHHILYe6tIk/kIGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722240631; c=relaxed/simple;
	bh=ExsKvW1iqvW2hqXelXXCe0yi0Ji//VGvpVQWD7nEP84=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H73kC7te+5Qa9gf9Qdy5WHHwhr1gC/Rw59aOqllVD3GzgU8cNF+tXoYAtUNA4V8hKGc9iSy+i3iV/pHl9E070MEuNG1OwOCYYHbxlaxENlOwQ/BnM6HL9lhaf6Pvsdun+wEoCJoI3cMh8tXN2y6o11sdZwNLGZ0HQY466VH1yXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CEfrBMtN; arc=fail smtp.client-ip=52.101.66.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ByzShBj56ZzwKa4hSHInOdEnx/qyNMAiwlbzf3HeMqzgfy3+GJc8UpnmNCQLxxzJ6I2YYYt3+YrnqrsyxBUuuw5/mrmnvlHbYo6ppjkPk2NOWv3UEsAqXV+vldgzCbJpHrs2LexhpbSlGjm+1cm4dkFlBej0CLWRpRSRovXQkfszD8WqVUDNcTI+j51uG3f5+pc3kl05gYThDRJp1ENMVx16grbnGUHcNtJffYJf9mpzIZS1ThYxU/f41fGNHComnMTCugtbasHIKgLtH1PyJ/rTH6Z3M9zzvK06lOEBYwUfDP3pnjk34+hhInjMm1CrePZaZ7Pf0Xya5dAUgsIFDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uP7NzfByutMIQxzbVIMX1HnJeO30iF8QTUodHTmR32s=;
 b=g10D5+zP0tyY6K+drA8KW+I5yy/EU+dTAdgjWP+mdUdafMLzEQ9gt9Gf8ACHoSeSnBQBb2Xws0PGfTZfNonTzLJ7xKUr88k8PTWmNDXvKRPyIRwW7vsB3NtmYfJAUB8tudeNCCGNHOwKxckOOrksKmqCpyLhtT7ruGcIjMw1FezznKzQo/ZEH4qQjP2ql589d59zbR9IWgAlCtvgRmd+bfU7QfS88oAX5hp2ntReaQLBPMcQm3lVl7s3XWvj5Vr21s33qGbz3WudR3asmXQAc3e5kGpmOmGrKUexzgHsGQ1X8IW+oUvHh9SncR3Gp3+7R3+nz73ZAIu21PDqP7bq5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uP7NzfByutMIQxzbVIMX1HnJeO30iF8QTUodHTmR32s=;
 b=CEfrBMtNwEuJ5QspV1isbKTqdt5twPCB3hiMy3GQGdLBvr8IkE6K6el8q9mWyVzsjDYQPzNgTvOH53arbeRDSRnQp9uAxU5NmZcnBzO2vx89uxBiajI8rdDY8n+N3/sttVYpZBb/+jjsm/K1o/sc70bAakIUABHWJo6jGZ3IU3YQ4p+E8PAdOKBbpG74eefIzIbrLXMA5BAf4bxFigPhCZp1Z0iYjN7Ich5dEGTzlDwS7KdhZBrM8Iya+9JGblsDHj/V+9QPCPXZHDz1KuBu+U+SWt9h9Av4AFwXXsu1NzoWy89DQHpYA7bNZzJcEIuJFAAhIOc/0NXWFdYZ4chOAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB10302.eurprd04.prod.outlook.com (2603:10a6:150:1e7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 08:10:28 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Mon, 29 Jul 2024
 08:10:28 +0000
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
Subject: [PATCH 3/3] arm64: dts: imx8mq-evk: add typec node
Date: Mon, 29 Jul 2024 16:10:39 +0800
Message-Id: <20240729081039.3904797-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729081039.3904797-1-xu.yang_2@nxp.com>
References: <20240729081039.3904797-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB10302:EE_
X-MS-Office365-Filtering-Correlation-Id: c3c33800-f5d9-46ea-d188-08dcafa5e80e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xlHpR4od1I4sE4ajET7JCU8INeveONlRXvmwtpPUqqh/bSD1GPtQJemil7UA?=
 =?us-ascii?Q?/EaY8o3o55b/N+lFDo40X7jUNf3GWD33kHoMpOJjmV2o/2PtigyJuVJXNdZs?=
 =?us-ascii?Q?1/peWGn28DwTeKBBdjvnRbjHvpLcqrwZZ7fvcrU9XwKKh1tox4wOy1Z6Z/8d?=
 =?us-ascii?Q?t/Bk6nH9QiNDh9Kgbxt58ME4kKml/j5uhSQnyP1/HteIgpMx+p1dcoVzUMG5?=
 =?us-ascii?Q?Rh33ZcX8BGMMSnnHNk7h6mXNHDmFHVBcbS/aC7Nrxx0Rw8tKyT00SabD5bRG?=
 =?us-ascii?Q?Suq9d41FWk8Avoym+cSaoryb95XStFDCfegIE06OyQtbV7++R3EfGcxgWJQ3?=
 =?us-ascii?Q?RjOkFmCnbGgO3HWNNT4fADAA/qSiuRnKBWIhcXx/JDDUPiJz3nHClUuxqxEC?=
 =?us-ascii?Q?5dxaKXie8JISyCTutAWCs/ldkd1g1rusF1TorX9IclJvdbP7F6vWNIpktVWp?=
 =?us-ascii?Q?eQgkVSj86xgyw7VsHxIRwaZAY5YxZ3zQACFcN8dBbLOGjZcwXTzkDOaSIeQN?=
 =?us-ascii?Q?9v8E/pEjgyAN+I2pjM3cW3nyaA0y7CrHbZwxiNGVhaCV0nqzPSb5+/+w4F8/?=
 =?us-ascii?Q?4/4tSLURl+xzxolH8Li/rKyQgEww5/nmK3FqosS3m6wIw4W1cqehVVzP7Wsb?=
 =?us-ascii?Q?fuxvEA7/pXo2IGLJ26N8Jz7YDfwU0KEf4oEyz4IBVWIHyMwzhcFxkHqk+vL5?=
 =?us-ascii?Q?mKR7OCNPypr/JvWTQTedfHtAac1Y50BFH1fCsQh0Ta3FCV7NZRDVlg/QOeA6?=
 =?us-ascii?Q?7eaS/K/3KU9Gs9/JZQMZK/3cYFz9hufrHWRCx5RA+uuJp7eBhMV9WIRIQIPO?=
 =?us-ascii?Q?aO/k+VbwUf7aC+BF+1XkLtn+tI4GdgEOuDRIXbfbveVj6JU1VVJYXMbIX4w1?=
 =?us-ascii?Q?YoPuzM8s018cKTUeZ76yCgLxw9PBqwyfvgo/e0UlGNKvgUjmlZ6EQRujUu9C?=
 =?us-ascii?Q?8yP5gH8ZD7Esv0gXqqLaABB/JjVJZ8We8RkQ/eFlPljvSWx9/Z4RRckaaPnh?=
 =?us-ascii?Q?VPO7RRNvI3RPbAwMT0GZLfus8QSDPOmIX/W2tSs/R0Q58ImQh804QwLBhjy0?=
 =?us-ascii?Q?du+jRKpfrWYRemzZ4UyDjUP/LoSPii03XfsBK4psqL+AMHzYE2J+OGvKJ61v?=
 =?us-ascii?Q?zl5JkgqsoCY5dwdGUBTqS9w2U2a+5zz7eU3SNJ6BV0/XEp77B8Ll/994jEfM?=
 =?us-ascii?Q?k6YvfKtx6k34LgXz1y4dsd49NHTPgtH0h6bHWpiPTb8vBfUyrth26c9OirCt?=
 =?us-ascii?Q?Q5Y3SNan639CvEOQBi6bubtXz7OvtXOUUudRyzKCij4luOXzPOvYv4eZXjmk?=
 =?us-ascii?Q?bcXVjDEFv2GUtMgBCdmbynXlnm/HiNChJGaWlIeigjO1+8f3BIWnGhbRb58h?=
 =?us-ascii?Q?dK4Ffz6O/miKBsE52juQL+TNsk4FWUQQUv/7eIp16/QR3Mb3nA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/7Xb9CTExPA4fCzZIhwqVFhxNQzaztu3WLEJdmo93dZc3BxhXMt07i4A79wx?=
 =?us-ascii?Q?p7Sc+BIvET4C2YQbv1wZBYnhOamwXTRVbWovqG5lIOGwMfTeV/agesOcE+UI?=
 =?us-ascii?Q?ChDQCe2zOErXTnAGCMFo+Y1GoRFLUpgQzafnZvZH/HVgu1D+NqtrHaTzOFTs?=
 =?us-ascii?Q?zyG7BTEExQQite0sfzzQcDhzclnU3eBhpQb2HOuQdp6Pgm8q5o6W8pLhUmVd?=
 =?us-ascii?Q?JGCiqwevWKEc9ZGVfAKcTWdrKiJigtK+l/1njgH1JXxTVlWLXuCbGdvCLBX1?=
 =?us-ascii?Q?CxGDcSWG4VIGVFlxdwYjmyAC7uWdX6ek5DBy5ZTRUqeNf6fjeB3Bq1NWheDR?=
 =?us-ascii?Q?OCf6Z8fZtzZyhheC6KPSphROmytDsUtU143NR0pLoKnkTbk4sKry6Lu5Lyqw?=
 =?us-ascii?Q?zOWz5ZM4B74T/er+JDjbBDARFEJSZGuhRMucSfjW9FP5jjZ94tH35DBGTcrV?=
 =?us-ascii?Q?/TOvUAmlBp3929dNayMvrHjo8CkOrA9bB4HLll6txtkG4PYuRUB1HXLeINDY?=
 =?us-ascii?Q?slFfP1L3hPg7GJ4tzU7KOTS3jYB8S4H5tsnOeYQkbWdl7Ra8tZ+/12WgvBSV?=
 =?us-ascii?Q?NN91NdcpuKJEI6q54ZngOu3J2jVmRXGtuJZ/esmfb9yoF4euTm5ZFRGKeQ6i?=
 =?us-ascii?Q?rp2RL8zH2YL7doPwDxOQ8qP80MzDgJJQlXkaprawvyoiIMBufjhj0Pqv8hTG?=
 =?us-ascii?Q?ZCpHFveMNwaiDEunpViuQnaFktywltGsiswVDxds8BNKTO0Oc1TTmJtrgaso?=
 =?us-ascii?Q?bvMuhPCmIIK4GvCIBnOXw9z3WqHd4zm4Op+RxqUcupoO4k+TfbUSegJB9bgU?=
 =?us-ascii?Q?wsvy+WwPrhG+WUzmP7Um3zNCJJJHYuGs627hMbwqIJasnyOyX9NkfGKF1m5U?=
 =?us-ascii?Q?YcObcJmcRhQMn7qEX7PHIkLvBY9wc9bI2wLZcwBH4vvp90B1O4965Rw+tBi3?=
 =?us-ascii?Q?LiYK4SCniCa7+ZDuKlDPNAIiLNlo4H5C8OBq6DY5Zer3ah5JgRUtdH4U1Id+?=
 =?us-ascii?Q?HACT9hX8QY5wfTrmXykAT8hLzJzRaecn/KwGhXgEQjb+cpYecD1Ms/HKU7WK?=
 =?us-ascii?Q?ebxinhDblzTQn3x+ioFMp/6kFOXKOpkaXlzsJhz6lH4tklALQpZL/1knGbJu?=
 =?us-ascii?Q?hB7GjLWE52XmxFZT0UnnOcPifOICzNgCPwbNSlQCt/GVCGjggSSULNwJF3kO?=
 =?us-ascii?Q?FXiACMClt5Hz8nqpKXwNN+1rURhTikG9+c6NXxQpxOXqDF+3Z0HscF7ltEnt?=
 =?us-ascii?Q?vSw7AFM1SP/9K/lrnHYjCgVHK2d6LZ7rXeIC9kShKrbBBPvm7Piu6oKCqT/P?=
 =?us-ascii?Q?Hy8AhlwxdE8rF53aeRR3mm+iIDDnEaSZUtXQ7dapbOH1WELCC4fUJAi7Hhto?=
 =?us-ascii?Q?Skw3m7rtdiZ9qTZY9F2CPndNMNbEF6wOrlfhffLgBhcNJpTNZRi3qZrG3eMT?=
 =?us-ascii?Q?hxvBgnAwKeoCRyCICt8EGHARSzoxISJ9Sn/ULmxs3LMgZ0rHZY+/Ff5j+0Tx?=
 =?us-ascii?Q?gOJqsINX5qzFa5ZZSirk2kt1eNSFCVhO4ATmxCQhUmOw2zt1P7FlPAVLjwjo?=
 =?us-ascii?Q?5i8BWbuNjEGe1fb8uq1ZAWiX3Ksm/gSmVCihKcCp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c33800-f5d9-46ea-d188-08dcafa5e80e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 08:10:28.0044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smgDBqTl5y9iiFK3/WdOjnmhdXnfLOJBtsL58nXqCmcagRZsFZVmS7NyqeBvZISS593pGd6sCfl6VFRClanCCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10302

The first port of USB with type-C connector, which has dual data
role and dual power role.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 93 ++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index 7507548cdb16..008e8c37c76b 100644
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
+					typec_dr_sw: endpoint {
+						remote-endpoint = <&usb3_drd_sw>;
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
+	role-switch-default-mode = "none";
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+	status = "okay";
+
+	port {
+		usb3_drd_sw: endpoint {
+			remote-endpoint = <&typec_dr_sw>;
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


