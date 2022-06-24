Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F46C559417
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jun 2022 09:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230441AbiFXHWi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jun 2022 03:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbiFXHWh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jun 2022 03:22:37 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CAF369AAD;
        Fri, 24 Jun 2022 00:22:37 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25O7G59R016664;
        Fri, 24 Jun 2022 07:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=EpItJ2rAuzNDn2MaMei1uynfjUeza14tRjxeUEJuy90=;
 b=Lvx2k+cWN4y5sYeqLqEURj/8Mqj5wIi2tiPlvs8WZcog3dEaQ63XzkrhRG2zuZzf8vIv
 XVcyuLB0CrhJZ/PTsixE170bYezuPz+gnEHLPqKMSzkP/rca83SgQ3RdBrLBmUzeyiaC
 nenl0bnyEb+alibqKlJlMZXJSz+rGURfExKlpMQ+7tsVBuklbIAGUMasxceLmrk/k4PG
 wjF9qvF6dHnT3vtxbsPIBKA6T/ki3oUbpIHa2/YddPWuK5251rtHy3V9v0+vwgp+wE/3
 HdQ4pjsgVkCZ3wxsBiyz502QydhRfw+z/KusJwhmPT7cIoz5hsW1oh+aDPGJ/jOi5wYZ 7Q== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs78u51j6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 24 Jun 2022 07:22:34 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25O7F36N016982;
        Fri, 24 Jun 2022 07:22:33 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gtf5fc0bf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 24 Jun 2022 07:22:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXs0Dt70S8by9+eq98sH9dhqCeTId5DDsb+0dma1xbN8AdZPA6QY6FPaofVRt4WLm7WHzzd/PlpHnhjMlbDB+yXLc/nw7q80w1+v5D9tJ4Cardl00TWnieyOsTQwG6W020JIuhuMT+h5hk4Qe9cvxfdsoSbUZ1dzYjcMK63Jw37i9wmIIWdADryLYOhhQ7oJOZm50S1wIhOjG8xM7I/X1JTg9xCNC1K1/1smQpAdBDFRZKPe5APaVkQwzMUl98g7Z8lL/TF6gcy/UV6DbLSnFldaeLAo6R1RNBY1L9MN09lLWotID/5ygWxUK3TCN7Bhd6dGyym+o+7+4Qe+9B8mTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpItJ2rAuzNDn2MaMei1uynfjUeza14tRjxeUEJuy90=;
 b=BSwOjBJgYdodqHnM/MuFt+xFBua4s8bhzr/gh5v2O5XFqWlVQtyY3TgOMSIOrw3mawQa4kyY4rTZYvqZ8uAwQoWzqJFiWlZVz+J6nkC62DFGZmBdgAl4B5yX8zBNblQ1MVwoHsN7LZK9wItkqY1dILRWtfNUY7R2FAvNnE0sdwa7ulpMuSRJJnHbUEOb6jRMuNOritaM+N7DiFoZAriS5Z4lKHUzsNPt7Yl0jpcUqD+ulvs+6EBuzd63luRe1zU8kg423GdjxmajHAAPv62/oNHP5jz4DR9navBAQIO9L0V9bQ1QEWd1xRgM26IY7xnAwMaRqEw8feseNAbEfj+r2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpItJ2rAuzNDn2MaMei1uynfjUeza14tRjxeUEJuy90=;
 b=umupLq/AUSusxWTHLuPp2ICTlgFHOFdg+pc0OF8taLiP4PGk5X5FgGV0S5n86xN2wJvGwzVSI1U+xjYhrY8Cr9mxeZr5JSrTLgX+LeHy++63N8sB2aofIc95dzUbH1UDtn9eKK6vM20gHo8E8cfTLNaI441+KS8p2V0/C/OdJHU=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR1001MB2268.namprd10.prod.outlook.com
 (2603:10b6:4:2f::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.20; Fri, 24 Jun
 2022 07:22:31 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5373.015; Fri, 24 Jun 2022
 07:22:31 +0000
Date:   Fri, 24 Jun 2022 10:22:20 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Lewis Hanly <lewis.hanly@microchip.com>,
        Conor Dooley <conor.dooley@microchip.com>
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: musb: mpfs: Fix error codes in probe()
Message-ID: <YrVmLEc/FOEzNdzj@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0196.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::22) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 936f56dd-7415-486b-ee7f-08da55b24d01
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2268:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +bFrYJ/bv2i8aW0S8UH5w5AQ9LVaJcBP/EYufVnWWJn3NJ/eDt/hq8GkP+2YuEPzg0V9vl3nkSlKrRn8ueRkXhqU8O+S6MCl6/sWu5hBOkcayQrDYW2gzhj6UoPGQU+eVVhJcVXyuoijUcYIy+Nfx9ApqnF3jwg7RGzNKvRBrxrPaFAef213ARgnHsHoZb+SpNnG0xNLxOOS/luBGEHytZFWm4P+mruSza94pEz7R/WgUP+oEuhT4oA5mhh1T3/RCZ7KbkGmdSRpuknCMnEkObNn/ueMH6Ch1d+F3wXC8Fis5omReb43Bek8iOqCVmVHwL7RVWOlIJhxGYD4zfw4qsYeS7TqS1jnpdTbU23H4IbKi3UgLMAyPEW2oAIlbdhl95om12tmjDmJdRosSI8iiqZSK2DnMkWP83jX1J7UOdD1P99tvBBHsk1mFgn+lGwXjKf4bHxpUqPVDECZN2CSUZoaTzyoEr6Mijw6Lm/IG3gi/u7w/1oddNQ3FsQ3JtZDW61v7MDMZtEVu8fxl5GSCcORW2puVGxr30JIw+h0qFqXonnPbfDNj86hNebjRIPi1eoL946bffDHUl/4kYtTxP8zIAkL+efEP9dfh+F51v3Dx0cv4lRUxFBVz52ssAw87ohRJpx1yW679ttrFowdoCrFCuGcHyZUeSA01FfPKOUHaGhvdZCGifLkFuCyGBhWqgdEcEu0aec6gxsbCZOHIrEoJOGQO9XsF9RKZu+NKsSwKlNkCMvppXmgf6smeBHEF4NCQrMmD4f0CV1SgL9irPSYRRSozZ0TA2vnlV8GV7Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(346002)(136003)(39860400002)(376002)(396003)(366004)(8936002)(186003)(8676002)(6506007)(54906003)(9686003)(6512007)(4744005)(316002)(478600001)(6486002)(2906002)(6666004)(52116002)(41300700001)(5660300002)(26005)(110136005)(66476007)(33716001)(86362001)(66556008)(44832011)(66946007)(4326008)(38350700002)(83380400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qb5xtkl2lyuSN74rGjA2bWaEQBKRZGSWsQdizqmcgIkyelRY7oVnwIy6+CQd?=
 =?us-ascii?Q?zf7bdJD+XY46IeOTjTNa7YYdOGVhYE8N7G6hkulTZJVhstfBI+GmEKu5v216?=
 =?us-ascii?Q?mTAlIH75YB9F2Bac/dLhsF4XyqCU37OCB1LUz14drgwybXZM0n7FKq3CDqLf?=
 =?us-ascii?Q?fj5w6ugz4RTf6bTdHAhygNj//Q8LM8njUYWe6PBoLHKjj1Yr+CpZCZbZpGlH?=
 =?us-ascii?Q?qOz880LXe7WQVSkBEO7x38UCb0bl43YENzUG2zZk1JglStOW5GzexxfvhYIY?=
 =?us-ascii?Q?PSuUoDr2ek/l5KzgpDnqYSXI2YgM6AjdQj/4Yd+O9vacYfZYvvoJ4gL0hNtq?=
 =?us-ascii?Q?6/wEQqUyKqyyTtgMfCYLroz4HVk0B4oJlnqOQvi9/A9NpIY7DAUyC5ZRIS5o?=
 =?us-ascii?Q?m1OKfaKgO8D03Wd9NUi6SWuRsdQUpjqQob16nhOj7kiG0BdYDZ+iU49o0VFd?=
 =?us-ascii?Q?5In2It27fNNnP2CyroZPKqztuYDa2uZIvaehzjEvPuL/HmjQBtJl4o8R8DFN?=
 =?us-ascii?Q?8dVRP8lOkRAcyCbes66T6CQgXbvmgANdyiLSnMt7YXoO8LdoizezkI/QT2Ze?=
 =?us-ascii?Q?WQG/Yh1vALTxwxq3FF58I2oFsR9KZEbmcYeovoAtBxJz+d5JPLcvEGUh43rR?=
 =?us-ascii?Q?poQgWfKp7LK4BBb32cqKEaDVLuxvgM1iYyKlPwWUbTZ1apFmzUA+vYuwQeUq?=
 =?us-ascii?Q?SkK43SheRQapD842M7Lr7+gLITU+G0wzrHAONouHGHpn3j90qq0ba/y0NynW?=
 =?us-ascii?Q?0MnzNCfktBAFvDBSvSzvkG0Bo5jr/dD730Nf/WqTpkjjKRkoOpGIRb+xnDMJ?=
 =?us-ascii?Q?cRhUE74G3X1YuvDoEBUCXV5HnBkV8xS5ykAuSs4bBo63mvaRmpoFFiif5Iqf?=
 =?us-ascii?Q?vSXErr4YfqS0cnJGBLJDhkyNtyg3oAetSJ2Wd6IQ7TBFSXRuH5f9+ZkEBc1a?=
 =?us-ascii?Q?w2tmnRd3BPDUnLxk54IaElinecuC1U50k87wt+O1P3l8wwm369N/CoJBVzsA?=
 =?us-ascii?Q?vsnSaKTSRJkfQluHaemyli8YcLkUG5mctdtU5EhDP3gNo7GfZlyfvV+5i+Pd?=
 =?us-ascii?Q?6b84Wp+BN5Dus94ILBsFefAXsl44LCSQxeEc/7c1uKYdG5xDkgQRvL69KQg/?=
 =?us-ascii?Q?szcQa43f8rTZh+ZkAXhxG8sgiRKUjqv98BpvyM76zWHhVZiYES3bNX0aqlQy?=
 =?us-ascii?Q?Oiy6HOSchy5YnloqRHE19nYLsySl1sxTcu+IrF1+mSFFkFTKIJI2qNXkk/X0?=
 =?us-ascii?Q?itXhEbNG+h4XFzIHCofh35/GQy+vrJFJT54eTduvpPESlishS/Gu67CtpgqI?=
 =?us-ascii?Q?qUl5gOUa1P3Qnwj3vR4PxEd6RO584R5pjmr7JFJwclgUA1asWzLK1Tahd7V9?=
 =?us-ascii?Q?b4MahWO8+nxdqRGrqZPefluGujgFyz8Kak07ZDhXxnNMKXmhW0febJPJw2Hf?=
 =?us-ascii?Q?5zqsHF+VpXCLb0r8Jjk7TyIc2QM8J3DOlnht31gQehIi5TPa790k+8pIN5Pa?=
 =?us-ascii?Q?zFFCV+KxWDkU5Q4MNg5EOZdD3zWYO5jKg1YIDGuo6igWr5VD5ZI7xn+mSnNp?=
 =?us-ascii?Q?/27f9Is/E5g1ubd9vpQUFHRsnVNzelKL0GGxmrbFv33he7wFrX2IFM48XeNy?=
 =?us-ascii?Q?xw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 936f56dd-7415-486b-ee7f-08da55b24d01
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 07:22:31.2420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6XMMXoYWDlbFaAzjkJVc6qGiskyQaMTvaF2Q0d8dhwM1tCf5wXBQGHNDw4Y2de1JlFzK9zB0LETfoWmpR5auEmOTxWQ9YeXeuajbVT1CUts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2268
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-24_04:2022-06-23,2022-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206240027
X-Proofpoint-GUID: UZIAinX7exGUXxbBFkyfZrdIiJUQzgyK
X-Proofpoint-ORIG-GUID: UZIAinX7exGUXxbBFkyfZrdIiJUQzgyK
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

These error paths return success but they need to return a negative
error code.

Fixes: 7a96b6ea90a4 ("usb: musb: Add support for PolarFire SoC's musb controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/musb/mpfs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
index 99666ef8af06..a69ca338eace 100644
--- a/drivers/usb/musb/mpfs.c
+++ b/drivers/usb/musb/mpfs.c
@@ -181,8 +181,10 @@ static int mpfs_probe(struct platform_device *pdev)
 	glue->clk = clk;
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
+	if (!pdata) {
+		ret = -ENOMEM;
 		goto err_clk_disable;
+	}
 
 	pdata->config = &mpfs_musb_hdrc_config;
 	pdata->platform_ops = &mpfs_ops;
@@ -197,6 +199,7 @@ static int mpfs_probe(struct platform_device *pdev)
 	if (IS_ERR(glue->phy)) {
 		dev_err(dev, "failed to register usb-phy %ld\n",
 			PTR_ERR(glue->phy));
+		ret = PTR_ERR(glue->phy);
 		goto err_clk_disable;
 	}
 
-- 
2.35.1

