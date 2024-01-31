Return-Path: <linux-usb+bounces-5698-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F09843E8C
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 12:38:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44F82295F34
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 11:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E6F79DCB;
	Wed, 31 Jan 2024 11:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="aeBlCBVx"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2073.outbound.protection.outlook.com [40.107.7.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E117176902;
	Wed, 31 Jan 2024 11:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.7.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706701036; cv=fail; b=OOeWmxeGhXOZwc41TmiFA3omPBZwQ3g5n0wIVKywjj6+FRg2PKyyZvSTXmU+DC+A1hbErssyLRdfemE4HceS0gOtsztbY7n7LnrSABxC4tRGCbt9/y1Lnnv3rGVHuhdTyBITO4TK2K/54D83/WKBujcCxCLzvoorO7u7VcYOVFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706701036; c=relaxed/simple;
	bh=x6mNMpDWvdxcsaRv5Br+kRnM1i6KWnVAjbcRprTx0Jo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LPG9lFayuQVA+O33fm+bZ0W7TW58hBjV1wKKzYC1czdS3/Zt03urqCVvCxslK4e5Y5CKJM8P0loK3udN4grOncxvPr9GFk4Dx4FfVxOSLZ4NjQBRmnhIKGbeGf2puvUZfyvMOVot64KI4sZPjmDIi8xruabOLVkKvP9wJ8AciF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=aeBlCBVx; arc=fail smtp.client-ip=40.107.7.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GE7hUQtPrBHkkkzzT776UYqw7ba9U0yQ4bpCHL0HQhS+bLpPUc+wpc4iBjecnk3QEzbQSCkyVLI7kIC0ZqzpSmKBAvlXMvprhowLUE/b1bPdW0Wayadw+SuSAYIOigT/L96HJRE1zBSpG9EceFFNNor8hADw8gZ3wohUf62GBu3692FuFoMxWxSajH7HWtN2VpnqX5q3Iq0qvhybRDTn1171ooZDhL3nQL+d4mTuFLlw7Ke2EWdY/FFvGqI6VN8FMQmCuYHIFqGsBpQMId5mP9OWi3g0Uy9UigGkoNevMshcKEOFK8JJxiuZe0ga5WWlXenKyU5yE+Y/dIk5mc6i1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ATC+DjzcCvD+Zsm9HoeG5L+JiKGUUcpJI5Mqoom8Vk=;
 b=LM/ODxgb+LT1DwA0BSp//XbQXM+wqJdGA86tjA5QdbJbet5nFvh+XvRVRHHwWSmE2FHTGBFK5t9F1pCjYkmJZ9dEkl2+jYzaZKjZ85bSxASoX7jW99NY6vV4+7GRjxAe91Mjf7c2SlgR2gba8/oElDe/pv5FyB/R4bf2080WV9EHI6gUkEi1DQO4NoIl5FIkqHarhVBCpIWdJVTK0yhGe+jXFXZfjKqR7zz8U21/18ZkyeI1AJmJYcEjFz/O8tbiKH2sGcI1TNiL22PWfGs+xbR3KXGo/ajeXpX1W6JbgnwjHwp1znrSdWZzOVjcikkmoa0yO0HcU4xL/5hwqTGrJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ATC+DjzcCvD+Zsm9HoeG5L+JiKGUUcpJI5Mqoom8Vk=;
 b=aeBlCBVxGKzHYYAdZ1KIb/R7Dh/EgrQHFUb/iRhpAr2UQPZ7C0YFp5G1RJ+QEMROO3aeVGuhv2TtNa7LtTFl+rxf9KbZNUB+TMAPADmfsGWCo+71v7c2Ty5K8ECc/igu4OthHEKg0TR0C+dv4hvzXpEycPnW2oJlabQdbczAs/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB9093.eurprd04.prod.outlook.com (2603:10a6:20b:444::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 11:37:11 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%7]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 11:37:11 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peter.chen@kernel.org
Cc: linux-imx@nxp.com,
	jun.li@nxp.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 5/8] dt-bindings: usb: ci-hdrc-usb2: add compatible and clock-names restriction for imx93
Date: Wed, 31 Jan 2024 19:43:21 +0800
Message-Id: <20240131114324.3722428-5-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240131114324.3722428-1-xu.yang_2@nxp.com>
References: <20240131114324.3722428-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0107.apcprd02.prod.outlook.com
 (2603:1096:4:92::23) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB9093:EE_
X-MS-Office365-Filtering-Correlation-Id: 082f6c97-52c9-48c5-13ad-08dc2250f69c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nSVV1rqFWssUWpLXxuxXmTz7Y546Jt/I1bKwtta0CLHGNSJyTdeKf+kfuItHupwhQTu3pmweR8SIXjVH8ZGCsPc5YT002qWcZ8piijwiZ/u1JR6xPNjwjncpbmr/eh11+kQXxBsYQtcaIb+6/Udc5YGEuisqTJacTMHEE/XX6W/pwCJAyiwOAl+OyOwKehEYJOTt0WT9thjJxTnd4B2/XtJeTmQRGxh1iI72z0ruW5Uw9DFwoIaXmoAWJgKDBqVKM+c0fnHjRQ3LaYJ6rWfvzgQLzD88l6ctC9vWY8IlDqx2ST0Qzp4sYtuAGwzQhCflJ3QTxUL+1uWgxdbD4ELXHHZbi873ppto+qZgN6zh/gEoWSB+NoWy6qgraWy3Q/pLYUZVjo0bNOZp0w2bEmlr2/CrQYhXuCtzhIwqzUO5eTrEmfrmIQh+RVkf0gvNa/0eXNwLyI6tKzOOK+xikG1tFKW41JFIe627+cMkgQv6lj7z6OfGGcSj1VKJNANJhcMzosqLmnEX3fM0JN4mpKq7b97hQk5YHk/z9FCjyXUbCOMe2ot0gDOdZjFgR49Fj2ZTcrM/MXDcUu3ndyYvozTCh+4Ly/72E+/nF+DtxHT4SmMSRM2gzLruu2mJxy00giBp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(26005)(1076003)(2616005)(41300700001)(38350700005)(316002)(66476007)(66556008)(478600001)(36756003)(6512007)(52116002)(6506007)(6666004)(83380400001)(6486002)(38100700002)(66946007)(5660300002)(8936002)(7416002)(2906002)(86362001)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qXxeHnx+hCwZzMUgxHCIJLMV+8WWBN8/6e+SZAia1Ka0agR4ZChRhRNC0Spa?=
 =?us-ascii?Q?VhT5coQHcB/UsKaHOsPM12uPfbs7c13zSms3YOgmFo13nHfBf5qzzFmiP+/3?=
 =?us-ascii?Q?L6TPiSq6toZYnraJoZ+i8ThEUZqZWHPkCcVTBAxzQXXTTL8s9dAqX20nFBVV?=
 =?us-ascii?Q?UqiwD2kEbFlQFIJhyijhRKUIea9w7dZRtc7jKmG7coQTdEL5R260XVfd6z4/?=
 =?us-ascii?Q?EjsLrWwuBRKqLJEWxG88fTQ1NBBI64KCb8iAw/w9DnIMZ9wJQSAsu99OudAh?=
 =?us-ascii?Q?1mj4VKLrEM7hcBnoFEZGQBK5+WFa1m+t8v2xTR+XGCwC/GH/cJCcL43Xz4tv?=
 =?us-ascii?Q?wOss5dqm33YGL28nyYclm1e9RTvDgfRnJq5ibQdMUzPREkn/ZYukidMb7z4B?=
 =?us-ascii?Q?WkSxGK2e8a+SDjDtKyeCvTyXrI2VnQ8gmBz87fnqyd3VOqRty2G1ISpl/rJW?=
 =?us-ascii?Q?R0I7drdyaxPD+Ys33+3nBLL+ZgNC71t/SPMgI4aYQxn/GTbL3n+WgxXwpCx0?=
 =?us-ascii?Q?yxzmqyqYSBF4IaRiX98ePJMp3gG5/jGSdiQpgnnqDE6OTAibhJ+0EyEqFdWz?=
 =?us-ascii?Q?QogAK/Lug23Zde3CZUl1WKAI4XJsb3PaHPlq1NoKGcRadHOmKCeeHPDzZWx/?=
 =?us-ascii?Q?67nNWH2hhDrY7i2x9QaP1Gg/OVJViocJehxvirAF7n+wGvVGJtfWP1panN29?=
 =?us-ascii?Q?2bpVM8tsaQpZdxnFOLbQ7Y7J0cGT/AWGsGv2xTz4bmxSxddDXYo/Na4aWlQi?=
 =?us-ascii?Q?fOYVxBpNxCocPvyuPQ4VfTIQ9TrzwL2zQfjnAYwUFhC/MFwW9EGISdI/xzIR?=
 =?us-ascii?Q?Tc2Tes8ZF21MY+HQbmcWTiLc+HTJ4MnWKL0/PGx05bdN8oqAc+yKxYInUVI7?=
 =?us-ascii?Q?kDm4hLkM5xqlonEbPJLz9MYtDaK4/veoMpmzeDTUe/HM/PGyYMyPbcxCFJsA?=
 =?us-ascii?Q?/5S0d94Uy4ZCgoCbJ1BeSwxEcFGg1PlFUyL01her+ISQJvTg8dnpwZ6ubTX6?=
 =?us-ascii?Q?pjF1u1yQ3BgWZrRKdZOJcHpTJwApX+HlutRBoLhLaodXYmFpUaffQtVfb0Ya?=
 =?us-ascii?Q?pKb1e9WwPY87+7Ue21ZsemrVSbCpR4ktYMTDGGjMYIC/NiR6xDKeia28tjPi?=
 =?us-ascii?Q?B3MJfKXCvNrW0p57tX3gRd5MNoo3TOQ1fLIHRdJeQtTsHQ8MttNIsRKdbNWL?=
 =?us-ascii?Q?xPo1QqPYUoJ6FH3ii+FxUr6zzvCWPWscr5CRb9VxURZa0nvxwijOHJONnTM1?=
 =?us-ascii?Q?ckk7bP4lfszJD6DUfGKf2zHSahtbq76GQBlrKuDHBJrEl4KzZxX93o+m0DnS?=
 =?us-ascii?Q?RcaDwmqxlDjqa2E9FTsM8f6vgm5kkZ1lZDWA3eAV1nyYnU4Uhq7CR9YTBjgC?=
 =?us-ascii?Q?ciFSxBs0Uwy6b9wu5G0qmwJe3OVygkokLE03ELlcJtJbhrVylh6fH//06DZf?=
 =?us-ascii?Q?YbaJ+btG3VYxWLbVWomRHa7L/oe2rxF9yhEf94Dyb/nrP9czlHAw+LvDXJ/z?=
 =?us-ascii?Q?UuPzQLvhDjUm0IGzSRJa32oqXuLhuAk8vKX1OasJ5n8SuD8GvVh/cZJ4dTI4?=
 =?us-ascii?Q?YNyNToCgXVAiTana6Mx3Yti/PWKOeHbjjQQgYLMW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 082f6c97-52c9-48c5-13ad-08dc2250f69c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 11:37:11.1857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMNkCwo3xQjfLibtYh98W6No5YUofzxkmNb3HLESBAO5l7mREWVoS2Ga1WE40q5TAIOApgrYEYojp8CbP8V8Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9093

The i.MX93 needs a wakup clock to work properly. This will add compatible
and restriction for i.MX93 platform.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
Changes in v3:
 - add clocks restriction
Changes in v4:
 - use 'contains' rather 'items'
Changes in v5:
 - rename clock name
---
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 6ad3582051b8..12466f7af00b 100644
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
@@ -486,7 +487,6 @@ allOf:
               - chipidea,usb2
               - fsl,imx23-usb
               - fsl,imx28-usb
-              - fsl,imx7d-usb
               - fsl,vf610-usb
     then:
       properties:
@@ -497,6 +497,38 @@ allOf:
           minItems: 1
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          items:
+            - const: fsl,imx7d-usb
+            - const: fsl,imx27-usb
+    then:
+      properties:
+        clocks:
+          minItems: 1
+          maxItems: 1
+        clock-names:
+          minItems: 1
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx93-usb
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          minItems: 2
+          maxItems: 2
+          contains:
+            const: usb_wakeup
+
   - if:
       properties:
         compatible:
@@ -504,6 +536,7 @@ allOf:
             oneOf:
               - pattern: '^fsl,imx5[0-3]+-usb$'
               - pattern: '^fsl,imx6[a-z]+-usb$'
+              - pattern: '^fsl,imx8[a-z]+-usb$'
     then:
       properties:
         clocks:
-- 
2.34.1


