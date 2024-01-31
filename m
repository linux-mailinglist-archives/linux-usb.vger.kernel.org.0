Return-Path: <linux-usb+bounces-5694-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE53843E82
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 12:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 932811C25724
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 11:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5972879958;
	Wed, 31 Jan 2024 11:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="V4ilotLA"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2062.outbound.protection.outlook.com [40.107.20.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4A579930;
	Wed, 31 Jan 2024 11:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706701018; cv=fail; b=icavDmVeC3MUwmtsL2ud3pNDFtbZChwJ+qbVGth/J0kZfhXW+oHCzi3SEQGgI+xpiUiwsdewMScX7q0I5RMh2zf6VR8EU1nMfPXLv2w0zTZ9hwPzz24gxHyEI+gx4KtoH5H1xl9hMkzjkH7aYDshIiTL5LOCziYqM312r2kFYvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706701018; c=relaxed/simple;
	bh=PkvpnXkZU/L5TXCW/SLJ9SFy80jOjmOhsAc0afuoIfY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ufJrq7HNXoC0D+0Z/DW/8/etZfAiN4JCqlQIKtYW9UrcO81X/jUEUaTFV4XCnKO+AunWzI8ESvSd4H6JDXZtrTk1Lf2pzhB0tJg0c6jns9JYgJVlkGOveklFIqaoOzgSR8LdZDT+dgJCR56YcGeiahgWVkOM85dS64/kmtdG2+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=V4ilotLA; arc=fail smtp.client-ip=40.107.20.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/5OgbWqH3EOMT2n7yk2nHZl85Qc6Uy5wgUsNya9sCDBCnFZs8DcRAoy0ynZTkswk+zUbh/e17lDMFUSt+HxFMcKo3xlg448lQy5Z9LEFHBd4TZCqn2nO4Ogtu++lKcu4inQ+Nbtmvnza16vuZbS/HqGeE68WAboynrZhYkQJhBaoXekN+kHVBwC/zz53TOfOvO9a+VKL5klsrspMBNTIjlpNCtKaMjdv0BLoSKhLNID9WN8AoxgyEgUUexz1RJF4ofttq7alFmW1YAk5xiQF7JBtRXQ1RAgwSJVVA7e7MFJduSp9Zs62t2Py0NlaurbJiVh9pQq3W4hB8qUzJ5Utw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwcokNXtW0NcNrCuQS7Lzvdxm0bZayGRGa67HmaZkmw=;
 b=jCFdn7XXb8uU2toL8vnt7BTdqMIH5yGh+2QVLZNb5/Ssgt/UJrg/8DyridBIW7nXaLDpDhl9WTSePY4GIHW5Uy0CwqxVnBWWqZJ5wLQ3zZeQ+mO274VSy+WpQqWo2s8EjxuKorwTOQQHXatJFECaLz9Jn7L58RtaM7fhKHqs0v8ynvhb3gwFFPp40R0dywSVNnQrw1SMGmdgL7FiDNDPYR9FBUhn2oFgZLlE2OAtf7mM+Xv9icJm2HymGKHkW/HdeWN2JBapQcwsRBn5QsSCqumufMjpVoeFN0VUspOFm5R36HuwUT9IgIcNUBCurTF5p6IeK3lFXP+1fgcAL8qn9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwcokNXtW0NcNrCuQS7Lzvdxm0bZayGRGa67HmaZkmw=;
 b=V4ilotLAu9f6eyhoSXExxxDaRq8QjndCZTjmOdCC/A5IjBOwiozgfBU3RYgnx0jWNSNZ2500KnGuzDsOnJjBsydhFZw3BfdJ2354pWHtNY5IQ0gky/HjLOdUbRqCW8w8YHUTCcoaFz/M0P3GKXHvI1BTqq3n5RI09Z62Ms8qF9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB9093.eurprd04.prod.outlook.com (2603:10a6:20b:444::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 11:36:53 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%7]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 11:36:53 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peter.chen@kernel.org
Cc: linux-imx@nxp.com,
	jun.li@nxp.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/8] dt-bindings: usb: usbmisc-imx: add fsl,imx8ulp-usbmisc compatible
Date: Wed, 31 Jan 2024 19:43:17 +0800
Message-Id: <20240131114324.3722428-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0107.apcprd02.prod.outlook.com
 (2603:1096:4:92::23) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB9093:EE_
X-MS-Office365-Filtering-Correlation-Id: f1567f9e-1cd8-4f42-7f03-08dc2250ebb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mp2ClbVmCNIxdgd/9oQuhY55Y+usJFfJS9kT8VfcMda4DthQauWT/xMjG75zy3TS8bceOx/CzpC24EnJA/7Izwja2n7mp+9T/om8vBVObo6ax63ar8r6UuoXnPr+LALDKacQKA7CCFMv5+Ush74vj6SDBEb/1D8Ho0zxUyADPmNHHjnvEcvCL/xbHeV+VNIQLqUHQC63I/SkOcK489EvvKlgdl41gTCEWOR/GzAim8Bv/GQpXbaIl0qDO3uAcLPKdDCpV0Q4ZScgM4csEv2m5uu/gqindlaZfYtZUpg8946fjCBH9vI6lR7uMl5OO3fwD33LkOVm1haooQls0YUNZcTHPejLvHRHQcz5RRcAsCdDyQ+jOnqGvPmWkub8t+r5g2bHtn2mMtGGzmKcoouXb2Y35bb0llOfhTtSAJPYKD9wnOLvUteElkvtHQXfn6rC9JZVBGDFL0vfGtvG27tbltiJj57HZNUtCQLdEwT8I+OvBO4mhy/A65p25xb/CTQd+OWk7TxhgWAUO7T03Un/UQ8mJhafdasPgjVeZmG9h/pkN5SUAYwlX/QKqsBjCw8ml6walgmYdm8sPPrqirH5sim+oWe6RAUialjRJ1vs9TjIWq5Pia9XKQ5YCVRjXzo7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(26005)(1076003)(2616005)(41300700001)(38350700005)(316002)(66476007)(66556008)(478600001)(36756003)(6512007)(52116002)(6506007)(6666004)(6486002)(38100700002)(66946007)(5660300002)(8936002)(4744005)(7416002)(2906002)(86362001)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xcjrlYfbRdu79pvxmvWH0eeP+zZMxaj0+eRFCnwagZ0j01Ic1n8omr5nG+n7?=
 =?us-ascii?Q?rU4M7pVzIetzutNNDV+UqHr6trVVvfaHgJjFwgQvBb/vgBizOz1wAJwDj1Z5?=
 =?us-ascii?Q?vrIxJN6CgKCL9Us/aBsmK90zMJl3IxDbmlt2nOeNNayHRKQv76Eqq5tn4iDP?=
 =?us-ascii?Q?n4XcQLWkRcK2ZJzE8sG1FgHNSeteSWAMAs2LlpBI0Seox5/0gTVvi8bndi1P?=
 =?us-ascii?Q?1hrihOxD9lsLRXnJSluAZvkAeUkG8yxi/2xfArvAvhng7KNrLnRL+FWeMwqN?=
 =?us-ascii?Q?bGFLzX6/C98+p0Pk0nr/1cyIvc8NTqbknMTA554c46flOHP1IKpL5v1jwmkh?=
 =?us-ascii?Q?lnl36Ae/VG+vYD8284zUh4IyunryPmmC1B+5FZqXAgw48qrIlO0Yex8Z0cKH?=
 =?us-ascii?Q?q7ssELeJnLj7iERxSrwQct4W9yOcNvL8kB85tk/V68hL/kMM9zK0mM7UTAOi?=
 =?us-ascii?Q?909jvkXYJzA1drGwUGzRhJ3rEEgL6pHvPbfeukY86VzxsV1y493iHBK+Tkd6?=
 =?us-ascii?Q?jEB1ef+ii7fMU00tr6UmtQLbrshl0fVAlK+TY+apa1YP7vziXxYVpthXKRvg?=
 =?us-ascii?Q?rAKt/4YL/TKD2cKt+sljr32Dc6DSY1C5nkmVwvJnLXLxajbY4l0Vm7xv7WyT?=
 =?us-ascii?Q?Y5UHTXr0xPyMLlWJcfqohZfYws+dvQTJ/X9PsvzuiJP/mXzfQhFYXrUHeaDq?=
 =?us-ascii?Q?f89pfq1fQCfGrT+KCu2gK9HDDDvg7lZDHMCCY95wWuKShYFLXp5Du/V1D4hq?=
 =?us-ascii?Q?dBtxlZDn9QEoGpZBAY8F0ksHW40JSzDZHMOaJ3YJvrheB2Nfp9jLEg+56CQj?=
 =?us-ascii?Q?5WBlFImLph1iIwAciOSwbfV6Mb3DLqwjWw4aQoMp913J3nbs95i2/VypiMEy?=
 =?us-ascii?Q?pXqhQ8hm1+E/na/4kx/UyzKABscK0c99HMcmAr8Y9xKVKPW3R94J+d6Ebd09?=
 =?us-ascii?Q?TeLE5CN773+5as85pimnMfFYJefmWChNkra3I8mQnlf64OOqk4AFLvjkJ2df?=
 =?us-ascii?Q?DhQXWHdzSSaRakdtsZOj3sCHfHbwe6+e7iDO4s1K2g60ZRRJ37qsP6rhQ6u1?=
 =?us-ascii?Q?XE+ZVVfVvGVdB4EAIVha/JzUyULTAlEghbp3z5BkPLvQIowH8No0XwP1YIYu?=
 =?us-ascii?Q?iS7B5pKxVfYtWYBPtbHKcVAnfxBP4+lMXnwqsJS51J5eJzb/7rcf8Z1n3ByZ?=
 =?us-ascii?Q?pm8hNytZlFJZWhmaJxmuQRdgbrJhf2DxDZSxaU7kJz1um1gSPemVLuBXY9+c?=
 =?us-ascii?Q?6aBzZp+nWSio+zh7pJyIhxjYRyFkwDhkZF/TERiFJlceWaXgYR8Td0tgNtGZ?=
 =?us-ascii?Q?UaKAIe6wSqV5oZIOmm+WJmCu40AeDayUeSpCpKzhiFX9kYdbUFtwDXIF1XUq?=
 =?us-ascii?Q?+/UOJzfoJvVeat9XjwqneqUmhF0o0wOmLkNsUpp8mwqzaOViwPf9NTho9RdJ?=
 =?us-ascii?Q?LnG8CrvpxHy+n+sX7nWiJO7bAjIbZIbXzrxz3RYQFcCh5oXS/DuFNHj6ySnG?=
 =?us-ascii?Q?3Qo+2x1kF1VQlkrqqXcgHpURLSwcZA4mesowDz1L0TrLzjK8TfjyMYkrqyU4?=
 =?us-ascii?Q?Le7jakL5ytQ9zUAv/skEQmGY6GzgBSfmva0m62bO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1567f9e-1cd8-4f42-7f03-08dc2250ebb2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 11:36:52.9808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IgsfvhfBfD0QqjfUhKvTN5jZR2ajxe/NQeRuzNCtn3Bv4wVhzXshfitDlTGaipNFKwScwb051qjU/kxZFVvslg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9093

Add "fsl,imx8ulp-usbmisc" compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - new patch due to missed this little one
Changes in v4:
 - no changes
Changes in v5:
 - add Acked-by tag
---
 Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
index 2d3589d284b2..0a6e7ac1b37e 100644
--- a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
+++ b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
@@ -33,6 +33,7 @@ properties:
               - fsl,imx7ulp-usbmisc
               - fsl,imx8mm-usbmisc
               - fsl,imx8mn-usbmisc
+              - fsl,imx8ulp-usbmisc
           - const: fsl,imx7d-usbmisc
           - const: fsl,imx6q-usbmisc
       - items:
-- 
2.34.1


