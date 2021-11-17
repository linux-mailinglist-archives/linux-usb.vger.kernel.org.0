Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA93945420D
	for <lists+linux-usb@lfdr.de>; Wed, 17 Nov 2021 08:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233463AbhKQHw5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Nov 2021 02:52:57 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:55732 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232915AbhKQHw4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Nov 2021 02:52:56 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AH6UmRs031236;
        Wed, 17 Nov 2021 07:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=/XXPIwCBWeUJsofRsOfEgWv0PM8Xyi9fCUZJVZHZxWM=;
 b=UGtl6zBvaBc/SAIbBq7uYOUI1W5cbrNmQ6utYZ1wXesqYSm5c7xkqySFbzXdji/ra8xu
 HnInLv3dvi/m+60l/jKauMzkHkhrkMgq9ch+uaK6CQ8mPf8kA3sWfyePSRchqrpwnmGF
 hP3vqtSi2ZEzU+/7upUQcamR7KFtoDy2J36EEG9PPnc6ZcszNhEHUWpixJwLYA/ntApL
 6tFzD5slvjVqnRk5uEjirn+cruaG8pfA9xec5W9xI3snR2WRe7bTW8fZmgr/7EzT1hXp
 Q5M/tJSO5rMTUFrjKJzJq//CQpzFTkaHY1wN4JvVLcyYbLHUlPOaz6MMah8SKcRP5D0T 1Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cbhv87brh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Nov 2021 07:49:40 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AH7eIja114093;
        Wed, 17 Nov 2021 07:49:38 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
        by userp3030.oracle.com with ESMTP id 3ca2fxd0q2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Nov 2021 07:49:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lx8XrdMjOr0bLTGXcShMlcv6gmzNyhUuWR33HV+q6M50y5X4UIA0KowizK78sv9nELl1Mj7qYyLOB+yz8Jusv3mQDn/1AgRoMCRk/Ev8/qFKrirGlWX8i4fLUmgoZwYbrwyuEsvPDCtsPsZnQ030J60pdSPDFb4macqEoR9iQgZ471lfU4bThrEPPTUTZaEbJZI+q3B+6uSCEFgfrZnXr30cWrzTlyXZEAi4ENMaVp8MG4P+e5DS4/paBz/6xeRLbFntQvFwX9BstE4mTtS2jQf5JbBVClN/geeNDpABo13h6EaSDskXzUFUCFH/jCPYLNBebDcV+AE1upC20WHdog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XXPIwCBWeUJsofRsOfEgWv0PM8Xyi9fCUZJVZHZxWM=;
 b=lW/vF5cGgve3gAtuA5oqwOQF9y2D0i5w50OSAMX+JTMxsgGxYUX1LMArrFqX4iT60aEZrE7nZFlC8hZbYQ8Uuq4E2C84WGf4PV8RQZLghLsR4g2l5VXiEVcYMVjP1LJdK5gpc4zQ/84ZvCt5VHXtWwJvH/LN7t9E33/rfljWXd7tdoBoUJPDbZqPN4GNAzAOqa0wtaX7tOgSNHE0y2ehjnLn0qxDwB3qYr8yE7HmTv0FS7PgPvHHvi56vu6a4KSPVt2VyWfqucK6bXcZIV2O3ryM0KsItkzj9a1CrlaZFrgt8JEhUmj6ZN2kmg/cPJS9eNz+ukAPpEWg8C7b2QgdKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XXPIwCBWeUJsofRsOfEgWv0PM8Xyi9fCUZJVZHZxWM=;
 b=DceUscETmbd5ya+eGFZQZR99xxCJKf3kjLbm3gBTAdWfvm+ac0S0mZM4vIjIBRJs1vpN2rxNRzyNXDAGs4mp7IAExfoUxZfE4bAtdk3Fr4L3PmBUX8FZLDn5iBDhqVKDJRZ+0dhJGGjADqoPsICN3AVST25a8yZBQDza6BkYZ1A=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1549.namprd10.prod.outlook.com
 (2603:10b6:300:26::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 17 Nov
 2021 07:49:36 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Wed, 17 Nov 2021
 07:49:36 +0000
Date:   Wed, 17 Nov 2021 10:49:23 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Peter Chen <peter.chen@kernel.org>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: chipidea: ci_hdrc_imx: fix potential error pointer
 dereference in probe
Message-ID: <20211117074923.GF5237@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0042.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0042.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27 via Frontend Transport; Wed, 17 Nov 2021 07:49:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f982b6c-ec17-42f9-6e97-08d9a99ecd25
X-MS-TrafficTypeDiagnostic: MWHPR10MB1549:
X-Microsoft-Antispam-PRVS: <MWHPR10MB1549971A035FA938E51BD2F98E9A9@MWHPR10MB1549.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q9Nh6JZY9dg/AYgtCfo5Y4mFjfDdxEnj9vi7gMwZM7MM91kE/PKXcO3B/0BzgWQGftgHS3Df6cf648d4ZHCmMx7br/2XmsU+I15DWXiSR+J9XnlmCUWYu8kmd5m2cq04aV7Tn2DaeHzXvDwlvxBRNdIIzeKGMYblpZu5ynsaIl3g1xK4O685Qt6dYlEp4tetTCNawuctNop1vYWylkqD3X9pWy9qTNAB9u8oz2QbsAzHJM2SCp3yNV0g+iaetTWgSbBGjsFV4L/1d4x+MhdypnJv2a9lwbalicWt9EoBp6Mt9H96Kw9C4kKnJgSHdWdw2UP6MKOo5cxQXTHheKEBTN7m0Q+faJ1p2v2nlwsWmjo4u7tyTNM7ZA/pEjyTGYNQzffS8Kf4ClCjtUFG9vRosHAoBP5b40wACRZNPr+RcDSFtMTMkalwbpr/ffnte1QtNsXYD3yz5OSZMvb6cOgMzVZAqvR4peBOsy7wZsSqILnfurdmcX1vL1OYLSAe/E0ycpSRHwWEp7A9pWmBpfOry4dro6kgTpmW/CAB3c1hW3EpB325NM/nNbDkZ+BVyyHqwl2mlnPaZh/mAkqP/YDTnvKazl6xI4+P9luq42MsWD/lSu6+6kjjXfPaZqcf5TTSmCVkNvQkTr3mGnvQ/6U0tsrQBTnPOTFkcuOji6iFWDGCzPNasFEDYre002ZIPzqM9KILJ4PJXLEGFmxFV6cd2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6666004)(186003)(4326008)(5660300002)(8676002)(7416002)(38350700002)(54906003)(9576002)(1076003)(316002)(66476007)(66556008)(110136005)(38100700002)(66946007)(83380400001)(8936002)(26005)(33716001)(9686003)(33656002)(86362001)(6496006)(956004)(44832011)(55016002)(52116002)(508600001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sk82l3fY3Pz3p9U53fIM8VeoBnS6MfC2jMRTwDni/k7qPh64D8ME/0nvy1WC?=
 =?us-ascii?Q?HzWTKmQb1rJ4FcpcvI7p2zKjYRUfXz9qmo6naYXnJKxD7ufKNFZVaAhrDMol?=
 =?us-ascii?Q?u+WDloXJqWF/9+3fg62JO7nbmfYxIedR5drzj1Ya+wJ8PL+B0wEl2C789Q1u?=
 =?us-ascii?Q?GzrT7E+3MJ0DRlZD7rKpvAkWAIFvm8p5FspNLwU15i03F7nuHvedOB3l9Rtt?=
 =?us-ascii?Q?affVIf+Cdek2zJMkwIda01CiqGNrLxB80P+5iMMd+XUhnFALSXqbFhMcKvdA?=
 =?us-ascii?Q?r77pkxw30LvcoltMUncz8k8aSlJC6/yqU1q6RhNbff1dtVcPovqVnAMs2fKi?=
 =?us-ascii?Q?ippiI1uEcOKVlE+Ze2c+1nbCwViYWnJcBCQsNj/oaeGzGX43vDUXn7JNOyer?=
 =?us-ascii?Q?xSzd5Z/MHDrYK2D9Mh1Nsq8VAcHVaR1PuFCD7rKBdWSqJx5BGl9lKLpkkCMF?=
 =?us-ascii?Q?WCr89RCzcQOuGp/tRjbCmlZxCxjMKcmQBRqFdhxdGFj+zUN/TRuplS8x27IJ?=
 =?us-ascii?Q?9zV94CWM15MMLehPmUoMIC0sT5RCHjBu7oNdUtIS+F96Sy1kGCa4dU/UZMun?=
 =?us-ascii?Q?2Txd08zC5A/YJuOUy60OEuYBkkwZ4bZOtmZMhAbh4rYjD+AX3SwGVuux4E2+?=
 =?us-ascii?Q?xt92Nr8MoKia+mwbgAbumpoCBKAAOwHdkgLs7jJWeKHVD1FTGJ/Y0vK2JVAB?=
 =?us-ascii?Q?jHPfUF1JMyu5QJbC22CGjR5HFVtvUJvLN3eokzWlAbdF1Um8ft7VFvzgekHV?=
 =?us-ascii?Q?8+Wa0hNG/gIeyDODE5iYt0uIifjmD4a/+k1V4GUDRNsiHo7zmTtxma360NGV?=
 =?us-ascii?Q?e+3yusjZvERhEQN7IN38UZtIqr4iGYiVoQ6qeJ4mVyuC76MCyVg/mlIYm1is?=
 =?us-ascii?Q?6VAoEHder7HvCDGJB7iel8nkgnSwvfAXsBV+GU+WHjus6akQM80uhKNDZAtM?=
 =?us-ascii?Q?saw+8dLdwwV+NStdanIxPhR2sGSq5xQjL/RRRTyJh/Ud9Cp1A8SBbCpcEz8t?=
 =?us-ascii?Q?rAHF6p+hiA7PYfzPL+D8V46JFqr1CZfCWnu2xXNWgqTEILo+3K6MHOKwIdO8?=
 =?us-ascii?Q?POnORWHR8dHdOmr3hooV7iGU+E11PLfFE6uCgIOlcxHfZFfG40FlKEUSTb6R?=
 =?us-ascii?Q?cxRYBqDyaPYsG6LIHphDaKFzxI27C+ZWURkoWOkWjahB4B8cctiKKcwVhOc+?=
 =?us-ascii?Q?7pLtoiZ8zAWzJd9WqFGCOdfcH2dxb/McuIZkQ7O3Mk21Lb36+uPbUpJ2GsOA?=
 =?us-ascii?Q?ToQTz8uxgG59j9/a/Ltz8LMmRsjPAMyg365vxPI5zSH/pIzApoDWEzOQpP/j?=
 =?us-ascii?Q?eV6TtNuJslATuNpDugpqRu5KeyB6my5a0rZoSBAjgZRZDT+tFGF53Q5IJ6bG?=
 =?us-ascii?Q?U0bb565PP+R4QHgYR9VWUIpy5+KuUREmHg/FzHDyeo00o1tN/6DgepdSJBoq?=
 =?us-ascii?Q?abY3dMLE0gxFgj5lyXGscSQsCG2cD/kDyb/LnqohyQ2ktRBDy7ZrLQT0SRjs?=
 =?us-ascii?Q?t4lBC9bF9noH+tSqXdQKkR4hjUAr5gg21AiGTnFc18Tte5u5Sij3RkM+8OgO?=
 =?us-ascii?Q?8vacIaRin0NgRKPrH8VQlx38rykgqBoeh2pCqDd2hMjHlGKr3DKV4CRHYUxc?=
 =?us-ascii?Q?fb6jefv7is0RKWgPpRPbgXoYbrfMgKI7uZeYhuxEX3rwkg+ISVHtfxMReUki?=
 =?us-ascii?Q?/nEQUNVPwUkpJcB+eFKEk9CATPY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f982b6c-ec17-42f9-6e97-08d9a99ecd25
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 07:49:36.2444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jkqYnMTiWm5leA8rdMc3q91BzCB0KOFbUZgVm0uhGwoXIxByqwyckDqfzg15iES5CX/gXwj+JBSzR5ThP2F8aV8zhy8K45h4det9ba4x+5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1549
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10170 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111170035
X-Proofpoint-GUID: s3p4BxzAHYr5Md_TEhMQ791Iu1ExJmFZ
X-Proofpoint-ORIG-GUID: s3p4BxzAHYr5Md_TEhMQ791Iu1ExJmFZ
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the first call to devm_usb_get_phy_by_phandle(dev, "fsl,usbphy", 0)
fails with something other than -ENODEV then it leads to an error
pointer dereference.  For those errors we should just jump directly to
the error handling.

Fixes: 8253a34bfae3 ("usb: chipidea: ci_hdrc_imx: Also search for 'phys' phandle")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index f1d100671ee6..097142ffb184 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -420,15 +420,15 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	data->phy = devm_usb_get_phy_by_phandle(dev, "fsl,usbphy", 0);
 	if (IS_ERR(data->phy)) {
 		ret = PTR_ERR(data->phy);
-		if (ret == -ENODEV) {
-			data->phy = devm_usb_get_phy_by_phandle(dev, "phys", 0);
-			if (IS_ERR(data->phy)) {
-				ret = PTR_ERR(data->phy);
-				if (ret == -ENODEV)
-					data->phy = NULL;
-				else
-					goto err_clk;
-			}
+		if (ret != -ENODEV)
+			goto err_clk;
+		data->phy = devm_usb_get_phy_by_phandle(dev, "phys", 0);
+		if (IS_ERR(data->phy)) {
+			ret = PTR_ERR(data->phy);
+			if (ret == -ENODEV)
+				data->phy = NULL;
+			else
+				goto err_clk;
 		}
 	}
 
-- 
2.20.1

