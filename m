Return-Path: <linux-usb+bounces-14873-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CD1972A20
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 09:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38866286574
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 07:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD89217965E;
	Tue, 10 Sep 2024 07:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dj3tRQEt"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010059.outbound.protection.outlook.com [52.101.69.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666C417BB1A;
	Tue, 10 Sep 2024 07:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725951796; cv=fail; b=O1IlojgGO3py75HEbSDmmOWQ0yb/e2rf/RsiCi8mTW710LpUeUU+RePMHkyfFNM25YePUJpj5MyRM9ia+bm3BaY5CBshABEOueZWOnTUd7plRij2yZnw2ApnlZz3x0m6nZ+b3MrlqGRlStTQ3u+fCIOQ6ecbNFiMoK4QuJPaKGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725951796; c=relaxed/simple;
	bh=xBJqrxooX3S3Je9OaHlAb21hysMHTSaUQewaPn4QjZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MxB8Ld2cmuWZ4YsbLgCXQhngAIXKWi9qhAD4a9GqhsTXr/588/McT94J+e+5wqwLR33w7SgU0AHUrMA2Knf+oSwCQ8hYAG3lt+uZ9HHB3mkCiNMnmkWkj3Ovb+y4KEWGravdkOMhUVKbSe43Z9zN7nl+omWr0aG1T/ZZfDLk2Ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dj3tRQEt; arc=fail smtp.client-ip=52.101.69.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BjKuBxGfd+olZsMjRL1sPdQhGss9HHOTae+pF504UsxjFsqTv9kaXbxGQbqjoZMYJwrsUI6JmuvUqmH/u2jyMFnb2J6YkrSrBnd8CJNGDKyKPfTlVxvxCp3f/L0EK7OKG1jOHSqow6EJVYpbNVAF35rnwf9Q+VeFPofkCn002Cu4a9zm3r9DZ7u3pdEFUoIopN7/I9rdOUszC/ks9sY+C7CK9QtBUdTNrPIJEbDKEKn4NbEKu5iVfPv6mHGabMqPg6bTO5WacbfpO0LytB4ITcvPokkZ/Khi/CbTL9z2SWfirm5MHZVYEvARxf52gzt03kcrhWF225tqZfohkpOChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHeQsr4uY2qVwmI/W7Jqc0dBatHvHZpyVCFCq6w2kpY=;
 b=aK3uvTBc5qw8Dn98pRih/wh0HG5dTLDG5wRJ+AoxbNVRjUDB0m5ljoiyMpcB88l52/1U/m9WP6RkBmmc65bKGZcSdl1vxuG7RnL7rO/kKMXK9dp+8lnNSQf7/CI1uID9tRXh6vXRuE9Jh9kQTvPMlKaoqiH2TZ3ZAVLG7hrWOXlUH+QeIPxkkHu7GnUX9tkK61+kNE5SSLILJNbJS3UjqZsQd2Xcq31JCzPeBxZKXk/66pKK+VuJAgPKU7gPfNPIX5BmTPnXPGag2SEdb0bTRwNrR1sMHQeQi4LglUKTPFi16Yfc29kyAEUyQRdqv821XCLWmQ0JIseRInztpgEAcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHeQsr4uY2qVwmI/W7Jqc0dBatHvHZpyVCFCq6w2kpY=;
 b=dj3tRQEtWCU+kXR0lbhz3U2r/wjgpflV260YKJ6znpV/HkBS8/LSshGH9uwT/bjbPYjH8qeZexLmZJ78fYi0vwY+hbWqzA65k6qic/IaASFu67mXLDEMAqhXkzq1CbGFcH3EUjp9PGiMdBQQ5gEweA8ymvmdhBgJnAHbiG2F7ccBUOqaiitVoNMIAHioookxl8HABqPi9qtn/hxzdihQguRPT9I78YRX9IobCxsEdmym4sXz++PDwtb9YOeVtFawvQkzGhzKqolkgjT+mC+gdxOOrYO93vc66/2r10atvTwcIXbfhDIoYvp9Ec+7tkFsyJUCe7tM3ApIosGUUG2XMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB8PR04MB7099.eurprd04.prod.outlook.com (2603:10a6:10:12b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 07:03:12 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 07:03:12 +0000
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
Subject: [PATCH v4 2/5] dt-bindings: usb: dwc3-imx8mp: add compatible string for imx95
Date: Tue, 10 Sep 2024 15:03:36 +0800
Message-Id: <20240910070339.4150883-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910070339.4150883-1-xu.yang_2@nxp.com>
References: <20240910070339.4150883-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0184.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::9) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB8PR04MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b93bc58-a46a-4ff1-a422-08dcd166a24a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LT5kEw5s54C7CLKX4jFOOf9XxaDQhUEoKf59EJLIGNeMLQR68yLxLhqm+N8F?=
 =?us-ascii?Q?l1kzH9j931x1txVrjmSdHCpMF8xNVEm8a6u1u/ROykYrxNMp1mzt89XiTwLo?=
 =?us-ascii?Q?BUMWInVeGFL/J9OmIxPIwTZYSptwWcoU4fIVya5GVyDyxxuWQJiLwWE7LT4y?=
 =?us-ascii?Q?7t+/2qVag0vRuje8n+ZEtsnwno5RylOncWSWenpzL+CutarcsC/5f47HDZAi?=
 =?us-ascii?Q?rOiUS8DrCALcDRh9S/kLwh6p7rgvKNKzgxU2I7KaMTxoLMTnfILhApKnxxyK?=
 =?us-ascii?Q?q+wK9/YvgdMpHRlSY6Mo7G3PqZNjnTjGgh2lBn9X7WElpugHuItJY3J8v8ci?=
 =?us-ascii?Q?nB5YGpW8pjKspgr6CJy89qiE61YMJI/Wft+o9ZRG9WDElfYvI2pm9zxeU1Ag?=
 =?us-ascii?Q?Ws63MuMKOgbdOSf2mfWTsbIh1cqJJcdBFS0NbzT09WHWyTxBEcVHt2fNGIpI?=
 =?us-ascii?Q?A9WDacahiITxzm9kIXPjO6PxYw2Os3DLi29ljZqfegtbaaEQgueK7PBFB3bW?=
 =?us-ascii?Q?v7ChlufUsi6QVIQ1HRvNDP2wNjZGZs8huy+fqhXn22GGvT8hxHO8kCSkmzdv?=
 =?us-ascii?Q?yUfUxkiPUt+uKDMBUb8nh1j0KtWLfuci7DBxcqfLmVV9VNCTmiOHfWhz72kE?=
 =?us-ascii?Q?dpFTG8yTE5dDt7ob1zbf8NCjcECj/AIUPywt7ENMXJv0kcvy1tkhxTs9DKmM?=
 =?us-ascii?Q?n8KnHKHtXVhbw1C81VPPia4KCtKie7l7lZgxsPuQinWPFR2EN7b5Zk8LQ9hQ?=
 =?us-ascii?Q?o6VbcX3gC+qv4x+7tHiQ+VfR02D9kaVghA3fk/HnLnr8q5v8FsbAPhzZOXTR?=
 =?us-ascii?Q?pGY7HacaLq1LXfgi2TCjARb4aMeqfBGEjwJfWAmFkYDjT4GlmCxBA4HrmLJT?=
 =?us-ascii?Q?qRMs7NHhnaLW2xIl398csKM/epvD/QL+++fbmcAuvP+ZtRh4TfM92MKAJEJs?=
 =?us-ascii?Q?iOM/uRIHpgKOKT3LWCfwNNkWIIGG0xMnoFKMzl3zIpqHkgZKw9Gk6F8UyBAs?=
 =?us-ascii?Q?JzYbKEudMaZsSCduoyMzqppcQN2zRdxzmR5efnoq4CF0s2CW7QBeEKcYmtlJ?=
 =?us-ascii?Q?8qiRLXyMqupGBiSW07elxtZHigqoB4rWJe+cmybO91diACNvbG032UR55Sx1?=
 =?us-ascii?Q?p1h1Y0EMBeUcA6LsB/r5LI64SNKhqxtrY9SDgsrUd+O/W1BYNhjLqxp96yro?=
 =?us-ascii?Q?wkcbz85iut5Z2a8b+Hwg7KrhtV78hSrKm6NtQq4mQ5zM9SWPnGpuLYrsD00B?=
 =?us-ascii?Q?viOaXAs1mNNFLgO+3UYj+Tkg3Js/QEIxz5m+ZZXX+6KStvK32/XM0ATVUpZC?=
 =?us-ascii?Q?DlJ6x5x/kE58O6xNehxr3DzNV9w95OUlQCu1iAEI/K3KnsDvR6TFY5ZCUL6q?=
 =?us-ascii?Q?dcVkodHoAnIrx15cWbdfgTqf7yJppoN66bLOeqOA9hd+/0mMKKoxw9TYi0YS?=
 =?us-ascii?Q?XBDN1LKyLj8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EsYDNAVOico9vKlggkZEDW/PyHdJN+5gitE9u5tEdrf8WM8IU3d/RiJ2fV9L?=
 =?us-ascii?Q?TDRkVeASjZgPLC/UYJi5WixVqZ/nlySmdyXnXQGgJ3QOVIPedN11DMPkdPn2?=
 =?us-ascii?Q?IINTaveANaVtYPqHgLBsaC8mefXdrcZElnHnmgf9cc9WLCRhEylf+XrWirrs?=
 =?us-ascii?Q?upjAW3s9BBjJC0DmTUYvZ4XbTAJ3NzMqh1teIfAYur7+OZAj07PBvZMxyZev?=
 =?us-ascii?Q?4u2TVOXAWlO71DUKIKrFa+QD0jj1UzfQjrN6Dry9iSwvNK2g5JwYF7hgvhkh?=
 =?us-ascii?Q?s7js3i2CJAM7mKkkVV4b/l/QP0dunnnIFQdKig16u5fB+2+RcG+GyWU8KUmP?=
 =?us-ascii?Q?TG/HRMg5J+RXrdn4QFT0WYAqshh4wfCAxqVrdrKP6qh8LYJFFgxzn74vhHGS?=
 =?us-ascii?Q?mncjrhTTciUHts3AL4Bbtluh2M13gkpePlqCfi+uJ92leKYCNwSHh47jFHVh?=
 =?us-ascii?Q?9/4LngTR2PrVFKtkjbdLYp6riEZTtdfZ+gwbuZMjT1Tq1xR3eh8niz64bmzD?=
 =?us-ascii?Q?4wEsZN3uq3t0Gt710MEoovWm8rf5ClJh7x+cdwlE3uiH1G0K5Mhs/Z+AsCrj?=
 =?us-ascii?Q?UpB03DVcwM1HirD4xYZwMxHIOoLwqsIgFP4ZRJcq+hsfFmJJ6IH9xMX+leMi?=
 =?us-ascii?Q?eokh5L4O4x6k8ypYd8A+mbmba9Ca/iZ+d7aD6BIAApJQq3UIf22oNqYDmIW/?=
 =?us-ascii?Q?ozriRDki3iMnN7sd2R6uS08kpYn/sON6rhjW1iQYxDZn3ah+E6/wrk/f8Mvr?=
 =?us-ascii?Q?ftC/ivbyl7BodckeO/zh3KxLmN/alwPJWHzUZmD5c5eqzW87YKIQVD6jVGvP?=
 =?us-ascii?Q?BP6XycnBexvOp2udV07Fhsb0t22C4iuEzx506cqrraieoQ0c6pPqIwkCWu+c?=
 =?us-ascii?Q?MheLTdnws9arE7ju8EmpXJ019hS9y96j3DPylA3103BYZAu55mDGIVl0Nd5k?=
 =?us-ascii?Q?O5d1gn27mm21bPTHOr/oE4JwInShpqZsV1eflJWzEGIdpZFxVZQwVyAjGvSQ?=
 =?us-ascii?Q?y2tHXIrnu0obDEDSezE/42c4+iRebO7C4cceUwQC/N1iVwh6D+ANuUc1NqfW?=
 =?us-ascii?Q?8eQcdVkovrrMgYFQoNZeQ9a/V/aCI04xX9eVlzkcmfJWVtTncjg4VCMicynL?=
 =?us-ascii?Q?cKDKhpmAnss2q9EeUTPmicn/yaQSdjVMGq/YAETQ45iXhwMjeh3CwBefQrcP?=
 =?us-ascii?Q?OB5DqUcI5/WVvHQCJeud8CN+hu7QHBRPargZGhFfc6eSP+lN5JU7k8FPwXKP?=
 =?us-ascii?Q?FgA5CM3AA2Htl6a3M6+Md5EgiwBUHYlBkh+J53h1WXLNdeXuOhaMdZbCI+Di?=
 =?us-ascii?Q?NTkYpwL4dGbmqAnO8G/aZTg6KFO/04jrf7/vXlNX6G8AWwF7MzB90Y15sc/b?=
 =?us-ascii?Q?IwNx7d51+nFS0oypdj0lnv+fQ+7vxBvZ5/PXzL8A38sFXp8qLDXUibSAaG2T?=
 =?us-ascii?Q?PQdHQmzxSBNFOEJXBcwASJips8ZO1JLB/0tBz6klGg107e5ICbCf73ElxojI?=
 =?us-ascii?Q?RxqOLwIaqdpQ69T3BzTzo9HGoEfUjpPkovmf38P6JBTTwN+P0YerJEHPinNW?=
 =?us-ascii?Q?JYnwqOhZAw5lMEdrypEPjfmuL/QKbCe4itcevWF2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b93bc58-a46a-4ff1-a422-08dcd166a24a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 07:03:12.2792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tUI+TQBBD3ZEDuL2qWLxyMn/frnOn2vW2XCbQYlnWYaGdSmiI/3xmXVMeyIgYQBad8MB89DhzM/XlZd+MMMa4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7099

The i.MX95 is compatible with i.MX8MP's usb controller. This will add a
compatible string "fsl,imx95-dwc3" for i.MX95.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add Ack-by tag
Changes in v3:
 - no changes
Changes in v4:
 - no changes
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


