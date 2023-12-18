Return-Path: <linux-usb+bounces-4302-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B658168A1
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 09:49:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F2DC1F21881
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 08:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8A810A22;
	Mon, 18 Dec 2023 08:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="lORdMNbp"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2086.outbound.protection.outlook.com [40.107.105.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE2710A07;
	Mon, 18 Dec 2023 08:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkpyuGLqBeFhXqH2qJXcbvYrp7vTuTTYQt0QWRWwp5knpAsPda9932ORCFxcj5ELL1IGPAl5nSJJLik9v5xo6LZu9qdepj1yFVphk+yY5cMBWobiTD01zRGqYbAxGWIIgs14s6976dWAilShqMmnQPfP78BXfg/sd+2pWLn+Risuk95fqFdf7/XrAdWRlatNWLbe4KtVS8eRsaPrT1rN2wYw+CK6rgwcBxieIp68OPVv5MzPUGwcSh8/L6Yr1cV+a7uF5PeqZJ/2BRr59K11HzgvEVq3wM+9snyUNWafOiwJQki8eR3+La79Ta5mxvvOaPcFtE5HnVyNUAkpunqkwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVvMQU2AJDFke2hX3E0OfW3xZpfm0b0NKLY7HtzRwEk=;
 b=IdWTXdiM5m79bBOrUvEk1bJNlACYaVv6IQDMFnoU+SjJIcfIbIJ2NHTGJpMSjFwh1wrd2qyR5VdpH3IgSjU+QMy+72l5DNKutT4drqSB7y80+YTvgmvNqBdSnqOBXbF0lu6OIbuiyp91F23GV4IJ8GOM0b3TRf/gapWJsIR34uUACO4NRwMcankj0XFjCYLt0VsR/Cgxz4cXrq9wOwlB6Y8AnYbp8z1d8NgNchLbR6dYnmjLo96HbUlIoO+w+nryW65FKee9aNBW/BdLdMXaS8iMpsiWRwDW+zbgLAsr4EmVYNC9rtGH3hZD1HPA/ayEoOVf05Ct6ME3tq2+IJzo7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVvMQU2AJDFke2hX3E0OfW3xZpfm0b0NKLY7HtzRwEk=;
 b=lORdMNbpQpzhxA8/v9nWwVpMhwPvMnCREIvqkzJux+sRrLjC9oOeQmjcb9HXKjEmaa619gR6QuYr5Oaye3EAnPIQCrqZ6x+LXAeKSgMajWiwgRvZrIf6VSCSUw4euf32qN3fqt9Aa04ootBhjGyglwQ+nqHLNIYeUvmBvnDcMVc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by GVXPR04MB9803.eurprd04.prod.outlook.com (2603:10a6:150:111::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 08:49:14 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30%7]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 08:49:14 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-imx@nxp.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 3/5] dt-bindings: usb: ci-hdrc-usb2: add compatible and clock-names restriction for imx93
Date: Mon, 18 Dec 2023 16:54:54 +0800
Message-Id: <20231218085456.3962720-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218085456.3962720-1-xu.yang_2@nxp.com>
References: <20231218085456.3962720-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0189.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::15) To DB7PR04MB5146.eurprd04.prod.outlook.com
 (2603:10a6:10:23::16)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB5146:EE_|GVXPR04MB9803:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ec0f1c8-92b6-4b94-69cb-08dbffa6365c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fzirTo6bIogctVDidrtMHcguYZJ9oCqXU3lC7HAAowKVunRaIVSpDAcOon0UBi7rvpsWijMZp8J4YQGtdYt2VnDjCSOI9BVUGtlkOwK6CX7tUAliJOp8LQ3J0nE17lI2wKMJG3KHHQClMh2TssdPej7EFqJI/u0ZOHJhJrN23xb6xuF4NV2FSY4AZXMzl1+Hue/7W3sqNKm+r32Ghwf0kZZbBOftiTvaoLsEXcWFs5AXxZL1rMngC4Tw/GhgqBWoVzVGdhZln1uONm+5EOzMaBLQDGSCXi4Xso0HaLxAxha735AmgXvu0SBxFzkwMWo0beGbD6oi452A86JqakPHJmjP0jboZ4uWxOUP4kMpMzibuH7e8tparqM0ZfwF2Ive9zCfSeKUKz3G8DwGI5i4D0Ksnt+GWYDRxfJpKr+qRga8yj2Ua0Y7MDNy4bu72Tc559AmdgOHZsdN2HF1sC8715NdSe90LwEGlFydzBriS/wCsFR4mT+O+WpImDMbC/Bu4zuTo9DCq5syv/tTCYVwtLiErv3oc2lmwlEpsbRGzeW9y/oxYWBBzXGWIMMAvext3wqKq2Y3Hqn0y87s+pgdBkI1tOeLm8DDmgLJ8LKbF24Mfj9+z3bnkO4rwnSCqac4i4STa20hr1wBeL+5YzCUUC7BmDwuFTrhSSuJE1rgUeo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(366004)(136003)(396003)(230173577357003)(230922051799003)(230273577357003)(1800799012)(186009)(451199024)(64100799003)(6486002)(6666004)(8936002)(8676002)(4326008)(1076003)(26005)(2616005)(478600001)(86362001)(83380400001)(6512007)(52116002)(66476007)(316002)(66556008)(66946007)(5660300002)(6506007)(38100700002)(7416002)(36756003)(38350700005)(41300700001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ho9yCm6ZCRD3KmL5i3TtVrYbTaYFHBIfWswqLDJO2Il74esNYJXANcv08G9s?=
 =?us-ascii?Q?BXeuvM0JiQvSNZuL7w2izHHxdGg0tKGZegLN1YPLHyE8pyjR5+U4LGgtzEUI?=
 =?us-ascii?Q?6xZK+775BG1z7Z9XU5x7EHCUeXqE8/cb8krLBKRQdNMENPgvFuk2o/2O2Yu9?=
 =?us-ascii?Q?YYJLoncvQLYZIk9Y4HzBvKd4HQNA8ddViaFL6Y2mammIUP89tY+4izSHbr0H?=
 =?us-ascii?Q?3pT/beA5npiy9IMFOGWxMrM5W/DvZfn/BwfNYnynz+F6y6zZv2rsdRpqKMYP?=
 =?us-ascii?Q?Pcenfbb+2orUFl+OypCpAfFzVFaKKC95pB1JfIRu+7L1OTEqSJOOyZVz3+wA?=
 =?us-ascii?Q?RU3NJKDwEwmio/gCg712I5thhtCj7MEbrYxvA6vAu3/NkixPkRPPHDbRiLTS?=
 =?us-ascii?Q?yxLA8sjAzZaFXB8Yg0HJoVbYknuJwwTt6RHozrSvEvg1SySWh6dwVA2wY6RC?=
 =?us-ascii?Q?P7smQ8gJGtqdizATZLdsY971se18blcOfGOHUmPik4h0Gkx734BMs+S7FCG0?=
 =?us-ascii?Q?XBwrStfg5t+f68z0xf8OztjXkZLLKJ3UBwql228b4ZHcrCHmJSc/p2W4HgEV?=
 =?us-ascii?Q?3O6K4+0p/7w2JXGTa0ZHz//iPPfswy/TRUtpWVtgxLrklguN+H/iQGSo89cF?=
 =?us-ascii?Q?2mkXgB3rhcAC775hzsUafGGxBellJh2KY+VdHSi74FvHWgRl5laju3SWUZtp?=
 =?us-ascii?Q?VqEU+FpOXtLVHbswKGvvCyOQSRYEn37sROgsPOvRuDTEcohA/CeoNFo2JXbE?=
 =?us-ascii?Q?1FJaq/ULeGSipTtKTWqJ5IGfa/o0fomSRtYMaRKyX5+ZZJtEo8TogP0G1IjQ?=
 =?us-ascii?Q?kY2MOR23zuTFQ1ZKqwGqRImFAN/0EDoZqp8aqL2V4XvNGNC2LIBocgt2pO87?=
 =?us-ascii?Q?Q6E5wrwhV0Vub+cHSAHaBmKYAkiyCAyE3FFggk0E7XshQtH90FTpe+exOalP?=
 =?us-ascii?Q?NpHCOPK06ycuzMWZWRRkGZ74OzKV7ScIIwFvQoPsgFodZFNbpIi9yjy1ivY+?=
 =?us-ascii?Q?N6/FK6/R9jfXB+VBFXV2GuLuoL5bTxi/MsOVnh0BGLU5FPGyqvsJfrxeoi42?=
 =?us-ascii?Q?hcplgAcE/BEhroG5k3vCJpEi0j2bBQ1FqhjbOCD5OuFvrqb185Uj32aKn/uB?=
 =?us-ascii?Q?BPxGFR1LbXMcTr7FJI6eNyrqxQE20oUNrhUrM8VujP8OhP8FeNlNVFB+utLL?=
 =?us-ascii?Q?yZc5c4YByNQCzjA6EZ+RbXmaBCLDe7qrGtA6nFslwejvQwY7R3cgpYo6znW/?=
 =?us-ascii?Q?c648XRyO6GIB4P7KR4UWVz6cehAcXXyY297WE1c5fR99w0dAR8bwLInL4Sq+?=
 =?us-ascii?Q?vtvPM86JnOvGtfts23FPwAIpdJ7vXO48oU4YVny2qL3aEx4TAqroia3W7NMs?=
 =?us-ascii?Q?XWvD19rdbGbNMhJqZ6WwLMv7B5QH+Bocj2hm0qgwZOQX7D1Ikgn7id8RVnEi?=
 =?us-ascii?Q?eT2wi3N11ElpvpI4rRZcZIoKJ9eCKcZ+Jd6xLt4xEVfzcEfrzJhwe4YDgbQk?=
 =?us-ascii?Q?oc9UbS56hI4P8BXGzKx1MEhZG7+dyBHKtwZBmao29bLJ4WYM4bAqrAI/wlyc?=
 =?us-ascii?Q?QJbNYxxcUk2CGs4gKobnWfzUvhnr4lJTF+WhhVbE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec0f1c8-92b6-4b94-69cb-08dbffa6365c
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 08:49:14.8569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6WESg6SG8OEzbocl1GA8u1TegOK1TE0lvOyEYuWf9SGypbqALyZbqxU/d2DBL9Pubci6Ik6YYqDc4MO51WvCdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9803

The i.MX93 needs a wakup clock to work properly. This will add compatible
and restriction for i.MX93 platform.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
---
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index b7e664f7395b..4e22b369e43f 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -57,6 +57,7 @@ properties:
           - enum:
               - fsl,imx8mm-usb
               - fsl,imx8mn-usb
+              - fsl,imx93-usb
           - const: fsl,imx7d-usb
           - const: fsl,imx27-usb
       - items:
@@ -411,6 +412,17 @@ allOf:
         external-vbus-divider: false
         samsung,picophy-pre-emp-curr-control: false
         samsung,picophy-dc-vol-level-adjust: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx93-usb
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: usb_ctrl_root_clk
+            - const: usb_wakeup_clk
 
 unevaluatedProperties: false
 
-- 
2.34.1


