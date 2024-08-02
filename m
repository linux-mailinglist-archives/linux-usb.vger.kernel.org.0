Return-Path: <linux-usb+bounces-12880-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADB4945ABD
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 11:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CB7DB23DC7
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 09:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252651DAC4F;
	Fri,  2 Aug 2024 09:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LrjccJzO"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011058.outbound.protection.outlook.com [52.101.70.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A930F1DB425;
	Fri,  2 Aug 2024 09:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722590224; cv=fail; b=HffOoTkQZoaWKAk1zwvm28htnRt15nG709TrkKLUf9m4Y4zx4FTFH9OBfUGw8Iwq0zbUxQeH+E6x+2vxplLqEHB5/8YTZXhFrZl3/6WizOabM+tB4wfyRIPrvzwSPoSNINjnxR87InrfdoX3zUfNmRLQQ8/XEd7FbxdfsO85t50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722590224; c=relaxed/simple;
	bh=oCK88yLacbboYkqIou9X57y4TwE8iffHRf8vJyZPjlE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b3IGGKggWIPTxtl4suKUAkZR2Vz6RLsvZw9pe4acWKCj8aER/FNe4kgkcXgeJCOFryZBPhJlBzRPMhGIlXFfXkDKFmVoi+Lxat5+9G/As4/Q7f3Mk6UCHE728fdaFYbTjfgoZ7NiVPr5K+pdmjnivbhGQIkUu3momfAV7esoIXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LrjccJzO; arc=fail smtp.client-ip=52.101.70.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zy0etvOorRqUHABeHwlT5PEj3u2Axx9uvxhugnvYbyNUPwYBqAWDfdYPqmGqeaMH1RhUZUi+Zv4r59OSBDsMF2lo9SkSR7Z1eEi8cwds9vbh+LImxqHMpy3mT+6EaMevUvnEcDy8p7F3rQV3Vsz/IOebu6yi0PahcDtQQsBKpktrmE7jFwoAFRFRkUnnQcv5w1A02pAurcGQtSB+XiMFJtweHN7Ynz2XXdg7nY2DUVMRJbjgkp0tPkbia//16Rkdy1WkTxawfdM1mTweZ+NBRuptlDI/t8Bh5NDw9K9TQKAIlUD0lOcuoFjdQuHGYSZLEC9bllPEXkJcK9c3PYEYGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GetUt9j2vTQNtzOknZQOPXcwmBWfKLOSEdb6wDca670=;
 b=ZPpBR+LUO0WMnd5wyfOSnGfeGy58EZFbRjTJHHxRA/RrqXrQA1MEHxTmPgtj/mGxbM5DcUPuo+s5XChsDibNVMR8rLMpJDykxAjgB5ZxxxTsiWzJrXfxmXKgJLbLrH8KVrlW0wE7OmGdl7zHn84OO5U1flhfuhg+OWwIhPnKTX6C6pCPyHKcntBV4XX5i0Cjl3EEJUUzs5zNgcBH0dMOG4nfqQ+zT2DrxSPlXtK7XrMLkyCNLMDbfHUrooHHKCSI4xfCnZBrpq/CD8RclPiYaCiAnXwLVE/gJdSrQl90LPtZovH37ruU11UzjuJ3IYxYMFdmXokdk3cORucZErYfJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GetUt9j2vTQNtzOknZQOPXcwmBWfKLOSEdb6wDca670=;
 b=LrjccJzOZlaZHqR/c4e0TBrJn7jrcbzA3G9UWICZ+pCXDtJurE1zCKHYCvw9+JYTcdy+06Z5aPW4uXukChFf1kYPtW6ykRfyunIM2md9ARzSoMsvIdhfy9K7cmVy2UQGhLwGsiKaPAcpW869E6JzyftmGV0z/gvlYbVrxMaFYO41ydmIL6KzKIJ1ib+SLwK6rOoToFf69UvIlbQOZkFEsWb6xucAOCZVmRwN6iTZuXvx7+k77PTR/vOBpOPt7P/kauwh/sgPCIbMxf8nmx/ezW3krHMGNtfY4NFsK6T6nE12ohRPwi4/36/CUE6izjNxZ4Tlnnye9BvrrdmXHeTjvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA1PR04MB10577.eurprd04.prod.outlook.com (2603:10a6:102:493::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Fri, 2 Aug
 2024 09:16:58 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Fri, 2 Aug 2024
 09:16:58 +0000
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
Subject: [PATCH 4/5] arm64: dts: imx95: add usb3 related nodes
Date: Fri,  2 Aug 2024 17:17:01 +0800
Message-Id: <20240802091702.2057294-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240802091702.2057294-1-xu.yang_2@nxp.com>
References: <20240802091702.2057294-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA1PR04MB10577:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dc80803-d7df-4ddf-05ea-08dcb2d3dc7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q8qObAHEgWoODicF94CsFBKnxvqNIpI0jra5laZKDcRaQoqP8WuIWR0L/PEQ?=
 =?us-ascii?Q?nMT8ycNGbKYRQaNII/vczBDTYF2MSTPPGJ+fCOv91S726CZ8GOZqwC2CODvG?=
 =?us-ascii?Q?eijq0L4eZcw+YfZZM7ve+r9Dk7/HVT0bS6bXeJdl8X4b+sdttoZxKstVJgMO?=
 =?us-ascii?Q?Su9yzfVi3672F+1PSlyScjcLYFpatMNaFtY5Low9VNnmdQc/+i8J2vxbEBB6?=
 =?us-ascii?Q?6avmmJo0vhLoxlinR1f+KO/YzIs3zoRqOhWus24EfH0prlbjaBYanI8KOcYk?=
 =?us-ascii?Q?dj18MrYj0PQSj4eiHzu/bpFb73tKZpyvpdrcREbf4aWuHofmQmKDco4XMiu3?=
 =?us-ascii?Q?CY6W/HZZB2fQ0nA0jdR5awWOVnT2DvCjhWBAzz0zPvu3M97Ni6fwX5ZvUKyz?=
 =?us-ascii?Q?a3SFbBhM4fNp/80qrGfPKjJt0roQy1a1uhZQ8Qczt20kiJH8RbN6lMzVy0Bw?=
 =?us-ascii?Q?N7DGQpUlyfsNaHS9IYc+ipPCrn7cNpmzdpi7nmG1fB24hs1d+dcAHuiVRR0z?=
 =?us-ascii?Q?nGQDx1pi6WsIL1pQFYLKtR6FiQdO+fam7WoFV/l9TEKZYqcOSjEsCkAAWvyJ?=
 =?us-ascii?Q?2L2H8XVbIOWSX9NamgFwvosJD45tlkjuBnID3GDSJEDgjSEMZNrJhAuIPiEL?=
 =?us-ascii?Q?GdlA7n8EH5EFjRLPhsO1U7FGvCFV1IJPU/2o0N89wXypdXTyL23blMDV5knV?=
 =?us-ascii?Q?DnNY05b4K0IkKtUKHChORvr7K881r92vLVuRBhyqz8r7MZKeWAkQG5i3uEgj?=
 =?us-ascii?Q?o0hTPJnr+J2C6icsVLdLPoGUWGkzaUvmtEMNj6KQ7iwjsD/7CVOIZBtt+7Lq?=
 =?us-ascii?Q?FQdSrcNfJE547rrNG590Vqjk7dBXWTviG17TIvkoB6a0YnfMqyK5eeL1kY63?=
 =?us-ascii?Q?1jbt8ienj31X2IR24VIwISPyLLkRrkaQYUOrUegwedaGpr/WchPeVbnB6J2i?=
 =?us-ascii?Q?ZbfgUwX/GB0oZqZY0x4+OkKSiqE6HSSmBq9YyTU+BgOH6/B10el+I3zGZc7r?=
 =?us-ascii?Q?37WACTxhD92UGqp7KYJxafbAorC9BTVgFSqtzSTPZ/Wp1yoeFVLatZ9KKXka?=
 =?us-ascii?Q?UPwbBRLrIFTu8upu2jFFRIxdKX/Wvp3nEfK86nvruAcq6TySRy1sQBTIk7EB?=
 =?us-ascii?Q?oNRSbQF3ielrNrIFdqulfgpn70SPgK1sFfYgQeogmu9v5czxKKPyX2PH9aB3?=
 =?us-ascii?Q?J458aQ2rWtB2cXDc9O8TfbyUFh2+Cad9ubcJ9l7CHTmWEVIX/ro5k5Zlxh6A?=
 =?us-ascii?Q?8obnEP3luK0sPwn88hBMLfeUOElac9NNWzgn/UIhqHSW1pgH70kIyEwYgXQO?=
 =?us-ascii?Q?N0RmKX1X5z3NCwytuVEXXUSisZuN+T5gZMjWfSoe63c7XAqXw9DZp6w+NOQx?=
 =?us-ascii?Q?tzTBE0lQ9uTFcZb9laEVCz9VS1mCkUfraSjYM9h004xCxQcO+XuC4T+1TZGz?=
 =?us-ascii?Q?izHjYCTKE10=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z+Dy6CvDloy2MhcdQHO9KtBJ0E/PfIPKz7fxG0EV6DsF6Wd1EmPjajtkyLmN?=
 =?us-ascii?Q?FsmujIZti/bpQSP/8kc8N/PkIL7qP5QDRYphzcKBLRFKuUj3ip+n/nIt6lfm?=
 =?us-ascii?Q?XV4PvlzENugBqOmWto1DHDy/BXcZrK3AfnBsp6lRaTHukJ9ppoa8JOYg/qKs?=
 =?us-ascii?Q?RC8Ke6q9SBYVI3kBX/O1UJm7L/tFPYswaanJRlE07S4rmDF08V+3e9TSLmvP?=
 =?us-ascii?Q?k7oUdPZoT3eYFhXM/N/r9VQs9kDFZl/DZRxQD6VOXgeViFFWpNEnfigdmfOt?=
 =?us-ascii?Q?+nvWJv/xdZVUxlLVn+JbonykuJXIUn9jkvAUfANxJTb22G9g74fOWSWT8l3m?=
 =?us-ascii?Q?mrAaI4qn8JeBedURFnzUm9GhX/il8V+qrio7+Gzb3CwOqQXTppnOqkMp4ByY?=
 =?us-ascii?Q?IvPbcE0OSaKKuR+4QbimYwcI3IEN40tvwI/kJqCpCszQQ+s7V5d7zURBF+Xi?=
 =?us-ascii?Q?Ics8FLaF25sfSMMa7tRrpsvADBdE0e5f8Yg+0AlnVGqJhS7lshVefRigiS8e?=
 =?us-ascii?Q?3hsQpcUxp1eUFuXSOKMSiyXh6+9aest0GEC7CwyCIGP/lMk+D+wcxKtYHvi1?=
 =?us-ascii?Q?8/RfyuqJnKunf8X/LcK0FcOlXQPyNhB16u7h00QwNeg/Qxksfm479OeA6kzB?=
 =?us-ascii?Q?it1lEFuQv8aDOUVagH1iNHKwUDhH3dJY9IACNFqLgC8c5igHUsMBKsNk0n/7?=
 =?us-ascii?Q?LqEUQhhhtxvPPqdyVaADOT82pDow0iMsi4FHPTFHCRZPkZU18q8n6dA1Ekeu?=
 =?us-ascii?Q?vEwymkjHjC+lHKsZRb41ueY1yKxNlCnIkGkdsXg6LiwV79Y6ujIjcQmYYlrT?=
 =?us-ascii?Q?KL1aS2MZEktpOZzuhxdrkyW8GsPNQXZKCBZbZACoaQZiQi3rNEvLKsppgUVt?=
 =?us-ascii?Q?OBMIl2nKK6RWMA/pm3CiuH04Cjh+9oEQZpTY3H9ttgdQt05kosV2qNSGYXwL?=
 =?us-ascii?Q?TOqcMgyNwl/5jY5csp1tpY53KJnQ28AZI2qv/rZWccWWt/NrgdNwOAY/iwhM?=
 =?us-ascii?Q?vKAwCl8pS39GSlmn0f8HuAXCy/ANuMf8V/MeRiqPtSJveLQd01wF30aqJyea?=
 =?us-ascii?Q?z4Z4zONn5VLco/mkl+6XEDDWsTYC4jgfLDL8e1w6ylS+DGJOxX/szbyjRZcB?=
 =?us-ascii?Q?cbbtn/vASlndR6dnvsYPCVyFPjlEFg3F5TE99GdhpkyzUrdDVpXo5+sra30W?=
 =?us-ascii?Q?OgmkG0PySo03k+VAew+rgYH2NICgAgGW/RTr+WDf4c2tERt4a0QqnW7I6pe0?=
 =?us-ascii?Q?mmQKVHvN10D8HVjOkzwU+RHtbSILVJeFX+m1vG5qywC4Ji7xNthGp6psIfFJ?=
 =?us-ascii?Q?B/ok+f483Ivw7X6p2L7MZhC8qlDGCA6e4J2IIVUdgyY85ql4ktRTCHLShm8t?=
 =?us-ascii?Q?R4J5LHSuAsbYfjiDRPMMIQ+HIheD3ddwpyIO/io7K3dhJ05J47uW+/SdWynw?=
 =?us-ascii?Q?CyFDnzp0TVXwPV9WGSn1lLRulOPyBglXCcKOBxILk9vpAoNdK7bgRSlEl5LC?=
 =?us-ascii?Q?kjqG7McvXEv88M/XQt/xduPjRLlRxaKkaKwpBN2ysMCeaRfJlO3hnYvEdW76?=
 =?us-ascii?Q?QmwuUL5gkXV+vGXkqO57XF5DhXwkNSyIy3gnqBV2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc80803-d7df-4ddf-05ea-08dcb2d3dc7b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 09:16:58.8645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4rqxLor/s1j81QOWCxVY1GeXVgVggWK2io3S4l915U8arn1npOZrhbO/PcrFeAS2BJxlDgnGKkleHT4TiQtuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10577

Add usb3 phy and controller nodes for imx95.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
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


