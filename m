Return-Path: <linux-usb+bounces-21132-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F14DA47993
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 10:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DA821891B8A
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 09:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4322288D5;
	Thu, 27 Feb 2025 09:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="U1ZpMQ6p"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2068.outbound.protection.outlook.com [40.107.249.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F88227EA1;
	Thu, 27 Feb 2025 09:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740649973; cv=fail; b=ppIMFH6w2EYIaVqN93Zj66G/rySU1UCNS1DjT0BiEMnhBJUV4raEQt3ct4/Zo3yp7GLbav93j9Jo8MsmNOJSf7yb1AHQu4/D3bjHS2jGYpl0VuMxo6U3DlVJL92E4/KDdpB+UpVUCWLdG4gMGlv/cujBkznnczXpqr7qBXS6c24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740649973; c=relaxed/simple;
	bh=rrV1b+Lw0AqCdaiOGIfn/7bYYnjnixJOyQIwvZ/KgFY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WMMPZ4QVBvDNHRgXcPGss7VPvZU2YbvPC6z+Z8wcu1HChntM2mz/dluRSsBQ27fo9XVex33qLb4RMVPA4nBBP5R/TynOwAZT1nmz9VVkgzppWMpTuw3oq1GI+DQEa6qll0wEMFUWIovqCkuHuB/uz7p712/fqFlbYwdyZmwXtss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=U1ZpMQ6p; arc=fail smtp.client-ip=40.107.249.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irKClAv2VRUhGAPLxNzm75RC32cRBmUeBAatrGIYENDeL2EPTnKQOf+WTHkFWEyZmapHfA7+jWR4IJw4iGjvozdiAv+vIE3SxpR99wt72pOZqu+kNUBuwFCs60lnvWyJ14R3fh3JW3n6G9l9Iycp1mnYUrCPxBwksZJYd6+6ydABMM0BDHEpulq8vry1UMlU5UdbJYsam67BhSSOWy7DyyBNKGIPkcBc5ijzinFPPEgouC1fbpN/f9UkVTYfGhce2CF22JS8bLN4omDwTl8k6QJehIup7ObkDG84GLiO91ewctw6xNju6pRu24w6u/RucjHmkaOmQly/2OQTzp49xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jxc1IDifXqgxfreelYt39p8oImQsT9XvRsTlp1eM3C8=;
 b=SdSU4y+71PdFUYfVev4zVN9sPeZz/F3IqEbCJRNK4Y80lv2bcc320ywNWhR92dC6IKJ7iIdz+KJN78CN/9NEwfXQjgGJi8GHEUNgKIEbDIK1X511bYs0n0p7zpjS1/Bd4JhbeYlcMBhcnNGp6qqY6f6vtYy1j0C5Scy3nUq2+kTi3inQ5EFBrIPyNWH6zNdZUM+tgFPBuDVMPoGTQQ4JSnyp4r80meCgC8x4Fb0+yZ4+E8FrXlSIY8c0D+Owqh316LZf9HUHK3FHYq2IDDOGLqdp+K+ekGfNGlqawUbcygE8WqbgJeasd813A1W8bP+bICiTAUT6SbnaEmszgWznew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jxc1IDifXqgxfreelYt39p8oImQsT9XvRsTlp1eM3C8=;
 b=U1ZpMQ6p+bETtLdlh7F0Th8uy7UtwkCr+mK120bPfmEMmjLaWqXeVBIHspGcEmdpiatedaMvvKi1Wa1oGAmZU/8W4DaCjlyDOW45by1XD5WdSZ0W0C9JpHeud+8oJy/SQjFnNUYZ0Ca007MQpp2VkeahPRhwtYqEPgD1VovWZJ7Gh7v8JlLqi1MtysW3CLPeA+SPyh8iCqG6PaOrAPTeXaE7b/EEKqcTOLc1seQ5wOpjYyfTbDwkGg8Ua+PCooz9sNANTIjmpT349R4D7bySUJmihka1hCKl5FZLIe6AUhQuS69dC/s+u0oFwfNcmZGxnMGQetpuFxOSQf2sc7a/kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI1PR04MB6848.eurprd04.prod.outlook.com (2603:10a6:803:13c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 09:52:48 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 09:52:48 +0000
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
Subject: [PATCH v3 2/6] dt-bindings: usb: usbmisc-imx: add support for i.MX95 platform
Date: Thu, 27 Feb 2025 17:53:44 +0800
Message-Id: <20250227095348.837223-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227095348.837223-1-xu.yang_2@nxp.com>
References: <20250227095348.837223-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0205.apcprd06.prod.outlook.com
 (2603:1096:4:68::13) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI1PR04MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: e601a9f6-00d5-42a6-5e9b-08dd57147e32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5MW7ORHkx/sZno0eYxZ8svsEYHafv0+aG76V7oERiKrAayy0EpJCE8a5tvYh?=
 =?us-ascii?Q?bHHuthofQPe9gErN021+b69IsWHgUs5Qea/qJqo/Vl6lQd1NVlJoTEV6K9ex?=
 =?us-ascii?Q?EkSNFYdgg5w52kGh+9wXvHKXnRf/aHT/2ZU+elpV17eTACPEtUKf/bm6qFZq?=
 =?us-ascii?Q?h7Vh4Ebw4kXYckVGY74gA8DY1YpoOaUAC/pnOAmNPNtEmmf5GDhTAM1SE/eN?=
 =?us-ascii?Q?UCgQtwngejZIOp7GiXRZhyxHqvhTiUQKkDYVKup+/0347PYt6jXvXMQs6aJk?=
 =?us-ascii?Q?87/yYhTCrSme35mU5J0grqqkL/yVl/np6kKd0HSYDQMVuUIrruDlN0N3jP3j?=
 =?us-ascii?Q?NpfI/ks/FQ0UYAccw2+HFMvRSnpdWpHuLqSRICZDric5Jdo9ej3H7SUp+kyJ?=
 =?us-ascii?Q?gavT3PLwgJWek/UNNafCuV2VUUP2+Yu8G3kq4KIW/Bba78S1S7tQEo0N/RRZ?=
 =?us-ascii?Q?BvohlE+ph2f7NNFJksf/6kMFy7rwm8LDd3zWxu2t3sDPG9V5J29VLnC8SDuo?=
 =?us-ascii?Q?eh4l5agSdADf2/UMVgH+WhMKZNj3R7haRicVGWHzotYDRClSR0RF+FmVBNzk?=
 =?us-ascii?Q?/yqWMM3nu4nuoXhnGHmmnNoxB86HgxHHWOTSKE5lVduyZCfO5OYGxWg/0FUx?=
 =?us-ascii?Q?Z4UFmthO0gHLklNKoKXlkCnDO0TCRg/OpU+PATZuz3amxdabOCzMigB88EAi?=
 =?us-ascii?Q?bVrMzAKqA/U/bgUfalvDudz4OKNBUP7xX5Ang1GrgA/dxOS67c5sqtU0zFq1?=
 =?us-ascii?Q?QvCAnEKKVVRW+qPBXD5spCFbelbBJBAnbzYP07HQvl59yN7frWtYP/m5OBKH?=
 =?us-ascii?Q?GNv+STEfIs69jfkP90oSh//TAr8eKCTFNssUuOZMJuhhuRO6KJHQkf8Guv5m?=
 =?us-ascii?Q?QRoIlxIT6xumbrXnbFSJVNqDvO31f2GmRLcovkXmUQWWJWAKxmV4f6lpSm/2?=
 =?us-ascii?Q?kyzRehqSvNYirL8Ue5JJGV6zNJpt0olMltTqnnDiu3kPsrIuQORgz4f3Ud6z?=
 =?us-ascii?Q?9/2yFGAV5G6qpcIuzm6SBKu3+bojal5kbjCPWnovpiG8RZbn5tf9zkfavUIb?=
 =?us-ascii?Q?tOacOholARqPDwpoMDRKCM5JppLbwqsfgx4WPYAc2pRVRTeJgyMqoxk4e43Z?=
 =?us-ascii?Q?4wGMX1zm70QHfDRsaBTdyxZAQYDdaYTRIZwLvuig0Z3EknM4zFfMnJVmtTbK?=
 =?us-ascii?Q?ZLkFvkgoRmxlfKzzG+nu5nRXYsKpPG1ZGzTLkt4hiDRtF9ijoW+t9385MB10?=
 =?us-ascii?Q?chz+p9df2+NfjT7+CbxrwgcflQLf4VTsp6Ac3NonougJAfQI1RgeF1W6rlWI?=
 =?us-ascii?Q?ClK8zctKxHpzCv6v/NVBePJ+PW/dL4YSIkgJ+6HvRPOQJhpORprBZEcPxpVw?=
 =?us-ascii?Q?a/loLTJxCtMnYOPmkXDSmnbzptNcpDJ2kOV0IpU0G1lJOh79aoxqO+NtMjP3?=
 =?us-ascii?Q?Yw/UmCZegWmLM9Cp0VAVxuuS6PKiDRXN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZzxAWTdcjz6mgrj+RhSGILZ+ZIru2LRikdFWwHbC2yDamUndeg8+5PsLE1Wy?=
 =?us-ascii?Q?AmCBNoXE/zxPyUMjliv7fAIeSCF6+9vmJLewlluTjFYo/jak3DIctcr6sgJt?=
 =?us-ascii?Q?PjiZXEukbQE0IOrur1/QMmJ0LR7rpeumExys/xFEQasJIH9jx+j/OUNBOSXV?=
 =?us-ascii?Q?ivtpgJLua2xevnwdGCPNVXBv/4JnQ62bNJntZSJfQNXinUWGoAEWOPcSGPNc?=
 =?us-ascii?Q?d36ZufmjQIVENSjBVYSQPH9McaEgn99hhPiq5hfT7YaZjlPu6UoLBAQr88r2?=
 =?us-ascii?Q?NHmgpgEzt2sQ79kNlZgOvhtsZarU6gRdWgu6aWhcJn7QLvUdLuiriuvvPBOn?=
 =?us-ascii?Q?aTP+pFbqlZb2yKV8Zf6IRowUHRiO/R1YgnCOrMsC6oHeuAmWnuSxDYNLcL9p?=
 =?us-ascii?Q?c6IYyrleG2xXyBOdlGCZy4fgtaC2NAlvD9caXkHKhSGH3txjFJxU5QI5r9lZ?=
 =?us-ascii?Q?ognZ3wsGOo75GYIkX4F/ZOWTiOaeWGBx6tYLG08WBvd7U8CIumi1O9bYE23e?=
 =?us-ascii?Q?2z5UTD/km098YKwebdUlZMjDihLD2bEyCPm7BrlftUUABQfALtxUNbgxQ+TE?=
 =?us-ascii?Q?pWS30ToA898JYlp88h8A9SyNUxoiBdOWLJSelghloiWUCEwOXzcBOvI+U5YM?=
 =?us-ascii?Q?TQ167bl/yXjHgaboID+k4BDK70YoT2np/gx48eLqUFH6c6/VUSAup+0RDOwv?=
 =?us-ascii?Q?RCTYRM0siVgIRnbVDSK2Yi4F8vY/NROC+wE0X2TSaFkNniCp1mL5npeQ4Y5s?=
 =?us-ascii?Q?EaOdzIXLPprri1ZsMTuUAPjZyjqX/pyqoB0owpzj0U0gB5S1a/pwz3qYIASh?=
 =?us-ascii?Q?/2XGtx/w5gIG5qv2IoWZICW1xuiN6sfvP+Z1Y9PaFkBphornTfQ3F79Ik2O9?=
 =?us-ascii?Q?hk+7NUfKdtlomsaiZwa0mVJwcDZUlF3O19BFoKbmG0DDyD5hSjxKbi5f30WB?=
 =?us-ascii?Q?9Ik6N635F+wpHM9RcYEiymld3r/2OptNo9ADcS4yDp/y+qMqPHMvV0zSRW70?=
 =?us-ascii?Q?uX/o+thTSS90jjQX+t1bq5fh80tRf/5areUmqaBwVT44iPdk+wh8PlMJ8FKf?=
 =?us-ascii?Q?M0DNKT5SM6nGDwOBZ4fpFwH7WzPD0i7O1/M5GiEl26Wnym2QYfJOqzTcg5hI?=
 =?us-ascii?Q?DKaqhG0z5Fk9+ESfazL2sT2Y0c7ku7wuWIvj5RolSOuGLK1Hdu3ZKmZ/j1Nk?=
 =?us-ascii?Q?vGCKcmbnuVZw7Dxe556m8yNTbtM2FUrxhyUchoRJI4uYVNgwStTkjwbBRi2Z?=
 =?us-ascii?Q?wMqgUuLAPX9VlkHgoPJjS9ZcJ5fRI1eDkiG1sMV9mfgE+6jc7p8+CVlFfj5v?=
 =?us-ascii?Q?uYhIsJFZ8LdqBMF42b2fDnLwX89OfIb3zxRs3S+ySrq6dOYbdjNOUHG+d2rU?=
 =?us-ascii?Q?Yx16yuNfny72BEHhuh/FM5rBs6HSPPswM1Lp4WyAMFDIYkbV7vL1XoTyuLBO?=
 =?us-ascii?Q?WQXe8pHDlQYij50QbODHc0AVTyBcXH47lvaNYRDaSh07Pz3f7S/FM19mt1je?=
 =?us-ascii?Q?fFP1js/KJlnz6WN74bOzlhfjWDQ9efMoEHZtPyiEO3ogua0sjjc4cESn5i6Y?=
 =?us-ascii?Q?hrghfUQnetp9+9yDFazRYfQgR8GiDJhVzyzM0zC8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e601a9f6-00d5-42a6-5e9b-08dd57147e32
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 09:52:48.6732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PfiKVNzNw0mlRgmQp9I0f0yrqSF9F2tZKvXGa4Pu3fFnznyh6+M1MBqOps3tBSnfwaUvDbvcNa5jK7tTXSpxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6848

Add compatible string "fsl,imx95-usbmisc" for i.MX95 platform and
restriction on reg property.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
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


