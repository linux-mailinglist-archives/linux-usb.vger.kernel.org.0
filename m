Return-Path: <linux-usb+bounces-12877-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A5C945AB3
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 11:17:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B6F6B210C2
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 09:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB401DAC72;
	Fri,  2 Aug 2024 09:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Zzb6saJs"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011008.outbound.protection.outlook.com [52.101.65.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FAB1DAC6B;
	Fri,  2 Aug 2024 09:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722590206; cv=fail; b=ca/BpdIsd4l5gjOngxajMGy86dBkLaYg58Bl31AGFJedJrlS1EHqrr02j1yprTfszq1/lG8WVxb22u8iC0fnE38aGuO3wxsIguLgcgN6KmHKya/7c80ClDTsH/qIF7y5e48k3oC5v/Qx+ZlqlNkVMGdErsa7cBF4dhOK/pGkWGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722590206; c=relaxed/simple;
	bh=VoBXZF9lzqRd74Z8BV92uLxoWDZm5g/dKwzJybb9OD8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=D3muKBlQ2jW+3chqxwwOk5ttgrrM6njCbKMR0PQESTW0cwYJLAVMHtGp/AQdAuRGeu0ZcfBRbnHvk5vtWZP4xXIx2+q3NrsHR59WLHunv3vZHOdKT7zxaSVO98XfUCxeZ/x3ClBgF9iO2qvWdVm6d/RUnb4G48IzHO/dT2oRaAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Zzb6saJs; arc=fail smtp.client-ip=52.101.65.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNM0Tv40J/zcapLevBjqtMZmiXJ1I1TqlgMZfiqrk1JBki7WSzIxUsDlDxg8y9hx3jy520CgkxMy8/OMqnityzZqgujRhaV/rQPtNxs9GQYRLOR80NrvswWHP1M+eg3X3MDCBNYpTSCVLXX6XLwKBIlbpFErGH0CKhpUyjDvxOyCxXg+dco4XU+qpuCgIFJl01m8I/YlezLIJNuGqYpranneImjvgz4EzzoMW2noLc4RNrGhoYhNdcrx3H3DXUXz0Pf9/vDYGSqldDGlrvtdbFMKckDlwvQHs0Ada4VGKQxkfUA0UfytSNAxtMr40kX/kAwv41Gf9wPItCaYixggwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0o16bU5LObzjN7Bwc/SMLxwPLL0vZ3sEalmiZjdGxs=;
 b=lyjBiUmRBad9beWM+xiHK2P7CRanANWDd+jyVVCM87RNaAhprMpMj9oi5X2P2MASkeyftnkoxt1wbTgN1QKpIiRPDYEwvYGuXnBpQ9m8Bs3pdN/gaHRSorRFzJrp/wwade6+g1OVaejFdB4mx7uYphnpKfuLmYDbc0pjgu5NfjX5f6kyF3JmpmxHBDUDvyCZVAotsr7zoTxP+li4dS56mZ1FOJyqyOdYrdSzKGy/uNUIYdRASB0bVPgLrO0zWd6U6i43NekrB1RUjPIwIqtvApcpePSfQqwVo59C3MpYeMrXdwJmaKm+mz+osrvw0n7EaZJmYcxEFM9BSZHV6xx+YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0o16bU5LObzjN7Bwc/SMLxwPLL0vZ3sEalmiZjdGxs=;
 b=Zzb6saJsXSuW2V2t545UlFWwb/zQFkfYmhzFULvAHCWns+/dxo6eM8NCesX1qPJstodNC1tTP2LA2v+ZJoe3s/7oqZtd6MS4eRZli2lt4eP5Iup5P8PS2YweNvJ7hyrb242OEJN7xD63dzINZcqd6C4uIYhsWlAQMeb7iN92CC9cx8o8jYqMrmuVooZZR0NbNtDqJJm6I8pr3TxNYE6gsngh1thuPM09eAewb7ZmR1dAKNtKPSKrvJP7g65R30YS3NdRXifDz4YL5UotiVea00MngISerXbrrsAOrj+ISBSQ8B6rAsdFz3+WegtjgmLpi6WQStwGqztHORa6VpwTkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA1PR04MB10577.eurprd04.prod.outlook.com (2603:10a6:102:493::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Fri, 2 Aug
 2024 09:16:40 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Fri, 2 Aug 2024
 09:16:40 +0000
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
Subject: [PATCH 1/5] dt-bindings: phy: imx8mq-usb: add compatible "fsl,imx95-usb-phy"
Date: Fri,  2 Aug 2024 17:16:58 +0800
Message-Id: <20240802091702.2057294-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: 0b626e20-6ac8-48b0-e075-08dcb2d3d174
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DExXrY5hzhSKP1e5tDQqj4agaBaNIttNggsGu83SFO+St8kSu/ECvebDvmxM?=
 =?us-ascii?Q?g5J/86ixOfk8bRquyFRbstlNejTRTLzduiaD0VttnjOGT+ZUT81Vm8IrqXyr?=
 =?us-ascii?Q?p578+TY1pR8TJRXlAMa2CdX7/jQLPDKx5hftHw3Gsi2C0jY6RI3s/0538PiZ?=
 =?us-ascii?Q?e/UsIe2gkPKgDmOqKq53Wi+srcs6OwaIEPILPjtkz0dQjhBBifj4fEeYPi57?=
 =?us-ascii?Q?oVQiVQyCj2lOIMqS4qdyE+DkJWWLxj7MpinVA6s3FYOGSnT/g+n4v4Y1E0lv?=
 =?us-ascii?Q?I7v6Liu4ojN7oujXI579O3d1XdGrwThxvL1yzecc8EgEyl8BWsIGWa9op+Tq?=
 =?us-ascii?Q?O8jaALrdp0zixzUo+tzmMuAP4vtVtHJ86WensSKIU7ysZKLQbwbkIjkPyPpO?=
 =?us-ascii?Q?555nW7dsE8qLDmcdoOdwALperLx9Cwz1xD6VOLz9CyHKaYJDn0I4QcDgrugC?=
 =?us-ascii?Q?2+rupHnmE/ycn/a8fk0u1gSr7YpI2ANrb3p/kzU9caXv0baJU8Cq3s5ExkVA?=
 =?us-ascii?Q?cY8/TmqRwHcaYBAAMZqf8aKgtxy2UVwb2aroM62L/TdfCp8JGl1tSTGAghF3?=
 =?us-ascii?Q?CO/6drWcGI6MtnbdZhYeKGQ3k21eaj9sZXWvFCnJDQHsrebzHTHNqV5Ox2/v?=
 =?us-ascii?Q?wgiK6sTv7PGQxEsmYm+oTLT0ChzfkQExsYQiUq4hMWbiGAq8odCga2CovQMw?=
 =?us-ascii?Q?2vnNBmou6SZ7ATU8vt1dOO5wk7sfQUZH5RU/AROiJqMKa1vKO3fMDD/Ct3EZ?=
 =?us-ascii?Q?0RZ+9elC2pexejB7bIkpcve0gq8TJ+2Ubo5NkokdZvpLhNXOvqIAzl3W8QDX?=
 =?us-ascii?Q?b3/RKGQ5/dhVl2/bUvoJc8LgGGdWyAOFEzTmXRFefj/H/HkYpV3q4dsLSjHy?=
 =?us-ascii?Q?Z1KwGJNzp10+oHeFsWRJ8aVTuiKO1waaOek1Oa7PIUotRyJjUwVvVJFzrr0P?=
 =?us-ascii?Q?9VPcZrRWbxo7ZTL5sCUS9gjtDSKSDJ2IR26n4+l1N7mhECfeVfdHnAck0epK?=
 =?us-ascii?Q?XUdQ5vCBZDvlaEZ1Vzrd7HZfcNRQB8pCezjoVvRrVXzZ6v56hAy1sHYK2Mdq?=
 =?us-ascii?Q?uhv2DAqHZHM3hdnStIYCuCzyKsxLf2EjtOfxD+8O9f7uDpwHJozpAN8if2Gn?=
 =?us-ascii?Q?gp/t9NAaUnBahqJeTuuGu4f64XOw8zMu3riftIWv1En/8IHSi+Vhs2YkDS22?=
 =?us-ascii?Q?8+wBQQlVsX7A32JlYfE+4WsuGK+dT3JywACZvDxW2jE4w2nhz/MYNFNaZkna?=
 =?us-ascii?Q?v2XxP0IfKeaOIN8MjlIB/UT04kVa/fCF7hpsB41+uMYzQlhpwEeQrqcCE3uG?=
 =?us-ascii?Q?DP7A7ecDLQRvInXGsooUUHaVxLeq4VGKvKkykYw11WOZwiwsOLHtAoHRwQKW?=
 =?us-ascii?Q?l3quVyWISIkHxc/bdNVHWkpUysxTICM7SE+x5flndz7x0NFaZep5v5mlcUwj?=
 =?us-ascii?Q?u6pXB/55+sk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dY5kDL7RGnta+UfSEjgixShLVxN3o5tBFLZnW4gycYeFjqkfF0gmD4fX4zrL?=
 =?us-ascii?Q?QWe7yxpPZmkrZzhE9yHbz7krkeb2UvVmLNkOHBsd5ZM096gp5zQ44KebbG2Y?=
 =?us-ascii?Q?Rnnitt5AmSj/BasYPEAvTZPovz+akfQST9UN/2GavmZV/Gvz6ybcJBz+vENd?=
 =?us-ascii?Q?Xe0OWv7gFEb3k+GWt2ED2ZAgYo09FjOodmLgEPO7UdnR5TZ/rY45cZBVKD5t?=
 =?us-ascii?Q?Gum/XegcqMbtpcf3HVRB72Ny8Du3/4P0o9ZlD2BoQvjcNXw6gIkRvu4Sfb7f?=
 =?us-ascii?Q?kh9E1DAif3mSQvCZ50390rtFFn/4MYaZoHKk2U30tKavLIteUafRCCX4uopJ?=
 =?us-ascii?Q?TtMK9J5nVL37Q17awKFuYXZea4oOJBfxbdz1uvRQ3ZjoQkMEeXxyBF6NkuWJ?=
 =?us-ascii?Q?f1GVCdE5vmsDhbikaGvYAwfuOfNApjW9o2hPsvocdztrd5pV8M1X7PBZdUsj?=
 =?us-ascii?Q?6poN9GX7qXVCKPfLlDG5Evz5ByIxwqVefLGZQfY/6GFdAdKKd5b0MB52SG/q?=
 =?us-ascii?Q?R4KhS+1O91CjvAnl1Ft5tFHZkz0aJM4FZ4oiGrzsxgUnXhLY81ioEZUhFlLF?=
 =?us-ascii?Q?Nu3yrRbpzVs/GsM9UihWakScAXpb06r3pOAsOuPpwqOkBS+IOcxUo+8q/A+H?=
 =?us-ascii?Q?+5iR97sxTEoeWodpQLHfPoVozE1fTIoKtExrS36XOXqpynckxICfWumK1/fo?=
 =?us-ascii?Q?v44w7AbJorCXuJ1yRRkgh6MFIK2Saai7FeXgYxo7B8zup/1x5O2vpWpB5YjS?=
 =?us-ascii?Q?/8bZPKQ3zjbmGuUvZjAfck+XHRs6zsDj7mJH67z72gxpDBCx0x5o3EBqUn7L?=
 =?us-ascii?Q?d9dGe/5lQF+3dlti3j7aQh2AfXhfDz67J91YRlMN6PxeELxOC5WbVM4EZ6wZ?=
 =?us-ascii?Q?N6LzNAHHkYfQBFNW7gRp5HtlwNdLQX2KVZA31zLFelFXDKVr/DgDKmOhY8n1?=
 =?us-ascii?Q?euTdck/YQgWciBfKoK4M11M9Kl/XxTflKSUTGY7cjsNJCSaymdNmHOeORGzS?=
 =?us-ascii?Q?gk9oqltwx15mMcccCO95jaFQ+2EcDFd5vnL5KLYMwUs20z9eHVH2q7dTwpLe?=
 =?us-ascii?Q?ALS3lMlmdPoQSmdDvyph+TD1boSvXBa2bSkhI03RE+1ZqYP3rG1h/NQG3oMO?=
 =?us-ascii?Q?rN+gldIXwEkDhMRTztcCqg/JdD1yxi16g1lhhnfB3BL2QZHiDGARei2uaXUk?=
 =?us-ascii?Q?gAx6GQqbTrUUMwH2Nd03PWoDGwbpVVgHY16mUnLy0A3M+6cGr5rVdg1yNZlA?=
 =?us-ascii?Q?d9mGY4fwY2BXK3z0k1QBOg6vwjzoDn2K0RkBylzlZQO+16DPH8RS0iZXrvGK?=
 =?us-ascii?Q?rx6mwH4DEB4l8dESChz6SNCDQdYpXJ8KrJQPde8d3yXi9NYOmuLpvuaeIsso?=
 =?us-ascii?Q?tDgH8BK8d/ML57aYutlYpXflQ4jyQxJshnFeDv56epvd9GunQ/xilRM5axw/?=
 =?us-ascii?Q?NKtObRqLmeTdWUIlWr8cviq4Rt7goeCaWakaiNkv434ToAY00TKELZZS5kqt?=
 =?us-ascii?Q?D5mpMEHetowQqsfK5yNPXAZhjozmzcXlRVjJ0DMwdkQMheu3cL7GyGLASCme?=
 =?us-ascii?Q?pU4ziLHJw9zcbVjbEr1GQ+36qJtYhbm4V4PuE10J?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b626e20-6ac8-48b0-e075-08dcb2d3d174
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 09:16:40.4925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWNicSum6sp0nhD3A4lMLRfyoA9MkghuCzjk/+8QlBam0go9jKV0yw3ZLdRIXUhoaHv8J/AON2jc8g8tf73iXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10577

The usb phy in i.MX95 is compatible with i.MX8MP's, this will add a
compatible "fsl,imx95-usb-phy" for i.MX95. Also change reg maxItems
to 2 since i.MX95 needs another regmap to control Type-C Assist (TCA)
block. Since i.MX95 usb phy is able to switch SS lanes, this will also
add orientation-switch and port property to the file.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 .../bindings/phy/fsl,imx8mq-usb-phy.yaml      | 40 +++++++++++++++++--
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
index dc3a3f709fea..b0a614a9556d 100644
--- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
@@ -11,12 +11,17 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - fsl,imx8mq-usb-phy
-      - fsl,imx8mp-usb-phy
+    oneOf:
+      - enum:
+          - fsl,imx8mq-usb-phy
+          - fsl,imx8mp-usb-phy
+      - items:
+          - const: fsl,imx95-usb-phy
+          - const: fsl,imx8mp-usb-phy
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   "#phy-cells":
     const: 0
@@ -28,6 +33,17 @@ properties:
     items:
       - const: phy
 
+  orientation-switch:
+    description:
+      Flag the PHY as possible handler of USB Type-C orientation switching
+    type: boolean
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node to link the PHY to a TypeC controller for the purpose of
+      handling orientation switching.
+
   power-domains:
     maxItems: 1
 
@@ -89,6 +105,22 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx95-usb-phy
+    then:
+      properties:
+        reg:
+          minItems: 2
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.34.1


