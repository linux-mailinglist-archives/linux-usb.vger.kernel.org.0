Return-Path: <linux-usb+bounces-21676-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E462BA5D82E
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 09:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AE7B7A91F2
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 08:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8D92343AE;
	Wed, 12 Mar 2025 08:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Bx5cTH9r"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013024.outbound.protection.outlook.com [52.101.67.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9EC2356A1;
	Wed, 12 Mar 2025 08:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741768074; cv=fail; b=Yin/tvOWC+esUhb/S7m0xnuD7pgn5QouWQ7SrV9bcgYWNVbziwSrzIQhhMi0/y+lW4s2pZ6kb7Ceu85TYoH6X4wL/YL15M411cAAbuUv+fOckKthjGdcnXZgVnef40/tXJAxbeZU65suJ84/D576vCrgCmG+jE0jidu2ahepcS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741768074; c=relaxed/simple;
	bh=L7OEJzLXqs6V0/2wuno02GlaZuuUtHGyUczlafwnFgQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gKs8gX3TAfdldgNg34pvUOBGtQFPTcGdan/Y7s3zHjNSXbTbgZkNkSGPoeIDzn95M1RB7795MKRIdxrYHRsbtv9H+s2dgxTGQy0ztf96nNbj11zhA6zSSvEPL7eR0bxNGWDkw6HaYA+7HONcfnN2eCRZ/qxeDCAs1mLcmGC534M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Bx5cTH9r; arc=fail smtp.client-ip=52.101.67.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CB+ZvqrPIvrbRFMtTW8iK3GXQ44ybRFWsGpyYSYmAgw+6tRR+K19yWd9U+R2+YFbVZmX4CNLvZVFaQJ+diRFH5MmhHJrKO386IDN4CK0Vya0L/E17fH8p2/2+FtpN6LVA82Ud/Mzo7z+UDzBi/JMqdTanNVNyHcmaP3D/1CCCYWMMZPVUTMF3iKTNscmZ4GVXarQq3T0MwKGf3zjVxNs9UalqWBoIfneMdKxVe5Qo0dqdH9QQ6ZATXriCNIbVJmjoDqyjlsU+2+RvYrkzBHCF3dqmFtR0nqav14+6nVKR7jbKQHtfVyimlPDhdJxHx5L9zkh3Y+P45y1D165pxPKJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cR0Hhdz8A2mz4D+pVO2CWNb68D9qy/V5vxiLjJcYemQ=;
 b=NunNQq9CEQAUgY1J0hKalPZkKMxKptk9uLQ5SJwU6kHUdWQ4RjRGtMotIpWDnsPUUqya2dRbGsdSHKvfqJs2f9IyZWkUrlX1+DZ8j03//nsxQT+r6qYsfZPcfM1tLzigmdhMlGzrOz92iXU7E4NOsa3yxCXWrKZt3LURgXgTLqPgqSie1t6bec2CjgED3ztNfXcl7/ZiBL5JGJJ7ci9q+1EYeVLR9TW4grIx1j7ZpqUqcdLkDUvohRrHbj68a0lU4P/stpHtzgu5Zdb8CEfRv1m8JSra8l1iWr1SPsr0cepKbETIc3+oN1KiZo/O93iYe/cmKxj3G7GNpktlq4GF9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cR0Hhdz8A2mz4D+pVO2CWNb68D9qy/V5vxiLjJcYemQ=;
 b=Bx5cTH9rcYukbVKPz/AoCF5IZEgrxioYa/OLab3M9N52pUcXIXJkE0nNT/MvzsgAstUUT7VBw+y/0DMq38JSLmZ3SUxez8ukN4iY4rbe7bawJ/csNKWjBJO/o5HsbW8XmT18TTXeqOtrQ3BkigPjGx6yW/I1zQEgp4fLMkW+tyaNyE3jM7f2Hta2avzEfBB1KM01Xv0Bj5fZCSkVxq2vdCWvLHx97elCBtj+A6I2UpJQGrfVNViQqw/EDywlXrP56e58GWhA0+KBCIu3W4c0piW5Fs4z/HijOGEJQgpfJ3GFnAwquVLDmXes7wVnVc4wSVvqMfh+kuNaW2op56+cWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10592.eurprd04.prod.outlook.com (2603:10a6:800:266::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 08:27:49 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 08:27:49 +0000
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
Subject: [PATCH v5 5/6] arm64: dts: imx95: add USB2.0 nodes
Date: Wed, 12 Mar 2025 16:26:59 +0800
Message-Id: <20250312082700.260260-6-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312082700.260260-1-xu.yang_2@nxp.com>
References: <20250312082700.260260-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10592:EE_
X-MS-Office365-Filtering-Correlation-Id: 63156430-ff78-480d-74e6-08dd613fc648
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rqE3dIJLq86eD6g5BwjcV3qCFMM0NFvQiB286J6F7RrpV0/Y9i0last6ASvr?=
 =?us-ascii?Q?IQ2/6Gy/OFscMq4Ve9MdAKT4zohoX3EqeFkBrBn/JVwk4LH9K9cQAf6Flg9T?=
 =?us-ascii?Q?HDf2H0eYAwUNUbRvhBB4Ei+2FoR3c8GB0MwqSTjZmH0sGup8xzoQrbpvgPIU?=
 =?us-ascii?Q?URfjYN9dCCeQQFP6xKh9Zc3ZpN1FSM1XL1iFhNvicyGBfGVSyARf1SpzLxhb?=
 =?us-ascii?Q?6lgJq76KLEOoYIMAck4mGI0l7OD25yNbUscrG4XtvB7vqJ3L5kvieQiQG4ca?=
 =?us-ascii?Q?VTKPzeZDfc6Z58B+88AprnKLV4oZsx4Je1EHYFh0sTUd6OFsDlsUpYcKp3V3?=
 =?us-ascii?Q?niTZvH31XAZuj/cNVsmh+I8gEohu4SlGPXm4xzWDVMoSaYUmSOdbee+vgunQ?=
 =?us-ascii?Q?p2ZXLFbW5AYHCsZ3XzIhxaKBq2EjujDVf1P70aKRbcI+LTCCcQWRuen+1WNa?=
 =?us-ascii?Q?LFD+h7LqS0RlkU2HX4hUNO2y968jKY8O+DLSADEl/OvH3dOhSGXAMxjpxq8y?=
 =?us-ascii?Q?1Oxn23eBy1aktmTak4UP5b0zROV8o7TJpj+7kNjc2Xhs4hlFOVTa/yHi1LHa?=
 =?us-ascii?Q?fIedsKcXL7FSxvKKPP0kaqlouCb6T5baHwsPr4RfE9g51HwtAZ/0VBdJQ2jp?=
 =?us-ascii?Q?Uwboiyd/u9H+V0DhT6dSErzDJ2UF7y9CUpDCT2DmJvJglXOsfoGQTG6RVz98?=
 =?us-ascii?Q?fyXYoI02IwVasvr6sMsg6ZFYOPTK4LlEJlUVPWVWh0tRoEI5aXfcoY++ac/9?=
 =?us-ascii?Q?Q3ilbK6Bre/zx1nFrZgDf3Ssl5A8ZTvtjrxz3irbOX1bTQjpvEKAL0KviO+p?=
 =?us-ascii?Q?biyHELUF7gaPVIiUaIdoMD5kPhojLYOn8rgKmiBupDd1YvF3wPXysJipSwAl?=
 =?us-ascii?Q?ZJ1VfYEpV8WiJGkT/weH9wI9LMhvG+xz4ssLIZDNlVpM4a7+FxeE1ltQZT++?=
 =?us-ascii?Q?lNqo+4LcjcGM5y3F80BzDgHz0LWMaTJWYUaCvppNp/FcMz+v9haqF2rPi0dO?=
 =?us-ascii?Q?gKFxj+6o3327MjDTEx8sIPTZNFMZoYAB76JKIYj10l6ZFHVPmfF4K9R+Bqtd?=
 =?us-ascii?Q?jWI4y8ELwj55WJc8WVXz1xwBRiqFyUZYvCsH2ppNpk62wyC+D2dKByGB6iwM?=
 =?us-ascii?Q?ZWKmRZEJh7ZWsKiJGLKoiWSPJ9z1oTWGZbZMVskeTFz6I0qo/cj/hlQgMQJy?=
 =?us-ascii?Q?N3NkKlfx3v4Jc0DNYn3hS0fHtpbX3I1n7UVfN7L+heWx0nZmfU68OnGLNnu6?=
 =?us-ascii?Q?2vJL1FJQmPj/HhJj8fdkn8H9C3DJWwFEowBbGYC+uWmUbkYBSTV/hQmwG+jI?=
 =?us-ascii?Q?42wticZCT0yJ295J82OrYSUpj8LocwV3ismJ2V3V36eCmsjAKp2HXC+I1DMb?=
 =?us-ascii?Q?Kv3FqNrYs2kZGbfNjqKtkadJjJbC0ot4L+VLmZVBwabs/CUxxU1iZF1b0tLu?=
 =?us-ascii?Q?RSfeCf9LAcS07frIj+tG4Kcvgwv7F2cY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PwF2IGffXkbnRcEJfCLKWxfKY4y6rh3Vrum48fqJYFMOquW3LMWVLWFaYzVr?=
 =?us-ascii?Q?etdK82kcq77b48UOFp5J5VCwuqE7vUVhPrgKcFqqUcEjm9MKZcICSOzAnLwE?=
 =?us-ascii?Q?u3pOoREX51Q/e7cuWUMwcpDhOC0GHQH9Pez4Tt3bl3MUxdEqV7Jz3X+YdKi1?=
 =?us-ascii?Q?tOTHs64bhKtJlS3zqpAckijAojOKqKLBEabsc3gpjCePLarOgxb95U9d9eDg?=
 =?us-ascii?Q?onlCgXSbUugpN6jQouUg45LcPqNyut5AwVjqb4hwz2SlCLkj0y0eyvcpkSHL?=
 =?us-ascii?Q?TyC2Lv4RMBcGgej1SVmPOJfYFTvxnRvdJAHuKsbN01LsjQ+FRZKeggFA8h7q?=
 =?us-ascii?Q?lhol2HKO0vNDBPG+f22mZsNXXd/Or3D7hAGP0orb8TMLdbFv2WD1oW6/S2KM?=
 =?us-ascii?Q?+HJwqchomOYgNGG4scHEtHNYy2p+CGndMygdCAyvcB814xTvmDB8mc35YknB?=
 =?us-ascii?Q?v4vvJuvn8QmASQ84VNFILvK8nofXjwmlkpkgUIcN2gW472tSwwxiYly+nzYQ?=
 =?us-ascii?Q?3BCktA5rvW1c0pNABp5y+Pu4fm8GnurzsXvUsxkKhuQYv51Odfks3xSMawmo?=
 =?us-ascii?Q?uEDkpunMMMXvDk/Hs1EZJgjwkf8INj06DXJZz/eLgX5UHdpD1hwV8SkPhtoG?=
 =?us-ascii?Q?W1CByX/6lXZUhisdxvCw1dr6MFamYZIOG0XS+xNU5BfOG+fjVqEC68Kr7Q0d?=
 =?us-ascii?Q?JXDLZBVGO+alctFntDsD8+c/YiAWFNblccPXIA13g3vKirTzOTEWGgnjGO+c?=
 =?us-ascii?Q?YC4m4VVvP96fPYNUZq6CPJe8vrA55vMtfWUl7e3JSSGLJNVgkjpwl/Yke/+Z?=
 =?us-ascii?Q?zkjv1LbsLjd4kzZEHL9Kq9PyAp5pdYLP6EeDNlAidwyrE3oFyeSQYonl8f1q?=
 =?us-ascii?Q?1uf6sGHdiBhwfWJ0HfRARvC79G+miBnmHOMQm8iYM0ZwSXEn8U6WvMuowFPh?=
 =?us-ascii?Q?X4uw7Helloe1IMx4wpIbJxX3qQ4fm08kh+AprhSMkSK0VzA3ITfeRgApi1CE?=
 =?us-ascii?Q?W99l2cN/LNpTxhA+VCqonPpbHeEQQKbTU/+yNAcainpxfiGwQqA7SzJeDlip?=
 =?us-ascii?Q?OQWLqQZa22cLRihh8sehYMDc6p1W0vS3cBvzg9Eg0SXDWGAmu6ddBgpAuIUM?=
 =?us-ascii?Q?XiypJv9+AXQooWnDY9cmk6yENy4FZ6MzfjqSAR+VTr9CBCt/Tq4VTQkMqtK0?=
 =?us-ascii?Q?XvAguzXWrSWQ+pUQTdv3hc6nxcI64wFMZNFyobp28QuliDKwZTll1KBnJPNJ?=
 =?us-ascii?Q?A7s8NqeIzHbh48XVJ8taDQfFvPjcrXAKmSwZ3EY5iLOLFK/+q4Un7NXnTGnJ?=
 =?us-ascii?Q?NsL1mVRp8mMYCQXft2L++mlmVKOf0prW/svRRXe0CYwDKAviX9BA+K5eQ2CE?=
 =?us-ascii?Q?dq/TDuKpktkRWN8WSRO00Idb1XLCyyOD6Hyd6tyW0ZhqRh4IYcp0Nq2QknQQ?=
 =?us-ascii?Q?JHMRh0WzbLSaMT83Cj2EPc9aN1mqHH+mH6a0B9//YTtv6/4Zvy1qmMVa1FRB?=
 =?us-ascii?Q?R5rJC9x8wvR/L2YUWdShslAAwAp8V6MOY/kX8eYIrfXgy/KFhFBelLXZfPBc?=
 =?us-ascii?Q?2X1J5ZkPls3rZ7Gzr6TEbCHb+1p1p+j3uQ6nMIDx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63156430-ff78-480d-74e6-08dd613fc648
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 08:27:49.7401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: el64dzlnwyV+hSxEum3y+bWORFgrA5nWtTXukM4hMVR2o7bQ2CfJaHqGDH8aebg8+FPy1VANe7J5U4Z6fvzElQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10592

Add USB2.0 controller and phy nodes.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa95xxSA
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v5:
 - no changes
Changes in v4:
 - add Tb tag
Changes in v3:
 - no changes
Changes in v2:
 - add Rb tag
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 3af13173de4b..48c2033971bf 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -463,6 +463,13 @@ its: msi-controller@48040000 {
 		};
 	};
 
+	usbphynop: usbphynop {
+		compatible = "usb-nop-xceiv";
+		clocks = <&scmi_clk IMX95_CLK_HSIO>;
+		clock-names = "main_clk";
+		#phy-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -1579,6 +1586,29 @@ usb3_phy: phy@4c1f0040 {
 			status = "disabled";
 		};
 
+		usb2: usb@4c200000 {
+			compatible = "fsl,imx95-usb", "fsl,imx7d-usb", "fsl,imx27-usb";
+			reg = <0x0 0x4c200000 0x0 0x200>;
+			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX95_CLK_HSIO>,
+				 <&scmi_clk IMX95_CLK_32K>;
+			clock-names = "usb_ctrl_root", "usb_wakeup";
+			iommus = <&smmu 0xf>;
+			phys = <&usbphynop>;
+			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
+			fsl,usbmisc = <&usbmisc 0>;
+			status = "disabled";
+		};
+
+		usbmisc: usbmisc@4c200200 {
+			compatible = "fsl,imx95-usbmisc", "fsl,imx7d-usbmisc",
+				     "fsl,imx6q-usbmisc";
+			reg = <0x0 0x4c200200 0x0 0x200>,
+			      <0x0 0x4c010014 0x0 0x04>;
+			#index-cells = <1>;
+		};
+
 		pcie0: pcie@4c300000 {
 			compatible = "fsl,imx95-pcie";
 			reg = <0 0x4c300000 0 0x10000>,
-- 
2.34.1


