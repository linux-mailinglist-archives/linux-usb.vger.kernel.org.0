Return-Path: <linux-usb+bounces-13123-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA599488C7
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 07:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 829DB1F2388E
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 05:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26E31BBBD3;
	Tue,  6 Aug 2024 05:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SE+14gOh"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013010.outbound.protection.outlook.com [52.101.67.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A6B29A1;
	Tue,  6 Aug 2024 05:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722920789; cv=fail; b=T9fKhSltvU5c/S8cVfKyrYmkB+DbBZn7azvfambmLDimFQYjkIM3Gev7EwAxwzOMIydxVUCIFMKq9GKP4o+y/1KeULUz+fPVUMWlAEUEv9EQeYFpMzTQRgd4HUx195YY3BdCNIoUr89fYipSokFrrPzz12CoDKMt44epEADUFYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722920789; c=relaxed/simple;
	bh=ozfqJqhatnLKVFqH3hV76HUJt5PNUh87aU49PaYRjkY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MnANnkeEby6t8PIYXdoSL5wkOuwYRQV24fozjtW81BTO9Kkzk9xGbm4+ehrHI3+3QIyUczJkP8953Ms170mVpX6VZFOpzAWljbM+wy0bluZI4V4N4JGpLa+MAI+czbLTbTvJrAWW8uEXqUdkiVYq6cu+p5WroBarQVpY/jE2KBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SE+14gOh; arc=fail smtp.client-ip=52.101.67.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zLFhKxQg5mjKjbQuO5xvfxAEdjLWS6wlfSjNYhBGcq5anccPEE6ltOaMDQp1LaElp3OphOA1/CxyqIYo/v1bUC9MyRmWO0pxAXZwfEAXZypwZ4y9dxcRqvIeTGOG3nvZwOpLNjzXlF+aBC4NdvwMfDA6EYbGHMEkDebVRZfguG7LRMWLgwVQwzhHR/kGg/2C68Uw25s/aDoTRyzLCG/rmOysIhhzp+W8YwXuvq7/6qLuxgRLGXHu9RMzIrp6AICgIid0Csr0VsZvrbiu3Zzg8SKKNpFZ95bNn4LR2ujF2RhBZBbYMMcxQhhdjO/4M+YnAtY+3y2c1IUlosx9jF9GQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rO21Z84TIBM4wX/0k273hxCU699eNOPvLQflKz9vuns=;
 b=btY8JgtgjD9R9hYfeduQfaAQuDviqmNbj7GqM20UrkV4BCFvu82b/hfkDxZ6xtyEAp8s0D2tpreLs1g76tgWyJbuO/cZQqINnjAJj7S4kriapAjeAbxHjuw06DCxUNN/tHBE8Q4WKfsd7e5b8jRepWoRnToV0BK46OodMOGrycAtBlx3/DWaDlF0fD6JVIlKIjSGGB45PJ5XnnTn1BZMloLq4COUjelpsUWYfA8W/UXnb8Y6tSuct9aIZoNHYT0Mnv31fu0MCR0UIoRRIf+az4OIP4RzT0uWOtQ6qUJo65idOJYI7av2YbvgrlLyNk0n0G/YVg08qUsUnA8peOWH5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rO21Z84TIBM4wX/0k273hxCU699eNOPvLQflKz9vuns=;
 b=SE+14gOh026Kh7rI8I97ffmrvp3OMN//b+mRkgloDDSgGA3rbC+YNjuIHpmnEew75Vq6BalADbfdynmNDtp9QMEA/khTOwl5dKg9PVEkX2rP3BM17LN8eLo3x0TcDsdP94eQ5wqL6Knjvf9XfAmL9va1kypDoPeCAXRj8HVQn/N3PsFhC49q47nz2w9Yu279sP8JwDyysollFUf6DB2S29t8bWRMcGDZbXCFYX0weaDGeJ8g5sVZ+xk0cqoP1bWEMLdpBaKeSE8QnX+b/C6QobkNiGAdyEbeUCkGVZ4nl8UTJHKLGnOoxRCCFqEfeuKaYz8wk4nwHNhVrZrj/aqvlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10211.eurprd04.prod.outlook.com (2603:10a6:800:240::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 05:06:24 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 05:06:23 +0000
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
Subject: [PATCH v2 2/5] dt-bindings: usb: dwc3-imx8mp: add compatible string for imx95
Date: Tue,  6 Aug 2024 13:06:36 +0800
Message-Id: <20240806050639.1013152-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240806050639.1013152-1-xu.yang_2@nxp.com>
References: <20240806050639.1013152-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::33)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10211:EE_
X-MS-Office365-Filtering-Correlation-Id: 4716c78b-495d-4b2f-8d8e-08dcb5d583fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G8i6/g+nioDzMpdlwZCkIaQrUfzbgWO39hRkZ/HyZ/D9uClYRG6Zs2BwfK3E?=
 =?us-ascii?Q?WJDwhvbxCLQaExOQFsPh2jHSbnYdwugSSMp5+p+aI0IZp+/T4iff8iwn5lDH?=
 =?us-ascii?Q?LmSGDd98eNZVdquSVbRUYWZSC+FWoH6y6+GLY1/L5aSe2dPJoj7qU5k9BuLm?=
 =?us-ascii?Q?fx/V240zAAVANpnezKfAEF4khzGwpxFI4vWIuOZcdreTjDxAaSJD3gURgKAO?=
 =?us-ascii?Q?2cy2KnV7YKcNswzTvOMz+r/yk4YInWvNSevwYO/+YN5K3Xi4Wuckz31k4DPm?=
 =?us-ascii?Q?fmkjPf6NYlqMBA1vrlYpMcUCcKnzlycDRTMuAlEMYltNPpj/bqjSk+1wX5/G?=
 =?us-ascii?Q?nUoSTb6bpAJRvWMxN5Oo9Wa0ANSGnU+mvdN6OlodmyDOZw/83mZEBfl5Yeqr?=
 =?us-ascii?Q?wlss4nbwY80yT7gCzkuMWfVs6MpNVekWMtgZ+18tCvTEj/PbQorpipvKIE8H?=
 =?us-ascii?Q?kBvGf1TMTghLjwG+7Rrxq+mbI1YLNw5byKbuzGOFjRQmAix2jq6YLzumGwhb?=
 =?us-ascii?Q?Ldl3kqQoJb69ni14PgN33Pf6nlnybIj0WbeZ47tC/PsxUAo+ENI2XVtAzu3x?=
 =?us-ascii?Q?oqtfQdYput6UV+KyYvDrpnwOqafkuh1pmUiehohixvVSFATfV6R1hu9wVKEz?=
 =?us-ascii?Q?cudpm6ejzD9sNpAERZv6H5yGOysviLSwK2fLbW1kIKEhZFAsAEoY0JBmxbfl?=
 =?us-ascii?Q?JoVdGWEYOaLd/U94URxaHsVOI69hUCu4u6J+XNO4WQTv7XaHBc1BUu9YoSXF?=
 =?us-ascii?Q?SdI79U+I9g5AfS8o3tnkFfQ869oqu/GKrK7BxSgKmgxT9hj4jrf1J9YhBpQ2?=
 =?us-ascii?Q?8esF+bIZiyvrok9IsVHyjCyHj9LeM+TZ63D+u/uOofCWR6MVT/OYFxGrs4BI?=
 =?us-ascii?Q?dy1t6QSbJx4h63PxplRjVdaeIrSQOBRoeY6MgK6MVwlh7Z7x/QFANtEDKupy?=
 =?us-ascii?Q?vlemXlAXGqNbSGFH9oS2i5vrJDtDpz3c1po3aLdYpg9lA++G/VQXuGd6k8f7?=
 =?us-ascii?Q?CDW1yXUNRuIIDd+S6aml7ulqnGpyCA/n5P6F1NCgd8nPauBBUQ/4LjbJTK2I?=
 =?us-ascii?Q?JzEiqCvR/C00125krC4adSg9dbOT621VnOS+V4tMCbiOvQwxzJfaYc4NRjp3?=
 =?us-ascii?Q?+5ldOyYug3WuUeEW3iUQxaw7K2+y4hRWlXnlFn+42RdkLFRj3CUnfhuyKH2T?=
 =?us-ascii?Q?qO4k03Ha4xXMNO2oMImi9M7c4aXb6mWEX8VLkh0ianKrrjbn5rhz9PILvULq?=
 =?us-ascii?Q?D4zbE8c2nzqgehz/bh13W18tLjUQd0UE+2SMzFwiEN2UFHFHZTx8ZUUv7ksd?=
 =?us-ascii?Q?DnFSZwaquajIYMKM0S86AEWCExaW7v5IzUrL2HKUhX3/9nkv6zJwrvGBAdjN?=
 =?us-ascii?Q?IqKm+5o72cdZIfmUqdv7IVWxOxL9LdYo4CsKUdA7V0/Z2D552xRya87M+zLJ?=
 =?us-ascii?Q?JOEl/TJSjsw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VdEH3IeUqTYWEo3wKhzoeb5plsqeroxmEBb9vzs/FBneTi1XW60pjzj06Orf?=
 =?us-ascii?Q?I/VhjigHheuQXC7iZ44q3W2QA+Kf/LrCsvhdAhVXoRToMK/hjQyzZ2x5TwqF?=
 =?us-ascii?Q?j879P6/mlaABJDtmO6rMuz7Cj8Ci3LjhOjGjWweMirntLCslzwyLaRJXtoup?=
 =?us-ascii?Q?iOsWhumxbCTbuqj1UEBwUOTYGufcLb+QEFp59MXL+kSRygci9RmpRYbgnK4f?=
 =?us-ascii?Q?eWG+4ewxxX9fChYLRDFHa0a8wXlfCigFTdDBv4p2LozT69NbSxOLDa2S7gak?=
 =?us-ascii?Q?+z6NDQpKLl2yl82oJ4Xgms6PoEJX4nUMRSJzhbQWB4e88QKVuQyhGlbO8gFn?=
 =?us-ascii?Q?ZlUN2r2t2x/qHP6Vxls181gH/VLWwUOt5D48GEikZtXxH5f96LBK9rLfCeXP?=
 =?us-ascii?Q?tVjHzF+3ebGdzRzWkEDNTum2YJXsrKGSveS4wReP9YKouKx32+A5mhXS/9Ui?=
 =?us-ascii?Q?tBMFAWZ4OAn0iH20uT2AonZatwK1inQ8LfrXd7KhoOMa78jxk/l6la2iQNjQ?=
 =?us-ascii?Q?sfQbh5mHC3iOYNWFAZfHsQjhuj9Fe3FLeP+Wu2JPnxsKCaxz7q6pJ8CB7kYS?=
 =?us-ascii?Q?KWDkaBwfmmNdGCq206Ju+dcLz/VDtVK+BZEeQEQvsrkzrnhANuOJzjUOakHP?=
 =?us-ascii?Q?5HJK0QadkOQWVoRdvpx2TNuaT8EF83TNyW58Wt2JdmrWd8NK1FflkVMF6xMZ?=
 =?us-ascii?Q?qhyfYaU2wWnfUOH5wNKg3sC/s5ALKwPNy7feo6DX6po/sxILi2BgnEnofK7n?=
 =?us-ascii?Q?s9rodzn25+PMZYpl854CXJHATzZHUz4xnSrkmOvWqRgDSlDkwoyNB3jza32u?=
 =?us-ascii?Q?lAAmO2Rs61/qwiDjtzUkZvh0VKef5bkF2yitMMVWevbGWv6GoZY40qamEFju?=
 =?us-ascii?Q?XATS6JTBL0s9aFSoTMB8Q4XPKNVnxOrCaIq9zLCVpcCzCnd4j/sUsujPZsQO?=
 =?us-ascii?Q?5DkCw8qTP4zVb85zZl3DYU0Df9nRMX0qJ11B6Df1cAw4nVb95alEPCivTu9l?=
 =?us-ascii?Q?BBTIg2NUNyR3OHWV2O/32UJtnjT4lVdxXZUzf+cyObGgqci5NKo9NfYL4JmO?=
 =?us-ascii?Q?ss+KAWhXEVAJQ5g9bp/L7b+UCfxnQH+aEg8rKvRsFeosJhaAP2abL3qRKSbw?=
 =?us-ascii?Q?ULj1oDi4LRfYpvpFQDFKbKKiqiJR9e7ztkpIBwPKtdO4mad9cUEGxwcvpH77?=
 =?us-ascii?Q?lk3nytvhH4Qq+gTnRv04+1egJ1Qw3ZAuk9TdrccbgRSjeDmMUCEY4P7uKTbX?=
 =?us-ascii?Q?HmUrWANgmwa6A/Q7SBNXEdSYn/hoBBbwqtyTQrib15uGSldqKsQuAiMYO3Qb?=
 =?us-ascii?Q?zeRvuwLJ/zuyR7gj6RcVH9r6+HmeOuL1Hw7N/VP9tpk3dMM32q77L/GJayi1?=
 =?us-ascii?Q?s1oqnMlDDNCCqYdM/UJZSjoydH4Z4uZjY91fWJaUnPauGeSdmcg5ZaH7sFe2?=
 =?us-ascii?Q?+f+hQ80qSsQpLTjJ5BhF/hwpND6H7zTHB/BVzEa0j9WflLQvtkJyCkG9PGrc?=
 =?us-ascii?Q?UNgeQHWypxySSmio4ZkHz3JEVuSx3fMcTMfn+pvgjLqNdrjpbwq3Bjc5Ig6i?=
 =?us-ascii?Q?5AbP2elPfoYA0iNBh3yKaOKLGfdkbjthxA8NCBQ+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4716c78b-495d-4b2f-8d8e-08dcb5d583fe
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 05:06:23.0104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6B02pVPblQNv1mFrgjk92bpVGDA0UTCmjPGfemGMYyZ7RwfvImptTv3AGu38NRs40aSqh6W0C1AXBnn/Qx5n2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10211

The i.MX95 is compatible with i.MX8MP's usb controller. This will add a
compatible string "fsl,imx95-dwc3" for i.MX95.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add Ack-by tag
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


