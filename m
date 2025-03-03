Return-Path: <linux-usb+bounces-21242-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2BAA4B6B2
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 04:33:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F0123AAE64
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 03:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437991DE8B3;
	Mon,  3 Mar 2025 03:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="B1aoyONC"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE431DE3A7;
	Mon,  3 Mar 2025 03:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740972759; cv=fail; b=mSrAoLweRyF1KG5oTMc4NV7lwM1DTZmyGAcK7zIrRE+ER2Afey15fuEIhje8eqF8Kk1RLKgqrIgORcX3cZXDce82PgHYkE0CaRsWlMuv36eqTMfCU3SRWqYfoR8aPH2WS5Y+Nx8VvkPwYB1s7tZhU6rygZgNKn3Na56sauKVSzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740972759; c=relaxed/simple;
	bh=iEsD2N8vlyuusNN7h8q6ah/w0QLIvUTt5PMQJ5SEv8M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=emB2hMrnHiIS9mss3E4TmdJKlwii2EFzFPcT4ndR6HR7qCauky39nTg9zTm7846esXslX3nwbB4Vv7cBWQElXIn5vBAzL8noOwsZ9Q46OmcwciACqKm7PwpYeYJpuTtvbrRqdB33AAEctKPGH5+1m52n1q6ngvcOlB7oj1SS3LM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=B1aoyONC; arc=fail smtp.client-ip=40.107.22.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKf5UHG9au62xuhrCEOrJT2y5HjPo3g0yHqhiwsUuAkkRGf16racn1f9WWLwVGynLmOGyy1NNMmKFdWmaCzUcbClb3l+YsLIeKnCmr0I3rRNRTpdGLf08cu4iK56BZU3+OMCF9fui9HYUOLD531V8B+vKkA3wiBRO4Sf2eOnPfmo+FKRYnAa5sK0b6lP2sxibjFxL8hi+jzgOFB8KjWegqPAxoZBu5iUt+AYolRas4NaLZW/H08YgSXDqa+howjj/U8AYGCQEb0Pzsbb1L8PJdhNM4tM46p+nhjLz+b1ehBnUMZBdMp4cyeMIAYIczuamu3bNAMASaIw1mvA49e4UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qif1YsYpL5LUcnyDyk6afWTAz/xLOJKrdW2kl9s1fkA=;
 b=rfrDXCfhnIgCtzF+RE50Ne46IJAwC/KTwtmikXa3MzhS74oSf1BoHg98zc8Nsq6l4auqRD0qqmUkFq65tjH7lP4pDEl/gBdUsblAQHNeFtocARLRN82UIVcw4WxC5rFy7H5NWjSbQyGJ2Yx8L7EDZrp2WrD49Ave6UDTglqt17irEUXRkeyGRy0OGvmIulTqXHfcvqB8Tb0LLrD24F0AIN+McR1yR92WWc98GWdP4EZyXxAWN+aDZ2YdeAor18Gib9pnHtvfUAuP+i7JfHhPIUGoWU+uSxzi7q7EYvBOKdAh47dIQQMk/WJZEmiZ1fj1TRD9l4Uv63U59ttNyyarBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qif1YsYpL5LUcnyDyk6afWTAz/xLOJKrdW2kl9s1fkA=;
 b=B1aoyONC6wmLr+t4i+LoKbCGobMqFup75mbGeY2Pu9wPb5YcG7I1vtGmM3t3e2XbegLtsgtd/CCDXYvcM9Hrc1DeNJYPvX7FV8o85E2oI8XI4IExUhvsUzXtjdkXzFiiFu9q2//Z0C7M1sGLOS35Awg6EhvUSy/rjBsg9ebgCmscrSHeSmtxcCscxqvYiMmg9KN71Jj8To91EYW3eeD8paK+0N12MBm7h55s5TcjIm1rwkPmaytC7a4ltC0ho2J1VY8YlZn/QOtpgsQCEzxqzzTAgxSWsDdo4mkTOH/cXzN0KbiZb2MSnwzW8QQf6gNFHdtYFYpDnfL6yBgbHK2XBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 03:32:36 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 03:32:36 +0000
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
Subject: [PATCH v4 1/6] dt-bindings: usb: chipidea: Add i.MX95 compatible string 'fsl,imx95-usb'
Date: Mon,  3 Mar 2025 11:33:39 +0800
Message-Id: <20250303033344.1251076-2-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: d116e9b5-7c79-49c4-6615-08dd5a040ae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G6v/N/BSro0qhZC/b36Q4HxcXFiLlA4vmiA0vwp/r81UdtQgojio/rpw8trH?=
 =?us-ascii?Q?oxvA+JpFNQIUF9F5e+7kKFNcnNozxOEvZ7lGPRqGISVyJYY6rCwN7iJEgvJ7?=
 =?us-ascii?Q?ScvDdJbvwXzJeUgfBRT/BtixMIOJQiuCmbrpJiaQxIRYIjEJ03dmuYOfY3RT?=
 =?us-ascii?Q?2qpRnunkNsZKo22q0mafz37LhdFU9WIeJUVlHlPAiHysOb0COcYU4/9LQUxU?=
 =?us-ascii?Q?WxUP0WGt/HXPxfYPLVbqfpgVyUIgN2fRqDXV/RO4ufcPIimCXp//oZcZjiLy?=
 =?us-ascii?Q?aCN4Fxppl+2ovdCRZWKMC7ZUNBp5ayVdc28N2MDSzLSkHhVfkd6LR7v4LO7p?=
 =?us-ascii?Q?Bx874/Zl/33uu4tgoVRuQw6AtI//acPogT3plsqsjCjN9pb3lJeczexzoAmw?=
 =?us-ascii?Q?n1ei4j8N7ehaz5Snh8VYIeyV4mvm9SzPnMZS7BMtYOB4nre+16mGbaJ8if54?=
 =?us-ascii?Q?FEMmzOsgJs1FH7vZM3RxFqe1b/UazupgdR8ZMveoBvq7ELDhiiWlrR+saOhx?=
 =?us-ascii?Q?v1HOJD49THmAljNim3T8pWn/mYW2ntRV9zJi+2n52OewVCQRdOlHDP4W9Hd0?=
 =?us-ascii?Q?EQkYPAdOZVrBOsowej+0QLRzFJXlayf6juZI7jS5dibD8vKL9YEoNzzKafo9?=
 =?us-ascii?Q?q/CCY+My+H9l8IhJwPrktSj5xn4NBIcb342vtL4TBo02+2VwGbweBpXnjjD3?=
 =?us-ascii?Q?HlvydOdbBaeUHfnbg11plLiNRDat0NlsQEEZ3j9c8QBGLeSpvFIAWKC5v9eC?=
 =?us-ascii?Q?r1WhTC+2niK8N6a4UvzKD/P1rWJmWGC2ePQAbvhA+N6n5rRzLFfJ0KaZ5ze1?=
 =?us-ascii?Q?7C6iECjvfsQfje3pewAmRg0DuSQXx1F6giJG/Aulk2Sez1x0soAYDuRSqF9u?=
 =?us-ascii?Q?L6+GIlMiRgiIP76GyE5Je15dukW7l38o9QoXpZx3hMDPTyGBTwLPrJa+ZxJ0?=
 =?us-ascii?Q?n7se71A8pEmItjXFEd3sVKlTO2GDPIkKqFp6LAdt7rvIazvaKuOxnpdOPd2z?=
 =?us-ascii?Q?j+z9GYu9smwz5v1h8LXlQHXDQ8vswEJxWhuvib8trtGFnjTWHqR3lLej55h3?=
 =?us-ascii?Q?JHg7otx2wCdAKvBg7/SpMUA+9sMB7VkwTw+dvuRChfbY4/I1EKHEobz9zQwH?=
 =?us-ascii?Q?hZ4MoyZjQqEIh6S4oZMJs4CCbNWXot0Tu20YgXZr9jyXLJSQcChaeGn4s+x7?=
 =?us-ascii?Q?2nAlToY9C1NfCAS5QGfnTqrpBe4KyVqKELJEiGxjX2a/kQQUC6sSCa8dxfAP?=
 =?us-ascii?Q?IUX3ltQBDWQ1RhY/xvoCBg9mfu0jmm8nTmLgDLh8rUQm/qQjycZiujPjl//3?=
 =?us-ascii?Q?InLavhqa9Xo/BWziJ7vsvWa74M4VU/gAsmHfyaLdBGqyBG27gA3xfn7sZSTY?=
 =?us-ascii?Q?apPtTmCf4Yo90eLV+ETlLP67oaFvH6dwbQJe/64mDv+oZEND1AZBo9Cwr3c+?=
 =?us-ascii?Q?xNfrRmTw6dyk+wHUHEdYeprFBMb6n7te?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/6EJhYS2mr9ubjTB7Ht4ac2h1H4xybl2RZvoCryt+rmi1CwPNF36HqHtSN18?=
 =?us-ascii?Q?BOODkXZMAl2O6as6j8ySammbZOMATUpnmA4aFcmk5z1ayMz6zHT+VhMmDlfM?=
 =?us-ascii?Q?0iuT6ksALRc05gCgz0u2Wdrxn0DA3wvfq60xDH3oO+HA3bQfkxWda5Keh+7H?=
 =?us-ascii?Q?41DVKFCKzWY+rsO1uQY9761Yiw7vrUH6H6OHLkTGXDYHAFbkAP9Xy7y+K/vH?=
 =?us-ascii?Q?C7tIPG/QJk5M42smXwAqZPG3/P5qWlJZ1t/pPgbVxpzvlCHjv0byyQECe2Te?=
 =?us-ascii?Q?1HMMZuLs5eWv1H30iiCnIp6hBvjgVRNY4gz9V2X9L4Qb4nBSAioqGF5ydpzc?=
 =?us-ascii?Q?9SYEVSXgFBRpj2DbwWNNDAh+6nlr0BI6EcNdX+dsK4kbiOHzKpKUQJ89ucKs?=
 =?us-ascii?Q?UOrpVevQ6jSyOZjJeyrTnkTIT1ysljWOwwN4QmX8Fs+o9Hxpin20K7Z7u5m0?=
 =?us-ascii?Q?Ki/p48H01U73bEnnbTLYUaMEpY2O+CdZfpbz78/GlHFeRZ0Q4QnFXH68ftRk?=
 =?us-ascii?Q?TljxQ9DRTtRehNHcSd7SI83iQmRacJXEsG7XscMhae9RiNVZfiGoTJmtb5rd?=
 =?us-ascii?Q?s51cO7yd++QpLaJ6F+3MDh4L0oTqXk9MRewvPe7QLphHK5xaa0zaTJfzH7n+?=
 =?us-ascii?Q?udzst9hXHFPY8owrWxsDPX1XWjcNHlZ+q+FXzLcz69l6Qekb3WvL2QVKoS02?=
 =?us-ascii?Q?gi0UpzdWlVsnPmspEdV1suvXPXsPc7K0RZi6MX9F06y88HXrZmt2wcTAX6er?=
 =?us-ascii?Q?Z6+4Z0PctAlbL3g+zuwRc/Vpus+HxEAyu3LaSY6J1KBpm0e1pt1MWKcSNfcr?=
 =?us-ascii?Q?htRFytb+8J9z1gpmZnfrm0te8AVLd6w3ctJYPTplZUBCG+K0IhUqD7BBS9E8?=
 =?us-ascii?Q?Gdjr+2zjfa8EehyTJ0EC+rVHGiETau1i2cgJH5g1Fd7bKq/wM3V5R7oN+Pmr?=
 =?us-ascii?Q?r6EX21wdrYFx/zdwr/QVuRWt/IMIEeRQxjnswQOltBvdUpHmEhIBYkNMg9MN?=
 =?us-ascii?Q?zAQTtyA00w+WiCeMsedR/frZtygY5pMy4gAIthNjGKRjCpIwRBNlvb/QspR2?=
 =?us-ascii?Q?dh9tAWQWxUbOmAXREaT+9PGmR0pWf9Pa76woFWIT+OoEYZY5RpAoDOkUAbyV?=
 =?us-ascii?Q?q0VOsPcpd4wredMTwnGT1FnNZLb08P0ghR+mg7CKvq2g1bo5pGkpXiUE/r+K?=
 =?us-ascii?Q?dmMkd/Ese+kr7ZmZm6o8Dbrq+UbYQmBWNNIZNwVJab8mYoO6kBkEth7n81/2?=
 =?us-ascii?Q?WxajJj9yzdUUs/nEzG6rhvWUTHnAvmPQOrEn1j6gOWoXQ+WyJBWyYDVkKDeW?=
 =?us-ascii?Q?7SFxiClBWkp+uTRSq1Ezy7MQic8PsZzLI5q6SevWvMnWHxMIjUxld9toxVlq?=
 =?us-ascii?Q?j9l2hSqKNd7dfSOgAurzJf09op9x1sp/rC7b/nemD4zz43LPylvGX8VBqlSY?=
 =?us-ascii?Q?7mWzhJ++7Tmc20lsB/+hIHR1YKYjuNlGeJwDyELgYNv04hsCa6k6NaHxgstx?=
 =?us-ascii?Q?oupVjkyFYaA27anLi2zUI7YdwyVPEYe5PV6sofTycSGU2wiw+pKMn2haeX5B?=
 =?us-ascii?Q?QhVi8gKtbN2mnsKrYf2vjC+EQfEjzjagcAxD/3YA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d116e9b5-7c79-49c4-6615-08dd5a040ae4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 03:32:36.7437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pChg6lq5upp8DbVqYGdnwJIuUpXsqNuYNnWlUyRcWECNhPMAjW8i8/SesaAe8ZScv9eLA4Zj4Z9wfpO0/0Vh4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026

The i.MX95 USB2.0 controller is mostly compatible with i.MX7D, except it
requires a second interrupt for wakeup handling. Add the compatible string
for the i.MX95 platform, add the iommus property, and enforce the
interrupt property restriction. Keep the same restriction for existing
compatible strings.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
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


