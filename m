Return-Path: <linux-usb+bounces-12878-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A597F945AB4
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 11:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37B24281E00
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 09:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374CF1DAC78;
	Fri,  2 Aug 2024 09:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bStuLEN1"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010020.outbound.protection.outlook.com [52.101.69.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E32A1DAC52;
	Fri,  2 Aug 2024 09:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722590211; cv=fail; b=nGbodq5hN9qf+9QZMRiwTBrk8J5wYjiovnwR+m4dI63qxG39YdW/OeZ9q114rGZmkOBOywmS6uMQKmB7Zry1pMVLI8xmAQZWuqpXCN7dJh6N9KfolScSZhF0mPo7mlS8gStAh8uJPnMgk3QFQLGb7SVdbRvCcrOTnI9xtA0Q2uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722590211; c=relaxed/simple;
	bh=JUUUN5FjkCJfVhnS/mqekcUAWZhFGilXmvYcltOXpns=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CA5PT2KeJ0V6BY9hZn173ylnRV5vDkqy01okhoKxWheiWwritgI/mxQ+6ywSzPLmdjJSYy6S97tC5Si8ilnRrVtvIqSkAqrVyxJ0yI9CvCDc/QULEHrMqjDr5m6wguAYlebQeC5inyR1BHL6nvegH3ATkQLpybsGoN+4HaAeYNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bStuLEN1; arc=fail smtp.client-ip=52.101.69.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6n3xGHzWgs2alu+GKiXYET7YMcfwTwpC3MMzlqFKEXGAIm1SdNV7n6WysjS0kMeKCr6vDs0xKyzaNpQs9VCTw38ySRsTz43UkjKqLXW4SfD+ySHO2077AoiRsaupPfbsaHgoUTv4Av8pQFfjNF078v0XVvBHgGTgC2TM7Qd9uH4OffRrbza17I8cYzm7+JCL1j9End6rNvXuiDpa3ZYa8HBMvo8MLz8qcRe2I4fXrAey8bNNomk+AXy/MaO4seQBSCNFeqdFs+rHgj2h9Gnsttlx77aqvqodqxyPDL3mpgudRsdmKemD0HeJBTGDqZnMv5tkJ6GmoDL07lZsMqFog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPC4rqkUCUq7yvH3g+bpHsy8zDR7cfQPiijZe3fvh0o=;
 b=Ot7r77Ku4xoPBQhZow9uMiylFSE33hjN+1RM3XZv623rlP9pw83L5udAWJY6CuJLPYaQfPYL52hg1ems9fx6d1QHAmGCnhusyxuRNlQ6ogYPKT+w4uTzAJKjiijoo6MNNxsBf1D6PoqvwZRNZ4lRn+EQLktT6PBaUR+9dW87Rnw8dL85Dn5DXFv9OTcDx9DQwdzAzQ5jTctN/LFQE4uiODUkXc/d7gNnoKtr0v+hl3Nid7182uiwjV3iY9z2EUitghGe3YcfdIz+akseocQ4/jWpN72hcCCoYVP/k1bNfNWS+sOalir18WOCm7QN2Ct/RvXKvbUsC3Y//0bNXIMauA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPC4rqkUCUq7yvH3g+bpHsy8zDR7cfQPiijZe3fvh0o=;
 b=bStuLEN1dasDKsIqfApBMxHzElUbrdWBL8Tcxfun98DnnYNj0ZQONQOICuSP+LICa3LzjpMrpLOdUME/jhJXevFkEHqv4PgQZHzE6goUvIi0Dwcr5riwQ6qz5xBcMqxkGAASOXvCE5/33ZJiMnCjFoZCKplDjZlQ/EcspG4KD6522ttbj57FJ/QqHEQh3b5gKCPpJMDm4liPfRnY41Ro3N+3qqMPvX9QeV4iJnaVMBjeyNsAJA6bnd868CUUJVQ6NYkMZvFs6MfpNbzRjECDpDNcoJ5eY/Z1kAOJVHg1i9iBKr/0bT6EctemqGaKLsCLpfRMMXZj/naeSfUY2AoybA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA1PR04MB10577.eurprd04.prod.outlook.com (2603:10a6:102:493::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Fri, 2 Aug
 2024 09:16:46 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Fri, 2 Aug 2024
 09:16:46 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	gregkh@linuxfoundation.org,
	Frank.Li@nxp.com,
	jun.li@nxp.com,
	l.stach@pengutronix.de,
	aford173@gmail.com,
	hongxing.zhu@nxp.com,
	alexander.stein@ew.tq-group.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: usb: dwc3-imx8mp: add compatible string for imx95
Date: Fri,  2 Aug 2024 17:16:59 +0800
Message-Id: <20240802091702.2057294-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240802091702.2057294-1-xu.yang_2@nxp.com>
References: <20240802091702.2057294-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA1PR04MB10577:EE_
X-MS-Office365-Filtering-Correlation-Id: c2851f6d-2645-4c27-3348-08dcb2d3d52f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xlhcR2i2+JCfsH+Zo74XCdYINm9ILUCK8yIdb4OS41OhlxeJme2uEb0yGY/W?=
 =?us-ascii?Q?s+LU9Ax5TEY9AwVJH13wiWrynEz9GJTe776e/WsVS9BBtn/0CJGavlzYgE/K?=
 =?us-ascii?Q?A90y5l5Zgga847pgcS2kuE+oXXpcNipYkBrSRPFvWIaohXyNSt4IzulHvAUq?=
 =?us-ascii?Q?FXMZsiUAZ2HBHZPyYFfef8swQLHfGsyqM50Y9gmnl3DbkywJs1jUp07V8t43?=
 =?us-ascii?Q?8rvnREkQajN+nT/FgKw44X5sxjvzLS7G6yQOG2h6YTlO9APyarlUYeM4A5zS?=
 =?us-ascii?Q?2qw7h7uSWXajfMMOBZPBlkj6EHgGB6VcybcxePU3tMWZh2TVFXTRB0wtVc/f?=
 =?us-ascii?Q?k1NcWn/V8FYzuGJ94SO9rj09+X7fbEyYw9I33kqm1EK7qqW2I0Kpiya5WQLD?=
 =?us-ascii?Q?51mhYnRaux3JqMq7ruDu+c/TXjsmutvPQlepJ4GdvqzxOpj39uGDUO3dlsVl?=
 =?us-ascii?Q?HBvE1Uv5w0leCsiVWLWl6kpX/eOkLRnARrd7iyBRoFL94ftIMh41Q0TDWBzr?=
 =?us-ascii?Q?DdM+gh/jZhzJeU11m4pUBOyrLqrjBQEYpgygB149+FyMK2Te0H/p3P8yG758?=
 =?us-ascii?Q?wUW0rkmXtVhaB+P5RQGx03OLSpM9UM/vmAlPQy5ieAYtxf1tOObjFOXfoUrT?=
 =?us-ascii?Q?ngy+krVax7ei1mvOwWWG/rPH/5RTrXvs7oOBfLQtSXXsBXkEm8FNng4WaGTn?=
 =?us-ascii?Q?OE3pGo+izwIVnaSlitF7KvVoChoSWGcld/w0tzJbUyY5bBP0BuPxER1Db8nV?=
 =?us-ascii?Q?ZI9kmktOzlpA5f5zCL5m4ic71RzmLePZC2jWZkVuSjLlCD2ekyRgxNYaphv6?=
 =?us-ascii?Q?SepGT+2mN1dUv9GuGusxmP4SbpIeP9a+nW//GGJdL+AOY8mMWl4h6A9S/toD?=
 =?us-ascii?Q?Bq6oYlUjkQ7P1rDhLOl+oQ8bBOJkyfsa+g1iAqY3YfjqxHqK5BmvgkOi+IcB?=
 =?us-ascii?Q?8CtakzgnOmgNQvYGANrPwnrftP71yx07THqqwmzBMITTA4IxYZP+g+UmUelP?=
 =?us-ascii?Q?5wKjeuZahn/lG3VJT52xC1OWO1DfqZsg885Lxt5hd/ap99qB5rT3EThqawwA?=
 =?us-ascii?Q?DVFgoz1idjSt5q6WYt+YRJ1Mdm5m434yUBMUxEbonVtXEFH5nAnzCTiBUZj2?=
 =?us-ascii?Q?ZviCL/e/03hPCBZ1OCuRsTpq1SX/mTy8voraxty1hxMl1qzfFu1+ORqhG2HT?=
 =?us-ascii?Q?8xAgikNVNR6QuEnYQFmiNSOiCOVosCKUCdJvgl5nhibcvBOA7VR/XC1bow/u?=
 =?us-ascii?Q?XZgfuxNumu9ixqeGm4EpzZGEq4LJdtTkXOsTpq+xbR1UfAVVBQ8Yi97Uww6w?=
 =?us-ascii?Q?Q07nHXOno9yu8/M1rybknqYufpXbqet5A7208wb+kKZMYCg8mh2p+xrruJeO?=
 =?us-ascii?Q?gr/qsh7s1AgnNVYSprlBOIgEJk7+HHhZuB+3PSMvWcfv5Swu2x70lZ+ubjRL?=
 =?us-ascii?Q?TqZtos/XLlU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vEQp/+oMJvSzWuAxDZkQTFlziYjpS/oKFX4wz1YnBUp98i7rb0+i/xmVPCjh?=
 =?us-ascii?Q?n2PZHb5BdXKJh3dyyJSYZH13btv9pVW6yjJ2Ks+CZlardAopL+3QkuXqFIpH?=
 =?us-ascii?Q?B7NpIasTy8QGgikay8aNPcC6lnI1lLPoTlcP3ZoV7CWIDM2hclo4iRWt7t0y?=
 =?us-ascii?Q?kEe2tkA0FvpqBp7Q1L2Yym6g23O4aovNXUQns6nRhkIJRp0Eexsy4V0yjjQK?=
 =?us-ascii?Q?PVGWclUB2rTw6ZWPoT7ZaQ+WUnzsDJ/sA7hIgfPdpjQQh+sQAJ4LIf/8V9ii?=
 =?us-ascii?Q?shoq0bIATP1OUfwVtZIu9MWM/d/QJzTzs/XDBu7VBz+kOaKJjQVJ/3bIGdQx?=
 =?us-ascii?Q?Gk1ANGih7dqQWepBBuSJX7/AELu686c5nhAfIEPKSgKMjygGpgmVU0yeebFw?=
 =?us-ascii?Q?xWGrlLOt8HNuSHbgRBN2+WayYV3/Etj4IfpW1wikSapwxUS3iHDmKmtzkFpX?=
 =?us-ascii?Q?s/5wiAEFcbAUU7GB1+Xt3fS6XyhuybrBiD7WfHqOeoiIUQJUGOMuS6OG3i+l?=
 =?us-ascii?Q?tGiplF+9JweSrauyRPy8bGwRBJeeV9N6N40Hz7RAfQ4O4ZB82nwgV44HQt8Q?=
 =?us-ascii?Q?92i4s2Hqax6eUtWThPaWBmrckfNAONgndC8i0a4i5Mryqq4bsZ8VukwlO8Ig?=
 =?us-ascii?Q?Z6314kQgyYC0UhGTx3xqtGeKW3O0EvRta3S1fPGe948GYuSSj9QuPpRWQTKc?=
 =?us-ascii?Q?VE5MUpudSER4wCruIBGNRy5w+t13nfZq30EyWMHpaSJ+i83PQ4g8ifXP1DvI?=
 =?us-ascii?Q?sGqq7nEf6W2KeyPgBEDI39+EwckuaBJqBcq5Vq37BSrOaeJvxih3iiJd6YKY?=
 =?us-ascii?Q?3J0C6i9DNmnR8V0wQHhQtVWDJaxPOxVq3v6L/mhojwIcYxzE15hau5hxd4Qg?=
 =?us-ascii?Q?nD2WbgHHzXEhd7XhexphDcN/nbViwMb6GKH6KPRmQQ4tqOQ2gY4AMlAMf19u?=
 =?us-ascii?Q?ydQ7bV9U8dJ/cHlnK3uRpMQdJ3q47U1lsYit2401dO/0zcbDzbx1Uy11W2Z7?=
 =?us-ascii?Q?UvqNNy9+55EPUzrJNPQmf3MgziokPb8mKAc/MJwNWdigX6bH+zDTn/nj5Dyh?=
 =?us-ascii?Q?Z7sRAAn0SBJZJnLFEZJN/uNzsL8af6uEYV9V2IS+BsP5Z+ODor3lARWJCP+z?=
 =?us-ascii?Q?VXuYSoy2yzST3XjAUpxBfd1hc8kSWThEijA3GflYmvA/x6FEa7GaBs1/rkDW?=
 =?us-ascii?Q?ldE4/7UZwUMscsJbRFPrx8m60xPddAs+z4ORs5SyoNoVSz/1Oft1N123JzO2?=
 =?us-ascii?Q?QabUJfCdZ1s7iC0tZdgKuco+edPtWKjseiejEZIzluYPeHEV+cVrU1ep4Lgg?=
 =?us-ascii?Q?1LG0Y3H7ZKt9cTnDhHIYzvcVA6f0z4kJ1yjN/YerD6w2oU31vOaa9E+tDaKu?=
 =?us-ascii?Q?PfyRjQnEs2PT6pFaxKkiTCofINsF7+SFcDikiRJysdhFN01j7TW461qWBLym?=
 =?us-ascii?Q?FYzL/OKGAeh8g4SDGUPltnCfpSrD1JJiFcES6bIb+F2uah77mX4PYhH66M1t?=
 =?us-ascii?Q?eDP1qlfOot2DM3zIjUYsctultWSrhwO/nAahn8YFnxwKaobkJXzgk87Npl4S?=
 =?us-ascii?Q?wr1W1zPpod/wW4d1e7EXbtZKCX9Lveq33/V0vDa/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2851f6d-2645-4c27-3348-08dcb2d3d52f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 09:16:46.7553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aqATfMP43k97eSpUVYi+ELT/Si0+cVKI1HGKFxTFL3o3uIoHlJAZapbm2Mfz/ZFpElWg/BrFefBkSOKMiFvtTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10577

The i.MX95 is compatible with i.MX8MP's usb controller. This will add a
compatible string "fsl,imx95-dwc3" for i.MX95.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
index 9ea1e4cd0709..baf130669c38 100644
--- a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
@@ -12,7 +12,11 @@ maintainers:
 
 properties:
   compatible:
-    const: fsl,imx8mp-dwc3
+    oneOf:
+      - items:
+          - const: fsl,imx95-dwc3
+          - const: fsl,imx8mp-dwc3
+      - const: fsl,imx8mp-dwc3
 
   reg:
     items:
-- 
2.34.1


