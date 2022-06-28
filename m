Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E48855D813
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 15:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244476AbiF1IYA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jun 2022 04:24:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244454AbiF1IXE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Jun 2022 04:23:04 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BAA12DD41;
        Tue, 28 Jun 2022 01:22:17 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25S7hXZU026421;
        Tue, 28 Jun 2022 08:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=AIPvyXnDx6y+QHdwpKj6nP6GFzqBxNSuMhEX2nt0z0o=;
 b=H3AcP6JqS3g4zSW2knv/IfBIG/+m1IwWot+bOJLzQQXTg3Y0wI0OnS7nV8sMT2BBS8Pu
 j8eOVU/Jy3rtWn0qvttOvL2loIsBkS1dqM5Bgcdgwnj21r8XuZ7I9ycTAbSYPXU4A/aL
 OGCDLNycH5SScYI6DlIJwFRF5/pJPgisbpyB9sBfXyWyFMtRzLbNOgEoe3sUYND34KI6
 /CFsO5f9+ge97JiVXh3eo/gPq47C4ZOj8eLdsK34knqYrTLxvI0c5/N8vBguklz+tGB4
 6QdhvpG20cvYjZdaEXiYYyOKra0nvdKImHbwyee6AE9b4bccT3FI+h1dd2elj7g9yGf1 8g== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gwsysd9tw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 28 Jun 2022 08:21:57 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25S8Aq02022720;
        Tue, 28 Jun 2022 08:21:57 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gwrt80uj3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 28 Jun 2022 08:21:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/Zg3Hvk6/jpmha2raCmnTFMUjsN2fiDNBcqE7zNEV+cjEDGDTr/5O9+vSQxFX1zCqAPYE6GtIdU0bFgH5aqUWCSTL1y2C3kdb9XUWUh1w6JhktS6AgPdze2vk8iwovHmIuioeFyulijuVMLpxcobZQvA4MC1BJ0PWCswFb5sIRgdekwCRnPwqhXHT411+M+UusdGBqItGBlcXJQQIhSR42M2FkR9MgHSQ1iPd++kDrumUS48RU6OX+oxy6tlSQNpC+NKCwIZq6Ba+EH2xy2nvKg2lig/sMc3tHaXBaXSsNCc2/OIfDFzplnaFPtLM+Rd+2de/vQ5k/7ZTbfegz3Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIPvyXnDx6y+QHdwpKj6nP6GFzqBxNSuMhEX2nt0z0o=;
 b=BL/bapYbqQng2gyEA7gRDex27kYOmIdz1JVk8cVby5+pRXIZAG8zLbh7d4mALgGh9Xq+m1+quI+yjrc0hLvxSS0Q4SUadNFNPXT18RCqb7ZZFe5pShvA4o5MnBGghp3l5GM8isgMsY9jpKxMnMsim9T+SeuoXFHfkgDQmPOxFYko4M/zjQS8FWjPxOY2bs6lEKNAaSyj8n/721Fqtuz/X/f7mPNn7XskbspmJkpO78cnXLZFEnu5+OyiTQK9QzF3kXf22OxaX4+gCSX96DeOZgRgduG8Qhv4Gd03ZcgLGOEeJ/ipY16zmTQE5ogSU5MbxLRlpC4+3e8tKKQydr3+yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIPvyXnDx6y+QHdwpKj6nP6GFzqBxNSuMhEX2nt0z0o=;
 b=CSuJbV4g5pFB7802VUwVwbtVcTv9M1H4ReqndDh56j2ylKkihZe2qP7PkS31Wedjpcy+RYBje/BnlxFuUH7+Nn3Y+uPx01YDECMtiCcUGCjFQUw+1xtccuFdBJ5W8X56m0dIXNpmXaGoXLy9loPMizO7EeUz7LIp6keB+VifZtk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DS7PR10MB5389.namprd10.prod.outlook.com
 (2603:10b6:5:3a7::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Tue, 28 Jun
 2022 08:21:55 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5373.015; Tue, 28 Jun 2022
 08:21:54 +0000
Date:   Tue, 28 Jun 2022 11:21:43 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Neal Liu <neal_liu@aspeedtech.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH v3] usb: gadget: aspeed_udc: fix handling of tx_len == 0
Message-ID: <Yrq6F5okoX1y05rT@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: LO2P123CA0105.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d84e551f-7940-4d2e-b5b7-08da58df42bf
X-MS-TrafficTypeDiagnostic: DS7PR10MB5389:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RAVDEzM7DUytQQ2FhLnB4OPGXbefBRv2ECA7lvdLKTsyHbpctoVXXKfn6OGB08ME2wK88Ia+7RJtKSfOb3O3WJiCec36vudKkB3r6GtJBJhXVI1wLfG4NTfErS7PaJ6BpSTP3TF9NlhKkVuHP/8IcktzQOZThrNzBFsgvSW4XhDRRun4J8F0LfWZ+orzISOIY5T2q9npQrKL6XwzOp6/YFwNkBG1YgxvuA7tkkckelDA58/U8IKQmuTSAIkKjuWNEpAlDLg/55FG36Sj85OGlLQRmkrCnesB4m4OageGLK5BKHd4X5NWgVFDFw9dJJvhRLp+YSptbGki+F5JXNwnwuR125QfBfPZ7RH2WwkBnYhXwL6A8Yiy9QnuOjtk/gzJCwWngWVT9o3XCHCses8rq4rsLE8Md3qqQVEar2qNLlrI9h+Dw5QDdVuZS+khDYp4RU8xr18RGOdTakp2UFnjmnQ8W9rKhehogQUlM3MYosJ01O4Gs+7y0MiDMhXRkwWVQzLRejBxrxg5a2rr6JsGYhOYL6xiC1EYQQotGcwVZM73PXNODa4gIOJjsmQqMBgM7DdOuBRtYuwkybvBVyZxD4R2rByuX9Xqa1ppXSikRW+/6THpno0KetmswI9zr096M4/ByL/JR+1M28Ro6/e0B9MeO9OriMvV4aujOYwivB8L6XQv8cDl8jhGoYVwQtuNhitIM9yUizNi3LI6wQJvDaQTRGeF9FYRpA2hAcOJWps3Fz4g0pI7WgFFvGreSLO4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(136003)(366004)(376002)(346002)(39860400002)(396003)(38100700002)(316002)(33716001)(4326008)(8936002)(6916009)(66946007)(54906003)(41300700001)(66556008)(83380400001)(6512007)(9686003)(2906002)(478600001)(5660300002)(6666004)(86362001)(44832011)(8676002)(52116002)(66476007)(6486002)(6506007)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nj0sWZaVdQ2cZw4v7RIdYJD2sWY+iPzm8LXAOav3oO3s7J1mNtZEoqqt6zM+?=
 =?us-ascii?Q?ZslK9GHECIgWHfVHTIQH6GhUfSYj/LhMmcf+yc1568yreD3HzEFfQuGLD7NM?=
 =?us-ascii?Q?q83i/Nuo9PEN8C+eu0mWw3AEFtsoSOAuU8G9Eu7NByQ75DlHpTt7kHNnEy7U?=
 =?us-ascii?Q?HrAq3EBe1amZ6Xi4sN26XXHsS/qVf/vTO6PzXsTB96GW4Z/nZNhqG8zIsxZP?=
 =?us-ascii?Q?NXdE8UCdTzWQm0fOQjzjirh1E1Z5vv3pyu97OjWsMivBfn98/M9A40FHeaf2?=
 =?us-ascii?Q?1Wp5ZGXzmkcjs8rGnGFP4M0d52OV16MmnSHa+eEcWyVrEIQpNIU3607FD5RH?=
 =?us-ascii?Q?z3wHiN4ltf668rFF2VSUO0UXLtowKo/khRdIDo4mDdr1lTW5QxQuu+jGmctN?=
 =?us-ascii?Q?dNNu+hCIhC9tZImQvWrGs2n6/6xrBsfbGX3ldDlqpryDw75zbDlR6A+gIgKc?=
 =?us-ascii?Q?Y3EMjUdHiGDOFq/8iB513PZ0DxZC4MyzvUZLkTUyJDRHm5yRBKGVFvSG8WVo?=
 =?us-ascii?Q?gWCZUU9aqApqI7fP4cob3CNrZrRd7dF0NTN4K7oDcdPyMl0ioiZAfKkY3vhK?=
 =?us-ascii?Q?URFQlx6Yf79mm/l5N07xhRRvrPdSZkf4p0Gf8afasEWwiKIIR9d0sL4+Odo1?=
 =?us-ascii?Q?rPAmyPpGFjI64nL2xOe3bQPcOFB9q11CztX11lIEV2V2o/RSnCV0dSk9I/fY?=
 =?us-ascii?Q?hCh36D7v912SmvdxzJPlZt3bbRP93z1t20Zeb7diLUp01DmUusAeG9tJ0rbA?=
 =?us-ascii?Q?n3XXgIEmZYf/ksKIRcxhpC4L8fxesNm+xpajWxZPShmT3s18qop3B8ffhkGZ?=
 =?us-ascii?Q?qq278VcX9kgNXi+LNNHcI79Pz77ryvMASnYg0PbplSdqLqo7N8s36kL46ql2?=
 =?us-ascii?Q?K+uGFBWnvh7OJ36TmzL1FeiM9WsbzqtJl14FgYvl5YKAEhv4vLskMmtGVsIe?=
 =?us-ascii?Q?FV/5Do9uo9kjABp32iaYTEcm552xBnu2e0oaGnckJuNHVclvFp1AeqWeLaNp?=
 =?us-ascii?Q?IpqmsZZ58iSN4OIViujr2d7HhUB3VzsjCeRQHtmIJho0R13GSQl44tNiEJkr?=
 =?us-ascii?Q?4HzNbLsFm5uufnr4WLLGPgkjgY4xKjMil3z4Z2kGZkrqQTG5PVSZaYHCKaCk?=
 =?us-ascii?Q?B9wowNTG3srYkWe9sLI7KtrP+xmfUI8TnBj1a+aBmTdtqLwJbl3LBPyhgY3T?=
 =?us-ascii?Q?e6GF90HXq2KhX5Oubdp9LCjvYepINzxsFwMCl2U0V17Ni89/9L45mMCxYhoN?=
 =?us-ascii?Q?mUgKhSOuuM6Po9DYTLRIXxH7AAZ2NkFXFa1kyciUv3cOc5QxvpH4x64sSTXz?=
 =?us-ascii?Q?1RRS6NA2LYtS1TRMD9aD3RotDBSvZKlriDHWq7rDBW/YLn92SwVd3xLMdL4J?=
 =?us-ascii?Q?rDDqMqMAgRsOo/lA1PM+dWkstHTLcTQdaJQL4Rz8vHIm8mVA7dc476/+5/hd?=
 =?us-ascii?Q?/afZwrm8sNoSUvr6eSMXhdtX7q8nH/ZAneT3q91bWYsBkz6ktq5CWhuC0TrP?=
 =?us-ascii?Q?Yt6ECpe/hP0vTcXTrpQ+8bgaDdWvoEP+QLHOX08ev97wpN7d1e3RQkvinOYi?=
 =?us-ascii?Q?Fhmv8oh3KiO+22HxASEuepHa5FrOgY5H1aHDgYJPzQgf0betpdTfGRC6QdBE?=
 =?us-ascii?Q?jBqADn9tgaWtO/DqqNDi+xc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d84e551f-7940-4d2e-b5b7-08da58df42bf
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 08:21:54.8720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p43Nvg0b26fDgyZO0Pnlb8bcYbWj9mcMNQErqASTQPN+Q2cI+UOnSv8e5VFoGVpJbWFuLp54em5SZwzgHfVMv2IF9x0pnG0RQuIOf/KUbaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5389
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-27_09:2022-06-24,2022-06-27 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206280034
X-Proofpoint-ORIG-GUID: PepODv5TGByMo-qpyoS9XMcOn4wqEGfx
X-Proofpoint-GUID: PepODv5TGByMo-qpyoS9XMcOn4wqEGfx
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The bug is that we should still enter this loop if "tx_len" is zero.

After adding the "last" variable, then the "chunk >= 0" condition is no
longer required but I left it for readability.

Reported-by: Neal Liu <neal_liu@aspeedtech.com>
Fixes: c09b1f372e74 ("usb: gadget: aspeed_udc: cleanup loop in ast_dma_descriptor_setup()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Neal Liu <neal_liu@aspeedtech.com>
---
v3:  We went back and forth on the style on this.  This is just v1 but
with Neal's Reviewed-by.

 drivers/usb/gadget/udc/aspeed_udc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index d75a4e070bf7..01968e2167f9 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -476,6 +476,7 @@ static int ast_dma_descriptor_setup(struct ast_udc_ep *ep, u32 dma_buf,
 {
 	struct ast_udc_dev *udc = ep->udc;
 	struct device *dev = &udc->pdev->dev;
+	bool last = false;
 	int chunk, count;
 	u32 offset;
 
@@ -493,14 +494,16 @@ static int ast_dma_descriptor_setup(struct ast_udc_ep *ep, u32 dma_buf,
 	       "tx_len", tx_len);
 
 	/* Create Descriptor Lists */
-	while (chunk > 0 && count < AST_UDC_DESCS_COUNT) {
+	while (chunk >= 0 && !last && count < AST_UDC_DESCS_COUNT) {
 
 		ep->descs[ep->descs_wptr].des_0 = dma_buf + offset;
 
-		if (chunk > ep->chunk_max)
+		if (chunk > ep->chunk_max) {
 			ep->descs[ep->descs_wptr].des_1 = ep->chunk_max;
-		else
+		} else {
 			ep->descs[ep->descs_wptr].des_1 = chunk;
+			last = true;
+		}
 
 		chunk -= ep->chunk_max;
 
-- 
2.35.1

