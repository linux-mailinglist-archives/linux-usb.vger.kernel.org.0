Return-Path: <linux-usb+bounces-12269-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0B3934BA0
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jul 2024 12:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 393381F24112
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jul 2024 10:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4267C132112;
	Thu, 18 Jul 2024 10:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="O7sBbikk"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011046.outbound.protection.outlook.com [52.101.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1640712C470;
	Thu, 18 Jul 2024 10:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721298401; cv=fail; b=CF4DkQxGNdqjP1aItjdc4LnnV2pGWRRjSc+nUrdW3Sq2IvMJ59eJkSp4iZBm7nBm3lNam/X5j7PJe5d/71JFlJrEu4w6Msn8BKTJbVbSyitCKTCU9ziAJlThe9uD4iQKglFD7AXuP6OGVrsJ62lxqxgw8oXiAwtY5f3irVzsZ4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721298401; c=relaxed/simple;
	bh=yFf4wpknYRAdBvAAXgrpsm4UZNEk13Rn36bT/e5naGw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S4ggMMjD5GQLz5UsC7a/UmCP1iQukSR0gshn3iGze+K144L9tWos4wtBXEcjpsmUkMWyTb+93tpna/AaesX7KIcYtLCtHyRftf0vHE4xYmUyqspVzgsMKHtC3y4lCQcFgVGqIKh4jmOVxh5R+kTmNfItdwG6JWQ7Z0ACSpy/Cf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=O7sBbikk; arc=fail smtp.client-ip=52.101.65.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hlNze1qr31rjXNg2Dne0NjCNEmJ0EKOAcRdqvNT8b/I25BkOxhfi1t4uLAj4eklyp4aN3NSgECM1zQBIAZprWe8EMey9IUiRkMJvcqON+tGgns/fzk/E9PfNTJNB9U1rvMpGAZgv8N1iwKSs/mqEH7zuJAKbAi0IvadwcGTofDu382nYZZFE7edlnAdLv8e0MoVjTCcswk4dv6taW8QxE06oPXWPCqgmSjyB65w6addiT/BnP39pHUdl3NlNPGPWCkpOk8hGvMXeLZu9m1lv0Dj0ZtUQqe9pGPVD/79Dx9J8U1dgvbh3Ts0Fn7ic0lysCs/x0wUlc2PFdm6sJNxnkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moImxgU1cnIjGIS623G3ednFYdspClC2J+dAMdHXN6I=;
 b=yaJ/IJz8W/skEBSGKDqST49CzTIvVxG4oFAfaVrXtdns8t3YCfWxTunRA99xEqw+UzdLrZJ8LdC3IgiZDFIhnSGYXiNkkZ970vHKGpjeSAhuEXdNRnoCnRytiSLInyby/kZIsAnw61UARprI0TBhoHn3IGRN9K9n+9Uc+MCRH/uWFU9Ti5Efhzh+4D6I5FY+Kx5KR2u+9JEAju04yfadJbvf2NeTrnWGUUIvmh0tMCbEun3GGWwfcJARDwk85wH7DocQ82BPdxZ4e9JviMv+qNxc1D/WVLC53yyHdo333IKYsPNEJjBu2FdsuKkEoWKjtp14leZ48rnljhoFQXn2vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moImxgU1cnIjGIS623G3ednFYdspClC2J+dAMdHXN6I=;
 b=O7sBbikkgf4KUOwyyFOppPeGo5hDuoSM8Zs6PNL9RKr/NoQCSQ4SNfh88RFgwdzTxq4j9fAguN3l7HukWd6EtKXuqxUwdmrBaQSbGxaJd0txi70g6JNPMXhjsuRQjLidbmY11Fn7QX8G/2KyQXzl3v6KZM+Tz7CCXRL8j/I5WZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAWPR04MB9886.eurprd04.prod.outlook.com (2603:10a6:102:37f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Thu, 18 Jul
 2024 10:26:37 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 10:26:37 +0000
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
	peter.chen@kernel.org,
	herve.codina@bootlin.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH 3/6] dt-bindings: phy: mxs-usb-phy: add nxp,sim property
Date: Thu, 18 Jul 2024 18:26:34 +0800
Message-Id: <20240718102637.3964232-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718102637.3964232-1-xu.yang_2@nxp.com>
References: <20240718102637.3964232-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:194::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAWPR04MB9886:EE_
X-MS-Office365-Filtering-Correlation-Id: 2594818c-c110-45bc-044e-08dca7141ad3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tTB10cfERRf1BjlqjwcEh9PfxnfhV6U/JMxOZcPowLvXsxT4/NzEBIY4sbXT?=
 =?us-ascii?Q?fLtG3U37UkXF/oM4Z2v13RIXbzIfRkYactajCWHjXZmBjTUzjKgUSwVE5u0n?=
 =?us-ascii?Q?l2Aoe/MzDlDv5vpifmMfIfqWi8w5kW9Klw6hJtMAc41VwHvLoErd4AWa52rf?=
 =?us-ascii?Q?xB1WIja/72Ovb26+pBffFM1yJ6VaXiXFKbHY2K1e441N20tVL3dq6f+ld+dp?=
 =?us-ascii?Q?TTL+ZlXTNvGjRxN8+bs3Mluml5Lq1IlTeYPF1ARHkwo403ro8zScvotjwIgk?=
 =?us-ascii?Q?11HOIxaHI0ouq1++ZydyJ730UDHrkl38+4+35J9bNRgNXA9Z11Qeuy0C17Y8?=
 =?us-ascii?Q?hP5tMChOenx/nQjrZxK5YFaUXeQAPvmEsMq9bUW5ypYmearWJEJLoKLMKJIZ?=
 =?us-ascii?Q?gOI202ApqzLpOY7KeeY5Hk6WDSUHSwfcn+F6Gje7pwWy9uan7xim856J1+/h?=
 =?us-ascii?Q?+JR67qdzwJSDPs22mFCettOCxDalKBshLhE3AcOeOcrtUOxzd0joT1LCj1o0?=
 =?us-ascii?Q?5K1UxZuwNy/VNd7CEsu82H2zRSmaChUGnGBiT6ug+Xir6KfKmTJhpcTbRszD?=
 =?us-ascii?Q?QlZ5tj8gxYFHeaujxRqzUQfKTRAyqJ6+KYrZpf6Z0KxZoDCiiW9KxZI8ht8h?=
 =?us-ascii?Q?3A4fjGbsG8io4LdMg5itPOT0z05YwiDEgMzY0sOw35Y/+I4He72gOE4bmzQp?=
 =?us-ascii?Q?o8rZldeQkj0RWYutMR/sRX2QeDlHwMicC7faLOCygDWywS/GYRbagPhkRhdd?=
 =?us-ascii?Q?N8A7Fp/CiOkA8HGfJFza7LKQRb+rP3PExaZGdUzGRGra96qdkP42FpK+wyR+?=
 =?us-ascii?Q?VwPkuFWkt4KBymB28ITENZ5NHWAwvJNO/I0TEp0q79MG1CUU7cY0QqioquYw?=
 =?us-ascii?Q?rTdLe34B2dkCq52yufYWm20SrCErWvFwplmrXv5iaHMDZOFeBuaPEDjv8L0C?=
 =?us-ascii?Q?vI3d+gThhDizHOidy13Xc2CnuJdBn2e31mzh/jEBdlLWf1EvGY/QK79rEc+H?=
 =?us-ascii?Q?za8f01i+h3zcoMFIvuofd1fzkbQhSnRHrI8VHbwpw/hRTINQDvX6fqQsCO12?=
 =?us-ascii?Q?MAjO21CojbmAzQA05v/W3CMZM2yJlv6kyhoIS18+QK3WEM7R90f+9Ujg1iwX?=
 =?us-ascii?Q?Vire2KW4svWzaOOyYpEoGJ7WEx4I8dqxhBlSekEhY2CaTwlg2wxIYuFna4OC?=
 =?us-ascii?Q?MdCEUKIkC6Ar9INYEYeoUmxKmsOoxEE+g3Mc3bpFd819OGZr2MLORi280neC?=
 =?us-ascii?Q?GulYJ2isf1xrM7alGY4NYDTWmasrqrnCUx55abGNZc6YZKNPHaDKIOKjEOmu?=
 =?us-ascii?Q?eDfDhPyrecelQkFuS2TIqdX5e9bjXw/jLYroNKTYk1cW07e239V12f4Wkql2?=
 =?us-ascii?Q?uypffkDQEhFMFas2w6pxA4nXvyUkutImaFpyZouEIm6aqAnHqYZ4xG8psw+2?=
 =?us-ascii?Q?4UcPybon+F0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DWAf6zNsl+M7BqlHhjNFtcbH3yztPh/9mIahuLm4Aj/GMcwg6Yhe7wryje1E?=
 =?us-ascii?Q?kioqSuclpJOnLnq9iOsz6mewCK3mPpSgH160D9jSPcd2rkEp5bAeNCNjXkpa?=
 =?us-ascii?Q?ubLoEnfAYoO375sIMLyUIk+WnUMTkXKbH09HwNkaTcT5vavJPEoJEXC8nKqq?=
 =?us-ascii?Q?42zCWe+rUDGIXoGbd8Mo/g5qG8SB5p8CQlhs3dtfZlHUa5LcWDJJ015SvbMU?=
 =?us-ascii?Q?YmomfyfgnLaCOHPubIvH3YtrkFyF2sNMqmVz+2ZUdi8Jrt4T1ECRqMIDvH4d?=
 =?us-ascii?Q?TYfsdeFaABzWR79dVG0TZo6LEv23WIRtxDwvNXJCm5DQat1tge4KQ6ruxYsG?=
 =?us-ascii?Q?WcnzxgSeCWIA1tsFIjaMDLqipvU0mySmrsXsYf+a93U2md2Gm6cGvecTg5f7?=
 =?us-ascii?Q?y4Od0AtSnRgUqf9vs8HfsaPL2hUq3KIMy1vw2K7EUeWiV9ODrdfUHMSRxNzu?=
 =?us-ascii?Q?hq1eqidP2MtzunU7fKJ5I3byfvaWNK4oaVAuRH/klwo0Tn9mYhooXhSE0PGm?=
 =?us-ascii?Q?0lH7wvA5L6+qZerXhkh/O4Bzk/YV2n9FQAmA/VFn1UkchLUGxrPWoInnGYsc?=
 =?us-ascii?Q?YKPKSKGb8m7tngpw5UoDfYbVgNkNtCY7KUInS2Lz2IA4Uh9qSmdglXDkyISI?=
 =?us-ascii?Q?DF6h/gnUjOH4SuSlYfizkUZS7+Zrn8kDd0kOeSte3bhB7buI+pUVu4SsclQO?=
 =?us-ascii?Q?P/Idp0mEoCpVDtJxmrUuyQkhIenQvkTWnHTYKjXBUisaMrW9Sj1lKLuO6pBe?=
 =?us-ascii?Q?ZjJqdoUFLKjfuVLF40L7//PHy8iakLvqBn6yMmEp009XtL4Cu7n/OxDeOtuL?=
 =?us-ascii?Q?3sgI2S5BvOP0/LGA4Hl2hubJRzZZHvnPmuO5RV4ettfHYZzzUfou5zeIMwNl?=
 =?us-ascii?Q?cGXjoY5nj9ODno81Iwsrrw+cjr0OT4fV40jW/ShaxzVKbFcj4cWlnVA15JW3?=
 =?us-ascii?Q?S5BzerUIKnCJPccF/+xmnf+lDXrVI0ja5dJakbiLsU4KlfRalEKdB4PCNgBP?=
 =?us-ascii?Q?9F5A6ZsUlKSj10ZfBi3TyfyQ3DrkGjI310AAnFFmIZY6L091gi297sXeQ0ko?=
 =?us-ascii?Q?V7JFzwVO9vqj4V5+D6Ds3xjkUY6UToFH59csIaZ2//XJ0Q19EwmRSUakEzxu?=
 =?us-ascii?Q?5Zrh+LQNpTeCNGbZ5E1wDoW9uFFcGtYHLgXnwkpeSsSOTfQrAa3E/+xpNka2?=
 =?us-ascii?Q?+Ox9BFMKEED/EC5oOc+GNGpH5hjmXzR6asCTVL+UdwRpBF6dkWlZ8GFtinP+?=
 =?us-ascii?Q?/EQXRjh1TpQEZiJ4JEs0f4EEInQPdwKhRtivJIe/L6U74Zv0Ll6Y0J9m/Jie?=
 =?us-ascii?Q?FUo9dbxqPqq5WGt5cW0WTetAj9frCXGES1ISxwSr4xneVkukLSNptrEmzWWb?=
 =?us-ascii?Q?lcGRuH1Zb1iJZNndmYMyzp3lr9ejnA8X6QgkdTa3uo4rXZPohd1ont9a3XZI?=
 =?us-ascii?Q?hTRF7ooh08bt0xui8SaBTrcZJLZchgk72JTnmt6p65PA0jWuiiBNP7fBZAYh?=
 =?us-ascii?Q?TIFWv+vHDOOwyDZGialVmotXPXsEFcULRy/f/yj5er3d2B6TSlmKXECkRvrY?=
 =?us-ascii?Q?tnifI8UUgWQ/uyYKXRbDh4H7m6JBOViYtcWe3VEq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2594818c-c110-45bc-044e-08dca7141ad3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 10:26:37.4772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epuaBqUzRMZ3bJL371h7El9yT36/VjR19u+XJQP3vGoYkJP2r8TPnOTw4xyy2A9BzrEUJksW2I1B+2+Ragcejg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9886

i.MX7ULP need properly set System Integration Module(SIM) module to make
usb wakeup work well. This will add a "nxp,sim" property.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 .../devicetree/bindings/phy/fsl,mxs-usbphy.yaml    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
index f4b1ca2fb562..2141f271f8f1 100644
--- a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
+++ b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
@@ -87,6 +87,12 @@ properties:
     maximum: 119
     default: 100
 
+  nxp,sim:
+    description:
+      The system integration module (SIM) provides system control and chip
+      configuration registers.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
 required:
   - compatible
   - reg
@@ -110,6 +116,14 @@ allOf:
       required:
         - fsl,anatop
 
+  - if:
+      properties:
+        compatible:
+          const: fsl,imx7ulp-usbphy
+    then:
+      required:
+        - nxp,sim
+
 additionalProperties: false
 
 examples:
-- 
2.34.1


