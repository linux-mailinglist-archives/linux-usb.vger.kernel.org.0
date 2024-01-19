Return-Path: <linux-usb+bounces-5248-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FD68324E1
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 08:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17AD32853C7
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 07:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5E36FB0;
	Fri, 19 Jan 2024 07:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="XWn3HWDh"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2042.outbound.protection.outlook.com [40.107.13.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A7C63D9;
	Fri, 19 Jan 2024 07:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.13.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705648403; cv=fail; b=g+EqDmHUBWZ6YEY5WFIdb+QLf2sp/9sFiYKzGbB6erPsnywnxE6hrXXESgFgLNc/1P9xE4XiZ5cjHEKjnaqYb0uOrb8E5DdNNSpPvUUmMhoJgH51l6uu8PmB50TGjyLC7zyHFiNSp19fMsLUbFJD4CJn7tRSecyCo8TNbOrp6mc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705648403; c=relaxed/simple;
	bh=znhTN9WTRSkFpjRhWNobwLb/UzIiu5qSgALoaMCF5YY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=U9A7SmP3mC4Ha/dKLTgR1FIb4LiRHkE9DNNf9aTyeP+dbXLw0W4xj/HTZaz6PseyFV59a/qPtXkSpwC5Lrd/yFuJiTFXaOPBosQtDvfPyAgPEqWgumOQ3msKP7wzWGRJMr7k3nWkldWKDIJvhrL+vE+sgrFRKkse1lPxTyxFryU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=XWn3HWDh; arc=fail smtp.client-ip=40.107.13.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n19nh+g1tCWJL9POfQrhqlmUQsNGjCShJlkWipH6w+ApGEwR0pzbxwrRqZhGgWH1vkUrx0+t0gTvhJRP2ZUSG5ZvsMzR7qQrB8ef1LJNhTfh+I0+BEyIyGYjApUXgRdfodm419yKgztdv6TpH/2PwJF71rAjUeYLNfgZ8LNvymVewIx5zaiW5hEAErPLR/YHZ0lSekVXvZkBTDhNkV1IvEWRxmOD2tuyVp8Zs499pTjL+ruujdZRtCxZW49sI4wFLKCON+UoThTXG1kntLiQs9M3GrE7Sh0pf4g9bx0aU9bQPDnOg1Icqi1BiMuZpan/F6jIrq34eprdt4KjUwPg9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0srKspLqwAIzkVz9SKMmuyk690bxfg53+L9o6m59v0=;
 b=ighhgxj3AbqqdKQH/p7ksfbYB5eSaR85NRFZJ4dEH/XLN0QxVdi5cocjxolaPbA+qGTfP4y09wX+3xUie2bJnJgOm46iOfQYiTVMJTuY0ljzrNiedjz209vtbe11Ash0U7DExGkLNpstGg8RF0iAD29+rIt1GN+ZXMn7BCx+QxD1Th8CQSxGOd1DkkkH8dE9F0q1kd+lm/5zdwRP8L/LyExtcsHcZkRs7iqbWs5lttnvu+xFvZ/FEx+DEfxHO2re9n28AoC47MyVm7jaJbRF5K6C5rYaAZOsUDeoHGY7fQ4mWC9LKxkBUocuQSgna7sLMlznt2ctwU/qs6ctVlc1ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0srKspLqwAIzkVz9SKMmuyk690bxfg53+L9o6m59v0=;
 b=XWn3HWDhhHC/aEZrd8ChJZsx0Q7KXpFzOTu7/zbiUE+9240D4IeakrdQNOjG3GGpQl9ZPjbhMFPh7PPzyO7m3BHRO/niOyCety4Z7dv6Ord/TLimDWc4WdJOUsJL2a36IDXsF1EFXYb3wIl9pAC1FWioFCZOZtztcmaasrTNtRc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV1PR04MB9134.eurprd04.prod.outlook.com (2603:10a6:150:25::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 07:13:18 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 07:13:17 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-imx@nxp.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 1/7] dt-bindings: usb: usbmisc-imx: add fsl,imx8ulp-usbmisc compatible
Date: Fri, 19 Jan 2024 15:19:30 +0800
Message-Id: <20240119071936.3481439-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::7)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV1PR04MB9134:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bb84ba2-96af-43c4-dd7d-08dc18be1c32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F8DYO4IpmqM0gl8QPzpjsGnqpnxg3pW31sWgH+kl/C0SoiDBC7xsboxFriVJ76mK7gRB94nq4bfjyPvcIm/KoiJJUucilrC3KVirO7Zh1/2QtHsxWfamQGBsWApFxdszwoPrSWcSsMR8ZfWrDXFA1QtxCAK9mh6jTkNaxr0LbexL/f+QgfyvoF4ft2wtZAxwCYPeQOCM+3krjs13g6xMVAvOsIW/Xz8tzTS1fEOfldJhqkcFQGrTn1XsTl+KWCIvNMQxmXZC2Wgb2pyDaTsmCU0MLq0M5KWLBBBPk+EsUwDsSS+llnZaJHfQcX6005GjykR1ti0PZn43M3ShWi6yhXL3DVIrwUK+25g7o3CBa3go2eNhKDDRCvRF7IOfoM8XdgwEDIpeXKa4O//s3fxtEuHCR12aXZBFDtk+7VO5nYvRHk1ah5G2bMxhB9Ydu6PA8+KHHoFFF/BH16aYRFnUOIyd4V+BfGA4oKxsSGR5dJWwqrw5j0hjyfkFRTpWJOBxV2PW9lKoYtRDH5yhX5t+QE571Ycf7RSe+i4fF9wWt8Sp+mTDSJFxOrRx0oO5YEBcgVwEFXG7KY4Jdd6pXG7kAzwmvKqmbo/Z5dmviXOegb+f5hWAalx3/WGipmzG/G2D
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(41300700001)(26005)(6512007)(86362001)(36756003)(38350700005)(4326008)(8676002)(5660300002)(8936002)(6486002)(7416002)(52116002)(2616005)(6506007)(1076003)(38100700002)(66946007)(66556008)(316002)(2906002)(66476007)(6666004)(478600001)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FKpLeNrDrBFxPH3/sAgTT3HvbztKVuRx33cuZe5lHytJImW84BZSSVIdkxwM?=
 =?us-ascii?Q?7nEtgg/Nte08BAu2yepLU0fOi7rMsES7qfuPeQhV5S+6NA+8mgSkneKGUmpq?=
 =?us-ascii?Q?fz+od7s4WXGSQhi9zZ3z0aXc/Dbx0HVc6VuKURyD3E1a8yPsz0kiFdcH33iO?=
 =?us-ascii?Q?2wyuPE67nqhsCcT9MaESa6wOm2Lo57v25pIGrW4R6yUlzOjouPQvNabM9aHh?=
 =?us-ascii?Q?38NKqj74uGmJ1htvF78wkA8mQTPCyOLLD4jHTCl7Lcx380n0ZkOmCenhNwhy?=
 =?us-ascii?Q?q7uWyarCln7l3+M0EuQL5jU7Z0pFBZeDmxAFWAcEaSWomwfU2/Lu4aUOTGap?=
 =?us-ascii?Q?tgnyiDEXOPYXiY5FukJm0mSNATWe64kzvCv9JurQOIgLGgqPsCcQ6oktdWbr?=
 =?us-ascii?Q?c0eAnB+n+CEBgtBo/X3XW6r3S1nmNbG6hcmSzATmZQP5IQqHd+qDKAyNrHUB?=
 =?us-ascii?Q?D3XqYrpfaGqGnqPahy+xVcplGCN/dua3SlhH9omYHGkEj7ObVYHJb5MYWPiT?=
 =?us-ascii?Q?b8G3XVmCKIZQtSiALtAxN6sR2wWP5oPqbd0cAOGpFRoWetLB1WcXsDziaEDj?=
 =?us-ascii?Q?HBnvIRXfS7TpBl7/zooR+7cVvZI3FW00K3kAaNWc2+tAf0v7PynfHuHQPey/?=
 =?us-ascii?Q?+jfQ0c5xUhbwK/YZiVVYZUZ6KQuMGw9CvjIRtUg6Xy5bCrcNi35hnE5CbWUG?=
 =?us-ascii?Q?6KeWJHp0XV4PkWisl7eBsUzayPhaJMupvUwThLx3G16yMxCvnMqz1lOdclye?=
 =?us-ascii?Q?LKyDIFhZnarJALru1I2vBcZX6sljhefEKVyi3WsNbc9u7WPoK2LROF96xxaR?=
 =?us-ascii?Q?pv3kZ8FgoITCfRnSngHs2mZ/1rbviY9VVMYqhb2WETy6X9EIaJPdIlLVnSyN?=
 =?us-ascii?Q?7KRkDuE3ELe+lhxMH2ChUbeu+0FYDkXafbNTQU8qf58+QpS+cSdm8bEQN1uB?=
 =?us-ascii?Q?KgvdxkIc05nOBLJKnh9XrEY86U4JxqgJmmnURa4faNbPnEsIthof6stDZ/oz?=
 =?us-ascii?Q?tn+/j8f9Lo6mE0jhMfC2yz4xNfDUy+C171s6uvd7fdQ/b56RsfQ5PWU5kkG/?=
 =?us-ascii?Q?556nblLE8deQ5tBsLxuJGavh1Xfp1m6KCY278KGbsALEgMGo91Zz2wPfpNyq?=
 =?us-ascii?Q?z5tdjada2fvczKDms1sHT4fsaNSNfN8CW6fVVK0KM5+MDw7mQpXhbCzRnRut?=
 =?us-ascii?Q?1X7akt+DioEMQnGCNWkI51Svw2hCouT8Nsm9GSSHESX6tZOXObVagmLB2n88?=
 =?us-ascii?Q?8aSYMI/xlDx7Uy3HJ7o1wpz7DBZJ+7wZDGzMfeaW7Pj+U8ne9nDv+JmxDqkf?=
 =?us-ascii?Q?QMxIHxVh8uEwdT6t6i0+lZhT1Bt8TCzLfJ70gxAVtFrhG8KW+PtZJX2u8tp8?=
 =?us-ascii?Q?q6wwXlZxFXf3q1APEoDeF1Wzvlm9rxyCTQdmLvwDgrnIkAPO9voV4IK2qLBj?=
 =?us-ascii?Q?Ew+nxINdnpSo6LcEg2/pFHaL9HtPEqjY5hlYvTkfniNDi4vnrLh8s6fxNAXQ?=
 =?us-ascii?Q?ztOnlMeLUoDsb6yxYrz55acgESvqBxHN2XW/U4WhH2kMf878O+sEvbi+1rvk?=
 =?us-ascii?Q?yZ5DUUe4GZcvhq4VHDWl077wgDJYzm9MysqSVNqO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb84ba2-96af-43c4-dd7d-08dc18be1c32
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 07:13:17.8905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQd68btdqg80JLokQSIr8lUxHojeiK5YxJmIt6ROfwwwiJuF9sEnn8s+NLeb94knoKfGmpkmpJhpyCCwLhYgzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9134

Add "fsl,imx8ulp-usbmisc" compatible.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - new patch due to missed this little one
Changes in v4:
 - no changes
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


