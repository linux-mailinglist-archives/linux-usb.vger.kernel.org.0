Return-Path: <linux-usb+bounces-5251-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5038324E7
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 08:13:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7630C285342
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 07:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8206CC142;
	Fri, 19 Jan 2024 07:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="E4Ybr0Uy"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2040.outbound.protection.outlook.com [40.107.13.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A706FB8;
	Fri, 19 Jan 2024 07:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.13.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705648416; cv=fail; b=c8iPMUBFN3qdHyL1ngzT40LizEMMQj/WEL3bqwE/GPIU8qQUiIfyd2EhwIIwyYkYayA1Nh9GF/EXdpsET3OGx0kazBKJf6n4VCfKQHHrS/lZnVg3Cj5gMijftPwTfbw9JutFkV+GDKRBlZrCxwWDAdbEuLklgeDiHYJnAIVaBDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705648416; c=relaxed/simple;
	bh=7zigopz7ncHDBZG7sHH9JzCNfaUgM4SaphbYlblx4Ms=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oi92xryEMrYaNqnkPzRNlNCvz9AVjmTrVa37elp1d/LH/+wpHvt8WYy+YBMZRLIoejFMMfw2lBxEGLN6wI1F1HOx3yGDYyiKQKakgcdeEE2pd2rI0IUffVji4C213nMRv2goCfZMRfwL9j2vwcJXlcQsBidke0Kgsa1KO8/eS98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=E4Ybr0Uy; arc=fail smtp.client-ip=40.107.13.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=atVg2y/wJ9gol8LKZqohO0uw2S01/u10vujNBzSioJt5gg6WADSWxtEtGiYv5XNXiY/CHEm+XcOV/mb3iM2tuogc1lgROMSTbBdJOm4wdKERyV62cSwbXolICKFampvpJFVwtDgFiJB2mqZGi5IbyZMXuZJF0jNAVs3OYe1SDBo4G9zUdUt2iVLJ3NV3xwUk/5F2p05uhWlstF4sg078SIepBr7uFUYIT9gJQNpYHG0+Idx2fe/pCReot7L94XGJoQcQmwmHH7HoObwA6mrl9g1w4iViRVLqSLVVU13NeSLZaODI1neEyvofVK0NbHZgDqZpB5C8WLv0Sl96xCvCWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7E3MKFsuK6VLew+/qqk1S6m3OPNH5jF6YRiUJf52SHM=;
 b=FrWgAUIM4jk3g9wbq864LMRMcLd63Qr8quXLd5wsf0VwH9NyGGBmDmKI/GM8gMHAz32Mkcb5iYjJfZlIUNHYd5x0GXUQYanV1bF0EMkD7Rc1g7M6HXrQn0bY0i9UsUsexQBILYGLniYJxcvAJ/5c9/7+GN0cUAkRyskGThMeX19vGf2RCmH8mzs67y0mhlgRMkc/MAyYEHjd9LZzJNSxUGGhCxbO3CjTBZiKCi4ydq1fqDD+gXdxhZpNtmBob7cI7ruuA1dh6YItpPOOiE3YSIPz8LUGnDcpeAap+sAr71zZfSLqBujJiwIaPDG2vU/3TZ/9RAd+MZRineMkCrEe/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7E3MKFsuK6VLew+/qqk1S6m3OPNH5jF6YRiUJf52SHM=;
 b=E4Ybr0Uy8KPLE8VDC3ZM75zmdm4BDOdVS2IXMPrK17OhoCl2mw5n3ULuvbpf9D78UzCyoKZug7EHwMpxf2TyOArzC+YUYWPlG09/H/1R9Mq62O+EeGovljjR3UQfuXPAN1SUUCwKxP6xfiEM+6Z54iq7vgFHhaewjBxiPwRfbSk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV1PR04MB9134.eurprd04.prod.outlook.com (2603:10a6:150:25::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 07:13:30 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 07:13:30 +0000
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
Subject: [PATCH v4 4/7] dt-bindings: usb: ci-hdrc-usb2: add restrictions for reg, interrupts, clock and clock-names properties
Date: Fri, 19 Jan 2024 15:19:33 +0800
Message-Id: <20240119071936.3481439-4-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: ed314a74-101a-467c-ca43-08dc18be23f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	afa1N2zzsw7xodmgHTsykR0Z+H38YAO/09YmjalSZalFd6dq2GcnjsVK5DCPDoDD/xLU5Gsc7YAqiRoCoh5znM5Xtx2L2VykDpkA7tHNiRdgc7thCIdcdaOIMPhj7YFQSMwCZywylRTSXU8LW5RiamvUaGDWsv8Vt2eIRlZI/oJv/q0f8CxseOO2fj0RCtIRKi1z4oIC4IhetmczhLfwkZTKv0nRKFRE1BrbsgdRaLl44XzcOyQUsvJ7HyutjRjaGWd10uJTJI+xGpw2cGuhiV3uHKWyGvYPtLLTf2XSkXhCJG8N5jqA3HTbJAU4FFGHQ4qx+X4dZpeza+YQaeNTbQAldFujrQLw+bfqPdShlcd7JwfqG1wrmpZBvXS1qdKZ2n/WNF9/EYX4RwQ9id43gsZDummd1mo6XTVZx825dyWUxB3l4ggDsfp/KCDFctyY5QduAzAd+7PpNbuLpNAvHOK6xgj7c0IeqFd/WDHR0e6T1nFjxq7+3xKdepNYiyRZ+OlqjoaSo+KfZScORo0U9WA1sBq6cNHkyCw94uodq8DHvbVVpsgtinR1BENWP7CVo2bvzc+twL47pY72C9Ljc3eTTYz4oDrHnxGQW5lv0YKbIqDT9MQ5qMftfvB+sGzu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(41300700001)(26005)(6512007)(83380400001)(86362001)(36756003)(38350700005)(4326008)(8676002)(5660300002)(8936002)(6486002)(7416002)(52116002)(2616005)(6506007)(1076003)(38100700002)(66946007)(66556008)(316002)(2906002)(66476007)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Cf6R2c7VqddkdMru0fSRB9+Fv5RtKn4RCDFdivOEjrKCEG9Pk0B6qv02Im06?=
 =?us-ascii?Q?JmViVo58Qaf6ky1It0BNSR0tL9USkJpBAblb23SkkJTB11tJeoaqJr2inmi/?=
 =?us-ascii?Q?GlV6TItQvXDi4j1dcSNe5ppR1n1l8vq1mbo/lk9wjoRICok0mspiS9iPGxUO?=
 =?us-ascii?Q?0rQVvlcNmr3cCvxuCUE2oVO9oPrT4vWJqr6OHDMSUA0fNN4AuNwtYwzwmjTi?=
 =?us-ascii?Q?gnI6xIjBk8V3iWNqcbAC5b8O2aSjqDG5kFui2ZSmtu5Q2qthJjnY7vODSF5C?=
 =?us-ascii?Q?58NzzKlCu1jXo2IT7GuW4AxFJy2Lm/GcE1otQYiKsi+Rrk/XzGoPj5bXJOBN?=
 =?us-ascii?Q?xYxF0VEasUwyho/oOgEFKwbEV+SInJPxA2BipzDTMNObR1vbWuOXW1zUySvQ?=
 =?us-ascii?Q?s3lsSLkx9R64FUNPxXFes29ZvMrByEA5fsO+Wen9LBjA8NdD2y1yOQPFiPLk?=
 =?us-ascii?Q?Jr+K3qTJs5XDDDqB3BOgBEF4VCD5OkvYdkTcel8a9RstX+4t7Bwjnsi4FaB3?=
 =?us-ascii?Q?77o0lAXKn3ANZDktWwwGcuSgTxee2mEzVh1ptk1kxNnCGutmdlU8AilGKUVH?=
 =?us-ascii?Q?sgSN2KVJVfp/GkcNu5yMOi20HqsuWsDMTCzp3manGBW5j7E5ORHKIRDEviyU?=
 =?us-ascii?Q?ymeGiWv0BO77bMkzHWLtmCD6XAqqUQ1MPXl9A77sFDI1eGqOvDzdW82tCWTt?=
 =?us-ascii?Q?UxvYbK9BldXLHKWSmRv9BC55ezvdchMh4BexhB37G3RvRp9R2PvCkXrxz99a?=
 =?us-ascii?Q?2wwFz7G+eAShdIfPDEhbxqIV/hryfxyuRqTFtKbjA8Fp+gEVJKs6XE51MHYq?=
 =?us-ascii?Q?I1yjeCLXiPHso/Ngu/1oDautbBOghajZYpNwlMll1XM0Nz3IXkgHWaNUMXHi?=
 =?us-ascii?Q?lTqmW5rPWX5/JFr4NeRv1E1DebuV1ZDtW+/Ufa2pVK5ZSI31kjnZP/WgIEeK?=
 =?us-ascii?Q?a5QL96RKwroye4h9EUMOHAGveYCbbkOgHpIJpmRO93UNAUaBhpuL9VAey3H4?=
 =?us-ascii?Q?138SqnAHqppsXU0OtKXrKjWnCW0x+BfcgZf3yA7z2JOlVRiJaoC3MLE7fZrC?=
 =?us-ascii?Q?rNv2VnU/HJ2bH73kNSemZsIoAV9C4gyMBLyEf21nbCVFT9yX4sydJ1a64kMw?=
 =?us-ascii?Q?4WH2CvsokJToDs7tNy4H0xOTGTW3NZn19+QnU3ny6A+yLzaDXM5SsSUy7vGK?=
 =?us-ascii?Q?oFEiJLupoq0pM8j1IJGZul1DYK2sLv3RCVPBAyL93YbiVZouT7sjbszZS3s8?=
 =?us-ascii?Q?07LYV8Z40M56CH9SPb6+HL382Amh0XeNP3UPWetnvunAOOP6jD9/fb9WeYja?=
 =?us-ascii?Q?xAhsghNWUgALEVS3ENiXyVVA9+OVzftJd60wHflrP8wCs1HadILliSgFFj6f?=
 =?us-ascii?Q?osSb+psb358Cauh4EW5xIRnpDAY7RFaZFhZcd8/eTGykc8kZ5ujkcevTld7d?=
 =?us-ascii?Q?d/ajiB/BCXlhyyPnxJsjE3aHa1PGdDiKR0dZdjjDc5N6P5u5zloq+toANZ8z?=
 =?us-ascii?Q?ILwNtVZhuN4Oy6XW/Rrr/sQrBpVjwAcqUO+dBUAK8XdBxzn3TsJEAsg7j/0t?=
 =?us-ascii?Q?VZXSigvO8S65XhRN3Zk96GHtu3UkfinG942kOvq1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed314a74-101a-467c-ca43-08dc18be23f9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 07:13:30.9136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kgShmSkxfxOLgI+HU4ikamsQnFoivaEtb94T4/R5dcoQ9fhxpbxki4mJ2gImeTeZd3TttEGuAa2UuwAGnYfmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9134

Change reg, interrupts, clock and clock-names as common properties and add
restrictions on them for different compatibles.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v4:
 - new patch since v3's discussion
 - split the reg, interrupts, clock and clock-names properties into
   common part and device-specific
---
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml | 118 +++++++++++++++---
 1 file changed, 102 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index b7e664f7395b..78e30ca0a8ca 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -73,22 +73,10 @@ properties:
               - nuvoton,npcm845-udc
           - const: nuvoton,npcm750-udc
 
-  reg:
-    minItems: 1
-    maxItems: 2
-
-  interrupts:
-    minItems: 1
-    maxItems: 2
-
-  clocks:
-    minItems: 1
-    maxItems: 3
-
-  clock-names:
-    minItems: 1
-    maxItems: 3
-
+  reg: true
+  interrupts: true
+  clocks: true
+  clock-names: true
   dr_mode: true
 
   power-domains:
@@ -412,6 +400,104 @@ allOf:
         samsung,picophy-pre-emp-curr-control: false
         samsung,picophy-dc-vol-level-adjust: false
 
+  - if:
+      properties:
+        compatible:
+          oneOf:
+            - items:
+                - const: fsl,imx27-usb
+            - items:
+                - enum:
+                    - fsl,imx25-usb
+                    - fsl,imx35-usb
+                - const: fsl,imx27-usb
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          minItems: 3
+          maxItems: 3
+          items:
+            anyOf:
+              - const: ipg
+              - const: ahb
+              - const: per
+
+  - if:
+      properties:
+        compatible:
+          oneOf:
+            - items:
+                - const: qcom,ci-hdrc
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+        interrupts:
+          minItems: 1
+          maxItems: 2
+        clocks:
+          minItems: 2
+          maxItems: 3
+        clock-names:
+          minItems: 2
+          maxItems: 3
+          items:
+            anyOf:
+              - const: core
+              - const: iface
+              - const: fs
+                description: optional
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            oneOf:
+              - const: chipidea,usb2
+              - const: fsl,imx23-usb
+              - const: fsl,imx28-usb
+              - const: fsl,imx7d-usb
+              - const: fsl,vf610-usb
+              - const: lsi,zevio-usb
+              - const: nuvoton,npcm750-udc
+              - pattern: '^fsl,imx5[0-3]+-usb$'
+              - pattern: '^fsl,imx6[a-z]+-usb$'
+              - pattern: '^nvidia,tegra[0-9]+-ehci$'
+              - pattern: '^nvidia,tegra[0-9]+-udc$'
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
+            oneOf:
+              - const: chipidea,usb2
+              - const: fsl,imx27-usb
+              - const: fsl,imx6ul-usb
+              - const: lsi,zevio-usb
+              - const: nuvoton,npcm750-udc
+              - pattern: '^nvidia,tegra[0-9]+-ehci$'
+              - pattern: '^nvidia,tegra[0-9]+-udc$'
+    then:
+      properties:
+        reg:
+          minItems: 1
+          maxItems: 1
+        interrupts:
+          minItems: 1
+          maxItems: 1
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


