Return-Path: <linux-usb+bounces-22880-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21529A839CF
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 08:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 730D23A3646
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 06:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81AF2046AE;
	Thu, 10 Apr 2025 06:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ieUSo1HF"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2055.outbound.protection.outlook.com [40.107.20.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944312046A6;
	Thu, 10 Apr 2025 06:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267657; cv=fail; b=HAFuiWqrqE2UF0+kCvQqGcb4JVk8pTFpwv4Id+Mp/4Aq7z/CxQen9Yia+HRiKyw6tl/7eiduUBBONHoSyVIHDCD40jj7HFj/yIiSNIucm4a3czZyKXSiu8mBUdkGiIVXoxKxb2bEdwecHfd/ELHi7A+520lkPiAFOFM2WRQRpKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267657; c=relaxed/simple;
	bh=OMP+ZU4sHUCjN1dgEzEoVAeOfrf/yKyuSscJowuEFms=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A8ZBcRS/0moy9mMsvF2BcnlRboYUT++Q/38igpp45rFH+XM5s7IGrUD9EvDUb3Sh9ATMT0n7WbEdPLWt0jz8AS5nl6uUJUna46HAevECrtvT9z64wZVwZoVskYGDnzgM/vcWGntqhiUJ1fQsIVniI32pixDfMbVF9tE45lm4HJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ieUSo1HF; arc=fail smtp.client-ip=40.107.20.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xqub8HT5/bRrMzsNlEzTNQYREK//hx2CrDOgX0c+JIGZ5i4EDgcYcsJeSpSVUMEQAg/uIO3E9lobKtG1Kbm4ObaK92jWLusr8Dt/O8vIlkS0IdoOYQLU6C2OEXcthtvbIErqPaQUfGFgrLjPyjsnfUCQ5MPucC7uUhV3PyhwbSEZhdY/QsX6NvwFd/p7Ol/lT8qiibGeBWqi4Jasjsw2Q9oqq1+yNUfW0HfBWN7hppLnuJ/FDzbUOjFhdNELailmhHYiwW4mBn7Mf53yXsvTdzAhSjqaJApdcQcHLGr9VSVkEdAaW5tAUn56X2jIAAQHi/L1ve1FIBB22Gc0oihmHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpJIQ3BqDfYQ0sZj5qn/BrOvREiZCV2/7sbV9UgbOxE=;
 b=A9sPCBum2qQDG5YlgUWTlrXuZ3H0SR2tum4YVwLeh3USjzZmnYXXs3qgrVx5w2NqN/HHHPZ1QIh+INhRfZ2x4LZDMvpN/n7dAXLeCQKUH1fvm8LmIPMksJyafyH08QK8Pgr+r2fYHVQjM+oekrZJzHt9Ug8Rp0amL//p7yAShhG0GgzQaO7npOkukZrX/cNG3CBTrfJhzbhq6idXpKC2f6XWYXitv2y/oF1IVse5pVxzi+/fJNeF0nCbsieyu7GWZk+ElK4bKK3zWmp4HSAq0AYXdX0JBQ7Js17gf5QHPT5aTC36nco6oVQMaTfyvHkB0uB/g0tp069YmeBWrXNGfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpJIQ3BqDfYQ0sZj5qn/BrOvREiZCV2/7sbV9UgbOxE=;
 b=ieUSo1HFVpd+OL+PkJCStIKPnUPV6AB+cmmdRM5+djS4F56cNYY4c5TE+zZ3PqugJ5B/oiqhreLgTvTzIZIKx8EAf3w72MHoZyKnNdVFk6gjdJ6yFBLJUhDSZ2lJaQ93WnHnBv/Jqb+CilfRSHWwE2XidK3yPNJv0KRFRwTMNqM6jO/LRr7IvN87CY0ipxNo+EG9wWCg/aAuNCXcDxrIyBp8LSprxTLCM5GfaOFAbeu4vMS7Sre/26+aNyy4pv2ymaeADFaKUNB9rORqtO+BlKrbyLW3f618PLaMYhvo94hTeuEloqfkliPGORAODoBLbPf8/iFthaBbze0AU0vbNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB8134.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 06:47:33 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 06:47:33 +0000
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
Subject: [PATCH v6 2/3] arm64: dts: imx95-19x19-evk: enable USB2.0 node
Date: Thu, 10 Apr 2025 14:49:06 +0800
Message-Id: <20250410064907.3372772-2-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: e89e601b-aede-4620-052f-08dd77fb9249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9/651Rn07Wzf2scpdGAvVCFBXDlycHP04h9BMCOpIsci+YNB+0POnG+N4SZl?=
 =?us-ascii?Q?kfIk6yIVNqmE/Bo+ciOhKzzY9Knh5gpeqkFolNmTggV6/O/CcfZ9Joi9rkph?=
 =?us-ascii?Q?1NJBr5jkpxf8ElhgcsxGFFU61sB+H5206vgcNAZGOdQNl+ozlZqmaKsmjna5?=
 =?us-ascii?Q?A6rEUikpPYzsl5Mu+zsTwsU+F9WA5nBoToz5S4Cw3hJQp8ogJnK5pLg/MIWX?=
 =?us-ascii?Q?quW7oG10tOFRfW6PbEUYI8E1+K6bMOZntIkCTKeYqDxmryAhWENkQQMyxJvN?=
 =?us-ascii?Q?iXedvCnyY62w+LDdlYmJ6e2Pa/8UftnIQq7+o3LYt4nRbSdmx/dASEIi38L3?=
 =?us-ascii?Q?m43e+zsB+38a6AbhfG/nahy1Vt9VIAvM1wVA5IBl7UYBUtWh+0zZkpYDPyjv?=
 =?us-ascii?Q?tuj6XDZAiNBz9bNKc1Yvj0179BpXVpkYd2qn++qGQEdLDZ8/gbP2QJe3AZ5R?=
 =?us-ascii?Q?tJiJNHdGYQKhSvRoQcGYxzMFcfV3Orj+k3OXC8ZZgPMEgHkvHJY3Z3GDFrxN?=
 =?us-ascii?Q?i82B4ZmJR7qEoRUwkrHmxhgiTXyx+BLHItuPiq/t5zqvuefpqWO53zudfpos?=
 =?us-ascii?Q?jsBE/pmnUcEPOAuHoxO7AtTBjgZVnPZlDWgk3vmyZo0Fity/JOKpPAsXkfLK?=
 =?us-ascii?Q?cdKXDjxbHQwN/24uut8NncVgZX41oQm4gMyNV5TSKn1VRYCMYM1fIvi2yu99?=
 =?us-ascii?Q?pFrG5tdEV5JkNb12VIP1DTp/pp2Xh1+sZpH9BKynAnZ7OSjg2m+I3+hMDdx7?=
 =?us-ascii?Q?1KHbGKaHOGADuhGv6YnUhlzSg+W5AV9Vge4zr4/YP/PTLyK7UXcSxi9W/AC3?=
 =?us-ascii?Q?bXEs1r4of/Kq01nuA+P8adLnGPVJeb0apvv3p1eMGaFJbjC43XS8FWGff26x?=
 =?us-ascii?Q?FA/6Uys7xNfjyqmp9VJwZ9Iw54PYCMD7/FVY57jg37kL67W8ZRzrhvKZBB7V?=
 =?us-ascii?Q?xCAOMK1UFnm4AcijglapuRN+Pt7e9r5mBD0OkLHWlTR5INagUuG1Pez+bIYr?=
 =?us-ascii?Q?2L/1pAVRWyNVz3Hu61IndKjo0XNuk5uXYZqfMuSzppbNco+5xAqOdO/By5Xf?=
 =?us-ascii?Q?LR1Hv8e713Z8BXXNMnP4GqKsLCblbNNt9B8+QafUujzsglLlAnu3X2QPTsuX?=
 =?us-ascii?Q?LMIFXh64LKaymag2YCajSqNelfuKszo8qhbQ+8QsBCEHT/QZeMxNKgoaNB5T?=
 =?us-ascii?Q?g8YHABce4Ujqp+C5EUImBKkF7Db3pa4C2/kI+776KVfrfPkGKqzfC9bvGY/f?=
 =?us-ascii?Q?m/CCNnFKcLHb7jrpChacadGVCmRzBpnLi9DzfJzljtBmK0jAw1JsoQzshi0Z?=
 =?us-ascii?Q?Zyd1xZJyuadOpvImnFIQ9RqLyBdqG6uLwWuj8OQyezxZpqCqUf074SW7gB6/?=
 =?us-ascii?Q?g1J+lcTsmBZWcBFc9D5OWBZUnEmvJjqRfcrEa8P77YaZtaWwYepv+C90KPsy?=
 =?us-ascii?Q?/Fhh4BX8c7RQNuFvX7XCs1F1KntEf1/n?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BuIDXTbov3CaVkWjHq39ENlzB1M7+LLU1BNxY7y4R76RghQtF0sRL+mOCOHp?=
 =?us-ascii?Q?HhzEq4APzrcX05bbE/AYRW/5t0YgPVV4ztQQINfVZ8NfAkzF7eI78zsDrid5?=
 =?us-ascii?Q?QCxNPpdyUBD6ZvpJ4XVg8KIij4+m3P+3FDZdXP92HlI8R83xDmMSgzgCc6uy?=
 =?us-ascii?Q?+uhBzCDLSzsVYIe661VcFEnwHgtSelxZHLTO3FwwUJuYO/TwYqkYF64BH3If?=
 =?us-ascii?Q?OlmUfLrml/M5uVnRgJP84VpNxGzt/x/R0a8TuNMRvtlcNVFQPmKZ6dQ5UZ/6?=
 =?us-ascii?Q?CoN6pwsbs6GCX9nRF6izQ1vB2kbYuy05CpGwzXRcUB2zbKhzXuy8MCgKjNSf?=
 =?us-ascii?Q?iYzQeriQnyou/cv3oLqtMEg7HTREl0aHRR2bFx0doaLDdRfYJm/6U7+paEEx?=
 =?us-ascii?Q?78bCbqL+g0TgHjG6omjocLsIJhEBBcK84DsxHnRN415vEccLjZKClj0hdoiC?=
 =?us-ascii?Q?m5v2Ky5hpuliWogN6W/PlltzneL1pE0PpZdrPgK+mc5TrEIA0l8jha+tRcmr?=
 =?us-ascii?Q?/HWZ3mcb1TgE+pD5h0xCwGdmwBFyBo8RH66KsnUigUusykObMCDbMDgt6cHu?=
 =?us-ascii?Q?SMcwmCiy/YpHQEB/mJewUpx4qpU6B6LVwT1toHVNOxE/frKoZaslueRUWPDd?=
 =?us-ascii?Q?0YUVHU/g/pMtT+NQrMJcMmkktMuA1HYc6jx8ELTTq81+v+7U6CI0osZpD16V?=
 =?us-ascii?Q?WfZ2mw4QURXt0wci3l4Jw/6lwAGXDv8CyAoPQZbBAQ9dNjGZDTfW5Qv3fGPu?=
 =?us-ascii?Q?62J+C4SBZAyJGW3q2dFt9nAJRl0ewluM1Cwk8+5szeZJXiVuQZoA9tphyYsN?=
 =?us-ascii?Q?BVf7Nq+jozKKEZDQA0SUN/wHAEhDXfiGVVfAyOJadrfGuYlFacA6p7gA5dkI?=
 =?us-ascii?Q?x/2M5c9gIhtEFFJcdgNpTvYQyYax3waImbPxpoVAMC4+r2vsr/nhzXnukuVO?=
 =?us-ascii?Q?lrrMnqexecURyTdatByrR2Yze4XgYvKWB0iiO/DKpEfiFVEKpXLScmctoE4Y?=
 =?us-ascii?Q?axh7Kq7YGlz1y2w2QKb2BsHyk23al+fYY7QDQwZ24N3+fT63miqXITdAE+Om?=
 =?us-ascii?Q?X9p5lMIhzoJAPESMgoAhAdo8fGfIvmk4H6s8PGGX7fwc4c8VdxvPtMpGKFAS?=
 =?us-ascii?Q?uVa7Unj9Jf0P5BFaYYsGMvoRDiydBUDERVO/ABaBnhGRMAhTNGEP8PTLQy5e?=
 =?us-ascii?Q?DV5TEnujup1QcdN2f/BtK3DnFVB39w1wkbYzNhHBwmZDKg+5TJJTjQvM5GGP?=
 =?us-ascii?Q?wbgJbavEhQP1d8GJOlAV8ooJEn7djek9YqAlh9zfZCkVDWvtb6oM/JnugzAr?=
 =?us-ascii?Q?prDt2wxjRgXsBnA0TkKvXII713UD/qKWczgBon4nyRh+facIpQ/DMHer2vhC?=
 =?us-ascii?Q?PRD6bwJXF20ZAL55Fe8qDNVbdP4xiI5q8kP49Djo8/UEroWUmZPRrvjahZkb?=
 =?us-ascii?Q?XbeGxS3dNwrsBd3WhRSdb67QZL7u+uvS+vc0rlA2Tgqo3tKpMfa0KBOpSo+Q?=
 =?us-ascii?Q?UAEBMnPN1E+dy2+xVKbIo3K4pDiMbRfkPfAjIwM4Jg+3AauCvsw3g3wDtJYJ?=
 =?us-ascii?Q?do+0QTcn7ehXqZ/mS2bPr3PzZ08aA51QowR8YKU/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e89e601b-aede-4620-052f-08dd77fb9249
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 06:47:33.5556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMjq9Br0m+EDLGsNiXsenzhWWp/OOUDap5WiAQ/70ACO5oP3jl+QWSdA5NvMygPQYZ27fbln+BY4DXposxv/0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8134

On this board, USB2.0 is a host-only port, add vbus regulator node
and enable USB2.0 node.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v6:
 - no changes
Changes in v5:
 - no changes
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


