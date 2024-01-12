Return-Path: <linux-usb+bounces-4955-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A33F82BF0C
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 12:12:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 234B81C214D8
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 11:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7697F6A002;
	Fri, 12 Jan 2024 11:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="hyZFht2y"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2086.outbound.protection.outlook.com [40.107.22.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FACB65190;
	Fri, 12 Jan 2024 11:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jsPHbAgw1n8MMP7J8PWLlNT877I7lMAMHphjWz0SDtQ0IZl3VUKC7oGsX03Q7IjOOv5n4r9YbEDqoqdN3GUIJwGJZpPhotJkUFP1RqZltdWSJRDzouJGnSLjid77rtvwd9JYRfxsAiiaFReXaJcAcF66S2oQhvZYlFZji01PL48cTVyIwui4DgTxk+Dx7cXQBueb3iT0Vi/0cdn14VcR0YngISxGnS87jOxIDrudWwBld8IbZIbzM59LwTdXnQl0YpqEXfLyGAMU/w9LYm2QKYHQ+y46racNpGJacCwGBZZDCjxnH8lwRGMY0MVxIaUFl83EXIObhQiCtTm1WG0Wzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0KH+Bxs60hhO/WNpRN56CPb61/plNwM7HwzIXrqbCA=;
 b=PeLR5A8y1uYhOPWUK497G2O+J167noEmrhXXWqaWnEScMn5cl2c3hB5zHAkiWE9HOMYzON3q1LFK1gdo+1ZNO5h9L4VmO82vf762AVgIQ1wmWKqURw9hy8FZeKBINCIXW7pkesIxq0n6l7ChbY82t1iVlu52ZWfvhgTmlCQRG65YREUMp8yIAJ8EeQtWLOyQ7lU7vU+6HMrZZPxFum2W5mGpoRWACHkZTeSLoSND8uuuHEi7K9rLkmLkg72zHOShr7wRB8AjVueby38tWvorgoEPwrtDwpgbdghvqiBtauR0vRjxIMDCddqgvo/kQsQ5R1z4KpyF2bhqCJDQ/JZHaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0KH+Bxs60hhO/WNpRN56CPb61/plNwM7HwzIXrqbCA=;
 b=hyZFht2yYtHd88LW8z3TZJrAMbYqIDH8k8Bln1QMgPc5EeQckv2uzzHrWmDGnMrmbisMBbs66QvNTt1JGT/P0zeDBgeJP3MCCBYeLyXfLl0QkTQofto4FXrPrJ/1O3v3Go5vgoTo11z0wwW64mUDWCRUzofGnZNvnrqAwrBOrgk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB9PR04MB10010.eurprd04.prod.outlook.com (2603:10a6:10:4ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 11:11:50 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 11:11:50 +0000
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
Subject: [PATCH v3 4/6] dt-bindings: usb: ci-hdrc-usb2: add compatible and clock-names restriction for imx93
Date: Fri, 12 Jan 2024 19:17:45 +0800
Message-Id: <20240112111747.1250915-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112111747.1250915-1-xu.yang_2@nxp.com>
References: <20240112111747.1250915-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0020.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB9PR04MB10010:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ba9eb6-3d73-43ff-20b6-08dc135f463d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YLjCMI1+Zk1AZYAur42FAoACpT1CP479iFrTzPGUN6Qbihpf7k5UaisBktC/Gg6GVN9yIwDGD3mimWxaayhnv8POcyrB1DYLp5qMmbiAwysLRiMZYd3ZYjilyrKkgE8SqkIREawMMf3MeZP6BLgSgqUPEecYYxTMXFHnown6KZYVJeKfpc3OOX2JIPc4lpTUGCuL7Mqt8B4h+tp/0NZbpTZuQXfAepxk8QwzuT4xXqEEzJIZXK6IrjHNVX7osOWPHqwnx7UfqwqNIpgdaTY54ddOMzApJnXXyWu3JNsEPZsAdeju6TB8HdYXrhQUWnUknsE02jB4N3fhwlONesGpm8rb7h9KASdSbVkLatQAx7mu8q2OyI1TUVD1xBQm3KsK9CZ6r/E01EJ4TtQyJxLG34cDaXAVx00KLtcichYaJqHIeccuNTiiuRnc3Rqa5sET7fE6ex0Lk+zJzF4GT3SiVnrq2RBlaSPHAwFpixSGJIzRhyTBuIyTvYgI4GlFjgYcXAvE7xjiTby07IP/SHclAn7bDTgHMjs5ZcYid1s943RFcNl2I2Si5CW2w9OiR8RadwrLoDXsH5q3ImCd5ti7ymDzzWxur5/IxjPUghT6SWN2E/cR+tZHAHwkLJfmdP0e
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(376002)(366004)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(38350700005)(83380400001)(26005)(478600001)(6512007)(1076003)(6666004)(5660300002)(8676002)(316002)(52116002)(6486002)(8936002)(66476007)(66946007)(66556008)(2616005)(7416002)(6506007)(2906002)(38100700002)(4326008)(86362001)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P/1Dw99hFrVyxsjOIoBSYDkYdwkhQim3IDr7v8nPOFsFo6bgvJ1avx56bon6?=
 =?us-ascii?Q?qUMM0DVnLUPMUEajRN1Rtm/U/XQuucM/h4Rvw1iOqiHYjojyovY257fICQOw?=
 =?us-ascii?Q?KMISieYYhXdDzb5ebcxiBP2XLfpNqmdoLWcd1Z294i7Dxqej9ZiWvZ7c/rGo?=
 =?us-ascii?Q?LBB+ik9gzZaFHv1z2FVSd0I9prdX+jr8mx4LGiIhL/0Y3DY6pwZdDjuibz+x?=
 =?us-ascii?Q?jfWLgrk6DfBVXVa0NpKBlmS2IeCGLPQ2QwHN8Npd24yGNeE04u7kQdlhj/z1?=
 =?us-ascii?Q?qTLDp0iHsOaA3RTg+j6UB3e3KrRUHEpx+6wgu4ifESJvTlIDpbojVnZmILju?=
 =?us-ascii?Q?Uwm/kH74EQpvG2R5OJSS9G/LiL2SNUYZf7A6OAyoqhtRRGJiog9CNM4peDSM?=
 =?us-ascii?Q?crO/7pOTkjThq72BxfYPLIW9LxWJ+XqPEghnFgrgclCs7hFFe1bR9NtqNr9F?=
 =?us-ascii?Q?7JFiQcMXGU9f9D1Ek1ZuZtXy2kjZAAZgT8i6dW/Z+Ea5TC50wVbr0qs8dOOD?=
 =?us-ascii?Q?w1AxM/jpCDAREv6qcn3CTNPvwRg5P9tUv+gao7Km5pxiqijDJ5T34tL/PsPb?=
 =?us-ascii?Q?vCJsig/Sr0NUysO61/j2w/YUEccqPaHeXgn9nVr4zSVl66I0UtszZjfwbQ/K?=
 =?us-ascii?Q?fw9jXjo35ss1fvuPx7DxkWdypTtvHl89QwNSiNCCSUTmZ/yFmO3jRaD1XZbM?=
 =?us-ascii?Q?n5CxBlN7Eqvh5j10KTcRCbIi8BGExaqvR7lxcP2za1uqZxiH/iG6R8EVfFR5?=
 =?us-ascii?Q?5iTGWkDA/i7XugGeYEgIy96bTA4DbhWHKm/l/+tJwgGiuDmOTFrd2Ht28l5g?=
 =?us-ascii?Q?71T3khK9yg8bhosaWWOTYhUl1GKV4yXm7LkvyJXO3Z2mtpTXPEiZgqpcCu7Z?=
 =?us-ascii?Q?KCpahu1RAlMuyxtopbNWHjAgHIn2fD2yfjttOhoI5a7cIkxPPzww2Vulmsy7?=
 =?us-ascii?Q?EnUBGOLkhD3qAaeWs70Vm/oM62GIvIS/Pax2mfYmvkUqJoGd5jQOumOmiBkQ?=
 =?us-ascii?Q?SGAMGQQX5DMoB9SJ/gbw2oCS5N4PiQHx4BKOnIP3Y+/t2Q0IFZsHcY9QB3ud?=
 =?us-ascii?Q?iLk+vv048MAtz/lBryFy/Gf06iIoI4KPm1aH4eYLrxbGcrF59ZlF0MnDhnel?=
 =?us-ascii?Q?rPWtO1Vc3YV+ILVoF9GyYzYAUEl9/9g1+F81RD0C7hnv24xqj0pyEpBVLYGI?=
 =?us-ascii?Q?Mr5tGIBE1oqn/yekpu/Ai8c+N14LguoksdTeu02h1z4W/OuJjv/2mgGUZbm/?=
 =?us-ascii?Q?//7UceZ2OHCAuBCcpkTmGbyMQ56cXauNVWBaiuHX0ofEl4OelEEkPRa+oNC4?=
 =?us-ascii?Q?j6hLqv3bVUoU0kxdgLe8X2ZImVEG8vV3MiA0RrP8r929JddOrFVU7fdkOKfP?=
 =?us-ascii?Q?XrtTPGiabR6xH/54qDE84OfbkbKP8AxACDvfMgh3i4OQ5w2TRDbJHjKXmgGl?=
 =?us-ascii?Q?3FehLiGMHi5cOunPMXr8XNw4tYoSxa2jZgj27ktLF6uc0pt7cDCivFjpWql8?=
 =?us-ascii?Q?dIDmLjPG75OWg8PEw3qvowdL9mKP8VLMlw5usjvIL9Dd29unrDkIlskuhgiO?=
 =?us-ascii?Q?wwbFuSiZIhiD6LaroNd2bx2nODJpzcas6Nf9sbpX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ba9eb6-3d73-43ff-20b6-08dc135f463d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 11:11:50.3339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MrUbiPKKjfyLL2H0ACTjgaLxrl5g0HF3vbdkY6HUcWiCFOVc1GsacMABZi3G9SabyLitiLp2Pwdu5ToRI+xrxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10010

The i.MX93 needs a wakup clock to work properly. This will add compatible
and restriction for i.MX93 platform.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
Changes in v3:
 - add clocks restriction
---
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index b7e664f7395b..6e75099b6394 100644
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
@@ -412,6 +413,21 @@ allOf:
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
+        clocks:
+          minItems: 2
+          maxItems: 2
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


