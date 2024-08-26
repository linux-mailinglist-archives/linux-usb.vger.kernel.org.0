Return-Path: <linux-usb+bounces-14082-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 254B695E9FD
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 09:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5C751F2202B
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 07:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0D5127B57;
	Mon, 26 Aug 2024 07:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JtJmTQ/1"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2084.outbound.protection.outlook.com [40.107.105.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E18585260;
	Mon, 26 Aug 2024 07:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724656127; cv=fail; b=J+14c/YMfSDffmgx57/+3wB1ZT+J5008iisiwjz2QYM+dpMF8qIQOzEZrrMLTmeJe6NRbpTo1EcIFJMgMqlatq/ay1ovMyd7BrstEsJX/y5Eix5kAb8sP7KQwDS/aOVYMTxA7/j4gKfr1LCakOQY8itpjGXftRRY1gSuIgFC7Js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724656127; c=relaxed/simple;
	bh=/yL/hCpE3BjdkuuJNGn85MTg4vd+YrO/k48u5+yTG6s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tB2O7ulux82ab4pge3ITBazu5mSn15ZZ2eSLZVRN+x7p9p+YRTKagkx5zheFmQZtZW3Semb+kTBNSFzpF5+97PAlKc6Ze+D8sFr87LkVcLF10rBEuFzRZlZViUQJAmFiMWXyQ78Kq9VNPHt1aP7YoSMkWZII2oq2EHJptgUclf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JtJmTQ/1; arc=fail smtp.client-ip=40.107.105.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGZsI75GZP7YXzI75vi6ylO290cwZmdrmFwz/KHgLQmgrwJDmVgiULIQeicQRSdiztyVuHOJaxwGsThWj+ecU34+xha0UhorsJN9h+HsGWLTVORoq5KKamU1BiFjyACM1qyOFXiVuSwJ1lQvWh82Jxnus+Xf7aMZGGfl2MGDJ4Zfc60vvTVvLmYxmNId0ocutGlbAlWsZPFmTyDcIH/2u8vyCDHRqxz+Tbzq3+0hzVkiNuw/Ks4rTrvfJcLtGtCBqV6qSvXSoxnNDWayVFn8kx/DsT4KfdCd8+OI6b62sqXITYGJkDi7cFNX0lOFd+2nBhjAqOHEO3NSmd2+AhYAGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGHiZ+fydGFVJytAyg5aNfOBoJVRhwyBXS1VCC9o5nY=;
 b=xnAbykQt48xgULnwHkxQEkIIDFtc3QP4vNG5RQuc8MhoqZvh5KmTMkZ6kYeCqNtstgfXrmn+0WtLcN79flGSXsT3g63u+CL4q7RU1Yp33BIclHZgnprwCNOW1iDBb1PMLpuQJDEFsipIgvdtfqWU3Gw9roRPlnAIjjr/GAuLWNA8EN5G5rr45xNFaFFWJ09IBAqnPwItm1AeAfKZ3xMaczNuX4W0qOpWA7BUXU4fDgTFP0S0DcFh+TsdOXkNuRNkSyXjPtpzdI/tbHW7/LWERCHEjzkue9Vo8eMV2qNbQkTM93tQDJJrBqZ+NRRhWmwrGMOG/YKXOBXSFBL8pKBGDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGHiZ+fydGFVJytAyg5aNfOBoJVRhwyBXS1VCC9o5nY=;
 b=JtJmTQ/18EQ/iuXiVgQAY5HaAIzgovkeWd4d1zPfbJ1WlhzBmdLVkst+DmmSRnn3SFSUDhM5bEJ40J69KduMyk0DYTmuJBuqhsDlAGNzt/+VxXhrF/UQsM4xhO+b2JcikFbptRW7yQI59ppmGMHJNneS6p78EiDqObia6vZqOBLnL8F8U258knIKzX2lDfL+1Ve3YYISQ4TTWQbalW8uBU5ovHAoEGIPZtSvFv9YCPowZZ9pa8qQ33HLYfo0NAD5I5fReQaKt3nZo7VrD+Sr0UdMlckRay70AsxvHj8tebX9xxNrw3OjlF4OEFh1JA0473qjOkPFv/N0ToVjmmW9FQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA4PR04MB9637.eurprd04.prod.outlook.com (2603:10a6:102:272::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 07:08:42 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 07:08:42 +0000
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
Subject: [PATCH v3 4/5] arm64: dts: imx95: add usb3 related nodes
Date: Mon, 26 Aug 2024 15:08:53 +0800
Message-Id: <20240826070854.1948347-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826070854.1948347-1-xu.yang_2@nxp.com>
References: <20240826070854.1948347-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0194.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::22) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA4PR04MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: 163f7166-bbec-4972-f072-08dcc59deb0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yfu0k8w/uz8Knt8dcTB0dESwMXkOW70vpdhWHk4Z6CenuVUR2b2H2UV21fYi?=
 =?us-ascii?Q?UUNuU1d18MUi/SY0754JnbnjRrHCB6xVsOBoEYdfk3d7WDjNopJWEJ4W+AQD?=
 =?us-ascii?Q?0sGuZgiPCNx+19Wl+sNSbhAPtN0qLi7mAkdeAAXWGWzJpaUs7CWVyVWaYuMn?=
 =?us-ascii?Q?RznC9RFyLfXjmGuGlKsGYlyjFFL7o1GBhtw8v0UZkWlnqTgAjhXfmS+4PWX+?=
 =?us-ascii?Q?x9PAJRQXq8DyGzetWJ2eFO5mHFqOl2uP37RfsPRvps0XbIDmNm08lUmatlcy?=
 =?us-ascii?Q?2vZvm7k8pzZ/4EJQONeLDbESIL74iu6+eIDUszGMstNEbHLjgRNtzCQMMqjG?=
 =?us-ascii?Q?c8aJNIEKyGVdiC5NGZv5wgBVflgqPuA0LPhwViuRKxB5nhhzJkyBkCH85ODU?=
 =?us-ascii?Q?bTFi3m79X2C2lI2M1j2T/atITAKULfGDqw9Z544xFlXNEB4itk01NuRL1UIT?=
 =?us-ascii?Q?XDay2QDbRTbntO/adycym7pclbedE94h3WDXpsWe3osgzNBALBaDcCiBGycY?=
 =?us-ascii?Q?fC1KsBlpCLsF/FMOe56iHM7pgcpr0mLEJ5k2eWfOxro5bUF9QjYYNvV2tHIV?=
 =?us-ascii?Q?kC18XYT7iPJGg3UXxXEaPdSfOjhAPKtE4VwJyA8XLBQFyvNABfi9tE14wgMG?=
 =?us-ascii?Q?teiRewJnIU4uvTESTj2pH9W4TX8wkEfom9h2lESV9QpJz10q+e4XEUYNlB7j?=
 =?us-ascii?Q?uM7oZmZwzjxIoTeGbEQMU2hgI4ETdI02AGx/3u7lxXcZ956fn7jgBZvvVD0y?=
 =?us-ascii?Q?j417dg2WOh05yN3ieOBLx0stmkq64Leu5SZ49numttDTUcMp2peNVUm3+MoC?=
 =?us-ascii?Q?VYvSiaHyiXZRMf/Nyhzc5zBrNyRdCq2jsK7JrdATk6WsrrvlaspVtm72cBkQ?=
 =?us-ascii?Q?AkAsDmq9bNLCrLDSfQacYqOWAeZQbo+5hSbimtTi7du1XlAeN1c6t0VD/Viv?=
 =?us-ascii?Q?62ulLxmIVuVJIgouBhTF+nlWehUHkDX+sMrV/sfJF5l/tGCMMw1CCo0vEeh+?=
 =?us-ascii?Q?/gG/tf+gZzphAfW0XDTnQTlD9cUeCVvCpKYMv3fRT0MXOkwtqNnMLVnAcyqX?=
 =?us-ascii?Q?v4ULHMEmehn5A7rxV1abYvvRl5I+atklvPT0N8vlgMYUFKAfswgENeTfwESD?=
 =?us-ascii?Q?CScnoziInHl4nITzYinxtvHsZcFRMI0eAan4DgVUda65TaxenilqtUB3UawP?=
 =?us-ascii?Q?8Vg+lL32Oga34Y/CL7ClVuR6eZfNXdTWwU441X3QUIsQTO8R/WdYqmfkdGNb?=
 =?us-ascii?Q?CxP5NvSTmi6xVXhIk+LMfbMt1m5RNIeZ3fU73X2k3rtXM44NM2p2VHvouGyI?=
 =?us-ascii?Q?ncWqLa/2/toD2+8DDnCxl2dc13GzE+h9gjuh2qzQ3tM/8UPu/GDR2/yuji+v?=
 =?us-ascii?Q?XGK+7VmH03T+qfRnsVV8hEO5QPGx9N7hrqcLhPpBcPrU808SwQGxUr4uoDg1?=
 =?us-ascii?Q?/kuvJClhQZ0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wj4xc2Rsdl5DaG69ycOUuXIyvONmFoYCbDhbLY19EvLtXunqHr7W7y8ca8ly?=
 =?us-ascii?Q?y5mQQlWzvHRdVEeZ93/gjlEXbmXBKaT0Emf7oydgbgcHtmujaLmTHOaJSoNf?=
 =?us-ascii?Q?xp13nWl9lIU970SNm7fbQeUNtRLrG00s4c5n0CN7CF+yWpfVK+UOtH/pb7W7?=
 =?us-ascii?Q?UWM4mI2iMeexnl24XKzqCPH/az9w0e2b0qIQ/LgyedXnjNQmSBRvRaN+hwWi?=
 =?us-ascii?Q?itkHlgzvGCwh04lxAKhgUqTDZ1E25ruvnRNzTbEe8sXSAVSjbB865xso4mjc?=
 =?us-ascii?Q?up6ecL3ZXPHaaTHW9pTE5u+7bUeWlxks8pSmiX55amj2Hhfe1/P/NglpNBJ0?=
 =?us-ascii?Q?m1RccH1AIHTokOZpRzZvc16Hp9KtNFonrMz/8HW8mMfI/1I+CNXIWDlO9UPX?=
 =?us-ascii?Q?JxZCq5NS+HeiMzLZ8gTB9Deff1MQTmsOkdk/9mYjqaAhPvHdZ3VIM79V2Z3B?=
 =?us-ascii?Q?/9kJVSvpOdzDmBEXaUQCRYox7O9ejBgsuALofJANW7Iju0s0oK4Wn+MWJjsa?=
 =?us-ascii?Q?saXFnkSLbliEDlJdbuWpywAcWfcb0QfcCJ+so7fTgXzk7rWjuKQVMMdIt3MH?=
 =?us-ascii?Q?2qj317IqilSOx365FXtnTYCLnet7AHVyvcRyubdOYxym4pJ8TEfQV8Brq5Ls?=
 =?us-ascii?Q?YNPMe96WXUPdrReC3mYx5YQawLCnHSIYIJHK9ONKCvcnTglCxq69t7s7iZzW?=
 =?us-ascii?Q?ZAFNWq+loPkZsh9ESUpSM2DAVj+X9Ml4gCIBLOkLK8HeXR6WhsK9JgWTd8jB?=
 =?us-ascii?Q?ANUG4l2oD965w5qw4Uhyufd0EuqJefZqkz/w2sIi+KYSjYuVconoz5x7sFYT?=
 =?us-ascii?Q?ScRBiREa9Icgfz9KD5NLRA0WNnOBwbICAAFXuOKVN4lstNz9SoGC1R+Z6xwZ?=
 =?us-ascii?Q?JMGDdfqzyfxd5I2kelKDjRzf9zFtbsviFqiP112v7Py7KC1JWxiljBrOl/4q?=
 =?us-ascii?Q?M1RO0bm/5fSsTuzp6aoQxXL2vzDYZ7B70TIdb642QyIjjHUOY3EUZ3HdTVK1?=
 =?us-ascii?Q?tYlQ/vxUmgMGEbX3mzjzCrlaNC5q0WZ2DiQ1L5VyQ4aJ9yENnYf6V8o2SR4Q?=
 =?us-ascii?Q?PsiLbVDShNQJ65sTXTXn9Wm+IM2jmlMl0UNxjkdqVEidUYBtNseB/doVNhvW?=
 =?us-ascii?Q?hoGxBbaH+4hl8Pg+d4et36dltXATvk+o1n8Lfu18xUowBC4crrA6I0t6MaUE?=
 =?us-ascii?Q?999/cVaY799h2R/GM2nwCSu8CYjcc22uQsMvm8dyrVj4Lc3gI45NupUWjrfE?=
 =?us-ascii?Q?8ofIcqm54J5f6zFcY5DLAllltWIR5znkrfVW1p2yQJJdT3HU97xy6DDYvL4r?=
 =?us-ascii?Q?lgz2p0ihatOEyG+yzahX4zKMBVVhp7tsLDoMvjt2tgW+Due+Woe68633+Rju?=
 =?us-ascii?Q?hs77pe0JcwLKkIdVkut8if0sjIOcdqJFgnVJ+jN2jHsRfgF0kfbQ4/jsqwuE?=
 =?us-ascii?Q?dd+qnnwXPBgtmzvoUJc84tYY/BYHuuWedSxfdbQbNPe1bKefMF4/sHYMFLQa?=
 =?us-ascii?Q?CEUcFMKDVf2Q0Hs6em51EHB8ERq8jWQHkB0p+a4jUS6phhS1HcL1tyKrKgQ6?=
 =?us-ascii?Q?mihWK7Jp5fCt7CgXOabl1sFSvHeurHsM7aPki2Zb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 163f7166-bbec-4972-f072-08dcc59deb0b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 07:08:42.5048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +N+AxUwRcLsJ44qjJSj6i1lmC/MtKQbU4PnTJz5yS9Xp3v2ud5xlOTD0gzK+ziRfR0qx1yLTiFzyX9fA7u7PKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9637

Add usb3 phy and controller nodes for imx95.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
Changes in v3:
 - no changes
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 43 ++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 1bbf9a0468f6..06a7c2f1e211 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1188,5 +1188,48 @@ pcie1_ep: pcie-ep@4c380000 {
 			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
 			status = "disabled";
 		};
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
 	};
 };
-- 
2.34.1


