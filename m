Return-Path: <linux-usb+bounces-14930-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CF8974A43
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 08:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5F521C2178B
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 06:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B4A76048;
	Wed, 11 Sep 2024 06:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fSl5YhDY"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A1E29CEB;
	Wed, 11 Sep 2024 06:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726035397; cv=fail; b=bt1pBaU2pNUaP+g+w+eFTf+FiAEUoc9g5rLL3Nves7EyEQ9Lq+4GnrNinqIFj5ISSe3WoLQ0XoEsvVNGVduOFJ2K2SfMzqPD+T6vRLsi1p0gVeg2MRP9mlzJING95Nh6l0qc19gaJlNk850GuIxVnoGT2khTSRq9Nzsm3pt0JQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726035397; c=relaxed/simple;
	bh=ow+7twRnTRzjUFuIptIt+p2ySRaTVmLwh3cR9HZRx+c=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Lul+ZYUiGIVikG6dYq3qhnzAbcmkZtpt4YaJPNtt2U5DhzxSmratyhom7Fropu2DPaCVGHfU9QRVllbctIxJ9fG2wWvMx3ZfTv60hQElmtGCDPAEYjJ2DlGXm9Xk3kCEiCKOo7EMEvuE2dYpZ4YC89sdKItTBxYRjYfsTRgDRqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fSl5YhDY; arc=fail smtp.client-ip=40.107.21.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWIdrFBvrl2qsjmB/VS7pflUldKetK0iC/zjGEzXSGSTVnaoOeN3RE7JP/ZUusVoW/1yyuMTl7pkNROmRVceeBoUdOjmxdGzBfoKSdlg0/8w0m01G9tIGKf08+QQqEj/1bTjjR93xDRsB55mgZ36ImTpx/YCO46ZwgijSlYZlolTsv7RpcHhMRHbcdqN7+djcBrERZTmfMXO7JPrLAfcZwzjAkbxl1dOUFAI0ue9yGqANaufqSnrtYmR730qnOp8H1yFo8OF0G344/T+/Elb7h+I76lof2kv7Au4RklGTFzvIZtZCSaJNn+h2EkRfT0TIdwwwthf6peUm34g9usKew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpcVFgHj03WkMRz6nyGfenu6MUZcmtloixbrvlP5QrY=;
 b=b/nC9lqEnpZsn7lo9FIl1Npec+6F2+ZesDOXiD/YdEre0AMH0TH4GQyAO8G8vcQ62o37vDn1XyMTDLsoQP8rokpgti/GdxfgxFLIOzWmHS9NrQpcfFN0C8xiYpPkELiiP8po/Uiuy4k0gReQtE4HUhW1xCi5cYEcv6gLnT2Kh6Oarg8b2bCu0cBUSzN88euwxdWZKkkYqy5iHKnBJTz3K441IYryS2BsWs5X4vRGcBe7fAxyhAq39QKXuoIKYuS8Drzyoox9Bqwvj0t3ia3P6bvug0GXLXFv6iJ2SRenlIc53Gx1E/u1wcHCHT6foHtkVxfcFS+MsFn2fAzJlT12Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpcVFgHj03WkMRz6nyGfenu6MUZcmtloixbrvlP5QrY=;
 b=fSl5YhDYvfua/4HU7fl7SIFaFq5zyZyeiIVd6eTZtxpMlAqesC2La4k16vYk7yGjx+5WucZ77I0ipfb4jXO2TDjVn1KJ5gZp91UM19WRr9hwxBKmEGm3vRyhD4p2Y/NapCkeX5dEA6gTbnyMde2cQXdlVNx0NAA5iOMQ2K+e3SJzBEgyxcI5Go9zCMVeToaknTaqTyBpgiZON6UB4LgV//ADybqXtBOXpwDjgNtfXjCbsCdxvm0iudXj/e021U4Lt9N2F4Nw1tUvNDpgDFJp5j3SmO1BnZM784QoeoJJATdDYYwUMDnEcEq+GOO6zMXbtlWCeALZKITOdWlbuUXrJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI1PR04MB6878.eurprd04.prod.outlook.com (2603:10a6:803:12f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 06:16:31 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 06:16:31 +0000
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
Subject: [PATCH v5 1/5] dt-bindings: phy: imx8mq-usb: add compatible "fsl,imx95-usb-phy"
Date: Wed, 11 Sep 2024 14:17:16 +0800
Message-Id: <20240911061720.495606-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI1PR04MB6878:EE_
X-MS-Office365-Filtering-Correlation-Id: ca498f24-08ac-437a-ebd4-08dcd2294737
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g3CywfCsvWSr40cV2HRJk0IjTTFw6mcbKlUs+10LKfiukjiaKODg8G8Nm5X8?=
 =?us-ascii?Q?aS9guZTU+6q+e9qDSB4VhB/QcX1Xl7HQaPzBL1OtHiNChCKI19yCbDviWyz2?=
 =?us-ascii?Q?FiWKD/blSjAyU0bonCPGLqGCRatmBmtXPUQUhpaX5ipjZMsMu7TallZbvDoB?=
 =?us-ascii?Q?hOEdZRcEdUOsl979+OQdnVqgkrJBbhhR3IzgofPKxcSFM5OXJbsGkLbtDpni?=
 =?us-ascii?Q?2pCC8JJDmOQoMaevAi/w0o16aDnLsWBOJz/I9BJz3RqEx9YRcdQXrCFf0omc?=
 =?us-ascii?Q?ur7xW18q5d7SWcl288aR/A4kykMlMXUyeXdWEM80LqemrScdN0Da+njaKsQm?=
 =?us-ascii?Q?mJT/4GUETVwwbZZE597NoevXxvusSTJruESkTcfg0R4xo6mYq2GoP13W+7wR?=
 =?us-ascii?Q?t3cMp3/aaWQDPZAbeuDQOctsHaA9Gssua3svhzLdLaGB0BKWnJ1YVN9d7pdj?=
 =?us-ascii?Q?J+YSCC1+4FIwp91URHQwIicEGzULUPa2O9tJT24gSM/728eTQvpmC1DgGMPz?=
 =?us-ascii?Q?GBxggQ/TvnJ5H+9hy2Bym2C7jA/yr+qMf0pi3PPpkgcGpW86hfOFz2LpxtUW?=
 =?us-ascii?Q?fMlMZXgnqv7al30zz1aQhFyl3I8KQM7eX5FwahlHauvg6UH1Gotrc/fggCcT?=
 =?us-ascii?Q?4YaxzwKTH7D6zcQtSH+qRMN5GdIF72SVAEC6nW6WhvgZ25Y7XFqeXGY0jEFx?=
 =?us-ascii?Q?CACfbPin8LOWwt1/m37l1F+FEZma8KzNMrAXBdZ9AdSccqptaQcjYyPwSOT/?=
 =?us-ascii?Q?TlS4HN1e/P6b+/c4gA58WXI6LfnkxWjZIVQc1oaYFI7NRi8nxOa+w8TWv/Ch?=
 =?us-ascii?Q?o9YXvBNSHL7+D5VCPh53atk2jQMDmpDWjsTtHoEpEUglmZeP7tZ5Vao+H7u4?=
 =?us-ascii?Q?TZMN7DFLgADNBitcmphMg/vJFvq7rskg3uRzkNdcOA22ZMe72ir36Aneb6YQ?=
 =?us-ascii?Q?k+lviPw/8GKs1zwQYFfR6ZZHtc4XnXJLlhO4lzit3hSKBLg9myJBcmFhbc/H?=
 =?us-ascii?Q?1dWyMdujtA1jtVWgZh5PbShYvwDRk1qsVmDUPEBGshOzbH0lq9w6M76+2RJc?=
 =?us-ascii?Q?nEznC5g5CpP3Cej18sIV8mPortvVzgZJBdFHVTiu6/oP+4RP1mXkBLebD4xO?=
 =?us-ascii?Q?nBC4CIc2/bd39ZV/jS8/vB34BMKB6eErhopAQm0uyzRUF50VQpWQUYPNX1j5?=
 =?us-ascii?Q?AwQXy02OH+CrIdwvVwQt2WhQmoZKLsQ4i49KOaBWtSscz90KYSnLYYZJKLGY?=
 =?us-ascii?Q?WXnVABwrUiVTDOP6eDpuyT3H8p4gKlm6zf9ZNoHXn6M+C+ZAWq/vu56VqK4h?=
 =?us-ascii?Q?/Bwp+4vx61EWMjuqDHqAul4ooyb87qH+ap7ooSkkHA1L9jzNvgN0GHJL+McU?=
 =?us-ascii?Q?jcyf4bx+I4G6Qq8hNf92UOUyRYDA5MiKSIxnR5Aum7/JBAvyN3N4l2vqwFuD?=
 =?us-ascii?Q?btEzf2+jxU0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mqhzwCymnmf71kHNr2muOLjqxQl+TP0HJwmKUWAHL//R5RDOx7E8EvSXuf+f?=
 =?us-ascii?Q?qY9WCsSCuOSzW5HkTurRgCqh+rrCR5aZ11PEcNV7B/a5GGEKBal9xbvJ6WCW?=
 =?us-ascii?Q?6MuH/N95tJlij/5CXXi/kwvxGqPHS+8lufvesZTcbtWpx7pAeStHOjvr36Rj?=
 =?us-ascii?Q?IoV/amkKJApRKR68iArEtdzNDu5rjZ4gMOMXsElt23+cpKh0fTTAxtwmw1II?=
 =?us-ascii?Q?rh82MSVa1B7z6GbvdbC0oCdUNz3+MP5zotS0nPj9bHlZFz/38Ayp9vOZamTH?=
 =?us-ascii?Q?5d2Yx8VhTiA4aDny7WPX1uXAGZzfQHTYmoHS9syYJKkuNDoOD5KdByIaZ5nh?=
 =?us-ascii?Q?uI5TYsSgZy9SEMdx0jDm8y2xEWG7Kp2rVOyzKdhfPQOugE8PUhjyRd4NBiPS?=
 =?us-ascii?Q?jBRSHTt4s1kgShYuawtGyNQS7/n7gCOQ+7luT64CMDL0M4lR8siZ1EV1T1E3?=
 =?us-ascii?Q?HlWH5+a0E6UMlTCrnHpSiZry0ubgIZVVDCqFhRlEqpEbPYznA3pPGvC+CEVJ?=
 =?us-ascii?Q?RhYPaktLowOY1aQSu3FBigFwwBL1uwqBXcPmvZuM3X/cz2lVw0xzmL8af5cu?=
 =?us-ascii?Q?21twgyQLO0/uSTvwq0aCUijChovWw8UxMC03lTWJvGoN/Ib25cBosEJTbBXS?=
 =?us-ascii?Q?riIu37c1d9BvHmEWdMHxQM6zJZAX80Yync8kW+DS/sdzbwq7IXULOHA4yBvQ?=
 =?us-ascii?Q?RlX2JjVTv1TqwCN44FvyOVGeQOngIF5+D9DIF/OjybNhRmxnDMsoJX7K5V/t?=
 =?us-ascii?Q?OkoGCwyh78tls5PigN2bKeXPdJcxOrHM9z/5fTYiXcvzEFogX1WyBZZbkvi/?=
 =?us-ascii?Q?5Cdsxq1ZixF5uV18TSrLf37OCnc1PUxMaxGTyry60CRm2AR34qXXsAbYGIxX?=
 =?us-ascii?Q?hSURv6blHP7Q69WRmmtH4B8p0xYzSBHMxUDnyZ5S1kjDjH6f+SiEKdLkPQDD?=
 =?us-ascii?Q?mh/rFFOYp2ofKrurCxk77xNrqXc+4wY2V7WNHhOB8ufpqdEXgEkbj2xydm4G?=
 =?us-ascii?Q?8i580JiEXtvtEGJel1JYNp0v1v/k8tXE6OxaIBuAC/FD8T5Vrjg4H2HckUw3?=
 =?us-ascii?Q?YoQIEvs+bdLEEdDeY9JLrb9cIi+2eX0Dn8RLDkr5bFsk+2RyubGJWxY8MPCM?=
 =?us-ascii?Q?vAx/XM0poI1VlHua7d5lFo90dvbhWHz6AXf+AideHbKz8tviMduPOqoTrIng?=
 =?us-ascii?Q?x9nSURYg9+QbFmWc6oIDhUCoLzXs3lyMiBdVae4/mm+zgVHUdbHjNcpJd74l?=
 =?us-ascii?Q?VtYlpi6Poyie7CtlCA6BIOZDNZOLhbmMrTIGB7XB+gEFRKI/gukvVLdJ218r?=
 =?us-ascii?Q?XsilI68gqoPdiGwSEUHrUKHndfroCCIO4Lv8seJ5f3782nZqyAxY1WvInu8f?=
 =?us-ascii?Q?7wKcg52qzUfQ8IMrBXJdlE6HVm9tFkE1cT+jam4x3Uf0bHZKUAgHI5WWjbVQ?=
 =?us-ascii?Q?nWqgt4ZldzXKnCm34Krt54jLMwmaxnH2tXuLk+dsmSxrwvBGNGvkw41zxToJ?=
 =?us-ascii?Q?xi9WDeNixjC9GoCt5i9/YqELVYfehBX+NbrnNbYZuGxgU/JSG38RINidl6E1?=
 =?us-ascii?Q?KwcYJsnopxFSQU7hHAHt9aeXyJrjlPZQPW4JE6XY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca498f24-08ac-437a-ebd4-08dcd2294737
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 06:16:31.1874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fq+h0dhKjPGQkO9U+qVTjqdPHP0j28vT1xiNqM1VQPdLhWHGi6+QBAfXKEZI79H/2E7IUwMOrrmfS6w51G/Ghg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6878

The usb phy in i.MX95 is compatible with i.MX8MP's, this will add a
compatible "fsl,imx95-usb-phy" for i.MX95. Also change reg maxItems
to 2 since i.MX95 needs another regmap to control Type-C Assist (TCA)
block. Since i.MX95 usb phy is able to switch SS lanes, this will also
add orientation-switch and port property to the file.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - replace minItems with description in reg property
 - remove orientation-switch and port
 - refer to usb-switch.yaml
 - use unevaluatedProperties
Changes in v3:
 - add Rb tag
Changes in v4:
 - no changes
Changes in v5:
 - no changes
---
 .../bindings/phy/fsl,imx8mq-usb-phy.yaml      | 42 ++++++++++++++++---
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
index dc3a3f709fea..6d6d211883ae 100644
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
@@ -89,7 +94,34 @@ required:
   - clocks
   - clock-names
 
-additionalProperties: false
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
+          items:
+            - description: USB PHY Control range
+            - description: USB PHY TCA Block range
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx95-usb-phy
+    then:
+      $ref: /schemas/usb/usb-switch.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1


