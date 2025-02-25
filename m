Return-Path: <linux-usb+bounces-20997-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CF5A434B6
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 06:39:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C939B3B7C7F
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 05:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410CD2566DF;
	Tue, 25 Feb 2025 05:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DzO5z5Sp"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2062.outbound.protection.outlook.com [40.107.22.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53EE2561CE;
	Tue, 25 Feb 2025 05:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740461937; cv=fail; b=mVaNTmqGJgct6KejzjRIIVcrdc02fKDceUZJEenqfacmahSXuxu0bLdFNIqeqQkM9ok1OdwJy03kXSk3wJCEfTFD1zOb7YZTyq9yUbjRJ6q6oDJ0bui/+VL3FMqxcoL9gyFiimKPytCgTmck4ymN1jRU9d5S217+sD00IaUMmPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740461937; c=relaxed/simple;
	bh=599ahKJaKNF6uTFYMg6l7VcmswqLQmub2zbpTk04e14=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fxWQRKAB+9rqvJtvTD2SuK5jIMVAdyz9l3aRwmgUrEq4PkwV+K8Edq5yRNIsvj1x9Up/9TgVuVEDHjlNs5wQab+n5jfPE4RcDDnWXYz0dQ8ek0AfsIOjNZh6nYtn73u/BSZbcHcelOGwRD4TcbHPcXFfXxBgZJFjzzKFa9Mg+wY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DzO5z5Sp; arc=fail smtp.client-ip=40.107.22.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYHuzRby+oJBUQhvBsV7DaP3DxaVizrcl50/SapVi4G2nfZyV0h0zMArgLUjsfpCUncTiTNmwHpabAEUa4COLe0MNUnfcw9KQyWydEi/S5rfgY0OIK8Gk5QAUsak1rwxkn2yZ2vpxDROmDNFBUqlaIrUIBDPt/aSPQiH/JVoBuCK+RdbgB4yacqgXEWSMEHFqAHpwdoN7ISwEn0NvWQR4EqiRp0zKC974OpayQf1q9yVSS18E6JNuQokkJW+wlG/m9tGcYeJgwEQJtu3oh5qTx0jkXnKxYZ4k0ZP9V+8KCZmbnYrK+C00M4swNv1ZDKnV0UL3mzI/ID1x/X/TWZAaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XauB1RBY7r4cpWFot3ow8wsuJLSwve7IFHB+AgOyIvU=;
 b=pucQIUAYiAp6erbIPLIm/PQTX0GnZO2eInFyVD50bxqdG3Vw2lSPuX48LJX3vvs4YQXnzMPUaBRH+5eL2awWJRPJ56iaglVwrHKYjz3u8K9gVCajWkAWEwPzDjku3hfCqLNhjAX4k0+IeBapPGwb/Le4xbej/Rt8bTg9USVpsH1jby5S6JsKOLfqVrcVyimu+huCR79D3B+eiFeya3rXQzWT8M542Cb1lhLBBbugZqqo8wgHTp+HkUy1j0TYJcCP0l1FnXLwIYFlUVDRoZTAd9mPCbla2wBosvd3sEAD90ZeyB5d78RchugQJjBuHBt5a838n/bOWzh/ZCmBdhkE6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XauB1RBY7r4cpWFot3ow8wsuJLSwve7IFHB+AgOyIvU=;
 b=DzO5z5SpqYClbIAzqA/ObHiwilzFfJRz5v23iAt4Y3TBR+kkoMMlzRzhfTIMg6H9dXi4lm1FLDZaXLrtZPQhikzo4cWiCuer3as1K2Y/T7pypbwb7B5zmUDZzk1Lq6MSOANevbvgaCnT4gdTRj6T/B7y1dpLUjlxB2gQFIwhkRvPhHJ7Ku6O6wcE2T+8+0vbm3bqHmyRMi0qTmkb/GkRBq8TcZp27gApdgFbR2BhNEK8mQLBLBtYZS/1QOH/punZclWZG1RDDbh6ZYTxGE0p5DrUo38EobjH59vo0+ouZ4zwBIOqB3lTB5NjDq2XNgY4OMx8R24l+XAlibdwGsS1mQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by VI2PR04MB10714.eurprd04.prod.outlook.com (2603:10a6:800:26d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 05:38:54 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 05:38:54 +0000
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
Subject: [PATCH v2 1/6] dt-bindings: usb: chipidea: Add i.MX95 compatible string 'fsl,imx95-usb'
Date: Tue, 25 Feb 2025 13:39:50 +0800
Message-Id: <20250225053955.3781831-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225053955.3781831-1-xu.yang_2@nxp.com>
References: <20250225053955.3781831-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|VI2PR04MB10714:EE_
X-MS-Office365-Filtering-Correlation-Id: 565281ac-06a6-4858-b77d-08dd555eb0e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fqrOF7I2isyrgrahLvxNZ6gsimw3mOEw4Cd97mAwsrBBwkWY/eQHDhAM6kiI?=
 =?us-ascii?Q?0kB+zu9dIBEdkYiDepjOT+p4MciqiVcIxT/BB7yBdn/3rWzGA6celOtNAvY+?=
 =?us-ascii?Q?KygUFFmf0wQQ9kZE6TZk6fYsbK8kBKkAa75pOotodKrytiTYYXcV10YHQ+2K?=
 =?us-ascii?Q?FtUOxKWxVA43Yb5eXZ/CbBCkrGB//Mphl6FS8x1Gzm3JJtk9kIthBZZLZ8la?=
 =?us-ascii?Q?29UyWrH0E2uqmuvFbwKXlUcrB+AStBRn7nKbY1/RSTelvU6F0LH/ih7pDkQ4?=
 =?us-ascii?Q?WwE/Z7cwb0brfzR44NbP2GuIUkRSKG/eRly7rUPWBE3mvuyA0cyBO5LWBB5B?=
 =?us-ascii?Q?yRHHfsTxpCQBA6JprFKBcGaKPS7Wa7FNCjaryinxAUJjBtJvWg705Fb9Y0ff?=
 =?us-ascii?Q?l1WIig6vJpTEzPr3V1hqSdoyJpkiCKEGKwi/0WNx9Efw2rJ8SR+jZbJjUJ72?=
 =?us-ascii?Q?r6prM1ZbHNKeeDBL2lhLTg10tWFk+lPTSK2D1GyZz0y9kIoysb8yp9F0LSb/?=
 =?us-ascii?Q?wJ0EnZImW/lLtuWOMx2ybEG6CcKRW6YqtIJMbtgnmv7/XB2efhKPOBGCamxS?=
 =?us-ascii?Q?7yK3N0uluQTqONtdl9COlCWV1zksEavTsIE2ajydH5hSoUo6UrlBYf8+Xscd?=
 =?us-ascii?Q?Qhs/XHFb6lZz5UdiBTaoTyjuhwzl8WPKnIpZe3tDkLpLHQIXfmal5B5E7LsP?=
 =?us-ascii?Q?yYpGNAOx2wYBK8ld1ONKevqnbkmPp0MYBfkkkRCmV80haF1cq0xWNaEFMJjQ?=
 =?us-ascii?Q?ofAI3UajNll+CGC/8g/HYmmKdvV77KvhCmBNwWKUoSZrJzSrnBaDnV/x+zN5?=
 =?us-ascii?Q?NbeCaqMRiiJExyJL+eVUMMIpRl3V3UUE7IPUpHffLy2eMS1PVSjizWHBrI/D?=
 =?us-ascii?Q?pgp4rCJtC2jAJtymK0bEz4JlkeUJzwM8gTo5xvdK6KigmAxjHIOLcbWXLwuZ?=
 =?us-ascii?Q?s0aAcdKYBf+gq/o79SHGF2LAmSF5N+NLn6myCjUIuGtGqP5P3fQww3H2l65a?=
 =?us-ascii?Q?/oi9ejBmaXkiFudG/T+NX8YqaDKnvGaz/wL42hgUCfdTlDq+fs5K7t51qhsD?=
 =?us-ascii?Q?+K4omf4nR9WKl/MYxvuRu2sxtW9fSkTgPdhAQEPMSFa8mUyGvSP53g+aD2VF?=
 =?us-ascii?Q?W6BRqn84JGeNBKWW0XBpELWw7H+0YhbjpBHdBjiJaSChqsw5qU2juiZTa8cL?=
 =?us-ascii?Q?SpZabW/Xw+xm7LaSMbeUK3Pl0TxJni5msGdAoyy7NyiYOPrnXb7MKyg7c/PM?=
 =?us-ascii?Q?PzSb7xZg0Up2kxutbAXDs1PRigLFbjqXQ/ZKE310MSoLGZYVVoh/2vmRbdEf?=
 =?us-ascii?Q?v6vrPGecLmT19Env3rbs0aqfFBRP7IzXK6GYC+Bjld0uqkG6I7qULVGDjthP?=
 =?us-ascii?Q?tQZ30pMcLth7yuiBN0bqesqPdBMvkdFRWqlOpuE9JBF0jUkUk0nTH012lEbS?=
 =?us-ascii?Q?CZ9uTccwREL471L2kuWU8R15qJa9pUB9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zSKbOQnlvgKziHk4xDeavrnjDrxkZ2pb9AMczsCBBmGLFjeNCa24LxXAh9Ac?=
 =?us-ascii?Q?726lzzNrG5Pb1J+vbnHc1uaTpUduXbvUKwRwiIXPgd+eUi4jdHLiVGl3GKV3?=
 =?us-ascii?Q?BL6yCsGuRVPJvaUa+Nx9yDGaSDxMhBjAQiFBDfHzHcc6u8HtSsF4HJ0YfADN?=
 =?us-ascii?Q?DH2lDlUSfn1LAvTBEXwT0b4YmpanGn6G7tzgR+V4EmGqEH960yjb4LApHVjC?=
 =?us-ascii?Q?83oL/TB2Vs4w1FluEZLuP1c/s8Ax+ILqdalFWBs3G8UgTBcxJW0+Dz2gR9FO?=
 =?us-ascii?Q?LAxzcquNbH4PyGkUsm9khS8xJb20X2QshWkoFeHvz2Is/mnXunilaWLq8WaG?=
 =?us-ascii?Q?r0+cvLCt8qjp9Xq3QHCxxF9CJlTho7W8szGGRjkAhjoucrUhSF/uXszb0FDc?=
 =?us-ascii?Q?EK0Ow2ISOqgJ5DC+eO7ncnfPj2vic7uzW6wv21RZisj1xV1XwJ17V5+CAi/c?=
 =?us-ascii?Q?yLrV5qL/ldkNzwtiyrJssXDVKn/ZRlEFOFVJ395q6eyzSHPa5t2HqMeWGW7b?=
 =?us-ascii?Q?vrckWx/XJ5ZxDtRRW4+u2+E5ZmlL5oITJJcK2jDuCZ+jYbBVpOzhJo+35mVf?=
 =?us-ascii?Q?oXGLiEIGGj1K0fCJOohkwAJWhMKXZAHFrkovJlwansuoxPXbZXn88NXpoj41?=
 =?us-ascii?Q?XxbW53dk0V4DDyl1QqJykRil9xwpySeAGW0++WOFQvak5BmOXjt1Fu34s2nX?=
 =?us-ascii?Q?xHVK/umqG17ofeXI4RWSi/iqNX5jSVcNDbEWFkmxGBdc62+k8whoyxEtmWVs?=
 =?us-ascii?Q?pqFWyfqhEqnM+RD8FFlHvkvcSUjZhW3OZiCFbt2H7hIvHMQsTJ6tDWs/cA4h?=
 =?us-ascii?Q?fXRyW8nT0X0BAsWs54FGmC6+BSY/BPe5BGy0vW67j4fMG+B0UvRp5Fr9r5Sf?=
 =?us-ascii?Q?LumcXGK3mz9fb8iWayW9zoIwQ6Cf62EGHpQZMhkMmbs9UpWo7fiXcMPZJ7Xt?=
 =?us-ascii?Q?+o+Hd1K251oFzNjNkQqUpQLSSSBycLgTOa2GJWldM/iBzweH4XSeioiPV6xP?=
 =?us-ascii?Q?DTtjLPOqWmoX1YxfFvZU45btirrSU8+UEY6nh/0O+f6c5eXClNTCjdGvMBbZ?=
 =?us-ascii?Q?tv4nClS5C2sabhEsLf+i+C5sI7cAZetJJpgdctPdr++oRuSoNKUk4+HKnhgL?=
 =?us-ascii?Q?/rfOuNMEw/MGofsGOVP5aNiWHwrEdfL+DX3mQXMtKfDW1adskU0saWNnFm7O?=
 =?us-ascii?Q?+G1jjC1sGqWdJd5vg/jvyZVKuXHHeCwqFEVpJrrYna430WVrpOtARPZzJjYM?=
 =?us-ascii?Q?4LEP4HxR1/3lnWum7r9LzS3FyWixE/YbofNtDJCRyUdkAI/3fcAf5wid1GCA?=
 =?us-ascii?Q?pusw4DTm2LKBQ1jVfNmkL9sOXJ5nbHzdmM7ae12xRYcJN1k6tBrGWXqUDgEK?=
 =?us-ascii?Q?1CjhR7W7V2PccK7jdzLhHisVtASMCqer/FAJP0qYTYtHNOsaxtGlit4Usaxw?=
 =?us-ascii?Q?JrFP4TjkaCp5XKjehn2VxOmOI810ETEMYqOobjs+Mnt0hL8sIqsz1HovGAAD?=
 =?us-ascii?Q?O4ECe0HkkZKNqBo07KEXwieOC5P+DUuiBI711eCH+a2BghOQ+rM7GHunUj5b?=
 =?us-ascii?Q?qyyjajP8t4dx0S4/rK67+zE0TzBYKZgXz7gqYyMD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 565281ac-06a6-4858-b77d-08dd555eb0e6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 05:38:54.4915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O9VwtoY9Y0VmbfdkCzMXGxgJap66w7sM3XlzRyWARYguPqP2q5ZOB5/REESFyrp3NERiQNZxdm+A7hu4cyzeDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10714

The i.MX95 USB2.0 controller is mostly compatible with i.MX7D, except it
requires a second interrupt for wakeup handling. Add the compatible string
for the i.MX95 platform, add the iommus property, and enforce the
interrupt property restriction. Keep the same restriction for existing
compatible strings.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - improve interrupts description
 - improve subject and commit message
---
 .../bindings/usb/chipidea,usb2-common.yaml    |  3 +++
 .../bindings/usb/chipidea,usb2-imx.yaml       | 24 ++++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml b/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml
index d2a7d2ecf48a..10020af15afc 100644
--- a/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml
+++ b/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml
@@ -42,6 +42,9 @@ properties:
 
   phy_type: true
 
+  iommus:
+    maxItems: 1
+
   itc-setting:
     description:
       interrupt threshold control register control, the setting should be
diff --git a/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml b/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml
index 8f6136f5d72e..51014955ab3c 100644
--- a/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml
+++ b/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml
@@ -41,6 +41,7 @@ properties:
               - fsl,imx8mm-usb
               - fsl,imx8mn-usb
               - fsl,imx93-usb
+              - fsl,imx95-usb
           - const: fsl,imx7d-usb
           - const: fsl,imx27-usb
       - items:
@@ -54,7 +55,11 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: USB controller interrupt or combine USB controller
+                     and wakeup interrupts.
+      - description: Wakeup interrupt
 
   clocks:
     minItems: 1
@@ -191,6 +196,7 @@ allOf:
           contains:
             enum:
               - fsl,imx93-usb
+              - fsl,imx95-usb
     then:
       properties:
         clocks:
@@ -238,6 +244,22 @@ allOf:
           maxItems: 1
         clock-names: false
 
+  # imx95 soc use two interrupts
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx95-usb
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


