Return-Path: <linux-usb+bounces-22881-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 937D1A839D1
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 08:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 731023A6BCC
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 06:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9F220468A;
	Thu, 10 Apr 2025 06:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="f0YlQfRE"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2054.outbound.protection.outlook.com [40.107.22.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75510202F99;
	Thu, 10 Apr 2025 06:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267662; cv=fail; b=A2g37NK15YDLVO50DFBUgBODNL2lKQ38+TQ48MVcomxnR6qsXvIoNfS2wUG+tzojRMtJS1j+bBcqSJOVR9045CbL3bdLcsV3S7Hxg5AdPcgm3S1TmyqDZZJLsWnJmI0MOP0Z4EvxREOppTHucWC/QLFD+vv4JRDRHhP5Pf9tDIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267662; c=relaxed/simple;
	bh=yAfkGTxkugGheIiTAzHQoAaNKV3DfqFESC+V0jNbS5M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=srBmMr16ykp0WvOfWDYBWhkwC0YQVhfUExIJAtJKjTB5N5fkTPrjr1b2Hs8BqdYmhfyh64zve+Cs9Vj+D0SzwmRItoIju040/ZsnjK3LWpcnvTVOP7SSAO3ipkzUVeU4VNhl3DqSUnEldOt77w6A6KF7IZ3PNH2iCLDijfW0DtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=f0YlQfRE; arc=fail smtp.client-ip=40.107.22.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJPVTzlBUItne0mvnGvPxhGqFDj47NVNUvWqDb1YLRmgo4+0HlRCQzuNKtnLA16i6Z/fhAeAuAYV6gzOKZb2NOZ5vevGKD1oebCCOKi5R0z1hX3pytxlV6FvweThg6Req52TzoWzzoyzajAMhP/AggctFX0POiCKeCh+d767Ayvpp+KdS7lzHW3TiNJca2X5UtbFqhbz1KCVFBpgfTOZO+fbxLTM8scQhT+Y+14dtxzIdq5smg3PWWOZUZ1XJeUKGC55N0ZIZpX6yVy6NtaTeLvwyNsHyRIbYULak8QhbdPt/PwYdyh1+JY5V1mFaZf2l1hJcALdSsZnhngPmdXp+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVSaZW2+gTUCLeVC8p2NpvsF10e25LEBqoopqmZzSqo=;
 b=iWfsR88/w7vjZpJynbcrTzlcPW1+tw2OjRPp2O9RQL8/cjXkeDIdILWTXJwuS+dDVNXNc2b5iB1gPbZjj30hWOnh0BoM/8JiOlq38KrLEktse0KxE+X3z0zy4yOl3EKSrWhi6oY6jOsYE1/8PgEsweK67O/xtrpVGAu5hM5HDW/VgQ7B8gNFuxW7rHzACRYaDMgDvwjf0/HMr/x2XiYtBOsO/bQnfH0bx60MC3bnwuGxVMMPK1GE0yyiHI4q5NFuZCbLSP1RQepGE+zRmYuiCVhghmguRHMSCKgq/DhvKYke0HW9NBEehWNwD53bYDGu1H/Zh1yoFW5oUvWvH55XsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVSaZW2+gTUCLeVC8p2NpvsF10e25LEBqoopqmZzSqo=;
 b=f0YlQfRE45YMtu4r3dmTZDdQZSPFRnOxIkKlZAUbM9jVSUI65rNE4Pu3lFvYEplyyMS2Ar2RtsIsWrnlIqBh04FgNWZ7PfFj9FLOTGl0MNthNnXYdshsgV7tcovX1KsJnNxnh1b5wJYVG3p7G/0w7i+ZhC/E4tiRkJRjE6Pj0/Pl/4h+tdtImN/ts3gfTSIulkSdgu/LCbGA5XR52IWJCTxSpAy3K+rR8BlAyv90WLCVjE7BpoxLNFcVPABfEjL9vtLTEILcAWLVqKlLgoWBF5HFqbtn3dz6rOO8x/votrmw/FQ9mihz/tL5BeT+gWPiM09hu9p7RBw34QblLoJXoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB8134.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 06:47:37 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 06:47:37 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v6 3/3] arm64: dts: imx95-15x15-evk: enable USB2.0 node
Date: Thu, 10 Apr 2025 14:49:07 +0800
Message-Id: <20250410064907.3372772-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410064907.3372772-1-xu.yang_2@nxp.com>
References: <20250410064907.3372772-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0035.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::13) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 026ac1a1-de6a-4f58-6f6f-08dd77fb94a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TvpfMN+S/E/0/xx317BKGkIJU/zblHOTTcBBaFdDKwXjv3pCNb7tkAjmK2dX?=
 =?us-ascii?Q?CY9+9YLP8B78JyEFlvhvD0ul1HKZsoAatzesa5WGaFsTp0bIWQQ4eeqKw36U?=
 =?us-ascii?Q?cvtMnmDwP39vg+SYnr2zX1ig3I/riIYuOQ7X5DuChRl70IEyCV6mxn/FRxMf?=
 =?us-ascii?Q?wRxQ3BB2tbxzst0IsGbiSql3q8s/ECPwqFbDyaswB22Gm2fQg4Q4O6vuxiep?=
 =?us-ascii?Q?CAnn3CRHdYhsfiDHBA7H+lMXE2Rnn9ScpFFMjJNPN+XVYWiPHptwUvK2t9k6?=
 =?us-ascii?Q?ONSvVPJGfNA9EA4sw2FgjsIWPJ/7HkNxSBfODpPnI1ns2ODAccNXTS3IAD2N?=
 =?us-ascii?Q?HceC0wlTS1e2HMZHcT7JL1E8erIUrspSPb4PYtaeMueiotZj2mRleuB//i7x?=
 =?us-ascii?Q?sHXLo10gwgfpw5N9Cj9nVuoe14xRItOho6DAz5D+xN0epbqBQsDLc6PUAsH3?=
 =?us-ascii?Q?egWoe8GI7LmR9C0QqO7E4qrHSmt2oYOClJGdxCFoSURsDcvCQe1ZFDY3uarE?=
 =?us-ascii?Q?YgideQnZZEUtpGgrGEW3geE060SCa6uY97PTHiFFw6f7oKY1R1wdBtQMkCqL?=
 =?us-ascii?Q?sE7cSKwbANs+2CfYjOvHRziEiNEazLpSwAmqb+A0rsFXczhrY5XktrWtNIcl?=
 =?us-ascii?Q?eYRB+qbopwkeq5XZ4tIveD8XyZABB9WdZ4sUVhNoeELvL9MspNfTsAcYU9J6?=
 =?us-ascii?Q?ik+G1Wkmv7HGPZYZ3s5M4t/CxCkj8qVQRyqjMqbef3MNGH7xRlEBmMVYF9hK?=
 =?us-ascii?Q?rmUimrvn/KhLu3Ei10Je94uAzEUDDvOyQ6w2glXvXTN4v9TzWqM41ttciDTt?=
 =?us-ascii?Q?0BcAzXYYX5ZGM+FlqbSfcpHzADuW5qLACPyEBypxLIKD3cbIdsRO6KH9mDKr?=
 =?us-ascii?Q?SlBvsKIH58z9f4YyeV47PkR0dngL+vXyrtMaTAbV5roKM98LTe/UbSIMjeEv?=
 =?us-ascii?Q?rPC6xZGmn9DSJcKZ4kaarI1/p56SiCYBSDB98eaD/F7UaM52LgQlVzwhWilQ?=
 =?us-ascii?Q?UvBcyA9l9ePpJNe7Qq6ufgvviKyz6NR0ZDpPuvOqL3KuWahB/uC1Yg1b/Lzs?=
 =?us-ascii?Q?JlfkVhLWoI2trVSgUiZ+e2rrCRHA+3DIZkQyWJc4mzfCIgCxXqqhyTdjBwUZ?=
 =?us-ascii?Q?zROUaEOAG+2PSj28zJgYbh/klzpFoedH7YAmS5tCKIUDJt3AjLikZtLJkwGV?=
 =?us-ascii?Q?IeEBhBXeRiuNF2Kav95zanpkYNw4WH4V6edG/Y85vZPlXFMQbQ59cJ2Bb/vi?=
 =?us-ascii?Q?+jR9Bkx7v+rzhwJUinTwiNZDaSRoKdK0cGkYn/8u0I3KoVvbiPRkKHagomkP?=
 =?us-ascii?Q?p2ocKzoBO8x3AhxJ9E/0BU/wGJdDOm1ZVXAK1LHxbUxlGcA3cS5jiSDdR8Qw?=
 =?us-ascii?Q?HxqiXg70/Pn6JSHDSBctSzd5ylm1u4al3lOuNEAc9Uuu4WdlbWb2E1RsE5Tf?=
 =?us-ascii?Q?dw1J0kXZm1zJYabpSOUoZrSXQZWKEBIp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xk5u01SCNPHlyvh3oPAI9swCHX2B5dDAMDAHfkQ3MArtMvjw3Ub13MWsk9/6?=
 =?us-ascii?Q?sBHlYKyvh8vdqg66jev+ANit8YxoIGnak0Y+BtBX6wZrDri7ETmfES+245v7?=
 =?us-ascii?Q?I/QaZO+EAD8dQ14apXPBjiU8rlZiOS9W4yesotEwwjV2i/eVTSs4ZW82Vufd?=
 =?us-ascii?Q?TJBWChveBXZTl8OmC8WCu4AK2GJcI1siJruEp4lpwXkhKg/v50qQVDyGRkEs?=
 =?us-ascii?Q?Ex5rPgN+SDI2ViSfxx2fV0vpXgU0z4YzV03fpwz6nN8ge+vHH2eLrhG/HAzS?=
 =?us-ascii?Q?NAzN23G9IfUJb9CzSgdoE0gLmwYM9ZXlwglIDCvEbVsTYLOH/jwlKKiUpctS?=
 =?us-ascii?Q?y0b3JGRgm9yq7vCm/Gwrb3JUN+R9Se71ob58UDuWG71VgpHnZvS1pH+H2mRf?=
 =?us-ascii?Q?DTy2UEe5ngIusP4CpWyqEUSGkZRQDV4uMF+sATUzcX31ukOUyJfurkws3rHj?=
 =?us-ascii?Q?Kypoc16G4WhQKioWA8WLkvKBmNViPvIrY05eEaIIzk3e+/I7L+9J2YueMBMa?=
 =?us-ascii?Q?dk6KR/g18sPhirMb6yxHhC4TWNiLeeAH3R+rCNwKyl+M9uF4OBAxrS07LjgI?=
 =?us-ascii?Q?KoGN3uc10mmZ3GIBaXI+5FJAIdm4hnzsFqE12z3m/iwEmQw8UB87cfkEHIbv?=
 =?us-ascii?Q?ufVzM56f2hOdGHSJL1ahH5PiPr4JmZy3j9P5ywoNuqZQXDYq2FdbN+vzgvPH?=
 =?us-ascii?Q?SSv53fYpUDc+OcLXHAZO9OegEZUQAwJpJlklvYPDtwzgCXzZzQNlnNPReWyu?=
 =?us-ascii?Q?uAcBEGQh+ZdyZTGYysyN1uwlBlkj1jTZw8fi4S0kER185cF190cAFL35Mr2H?=
 =?us-ascii?Q?YOL7KTqePTFJDrUbuysOvksHZJrPOEBCDSBYkhvOlAaG8LpC0cOrDEGCDopk?=
 =?us-ascii?Q?+F29WbKgUBO8bE8nOljXokAorayAOIicOTxkI0Kb4U4qRi5g8dTptXu13DB4?=
 =?us-ascii?Q?yt9KbINT94dMInBCZWDvriSdWIiWTx8N41aSxwupxxYn0xTFqB129T+CQVQq?=
 =?us-ascii?Q?h5uSLA5Eva5zHcTQNhntdHk43DvMjN6x5BDxwUC56vvNqvzSNyTFXSA614Ti?=
 =?us-ascii?Q?HAdFHMvB13WkGhaPS7jlKd5FDMMDUtzdQ64jR3NHdDAJfQAY3UrkHAgjGsx3?=
 =?us-ascii?Q?wxXGSF4vOS5Vt0IxAKCuZnlLNbPliDnmYYNLWyTW2mGm453KxufZeXShsgYn?=
 =?us-ascii?Q?KGvu/Jph3NlkubyuMuapronXrigphokRw3A1WAmCWZ+J2aYQ6Y8jbs22062a?=
 =?us-ascii?Q?iDayDCkSKYwFoC+ZWXnNMIKJR5xMxChI5sgkoIQgwQxzB6cay55EHfeTue6P?=
 =?us-ascii?Q?FKo76lMr/7ZDOuJCWosu75FxNhxqPIhyMsBYtRdYTubjl5FzbL6I78YsBlWJ?=
 =?us-ascii?Q?1W7lf0p5waUmSzh263NeWSadPQCs6Ghxf7336AznOMc9/SvCiWGNcnjMB1hb?=
 =?us-ascii?Q?6fFPXLIjnDD36iQymw3pI85JBRNDjeF6useX0AMIyX7tFgrlcq50Zc/dxHav?=
 =?us-ascii?Q?RYvtv/5g0PO0BVdBiWiZSFKNbrhHhHzL4j/5AEs/D4vBUi2kHm2ChSf3txlQ?=
 =?us-ascii?Q?befPae0JGqg6y+C8t+M5vR9BssF3DYZ+pUu13aQQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 026ac1a1-de6a-4f58-6f6f-08dd77fb94a7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 06:47:37.4370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ay7e/MokGvu6MLuWEP3FfQe1HZFDv3ju3ZfOlr/4PAE2TfvN1goncayQEJbv7AAAOa74BNIrjfqFLUivCaLwBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8134

On this board, USB2.0 is a host-only port, add vbus regulator node
and enable USB2.0 node.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v6:
 - new patch
---
 .../arm64/boot/dts/freescale/imx95-15x15-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index 514f2429dcbc..aa0b9a4c3688 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -136,6 +136,15 @@ reg_usdhc3_vmmc: regulator-usdhc3 {
 		startup-delay-us = <20000>;
 	};
 
+	reg_usb_vbus: regulator-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pcal6524 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_vcc_12v: regulator-vcc-12v {
 		compatible = "regulator-fixed";
 		regulator-max-microvolt = <12000000>;
@@ -1023,6 +1032,13 @@ &tpm6 {
 	status = "okay";
 };
 
+&usb2 {
+	dr_mode = "host";
+	vbus-supply = <&reg_usb_vbus>;
+	disable-over-current;
+	status = "okay";
+};
+
 &usb3 {
 	status = "okay";
 };
-- 
2.34.1


