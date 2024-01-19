Return-Path: <linux-usb+bounces-5252-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB30E8324EA
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 08:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4031EB20FF5
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 07:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FDADCA4A;
	Fri, 19 Jan 2024 07:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="qUL//4Qi"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2051.outbound.protection.outlook.com [40.107.247.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A1E6FB8;
	Fri, 19 Jan 2024 07:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705648420; cv=fail; b=pT5+I6sCjwMKLwtET8QeLJdAhZGqdEtpfJ9hDYvzEoZWNsnViwK/I3gyprHMLfb5oNC53zljLnMUsrQSn1sIGpfCXiifr+P61WN/Blp5+1m7MWi6S3Vxit1QI/T9jnkjgeR/+Rsaj4vE0FXBytZALexJu7e7QKXnOZkFAim3RHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705648420; c=relaxed/simple;
	bh=twieTJLcqCIKYvGymIUEEIBPcLn5OH/Rpggw/z73jGY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=op4hV9JFq+Pz71Nv+g/bk4qJC6B31B8s8JeLS8LSjxpoEFDEQhQpXDV3GBW7EhKsOMlv1TFiBUnKTTIVysbR+zOHO4Yzf+7b1V340Xfki7i9lrLe2Rrf1Xsma5+5U4mNxen6pX0H19r2OvxZjVtrwVfICY182HSbYTv039t7JIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=qUL//4Qi; arc=fail smtp.client-ip=40.107.247.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AiipJ0tErT9TVDo+mdlBMhLZxNBehyil4jPB0tucHx3XBPCNS4+pf8rHEbtDiai2lhgo7rDolXvJtl6X1AsA0QBWGrUwG8RNrKjcEWwJSUfwWAetVyxa7US3P0LvCCVS8JcRzkcHShqWJqSVX93htWrsulhrkZROMDwJXNZpaW7t/bokk3M/OX9E4JAtA8t7l38YjXDfXsxHvEc1xabSsJQ2kDyD8a3wQ+S06/rN8afUxd9aEN77n2Zvo6O2z/LzpCM0EwLPLVKut08AlynGM3q14wyhYryWnWUNPjgqsU4SsIFBLrthr0iLEqXBIgEMZD3CGGRzs10nflyW2EZSWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iod/7ZZZ+8GBLodqyA0NJ4bwya8NaDqKKmZ+P3A5ttM=;
 b=OKOR31tHmfkNx91DFQUwWHP3epV5069ZpG+71bFkhBOes+x2rWWQsMEhkFErxE4D9Z6/fPQapWC9BSmCE8kHLff7WlQJJiYwJRGOjlzcrD3XwbqT98Q+4Wsj50SSSDoalWA9NIpzk3xDZKPSFTJ3/RXg5xJAdq5YrfWCkIVX1Zsxnf+qFh1r2Vi4O7nc/NpPFnXswcc4tJmwD6XW+IaZGXwKUOsiLtugA8ExYfSbVhNzOAIGR0f7xY7E442Oa6B3dLuoXnZO1PZlrebdTeZJqs/UTboN0C7QdOxT61ANA6bMUbQ2iiEX+boosICXanJX2Wun6GkehC3ENdDRORQzoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iod/7ZZZ+8GBLodqyA0NJ4bwya8NaDqKKmZ+P3A5ttM=;
 b=qUL//4Qi9wG5EcK3blWX4Bz9RCdYBSb+Uh1Y4J1vCvddGyKDSLu5adMAKK8twCYSaT4WkU9P9qBt/qR+HbN2Na7CWfoBiyDy38enI7jJq80KF72yyidfggxvmoh7khO4uv/37kbGBXe02XbXLMr3IWYiTA37+ToWX3KrrhwMDKE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV1PR04MB9134.eurprd04.prod.outlook.com (2603:10a6:150:25::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 07:13:35 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 07:13:35 +0000
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
Subject: [PATCH v4 5/7] dt-bindings: usb: ci-hdrc-usb2: add compatible and clock-names restriction for imx93
Date: Fri, 19 Jan 2024 15:19:34 +0800
Message-Id: <20240119071936.3481439-5-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240119071936.3481439-1-xu.yang_2@nxp.com>
References: <20240119071936.3481439-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::7)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV1PR04MB9134:EE_
X-MS-Office365-Filtering-Correlation-Id: f2f5b8e7-c40b-4580-8dca-08dc18be26bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HzSPMZTQ8gOTemH4jpjlHvaHa3o+GvrAjR9w/25k0ZOdJEIf7G/brKcPRBVly9OxMW9VnsnqblzFrjplXwke3C2XLANWJbcUb21lFjR5zSE/zmg7g9/qB3CXVNjRLIT9tM6uAPZ26I8CSuImithpnX7yYoA0WW2BtilieoU9VMcgoq78A0KWkGRcOuRJ1jgkpCNSsXtsLXIA2MJgIMl3Ba8dlQDtt2CJ5mrIAKoZ3vb9e7EZdECUJh2N/Q0bbdbsyeFuP8zlQqqVxeZqIwJPPYRkPNi42G/yR/GfSamMEJqiQ1lfXLQ0JdLnWHcJuLEHDpHL9Sm1JulMFOsM85HUv3lJyFrYjLeCm0ajwtZbfOs0IinWyqWawzVDnqkISK54h98axO9ftGz6mVfElEhQRrQrHuO10RljixPmQm0T5JRUkAL5zx9LxBQQPsP11HWvCptz1jA5OyWN9s+N836SQWyASBLfBNZkZHT/UH4tcNNO4214O607DOOOfKCD+irC90wNBuSiVdC8gPMQ4a9TR9cpLO3lWJLlIjdUGDB4YefxFPWQU/ev8BVokIPUPcWqlEhe3Zt41/CcIbfilqepzjVR4QLqMS/fEe2B7M6pmfn2n3fHCQ3DLkQp5njFA9F7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(41300700001)(26005)(6512007)(83380400001)(86362001)(36756003)(38350700005)(4326008)(8676002)(5660300002)(8936002)(6486002)(7416002)(52116002)(2616005)(6506007)(1076003)(38100700002)(66946007)(66556008)(316002)(2906002)(66476007)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e5X9mZAtKk9RUwVKYDZJqLdPItjbrKwjnfiqQldJjDj1cDcUFB2BNUeU2ZTI?=
 =?us-ascii?Q?wL3Ekpb4LiBDREgdf1N2L6r4NHhxI2abIsgOt0uCRauYCpKywy7j//+KLyb7?=
 =?us-ascii?Q?IGUvpBYc+rfkx/Vqk8ORAxH2iyvRym7u6G74CtlNGJDXSWkBEg64sl0Yb2T8?=
 =?us-ascii?Q?UKq53j/D3bgcqSrq3Sk+aoUKLkSAeHGygk9AyalTu3GOkL2w4QwnKEu30nHj?=
 =?us-ascii?Q?WgjhwadTI/0LXMUJmzjgIHFLNmXGmFlBnxlqMq/8suagLWr6aS9W84sfZ68m?=
 =?us-ascii?Q?q0GPSW06Qxd68zaoD8ulg7iJHeUxlKHUnDrlRv215JnHmnHGcmukZKsZxFF/?=
 =?us-ascii?Q?21wkqVkCLmEktCmPuYSFd/Riyy8jN7Y3ph2OUi4B9KYL3FlNQjcgYjRnip9+?=
 =?us-ascii?Q?qsB5sY0gfbU/nGPIQVxPRixY4UpbO+4n4SWlw9mgD7qkBcseQlapHs0Ztj67?=
 =?us-ascii?Q?m2YTgmefFefJFx/5JyG0nImHv0IsO3R//Zh7l6Mk1Wnl3lbkOesNm3YB/Rny?=
 =?us-ascii?Q?mxN9cehW+4zPI1OLPjCVPzd+BE4rWvjETy99vEVBJX2fwLQzVWmIxD829g9g?=
 =?us-ascii?Q?+z7qsWcNcjDDrU/PoscKRNgEiaCj6iaCRf0VmTbgnhswnzpiqeWLwvbPJsQg?=
 =?us-ascii?Q?qo9kQNZhSxkh45VE0Bbww8tyNvdTi0uPFKKHj702AdoKnfQ3vdoIqJh8ocTP?=
 =?us-ascii?Q?EIWIvRBWq247voxfVskEWwnr3tPPX18jPTDSj/mJJzZXfN+aS9o6BQto/xhP?=
 =?us-ascii?Q?Hra/j41zr5DPdb4YNbpcqBQE1hsJafriR+7o+kmlMWbn1bxFO+z2uboWlFLc?=
 =?us-ascii?Q?nOKERtFe0KtnVXuVYtq3IoEjVeMhsFGrcLXSh7VCGquFCq+w8GmbgFvjh8e3?=
 =?us-ascii?Q?TjV5bOw76rENHiQFvY1M78W7VCkF0BRdfJAK+d9Ye/TUZ/ph2f/tThNTfIF0?=
 =?us-ascii?Q?/QFCe4CejZoYzM3YSGCDplWav58k7oM3XrT9YW8lZ07E3fVT/BtXEZZwpeb4?=
 =?us-ascii?Q?dOYGXnAThzIH8t01h8ACYaU4+USy52g08yrBMSRMNWQfoo/G9thc2+NvN38w?=
 =?us-ascii?Q?c2OD4uLzK5X+CHFdWrDE6AOy5N3X9Bq8/g/qf82wyzgpqN58yDoxf8/l9DfF?=
 =?us-ascii?Q?FGeEm8/bL+/jv7+Ddir8ixzn9mf/9demwerKbELwauvhrpbkBZH3aZu7PbBS?=
 =?us-ascii?Q?WipP2k4KewY28oQFydfWTYlwBB8B65/6a5/TufqO+6mDrXGyto0V2k64/hOn?=
 =?us-ascii?Q?7lMTxQ6M2V07Ed/qN9epIrYxSEMpF1KQOxFFpCF+yF3hm9f5+p5ipk/LhRKi?=
 =?us-ascii?Q?QkiCAt+oML1IWVbL77/fkrYtNayjjPoGkVQrPrem7JEQFz7F5RAjEwyHrRBT?=
 =?us-ascii?Q?9ESGiQ9M+G8SsLKcyvKiBOQ+f2cn2rKC6NzqAUq8kx8zO+c/Kbd0o9A0uv3G?=
 =?us-ascii?Q?6VlRsm+8KEcuLzlLuubUiQ1sr1YoQ5Z705e5SIWWHPNoAN8SAZjsz72U/5y7?=
 =?us-ascii?Q?AT+5z2N/xgGSD05Ss6GNNYLIrm8KV6CTl000vAigbzvnm8VeE1ubb2xn6iUS?=
 =?us-ascii?Q?sHc9hCW91eLZZbdX7LLQy4p1oiggnY5UKNOwzvwh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f5b8e7-c40b-4580-8dca-08dc18be26bb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 07:13:35.5297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: seBORlK3+QR2vn3NCr1It7e5yc1A2kCabEn8+oYLPVysRbu/obHmfjHLoK/MFkMF5YTnOtWbuueZYzJA68GlXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9134

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
---
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml | 47 ++++++++++++++-----
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 78e30ca0a8ca..a86cb5de1688 100644
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
@@ -455,19 +456,23 @@ allOf:
   - if:
       properties:
         compatible:
-          contains:
-            oneOf:
-              - const: chipidea,usb2
-              - const: fsl,imx23-usb
-              - const: fsl,imx28-usb
-              - const: fsl,imx7d-usb
-              - const: fsl,vf610-usb
-              - const: lsi,zevio-usb
-              - const: nuvoton,npcm750-udc
-              - pattern: '^fsl,imx5[0-3]+-usb$'
-              - pattern: '^fsl,imx6[a-z]+-usb$'
-              - pattern: '^nvidia,tegra[0-9]+-ehci$'
-              - pattern: '^nvidia,tegra[0-9]+-udc$'
+          oneOf:
+            - contains:
+                oneOf:
+                  - const: chipidea,usb2
+                  - const: fsl,imx23-usb
+                  - const: fsl,imx28-usb
+                  - const: fsl,vf610-usb
+                  - const: lsi,zevio-usb
+                  - const: nuvoton,npcm750-udc
+                  - pattern: '^fsl,imx5[0-3]+-usb$'
+                  - pattern: '^fsl,imx6[a-z]+-usb$'
+                  - pattern: '^fsl,imx8[a-z]+-usb$'
+                  - pattern: '^nvidia,tegra[0-9]+-ehci$'
+                  - pattern: '^nvidia,tegra[0-9]+-udc$'
+            - items:
+                - const: fsl,imx7d-usb
+                - const: fsl,imx27-usb
     then:
       properties:
         clocks:
@@ -477,6 +482,22 @@ allOf:
           minItems: 1
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx93-usb
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          minItems: 2
+          maxItems: 2
+          contains:
+            const: usb_wakeup_clk
+
   - if:
       properties:
         compatible:
-- 
2.34.1


