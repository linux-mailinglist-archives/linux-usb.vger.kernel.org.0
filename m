Return-Path: <linux-usb+bounces-21247-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39891A4B6C0
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 04:34:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C3D73AFC1A
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 03:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B591DE2BF;
	Mon,  3 Mar 2025 03:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZkYTD/QJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB591E5B89;
	Mon,  3 Mar 2025 03:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740972781; cv=fail; b=THVw9BWqxk41CJRcPKaqTY/EB4955oAUU105gpyc3UgEyvEVWExQBbW2MqDdDwwwLmRi0bEz9XsWMJpwXdES1SOxyUXDDnJIZ+r9q82fDSzRqHrDxgNSExop4MKgOwUwFLY1lQkJKLjPg6yxVW40KX5MSql3YXh1quwd6JB6dmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740972781; c=relaxed/simple;
	bh=kYfHYob979yJ3DJEHDpJQTvWustfFTxh1gU7/Jqs2lQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UW2tBTuDQxmyV8BLhD42pwIFhoAqIJbwch4KuPvGTaccPbtEfWotalRswODZux9XUU8VgOBdDsN9EUQNElfa6Gd6AmEeZxxlKFPqFtp6SLUwjeP6MUXXl0r2crhCGklwdF+G6uCSIkWg21s51XZxBGc6lHTWzcLX6MnSip7sZiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZkYTD/QJ; arc=fail smtp.client-ip=40.107.21.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRB8AR+YA+ADAHx1Uu6ii5VBrWc96vfJ/hO5s3josNg72ZUCnaq0ciQdNCcW1amc+sijCL6eM04DSTVqR1iU85hziu+r7c8zX9x79nKltfh12wnBBx2qciYPp1REzA378kDm5JsG1Wqpd/8KTHpNESk47eNLirPKNNuDNnI0adPn6ULaWBtdjgFaWvBChZCC5ncFW97rVUxzsLb6weaRZPkauwZ8JRQDl7VoK91iAuyNTMQYZQCBiyRNY490VERCO+dXshVxJ0AkvhB/BA+qje/Z+dVyJYuGj89YCfQSnW8qMQzmuN2t2tIZvqBvk/3rr89zkHlIyB0602ivTIXhCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByatL4aeVzYfyE9YlmlSCXFePTW9+Rrs10BO3Btw08w=;
 b=ehkUVTdqOkiyCjHP90BP+KaXfYWytAEfaS9htDH7E0eWRni6er9rFF1kV7EwdyeYWOFrNGsUod67k+QxAZIAu1zu3cT1WOf71HibpG8X1wgSgCl7b17GyD1zAhsBKkwAHawWDPywlr3YRjv6JVTrLZMfvtTgqAxA0MBubGbsnKkd9DVB/nvaNW7Vohn33gSKOaKkrq05Qx+Y0f2Y1J9TsqeMohDP2f1MZjB6HASvHqPcgcF8NULRIo83n5Y9rgnCyewhOEret2DE6eqCycMUqvSpCMM3OwfvIbLJaEsWi0Sg+QynVToR6NyDRc2yuF2HRCDm+PWGLVMcF46en5/kHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByatL4aeVzYfyE9YlmlSCXFePTW9+Rrs10BO3Btw08w=;
 b=ZkYTD/QJnUa/90my2uzG3KOSG2I7FoTUAfvCD+wnFglJjDuj5tbFhskVowbTr3M9dirSWD700MdoUHlg3LFl6ScrNI2Ctow1lMT9TDV4kv9wV/ko0DVhWCOpsuqlrs6EVsxyVRgO3SJ++kyl4OyAOhuE3YnMcJvX2Z5lXlzu/8Xno/1784L1u9pRSVw3dMYt4iuYuwnlsggnQUSFB+A2tsAXAMlkX1Yv3K8jQsTgJx/KSR7FpWACNSG6yVjsZrIA0XYDMP6r+VLyZ70tIWgJ3E4oX8UB3441tJjMDtmRBObXzeQphCh5WjM4IK3l06BMvgfx8B8eiwGaFqeQjV69Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 03:32:56 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 03:32:56 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peter.chen@kernel.org
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v4 6/6] arm64: dts: imx95-19x19-evk: enable USB2.0 node
Date: Mon,  3 Mar 2025 11:33:44 +0800
Message-Id: <20250303033344.1251076-7-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303033344.1251076-1-xu.yang_2@nxp.com>
References: <20250303033344.1251076-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096::24) To
 PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|VI1PR04MB10026:EE_
X-MS-Office365-Filtering-Correlation-Id: fdbfb73d-7262-4158-3609-08dd5a04167a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tJUbcbCGtA3a4+cDNAuuV5s6+9i7UIDvQnjUj9RDzi7IX3JKLEdk6xDy89bL?=
 =?us-ascii?Q?IusO+5hQyMyIqN218fb8QXop5CDrtv3wSvBgbe+PHdxyzLf8c5lOcxqO6S15?=
 =?us-ascii?Q?RPxW16Te5MEaTh0xJt0cIzAOzxSVPNYPFTNIfixNcTEG1bx2c3aSn3Gs1SvJ?=
 =?us-ascii?Q?Y/GiJyFoZOyFm5X5sPILMRt9/CfEavs5ICcuKvVdhBRZKtpAXm6R/ZlwS3hi?=
 =?us-ascii?Q?EjCu7TXDCn72CCcoJhp8VTI8GYB18j5nShdv0DYh567rCbl+2qRNWmax50mE?=
 =?us-ascii?Q?Xrx0gk3zwh6CeJTq3NkHih+9RUMoFPGdiZEOseYkJgcY/87KrHiH9S3whK2T?=
 =?us-ascii?Q?2cWFTIKSRNZ3a08vTT/6JnsjOXK4tLq3M1A3rWUF76wPaWUwGcgkNl+Xj/wE?=
 =?us-ascii?Q?xOqhaMeJOSqrsKnbenM3/BH1cvteGe3qEDQArIJ1QKpYv/2/uK0WsNPeaQrg?=
 =?us-ascii?Q?3zDvHBIzTsQeAJy4jNty3lFGW6VXMdBsmHZNEsE5H8sHamSEzi4ucgqsGo8s?=
 =?us-ascii?Q?NrzzSEQzjEFUiL60cRFsdNaNgv5S9pqOcM1dROAIRE03OMXmKgwe0QkKq/qt?=
 =?us-ascii?Q?8IwtVo3hJ084fa6bnt+NA02FSfVMWgjcWm0cdoe6ag4fFYkWc7hQh+hZzdqd?=
 =?us-ascii?Q?7/TmKukAlpHXry6wCzhqIxMXuUtobjYg/o/QNO2GiRhXQZx09hqpOvfFWeIZ?=
 =?us-ascii?Q?xr0pjXio34KLvDs+Qk4Q2pnWfsUuqco27nBTSaD4QI6OLH2SUr3fufZlz+2T?=
 =?us-ascii?Q?b443S5az93HwD7iMO36ZEkI4glai6hV6BDV90wlgBY0o/7IBmLyCCEFObmi3?=
 =?us-ascii?Q?eBLpsAKT7yD+7xDZDlQas3noVRhHN6FLBKx5Z+oqj3CoiiD9kgiC3uaeuYfI?=
 =?us-ascii?Q?xQ1yJVh3FSgGnDP91ewNhU/cxiHJ8VuJVNgSOVPhkxsjys1XX4jzerURIvIO?=
 =?us-ascii?Q?Wt46uHsuufE0DWCT4rhnTrhQMD+li8BRVlMXwEy5cMneeBSnWzgCg17ek7xC?=
 =?us-ascii?Q?i86jv8jgbGQzfsw8CHqRkquho0HxDr1UAlGGPMUoZDZeYlggW16Cr/vM05Ck?=
 =?us-ascii?Q?651Nq7+YO9jDL4ZswyRxGhgvsThUAeN7lOY+K35zvrTaX2FI5x8vegXuRqg3?=
 =?us-ascii?Q?9VnrQfHXgkYeOikPlJjRAKA4cHTm24mcgeSfbMyFSHdPPvvX41pWq0UHMqFZ?=
 =?us-ascii?Q?yn4Q0fZq8i+0H3BBPA3CMFnnW8bfnyob+2jTx3W+3WE7ylcRHktk9d2HQVfJ?=
 =?us-ascii?Q?es5/ilGMOCceY7iwWImn0kdWGKN9fqIRM9H4ANaQgRIT5I41C6uDFOKc90ZJ?=
 =?us-ascii?Q?ONn2+xJDgQWL8XDkl7heZ/XdADYXqFHDzSBJ4FIYQ15T+PC5N4xcIhJjme+w?=
 =?us-ascii?Q?1Jv6RG+BnQwgVgHT0d97+yq9zltULRnP5xQg60slFuO5IIPJgVsot0EpfQiB?=
 =?us-ascii?Q?t+8eKSYBL0EJXQdYY3x9VyNwdp//PO+t?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rtp8CbhYVDt6ETMzt7Sbb6LaLp2zVdqxu+1yDyJWJVjthQDMIVv8Y6Ucu4E8?=
 =?us-ascii?Q?yFEfAQKO4/vPpfrkB+4+pJn2tANuMO58L5PLvCiExtHHBgJPKxbGwMWR3YOu?=
 =?us-ascii?Q?vK8Cks/ypVmVISXzoTV2QTEMc65bNkrXIbpMaOTAZX32GnZ8kZRzo4e40hkv?=
 =?us-ascii?Q?1gGeC6NkUBQwpk1BS0HrXYD1jJChI5I4YVENEsMzfbIGu2WqM2m0MAgSskwS?=
 =?us-ascii?Q?ipJ6meC4ixcwd38xQXH+HqjtGvoZO6OyAXfem2v58KeC5lq82j9W0vOqeLQI?=
 =?us-ascii?Q?Y8/0/ea5tkuXQsjO5ux8C5w3jxog4F0ttnvhEb1tWbaqGC3ymKQWfqP/Zs2Q?=
 =?us-ascii?Q?IpYaI9fyznLWnMNqpf/6DQ9DX2tV2ePtlOU56ZY55iL3YxS773cBgvoYAfqb?=
 =?us-ascii?Q?XWZpS81MLnqzc32tSCZkevJbC+wY9zFkry59u4rFvC8kLJ8d0E/7AJVo3i5j?=
 =?us-ascii?Q?SXF6ung5Ftcnm8bQ4qWp3AGLrg7APs5EQJtEXeO4wifBbkzTAj8fCw0yXg9k?=
 =?us-ascii?Q?zOESs+uyb9R1lYUWOYlusyBY+SYXQtl58kFv3cxbfsq87aSqQoGSg4rPwv4C?=
 =?us-ascii?Q?+TeIUFnBjAamEq9ySWzNo8YMcqGrVb1ZrticgkyNHRut5t2UrbpbBIxONhtE?=
 =?us-ascii?Q?KqeS9L05C8IWlmeYi+CeGkZXg62LQ3EUoHgexu5w+6dnjF2PoxdOGPwfr+3b?=
 =?us-ascii?Q?cxPlNIJsQbDc76QPlJ8kDa0vOnE/NutIMMzuiPo/ud0WIDQrCuHql4mdkrBA?=
 =?us-ascii?Q?OKRrx7y8HMY7yQefFNFM2C1wVqKOYlfE8uGmCj+7WNl3DyXsBVPbQKKCSPKo?=
 =?us-ascii?Q?Lu86K1qidexoEN+bN9pG2E4aekp9FXC81Iv1YUu/GbfdVqYQ+3fRGKlE5DxG?=
 =?us-ascii?Q?S4nwx4iREJzCgQYPiHJLS328MvxKlZJ/u0bXjC5y7L4Gg8TTXKMgA/u+E+/Y?=
 =?us-ascii?Q?2aA/pTMoj+04LVNKoPrEltwcP0M40ZVLILJmYelnMYsw/W76gvHWFacnxhLF?=
 =?us-ascii?Q?MLVNqEfG/w8o6jyycZbXNCqVp/uC5bTEd5lQhYkPeJYWAtPUWK2IZaquMdy/?=
 =?us-ascii?Q?XCXPO6Y0DCHdU+wQRe8+vZ8zdJyhaFOPNdCu9a4RSLtjwow1osA9uxFx2p0h?=
 =?us-ascii?Q?PGwXV74pP/3TJAyaGN9KSznKf2En689kladxvaw/1CAmIhONpUFBOZQ95D3/?=
 =?us-ascii?Q?KIeAKcn7B2YtpJ9IYiBBaGC4PWdN3kWzqUf2AfuwWt8CkSj3aD8eiDDEeMzS?=
 =?us-ascii?Q?Y1YmsK6YZZIl7VlM/nkBJxyUsP4GphqNLI4FegDwVlHMeFeau0wsERTio7P/?=
 =?us-ascii?Q?IiPBeWYrrXM7uhP1tpcje40z9OCQQ1nmvbttI0ry7NNMivqZX68HpqxObsWo?=
 =?us-ascii?Q?wAMFrFsZGUlcPAiTJfDhX0XBc7eQHBIroD/6Ui7f2032e8HLgiDKdpKK6bhn?=
 =?us-ascii?Q?tFWPB2NC97D/yvGN8KgQMd1nRbwDVt3IS0O5Frjk5aiyptSmc/oW+7wCDHED?=
 =?us-ascii?Q?kZEiRT4q/wTzR2myotC23rFpytxgs+1LVuNr7A8rjYTrFhJsSPEDPnywSYNu?=
 =?us-ascii?Q?UtxK55ZImQ7TzThH8q4GPY3yX3bVFFrE3QQGreBI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdbfb73d-7262-4158-3609-08dd5a04167a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 03:32:56.3282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: skPRCtR8PygPMzwdwSRBZBwruz7F0RqJpeVze2BmBzQjq/xcPzL4LWp27ks7eMUb030bUW9GqyMrO165TnH/ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026

On this board, USB2.0 is a host-only port, add vbus regulator node
and enable USB2.0 node.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v4:
 - no changes
Changes in v3:
 - no changes
Changes in v2:
 - reorder regulator node
---
 .../arm64/boot/dts/freescale/imx95-19x19-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 25ac331f0318..a41d542488ed 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -145,6 +145,15 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		off-on-delay-us = <12000>;
 	};
 
+	reg_usb_vbus: regulator-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&i2c7_pcal6524 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "bt-sco-audio";
@@ -461,6 +470,13 @@ &sai3 {
 	status = "okay";
 };
 
+&usb2 {
+	dr_mode = "host";
+	disable-over-current;
+	vbus-supply = <&reg_usb_vbus>;
+	status = "okay";
+};
+
 &usb3 {
 	status = "okay";
 };
-- 
2.34.1


