Return-Path: <linux-usb+bounces-17613-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1897C9CDBA9
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2024 10:34:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C97F92838B5
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2024 09:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E224C18D65E;
	Fri, 15 Nov 2024 09:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GNZvULCm"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2062.outbound.protection.outlook.com [40.107.103.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7192C80;
	Fri, 15 Nov 2024 09:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731663239; cv=fail; b=rjwrn0xT44CAscdjTJkxdS5vcRXgGQXy8GlbTJD+NH+c9lFdlgY0PsMFQx7R0dipDdUc5ruWET8QOasDzouvqRVGk1Xnbq5K8GrGVyodvXtuXqldGOpDmn7AtrjJZy82ir2mu7hdtAIDGLP7kwdQ6X4zlicv4VrCQfJoFgZYs4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731663239; c=relaxed/simple;
	bh=rHX8+MDiO8A3aQiwtIGoYtQ67f4ok5qtgQGCySthyPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NlS/GqTkXcUD9hrVk4mNiSQcQz0XzUp9bC5Ip0t8ZaPdOE1tnQaxZtZGvo4+Lt51s+uiNB20RMhLVM+mQqIuiYGRJHB47KzNnYCqkB07xZsWywt8UGzE+XBtX5caSVsLth5qbD16B40Ogpi88II53NHSOhkn+q9o7++pHPzT+pI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GNZvULCm; arc=fail smtp.client-ip=40.107.103.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBmPBhBR67b8p0tZHYO4aYeCKuNFyXVehlgpGmZAHa6jGh6d4mTOGkw/KCPYmt4Tp/btwa2GbGkLTJ8+y/VTnkWxYRGIM7qogvCaeiLghHMQYnn2dTt63tH6fO5j+aQRPVTK2mZTlFzEYKYBVgtT4WLizxIqaukyH08cJ2Mr0UDLSAriZWkDE5NK6cLXWsh80qRAuonVEZ8fCJOi/eHDChWeiXOb7M0UW9FelW2WcaYZ2RRst4tLmiQApAvt8t2lajv967jKKpANihIBLEbnkhtMvgUwd9PJyOlaSNpMBT0yOkaqoG+5nrl/EMk+3mlLxja2v6TgICfogk82RfglcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYenWmawjJWEwkMEAcvWABiVtm9vLPiNtmr5bz1j3ck=;
 b=VaCJak5pQOZFcAA4RcXiu0FVjdqfsYKsP9kCnkO4F/nz+BtugNzV7g0dGDHk1GmVHWfRk3N61n4uCuKv1XLaE68MMiLUFBIHldSvAV+Za853t2XRzfLx1SwWFe2mNv5GIhVsFkgUebxe26aUaftmGt2YszXIPCgrlAveD6DJf1UnCNa3XCA+Q4qrhea8qUkcxnhQyhDff0OtgE5P414FWsyAv6TEsUTK6LDGWWiAQLpX5/lBJvhdmSj1jEV/0C/Vec+ekjDF2+wfyW+sqA1JUoKDXWMmowQLLyhhVMs8hEfdfHlGTZ8pxrwL2kTKHAkUmNp8snBiJXdtd9mYFKq4Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYenWmawjJWEwkMEAcvWABiVtm9vLPiNtmr5bz1j3ck=;
 b=GNZvULCmQcRYF4FV/zqN0CtsDLRMBFs/ApsCpn/k3IUsKkdx39t345Nnxddy1J6ChcqEL9w64o5JzA9HG8JQkvld58UvCTeQ06d2tOKhvU+ZzYvJ1MCIcuon1KqWeMnpVD+mY/QpLRootyUC1xupjbLj4D2dRACjnTp9jCOIr5yfFk/IZw7nZ0e7U9vQ6aD8yRqJUpzRAoUkxpqK64sAGgxsZ70IKtDlIxHSynw5YzV78GxoUBGuq97zmaM5l8g5D4+Qplw9UpklkLT9K2+CSmideORiwdhfI22e7+h4QdslvMZLj6UIwY1OFEuJ5g3oU0cQswajAFBKeL5U56knLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAWPR04MB9743.eurprd04.prod.outlook.com (2603:10a6:102:384::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Fri, 15 Nov
 2024 09:33:52 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 09:33:52 +0000
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
	jun.li@nxp.com,
	alexander.stein@ew.tq-group.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v10 2/3] arm64: dts: imx95: add usb3 related nodes
Date: Fri, 15 Nov 2024 17:33:11 +0800
Message-Id: <20241115093312.3407815-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241115093312.3407815-1-xu.yang_2@nxp.com>
References: <20241115093312.3407815-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0116.apcprd03.prod.outlook.com
 (2603:1096:4:91::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAWPR04MB9743:EE_
X-MS-Office365-Filtering-Correlation-Id: 6957ed30-ed5d-4b46-66fb-08dd05589e1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qi785WuZAJJoPl8S/NFfifbHA/gQFy/CSK73/wTAngYfCG0maoMx7VsMli0d?=
 =?us-ascii?Q?GYxiIXLGjguwh1gtc9PLINTOCIwkfdIeFM15pRN73hZYYCTZpbg0p/u8TpNP?=
 =?us-ascii?Q?nEGbv0R9R9X1MBAT3KmJzwMgkC2wxSxWJAmAKDoTsWAs3n/3Uhmlt6+o8aO2?=
 =?us-ascii?Q?FnHd2pS5nuMxiy5/7VM5JKeNB2didIC1ITEj1L3ju7qH89i69WJOvgs6CgQY?=
 =?us-ascii?Q?GtWw3+5RFIW6fqODEkS1/NgVO6cdn/Z+iIQmWvauhcWcriUCSQ+28wJ5ajbT?=
 =?us-ascii?Q?7uBjihWhvnNycWgHoxmqxTeveluqr7K/U58Cq0kwSi+k/LtpRliG4+G0W6k/?=
 =?us-ascii?Q?2UYv2OfDjvSvfdrcYONr1WPOGv04rdJKmCrZr9ynu2n7BeJ48D7LCIp9+Piv?=
 =?us-ascii?Q?3yEMU6NQK4nV3j2+VqRzHQhKfgSykkAUL+0phZG0j0c7UXLb5+VWn1ACo8WO?=
 =?us-ascii?Q?rIwzBvz2riG5sSmF+gydubej1o2aef760o5TLYUqh8wTL9nTTfKKyB31byZX?=
 =?us-ascii?Q?ngI8GBQVto+wLVwiR8viJgSgTODVXKSlueJLtym+EympJAIjRAMmDJzb5T+E?=
 =?us-ascii?Q?lLfg+nsVPFN1i2EVgKdSqT9OUnvSmaZrj8o4m6BrhFxCtqhcR++XawHBUQ99?=
 =?us-ascii?Q?uuUwTPTwzGMzV0VWczsGu3JRvRd2e3BJ8CnOwUjsPPGH1YHvdaFQl8o3cZTw?=
 =?us-ascii?Q?fKxVNsyVBuBFMQ7OsTDKFhnGzzMBmx6AkAQjLdYMbEOSx8o1gQ4vqRQSqs+q?=
 =?us-ascii?Q?/82BJhTAcRd433b1xl4IANq49g08M5LCaZYMq0PCE0t0yMbD01Ki1RkjDays?=
 =?us-ascii?Q?nniUKa/VmQO8c3XCrduDutc5EP/OVbVaLOMBLuoaxNsHDzsSOslHC+r2FblH?=
 =?us-ascii?Q?btCT/87glHr7Z615Ako//7eCP4LH9Gqd5pnaJByfS65Bz31ShhjRxRrRGPAr?=
 =?us-ascii?Q?BD+3qjY/VkFYB2y1F5SYmpsETrN6ASER7XAbSTP4JfU4SWbzxe45qgtBrPBe?=
 =?us-ascii?Q?0ppyQmDv+KqbCFsNQeM3WfeYIQnh8pdCjsyT77/xoTkJb15/HhyeccZrGeRW?=
 =?us-ascii?Q?zJOHnloQM+QKhNrhpwJzZ6FZbrgt+eXCxvEw2giDtdRu3qu9rG2+UAWEREia?=
 =?us-ascii?Q?GcULS4iMwbWJQUq9yzWuAqJQ3yHBYCx5E9KF+Eed8tnPr8tIGH4zIzvZzP+O?=
 =?us-ascii?Q?84ckqtZT0I0YfGnzENldwVH09WI0SJ5WiLu+SUetamg4do5Lp+GVXti6hxHY?=
 =?us-ascii?Q?sLSvjqhgUpIObl7SNwDW4U7PwbV5x5tWZENS3SRGK5PA/UdoBYbrSO/432EW?=
 =?us-ascii?Q?QYe1LsWVy6wBAaGpdQTiwdNm3+TFmDA6vDT67ILPZntyWa04X0MmQ0vDnATu?=
 =?us-ascii?Q?n55YhMiuGhE8jne2EhYozt8xTtUV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5p0TigxTbpqyk0avt220p2rjDsK3y+cT41Gp2n69k+0WCdHeKsuThH/GlODl?=
 =?us-ascii?Q?ngrKG7tj0nzn7U1iDNqbNXcSfy27bN7/bIjl5dLZS+s0J7izVPocK2kL1DdD?=
 =?us-ascii?Q?Nb2r2NMQMdlsDPt4z3wcR5xhftTOOLIt/7opru8xkLM/gyyxqoidx6D9RlvY?=
 =?us-ascii?Q?WXZcxR9bpv/5+ChWhOzdj+kdSgBNPs/AxpjGqdMPdjVz0T4gKo+kvDJ2t8w2?=
 =?us-ascii?Q?M20TDioZ0rXeQar4i+73xGKnRRWwpWk1HvIjXQroa+70cEOUoWk4lOOEoYS2?=
 =?us-ascii?Q?LrjCoyHyxlNgbdPahKMmzDprbqnf+xWTZ9sIi8KebMv4xsSF/ELNRHpj6YuZ?=
 =?us-ascii?Q?xIt3HdawzAI2ValxuWky/EwcSW8IB7XrCn1fvPsxU+BFtMoApIjtVYvFgsNI?=
 =?us-ascii?Q?OFGfcksmJqg+ht6ZleghQ+ypMrJOJKqKisRJ39Nunknq1/mldO5b8iipQOQs?=
 =?us-ascii?Q?UnVRsMGQw3w7JnSARnp7Xz36+NzIFnn/7qc/I2qxd0rAT8croAKUbZDo4vsi?=
 =?us-ascii?Q?EC3tqgHNVF2SDAzVv8+oFt4m3DCrf75mw6auhIr/SNRX8gzWK29cuXWss3eR?=
 =?us-ascii?Q?RSJbKs7B3qFpNk+e9VLGC6tm7dtJecO5suy+/z5k21uH0LC6Mclm8NsJz2Z+?=
 =?us-ascii?Q?3Xoo+P2YnMQer2RmoRYp/aa+rXBr4Rg/1Qer3xlRzju8KF9d7GLEX22woitR?=
 =?us-ascii?Q?Kq1anHQtTZggyOqkHz4uI4lbPec+mD8+Rf7WkOcnzBO8BW35Ulz8meoFnKAk?=
 =?us-ascii?Q?c7Lj5imry7KefJlS2cZyiL7i9jO5uZ9KUYzHqQGuI43ttzOp0vwsth6HCKkh?=
 =?us-ascii?Q?wlchimVp1inRlTpbBjTQwb0trJhnLHJrgKjwHoN2DBPIDaW5gKPH5Rw0t1XU?=
 =?us-ascii?Q?iDn+pqAqYaCQ+1kW0r0eUIT7Ddz8BMUSmw1iCi701q9ETz2SALiXirrKN9Rv?=
 =?us-ascii?Q?vtDsY2ONrV01W0/CO/2A+A5QPdjJnJUWECAq5GGolapBranOSuLF69j7kObS?=
 =?us-ascii?Q?ERbnsqhJhtz/kkJF166CZGyN5QbWT/eEFFUav2xyDE7Oh9ztFJ2s52esr49N?=
 =?us-ascii?Q?SY0VImRu9s+R9FA5YLhNh4EU1YUPK93ArMN6NVrmdPkYZu352GV6GEF9n1N1?=
 =?us-ascii?Q?dImv16oWjc9+WXBbF2I4iAkyLSuw5hg4OcjSkyk8hsP935zN2Kh6xQwIeCg7?=
 =?us-ascii?Q?t9t9wRLpQFq5mhRzGc1pxrT90waVO66y4HPck1Z+0SuBkW4/kysu53gziH7Z?=
 =?us-ascii?Q?PbHQWd1fPkKeSw0CuM9GLYDSrX4tIt6UPqTOtzkluXK0KeoI0Iar1IwYAY3/?=
 =?us-ascii?Q?mMDDj4PrmuJOqQEqJ5lTY7XROuR4NMupRRY1/YYjyfjtW4OzZYaNAx6xxg42?=
 =?us-ascii?Q?omhwJ44IQIQHmPv5HxopXTyz03KxQkNY5VSmfsvajvd1ij0pDAsNlzs3pl3R?=
 =?us-ascii?Q?9DCsZ72g9OE8RjyMPwU+bgPDpcuN9cFaiaR5fne8dGHr94T1uvpMpufamvV0?=
 =?us-ascii?Q?w8Vs0QE8heSDkyYHmiDYoo96R2QIy9Fy5CSon1rAnBcQzDFBWKMPDhqQIM+j?=
 =?us-ascii?Q?pdDGKb4OD3eFP3IMbbf9Tg6f9kgG5hmfHxtUVuJH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6957ed30-ed5d-4b46-66fb-08dd05589e1e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 09:33:52.7525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewVvjZErNIGutpTHxnSDDykFt5Ez/7zoy3BySDs/9cFpDskm+6MeZcHOSdRzWvf83NagBIbB7Yv6hMC5vdaZ6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9743

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
Changes in v10:
 - move orientation-switch to dts
 - rebase to latest
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 42 ++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index d10f62eacfe0..facdfa37073e 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1537,6 +1537,48 @@ smmu: iommu@490d0000 {
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
+			status = "disabled";
+		};
+
 		pcie0: pcie@4c300000 {
 			compatible = "fsl,imx95-pcie";
 			reg = <0 0x4c300000 0 0x10000>,
-- 
2.34.1


