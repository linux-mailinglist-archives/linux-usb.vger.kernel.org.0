Return-Path: <linux-usb+bounces-21243-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36964A4B6B0
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 04:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 310C3168F8F
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 03:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E781D63F5;
	Mon,  3 Mar 2025 03:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hOpny2/k"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2062.outbound.protection.outlook.com [40.107.22.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AE41D517E;
	Mon,  3 Mar 2025 03:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740972765; cv=fail; b=FoTfALEQJpnMcvb+6yqJG3lc87p8KddWbDWZMvlvwe61wLXkq9iYtBuS67wdpxhJ86isy5XQsO6GfL/gxkJfYpmc3ctMEiB1TGbQo8gg2hY64Izabj9/m66raSsOSF+uZz0CfEL065xSdr/nN1tg772OCoNnqEg93PNtqQlEUbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740972765; c=relaxed/simple;
	bh=uh2yG00uGhUiqz9GbhkKRyDqxGq8xKnTKOywdGNv3ik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GFJgKlUKGOj1EN6wXPJLBiS+clPmx+60bnRpIj0i+LXvUSC0Vu1WF7ogRdhpQRrurPbQNAWuYhH7LvekCN7TJWs1ZTrcjVFEe+BhVWJP4zchAMteBqNyS2Pzs+dbTx+l1N3/1Xq6dIXKUrD+fBQA2e170RzoyvbwDBYj0O4C9o8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hOpny2/k; arc=fail smtp.client-ip=40.107.22.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/PVkAyZRSqq28f6vCFPuINznv0V0lq+J8Z5AJduiK5JMjzjlhbO1R9KOyZ0ZClKtkTcHqSAnlJ7wZ6RWvHypaEboZfm5ErtOwCwfhbs9fKWNLUuB6QctRyvIskmAieINZeh+AIeHFJyXcjKwPBC2EtXNoKkotBLj8LMDRaBc2IkV1mtkkGZGn1TTJbrMU4og/MktbKqU/NXF8cIJmU8fHb4qBho8JNGh4bL5XkT1mZ9IjWmvTJ6UDu7Zc1s6gNYN3e6ELE7BjArlUHVD9kV8yTF+XO4CGlT7WIr5mgJMGroUwamdW5/isuN7ugzGhblUOZXv1R6/YWReQWL+z8GuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Uque3mlAwWfem5wRsfzViVVOQNI4uAukjecdFyB8Ew=;
 b=edmJqKl/H/uMejcnkA73JA41ox/ahX/Rx/bfrMlCE3cp78grU8Mo7qfWFTg33uYs06CaI4WH7vNU2QFrWwuwJfcmQYGeFvVl0rFyPCb2u8Gzq8ycsI1NmV/94QsVsFeWuRyG+LE0OeScGeiULR8phskhgUFM7BigWhIhWTEnU5eNjxiNPTspCnST2T+MdmGuAqO8s0aF88bcEKGQ9C25mRs1FzigmMujkZFPOH27dMAVsFYNJ6KqFrMIbhqj4uvXG0UDfKL1XOeY+Zz/lBNJ3LuUFr5YmfBs7gC/0cmlCuS4ay0+bjDfMsNc45UDh3WpXoZx1qLiPOA6grR9peIRZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Uque3mlAwWfem5wRsfzViVVOQNI4uAukjecdFyB8Ew=;
 b=hOpny2/k6gp5T2FClHuZ15Crj4BNxiwYfdORFNLEfrg0naQsXJUqq6JLj93XxOiW3q3Q99C7uxiD29krkYSdoREPPTOzMtYGKXz2dNmYGLnAPCnNVXpdvE04SOcvXZQcXLNBolD9H53qDicbtpeZSEtJcMZThC+0COTAzStJqXCB+lP+qP3Ct107PP8t00CKE6FW2upF4vyccrYydynRjGz6VcFP59BkqsQ6bN3ejFuCtDJDdNa3FwR7VRewTgiNHoIjPmiDHZBwOlyrvK7oHQcbSyCv0ju/KZhaN/j4s8faQJMOoEhHjTpq9x3WLXCUALicAAgWOOEINJVMt26C8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 03:32:40 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 03:32:40 +0000
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
Subject: [PATCH v4 2/6] dt-bindings: usb: usbmisc-imx: add support for i.MX95 platform
Date: Mon,  3 Mar 2025 11:33:40 +0800
Message-Id: <20250303033344.1251076-3-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2fe0b346-e397-4af5-fae8-08dd5a040d2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SFpL3OPcK8i+PZfHvIpU1ecOyvoG2PRdCmA9lF/YWue+5k8axhaHj5ov2NHo?=
 =?us-ascii?Q?FUgQ0Yz2HJV3evDXeMKl0FjI2lcQsvb/oHqIEJ5YRIWQ5uM4bPZOQNV6IvP6?=
 =?us-ascii?Q?9XXTKQ86+MJ7YlVW040qn4LqG31mzAjzeSFukjZLBBzLUKexe5YzOKxzZIBW?=
 =?us-ascii?Q?HApccyxwLZ/F25WV01fVZzzo8rUilkL0bhOOkW3QuonkPSsFHDYoj+vhAYNu?=
 =?us-ascii?Q?W9+/t7ZqBw0YmPOW0L/e8nfxoASGUZ/oDxJFl8xugrkdLTEUcqntE+vqXT7x?=
 =?us-ascii?Q?T35hRJG/xEXbWcOVeFzwG5cVHYmmfp94NFBNlu2YwJsP+IvR01DEzrT2duEc?=
 =?us-ascii?Q?Fayg+d6rMSRLWlse19bV57syVpfwG88A7ZJ2I4yCLdhh2hhVIPw5QcANydBP?=
 =?us-ascii?Q?Bx950gqYRzjuRBMeX37ecr3U9NrrnPUjQOZABulm9HLnWKr+mdE284m07bQY?=
 =?us-ascii?Q?govd9eW98eKMy7YtS88MeAWlmoayfhG5E65K4/saHyi48dUphvjVa8ewWcnD?=
 =?us-ascii?Q?iLDcBh5izIM5xhdCGSxszxMA9dK4fYseszPVmhM60b98y0EYkt+iILqxg4z6?=
 =?us-ascii?Q?b8/rlLK9fwkB3s3US0Uronjo11NOvveyBehlzdUMZrr75YtKCtAgOHiezQtK?=
 =?us-ascii?Q?TaJ9ecXhGzKomXvTn40q8pr6DRiqFEesVzl0Zvd0vxzDCTfJmfv57ZRl/6lA?=
 =?us-ascii?Q?Tw4dEPGYyhXcls1qB/ooo/pFv4yP1KAI3quVGslTXDMTA2c1s6qaV1IJMszj?=
 =?us-ascii?Q?D1heXfYu0MqNlnasyCir2Rq/m3CsxGsjF53y50MYoaSZKzFRSBkKwFkgj+MC?=
 =?us-ascii?Q?dUhAz194x3RexV1s/HieIR3Z3vthhD0oSAM91ynIKI9pqZpRyaobKV+sHEaG?=
 =?us-ascii?Q?Y/LGzWU5T0zsA+ecQRjDSBhE5cVBO7rAMidfzLDNzxzNz4R4cTv8HGkHVjiY?=
 =?us-ascii?Q?35l4Ncxupbh4e/YnPpwsoyj0XFe3ZVWswbtQoeXVNJqoeqkb+riiFtOMlhmD?=
 =?us-ascii?Q?p0nodjF3y/B9OUiP3sq3+x+ZeADB9N6E0QF+0iKfIvLWVTRZDRDGLSC/bpbJ?=
 =?us-ascii?Q?9UKWRYc2TjID1D3zfnUp3hiUas7syU4gE2CZQU2ZOwwDf3A3ChJkjMXT3REG?=
 =?us-ascii?Q?NTXaLIDHV769C2tptInaxEgCSzBVKxLjs/AmQR8IwM9i1momAuxuuPTQbLHL?=
 =?us-ascii?Q?Skrf3rYzPV4kvZuSlqwQ6XCfZTMHL9LyCnqTn5CxYX7VKY/Ya2eB7YcOxrw2?=
 =?us-ascii?Q?tvLCmuSdMeWO11QHTpaDhcFOEbs44Dx6+sPY11wGmakNnRYGbOE1Au+FWg5O?=
 =?us-ascii?Q?NFMtcKMnnstDYlhsZ5HJqEdoVWRex5OZf4m3UurrA1YS8E7R7/CjmJ5XrwPI?=
 =?us-ascii?Q?P/48ulbz1avbGUJvhbSl37j1un3tNQ7/hWwLDroH2ySg/gxBkz4n2LrY0xOf?=
 =?us-ascii?Q?y51L6sDgCnzAd9Ed+qAaaklldxyQg9SI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xmh5dUDzVzkbwGRLMn/ri+/W3qSRIXzGvVKbY9MnLKsPQErS5UU/bX2M2p8Y?=
 =?us-ascii?Q?WxCFFneB+iLj53l/gl2jcVJO3S5neGARgbOO+zQrOQHSaYeOJKpQ7Vrez2jZ?=
 =?us-ascii?Q?H/UjeHL2Po6W6EhO+S47bbxUD1w/rCepPZppbJch+iL76OiJ3rR42/hQRWxA?=
 =?us-ascii?Q?Mrz7ZioJlhtl9PuMWxEoVUfzjUUV9pmjqrHdBRmTb4zPim/brL7JWrQCQnNT?=
 =?us-ascii?Q?oISji78F4/UFOI+YuIHNNvhuG974C3DOvi8opQ9sTh0T8mSvdrDL761apiEj?=
 =?us-ascii?Q?Z6UzVRq1lHvbabsa+28f+PRL5kA4UhDAe11FJwuHBTXn7gs35Zcj7/MGg94U?=
 =?us-ascii?Q?IeG11W36cDoh+KgbQ+sI/46sD6uKSq0VzTfjCp5/qyeKfLIOzFEqyu+uhl/o?=
 =?us-ascii?Q?Vi44QmeAA03c3KZLZ35q0l8rygiBnFBbLR0J55bne7y1anhgGV5n+rHhcJgq?=
 =?us-ascii?Q?EqvWpqplJ4lgLSkxS+pPQJiSHAZpAUiHcquPhByni7RfxYEao7maoF/9xwXG?=
 =?us-ascii?Q?VoDoLpjh0zd6U/UkHhoOrpCzCo9OMVC1MMXGsy3f2TqN+e3G8xfXL1V8153J?=
 =?us-ascii?Q?9YJkUruDTRhobkLjRmbO89k9xlWJSKvT7z+NAPoa2FXVBoq94GIVlalR4frj?=
 =?us-ascii?Q?on14laCsl7uO/PtKzlMpUGUhJ4838g4ErBj9S0/W0TpDep+D9E+/H8jESPMx?=
 =?us-ascii?Q?nlv8ZpRhehH1Mcx9gzCxSTbSz4mUiqFMTOmC9BcWX2VakHhPkW1cGQd3k3Cs?=
 =?us-ascii?Q?AVrBld3h/rysIardGzOAX9c4LE90/xYDzON1NfBJgeDnOsqGrCb10gjU6VWi?=
 =?us-ascii?Q?yjnemxYwtmxSEJj6ufJwdvpDoJ476fkVSu+SaiWfmcHUXJv/cbwsys4SzXMj?=
 =?us-ascii?Q?wuf4vn7PrVeFOiAYwR64uqGw0mGiJSKDhF/IVRsWo8D+dj74fBrwpSzFj7Q6?=
 =?us-ascii?Q?klr0tB/wmeJCrH3aUNrvFym+mtFjeZl/5Ybt9bHW6cXMqXVUXpbWTOz3TEqG?=
 =?us-ascii?Q?JwDt9c26QITAgUhz/MQ2m6bx25Wfs+AUba+v/LRAkEWmDJPRaCNEX1JP3sbl?=
 =?us-ascii?Q?uAHkeZTHb0VuMulhVIYjTG0Av1IDjrH1xYFsbG3vCX0RzKDSg2VB/Zv4QJ6T?=
 =?us-ascii?Q?M/irazUjPjo2mwc1dki58WhWmIqqwNGFM8NSX0DpQg/ws+fEcYBVTph6VUN/?=
 =?us-ascii?Q?y+TIhcMKW7ZFyGnjMqyK6Rpw5x5COirdmFTb0JRUMTx0PvvkLij7hLWesl+l?=
 =?us-ascii?Q?iugjQv3QHJz0qqjczJp6LcUtcvoas2lpCDp1tzLPHm8WC9yveiBoRzngHGQp?=
 =?us-ascii?Q?LKAbHBEfLcUhtwtyDO3kvC/ri2Tw3tqHPQXID/mEUBVweWLFujrrpqhwVTCn?=
 =?us-ascii?Q?jLd/+E2BseIzEaWvW5A2Fed2dGmqZxCcUU1hkW801Bq0wLqGfCS6m5o1OvKa?=
 =?us-ascii?Q?HxLGn278lh7aG7li6N5yQyh5+tspfI0nIIp6ebGlZcZbizkK8zGIcQDCtP4h?=
 =?us-ascii?Q?+LBnz5QCbDEsR43oZQUKW2ZskMgio3V9jlpF+O36oBNnB9hIYRQP0W+08wIp?=
 =?us-ascii?Q?u9TMktYISg1m3GTD2HNwb7g58bfHblEAyxDpWy+7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe0b346-e397-4af5-fae8-08dd5a040d2a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 03:32:40.6237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vmj4+iiQ7Sv0HEkXL3ha+XhLVVXiI79uFb7gRoGKnlelkQBjUHiKaSm7FDI+u1w5TVJCGFgKEXwcTDqpWU9RHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026

Add compatible string "fsl,imx95-usbmisc" for i.MX95 platform and
restriction on reg property.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
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


