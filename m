Return-Path: <linux-usb+bounces-20998-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80807A434B9
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 06:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DF157A21E8
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 05:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E502561D2;
	Tue, 25 Feb 2025 05:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WqJsgVpq"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2059.outbound.protection.outlook.com [40.107.22.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649502561A0;
	Tue, 25 Feb 2025 05:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740461943; cv=fail; b=u2vBA7JrwMnHP4BbBOncpsdUby3bIJAoFjRqwUzNWMiavhUEH2DadYd1pVdo7Cq3OPyJczG3IsiWgH2qLCMXAul3qIrpJnhL/xLamym06XMvVYfT942CEP8JRn++s4OZPc3ToNqh47e0dIlH0Qu0z+g3Ig+1+iTvJWisedXR24o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740461943; c=relaxed/simple;
	bh=yMxLI/A2fjJ8LAhL+fK/7+7mRsHj7PUjHrQCWeIvFpw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qzw5n1d/cNmD66MJ31N9n8jMqCMkbtvmNL3CRBKGXMWNpUAWjIU9y9zjkzZv/u40MlI5Oc0N9QxQKNLjtVdsHcaHVUTdeeGDh1ffOlSudMrvJ8KLt3urZWxHS278XilPMkoWVQJWDUGBbX1lrtEwIjyzyY/4pKCW6Whya4Iw+0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WqJsgVpq; arc=fail smtp.client-ip=40.107.22.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWUofJwf93BJZ1SRAUld4HTcykDgSgN/PF8KXaqEuXGbDneDNYrDRaIPdw29nXUDoqw65ieg1feDF1hLkd/KaHFM6lloZOd7xI+YiS9z3dBmDFdrQETDyCmkn3zeZ4Bh94sbkxJuXt/acPlEWe4ddWetkdxvFVK5iQB8h2iBAGpaxZwmKTYELqY2hmoAI1rNiw9FUVVa+gG9egwvgVR8Qb4HMtRZQKlMWd3lbLoBcouQA0qFQSDhM2jfCpS9u+BsgKS20kmS9bR1KcIoLESK/P7v4MmnI83MBE0pQxJWWbt8vEXy77qoIiTsGn0E4Ixlf+9l3UhtKTQW/2n49Iyo7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W49vE/A5orjvHGqXL1LjXWxyyHEJz872mxY01MDMmT4=;
 b=A/qPaSLrE5yGQ5QLH7pILb+dDU+RtM1+LhPQeQhlWatP5CeeRbug22qLiJQoYruDQYan8Yy2Io7z5RL6LfiQy8ihaJlowgqynKvVrK3ETf9o9yBVvyVHlFdjYrCAk2iKbpSooqP04bFRS2AWi1DAKJZ0m1WflxgLWRfbzPEpqXe7kJbQvA409V/V5t6t3Vvz5PIp4gW1K5tWFWv0+tlMaambPEn1tB8Kuqe5yOSlLZBF5Nb+WVsjZtDtAKblEC0it8ta2OIpSaAjCEXtqUsjY9SqHK0ei4e3dxeR3gasaf2a9vGxcmGMq5YWvCoEbFdUYadQomDkDt2YgVgVxcfylg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W49vE/A5orjvHGqXL1LjXWxyyHEJz872mxY01MDMmT4=;
 b=WqJsgVpqS/2Mb4FvTNc/Uf8XXl/M2SBmg8hLaNoOGD7E9CC5BxZwdkybo5TZjiCtDUe5woeDuqKh2zYeO+7aRNpkyy6GRwTWQHsjdeBZuNQtHVmC5iydJ+Dn3MAJhThFmvu11BlctzRH5wWwpC7DXeFpomSy9a26ADRotLusyCwdIip2HOiwOMFS0xqWcVP8JYnwqjPMKoamL4JF+ldI2jRsEUv8YWzKRXDG2XA4zOgz9PaNTrJx9nqcQlnCFGJWY/JvpDu0ibd4fyLk/u+OSzWU3WyrSL+dQHQ8JPA4/P23Du9Tehvyb2n8Gf6+N5bRTP2h6eHNtYGb61w1okFp/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by VI2PR04MB10714.eurprd04.prod.outlook.com (2603:10a6:800:26d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 05:38:58 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 05:38:58 +0000
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
Subject: [PATCH v2 2/6] dt-bindings: usb: usbmisc-imx: add support for i.MX95 platform
Date: Tue, 25 Feb 2025 13:39:51 +0800
Message-Id: <20250225053955.3781831-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225053955.3781831-1-xu.yang_2@nxp.com>
References: <20250225053955.3781831-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|VI2PR04MB10714:EE_
X-MS-Office365-Filtering-Correlation-Id: 1129bdd7-8f3b-441f-8920-08dd555eb383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2XZj8hXi6QceqFphyA9xqgvNH/shc4GfVJ81qQgDUzOQqwF4T/qoS1P+q/5m?=
 =?us-ascii?Q?AHswxz8bNAcBwOiJE9w6EDN96NRWi9UFinskmrH2XdRnTxe3PZE3x8EegSl9?=
 =?us-ascii?Q?ZYollbcuYGiDq3lFj9z7u6uBMo2PPCJzHtT40uvbV5uTKsdjsCNsD4gUHktJ?=
 =?us-ascii?Q?jFHmB+NPiHuHYkitlXEigxqznIEzji8E4NAH376S54AYc3FHWSBmKhc9MzZn?=
 =?us-ascii?Q?HXzFZIfurWMm53SP50/ffvkBNl+M6kVE5A+aGN6mtDJN41OBZCRtyrACordV?=
 =?us-ascii?Q?oExeHCAdAB8KE6ZSXpn513QZWnsChKNvAx7vnoxhu0XWdIX8pk3O9h8/DO8R?=
 =?us-ascii?Q?2zcoWZP3yf/a2i+4/7Rrbgwr9oDdGjmeiDbpYTJiy7SjnrCg/wc7imFVFTwL?=
 =?us-ascii?Q?uVhADqzC0+GlvujFUzTls/x3pcb04a4VhHk31KqwtqLVck6TyPEsWbB2M9Zp?=
 =?us-ascii?Q?XLkTw2BZXEScoXKK61LtTavyB/7vaQUdnMJ+rrcc58eonnnrnlM/xukbYZJB?=
 =?us-ascii?Q?LzLE3IslM6AggKMTKYLq1Am12k4ZqPFm6bK4yrZumMKRWTdvK/By3F54zJwU?=
 =?us-ascii?Q?Vj10ZQdcu+EzYnYaNIflCGnNoxI/70TZmNBj75XPMCAdzmfaY9SE27upeNj8?=
 =?us-ascii?Q?p7z1yJtgo8w8gHAYa7KClj+K6KlYdQj3RrlYPKPQMdL/23KVaP+4+wlmj1Id?=
 =?us-ascii?Q?v63g0GCCk7tWP4TaeN5LGspcvjjaRXh4qDb5eAAyQXqQ4lqQbvsvupJz/xtR?=
 =?us-ascii?Q?PEk3+wGRp56nrA2na+tL26PdI2n93Z3ocZ91O+1C/3rcehij9/OVJ7ZEoT3k?=
 =?us-ascii?Q?vbEFqVL+dyCxgwPd6i1Pe+elF5ON8/eBlianNdJc5eee55ZACK7OFQEYD52Y?=
 =?us-ascii?Q?sDUCJQx0pdrcSsjKyXZ8yizH9C2zcAolorby4fJ+KxmeP30quU4E5fu4Vo6l?=
 =?us-ascii?Q?wc3pVGqsIV3YBksaDuXBCDAzaWuhl1DcI5jfRst36ZFJZTK/kZj5LCs72Kf+?=
 =?us-ascii?Q?a3X9Z305cluWfXdR79plofdmHi1xt76rqYWTb5F6srQvv4e9hyKY9z0gbwKl?=
 =?us-ascii?Q?tR6Ar0MozhEbFyui+9CJMtAiqcmRHV5Sil7lZW3isdROf2HGO7KV8qmpKk0o?=
 =?us-ascii?Q?Io3pHK7GrKb99hada3LpDW8z2Ev4tvHNucUSp+Iyezh1Zq2LXSTSheLiJoEb?=
 =?us-ascii?Q?zvTZr+lOipouKjcpPSrSXg0WcGSWAkZPpStgviNRQ3drzcz0O7X292JYs7vP?=
 =?us-ascii?Q?zD4eVFUl5eBuL5ckNOAU+6d/ZHww/s1iBXQ8ogSPs5cmvXs32k3CxOWZFi4x?=
 =?us-ascii?Q?8UwNtQuocAOHoFGRCHmSwQS2BBNxd/fPsPRs5XutaKuloR4RtCEDeSqZHiFT?=
 =?us-ascii?Q?9IMaOYIdUf3hek1Wo2xumSVB/zhTWIDdwwe7rQH5zhDk1QJWux+eXJLMiOwY?=
 =?us-ascii?Q?uZ27WPnmeJY7A8ZQe45W10is7qDhYptF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FElcKsHJRt9kShnr4QOzZnjNHTEb32808wn81osyn7/rTR0ushPbs4CYXqD/?=
 =?us-ascii?Q?5FpevTiE1pUH0QMfiEegSUbMuqaVZoi1hdE+05jlv6aEZLGzAOrCfoPeB5jm?=
 =?us-ascii?Q?zYbsgKmyWLamIhJ/AI7Zm96WNn8zRD50ivB0b+xp3vUV3g1NtQ0RnYoGpbsT?=
 =?us-ascii?Q?yc0atFnahksoMQzhy06Z2dnGiNFrTVNWM1IyiHJQtW1WsiwqXBPDTdEXmV/K?=
 =?us-ascii?Q?qHDD/h/Tg1qyi0qa7/YR/5yWI/kNiDikS/aUeX3gGR9jTudnGDlz0F8iaEz9?=
 =?us-ascii?Q?oX5fQhUQUCgnTPo9s6dg7Bkd32NoAKbBH2chyQIs2uAqizxTWTxGqZrcs1Gv?=
 =?us-ascii?Q?PCnf8+6FBVhfYfSPxwV5GltAfHO1U0jwS5UrNnI6BCHu8IpsuCuD/MArswpj?=
 =?us-ascii?Q?OqRve724niLl+cN0kwy1Is40oxi6NlM0hrp4YzjLqP+wEwBw9o7FioBtUYsN?=
 =?us-ascii?Q?lBxexVv9Lkcw9gC/xuii1e+T5Lz60pvfU8nKErQlWSUOjgvZpRo0wRlCP01K?=
 =?us-ascii?Q?MYE7nQCxe0jQ1UL/pf8ptZDfK84XL5PRjKrPQ6A9jdSd1+qu1isIT5W5K8Pu?=
 =?us-ascii?Q?O//ZeBhskA4ZMG1vtS/zsbuLOn1lE57NbkJM58NhRniRhWL4WJXiBvgU9dCO?=
 =?us-ascii?Q?XWuxE0pohF1MdrVb8GItZ8jRUYNbhE5EJrq7XRHhpwBfRGj6nCcCa49Di9hQ?=
 =?us-ascii?Q?ZNlX7LKVav7Tx2+RiJQy+CFC6EyXGkCEL9M4VLlQLcuDKhc6iXKj3THAM9/c?=
 =?us-ascii?Q?giddhOJseR14YceqClFanEfaW4Vj3fz8i1YUGan5ANAa/Elu/17bkz/ycJzw?=
 =?us-ascii?Q?WlggyfMY0S89Gbgx81zaC+h8AB8G4h5Yd9CposEZA1OcCS2YqmkA/1lm0f+I?=
 =?us-ascii?Q?xAYJagFJHY6O7tuQwZ6Rd/5sBF/wjhRY1T0B5or3RI71Kzo0Znl/hCIM8eSq?=
 =?us-ascii?Q?/3jaIxpDMNczFjNkyDTf/HTu89feokz2L/Ec5QeglsUFE5xj5qV6/TbaNEJ+?=
 =?us-ascii?Q?f+Q1vAN92EyFk9y+NCxowcyVOr8jX3sORdPV2WucfCI77NoCjWoJRD9Wi1pf?=
 =?us-ascii?Q?iHLMOH7kOoxqb0YfdLuno1E3FPJRHpwVVKjlxk0htKSUCCQufMz2gJ+SdAX2?=
 =?us-ascii?Q?gdPDa0TDB1SaoCrBG5Y3X7hNyOcVgVQVnm4Wuw7DD3hugYiC9DgZKqOFzbnI?=
 =?us-ascii?Q?+Ol0fOmGt4jI0SIvNDLEc5uig52Zaprb8UAl0xhc2GGeph3TVLjGTvAfSHX0?=
 =?us-ascii?Q?cqsI3mugcXfY1Yf+LA+Te+jMbvAnXqqohaGYp/G8G0NJ1CwTya8rW2Ar2a++?=
 =?us-ascii?Q?s5aghyb7SWGRDU+4p0HdocPdA0wTsovTIWhN60vFUMU+2GbYapkAbhfWVQZt?=
 =?us-ascii?Q?J/CfUb7CfmkNzO8JsprdUTjsE+xRvgK4wJSCGe5SqFEWx3Tb8FBph5F9vkYY?=
 =?us-ascii?Q?s69D7CRJ0fywXUOEAaJZKWq3bDMfQymFkDaBcDD6QQNk3q3Bfc0AH+raocgk?=
 =?us-ascii?Q?iYkw1MbITVWJn8j8zwNJ1qYXatCVDYiXMV+ZqCb3R1hAoc28KKjymK/WB31h?=
 =?us-ascii?Q?KIMGkfOnc6+PT7ThKPIiyBP7gEaFEME6G0Hln5/Q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1129bdd7-8f3b-441f-8920-08dd555eb383
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 05:38:58.8667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L5nuC5+EgmFyV8/zQ1EUPWVI8p99YqFxYDlb5k6MIFjxY18EU7mTdEedmWznv86dXRYEc7dAV54anObcsXkm/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10714

Add compatible string "fsl,imx95-usbmisc" for i.MX95 platform and
restriction on reg property.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - improve subject and add Rb tag
---
 .../devicetree/bindings/usb/fsl,usbmisc.yaml  | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
index 0a6e7ac1b37e..019435540df0 100644
--- a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
+++ b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
@@ -34,6 +34,7 @@ properties:
               - fsl,imx8mm-usbmisc
               - fsl,imx8mn-usbmisc
               - fsl,imx8ulp-usbmisc
+              - fsl,imx95-usbmisc
           - const: fsl,imx7d-usbmisc
           - const: fsl,imx6q-usbmisc
       - items:
@@ -45,7 +46,10 @@ properties:
     maxItems: 1
 
   reg:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Base and length of the Wrapper module register
+      - description: Base and length of the HSIO Block Control register
 
   '#index-cells':
     const: 1
@@ -56,6 +60,23 @@ required:
   - compatible
   - reg
 
+allOf:
+  # imx95 soc needs use HSIO Block Control
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx95-usbmisc
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


