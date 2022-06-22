Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96139554DEB
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jun 2022 16:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234139AbiFVOvt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jun 2022 10:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355951AbiFVOvf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jun 2022 10:51:35 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A05E3EA8C;
        Wed, 22 Jun 2022 07:51:34 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25MCY758017780;
        Wed, 22 Jun 2022 14:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=W300qo1yKQyXxi89CQsYAcBpDMKDYwRXjkV2y+RBW8k=;
 b=YQONIzJOJs+WP09qdM0bzYaSyVtFL6XKZzEG45VyaP1pKqnpLOyBjsZyPf0CXNgtalIs
 C7Ipfq6qVASWPakOTq69HuP7prW5l9zOl0mMbpIu8++MMcRtxekos4NttggFVNlCVb7I
 AywMYilu3Q7o8Z3Zq3eGVQ9bsa7n3xvtxfcNneV+X65MoI7JW3lcL6We9iJng8A66+47
 GTSoDZNJIiPV09v+lGOtPWVfHyc2ytIIbrGAbX4AwVsSj5xYBVZ7POYl4MbbIejgW0+j
 VuKJo03PD2I5AbUs04/OQV0GGTb61zvX85NpQQmWWYkSaNvufr8RAT+vOz1wsW1SXei9 Cw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs5a0gqub-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 Jun 2022 14:51:15 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25MEUFqG011093;
        Wed, 22 Jun 2022 14:51:13 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gtkfvq45c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 Jun 2022 14:51:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JqCVhb93pfKyGGkGTiQnJ7Lo7YB74iQHoQLgMZSxmsyJNiG5EhXkk9Y2VjXuqJ1FxI5MHn/eJM9W9WZow0K0woHRl1WHxAm8qGV0KwTM69i4uP6mCJZOF8izOCAkdUxLcie6gbO7AmbH8z70Glcmwm1en48O8xJ3L3lGb9XyZ70ditAjqFXMibyCthJ9WzGdlProDaMysjZcsckMyDV1zPEHnRura5N/PR6G8q07Aswg1gU5hADJeg8NGLudBHvptsu3SRAeT4rYdfDQqTnnoQK+/oFAgwdsMrh2EJRqHBUNIXRBdIrd0/0t8eTZB/aZDC63ULvzwmecRCNFVQNG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W300qo1yKQyXxi89CQsYAcBpDMKDYwRXjkV2y+RBW8k=;
 b=dCReuPF9hzfKE4vMUpO/P/GXRx+GYusiphKSiB6SxTQ4pNXEUZwjqycMPit4FryNGTndkLnGlJ8hGOcodH3iEdChUHYPDLTsmE43v9M9p7q+9hfQqsF/yhcTHzq5YkMu6uBkYHfA4O2HIQMTeFIv52Bl1jVItF7Q5534jEItGEI36tWyFDj+Pfp5yH6sbsZhBDyUvrN52yfc55ylnuM1wWRKgzZFcwURamIiI3iGfj7+I/7lKNVBxXn0bgDRzj/yLczMYeqCaVsqF2AbRplYVxr8WfqJif2M+cetroGE4rzvYoxQE2nkui/8WB5j5rbNBbfy3sOwSqvD2r6jrQgMBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W300qo1yKQyXxi89CQsYAcBpDMKDYwRXjkV2y+RBW8k=;
 b=Fyd0AqEII3jPdAOVI8UbvBogkB6RktvTkFVQ1wv1Rki3xN4Ta8Q9n4RVbvnbLNu1vnQLwbi69YsxkCOMQ+LhYTpNPR3Ic09yEqIlklIddHPTywjyNgmSD0jy3htxD9VzlIrQaCmM7l1diLiIJEUgrqFWPq8rX9HalV9dqDRM6Yc=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BLAPR10MB5140.namprd10.prod.outlook.com
 (2603:10b6:208:320::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Wed, 22 Jun
 2022 14:51:12 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5373.015; Wed, 22 Jun 2022
 14:51:11 +0000
Date:   Wed, 22 Jun 2022 17:50:59 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Neal Liu <neal_liu@aspeedtech.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: gadget: aspeed_udc: fix handling of tx_len == 0
Message-ID: <YrMsU9HvdBm5YrRH@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0095.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::10) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80a4735c-ce19-4be7-5ab7-08da545ea59e
X-MS-TrafficTypeDiagnostic: BLAPR10MB5140:EE_
X-Microsoft-Antispam-PRVS: <BLAPR10MB5140B6F5557D26EF625454208EB29@BLAPR10MB5140.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YbhWATs2SaWFO6bs8qMZSisRyLmF1VF5rW+MVzTBmP+TE/szP516YFJrKDh4hXHxhF1f0HQlAKg78h4eAE6BIOfnhT9qh/KGYaBkWAgJnsi2vI/Tf1fV8LZEEoL9ivQT9c95UUMOm4eC8msVYGzXnmQ8hT67ALQGsxVjUip0EmhcipsWdV5ygALkIwpE3qbNFiQyF36TKWWH/WzrNfVWLIQCgg+6l4qVIepE7iOERTtnj3mL4XWy62y3dLGxJhcQHGjDNYwb+TWZlpMOVaTJ6UBo51cklw2SPcq1J3tVrbwhMuTdEWJItIeFww07qW5uGcKwhWRs/eEwNnNlwg5it1XUSjywofvdHb4u5UjfgCDjOJZn9NTRSRjaYCPqO2n8FOa42FjxfNUXaxh82KNzsaw9dDdTkOne9W4fcM7zKkI5ddAcDRld51s+md7czdZhbNlrWkmdBPI06IQbqC+WAZyuoJJU12jwB3r4X1JrEf3uQxL5A8WHR4S4+F4Y84L+qsjPah1n0uQn4MkooE3aZ9s0H41QvTNc4sp2aEY0w6nmnlHts5o2YnX1xcXxv2vzArZWGu7Qbv9q3/1ExsFunF/FsDyvt6WVOWDXOaho1zenr6X9XDXt4suaVWVrLFJ/ZtPSKzPzbEsWzrCOmj+pdWBhVVysalAWprwHXmGpA80a/j9fLmP1pXpwUAwwO69Eh+YbDXJQP1ubDr1pq6xbyjPAb7dUBLTHic8sYXTt8qhr8H3JmJXXU2NjCqob35kop/pIZtXwmdZSXIwiEVsiQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(346002)(396003)(39860400002)(136003)(376002)(366004)(186003)(38350700002)(66946007)(33716001)(86362001)(38100700002)(66476007)(4326008)(66556008)(8676002)(316002)(6916009)(54906003)(52116002)(6486002)(9686003)(8936002)(5660300002)(41300700001)(6666004)(478600001)(44832011)(6506007)(26005)(6512007)(83380400001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UxgUPYol8+bNqRpAdmK6QAlvdfecLJ2UJZnnzqKe2I0nuk/ckusIjpt6a24n?=
 =?us-ascii?Q?jnKnIUbtJud4IZqUTuIwiBs+cXnZ8x9zMlriZLkMdhMQQwwU3cpGrStdrzWx?=
 =?us-ascii?Q?JovzYTVQKgAugvhSREfV/yZAjMPsLi8myGMbIBkLkHbEZcA4GBluWnstD4It?=
 =?us-ascii?Q?mJ5CVvS1+5aA1i4CljJiZZwRcggshn0TmoYW1YQQfnnGgK0DkHF9aiptnSs0?=
 =?us-ascii?Q?aShO9ql4B5mZFKkS06eLtBx+KzOLRv6pOkDAhZZXQQXmNNvE0XsAxVhGJzgl?=
 =?us-ascii?Q?WxyZWcLeFL3WAYCKKuPpS4HUHKV0S8iJg6tg5AVCE489/sAByDzCIjiOENJ2?=
 =?us-ascii?Q?We8rAvmtrFsO2Jw4ZKd007NIjEg5l4URglIEcDDZTCCc7aAlEw8Og6/h6+gF?=
 =?us-ascii?Q?+yPl+o1vyM4BaxNVA9PCPmbVmtXhcXdfBtb2dZP4+4Jll1Th/K8LVBPjW+X7?=
 =?us-ascii?Q?Ugry/WjxZ4vBOhbn2KJRzd+h+bZArDSVmnx10civ+U1XnFqmyGZpuuZPXhV+?=
 =?us-ascii?Q?NEoK2cPSeTiyIhpFFqFv9z5ulzYAw05OqWG4FAwdG1O3hIPyyFyRCx+BEXjy?=
 =?us-ascii?Q?ytJWr3tWuMmYTdnAttMQ6+XCTSfuDW38gYg7SuSDrPNwekS87UP4ANTAB2Kp?=
 =?us-ascii?Q?RbnH8r5fqY4d1n2WKYLvTMQIPgmR4syjPRyzdOmitmVmdl8yR97p4MHFpwn8?=
 =?us-ascii?Q?71I5s6jh8Ra95L6sNd7w4G2khdUVlq8DaOGLb8Rlv0qYZJdtR+ATkW7pj9xY?=
 =?us-ascii?Q?clp69aFF6PFhxON623XqSIGJ569SlLOA2dGdY24J61Sr6/crytIlaiqAFeYs?=
 =?us-ascii?Q?jlIuxOZU0eiWn1gkuTBdkbBJy5J5Mo3lRx1w/GOnSaWJJVFwWun3KHxbQuED?=
 =?us-ascii?Q?g43Q4ymR/N9gAQiPwsF799oYjSwOAgf/oKPfEAbEdXBp/er5vqCiX30bQRar?=
 =?us-ascii?Q?9zEDylVboIClRRZh9gjglQ9MBhiD3WjO3NXL66a5C7W0b+BFl87SP3eO1r4t?=
 =?us-ascii?Q?AQFvD5lMm0cO0C/GHsTNHOnG62pPHfQmsyNgZfktEp4B6Fh6gM4/3vTVRNlr?=
 =?us-ascii?Q?FM7AdVoUG23AC2aTD6s7oFT0Hm6+yCRykIBupgjB33AB4++29rkKpQ+c6SLy?=
 =?us-ascii?Q?CWwoLpQ4hE1qShsszRL1mb+d85L7iVzHEu/IimXvCF+27dEvcHInnIZQ4DYt?=
 =?us-ascii?Q?mPiSMEbaXk7IZx7pKnwovL/3ApwCTv/X/WwOu2joRQbW8LIxEraJ5l/FXtNI?=
 =?us-ascii?Q?sM/2bkGp7Ut7OXok80Y67zVm1dBlOPSg/MQ9Ekf6+MyUZ95dAzMJRyt9+AbA?=
 =?us-ascii?Q?kN4WRx8QwjGoYPDG0ltX0zJ7qta/HOJFlYcwg9W5upxn6x8lQQRw6vO6BuVr?=
 =?us-ascii?Q?fhlg0vVG4Duejzau1OaqsmvDRUnngaiBZg7s6MtPKg0bpQgAvwesdajh2C5z?=
 =?us-ascii?Q?KoWSXk6CfZZwznR7ZHaEshc1SI+Lq9apcD/8lKa0FufuDSG4mhQ44cikPPz3?=
 =?us-ascii?Q?sYQis15KjYqOXX3KMhJNJvTvLJrEj7K2X+jSMQ4YWaB2L96rZf3Td9Rq/S2R?=
 =?us-ascii?Q?TCeZHMl6bjBXmjkpb7NcgUrdO2f9UYc7H1J5AqYl7g/3OsktTetFaXDrwctB?=
 =?us-ascii?Q?T+7ROqsB5CRV3YVLIbLIyUpTe0uYzVx2g9bWh8RZ724MYTHtBMMcIm7jma2k?=
 =?us-ascii?Q?pnhETpVm3AYRNEq/PiC9QT8G2P9OfIfex7AZQIpGr+NZmyab0hWmHuJPaU39?=
 =?us-ascii?Q?IwMRcnY+loQSh3JAkKUd4S9T3VFI7HA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a4735c-ce19-4be7-5ab7-08da545ea59e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 14:51:11.0655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zY4F/vQA46GI2crAo0OflWEFm9GMYlqtesdtPQZO5I7kBE8fSF7bkYD5zxRfH8+Tqot7EXP6YGv5SkEJXlsySqwciH/KJj7FQ3vQKPsrw8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5140
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-22_04:2022-06-22,2022-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=939 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206220074
X-Proofpoint-ORIG-GUID: gAck4vBtr4e3o1eYAHiOO4TPyM9WblTv
X-Proofpoint-GUID: gAck4vBtr4e3o1eYAHiOO4TPyM9WblTv
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
---
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

