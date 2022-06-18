Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 018A7550391
	for <lists+linux-usb@lfdr.de>; Sat, 18 Jun 2022 10:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231389AbiFRIzY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Jun 2022 04:55:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiFRIzU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Jun 2022 04:55:20 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D58632637;
        Sat, 18 Jun 2022 01:55:19 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25I3C7WH031991;
        Sat, 18 Jun 2022 08:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=GD+tWWqnU1zVXp0FMOj2A2txmstuPwclj8VA3CLsrJw=;
 b=0ylNDQRT+e6YAtYJ/vUC1p1GjLtdQA46adGTnMnr2o13r08PWCSdOSLxCKw1fT0DqlSx
 gC7vw/HWQoBpz9YT1xed7mOunqsZfumgCj3Ddagg05jssZ9OcrWEDEqfzlQlrOC2wQlB
 DpI5aLSI+RuZffHjuggF6CAhTRs+PiblivrcsRzEy7Ml592CGhe+Wp8BnJ+XhDJ9jCCU
 pTQF6iNNV5DYweP5rH2V0JjYHpIKuu3zcvjoMakQT++xLKFFSUWnIhLWENl/9sZi0mcs
 0wbs5u2NhS44B7FkomnxQ/WIijMd0MKLxUeFUV1KPx81zcX4DjKuUfVuPw9GNU1S92gA CA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs6kf08nv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 18 Jun 2022 08:55:07 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25I8qES0033707;
        Sat, 18 Jun 2022 08:55:06 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2174.outbound.protection.outlook.com [104.47.73.174])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gs550jgn5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 18 Jun 2022 08:55:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+wxcn+NwAr2KBZcIpgIRlpYH9GN8KYuG9PyVaEprNRtvzCeKsOrgW+Ab5ehs0XXZlPzIyoi8+561la15cmCHhhlb4Ntf/VHmG39KMX81MZ2FuuWD0D2AxaKKfIKMezA+B6B+3rqgxnZJbCPGMvh9kFdM4+utxw/yGnVKQTCnsOQe+eXfWpYFwp6pgjvj+pXzh+9ECPvxsWEI8CSCZZSrFY7A5fgo0uwjXX/3pkz1t+jbc4X1mIFrYD33aHSW/yXy0CHLajjq0bPeNMD+zIOrdeIKW3ALBmpsfTuzE6T2uB7xHL5JRlnoyhBAzAtNYDWgQu7waC3AIMysinCzdbdGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GD+tWWqnU1zVXp0FMOj2A2txmstuPwclj8VA3CLsrJw=;
 b=AVfmXfw27tzv3tgLpKI/CuGDrEqpKVsn6vYmxDXdJzj7GVcAv3+fuRXuqBkgv2jNFfP1y4VYs/7brub89sZH212d2kdKoQ+rI3/XdBKAVa5iQZ69gjpRB2NPFdE+NOJeXUaXlnK2lRg71NEb60XPsWFhILTiuUh1YZPuCtl3aU0gRLca8pVOfNJC3njWFWoSJpgTC9dCpWr8f54ByaYSLadQz1q9hu06EMTzYp1T1EnLLM4r4ljzNKjxxCE+UeUzrxO1PYzCvDh1ZMo/wRvFPTBn4mDp4ES50gKEeS1t0n9hN8zQAWuK5gpaSTUDAt1bJXTvzid5kt2ZxuJCfKTNVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GD+tWWqnU1zVXp0FMOj2A2txmstuPwclj8VA3CLsrJw=;
 b=HWdipSxkwa/J/rhcZpMRdUYx+slbAZ7P450iBl7FE9VuGdacYC+xFc5PNriJNyLVQeJQdVl4orUVO68p9lZiWXM/sXD6OPYH0297D/Jz8JPqYXjxJ0kQ3kBT+x8UMQ1iqclWxxDA0sysxuTxWE/kN9HIPtbMoVbepr+1EaESCKQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BYAPR10MB3589.namprd10.prod.outlook.com
 (2603:10b6:a03:129::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.17; Sat, 18 Jun
 2022 08:55:05 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5332.024; Sat, 18 Jun 2022
 08:55:05 +0000
Date:   Sat, 18 Jun 2022 11:54:53 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Neal Liu <neal_liu@aspeedtech.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 2/2] usb: gadget: aspeed_udc: unlock on error in
 ast_udc_ep_queue()
Message-ID: <Yq2S3aF0MPChLD/e@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yq2SvM2bbrtSd1H9@kili>
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0151.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f745b19-0b25-4b58-8f8d-08da51083cd9
X-MS-TrafficTypeDiagnostic: BYAPR10MB3589:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB3589D4E08D56D488A06F43408EAE9@BYAPR10MB3589.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XnzKoGzUWi1BDzAuaLywSZL+sj2+O19HShOxfMuBtm4UYSVmsUJVsd1u0bJXW96DTRAjwXZpZTVEUlHyyBbYk2kS+PRXnmEsgJWuHhrSkBoMMH8b8EC1Y3pRzj/bKHtaHU3ha/uT454uNpd3o2cvLX6vo2FdPK1QAeonhl9JJCPj0BA/pGRDfgiOM5C7fmMQ5FBDFIf+FhzyaB00qPhhLhommVjiDDq1Rjqhvkbkz+Xfh7BgmCrNwcR3Y7wamHtqyOvmGpd9bS0fwBMgmLHEYa/cbaxUgDN42jVkC9Gdl00m7LJqw2+ftEv7mccfok4PkpHHTYvRz/12Ka0jqOQjMmj+j//zIX6zQyptn54yuQ2cqsgQ7lux5B8urS2iCCxA0iEiQ37B6MxlXrJ8yTKvndAUsUtWfEBmgtmZz+qLenU94TtsEPFYGB5udxBFVBPvcXf90wWZX4/w1C8V9Mr9b93Bg25M3CWdTlqVpucCYd/lFe5EGNGhIotooNaQEtXqqbcx3flpv2Pg8bfc138dkZ3ZVKKvCN7p2qf6IhuEpanQa+rJLJpLAWkZFctmCyqx9U+arEAtqxy7wgXUHO1jmeqAclXMZ+vOXa1lMNMAUuUG2pXTI8cfAqj/36QF1Gs0zFgEdEADhVITMYnnycRyDaLmeXgQtEQTRQMaaDY19JGG4O43hIxKRq/IJbVmrFIgq/TtXA6RV5PY8tWJ7r2tCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(366004)(5660300002)(186003)(44832011)(2906002)(66476007)(83380400001)(4744005)(38100700002)(8676002)(6666004)(6512007)(33716001)(38350700002)(86362001)(6916009)(6486002)(54906003)(498600001)(9686003)(316002)(8936002)(26005)(66946007)(52116002)(66556008)(4326008)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sWy/OEuq0W9gw2VohHG4EOazBgf8VH6D4BTtfIIvp/OD9nX88cerhv4sOjzU?=
 =?us-ascii?Q?L7f7IYSNfCs0NJbkoA2nxQvQhQLUck1en7zrsim+2mzxpSn3d+9XeTJtPHdB?=
 =?us-ascii?Q?9nkYfw1SdyU7z3xgWmMxjUh7KGNuzTHlIp02zaE85bLj1FNjJGQz859hc1Kn?=
 =?us-ascii?Q?gMR2TBIr/oYJRD+tCwfVeC+XHLZMOenZUmXhDQsbWslK5wJ/6Dbd2VJUEEya?=
 =?us-ascii?Q?9Z14o14Ij6FtuOlQJmAzWG5WvQMbWxQpEWNat2JEgTdro6yL1MB8Al7ItWYJ?=
 =?us-ascii?Q?qHUO0VioQJjXaQK3L589w/hq9XKwhZNYsCqPKsuTktjCd9/aWIyfDut2o0Uu?=
 =?us-ascii?Q?P+COkW3JagAhI3WFULUljztYydvSKMXNnllmsibttVfxvbUXCNty9ecBeHzm?=
 =?us-ascii?Q?xZWobS2KwnakgibUDX1aCQ0Te4pfmKPkBi/zTqDwj1HZUKb2F37VxUpZEvrB?=
 =?us-ascii?Q?mGuhBaetOGoECOcq3VKkej8zMBmFUkQxT1a4YByO2zcpa0FHiq1mNdXhB3cO?=
 =?us-ascii?Q?/MBKbqiBsL/bQj6s9pccTIvwaKm9dzbY/oLzFPYimdLyWNZLwNl9l6AV6jzW?=
 =?us-ascii?Q?LITWZSiy1d9nWCjR+r18UHlq3EJzAHZPvMo2hdye0X2m+35CiziFWcKJdx3G?=
 =?us-ascii?Q?OsQN5tkp2locdvXp7VkrJ9gtV5AdxHCqxif6wxuVnyKz3Xjj1UJDUelAcYI+?=
 =?us-ascii?Q?ZDobPNitE0B7+lKuRu50sUZosHGOIxaiuT11kS7/Y3JtMSBE8F88VjnL3ahn?=
 =?us-ascii?Q?8LQcwAU8v05VdexxlRGw5+g2NsMxUww5QOGRcqw/j/oHNh9YxEPDcaxa8Uo6?=
 =?us-ascii?Q?/IFXngPHasNGnMyng9uoi7E0ges/fHIIHbAp+eEzf9/BR5c2j9E8QEQNDflx?=
 =?us-ascii?Q?JrLjb5PGmLHxecMj7ayPTMQtuXE2P0Ym2nl50mOgdbQ0fekfWHtmR+kIudb4?=
 =?us-ascii?Q?FDqxH9nzU4hy1BXhnpve8D7q7jzxXxaoWCafRnbWbihCrHPAWvyfcX3G81gF?=
 =?us-ascii?Q?VtHEbvp5dXxeJE6nUVruql264vB0jYa+jO70buDXn/5i9dqo8jGKBagLBTBU?=
 =?us-ascii?Q?gUSUEDLxWX068cPajqNPK0LGyvXwhxvE4BNOjDvCTi9niWtH79NXLG7OCD9T?=
 =?us-ascii?Q?tInFb5Hc7fDSbNEzaixLuS1DWFdYJ8N2MYSYL1YqzQyvvdUi+Hejoi51/Ru9?=
 =?us-ascii?Q?MZ1WhluFvwxqnW08FZvJ7KbEYUu0d0zHsz/aaAj7jINWyf3xVHLwwU1IeqDg?=
 =?us-ascii?Q?vgEqHa/KOmuT7jaJW9E3USkyHIIKNd1jpIGE+XyCKV1gQXAMb4Mvpvmv36za?=
 =?us-ascii?Q?9pzTL/m1+w0NsknuoNoaamleHXh1RMUWgrQpLViRRYif0F/635Q6kqgdb1Cc?=
 =?us-ascii?Q?A9Koq4RsoLghe7mPNztaTc/nPsRyPAQYWjb26J5u8KWPT/rfj9PRRbG+5HG7?=
 =?us-ascii?Q?PenXtEWQikvrzc02dkg29nyutXV2LhJYh/22wyYu/cMRNxiR6CiJjOMhrKOf?=
 =?us-ascii?Q?HUb93KE+cmm0C0HC9LUT2xztcPXWh+w/4JlGVtKKkTXqZsRvMKnlrik0po+c?=
 =?us-ascii?Q?Yyygkc6HVGkzMUpK2isAPtPzlEwAgwWhEk2sBQNJ30sEWXEedVlsdKoAXFwQ?=
 =?us-ascii?Q?RW5qOIHsAmqjx1ribjvFA7GsOJdFqPSRfZMNsUpSnWl4mxJ4Zaam+3zVK968?=
 =?us-ascii?Q?2p9rgVvugiEeFGDwhVLIIvign1zM8e4kdGPZbAwrM3JFz2LfZrIKjdrt2eJN?=
 =?us-ascii?Q?G8PeG2KpUT3egYzFEm6TVGsaT818H9o=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f745b19-0b25-4b58-8f8d-08da51083cd9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2022 08:55:04.9919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEOyfx9zskyO5EALz6q5aTrvhHzmwf/0FBM8Fm/B5GS7S77/Kl7OCDdI180hwE5pamwpm9Rfe3uAzrLEC+ZTA0O5SBU4r9eFusoBt9Pq0+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3589
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-18_06:2022-06-17,2022-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 mlxscore=0
 spamscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206180043
X-Proofpoint-ORIG-GUID: eHKG4IQLX2hdCNzlXitouqAxAinJn-JQ
X-Proofpoint-GUID: eHKG4IQLX2hdCNzlXitouqAxAinJn-JQ
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Call spin_unlock_irqrestore(&udc->lock, flags); before returning an
error code.

Fixes: 055276c13205 ("usb: gadget: add Aspeed ast2600 udc driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/gadget/udc/aspeed_udc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index 77376ae04224..4dead40895dd 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -663,7 +663,8 @@ static int ast_udc_ep_queue(struct usb_ep *_ep, struct usb_request *_req,
 	if (ep->ep.desc == NULL) {
 		if ((req->req.dma % 4) != 0) {
 			dev_warn(dev, "EP0 req dma alignment error\n");
-			return -ESHUTDOWN;
+			rc = -ESHUTDOWN;
+			goto end;
 		}
 
 		ast_udc_ep0_queue(ep, req);
-- 
2.35.1

