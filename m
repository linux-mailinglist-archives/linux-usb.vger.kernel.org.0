Return-Path: <linux-usb+bounces-20812-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C8FA3B9E1
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 10:37:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91EF47A840C
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 09:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF921E0DF5;
	Wed, 19 Feb 2025 09:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lIe3svil"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012061.outbound.protection.outlook.com [52.101.66.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C811E0DC3;
	Wed, 19 Feb 2025 09:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739957449; cv=fail; b=Njyb5xuoeHK8TrCOJqvGNFEz3mTzg8hH4lE+US01kU7FYaOPpVrzjbXfxUzCLg0uXYob9FA7eDgRyiYU1zP5toGd8LokLX8lViKgJZdzugwPCqeXMkxAv2jV1RDM/TxJNiZzlfhrzSYS6nV+K/XntR/xrp44ucAWK1uQnMfYFXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739957449; c=relaxed/simple;
	bh=w16vyk4Fd7+QmSCOvdpWXOunKlZaLanK0V+zo/7RTEc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VTjdhVr/1E5bwqc/ePLqFXo+sdn0NZyyzo7amNBnVFW6Y5Mj8UtedvPCWtQmgNQYeggZ/aA7WcCgMewcSpnBfEObsH4Aabi+1XW5u6ocjiI1A6Rl4HwJb1xq7c9y9kwrw3jyGvdgRODj8nTXRPHzg8LpcDmlZjWUVDo2WmL43wA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lIe3svil; arc=fail smtp.client-ip=52.101.66.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYjfbQR49FYBIna9um+uxAfxvYC1DjZrlC4FNvstcijKYnhh1NiKn5VcnKurP+Looh5E37sL+6DQ6cMytAOtfEAtO8LpdCgbWmCjogzsSPqh4mrUlx2til0owZV0bHJ7mB4yTzxCIkxGBPQgXJro3Dd4Ces18LiPxHmVs3ym5rIzNxcngZRtDCHv6azDj9ySw0MUfO8ugWEI3yzCpS7lOIdgqrloJA0GU2g2OOixTsbqNwqHsH4DiC9QU308BFK2cZD3jeVWJGZAWeRL8mJAggr0vzXkjVouxS+vKZhddQisYuwqHxY6iqrmN879x2TAOom/+SvL+5x1J+ZnwWiEww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=erMPftkbd2wk5Sqd8ac0OZPg0f4Hx7pJk1mB2z8myj4=;
 b=DAHJMx5YZF0GpxmX9iYDnYIVsYhlPzfrRcQZUyUyQFIEhagKO+iGW6Hv2/SSM5EgQtNJBOaLyQcQWOYi8ZUbel1PtRgYq4yA6dW5wiSm/v7oUYXZ7zgP8p7dseJJh5C95L9Um+SGOBjjdNR4XEQjuHwlXidvsNJO5YNeNNGA8Te1iECbC0hz/b3VJFbZdNMQiMR9aOLf8yPirmVEy1SCu6U/2BUb+XGWlICzOBRVBmDZ4N3/l4saNT7gFG98usGWfS9v3GBFAVHk9gs0sFO9ewP/r31cs6boQowBaao/vLFaAraR+fK/GTfcI4ELKaRBW5ZCuG3dpySGeyjpg8FDhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=erMPftkbd2wk5Sqd8ac0OZPg0f4Hx7pJk1mB2z8myj4=;
 b=lIe3svil0C30DusRP22z9RA+rFMuDWoujFpmkctX+akUe563pQ0C/XG57+VYY8B7WITLlRD0ZolpvckPJ19TO2zRYg0TIvZmjUUkEjLhiW0uyYiHa8Lnv+4/pZ9vHx/7Q0nik1R9gSmZs1HJLKHbZ0lAvVcFtFwhP8qYQYm4TY9qclKAUMO6C4xLFYBE/xzrEMVISPK/FsaCtJTzTccTRH38xUvV/ov2gg3BgP5O2VyhmAzs1GOlmAdVqg+E+K5ScsP0tdqjSky71IKJx4Fh9cLNPGR8KdK6WS1xhYwI8lgbtsExur0k5Htx3QI+obJQoWnX5bns868PtYlQvdatvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by VI0PR04MB10370.eurprd04.prod.outlook.com (2603:10a6:800:214::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Wed, 19 Feb
 2025 09:30:44 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8445.016; Wed, 19 Feb 2025
 09:30:44 +0000
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
Subject: [PATCH 1/6] dt-bindings: usb: chipidea: add compatible for i.MX95 platform
Date: Wed, 19 Feb 2025 17:30:59 +0800
Message-Id: <20250219093104.2589449-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219093104.2589449-1-xu.yang_2@nxp.com>
References: <20250219093104.2589449-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:4:197::8) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|VI0PR04MB10370:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b406eab-a64b-4295-2491-08dd50c8143e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ImrPjWHl+ycE9eKWqaUF2vRHM0MkbMf8zF8eQ4tM+PbQXZslg9/2nQYtWw+F?=
 =?us-ascii?Q?So13a2gaup59EgMdKr+1TemD0fglFOpAmoppEl8n+HmoWtpA63uEE/S+nopI?=
 =?us-ascii?Q?qGRMczcLvDweZUWy0lJ6ohjWkp6oO63uKM7L5CG4z2bHtMQW7uJS7/gYtrlA?=
 =?us-ascii?Q?BfLn1R4v67j1dk0jp08Aud6osdcFOo+r9iXKVBYs260zAmDLfRRI9JQfoa8D?=
 =?us-ascii?Q?HxnkPHoE1Ar2u4gwYEa6hDMpLHSp4w/3FY+6mt0cUsc/qcxDYzYsmGxTjwN/?=
 =?us-ascii?Q?uM9Qmk7i/HktDpvL0XM3WMblIGoKwuaX8Kmr4eGi/UK6GNdGvYxmzkFWDMYK?=
 =?us-ascii?Q?g9FDMLUnqaO0uBMATVwzQnpChiRzKdhyS0Jf6CY370RW9JCn76aCPTodnY89?=
 =?us-ascii?Q?TgUtB2eWIFUcRS9r2yPo/6+p2KYb+rlNhwK19JAX9TpFr0vbuajWGB75VatY?=
 =?us-ascii?Q?KTn/CHoHkWDDTxX1T6j2N+OBG5vRxH6S4VkhsSyIsGI1uWa6GvSUB7yoDGVE?=
 =?us-ascii?Q?WSN+JgYqaEl1ErW/y4FpnZ4bM/k8gcIPG15FjQKBeVdKCDd8wh0SK5x7coje?=
 =?us-ascii?Q?/1KPonpYtMgp6gnE/gD2YGvR2H5M6Z5L+IQoZ5KnsQZ2bkMFDhfhE3KoAZI5?=
 =?us-ascii?Q?vHJsYHSC+pfII+HHfM7Y611z8A9BbZoMlpIVuM2MKJsx3mJdKTXkRGpf3Iwh?=
 =?us-ascii?Q?9KOCAqCkju4wUDLVNInpIvVsz8t5x+6ABYVCQP8b0Nwpn+jVfDHVZLs3ulrI?=
 =?us-ascii?Q?aBuunSvjC65DEVZ6dKUFFakTbEA7OG9UYY7M+/hGG/2ZAYFR4SJcQGpXusn1?=
 =?us-ascii?Q?S8eMExhp+mNs5N6tLWWzo7Lrqay8sQdTk1Ji2E4ZwjSA+b4/uc1LwTFK41EV?=
 =?us-ascii?Q?ayt9f7tpN8lCoziGCGekvbt/o5m5ttR9BZpIoKYfHXGBTpVQ8a7urLoD6fou?=
 =?us-ascii?Q?lE+hjPwN7P+Tosw+6SPUzVPC+Mr2g6rrhJzH6buYP8RZwmDrFo7/VHFMw9r+?=
 =?us-ascii?Q?QTT3xpD050bfZdsTnUPJRtABfdyRWiXPlsQqFCbku789AjIa0hDxPTPz9uUP?=
 =?us-ascii?Q?SnMFJlmSuCe7Gpw+rpkvvRNHhu3pFohT81CzhnMcUDtV3clkNaz4jXp/xMpN?=
 =?us-ascii?Q?U51a1CjzfODPPj21lOPX9U+i28IaQWrWkQuTNGfrzgO54FEkaUqazsalAX3I?=
 =?us-ascii?Q?3mdo4rlKu2yT95grxoFeNRHJ/SXk8JUh/80bC+22xcCQQObz0tmQrZaW4p8l?=
 =?us-ascii?Q?7yENy7rMzPiRlGPFo9SLrNCMxY8mWfSuFtlaOBOTEfe1tNVU/8FR2TElnf6R?=
 =?us-ascii?Q?RAJmfQ+J3h9T/x00Tn1/4FlnOykrehLmgteFyD3omO2kv7bteFdNcVRmEfdu?=
 =?us-ascii?Q?/2UsL5BfY9J+eBFRH4RvCGlxxO64RWB/Qh1wbWFRWzJa+9DDIxITWDJXevoE?=
 =?us-ascii?Q?zh6snRZVhHtUT5BEsLps0Md8ZTIRUXb7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Kjr/APHx1ojGpePQEMz7Zzz7f+6KIK3/MhvEk5YMce7/hHg3kL+ypsWOm54Q?=
 =?us-ascii?Q?R11xfyjkXSIVlKY6X6pIX9V6zhSkmEaf1nru3y9lFarjIbV/DwbcXuweNn+g?=
 =?us-ascii?Q?+NEmf2lL3+aI86zc5o+hdiD+D/LsYX/EDGUlFcDHjhlQoaLtDsTArUKEaQgC?=
 =?us-ascii?Q?lEBd36VYobVBJw+QDTIn2fCtywV/j8P1Loc0AFRlYWpAGOqYJ89lddvqbhMk?=
 =?us-ascii?Q?dVH/rDw2sLaYG0FXl1uG/nXRWS8u6JdD3oIXVlHGVlsTBvyak1jAXHJZ760V?=
 =?us-ascii?Q?vSp6+rrbSEa2rMRaloHpltbeDlQ38ujxWZrJzcrRlSqmex9C8JedoyMLiM1q?=
 =?us-ascii?Q?jSmJOe7c1JcJM+XH9qIHas5AfrNATS4RJWi4+69Txi/BFjbHIesRH2lEUnY7?=
 =?us-ascii?Q?T0dqlCejinUcLd+Ej13um4Nu17/dR7EMlad/3tvwB0FV3nO96HFlfmjVtlf+?=
 =?us-ascii?Q?2YXt9a7nK/BwLfnBVlKtBPvh+tbUkCt5kbSCLXP+dzDwICEyFjRpFlakOrpQ?=
 =?us-ascii?Q?/lQD9tIYRZ4jVXUAIQkiSYoOtTjjxSFPsqI3vuBIjoKZe4dHnX6g6G/fyDIw?=
 =?us-ascii?Q?J9KPWdGZXMWS1/TX5am0onADbELFIwkNrxzJO7Deft8OZCmVcYsy5fW6NjTd?=
 =?us-ascii?Q?Bwo89xFKiPm+u6bz24w/zSU3xxDa8PfkmyWlq/c/mNlude2Vga2fpu/gAG2y?=
 =?us-ascii?Q?0k4rZ3dHgJdsOF4Gqx9iG378pBnBOq4TjjJ5NQwQIaBRimSBVhCMtqacQiIR?=
 =?us-ascii?Q?8wDCQDsCsI43P6t0A3Pk2xi0o284sXJROk4IJR9zBKpTyxVRfQyP0jZ5CKuP?=
 =?us-ascii?Q?IZJpeBffQ/SQdlDayr4vz2/f9lBr6NCl1/f914m67vucWTRMBDlDn5R1CVyR?=
 =?us-ascii?Q?WAcQYhyFBI0KhESu1dX953MIBYx6n+OQZGRl1av4/tw2DLlvFoy5c0w9vt2H?=
 =?us-ascii?Q?PAw+reOmTWuJpFATMUAalNujsvvNl+T1G1qe8hhuRUc5qv18h/KbhN98MN1t?=
 =?us-ascii?Q?CvzZs14/FgITT0HDWOvxeNiwvAgP20k2kXMK/oQo+a9Ca5OYO6wULtUgdFwY?=
 =?us-ascii?Q?zgf3CIjPFmN95jUwIa0JtwpFIPbG/GLhmZVvOGozGWhSB1CGOA6HZmlrvITJ?=
 =?us-ascii?Q?D9LbZ2346BOQehCL7gOF7S7gz9/FUq6Wla3TV4win3IeKaksJc2/QqDXvFxG?=
 =?us-ascii?Q?Lu3H7OvIbBUBxHrHPkWhd4nhTKVyYPC/Dtjm1/QA/BfRCJQ7SMIwgsxhmbC/?=
 =?us-ascii?Q?2m7LIAOKoG+sQFapmRdLg1FLdBDg8yh705+RgFYhKdWMSNloQr9IsfwLmCIT?=
 =?us-ascii?Q?PElxY8RIg9zp05MugInY1mmWBhualWKsIA7KAzMTNh7LdMiB0/nAMgCFFWnd?=
 =?us-ascii?Q?8HnA2eFtST3AIf3504OYCAUXZpFoN9XR9Y6NpSfZA8Q39JeasjiYf2FKUScl?=
 =?us-ascii?Q?RHS1zcwtJa2BdnO30gYdoXEMSXKCb8Z7vBkN9pA9PexnialacFAmNnQ10Hlk?=
 =?us-ascii?Q?x9tXUZ5bc12SwKVNYZgU7oAlge4fR5+8fExqikUvqL2b9aocwD1hIHOrRHEJ?=
 =?us-ascii?Q?gLfTZtVUZFMMlMQ6pacB1hHnGB6TdNojtjdFTN2M?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b406eab-a64b-4295-2491-08dd50c8143e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 09:30:44.1988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q1Qv4cSB658tNXjZQ/8nK9WCNmvBzi3ycdtNikOIPaKo2XSCwUco635u53Ixaj0KsARzIMJz6dUb6n2Y7VHbmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10370

The i.MX95 USB2.0 controller is basically compatible with i.MX7d, except
it needs a second interrupt for wakeup handling. This will add compatible
for i.MX95 platform and restriciton on interrupt property. Besides, this
will also add iommus property.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 .../bindings/usb/chipidea,usb2-common.yaml    |  3 +++
 .../bindings/usb/chipidea,usb2-imx.yaml       | 26 ++++++++++++++++++-
 2 files changed, 28 insertions(+), 1 deletion(-)

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
index 8f6136f5d72e..3678804a3743 100644
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
@@ -54,7 +55,13 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: USB controller interrupt
+      - description: Wakeup interrupt
+    description:
+      One interrupt for USB controller and wakeup interrupt combined
+      case or two interrupts for individual USB controller and wakeup
 
   clocks:
     minItems: 1
@@ -191,6 +198,7 @@ allOf:
           contains:
             enum:
               - fsl,imx93-usb
+              - fsl,imx95-usb
     then:
       properties:
         clocks:
@@ -238,6 +246,22 @@ allOf:
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


