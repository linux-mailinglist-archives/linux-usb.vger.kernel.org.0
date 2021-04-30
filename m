Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C41E936F633
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 09:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbhD3HNy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Apr 2021 03:13:54 -0400
Received: from mail-eopbgr00061.outbound.protection.outlook.com ([40.107.0.61]:28325
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229590AbhD3HNx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Apr 2021 03:13:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFHt2Ezy5nUqLfpoqyvgQL2eJr89G6hz2xeuAlMD9jo+XLIiHA2haLilZME7T74TejC2RH6tBes2vyTjvmUPH5pZ9P+TYlPv1geU3BXMvuqFsBMF/23/fNt7bf1WZx1A4Oh6P94CaUtjhqFl5w8FTiM4fjw4oDrRm6F8Kg9vHOdLsgHIKEKfoZN3AAJWWIkDHueu2RbAeclTGymAXOsOBPkRS4HQt0M4arrG2Gyns8346gShjWF9khB+VftksU/GB7Fz06L/DL3hwn/T0bEzfnICyeZMbEts9JleKrgmlciqx0iPAyF3xJwA0L+j2/C3V4XSwKQd/UXJZVmbkZu/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZ4pxTenBu5uk4IZkzB2XO9Pds8RgloId5PHH9j/M2g=;
 b=FmYwLjAxSp7Ep15Lu3VdfYE7zFuUxMkARNaykskmgEAzF1wlnfN92sqVi9DHxkm1c/iNuwZW16wbRU+FqKtK6bQOGJFOvQHpOaRKeI+DZ+MbP3hzELwFt2pdxp88PlO3QXK9pjukWR4S4Dsqg9ydjuqChCf87jiLdaN6GMORlUcBW1DD/jy7VRUa6d/jAQIoJqzRRzXuAUacMxd+PLsNzE8Vr5u/798VB2aRw6jC743y+h7dezhaj71iAP6wgO+Hrr8hDoM3E9llDVSm6YsctX4UEBOgZAWyp6J/FN/38gd3BH+jOateDpMhfzc01ZO60j6AHkW0mFip+6BKF4JqfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZ4pxTenBu5uk4IZkzB2XO9Pds8RgloId5PHH9j/M2g=;
 b=s6G+1weZiD3av/s4H3d2hwAsWkmUQsZ4nMI6A6tEr1imElKYzYOrEAWqOoY/5FwV2CcMIJ6Wpze0Fmij/iLp+k8/HUQb39LmTuKFJ5fGNN4A3fNS/s7Re2XI/MFVvEsiS9dWxI22DCFD4TOARB/b8WLyVnY5tzQ4ZyDyLRAZTuQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VE1PR04MB7215.eurprd04.prod.outlook.com (2603:10a6:800:1b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 30 Apr
 2021 07:13:03 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe%7]) with mapi id 15.20.4065.032; Fri, 30 Apr 2021
 07:13:03 +0000
From:   Li Jun <jun.li@nxp.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     shawnguo@kernel.org, linux-imx@nxp.com, thunder.leizhen@huawei.com,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compatible string
Date:   Fri, 30 Apr 2021 14:57:16 +0800
Message-Id: <1619765836-20387-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR03CA0056.apcprd03.prod.outlook.com
 (2603:1096:202:17::26) To VI1PR04MB5935.eurprd04.prod.outlook.com
 (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR03CA0056.apcprd03.prod.outlook.com (2603:1096:202:17::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4108.13 via Frontend Transport; Fri, 30 Apr 2021 07:13:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0999604a-b3de-4843-d843-08d90ba764a6
X-MS-TrafficTypeDiagnostic: VE1PR04MB7215:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB72150B086F599AB762F99C50895E9@VE1PR04MB7215.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q5VGyawXxR3yfyKyE4rnwci+JuFpgiA1OdSrXrvHu30wycxp5agzMAwdl5pWdJy50IA1CVk1ha6c5ZhPMlMPKRUQg9ana84zp7639H3DgwvOm5BpcKBSlGv0aLF/m2Zo83VAMKIcAcguaQJ24IJPV1NjxQN9T+CjWfqLE1j9fKTaQXvP+RfZYl/lf29rVYrMlN5ibZjxQw+UOyLi/q/kNX7QKL+nHnv7kVIX2ztSdLD9ribuUsw2J44euUHbrIFIzNBBruc+RFRnYNQzyjnFDpiBZ7+Q9P9zwfUH9Dx2uGbXArhqxK8zmgoYGpycmiZuURAodslRsMdFj1DF2ycS1WA3NPMlxmqqxjNsFJhx74Tp7MAYZV6dyd/ZZ963bpWbOcqsWvE8Se1OLMDH2k5ege8j50kFxavSPLUpj0p6wn7R4/hlXZqThGUfhpCYnHsxtxErrDv1rDTHSotNhpGHiHptkvj2dpjqvLUpbRmZCZ/8sn2aolZCycW4wOJ/qIKbpj+u3GETEwXqSagZgqWnXa9rwafWWcFt1hYpEwtERcewAsab1o7m41aBybZKNas4uIBjBLtJUj0/aPmRDH0hEq40myy6UDHy6K7uGs9Fww2iyfsVClu//ZmzZCq7j9lf4ttHczPAIJ4lvDO7727D14pZIZuU0OgMU5K4a8n13rX+c2eABv9hI2fjvQKHZvUThAXOH2iSWeMPl9sxqo0tUe1YnPmR7lOS0de6ibaNhd0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(186003)(86362001)(4744005)(8936002)(956004)(5660300002)(478600001)(52116002)(2906002)(6506007)(6666004)(66946007)(316002)(6512007)(16526019)(6486002)(2616005)(36756003)(83380400001)(8676002)(4326008)(26005)(38100700002)(66476007)(66556008)(38350700002)(69590400013)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jnw7m4YTHvrZA/FLsjkuHEywef11uBlA1B5WtCMuBYWFDgFbKQtGfkPvRcwo?=
 =?us-ascii?Q?jBFt+plrJOfB5aYd4CI7JlyCEskwWii5uVVjCsE8ppZxPX9/B0cRBAfgFjnv?=
 =?us-ascii?Q?KXVIbuJwNqCIz/XNkhScTlxO/r6fzwIAa83MJ7ePRvxzI5a7B8x+QQhijo4q?=
 =?us-ascii?Q?YQfSwB1HCrHxQtofw9af0GZHbWT0ug3OrnZpLZBs2XkWEMZWTtQ4L0+hTpbu?=
 =?us-ascii?Q?fXL/X2JAElpA9YOn3zsoM46yZCGXG4PfuzRGFgWViGaaZj3+35w3sgWc0fOv?=
 =?us-ascii?Q?mTTZMTjEHbcK49MoZmZQHbJh3Q31An8FQ/X0CvPczf7uxARDDWMsYnC9sFdv?=
 =?us-ascii?Q?ccmdltCYLKVSfHbiPY7yyCJMRKebhiPngbdHSCmHSUVnwqpXTzidsouU79/L?=
 =?us-ascii?Q?5pvWA2gUnwwFjfbyqJwVxdTpXaw9DQLU/BE0YBl46XmOqCA0kZHr7WU3zQIy?=
 =?us-ascii?Q?7FeNm8p53o5OtnUM5ApSpzpf2UVPUz1VcVNtZ0Z/ohZPLqtt0TmWN7XITM5P?=
 =?us-ascii?Q?Jj+1uGRRB4P/4jJki3AFKjmQDKr9zuNGjd+AsFaebRV2ew2UWHq20gQBlA+F?=
 =?us-ascii?Q?33xzFYq+KNODZpsOdJ9uIJBcN7wCKY6xF3zzuJ9zlt9TJaDS0/mdnHkPXGqk?=
 =?us-ascii?Q?lKdDlsAimcaP5DIYTxzMUMNCGkF1M3r7d2z/h1G/qL1cu2rA/+V10gJd4RZJ?=
 =?us-ascii?Q?CbWbHyH3X44QUcivRgrQ5sKIm2qTCkScmaTUaFCLmMO9mOn2C95+aq5vomiN?=
 =?us-ascii?Q?Yw30AxYI2tRz1uX/ai7ycjLm8WLWvR7rZar13LwSpIg8SOh9Alf/F+z1b7UQ?=
 =?us-ascii?Q?ifdoZ1mDXG3W11EqxIQHiq4Zy/WJkGx9PAmEqYDjFN8xGBV8efj1MvoDfik1?=
 =?us-ascii?Q?kb0pk/WdXb4KXJz0QaMmROW1EAWdhE81yiOy033T1UQtUhCuYCzYj+BZLr9r?=
 =?us-ascii?Q?8gDefy12iTIFAYlE8srZWFXdurwzHIZMNpDC68Cw0NuCnivZT6U0LAAkwEyd?=
 =?us-ascii?Q?Kkr/E+d3qo4nLXkokOdP1ooQZsXv4qVF2EDeLnouWa40Eh3pKMleyHd6Px/W?=
 =?us-ascii?Q?IlTC+PPzUl01EGPa1pkEoiaV1Qap4Gd1bYwE9CAf9sbLeP9hyU7k1FUVAe/T?=
 =?us-ascii?Q?JnU3jT+KaEZSDn8NWOsAPuguMqB1YOUJNXHT+b3+fbRKVoa50ISnlFJLKP0x?=
 =?us-ascii?Q?BTnBAbsa8i05Z5SIBVXqaDNyzUfdrGvrR/WnIIz20/DOY1MeakTpRgMCb2xi?=
 =?us-ascii?Q?wt8ytQ3hQ8sEbEx1PJXCSB5+6DDZRx5Uk5nGKE9oXvVQAk//W/Mzm+GTmaua?=
 =?us-ascii?Q?NftIP38+yjHicrD2r7R9H30R?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0999604a-b3de-4843-d843-08d90ba764a6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 07:13:02.9153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hjsq+gBHzvNvNlm9/miTE+8y/z0eOenyI1BvWFN25ghj7T1rfcl/VG10MZcm9uIe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7215
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

New schema of usb controller DT-node should be named with prefix
"^usb(@.*)?", dt changed the node name, but missed counter part
change in driver, fix it by switching to use compatible string as
the dwc3 core compatible string keeps "snps,dwc3" in all dt.

Fixes: d1689cd3c0f4 ("arm64: dts: imx8mp: Use the correct name for child node "snps, dwc3"")
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/dwc3/dwc3-imx8mp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index b13cfab89d53..e9fced6f7a7c 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -165,7 +165,7 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto disable_rpm;
 
-	dwc3_np = of_get_child_by_name(node, "dwc3");
+	dwc3_np = of_get_compatible_child(node, "snps,dwc3");
 	if (!dwc3_np) {
 		dev_err(dev, "failed to find dwc3 core child\n");
 		goto disable_rpm;
-- 
2.25.1

