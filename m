Return-Path: <linux-usb+bounces-5697-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC10F843E88
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 12:38:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 514CC1F23C9F
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 11:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEBE768FC;
	Wed, 31 Jan 2024 11:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="fubclCBW"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677BC768EE;
	Wed, 31 Jan 2024 11:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706701030; cv=fail; b=jWEinFT8EegfnamOnRoBW6GCxzmp7F0EgCJoR2TEWVaY/lpHx65Vd/s/VtuP7bJygTs+zPSQzxkKxNXNcfhTikhWdxMQzf73ymG648Rlo/86fGHKCfA/waQ+Ujt78gzsbeyClDas1iobb+gMoP93Ex5wZFKzmR8O27YZlUZWd0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706701030; c=relaxed/simple;
	bh=XwgLvlrOCVCXZtUIPulblHPAMUrCQQ0VMCxGB+95BBU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=esaEqr3FyqSKVsdrcdrVgatBbBsykvxYQSZ9zYKNkIrJZO8zhsd9HiFxwn2P2Ud3GfhGodD5IF81Kf2GiJUAOWLmXhonr3/aBtqdnAJFBw5APKfKhOBw78qWg6TeQLoMgQLa3QNDLXrkmjkhuuEhWgVmyijR25NmZCWt+z+iYhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=fubclCBW; arc=fail smtp.client-ip=40.107.20.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IaQzprk7KRfyGZByzIA9lemsGnOyLR2wWbt/s/uSEIxvZuHUENyF+aMAiWM6ukFggAISwEOiCKakx0Hgd4YPKU5VS/bNoGNUGcdJ8/KNLLrRQAsDqRrHPi0cbUiitH+DvhYkJMEPJQdprzQgRAFqKi+tH+TCnzPkOdqHmoaQX5lcpKr6gqeFgpLgrGJBa9yjgUSOdU88KW6fPnqNaxZ12FMx/sjD4ZN6WOvAu6s2L3iYmvgxdTcDS7xXsZ6paXn4k9lVU5kgktm9YbaG/uzzwt3anZxvHR9jQQmXiWIl1wSIvhQZ/V0CKuBaO8zavva5fSOdrUCcpt1EcBgHfWBSrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fU1aN2+2WYojhVVPJYxUaMwrStD0DZSWy77GLecuE1E=;
 b=j7RmALQA2Avs+YiVKGaFNSvsSf0tkNH9UlkO5Vu+bF3La5c5ITBvX5FW1L0R/Qfbq5My1Ulu7xvlO9L0mTqRleglX8+uoxZoBIqX6WBi3DGsJvGVI3ybhR7L0IDlIG0TP9CUCb6E/l+dfMScSPVVAWqi13BM5oAxvyz/5Tkhki9VOhfmEXr7aSxA8TkKETOuvgRYgyzN8RX1NKHEsLDc0GtlTjwZFVC7pbWJa0TUkQEmI/jQTYJhoAjdKvaQTnMUheR6Vn7kdmMfcIQNVffO4a+u4dcYa9GZBJQaZ/rxhlWbuQSuEEPJjkl6xMUlZTM1tBBa+Y4T8rYEBkmbjfRXwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fU1aN2+2WYojhVVPJYxUaMwrStD0DZSWy77GLecuE1E=;
 b=fubclCBWTDI7SAJkLHa4t9yNOyNroMWZ2MpCKkMrdsZM22+qJkmwlwcDMN8zVNl1XLQM6OjD2dWh8VE9KvBAZfKXDS7KlVlD9wN08tXnYiDkLxrahE+YBJbXMBblVPY8MnjiRlrkfeE3HoTHng9yWqznZahOOS//n0Ey/wJTlVs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB9093.eurprd04.prod.outlook.com (2603:10a6:20b:444::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 11:37:06 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%7]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 11:37:06 +0000
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
Subject: [PATCH v5 4/8] dt-bindings: usb: ci-hdrc-usb2: add restrictions for reg, interrupts, clock and clock-names properties
Date: Wed, 31 Jan 2024 19:43:20 +0800
Message-Id: <20240131114324.3722428-4-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5713ac0c-a0ac-4328-13ef-08dc2250f3d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YX4kevg/gO4giSSrq719JOFtsgE/4CHW67KzwTH2dRy1SYwB+1qrABiqKn6B/UizFFgU/G+Vz4NfpQeyPnMkNcWEZxl6Vm4+grYmdtjygz3JO7pz3iSF5HKnNo7I4w3OBkNsmJB2hhR4vVnhz4oiR6CNGmUdN77spymD/8v4wOPJuuLz6r5Q6z4FQjiJs4hMHodww2fRef8EvFe5LXoqG6ukac5nL8+Y+nq0TBXA/p6Gj5oCyTpVmLkk28qYiV49aAt7KpKytAqsarDl634+hCCNqyKnYe0gGoooJAiZWAHzd3hn6djQ4ggthp0tMUvtlYppNMxW0EuRNjzUzNkyEgqkG5EoUK0LzD28lDPOugXl0TDePlfxZ6o6+N7hD4eVKieJH0sduF+GM8hc+8F8rYuxWynGPEINqfoYqJi/jRHYZHwuwIt1YrEhtQRQJYRl9TgVU7KSHeI8w79J5smLfr7WsJW1D6MOppykOgAVq+/k3FAKty479gdHKYsJPxjFgZJnYd6JNA/sdR7dzYXrXjsqs0JhgB+LpLVMcsnKWBhFtmToW2jaZ3WMMtGBWlDsm+MZO3kikRun1J3Ch40GUYYQsmXQWv3HfQ/I86dluTmJ94XdZ/9s2tRlrOmiNkA3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(26005)(1076003)(2616005)(41300700001)(38350700005)(316002)(66476007)(66556008)(478600001)(36756003)(6512007)(52116002)(6506007)(6666004)(83380400001)(6486002)(38100700002)(66946007)(5660300002)(8936002)(7416002)(2906002)(86362001)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VV6mxO5yY9UaEVoGKgJFPYmc394hkvyWLwZq4xkDuhHTsGiHgeOz7n2SBUX0?=
 =?us-ascii?Q?LZDdunXisndh7+H+d0bcWz22poZMi8YgIkKKsFAUoQ267x4UzekVyvTAdpwo?=
 =?us-ascii?Q?M+sO4M4q+G/iC717a/EU+KaGQ7D04m5jDByUIHIFF9tujO41qUtAcPPaLg0t?=
 =?us-ascii?Q?7hD8g9JDvbGlQaQYLZduFfAqOZtxs50Q0kYTBkRp8yIJABcdoXZUiAoLoEuk?=
 =?us-ascii?Q?vGdnb63qhyuftGufkNSLRUy5mP2iRwUr5AZf/1ucDWDCeyJO7WLDYE7CfYeR?=
 =?us-ascii?Q?7BeqjiiTxcwV2KxU9vXHHiQW2x54o0qahRcH5YiAwcvExcY12A+AhDhiGX1b?=
 =?us-ascii?Q?iW71QcKp1nlCJhN1b37R41J0cNoZKYETOtmAIyGgZ0UBV/CHOYyvJq1UGgUc?=
 =?us-ascii?Q?+2i7/k5Sumo1w/47qL1rP0503srA4YQjrN0renohdhdxi1KkaARD5mEf98rC?=
 =?us-ascii?Q?8Kn00/HK/L4cAYgDpwE3RyqrNBmPRMIqwUJHJtasmq3JNHfzxH2AgDTrEpiw?=
 =?us-ascii?Q?u49DojwYC5ULiYSM0cMljdhNgtL120OoRSgdQr8G9HQbJTAai6VJ5uXVVizl?=
 =?us-ascii?Q?vUovar/fRId+31Ktw8BZZlwEA4tWKjg4wOxieQ9ZXo9mhXC8HeMRdzl73ioK?=
 =?us-ascii?Q?Vo5e5TZdsjKFCZaCrbs5ZZpJN9xg2knOIV87aD4+BYDS+JfoUzcBOeRYD4u1?=
 =?us-ascii?Q?4fUWxGx9i8ClFYupbA89jcj8+6Tt0PYCoiRvsSZiuUdTUMS97zZkyJZdFN/h?=
 =?us-ascii?Q?pMFn4FeWAZvuQ7YLexVUKixdQ6avYoYmuxG+QlUH/dhR+/PLMeDLMDqOG77A?=
 =?us-ascii?Q?bC92Y73GMOQOo6u1gR6BGbi1xP2R0EFkfArc0b34RMf3oI9eQAEZhlXZszzx?=
 =?us-ascii?Q?YbJdSvSBImfXolDBxCvpLlojm/3xvZLn7m+gSkdaPyYAfxtJ/kmkm84ytl6G?=
 =?us-ascii?Q?JVH94z/jshneneNjauAS0gctY/s0KZOX/H/hD8qZL3473zKK2GrnbMzpiyml?=
 =?us-ascii?Q?arELNn0pUhlOgnmgmFCPSFgCsVjNwmEaOICOZ8Sa+jG5gH+7gA+NxG+EWlrX?=
 =?us-ascii?Q?4tVo8W65/Ttn0RwYU5nLCTmTqMlGOG3tTrvX6ttU5KANnoJSs1i04ngfjYrw?=
 =?us-ascii?Q?C7R1Zpb7DggoPZHLXvbgHBTNS7+Fdii9Q83IJlh157eQ54UD0HsD4K5wWhK/?=
 =?us-ascii?Q?zR+84UhxVGeMK8rnWHf1utjEQjd/cwDVISJ2cAvnkhbMV++Pfggc6IOhpxYe?=
 =?us-ascii?Q?O4VorU8gPefSRL4aF2hDTRXdn5c/KhFkg/mOAFF/SuLt/WfS3JypqVzAMf9N?=
 =?us-ascii?Q?tZ07Cf6/qN3P39JQaJjHUPiZhKvMMbhrsxDI9e3TCqG91uDEvkUTNrQSjhkP?=
 =?us-ascii?Q?wrbM2Iqwtidoa7QBq54xjviyDdLETQ0r3Olsf04y9PtKW+EtSsXdgOI7W7UN?=
 =?us-ascii?Q?tbwBAqXqM90pNggujSalnk4BhRDIhhs/pdQswORiax8kkGFgFfTfsL6ihEcx?=
 =?us-ascii?Q?j1qzivpaw2maZKx6wXICl0RWdkp2rJf39dDoFUU4AkGmY9s/GMOjPkyurSKO?=
 =?us-ascii?Q?Euci+Hm1maSu77Gt/iPso0zSLks4uAamP169jc4P?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5713ac0c-a0ac-4328-13ef-08dc2250f3d6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 11:37:06.5026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/mxxEngafnq2v7CaNUB45jTcw2CIfH07IAou9KV7IJf6+tOaixwim3PPLbvnLyuxR1CsBfJHjddz2eVr0MUdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9093

Change reg, interrupts, clock and clock-names as common properties and add
restrictions on them for different compatibles.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v4:
 - new patch since v3's discussion
 - split the reg, interrupts, clock and clock-names properties into
   common part and device-specific
Changes in v5:
 - keep common property unchanged
 - make if-then more readable
 - remove non imx part
---
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml | 118 ++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 3b56e0edb1c6..6ad3582051b8 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -412,6 +412,124 @@ allOf:
         samsung,picophy-pre-emp-curr-control: false
         samsung,picophy-dc-vol-level-adjust: false
 
+  - if:
+      properties:
+        compatible:
+          const: fsl,imx27-usb
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
+          contains:
+            enum:
+              - fsl,imx25-usb
+              - fsl,imx35-usb
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
+          contains:
+            enum:
+              - qcom,ci-hdrc
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
+            enum:
+              - chipidea,usb2
+              - fsl,imx23-usb
+              - fsl,imx28-usb
+              - fsl,imx7d-usb
+              - fsl,vf610-usb
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
+              - pattern: '^fsl,imx5[0-3]+-usb$'
+              - pattern: '^fsl,imx6[a-z]+-usb$'
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
+              - chipidea,usb2
+              - fsl,imx27-usb
+              - fsl,imx6ul-usb
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


