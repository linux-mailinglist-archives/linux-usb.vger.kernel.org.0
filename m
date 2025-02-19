Return-Path: <linux-usb+bounces-20813-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E5DA3BA93
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 10:43:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E37291674A5
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 09:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEACC1E1021;
	Wed, 19 Feb 2025 09:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K+inpWwa"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011039.outbound.protection.outlook.com [52.101.70.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8891E0DC3;
	Wed, 19 Feb 2025 09:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739957453; cv=fail; b=ROb4JK3tipOEaDL3+Cdz7alZSkMP/186Qy74tTTXFCUHwT+HsE/fwbX+emYlfr5zWFjxxu36CVPRGQ4Z7X2aiJ8MOy+WzOIgkqrlNea3zTr+gUB60V08svlLigPrcZ56+G+bDAxiIsqQN9k/Vw9J08R0yUZ/bzldIvRUb7dwjZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739957453; c=relaxed/simple;
	bh=k3iZNEhrhXjdcRrR6zKEZSjNn4+/4pm+rM3w7qJ0ZsI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cct7two0DrhQe/Q7vqS06lRLJbThS9GOz51vRs8fjNBTboo0lJM983/bty2pChMxqlGs/Pa77LCbacCQuysV2CgS+3+gZJJsVdFWxzhIYCSnqY3B3bF3mh9L8mzCfsrlnsjVVInMzOiK9hUOPiUEbzEKxNnc5+fDXSRiAQPMGQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K+inpWwa; arc=fail smtp.client-ip=52.101.70.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPdxNwQoN+iQL0Mjkc5r+W7dBpwytbLKT+uivg5TKh6c9HX2EoXE3q1nuzzHMU2ejW+hVhILabeW5dNBIVX73BHwiwnfTHNYaWf9tUKOZ9A9DMUs9cwrxw/ia7XAJ+oZ6pfE0vGS7/V6PiSMvGV5sk9wrPkazpBRGvT/98JsraY9uPoBpgzQEsBuYn5rIvGkGiXE9t8VTXGaspevo09+8pE4Y7iBnIFSLOn6uZ6vIdx0IYPBdnv9IgJUr/caaVjeve31ZMz91nti/sRCbS7mYmROJLRbo5R4KA1kSGAlaX2t8AQ0tGH5XM4nQmVmGnACirmc5KDj3moAZKsIhmCybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YwWsFK833nIcRALiRgjPINK0Iw2x5G0Ez+c74Y+wnM=;
 b=Cd+guEhq8ebHYbM7B9TiTx62/oMCyr9TV42+cTIVCxxvPNseymvuM0LM+P3cPe6i733PuKRjg+paNUGfsXNi85zHI2OpJwH7tYrvwi1ojfmCERs/E8frpyOceJJLfWyYxX8lrS+hCf93tSM0fvlw1R65EzM4GL2CZJLomAs5ePSEaLMIjns/yqjC8YCc1sfvKol32/GFpCgmyluBieRpBA4gW1j+jpw19RHDWfwwDUSgMKTkgBi/mN6+4EGIBSTYCjBrlWjgtOi1PS9+xUBS1ViFlmGbiFsbw9EX7PUFKTntPtIOL6RGegAGFW60qxYtxpQPB60SuRFXROwCOuPm6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YwWsFK833nIcRALiRgjPINK0Iw2x5G0Ez+c74Y+wnM=;
 b=K+inpWwajdwkzURp/o2/aPR86Ou1Ves+I8sEhbaBy9vpGHdsf8M7UHxZtxhdfqpVMtLoAMsoPaQwS0mXldXEVAqcFA83PZkG7S+wQui68P3gJ965NoHzxdUVVdcciq272e2sJNcNZJmSYLqZ0sRABKjNrYKR3+YoD8ioH43pVaYshhqjmkCw5c/oRRZ844gt/e/w+1hGH2Pnmheepsj/fmv/ngMCTnl1+rm4MGhSeoS387o5E6+NU4NlMH9qa1FQyzuKP1fHyX6CKUESEBIkwYk/HzTPTtAB9fTLf0+XD8DlgdaR/b118olo6Icc6NdNNLU1x/xziUHxjOUgoH48Hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by VI0PR04MB10370.eurprd04.prod.outlook.com (2603:10a6:800:214::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Wed, 19 Feb
 2025 09:30:49 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8445.016; Wed, 19 Feb 2025
 09:30:49 +0000
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
Subject: [PATCH 2/6] dt-bindings: usb: usbmisc-imx: add compatible for i.MX95 platform
Date: Wed, 19 Feb 2025 17:31:00 +0800
Message-Id: <20250219093104.2589449-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219093104.2589449-1-xu.yang_2@nxp.com>
References: <20250219093104.2589449-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:4:197::8) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|VI0PR04MB10370:EE_
X-MS-Office365-Filtering-Correlation-Id: ed108f74-d93b-4e9d-abcd-08dd50c81813
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1YtXf9cmuCfAfCpOlbzD/sPSUVdofGN1SBfGbJRT7AlLEcc09oBAyZZho8ka?=
 =?us-ascii?Q?Lz3hXb7YNak/GUCCcNx09tAob41Ug3aw/oD+z1JU0emhqisV35ez8P4p1cRs?=
 =?us-ascii?Q?d8caQA/Xu7JYMbF6XUmi9N1+rRqP5ZeyyHQc0pXPtowRODs9vEUPsZHXtosT?=
 =?us-ascii?Q?KPiaD+tBdhMWnLWAF0gSxKmTs41AxRYWsvIV80HWGMvzaL+mKHB8YoSxeafb?=
 =?us-ascii?Q?fk61X3YhcX148nfozwp441WZ7MJFqX6JvLegCiIFrUHF0GXqyxClYntt/d/c?=
 =?us-ascii?Q?D9I3tEWGfFtWbNNzCEnqxT9eOfojLhc7Lkl6YPKd99vxWWj12E8OYU9e5eiT?=
 =?us-ascii?Q?/Mt2Tl7fPD8tHnHATkpj4AmNr7RT5/CC4opn0FOYYJOzYS+MRTn0SJvzdWiW?=
 =?us-ascii?Q?sW03581Ot+Gg37y2GCE4ZmkCRjQotdB1hg3khPiHHCyPgPpYcWLJ+lTNbsm7?=
 =?us-ascii?Q?s1RAIJXTeCCzbR0mG4eFzBAnCVmIMoYPqc5oZvk82MLNV5FF7ObCGY5aDmaX?=
 =?us-ascii?Q?bm6VNq2mp0sap4pX5B4Q4dXYlzw5K0OQ6k1Plkk1unG5UK8mtnYO+bCxC6ZM?=
 =?us-ascii?Q?swWW+mde6kdw6EqLRpqu1G+ifLEYcAHXmt7vOfjGlLl1cEpPQRah5V9EmaCY?=
 =?us-ascii?Q?h6vHSh24wRMHFr6dFcX2/sv2rnBRm11lxAEyekYhzjdmNMZp6FoPMcJzgfna?=
 =?us-ascii?Q?rDEh59fnsL2WE2A0qDdmJWv5PLmNPm+E10afU2CTNHIEws0HfsXDwbyvRxXv?=
 =?us-ascii?Q?b6sOBcSN6+UA5F2vQ6u942gKCi01M2G+z5AEaVKNcBKH6kpSQY82TGFHnJc7?=
 =?us-ascii?Q?XN8FLb0ZiCkwwmQesd0dDuM2FeW+duD/hnkOESXrJrG3ogvdZl9SbIgmfHo5?=
 =?us-ascii?Q?gir7TkOyePNZ7qzxLaDgbHPVbh9kDGrwJpE2HLKuGMqi7FlfFuQosjIaEIWo?=
 =?us-ascii?Q?6uQXVGfFbGO4knFfVa7yn+yX+G2+9PwNFyeoblJzphz2CFcuq5pf7ZIK54dN?=
 =?us-ascii?Q?XEkFAAT4Q9qvoi8jekffXpz/qM70QdQFoWI6XUa5dgmGe+s+ySosJnlnptco?=
 =?us-ascii?Q?+U41srhbTYG/lCXHVk9CvicCXGfJOneo4SP4WoYhVxUCkCAzN0DFUmlR0m6e?=
 =?us-ascii?Q?ggpufJPYlQpac+YhlWKJZ3BNikjfbV6Oudj5/U7yxdOxk6705/WNP5b3ce2k?=
 =?us-ascii?Q?MqiuUsToTBOHCDZy+sb3eHUqpfTxDYjyjL+L4xBiZokU/oIJJRuLKDXzvyD2?=
 =?us-ascii?Q?ePerEakuR8j15jgUp3zLyaz8QhhJJ6ir21z0Fl68A+i3+mOITHnxlk4DVI04?=
 =?us-ascii?Q?vd4UxkY3knR4k/5LgR+ML0ti0RVCYX9N7NeuYdLvt1eB2rGiAK6CqiLTJqw3?=
 =?us-ascii?Q?eDKe/+BhGto8uG5Y5Ldr4Ea45c0GIWvnBpFziKUAxoiGVmLHzGmCQ47nGeD8?=
 =?us-ascii?Q?BCxVygN6IDtyK4LfV7FsAqNJk+MfCNDh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GMrfJ9Jg9lLayq7SC8ON6KhDDsTsvlLS0QL6cNVw8TAECGzD52QrlADAp5Y6?=
 =?us-ascii?Q?jIEaRXdHxyNXMN0Kq99g+yiRt1Ak0RNlkztIbQ0xOzkcMYLD/J0YcH5R8o9j?=
 =?us-ascii?Q?CDBdVqc9aVXg7qO3rIIbclh6lOjkiYNCaBEvJjEVlxHA9i8Psjl6KIYrOI35?=
 =?us-ascii?Q?PpeHxXZ/a2MLnaBGNQTZUPrpSUg3/WAYcECTahqO5WMkf10Ru7rTa3mChvx2?=
 =?us-ascii?Q?K9Mc2ynReY0+KcDgr6/dsbL0vDZvLr3ihfG1iqEAyKUbm2S8d9kLuYcHYpC6?=
 =?us-ascii?Q?bymVNNu713XAGKF365PPobLyEhKI0IakarB2m9aCvLvJyWnYSqwi8XKdlrXl?=
 =?us-ascii?Q?5VkCwo1oIrZM3I9g2gcuUgqXhWiqyE2N4Z0dEmRLrH23stPxmG8q79/JDHoX?=
 =?us-ascii?Q?G3d9iNWSPRjbyAtefjOxOLy6bIejsFnXEOT/t4oGyQ7oP3Wci7o6WM1JABEb?=
 =?us-ascii?Q?yqSA8xI9XbSP+bUxTgWoiI7YWhYIy2O62OGbkYBd4dDOKpzCTb5qa0faBLck?=
 =?us-ascii?Q?MXTtDSWQTR+TLm/hwnQhPoAriAKhKeciaZD6xmQfMl9XV0wixQCTZps8DqwL?=
 =?us-ascii?Q?h8+0nEEXz+dpASJ7+yIdWwW6rPmUtPoOpFjnluoYwVmEHMOxYxr2tAvcqWyp?=
 =?us-ascii?Q?wM63RNi+Up6XlkKJ7GOUYXOJA5hXU4X0oYMeRhyHBEvVckyLTHqu/oEG1h7Z?=
 =?us-ascii?Q?8K48CYxDp1bcLmwfId5tlhi6QYVVhVfHZh1uMM0H54ov6yHY37y3g3YEGahy?=
 =?us-ascii?Q?uMD7rd9CFF1muTfWtO8Nh/8eGQeXLDc524woI3RdYgY52Veqwl0Ia3SzO79/?=
 =?us-ascii?Q?hUN+pqdJpF84xVHRRI6efTRpLwiyxshzeru1s7pjXsTeQCeAKcBNW+/0t6+s?=
 =?us-ascii?Q?zo7RypppDBX+C20pQ2se80gC32H2iSZ2sjZiINV2/dVZgWjnUxiB2nmYacmV?=
 =?us-ascii?Q?YoIDq5rJe1IC9/vLm63x5u3DXfUNRL82HeHx180VWUO1spx1nF1aWzQNW06Q?=
 =?us-ascii?Q?X3O4QZCIlxNIFdllVztlZ1kimeXReZX1wt23JTeCIoDU4a4gj63XkdThTztg?=
 =?us-ascii?Q?yuncTnC/xZxk1VRiam0hBmRWQBj229WRxBNG3qs9P6/p7SGmyeV8aRmrqgIx?=
 =?us-ascii?Q?V8j8XDazRPGAqoiAGN8ja3LCdYoWflFbCxVEPQy21qHm1DKvbyVaPzwfLtx7?=
 =?us-ascii?Q?MYc4g1eTqHYmUIUD7LNvTSO0CoVLcrpgX/m3XRb3AMohB3fi4q7fFukUQDWB?=
 =?us-ascii?Q?pSolRojjnI3xELwvY/2Mcpne//qx3MoK5/Ri2IzTJKWCYmC3RRKe0VizcxT6?=
 =?us-ascii?Q?WKdwFGyzqwj/+mzek2ZE+anpN7898j+w5RK3/FoKhpEFIfRlKzcsvpRxleVU?=
 =?us-ascii?Q?Mm6bhti0X0wrpuUZ4mS8s77g0JsYj1oP6ulK5fW1ZKeaSPntSbY9VGwfCnoa?=
 =?us-ascii?Q?cqIc+dOs3mHDllXnfdi53rRWrNVrc744PC6f6AZSsse8JiKeZrlVYJrDIhsR?=
 =?us-ascii?Q?jPT4eNOnJmxUH1hr0L+YumDnZu13+e2YIn4lOxFGbnlBKVdv5/FXtHaSsD28?=
 =?us-ascii?Q?M7ETXm/pYPpiljK6Xn9uyuFY9DfO0JpdMn47YSJw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed108f74-d93b-4e9d-abcd-08dd50c81813
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 09:30:48.9140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pUjMnx4zQkS8lb38TLAv7eRFpgTwR7VOj8voQurdqzOXPfH/94MOYkxj0eT1ZibRYrX8F7itYF5F4yyMaRbzSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10370

The i.MX95 USB2.0 controller is basically compatible with i.MX7D,
except it needs use hsio block control for wakeup setting. This will
add compatible for i.MX95 platform and restriciton on reg property.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
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


