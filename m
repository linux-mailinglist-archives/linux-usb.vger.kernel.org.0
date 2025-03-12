Return-Path: <linux-usb+bounces-21675-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE77A5D826
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 09:28:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AC783B1257
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 08:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982512356C5;
	Wed, 12 Mar 2025 08:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FTMybzXu"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011025.outbound.protection.outlook.com [52.101.65.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387D22356A1;
	Wed, 12 Mar 2025 08:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741768070; cv=fail; b=M7PayGCxUSzhm8zhUCsWKkEPtl79dAvuse3DbRkhFpOZgNCF0KaKcYAXaHKht9RsxKgHhtRNlj/fVUP9C7D+lg1dl35rlGARioqxlu4/O2H9Jmi7jt4Oo7K79VynOR8HzR9J4wlsE9uJ2dhjFVElNJrweOth7BZhhxFY6GLNVAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741768070; c=relaxed/simple;
	bh=Sex9fmwvdFuW5KHYawI+odbVO4GpRSOC+FdDeYush2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HYMtlF+iUrX7diTbi8LAhvTO4hmAKtBkT/jzL0HgcWzkK2Ka3H9qz67h6mM793bgHINap1wSp/Eiu3DuTGoauV99t/eBNFXeMO9ZtccmivnrLsblU/tqHmgzk3FWyVVY1zmg4B81w2TBo2iiAFR3eQaUL/4cspFkhP2TWhs1faM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FTMybzXu; arc=fail smtp.client-ip=52.101.65.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ErGYwfi95dERgMb9E7vuedPI3zndBcOAUrekjkox1GViCe/6PVrRLzA0mmm2F9MtsNhALU+xBVJJoM4l5plXfA7pQPQQoKxvkKKGHYuQvvX0mHVG1zl215yia2+Fmy1dA6ydwRR/IqyJkWIAlg+mnCfWDouidZpnyGEi+Qv1Omqh/2EWHPoRbasqaxfv3y8Crj1KKJ8sEcO9XrXUuT+UCvUhYpvtg0jqRVvt530L7LlZIs0TLuel8KrxHNbZkQ7RR6Uqe35w4ihwn+j2aHehoKeSklmZaEHfZ9CMWp5RSNqoK1VMQVKbdtErj/7zW/bTc5pcFFs9r26NC0WBaIRziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCt5xcID2Lzez0/4Ib/yEIXaO7y885DdiNmGPUzqT+o=;
 b=NSgFBJNG5M1Yrp6OwheUyOox8cb1ADyQAvsZBcDNsjBMgNVar9yTuxqpzISXkg7zE2L5oneJGVZ96pVc2RJXIGHOY6iv/HNFLedWn9pvbl2uy//bLrqyIhyZIUXAHEC3ld6S1dCWyY19mx95Q1xYzkOtMH1YKIpvnYwqgpyvB7xe6l9LZl58cYYBG34WkthGLKh1WI/bmEwWfRBfoMq7ZId9Xy4o7V9ObXFKllLXzNgdq9VAiAKzr8Ke3/MPcQXbTzO37ujVDh8lpnnWkAaa17t7EMhwF/cSI1RNZr7ZH5ZHz0U/4SmxoF7pNP7eadqQUvLnEgfGGKLBLev0rn0pqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCt5xcID2Lzez0/4Ib/yEIXaO7y885DdiNmGPUzqT+o=;
 b=FTMybzXuVSgcHyKcinH/SVKW6uNCxC+wp6GSmM3UENTnA70JKohMQsUeIjdXvqOhq7v0jx+cO9z3vkT+/wjkfC4/jhqJ/5asFMXX/3R4yc10kBAO8mMrVlZ6NDR/FWiRpPKZ+35V5V8ehzEBVqKi34RIe7CXlya2uDipkPliI9mfcxo3s6FUsXF5oq7BMuD2qol2hRjGjHcXD7tAOoCPaHypPNtATLOzt12ppGNdHRkjSZKWwoNWmq5MVaLEo3hpbHFGwpiK+ttCugVxEIahUuY2XEo1h7eJ/82brzKxiXtQaVlFwKdNb9AiZFIXU4aZJTd+/u9O3u35rjS7f7bNhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10592.eurprd04.prod.outlook.com (2603:10a6:800:266::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 08:27:45 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 08:27:45 +0000
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
Subject: [PATCH v5 4/6] usb: chipidea: imx: add HSIO Block Control wakeup setting
Date: Wed, 12 Mar 2025 16:26:58 +0800
Message-Id: <20250312082700.260260-5-xu.yang_2@nxp.com>
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
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10592:EE_
X-MS-Office365-Filtering-Correlation-Id: fa900630-2627-4834-2c4b-08dd613fc3b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dKWw109PdaeWv2L3X97+Gbrj4iBnqdh9GgVQg/nW1iWcaQLsDv8wiAICMOvm?=
 =?us-ascii?Q?CFwUIm5eU9MNFyCnFz/qp1fb0zUTvEYO05khemL1dNsVVFaYc5Dq/y+GS/fy?=
 =?us-ascii?Q?MnvjdvEtkHyQps+P9w8is68CHP9Qe7TYFJlZocUDE6eZuUH4U3R//Kn9CAan?=
 =?us-ascii?Q?OOFqFDlpe/4TScYy4wLGdR7VTd2uVc5OnKumPzgJ/TH8HdcatYijcGthmb/U?=
 =?us-ascii?Q?DkPJOhLADcXKEQHNjjJWOFbFFn5teFMGTWmK1XmPv+AeeqHW7f64yPYHUxqs?=
 =?us-ascii?Q?HbWGTqoAa5gK0uTMWULthF+6dGhDhFcvkkRbB3Sp+Earw6iZXcd7+SIxdVbx?=
 =?us-ascii?Q?outY8gcDsN+ekCdWHirpOnXxyJVGqBlqQOVKP+9F8zKsEmTgxbNozlKid7jo?=
 =?us-ascii?Q?IhCdoC7hL/mohLmV8KzIpVxqLjv2e3IzgKqUxAUuKT5U6R2ZDQI/1K0LbrVQ?=
 =?us-ascii?Q?np4Wr9tNBATBznpukxlTQggg+N6S7Hr+mHUz6wIZM/BfsWRJhrYliYF9K9un?=
 =?us-ascii?Q?2XxPc3ioi4vXf6Y4MYy2HylPFHyIpwDDDTLy5S2CiuTGz819BhsWqCEbD9st?=
 =?us-ascii?Q?L+UxAhwCGoRFjbl7ml9WLCS1H+roy2H8+y4SdEpWdXJhWfDGpl4R86P0H1bd?=
 =?us-ascii?Q?j4XTeBhjsjXeeaq87RmPfi+46Xro4wbZm8XaTeoRiydFdsR2FBhsFPDLcGkc?=
 =?us-ascii?Q?osTIbP9jL/fjXd6XDcjChNru1b9VHjMVd+6go9iQRSTCwTgFaTqe/jkrM1k6?=
 =?us-ascii?Q?Kmew/gAl/lkbTNWY3xioZLdECzdZJLcnMt+QW9cdyQAeKOMI2xQJs7AWy/pt?=
 =?us-ascii?Q?4HC9p/Wm/Fv2nsN8SfHRbosnxZ5iH8wxIfu4waI93eF8fxKMD2x6jWnZhvSp?=
 =?us-ascii?Q?fUduIuf7Rm8TVdCArAEFV/v2KpfqlwUSW/D39eKfqDsmaNOoLSZ8BdCjajp/?=
 =?us-ascii?Q?/dgpgHxQChqvpj2Hud3BQL+mCvPTmdlywLBm5LQ6zmJq3q1OMbiwxQTQXIVB?=
 =?us-ascii?Q?ceK1Lp17hidcithCQE0g9TLQqcYAfmKwDeawCUDVytOuFyLnnthGzOLgI/ba?=
 =?us-ascii?Q?PRchC7qfYVrC7Q4nu7iOZIBt2fPPOX47FsPIBlDH/oI5xCSDk4tY4SwFbLi2?=
 =?us-ascii?Q?ehLoq8qvVIuxq3u6Z2jyMcdm4eVlQcmwGFel+b46LOUxkUXx9fcrE01ETJ2h?=
 =?us-ascii?Q?JxX+gSb4K0aTyB3xrZ0d1Ba5Cuo6pGWE8A7pBrowSbI17nlOsgYgmEKNVcmt?=
 =?us-ascii?Q?/jqSKZmnaPqu4ZZr8byjOz3qaJKApauPZU3nqe3JLnhJdAOy8R2KoRT1fLHv?=
 =?us-ascii?Q?nf6190CrGCvYPT3IfNzapjmW9WfrNZ4ZH2drC2sTDcoUxXfHuNF/h4Wb8Wt3?=
 =?us-ascii?Q?5A6ShB+TTQYYiRsF6nSRn8ZG+yW9Y7EnKuxABEKKUZzFxkXBi66JwPWl2pSh?=
 =?us-ascii?Q?okcrJTeCooaCSU3haclY5ZxY1N4TUH7s?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KILQeB96yDjAmP8ESs1Lwji+GrThlc+E/aAvZ8stidsjA12dbb3/jGyNSk5Y?=
 =?us-ascii?Q?+LFFtnGr3kJj1nNt6ZiE+PWBa1ral4EJNfoOVe+ox7oIQ1ExiLn6KRY8CM58?=
 =?us-ascii?Q?OEx599mCRQKgeuAMHATqNU3ysS+tco0u6ibF9G/eplqr9Ps/TUKPvsj3Ol5O?=
 =?us-ascii?Q?Z9xWlRog1yf6IO/ClhuNUBwzFGEB8bVbP7ZOccUa/IkXwtNhgCSNy9EEcorX?=
 =?us-ascii?Q?7DX2fiXeqJ3LZTXE1TXvN3v3MTf/lq+wu48e+RbEU+gPLA+0t3dRk7zoDfkY?=
 =?us-ascii?Q?kqiPoxcSHtx/aCkH3RrKtLj3EE20TZ5WvyeC9ysrq3j9uia6pWRLemE+vbub?=
 =?us-ascii?Q?ITFoxrcaP/SjUWpgmWPEW/p6NolWtUiXHvTIaOY9Jr7Syx6FDcr1/P4V2/fo?=
 =?us-ascii?Q?ZbQjjiofTtnZ7phjTidB8rcCEA5alGmSNcvYvWVfB6bLbZ9KGWhhRk38ZrfC?=
 =?us-ascii?Q?rHGYN4Q/BVH2M01OfM3mOyk+/krWXMvp80V3cDxi95U7cIANJ5BPV5igiw2D?=
 =?us-ascii?Q?vgaqm+FCUbz7kyBsmwvl9uhWG6eVCi5627CsugMUjr7DoP56BeOVnMubi/Ir?=
 =?us-ascii?Q?Hdl8Se94OVlje9tsorywuewE7HOC0oHdLkSHcHcIyvZuaFxaWDv1pelkEezE?=
 =?us-ascii?Q?yN9MpZwOzX4MMsxxDwhPh9sAcusenkxNa5Sk3xVsxfWI9tt6W+WaTvt56pDU?=
 =?us-ascii?Q?A/9UPIqcNNMA4i9CmI+TBYkLVtAOGLQkouuHKvquDEITYezIgeGh1+vetOc8?=
 =?us-ascii?Q?PXI7cM6xx3LGpaQKeh+RJwa6ehj+3KTPkIvQG55escR9rj/S/iOXhX0baft8?=
 =?us-ascii?Q?SrVaf+mWTdQC4H5aWJu1dPMHHz94loY7Liy3BJQ5wJ7EUXwnDsJaF5A8y9NH?=
 =?us-ascii?Q?AkL7R0/8Zp5YAThO7sy3Q/joqOvvxHJmkMryvz3hwrIGZzHhGmCTyXBiPnAz?=
 =?us-ascii?Q?44Dlj5FLle7rUomAU36IvOrABvDcZ0NiwPg2JGHGLvRvlZjhazojNDWK93Zy?=
 =?us-ascii?Q?nCKkNe50ax8GF8FPxEyUM6124G1IxPNKoRGScr5zUrR3GJKKBohospmLnzH2?=
 =?us-ascii?Q?lbwrMqGjMtTh+nmP6UgeFMRY9gXlhtpLIubnPz66tJPDluajHBB/kWSem6pj?=
 =?us-ascii?Q?9/YaFyhcjEd/iPS2X0hgW4HtdGE+Ka78RSDfLrFCuY9x43vzmH7+hck7MBeg?=
 =?us-ascii?Q?ZgvJLX41AvCNQkgTaMlKIYFEHKFeCQQ11FfHKXqJl6dzhGqPP6L/rDcKhXuQ?=
 =?us-ascii?Q?o0kL57pz5BBBJbuZbSVWZYbkA+mFlOJqCIgG8Gu28GupDEhtgyhUATZmew44?=
 =?us-ascii?Q?9Pi9ys5+As7aR0jTKFiHlsf1lgF/+9XZT3/3kRsLjjlqSZBasD3WwgjbQBPl?=
 =?us-ascii?Q?a9oYpoaNmV1gpqPnepm6bYHGLpcIZjZwrFDEy4DnAV8PmmhEQWxSlwi1Uoc/?=
 =?us-ascii?Q?qklCJ0RYjmWpM1RzSrtXW5UU5VLYptlrIE7X1EMZPsS3K16KweCPQUm3ZufD?=
 =?us-ascii?Q?BucbP745JgkaxyjQoGlqcEBQ3GcvBJqNvacA907HuX04KWdrPlPxuIJtFCGa?=
 =?us-ascii?Q?ZXI68mprW06avGXuEZWbOJAeiMExcDW6+y67Th3S?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa900630-2627-4834-2c4b-08dd613fc3b5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 08:27:45.3089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bnU247JpZ8BRPeSQzVuqVlc/pP9/+sSd89GSIEuWBNXCrXwAgWRpgv0PQ4OpBk6YxxsrgsW9sqiMV8PIcAJZrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10592

On i.MX95 platform, USB wakeup setting is controlled by HSIO Block
Control:

HSIO Block Control Overview:
- The HSIO block control include configuration and status registers that
  provide miscellaneous top-level controls for clocking, beat limiter
  enables, wakeup signal enables and interrupt status for the PCIe and USB
  interfaces.

The wakeup function of HSIO blkctl is basically same as non-core, except
improvements about power lost cases. This will add the wakeup setting for
HSIO blkctl on i.MX95. It will firstly ioremap hsio blkctl memory, then do
wakeup setting as needs.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Jun Li <jun.li@nxp.com>
Acked-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v5:
 - add Ab tag
Changes in v4:
 - add blkctl NULL checking
 - warning if no blkctl reg provided for imx95
Changes in v3:
 - remove usbmisc_imx95_init(), use usbmisc_imx7d_init()
Changes in v2:
 - add Rb tag
---
 drivers/usb/chipidea/usbmisc_imx.c | 77 ++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 1394881fde5f..8915749c7a70 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -139,6 +139,22 @@
 #define MX6_USB_OTG_WAKEUP_BITS (MX6_BM_WAKEUP_ENABLE | MX6_BM_VBUS_WAKEUP | \
 				 MX6_BM_ID_WAKEUP | MX6SX_BM_DPDM_WAKEUP_EN)
 
+/*
+ * HSIO Block Control Register
+ */
+
+#define BLKCTL_USB_WAKEUP_CTRL		0x0
+#define BLKCTL_OTG_WAKE_ENABLE		BIT(31)
+#define BLKCTL_OTG_VBUS_SESSVALID	BIT(4)
+#define BLKCTL_OTG_ID_WAKEUP_EN		BIT(2)
+#define BLKCTL_OTG_VBUS_WAKEUP_EN	BIT(1)
+#define BLKCTL_OTG_DPDM_WAKEUP_EN	BIT(0)
+
+#define BLKCTL_WAKEUP_SOURCE		(BLKCTL_OTG_WAKE_ENABLE	   | \
+					 BLKCTL_OTG_ID_WAKEUP_EN   | \
+					 BLKCTL_OTG_VBUS_WAKEUP_EN | \
+					 BLKCTL_OTG_DPDM_WAKEUP_EN)
+
 struct usbmisc_ops {
 	/* It's called once when probe a usb device */
 	int (*init)(struct imx_usbmisc_data *data);
@@ -159,6 +175,7 @@ struct usbmisc_ops {
 
 struct imx_usbmisc {
 	void __iomem *base;
+	void __iomem *blkctl;
 	spinlock_t lock;
 	const struct usbmisc_ops *ops;
 };
@@ -1016,6 +1033,44 @@ static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
 		return 0;
 }
 
+static u32 usbmisc_blkctl_wakeup_setting(struct imx_usbmisc_data *data)
+{
+	u32 wakeup_setting = BLKCTL_WAKEUP_SOURCE;
+
+	if (data->ext_id || data->available_role != USB_DR_MODE_OTG)
+		wakeup_setting &= ~BLKCTL_OTG_ID_WAKEUP_EN;
+
+	if (data->ext_vbus || data->available_role == USB_DR_MODE_HOST)
+		wakeup_setting &= ~BLKCTL_OTG_VBUS_WAKEUP_EN;
+
+	/* Select session valid as VBUS wakeup source */
+	wakeup_setting |= BLKCTL_OTG_VBUS_SESSVALID;
+
+	return wakeup_setting;
+}
+
+static int usbmisc_imx95_set_wakeup(struct imx_usbmisc_data *data, bool enabled)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	unsigned long flags;
+	u32 val;
+
+	if (!usbmisc->blkctl)
+		return 0;
+
+	spin_lock_irqsave(&usbmisc->lock, flags);
+	val = readl(usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
+	val &= ~BLKCTL_WAKEUP_SOURCE;
+
+	if (enabled)
+		val |= usbmisc_blkctl_wakeup_setting(data);
+
+	writel(val, usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+
+	return 0;
+}
+
 static const struct usbmisc_ops imx25_usbmisc_ops = {
 	.init = usbmisc_imx25_init,
 	.post = usbmisc_imx25_post,
@@ -1068,6 +1123,14 @@ static const struct usbmisc_ops imx7ulp_usbmisc_ops = {
 	.power_lost_check = usbmisc_imx7d_power_lost_check,
 };
 
+static const struct usbmisc_ops imx95_usbmisc_ops = {
+	.init = usbmisc_imx7d_init,
+	.set_wakeup = usbmisc_imx95_set_wakeup,
+	.charger_detection = imx7d_charger_detection,
+	.power_lost_check = usbmisc_imx7d_power_lost_check,
+	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
+};
+
 static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
@@ -1289,6 +1352,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
 		.compatible = "fsl,imx8ulp-usbmisc",
 		.data = &imx7ulp_usbmisc_ops,
 	},
+	{
+		.compatible = "fsl,imx95-usbmisc",
+		.data = &imx95_usbmisc_ops,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
@@ -1296,6 +1363,7 @@ MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
 static int usbmisc_imx_probe(struct platform_device *pdev)
 {
 	struct imx_usbmisc *data;
+	struct resource *res;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -1307,6 +1375,15 @@ static int usbmisc_imx_probe(struct platform_device *pdev)
 	if (IS_ERR(data->base))
 		return PTR_ERR(data->base);
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (res) {
+		data->blkctl = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(data->blkctl))
+			return PTR_ERR(data->blkctl);
+	} else if (device_is_compatible(&pdev->dev, "fsl,imx95-usbmisc")) {
+		dev_warn(&pdev->dev, "wakeup setting is missing\n");
+	}
+
 	data->ops = of_device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, data);
 
-- 
2.34.1


