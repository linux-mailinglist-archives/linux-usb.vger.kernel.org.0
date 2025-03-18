Return-Path: <linux-usb+bounces-21846-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A1DA67740
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 16:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EC2B177114
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 15:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3A120E328;
	Tue, 18 Mar 2025 15:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mmPAeKNV"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012034.outbound.protection.outlook.com [52.101.71.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B8F2AEE2;
	Tue, 18 Mar 2025 15:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742310471; cv=fail; b=Jj3wN6ZiKzPftJnMyql3ygjZY3jgp8rn580qakNU3R7aKddlkbZX8A2omI/SzJe0udBtxogjJ2ScYwlXEhAWKh8cRv4dXBUkDcKNH6qutUpKf8Jtm2xMV4sgYqOSq7NZgNLyfdHnFcij5o2WE71JxxSbGO8XtO0Ivl+KKh5IYBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742310471; c=relaxed/simple;
	bh=Ac05anU8Nr7vLbM/07/gPNNIoZ2RJDkFOg/8JMjCw2M=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=cvEcWXYan5Q9Ww/KNxOcU0En265gnYBZX6L/9uXFEki7z+rJNW7sW9lXq0M2AvVDQxlkvenXRRYHDCUvZZsnGyYy/cna0jfPb41dDYup5jv3lItkyV3Aj38FXOko5gd3ZzbTwWvBLOMJ6p0h8Y41yR4/Ax9ON3JHqx/WZT6Bw3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mmPAeKNV; arc=fail smtp.client-ip=52.101.71.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TepCKbHwAnGpoV/be5fhORbNVRGH/j8qo6ImysIuIh5Q4r203UJ7RaCzrOqCgheIGGFqpXhsuGEemaVWZ/LVKIQV9Yoauh1l1kMrc73sJJaeNf/yG8adPraCIrlCD7F/QaLhK0CQy8WuQncTUDYz2UDe1fIqV1hKMtr2B4T0iD+sGOd/0yfADdI8grvWd00p+I1L76UThw+U+dZw6bh3zmH4A99p5EvoXYzO8n73iVHAk82LqgkpbsTGLdNKobEGWe9ZUxITxm13f8WACrGOX7PxtucaEj+LoBwQx9X8qLJgXsosnpEW1u7uQewPt/Pb1gPGqmDHaOcjIoQJsXfaVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxrjbPSVEvokvl5l43IQKvt9M0oXxUsCzh890vOK6YM=;
 b=sFinvQsV1Gg6wzKUp3LAJxBbmBMH8Ph8+sP+kmM3ttddhoOO9Skc8PjxDiX21IFwA9j2ZPCZ7mXSvB8gGEuAbFEbv6OVqMjwxKXTRdMf73tha53yg9YATpqPaupchTsQCVRrr7DhmC4ftpaErLDDSEbvQn28Ceawv0B6uBfQVQ1eslpkjyywLgkhtWzP4HlOjm4OOmmWEsr06eEA/nLm9gRhYG91QpYwDjMzclbe5/4rNY8m5UM5ETQm6ZqNaETD1Kg+O1jZ1k01UpYGMSdYci9t6z/EePakVU0Yq0mQdRM1Cb6V7Ms+ooHycJcKds6uY+/tHrlH153J2q8j34OSzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxrjbPSVEvokvl5l43IQKvt9M0oXxUsCzh890vOK6YM=;
 b=mmPAeKNVyAc4ZXzVK7P2IiqdCLACFW/UMzVIuRJkjfnVXT76RZP0qLqzF8l+EtUtW6UqjIoe/cJHa9BoWzNMar16wuHzMnHC+Vsk3UDhIqqwEiOk7AKJhy9C+8b0yEikqnFDpGtFc/0/SpsmkGYKrdjVzsG5UaTB8ds0UZ3P3RAjzhHt5pCvNDENRyr7JCNatFxt6wqmiUmNbba6gCujHWb479v7cU5gDpkzU9tQ8j9YZeu9M+B1ry1iyVsR31jAtz4lrbDCmvexuhKxWisZ6D/YkiSmMGE6ArkLbPgJuRAVaDGOH5N019521LVusalrU0oSAbGu1BKvDKoXFUs0/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB9PR04MB8348.eurprd04.prod.outlook.com (2603:10a6:10:25c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 15:07:46 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%7]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 15:07:46 +0000
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
Subject: [PATCH v6 1/4] dt-bindings: usb: chipidea: Add i.MX95 compatible string 'fsl,imx95-usb'
Date: Tue, 18 Mar 2025 23:09:05 +0800
Message-Id: <20250318150908.1583652-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::6) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB9PR04MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: bc09a866-7915-40e0-e904-08dd662ea3d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wNvVykoIurKKSgdfiRU7TK5EEDW1iPkKSeOPBhax6Q/5O6Wq06ozGlrY5hiy?=
 =?us-ascii?Q?Jpv517JB7W/HatbtjttbRB0dhwG7xlvlWvbBmnan7Ec/Y9JmwGTU8OeB8k2G?=
 =?us-ascii?Q?Tsnd/iNXpL6yFObekRAvAzP20248f3qdMdUw8NWvRu4Vmv0pGlnxWGyfeakV?=
 =?us-ascii?Q?TJ/x7i9FxfSXelQOoGnHgYxxrscFMhjbsQoyEDphPCl9uzJuJeMCr0tHM4Ug?=
 =?us-ascii?Q?cOPhYhO7GG5C3B1bs2w5U4sa/PwzQajmyjO8f0nZQfW70/cqBXgU/l1DGyho?=
 =?us-ascii?Q?xo4jt/e9DEwcKHofCb9XTeBBtw2K8tbj2oXHaiNUUhC/RA0y74aFmW05wDRW?=
 =?us-ascii?Q?+FUgwLt4g4rXj0TIDeu7wsfs75XIc3ptwlD6f8XgB/CBHDhXqYRCN3i1g81Y?=
 =?us-ascii?Q?84yH91nyJr/PTZx8ihYht/AG6vkSuFCZ5I/YE9sjlQ1UHR4Qgsa1Ncp/Ectv?=
 =?us-ascii?Q?A2AYcJcaPshaUF3ZV3Sb79NkRdukflynIJvqqyvxnwaPcsGQaKbT+/e14CHG?=
 =?us-ascii?Q?Yvh2OheErdjcQmNN3icfkxBRXXI5cRV6ShzD4S4DirFVEnvydUDwFmASUZ78?=
 =?us-ascii?Q?mNZm7wr/AUwZCyUqSoWZPBSYSzfFpoJtdm4ezf8ogCV4up/0dt9MrO//DDbV?=
 =?us-ascii?Q?Bd9i4cRKcBEbbHtr9mPxp3b9BEJoBZtmer461NnBR+Auf5o1r/+py50B+Frw?=
 =?us-ascii?Q?VNycjXl3ssrUUszOt0fkUhxPcVcIykKZ50BJGFYlA/Reb9Bbm8a/U3tbXABk?=
 =?us-ascii?Q?Upso3nXV0E6LooEcZgBcv2JSEH4fPT0hRUgfV6shnnRxX1m6XMgVIGXhKINo?=
 =?us-ascii?Q?aS4g2FpjdRfUEum1qxEyTb3UuLd5mKK0CtK4K5IDKs4lC7HUjs1ZGKk1NHXg?=
 =?us-ascii?Q?ppiGKeY6ozAyjBUI41RC/MC8xNM2kcJ51AnXJvgYLjldleFisDgKPiC0e4pk?=
 =?us-ascii?Q?7G4UiVuAlQ/QDjXQcN8z4VBlvaJTDb4+Si8IGnvCjBEHR1AFFZcW4V/cZ1wg?=
 =?us-ascii?Q?GgJiUhcnUG/ehSCpqJyQj+mRjJq79OL/tMjqxenGrjraXdDoovu32U3io9hP?=
 =?us-ascii?Q?M1xOtkXPD20nY7yylHnEDQFhKJmpQ5Ora4zCnT3usNmSSxx7qCWpiTtspqbY?=
 =?us-ascii?Q?Kh7Eq6CYCYar76O52iRwPrNLhh9Bj05xnQBuWvV2QgH+XvZqepKR2FS6/nI1?=
 =?us-ascii?Q?RPPjfWxohD6Cv8Z5nxVWTzLLcc5OFv3pYxwMeiMAfbfY5ZVYTmJEZS+pQA2S?=
 =?us-ascii?Q?9VcZGLvYO2DZaHWy0XQrAIaKc7I3JA+fxhHxpHR6S5/mYgc4DNpTUJd6hPIF?=
 =?us-ascii?Q?veT3MEVfhrPLPV7ZfVi/2xjQk3lscVdhYRTULDK9HfQndRNcI0wCywnz09/s?=
 =?us-ascii?Q?xe2QYBYLeuq9fCUehILGc6IB7PILlJrltXchzrH74emsrQJ7Atd2lptu5mLW?=
 =?us-ascii?Q?yuDGufEFF64XRk9LX5s8xfOL6b5kEBtx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZV6ybffpcgvfJd4w1J8mh8t1z3KbXry/flWCObsTpp20qKD2dcgALs45L7TQ?=
 =?us-ascii?Q?WMAa1JNWPtVYaKj2UPonQPdL4e37/aN4jQ3OE4cOgUKgTtta/tDYaRN1VESz?=
 =?us-ascii?Q?Fx12+1jrAZ2TMUgyIsOneMf00g5tKKO10IdYbD6G6WXrpjdohIthmSbw4d9y?=
 =?us-ascii?Q?YpclcK0oV9xiasfsTgPfj0TpXFqipq4RXjeg4KMo/2RXh+cSADZP3FjUhmZk?=
 =?us-ascii?Q?GJaxk0VcZVuSKRVEbifoXwCj/eGviyi2zM74cS0VqFPsOOQEAo9FoK4a1O8N?=
 =?us-ascii?Q?WaCaEP/3XBwb9W3x4mr7RQFwIQvJnKqcCDzeEcgnQxHxQEGoqfio7/tDkokc?=
 =?us-ascii?Q?qSIHW1VOpnRCKgRCs7yJ0s4e0PsxyI4PWZlrCvPt/sSmv2xOb22ZfKCjNLC2?=
 =?us-ascii?Q?//QashH6eoKvQGmqnbXrC1lKiala2VsH2/KIYQZyrU52mjY62J5IuUSNz2sI?=
 =?us-ascii?Q?f7W51iZ+CFd6/xw4+nuAcW3C0/+NfmC0EmDz3bOg5cNWgF6xmYPDSWJIQ5SC?=
 =?us-ascii?Q?jJG6BQmao672qIMM3fNsTgtOa7C+JSj5RKQKJXHU9ZpKj2F11uXLjU58ObAl?=
 =?us-ascii?Q?9Igv9PDlgASUzhbvyMvCgyE1jk0COdr70tflps+AxDFxJUurRIoQqJCOnTKu?=
 =?us-ascii?Q?apL36ZF9xGvwmKDj1TbjPSI72Q6nJB/veH9p41BK2Fu1SWatyE1x0dRO67a5?=
 =?us-ascii?Q?qbp4gQlltVFUzPtQpirZSBsL8lWH9qH2Ot7sh33YIahag3alWPcbSA3cxER+?=
 =?us-ascii?Q?wc1/J8Y0KLKbcQLIRvIiTxbs1zaelcQ5alYASq9yyAKxLTBCiUA/ZzJaQ4O3?=
 =?us-ascii?Q?8wOczsWITBf7+uPIi/bAkDr1EzoJDpDVrJ7DmKHGon1yizpOdeneFFDk1i/a?=
 =?us-ascii?Q?DnWPpBzmwJ4TYlon6uJThB/jPpEWU6SzSZ6293JJmBLPWNeWHEjn71oOL+3C?=
 =?us-ascii?Q?6xHru6UUZro2POOJ1s3a0oxSuFHtOk/LUqiv6FA7Vw4KBAQXlZSWc4K2ZiE3?=
 =?us-ascii?Q?doJBuIk0aVb0wHU51AzAIwB1a73eeweTdiGY2QtlO1egWO/Sa0h74/NiaQF4?=
 =?us-ascii?Q?/toT2QtQj+CVZPeTmzPXpxy5aTxNM52zlefB/nLqhJmZb11VKxN3gu6cKOcY?=
 =?us-ascii?Q?sVbB+l+Azu4QZCA7h6di1//afp3ShHX02+x9lXPvjo7PlkqI85rTJinrxdWb?=
 =?us-ascii?Q?VsxM74vGltJXCmxTiDWiJrnr36ZUY2MOKXUaPV5P0hPV8TX8DJE96YPCUBat?=
 =?us-ascii?Q?R8iQpKUG/bTAdLLf2yOegtqjHkbEGrc+KI4Cuk0VfpsxGjALkEwklwaAObtc?=
 =?us-ascii?Q?ncogE0V+SbMSN09+qBvirBJ7rajiBkh8Ys6eQlESgUKNAmaO2o4GAxTwMbty?=
 =?us-ascii?Q?ZPpP/xDKw/AtzSNXev8kOePebI7BIyhqBCWk7Tc2dhNIdAWbiYvUvDtj1g4s?=
 =?us-ascii?Q?1z7pnX8vc5Z6zWk9SB81ZHhOlW33V9tChl23fxboGxgQU1MusWd6acFU9XHn?=
 =?us-ascii?Q?ZeYRM8GvlaHGqW1WE4wr5n2+pLcV0Ygz1ysyQxoFb9c77APJtDs45+WrFvw+?=
 =?us-ascii?Q?ZVv9f8WrR1JwcjMoYzBglO1OShp5O48NlM291s1a?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc09a866-7915-40e0-e904-08dd662ea3d9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 15:07:46.2633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oaifLBaaYH/nvX56gRvIsOobWmR+jqMwZwdbapL2/GOLJF+PaTQMX1Hwi4YrEfJwW8rRlMJW0RogJBkROMVUlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8348

The i.MX95 USB2.0 controller is mostly compatible with i.MX7D, except it
requires a second interrupt for wakeup handling. Add the compatible string
for the i.MX95 platform, add the iommus property, and enforce the
interrupt property restriction. Keep the same restriction for existing
compatible strings.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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
 - add Rb tag
Changes in v2:
 - improve interrupts description
 - improve subject and commit message
---
 .../bindings/usb/chipidea,usb2-common.yaml    |  3 +++
 .../bindings/usb/chipidea,usb2-imx.yaml       | 24 ++++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml b/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml
index d2a7d2ecf48a..10020af15afc 100644
--- a/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml
+++ b/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml
@@ -42,6 +42,9 @@ properties:
 
   phy_type: true
 
+  iommus:
+    maxItems: 1
+
   itc-setting:
     description:
       interrupt threshold control register control, the setting should be
diff --git a/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml b/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml
index 8f6136f5d72e..51014955ab3c 100644
--- a/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml
+++ b/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml
@@ -41,6 +41,7 @@ properties:
               - fsl,imx8mm-usb
               - fsl,imx8mn-usb
               - fsl,imx93-usb
+              - fsl,imx95-usb
           - const: fsl,imx7d-usb
           - const: fsl,imx27-usb
       - items:
@@ -54,7 +55,11 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: USB controller interrupt or combine USB controller
+                     and wakeup interrupts.
+      - description: Wakeup interrupt
 
   clocks:
     minItems: 1
@@ -191,6 +196,7 @@ allOf:
           contains:
             enum:
               - fsl,imx93-usb
+              - fsl,imx95-usb
     then:
       properties:
         clocks:
@@ -238,6 +244,22 @@ allOf:
           maxItems: 1
         clock-names: false
 
+  # imx95 soc use two interrupts
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx95-usb
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


