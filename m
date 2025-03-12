Return-Path: <linux-usb+bounces-21673-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 216CCA5D823
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 09:28:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8C15189C54B
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 08:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDBD02356B9;
	Wed, 12 Mar 2025 08:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jaThvhCk"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011024.outbound.protection.outlook.com [52.101.70.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACEE235347;
	Wed, 12 Mar 2025 08:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741768060; cv=fail; b=bmVpzBHVbgvoFIB09SkwCPauMhwfiS8qxXOTndz0oOSLH65LOx398LNnYjgnhqQsrsrO7gFHAYuhEuuUzhObqPyeNg8JnaDvLtD7eZDkdrm5dkGM2JVTxZiYNjzBKw4NdOpQinYfi1DZYGD8dMZzMSMcVYNbKAaI10azXNQgWvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741768060; c=relaxed/simple;
	bh=5SaNoDqM4Q+ZJAwqGWNSvhEEZPXUcTWLRspJqWhOINw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vFtc1g6wTPHlmkUW4RSd3K49Cpl0exhsocnGEbAFKHfDUDTYgdwAJ+75Cxh9VF74IXlmBT4dAe/GToK/iF62aPMcTeiP9+Sskpv+jxg4CnaHp7xtHf9TCmEaZF/affDSkT2IH3pM4mLLUhPGbr3ngj9rxYG1tBBrnVNYzLqp6D4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jaThvhCk; arc=fail smtp.client-ip=52.101.70.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUK/eRyPsjj59syLbZ+oXNQll6MqejUXXxf01NYNgSlUVOi9hQpdm8Lnplq17pwzeo2o03f8M6YehMoZpUiBcejeN5JSVH8ETwO1MA31pLC7Bo2ibK7Mboi24JQhiMSbj9Xq4qWxiNOgaXXdTFSjftdYffz88hfGV7xa0/tvY6plLKOKRqAt52SLUaN3gX7UefnK/Yg4rStCHnIhxLGZ+WEnbnVG8/LHsRwWogZIb0IhFJ960GlCWOUm/FAuCdNwIs/5bOwX9+GmKREraLn2sQYlXZdanaV6t4SKzjuDaB6i0S8m8ReYJqXGjWQkpjXwM7h8zdjtv0sbdUdUduXWxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRpXq9KGYuga4kGc/OkaoOle3X5uCRBbA9AUhOQHEac=;
 b=vPJTuWRv26ekDV1WiV8AaykhKPKtnXsj+AVxctG0aVG7pe5naTj/quuVga4Fd5B2CC2Af2NQyabG+5uzR9ZfhjtzOnW9CVCCbX0XMJplS6BYfEzuIsxFPiGd19rLTVu/2IV3Hsn9lhjUr6PErDdETXvrDcPYvfbJ3i8qd04sP6XxYF+mI5GDjIYXZL61VQoF7CuNJAclnssRlu+2ZzTwWzL7p0m927D/DfBelFYtL8Zl12hheWAolV5L6bIffvu3XXByU83PCkLUYOhAvNCMrjA4Oi7p399VIps5JWLOu6Q21UyjgsGmGW6UEQ0cgv+dpl/a0rdjIR6hH1kkq30OXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRpXq9KGYuga4kGc/OkaoOle3X5uCRBbA9AUhOQHEac=;
 b=jaThvhCkoJEppO3rluKjqeQMWUEPFW/t8fUVxTgPU4nf4PfOQdqhEy979SBc4FMyrWMxKO33Ie00P69BRV8wLIHHyIWTrMhtbGlJWrqawGoGpU0mmq7kDe+vrdkQ7acLz29zaWLmc8DoNI0J6abJ6jcYhhq+99+RL8GTuKqPqjmhMo6PqrWY1m5d1MgnXswUIF9jKYnXz20ybduREWo0Cc4Ju3oT7P2/7zNi8cFTVFEbiRggrFabQ3ivbr7iYCc3E7PDvJPreWhTRFkEdAsCwBTayfeAYzNn1OUNTpSerum4QDfhsW/MAP7HqSbx61UybsMu/o58OPDwN60jXJSUKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS4PR04MB9624.eurprd04.prod.outlook.com (2603:10a6:20b:4ce::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 08:27:36 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 08:27:36 +0000
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
Subject: [PATCH v5 2/6] dt-bindings: usb: usbmisc-imx: add support for i.MX95 platform
Date: Wed, 12 Mar 2025 16:26:56 +0800
Message-Id: <20250312082700.260260-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312082700.260260-1-xu.yang_2@nxp.com>
References: <20250312082700.260260-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS4PR04MB9624:EE_
X-MS-Office365-Filtering-Correlation-Id: 95655f2f-372b-443e-20b5-08dd613fbe56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YTqqAB2Whyd6xIyD9UlRdJu2rKcM3xs7bjGh4hy9VAtPwPUce9LYSklM6BZy?=
 =?us-ascii?Q?SH5M3VLYzgICAoRQeAAjr1jWvjWjIKbCHI/oSKTiqTqBzih/wYL9MoCo9/yg?=
 =?us-ascii?Q?JG7ThsOS58YpkaPUaPNYuhIJKk/CKrbZC0mYOcTBlhOnv7pgcHmxGbh4DgpC?=
 =?us-ascii?Q?3UT1hasCKzok4qWbGq08yViOwBbL/xhdw2r0FWG5w8OiD+MnRPV+Jxv8quGO?=
 =?us-ascii?Q?cIia6WTKyOZFl+Wqk5CzQ93//A21Jj8GB+e0JATP9MNyt6N4h+O9rLG1Jz2e?=
 =?us-ascii?Q?MiiRfCj9leIP2RhlZ9y2/Ri0FYq6aK2OoOYVrMF1tVAjV/OUXxnEoD90+QHZ?=
 =?us-ascii?Q?iOokd2xzfUE7SUMDp2WYvraWcPny3Rb0BmfLNiNdKIoGshqZJKBLCR3/KQQf?=
 =?us-ascii?Q?pYc99PorVYntDxtWqCBIzb+9sv+4aoviGmjnoFFnjxENk98WCc4gSSSt7RmW?=
 =?us-ascii?Q?A/eToQBxonHx0d1PIyBgjrQCGd12xmR7cKCFdAnFRyKX8N5wWMFqy6BSeHLQ?=
 =?us-ascii?Q?C+0ldzcFZyLRD3ede6gQaNuXumX0ixE4LCIjfc129QKUA9XQ3BxtWSkEoiDE?=
 =?us-ascii?Q?4JbqH/C+a8HZ+vD9j66ofV++JvPN6Ib9CUwY6nmGsii5J34lmRLdmT1ikByi?=
 =?us-ascii?Q?SM0RHSnFBNtkwJfb9qf2r8sO5WVXjsd47JbdfzngtLE6LDF6WI2Lwbtr7dZz?=
 =?us-ascii?Q?GwarXWTk9v4hRwLkWCz1omhcU1lbJmSVWpJkbdBf3Mx2gRbCtFmGf6UHfcfe?=
 =?us-ascii?Q?Eft3jtzcuxPRsvCtgw8FMYB6AMK7jwzHYv8PbJHnmBJCAV5Qk0YX2TotdgB5?=
 =?us-ascii?Q?lh5b+vWbrWM9oFGDZ/zTNVJzVOHX7aTDSXGeUDFb5bRdK9GOIg8z/XtrWiHN?=
 =?us-ascii?Q?AIyLtZUGRhx8EwKWA8jnXDf53uZXd67TDogKhK1PeuhisB2viwrJCXmldVpq?=
 =?us-ascii?Q?an1d4yna3KJmKgrzfrsL8WjfHszLHyM5ItOA73Akgs80ZB2Tdo02KsQiCNQy?=
 =?us-ascii?Q?cXyBbv9zLtsPE2ZsenqEZREVLOvo0bNU8o3CEzMJg5cn9cP6VY6ax1/kcbaS?=
 =?us-ascii?Q?9sicNMD+o8Qt6h360Vqi4GUumzZC6DH8O8rM1q/E/H+93WzAfsJ+8w24cMWU?=
 =?us-ascii?Q?IrdGpvOyAQc7eai+Ktd6VcCRf/RnUdMAZlIWtwHKKvhpbjOz8GV0VhAcUY9J?=
 =?us-ascii?Q?Zhlb6pqt6wSkympvUy5g1u7QuSybWUn6nYbf696LL7Kt4VnIAlagSQbeU1fU?=
 =?us-ascii?Q?ClA10JSGzGqE6Ys2I7LMauahTQbLCiKZAFS+22BBAU8/ntzBH0EuQR/ZPWxg?=
 =?us-ascii?Q?17/uOOmsiM//YJ7OLu+ampSRwhnQSKf65042CdEkR61p+FFYD2oGTTls97zl?=
 =?us-ascii?Q?TdrjQx5mBjXLXX6iHOjs0s1LIJLObbIsX0cHmLqsNIcA9lrMFWEacwuQ0tHD?=
 =?us-ascii?Q?JUojsAoHc5uufby1qxqDNug+KH3zNEZ9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J+PDBWkSWLwLr8yt43q3ifvYlJwIczkCVOjX6v0FU/xNLd/+JRjHcJ9pa1Ug?=
 =?us-ascii?Q?ETUs/s44r+PTK3KrtuspHmWU4woDrAmEJn65vnT8zmbR8GUoON1urJHPdRZ2?=
 =?us-ascii?Q?+nT8AfLlEhKJhL9QatbzQfK5dgACv/KMbHtqiP2uLhtdiEI69mb+gnti4D28?=
 =?us-ascii?Q?CIotBP68pJwtheSR3EYYQEm/hPa9+91vJT1aXLyvnBM2qvePsx8oyM6010Oo?=
 =?us-ascii?Q?90AfMpwLsCNZ26hpeViiwRMpA5s33iyo3ZknTAna/XMCjtj5v40fHnRuWlzg?=
 =?us-ascii?Q?GT/DT4SXa0v2JclV5P+uVtrrQfjX4chCJZLdXRmVSG2nWrraF6eO0Efuwyf+?=
 =?us-ascii?Q?yPSyZdwzJ2vkyYcjd079FKH9mHUrLcQ46+z4bpT0V1oYkMlpeUdjtSGYWeWl?=
 =?us-ascii?Q?G8DQ6QrIKTyDqD9riHk0vUMxJgmaUA9XuY3ao8GLNzu6EQYA1oWlIQQ22v7z?=
 =?us-ascii?Q?d8XWVmJIvoB6JFEHHs/tZHaBMJCwdjm3Xzt0dwRDsDPpESHNjo+iQAsfSuPS?=
 =?us-ascii?Q?Lg4y92/gwmrkaTtBozcOKdWOhBgV7w6h0xVvQeJYxwRzOspcN+osCI9PZJoH?=
 =?us-ascii?Q?zIr9+HEzm6ruAPw0uXylt0UvRTwEyZXsfaPIoHUSUJgS08Nq4BnXhJ3jFFih?=
 =?us-ascii?Q?onucMLfl3JAAZwNPVrSLtzYSQ3M9AsC+BtcqmjJI2Ge7JhgBIv2rNQVlLrQl?=
 =?us-ascii?Q?WEWZ8YCImXaJHQiKQ65CV0W7Vam52nfG4mxD8qMH/rZuyoEU26vese5TejbM?=
 =?us-ascii?Q?X++o95FXp7ZgI66ujpncR6+gtPXkVlAVrc3XG4fquDkNVWZzwgT+JECVvF9H?=
 =?us-ascii?Q?2jopk5Bs8CGOL+52p/yHZ7urQgUjafX970EY8XyvOb2VInLtkQfyJYmB7YH7?=
 =?us-ascii?Q?C6uKCHTmTPVxf9S3xM5/Otl2KzBsnYimCzV+VXW1IE2UfOMjlCmG06BpCokt?=
 =?us-ascii?Q?1fcyI3eMTy8/9+kyknaQTl5a6Gln5FcRqcbX+klZ9ev7hHMXMkbWkYySaSjn?=
 =?us-ascii?Q?nt+m6ssThM0PtrU9hfoiX7xV8h/IXnq6n7u2e7zryjU6aD8za5fTCYluRJHw?=
 =?us-ascii?Q?Og/kH2JW05H5TSTloLK2AsbKD1XuxP1sZ1xZdJDbS0TqHd1X6gXvgJnNUt9g?=
 =?us-ascii?Q?ohBCIslNUiztvMNAiEE/SP124giSU0uSntCfcvQsp3ZWuNV/l/LFwivFX9Rd?=
 =?us-ascii?Q?k4EohYkW5wSvFaJlMB1cu8e820O6j3CnKbLHTnVEEnWaUFadP/oAm23kLJoE?=
 =?us-ascii?Q?uxawBG7r0MPNVVubmLvN/E0/uvU1ukFxT6C6XpHS0HkkngQjre5SfjjQJjL7?=
 =?us-ascii?Q?XMx8Yh8umt/0SW8u81NNQ00zAKbB0XeyokDiJIuVM7X9V3kIHyTJcZgVZVtu?=
 =?us-ascii?Q?5ulNvruCIgiYUq74jX9Z3oYvxhWUOh/4fNraKs+ZirWzHPyryH6Ithzhlwqm?=
 =?us-ascii?Q?jertP/YDxRLfxYAY+0AOsY2IqqtUxqmChknWM6o6psoPgGQPx07X7oSeR1LF?=
 =?us-ascii?Q?J1LQCyRGN0NpjvFsxLDpq7GY4965/NV1zYMA3jyc0rlfdHEmKedYIHQDpnbB?=
 =?us-ascii?Q?LC3tSs4BM6f9CYM63TSAKvODzuC3VfkGeCNqy9sP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95655f2f-372b-443e-20b5-08dd613fbe56
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 08:27:36.4553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dw/x6yNPAu8MaiKRttr6Vz+TsyI4MgZrOK/oN8FgRdc8m1sumkyXFm2Mvmnq5iR7ETYD8mt4De101DOVuuFdiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9624

Add compatible string "fsl,imx95-usbmisc" for i.MX95 platform and
restriction on reg property.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v5:
 - no changes
Changes in v4:
 - no changes
Changes in v3:
 - add Rb tag
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


