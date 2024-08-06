Return-Path: <linux-usb+bounces-13126-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7085A9488CF
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 07:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F29681F23AD1
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 05:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F3E1BBBF2;
	Tue,  6 Aug 2024 05:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MC4pUYwy"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013024.outbound.protection.outlook.com [52.101.67.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276B115C124;
	Tue,  6 Aug 2024 05:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722920805; cv=fail; b=kRk+WMtl1Th+NwSUvi91SRPP2AL8A9Ixk3Yvo1pkeM2rvRyh+/mp6xVYL+n9t7NU3/8xMR/9dRFunq1V9BjmVKm4sx6KSyYjVrNRUzfZcbeWfTjsk3IQWnf9iz4l9rlgEB64dea8z8p7bXTxS3hhsjDjIg0CrRLDFnZpwGCpbSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722920805; c=relaxed/simple;
	bh=3C408oZwmmvIvLCDIIEW1GnZXcFkpruWjbTJAdU0Py8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wc70MCCAsWm5e68tjdm9B9afskEiaA2g974oeAvrsFp3Yh1w/NI3qenToM14HMrGT4gJj5xttU9QGKRNaQrcUeeCeNzJ/PQBEKdN1UVyLMdEBsfdEO6c8Go/os2ROW8N/OFmLDWL3ThrN9C/7Cp5kQ0TitNmLeM+UPqwt1y8ZV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MC4pUYwy; arc=fail smtp.client-ip=52.101.67.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ikDrmeVkUjoDYGDfYDfvPG9G0OeaoDOR2IW84wyfBzLyeBqxnOyXOy03vbu6myHIxwwlqIQmcb3T7fxnuJz5hR6I7xzCYvRcUbCsWNrcb4A2p/hdlX+rDQdS02T+GeifyuR1MUcUzV+YWMIyRTzh6jUNU5tCK6ZdkkXwr7iUUEtsqrJWXM6w+qmoKb+jwTYeCeyA2Awhby13dNK4BdVAvF//lL56k3/R612rQw2LyImWFakvsNk410KJFKKN1K45DZZHG1iOoD/0h4tVoO+nq/pcaJs3emWds9L6VCjp3UtjQ//pNpKf0haG+sKXCgO9rkfaLTqvqmYbvrtFTNZIHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVptErpdxS4Mb3skpVZRlUdQzigA3aGQXUlPPEx11ik=;
 b=B9dX8+VRLdwxRjN40PZ084ktTeJ72t5rsoHCWmYO9/fmyTjcOI5SjAEEsP0uEGjBoIgsaPxW2qSnWCePvZBiDDeymVZ175pxbylR68W2pMxPlo4pZRZy4jk8HS36zCBcnRByEtW4tRsuiAGGsa7UD9QTWSFUboiENohF4vUwL+S+1VRb4x4XRFZNYak3wFc6EJGvCEbkPKiKih0/zw3gcP8exf4bz6kiJXbWk9TIF3blac+2EoYeD1yIrMj7J7W43gc9vmX6qqwBk9HPrStvE0XTh6MvtZa9Do67GI6oKTaRGv5YE+DY7AVTbjwLJU1jDlsbxcgk5qacpHN0zNqsdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVptErpdxS4Mb3skpVZRlUdQzigA3aGQXUlPPEx11ik=;
 b=MC4pUYwy9UUTpN3IJhQXQyTxJb/qGVfeDcVjgvUbVznnzJbA5ckwr4CxisvX+SpJDYKPb7tmMn5y8hDJEvVYLvAsOZsjaadO7TdnX7/XFAWETSheXD3H8tqIYkYh5vIOVRf6mnJTJwVjXqhdUrez0yRmMQ3lgIsQ+Poy86wOAKzeidSLXvsKpgBb1EjP2leeWh35B7e/hksw8SNr+JB+9tpuG06RysWBgyTGtxeOxCcxRheoHh+xknI95BxigaAlO++YvcL+LSvKCa54ufK0P3FXdHHGAYwSePNJfFhnuyvK//x3zfRmY32MS8bOxlaA/EsNhOz51B3LKaFtyE//Hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10211.eurprd04.prod.outlook.com (2603:10a6:800:240::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 05:06:41 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 05:06:41 +0000
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
Subject: [PATCH v2 5/5] arm64: dts: imx95-19x19-evk: add typec nodes and enable usb3 node
Date: Tue,  6 Aug 2024 13:06:39 +0800
Message-Id: <20240806050639.1013152-5-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240806050639.1013152-1-xu.yang_2@nxp.com>
References: <20240806050639.1013152-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::33)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10211:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b07edfd-1ea4-4226-7ab4-08dcb5d58ede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EzEGVjEnh/VLp1R4vBWvUYotdyhfaDKzUgeUkOTn3ut+SrCwYMJ3zCEOb+9Y?=
 =?us-ascii?Q?yYLXOtkDO6mPX+JJzdkeJd5iSQdcK3wG5OKOyaYWp+k2JSQRWW+mRDpxLftO?=
 =?us-ascii?Q?sYKBw079mZ+DYj4qiJKPiKgkrnIZ7d8EdyDKsajxIVOBeq65jozWms2gCqW6?=
 =?us-ascii?Q?8r7ZAR1gpkeSyDv2K7jJ+kJDOUJhxwdHSKeREH0ia4mDXVQNU3SwIcEVFHTQ?=
 =?us-ascii?Q?iKrz+CSynZkkOgudSli7JpsSHQLPDOl4PR43cqwAbK9s5zADzdk4IfPaL9QB?=
 =?us-ascii?Q?oerY4aVTuPqXmENSNwNTG3Dg2EfTz9HNbIfy1evTBZVaUz2TCX8SyeyphYaI?=
 =?us-ascii?Q?VP67oMLUMsgFb0kVxd42pCvAFKgsr7F38Pa5yh20FVXY0b/Oo9Qk9hsBASL3?=
 =?us-ascii?Q?jWGKqmwHscWP6UMThlPa2FFwFW7jUlQJNLSN1RThNudIShBHfT2ZXipjY+dt?=
 =?us-ascii?Q?kV3yW8YWZQ1PZEkKWHALRSVd3QF7O9BAyA0VGhee53jgTbG4er25xtIstZpg?=
 =?us-ascii?Q?bN0pyhhLP0JSbMo0hgiXlG6v0NDmYtISleIwBJpXmGSHGmUYEd2FSLEY6QH6?=
 =?us-ascii?Q?jPiAbwzi7ShjUrm03uec04e54GedZGWQyBElzDruy+TkYMsrvGAKCI/lPsat?=
 =?us-ascii?Q?NTR/R/LCnwlexiZ6lNg9Oox4HCBGjsvcxtpsAN3eEsXdHWbDvbA6H9gTpa4/?=
 =?us-ascii?Q?t8gsvawggX0bUmY3L25nxmCklzdo1rwZiSsT3YhAvZ8dblJcqSY9iiWOcim6?=
 =?us-ascii?Q?f+LPgEBwIphKs/2jR5hKh9vzCFZ4JttaM/miSc9F6fmZ9WPBsUUYmqw3LZom?=
 =?us-ascii?Q?j6OEWaSzNVv3FD6ni2y32co60JQ5nknOT7s+yinKCvHO1w69KIhVyCd+iNH3?=
 =?us-ascii?Q?X1/rT6tI61Sl0LLg/tBZrTw/fp0FFcbK5CeX4iR0Fcvszszua2xO0ZIM5pKS?=
 =?us-ascii?Q?tl4CMeRT8PYW0t7D+AkH3p8cgg6ACQ2cQODHyWeR1bfyuYU2i49HGhtO2Hug?=
 =?us-ascii?Q?EhN1sZvA0Jj1ydgMvKiZBc4v2u2SBJxCUtAMEFhp63W1T2SvKnwCccEMhuWn?=
 =?us-ascii?Q?gW1YReUb/ztYsYpuQqKP632JchLwnKkVrKCZTjDM6TsxERizefdlDHjAaOc9?=
 =?us-ascii?Q?6szWyLfqf6SInA8jAu8vAy97MCycn1DGf5N+KML91utGp+pKdbhKyQm120Vc?=
 =?us-ascii?Q?KtsiL4eARtiHSsBH327lnf6xMXJhKSqAmjbsaHTT/jPwXad1CSQ5X7i+wLCJ?=
 =?us-ascii?Q?9rgcyObBRlVpr8SD4aGv6Q55ubC/wjtC77u9DSRemoGEC+pTYe6YbVw20i9V?=
 =?us-ascii?Q?pdDWLNN55cpdYyRN9R7Ywmq3H4Mf4TXgxC8MQWvcVYopmlaFDFIuOCXUzAf7?=
 =?us-ascii?Q?p/uc9oHqCwQN5weTPZ2wsruqRDxsQ7sj+eZNW+AuHvN/xMJRhDGpH24I5Rd8?=
 =?us-ascii?Q?mqCiK7D/bGI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y1kauGl5AnmjPq2WgZdtu0/qUcn+XKlywgJHVagCfMSdiPXVIkC5vJ3N3Stw?=
 =?us-ascii?Q?lF1g1pnI8AA1hjiWlEDEVA6i4o3wPhsxtMtzcjfCCdf/fAzT/lke08xrSRE3?=
 =?us-ascii?Q?Uqzl2dKEhn+OYGiVE4MkSu139wD5BvL8z2TIAplkzBJDRXEapse0KKXzXpdM?=
 =?us-ascii?Q?zvREcvf48HLQVki7J4A9EgLWOYAoEbD4cgVgj/DOhCr7f9P/3NI6NPQB4QhE?=
 =?us-ascii?Q?nrM/cvGd9eJlNk9Ov+dQgWVqTFvhQXfS5duLynX3+gYH/hAOfzs2AoiWHYCP?=
 =?us-ascii?Q?qDNDLilbRgOWim5FTbNTU48aPgZ9cRhqGMhqtMfntO7M6aUGYiM3VGKHlgCl?=
 =?us-ascii?Q?oTc/N2HfHQBG0wRrL00V2eauIsLzbLQ/d4vyghaTxAn2/3o33KOaacpRhAcL?=
 =?us-ascii?Q?b0ZQO+R48FvnMdxO+WrDnUxx3N8vxvfrdVhTgxDnF29ydWIZd6RrlVsjfJ3n?=
 =?us-ascii?Q?kAqRubyTglUF8htu7UtYd5bXAkBDrfjfFNCcYmbhCK6rUgBsN9uaeqTYYG/R?=
 =?us-ascii?Q?7j/Z8YuKLgc2NeIlArwjueG7mRUOmGXahKwNwnGp1yKtaUaNotCBE8eDHm1Z?=
 =?us-ascii?Q?BZWdDi5qsDL12X3s6M8A1QVNSr03L8pjVA7SmVe9owwxE7OGo9KtFEaQpfVA?=
 =?us-ascii?Q?MHABDeMnWcCIkKE8F1IRnydEwzknzP6wJQr4mLoazULSuzDBMI+YmVAKhGNF?=
 =?us-ascii?Q?9DFbIISgu10Y6+AcIQ9kC1uPZl7Hdo354R43Pdy/gN2uIIk9ax8vAZ5HRTha?=
 =?us-ascii?Q?8UhtT7mffa3VoJGJBVxU+FXFbLG8kbhcEfKkSAba7p+pnhZWlmsRe8sssKhG?=
 =?us-ascii?Q?wWTN6Ao1w8uqsFfll57HScLkV/e6hnaqA3qNWrdU0qLQB1vZNyngt0eBs6Fv?=
 =?us-ascii?Q?INwGyFVfjdn6y7B/uWVkeIlpsa4BGUBxOalWK/yswLJyxLEjw3WK0cIy38/y?=
 =?us-ascii?Q?cp2l+rFleN/X9XbVNUMLQ9mY4BmkXu6f/F2JiXeQK81bij8R9K3+aPXOGDiS?=
 =?us-ascii?Q?u79ryTxm2w0axp2LYsLx8CbTtfkJFXfNI8PXexVFq1WvqZH0KdLHaC4B2o5L?=
 =?us-ascii?Q?YB3r6yQGiGultPJhPAA80y5QAiqXP+/2iGqZaK4mDn8ry2dptLa0M6FGU5gx?=
 =?us-ascii?Q?k+ydV5jJfn5dP6fC2OIEWoEHg+Rs8nPom9VQqsDcynfIsBDNFpLlGnPTiQ7z?=
 =?us-ascii?Q?4QZsku7eEP1vg0Vqpu7Lyo+BD5kQokgifAvE7srGGqx0ZBjPgZ0sAErZyVBk?=
 =?us-ascii?Q?5LaafXH1yJatX2zgFOGmZFyYKYe74odyC3Dxxec4bJJ6D0PyQQuV8ZwGhbBg?=
 =?us-ascii?Q?XEatVvnwdaZAHVVROhi7IESr8h8b7wdKX9ODuTAp4OPwqnkTNipV7dLro7/k?=
 =?us-ascii?Q?qRdgkcDR31ABpUOlIrDdJHMSPWeVwW6aemYE6lVdY9O1NJfJcsRJfsNkeeKa?=
 =?us-ascii?Q?DKyOtWVw0gyv4FJ0tegcU+jGHbQvvLb/J4VHE8KvaxfL7295MB0rhO8tMAm5?=
 =?us-ascii?Q?1muCmMjyvbzgh2C9QIvU9S2snHEoka/sc0OSZPpzPh3yyloUrH7VK6SQ9a8P?=
 =?us-ascii?Q?Xu4kTHhESUMraACvwwMc85f+Xql7kE46QcyVysvw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b07edfd-1ea4-4226-7ab4-08dcb5d58ede
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 05:06:41.2012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhfU1o+vKgOAQy/ByvTsRUcabO3nEXG45V/EB8IC1oid0H/1D37bjqNFLXR2/M5eWkZ0c+J4g5zr5GP4lMiYzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10211

This board has one Type-C port which has USB3 capability. This will
add typec nodes and enable usb3 node.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
---
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index d14a54ab4fd4..46a9cd3d4403 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/usb/pd.h>
 #include "imx95.dtsi"
 
 / {
@@ -99,6 +100,48 @@ i2c7_pcal6524: i2c7-gpio@22 {
 		interrupt-parent = <&gpio5>;
 		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
+
+		typec_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <0>;
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
 
 &lpuart1 {
@@ -128,6 +171,38 @@ &pcie1 {
 	status = "okay";
 };
 
+&usb3 {
+	status = "okay";
+};
+
+&usb3_phy {
+	status = "okay";
+
+	port {
+		usb3_data_ss: endpoint {
+			remote-endpoint = <&typec_con_ss>;
+		};
+	};
+};
+
+&usb3_dwc3 {
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
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
 	pinctrl-0 = <&pinctrl_usdhc1>;
@@ -245,6 +320,12 @@ IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7		0x31e
 		>;
 	};
 
+	pinctrl_typec: typecgrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14			0x31e
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
 		fsl,pins = <
 			IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0		0x31e
-- 
2.34.1


