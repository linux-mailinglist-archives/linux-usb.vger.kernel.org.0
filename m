Return-Path: <linux-usb+bounces-17544-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E48D59C6A52
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2024 09:08:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25F51B2403B
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2024 08:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE02D189BA3;
	Wed, 13 Nov 2024 08:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FWgtDPqS"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2051.outbound.protection.outlook.com [40.107.249.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724B3175D5D;
	Wed, 13 Nov 2024 08:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731485299; cv=fail; b=E90cld6IMzZURy9349cmoF8JYIuctg7gjDKijD/UDp9YSTILczT8xq3px/I3H2ClI/2D0VGPRgWjyak8JYGQhxGaj3pqPZWp5OTGwMS3AM9qtoC8xvDSrvHAPUy3lVDU/yVpRiNwufs2a8V4YmgxjhMlOWH7SCmNNDrUY6Ro9MA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731485299; c=relaxed/simple;
	bh=Qn76duGPONBgKusgZevlcXc6Cup5dw2WP8hxuOyRnp8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nZjnnRUPoVbZToiptLEqBXhq3MvzW/KxQRYP0JF+Hzgwtx+jyw7U/3kp4CMbrw9yvgAuqYMX3I2ExydcPxlqoSRxydK7eiFdmf+qA4fXfUkU0NGc7ZYYQasPst1re/6LbweuwU8hlhQIR+ypixOrYnqDKuOMdM0gGNptSm2LcSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FWgtDPqS; arc=fail smtp.client-ip=40.107.249.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWEgt117S9IP5l1WPLZ7JrLKKFRKxyujNq3tIrGJYwhVnIbD2z9zIrACanfXjkknpJ5LHUs+DR7sVzDFvnMDolgLzaM5HIGRI/CpAf0B7ohXvXkmPYOz8xCI+Bqq1P1nGa6AXGbZO63pUAmk63sIMWhG5gX1woubnNlutjbKoiHVHQp/9s/7e/hHKEFMng62Kt+ZQn8f640BMs7Tr4WRYVUWbuT+15xTzrESxlQ9J1Ni36wIH/4PGoe9Ao5xZ1JCBX3X0DHygyaTBLOC/SCn8GXnpl0waKz1AFa0LtCZQO2XHJjd1qvjuoqo1JOvYH8+PWdOSVIr+HyNapH0l8rq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfQ2UyccLwHjq1v3mhNUcte08TZc799gkBsNZi2FYPI=;
 b=WW+IfJ36P7peHKovnMesjOzIYAxspPaoTDkMfo/Eu3rVTpyvDK0RtEruRpbx8MUuUMKb+ya0U2tVyqyFyO8ni/bDQpEjZrNoEGIMq+Mqzn6O369DhlzvHz/bH0hsTjpId/iONhO/mcl4s8MLh1iEQoPdcXBpqz9riciIyRZUFBK0L4QqUJjNCI8u6DRyS5iO5m28pv2M0EnoJBrLXaaqBCzNFx8kxOQvT3WpxNiHiUyco7vKyISp26beqW7jSodWdAY74HReAQydaFoKIimvv50NO7Q6Ouwh/H/XwnfmUWa5xj5zIsAFMbXw+EWXslF3HchJg+1yMmsmKX8OUXcWAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfQ2UyccLwHjq1v3mhNUcte08TZc799gkBsNZi2FYPI=;
 b=FWgtDPqSOtFj3zym8WQcoV4SM1LFT4mwY0Sah3K1hmj6M2hC+Fentq9imMgO02Mw1lsN3P/0ckrhGouv41PCyRiwalNijon0JINvmqIW4FTfQyU6VI0ARpYF9OhA60wRbfDosY0bfJPqkkkcdboHalS1NybO3RIg6Do09UcaOYbqgmvvxdsPDCwVXaF9R53eWY6B684LT63q+K623fja57GfF/zNHP0VTMirCEde99euMB6fIF7+o6e4uwt4LmSTNoKAsMEQKClImkabfXTAX2tmPWW0+O/vck92u7+HVLmPkuyc/e3kezCSK/seuQPbekRhMU2/+M5nCq7hzvbcKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10928.eurprd04.prod.outlook.com (2603:10a6:800:261::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Wed, 13 Nov
 2024 08:08:14 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 08:08:14 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	gregkh@linuxfoundation.org,
	Frank.Li@nxp.com,
	jun.li@nxp.com,
	l.stach@pengutronix.de,
	aford173@gmail.com,
	hongxing.zhu@nxp.com,
	alexander.stein@ew.tq-group.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 2/3] arm64: dts: imx95: add usb3 related nodes
Date: Wed, 13 Nov 2024 16:07:44 +0800
Message-Id: <20241113080745.2300915-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113080745.2300915-1-xu.yang_2@nxp.com>
References: <20241113080745.2300915-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::14) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10928:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f93179b-065d-4b99-74f1-08dd03ba524c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?skzZaLFGSwlqp8jIVWsyijaPCqU0xVRoEc7V2oPVH11t0B07Zn4/U8dEalVj?=
 =?us-ascii?Q?gW3Z0ILPs/L2MZyhvEgtCF+QUrDOnpqRKIHx6oESvmUD2qihyVq4y1N2dSkP?=
 =?us-ascii?Q?hclT8tfPYZTkFAlWnFlurqnqq4RlxYKq5qdzK3SBVU4lZJ0taM/g+U6dSrFZ?=
 =?us-ascii?Q?jG84Ihq6T3YWlFYi+53r6rFOZxMhJ4EWTM4isFYs0snCcI2PBYK3jljUwD5f?=
 =?us-ascii?Q?IpPbUFdm1edc9UJisDsnoYJWPuFF4nycK8qoN1VHul23TsKMgaVlEvPbpgVb?=
 =?us-ascii?Q?pfs7ZzQG0WIrWsmE5RAJp0KOFNZvpYDkPnIQV2Rfbs8WX2tn8fpaCiOk0DRp?=
 =?us-ascii?Q?EIA8x43p5zZ5aeyNrDJD5ZvZ861F3pxNe3/p13ycE9YB6Ts+hOoC3TPeufdC?=
 =?us-ascii?Q?xBHu6v9XwjFS6zdKrbZ8eH1pQqsRzCipLTa79hRMFsLlFcmYdXxZlSI/Eniu?=
 =?us-ascii?Q?6Hp+TCnk35aOiBEp+UKMyqgIOYuw8TWjlU14rkITcLlh3RaBZdEa6Pyip/uO?=
 =?us-ascii?Q?q7h9s/456ONgwMPHVtG5YC1gwV+i3lBrMAO2Wao3IIRipOGFxQX6SJcONN4x?=
 =?us-ascii?Q?0iBxQkhMrPEA5+9pgWALWTFHvPN3EZvlUEgdSAH1Vtgt2Z3dQB6OUTeQPugi?=
 =?us-ascii?Q?BTCS7o5VtfupMPYSgxo7Y+nrflVUOvp81ZtNJeKkeMsbTLiF7eG61N2KLCns?=
 =?us-ascii?Q?AdYyNDcVOMj8w0k1nPDuR8nFPRqL/jHQwQu0zPRv7ykidLk6l++rTd86URU6?=
 =?us-ascii?Q?xvvchyG/iu5O4a3UrL4ONJFaI0sOGIP4Q77ogfY4P/PHh518TiQsCMbrw7Du?=
 =?us-ascii?Q?ser/Hr332YZOLRxEtWh8HejpmmdqK+FFIuCRprlCDWx0ZNUehmIUmGv99mfj?=
 =?us-ascii?Q?Re7FNfuHSD4c5kGHx0aWQNwNVrgAAMMsOOzFe5rI5+g8LjpZRpidE9ijYyAj?=
 =?us-ascii?Q?Ia47jKQwer173lCQZDSfWGth+50rMSdV8M2Y+4VpoySiYR6iZU4JUsvlRPLf?=
 =?us-ascii?Q?Ytteo9aJ8UUUjZhA4JYeYHKN83ES9cdD/VnWGH6vwOcz2DCVX3spB6LQXa6n?=
 =?us-ascii?Q?6k6zgeRaxGv3ZjemoJp8Lt8xcc3BlocJ6//HgebXB/7RdM9V8sV7E2DJuJnQ?=
 =?us-ascii?Q?o7hCqv9eIpKQs6p3l0J6OeANZ01nVtBmGpzYArPiPY3gAknuX0Ttr512A+ok?=
 =?us-ascii?Q?gVVdpFW8+Y3fzBNELOVymhofKOdbiSqsARDrI+KO02Wvwkgg8Uxi6aEdQbXH?=
 =?us-ascii?Q?h/Ck1I7TfucRuo/MwkU0GvjeLH3a3L04mrG8dclGYJn/Awcu6gsqzGMaoElS?=
 =?us-ascii?Q?dD58pZWQh5/TuKwG1A76c+Y4ERer4J/sW057okd1d2mqLNBmj+9P8SxJNEAl?=
 =?us-ascii?Q?taMDmH00SR95i7ZEMwarq1Q0dZuq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hCirrexMltcl+3dU7YyHUvKNcQZRqwIXwLHLYVPfeSLeLJQX+PNqsvoe2Jz2?=
 =?us-ascii?Q?0Mq1iAGSVEdJwkO+tjhhseUcMwxk9LHiahAOqp6XzgVIz+i0txBGwihXEvun?=
 =?us-ascii?Q?2SE3OdGHZV/RCMP4mKEJaz3aCuQjsB+cUJAp7AfIwB2bbAhoEpv5ey3ImubB?=
 =?us-ascii?Q?VPgKaCWQom7FFskR24KrUCodFhzV1p3YSpmeCYlS+MlQ0J0EuEkwu3sDNV78?=
 =?us-ascii?Q?LJFGC+fqGTvK8AI0frD5dVuXt5XPGIAa6Ngq19twQOkrjuJZK2oHz6iKbWA1?=
 =?us-ascii?Q?4xp6i7jL5NU93biF/5XWFi7MGMs2B0iNUIZQgSJ1XoGP/SEvE94N3vbRAlOz?=
 =?us-ascii?Q?GplgJf+FDbj3XqY6vRKNuwqy0Su24ePvHhHZIiLemFE/WK+QoQt3OizVv19A?=
 =?us-ascii?Q?q5IirK3lUkFu+ab2pW+u13F20Ri/8rx3wCmAjsFGhGdvNYnWB4wclqTK7XBe?=
 =?us-ascii?Q?FZdpxD4xDSK2LsLglVC4k5LuefwMKU6X9q//ujDE8RaNgZAasJP6JAwNvULZ?=
 =?us-ascii?Q?a65iRZNMWMlr/RRH9vybj7nJiA6yL+y3Uhal+V7k/4cz5B+WW4DkuOAbCWoG?=
 =?us-ascii?Q?SdNlf8o0wf1gbY+yL3M/cHjrxeb0MnsQhkxwtvDI24pDDFxqyYx+QmKZ9M6a?=
 =?us-ascii?Q?siDMe1mID2J54SLpdXpGNcw7x1Iwuf/7SrbiySrR21Ed0RLMhXg5hsSjlatB?=
 =?us-ascii?Q?Z/NGnYAPLjz9x1EIQ9oBeCiQjyuJB/5fIt4DlCYicyJHx00jcE87ePaSg72p?=
 =?us-ascii?Q?YmFNoK8lxT8dPzJn+ViE3SNfVGAcohGzIEKMlgsLb/UJAn28CpXjsshVt/8n?=
 =?us-ascii?Q?TeqnMPnnyS3JxZV9p5O7wtOFWMDqUyYXPZ0gRIKzU8FL3bOydMQCiOLThqTy?=
 =?us-ascii?Q?iNcAojp2LlrZSCpW4oM1Si+/enP/cdQSgh8CATBjSrb/ndggfhXDeFuYOoy6?=
 =?us-ascii?Q?XO9cMYzZ7luciC7Ghf0it8mo+Kh17rws76TUPDEDOVtE6Nyogp8fWKChqlJs?=
 =?us-ascii?Q?vKhimlqlTr0vC0S4HLOtDY+R+0TDcfMmpu7cLMcLOv4A4JegxyOn0EzIhBK/?=
 =?us-ascii?Q?Fuf2Y7kwpvuxVNpoBExS9B0g80CHHyZ7d5fZl/XWjDb/LMMD2n9WPsAwPOWW?=
 =?us-ascii?Q?RcdLsg26kPWhSmuMiOhDKHja1FaIbFwiJPE/z6394CulPnk88MFpia/ITChX?=
 =?us-ascii?Q?+62Fma+lO7E3jb/pXffmEb49k0ldK8srpnQZi0EY/lPKYqCBwfjtxMPJOt7V?=
 =?us-ascii?Q?jBmp1H+rajFDwkdjlus45JEi+adklihuqiF0MYbit9JGJQdE+R0Ovh8SU12c?=
 =?us-ascii?Q?GxWgjQGKbTVPJOoLD7XXQ+s7HA6m4KlS0JwmJoaOcG7pPViHCkPYjhv6v0VS?=
 =?us-ascii?Q?LpPBr034gxRc7AMFU9LyCiedf1QdFf5CsI1EONDvsywuYbFkY7Q9JJCqv4LE?=
 =?us-ascii?Q?+OU0HInx9pCn0Lt/H3sbC2CZC3IyjSBBHKhI8pCEXqzHrFWRjneKocndCEvn?=
 =?us-ascii?Q?TgmKmxo72iJzKhYwrMzaNW7PAXndU7sIbUw14ouk8GwhGU0/SX49wBSzpT6f?=
 =?us-ascii?Q?VSfowNwy40Y4wOnMD6i8c9I1+8okFKikqyjZwkJR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f93179b-065d-4b99-74f1-08dd03ba524c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 08:08:14.6917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLVw/DKcrwE1CKT6rk5c/dEcsffWVzuOcBzCFWu1mIpjni02O/EZ5OwphJPz3YtDDymLNmaJEBRbRaeB7dsi2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10928

Add usb3 phy and controller nodes for imx95.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
Changes in v3:
 - no changes
Changes in v4:
 - reorder nodes
Changes in v5:
 - no changes
Changes in v6:
 - rebase to latest
Changes in v7:
 - no changes
Changes in v8:
 - no changes
Changes in v9:
 - no changes
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 43 ++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 03661e76550f..e3faa8462759 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1473,6 +1473,49 @@ smmu: iommu@490d0000 {
 			};
 		};
 
+		usb3: usb@4c010010 {
+			compatible = "fsl,imx95-dwc3", "fsl,imx8mp-dwc3";
+			reg = <0x0 0x4c010010 0x0 0x04>,
+			      <0x0 0x4c1f0000 0x0 0x20>;
+			clocks = <&scmi_clk IMX95_CLK_HSIO>,
+				 <&scmi_clk IMX95_CLK_32K>;
+			clock-names = "hsio", "suspend";
+			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
+			dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
+			status = "disabled";
+
+			usb3_dwc3: usb@4c100000 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x4c100000 0x0 0x10000>;
+				clocks = <&scmi_clk IMX95_CLK_HSIO>,
+					 <&scmi_clk IMX95_CLK_24M>,
+					 <&scmi_clk IMX95_CLK_32K>;
+				clock-names = "bus_early", "ref", "suspend";
+				interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb3_phy>, <&usb3_phy>;
+				phy-names = "usb2-phy", "usb3-phy";
+				snps,gfladj-refclk-lpm-sel-quirk;
+				snps,parkmode-disable-ss-quirk;
+				iommus = <&smmu 0xe>;
+			};
+		};
+
+		usb3_phy: phy@4c1f0040 {
+			compatible = "fsl,imx95-usb-phy", "fsl,imx8mp-usb-phy";
+			reg = <0x0 0x4c1f0040 0x0 0x40>,
+			      <0x0 0x4c1fc000 0x0 0x100>;
+			clocks = <&scmi_clk IMX95_CLK_HSIO>;
+			clock-names = "phy";
+			#phy-cells = <0>;
+			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
+			orientation-switch;
+			status = "disabled";
+		};
+
 		pcie0: pcie@4c300000 {
 			compatible = "fsl,imx95-pcie";
 			reg = <0 0x4c300000 0 0x10000>,
-- 
2.34.1


