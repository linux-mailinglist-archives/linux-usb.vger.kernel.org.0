Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E09515A9B11
	for <lists+linux-usb@lfdr.de>; Thu,  1 Sep 2022 17:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234488AbiIAPAl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Sep 2022 11:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234594AbiIAPAT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Sep 2022 11:00:19 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 949C827CD1;
        Thu,  1 Sep 2022 08:00:14 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 281Diq42026697;
        Thu, 1 Sep 2022 15:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=jpB7+5SDTQvgelHtdlGUo71KB1UYAJdQ15HdPcSXXAY=;
 b=Dhtz5tUfwAyPy41fvDFw/347oDDJO82w5tUfJNEJ6p0mjT6mWrfzLsdlkqxIiZyvUXTC
 Z7X7QrzozG2EPpqoG+gcWK2krEYbD9vjHJVtaeA6ofF8Dm/7me11sZLsRNKjJ0L2GV5b
 DKaNvHheWmbFKKwIW76P3Wjbm7+PUNGPsa43+kZTxxAM7d76XyVL2fCkayqiZ46LYDXc
 T1ofRGRHm5U7isEnuJgbwfBJAtYvlb668jEHuCtfM3OCpXXzuZu+XE6JbQneRJucrHZD
 dt/7F3bAxlqqZO3Tfyz+4u4/mttrAGBTZ+tQIMAyFy60gl54HLI3nOofZYdsgeYtZn9h BA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j7avsmh19-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 01 Sep 2022 15:00:01 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 281E1SSm027707;
        Thu, 1 Sep 2022 15:00:00 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3j79q6asru-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 01 Sep 2022 15:00:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8Ic54G5MJ004uIOwjdo3RhUZ0lCFoUeJPBya3jgunObGLYUkwhjWfBiOmGK3VzBF/TYdSCO1HTVAEQNbwXs/vNN40y9DPS7ltAPoWN7gHJE14zpQi/7iIvz4Q6/KDiqkg8c1+dL56Kgmtfg8G8dnjRQGabvhZnxbmaGWSkE69UHRIsmk4U/A1uovjMHFeFlhFMNEWrUUqTHCxX3KScDiZ9BKIK5kwkvwErsi7ebPQF12Jzha4qxVROwrYAVdZ5DObLbBtobCVXqqHnugGjSHL3J3YWt88eb6HJ7BREX1eHiiXCfQPibxSyQuD7VNLc5G4TReLSc7LJcZuELdCfYQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpB7+5SDTQvgelHtdlGUo71KB1UYAJdQ15HdPcSXXAY=;
 b=KpaHMQmIfrO9ttAPAzTYJ3pirRY4z6FH4+8yCH3r/UgmxO3L6HU6pjuNUhAsBbY7dx4+nx+SUI1Bc9ps+D/80d/kVGqgyVa5nBjxgx19YuLsa/3X0YL07ttCPhtsHItwFbwj+Y7YH51fNXperOfHf9Buy/hZQO/JohJHoKYSluTlEAKYCuT1DpiPLAm8rRsmi2KU6KuUoXADgXnChTFpWJeqVIQCKKRTdZq9GRCSot8OYL0K87i5fqTiJKdSRCWWqJrSjIYQNMQOOPNLHgtub5yjIPh5fUal73noLRs9ndvbPZjofae+cXPVtmH/m9Uk1n0KWZadYp+Bi1gGciISJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpB7+5SDTQvgelHtdlGUo71KB1UYAJdQ15HdPcSXXAY=;
 b=xf6cv44rXXkOUL7m3etczAEQxRnU09BXqEdAVWrS9LrvuzrgRKrf/YmXiw1D6i0F/N/lsvtNfuwsA2cUBffRZelO2sN9zRuKc48vjUCp3osmFfgo0pLdizBPY/HblQG5i2CWthS9faL7OQZ22omM+D/nI6mYjo/4XZTCiOph+Mo=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BLAPR10MB5313.namprd10.prod.outlook.com
 (2603:10b6:208:331::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 14:59:57 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5566.021; Thu, 1 Sep 2022
 14:59:57 +0000
Date:   Thu, 1 Sep 2022 17:59:42 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Keeping <john@metanate.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>,
        Jens Axboe <axboe@kernel.dk>,
        Vincent Pelletier <plr.vincent@gmail.com>,
        Udipto Goswami <quic_ugoswami@quicinc.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: gadget: f_fs: stricter integer overflow checks
Message-ID: <YxDI3lMYomE7WCjn@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0008.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3889190-1b81-40f4-1756-08da8c2aa2c2
X-MS-TrafficTypeDiagnostic: BLAPR10MB5313:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /hzZf5MbDGeYO3HfS3J7oWulVWH50umzGh0Sb9Kx2DE3GPRDHr4givwOVSE7OZW/uyt88f95Pda4N6gkZ1eLfNqZ3oroM2f/69jGEwipWWV+EbDAog88hIgdyHMpXNvBY8grNWlBJx1mdcT0T2sKSawzEEzIP4tNYkEwnZIzIPBaXiKik1w5v3dMhtViL8mdgAt4Z2R6KgZP2J10K2vCyqaTa4YAAYmWoW2iXeE4Qm80rcuQchnNRy6V+JWNqNiT3AMGxzn/9wRC6Sb0Nsp7cfenEmDhRVfL8SAVCRFCFkIhMZTNhYVHFfib5sLmp48cy1TQuaGM5KsTPUxzaOlLa87Ep4Skb28aI98FAjGUaINgu1oKBrLzP02qAQUnd6JOZVt06rORXkzwN8txBgiPO/95bAfSTic/JuRHUFcuo8NaRenMlHzCKdcpF80tBmlSx6KDiQQu4wfnW1BFLGyZ2r8MFPk1Op4vpg8DrIG/RkKDi1vJ2PDDC0nUHC7Pi1LqJbl68YCC6amZWdqLs7ggbouzyxPXOp7yxlA2rM1XOrOzCRrzF20ShCcXqFq5HGvLzXbyBCb8jSIMLWf2GwzzZL7xoSd6vI6TyF9UrKJ3OPXb4bdPpRE//8/phJ7ES3UAOjH/AiATWwejINg2zUpakRo2keBlvWK8kW0ETQQIdF8mXf5iH/NQVrX3kz1yvvD/tn/sft7yFabxQscqWTHe0AJdx96Yo3miIbdgoCsgsg+pDhPBi/9lC+l803a6yTYI2PeJxlC9pdM3Z0kOtOjyWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(136003)(396003)(346002)(366004)(39860400002)(376002)(86362001)(52116002)(6916009)(6666004)(5660300002)(44832011)(33716001)(186003)(6506007)(8936002)(41300700001)(316002)(54906003)(9686003)(38350700002)(8676002)(6512007)(38100700002)(83380400001)(2906002)(66946007)(66556008)(4326008)(478600001)(6486002)(66476007)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TE135L9t1vHf2PNPs8zn9F9UC3nwYTqxdqtkoGdNWUWc5apk1lfXo0gJEICQ?=
 =?us-ascii?Q?jOHoSck9tLlHHKA5nXhxv+fREq/RItWhCHTkdQLdqIwwWNsR9KtRwWEPZoM+?=
 =?us-ascii?Q?a5AFKfZwSI0qRJDlbDG1OkkABryKy5kOKtciYw07BYJyxM1eAiAlCaCqJbZO?=
 =?us-ascii?Q?QsyfOEjVCMRfBDq1DVhKVLnfxLZIQmPYIGLyQ+1yGQrkxdhYizXsOJrgoNC7?=
 =?us-ascii?Q?0qeIpMREbK6bVHPYUSaqGma1G3RONMccgPUVRS3rNO3cF7NM/GeXoPUM42Kh?=
 =?us-ascii?Q?2eNJPWf11m88wR5klrKkAU9EhIN0nXtK5e2znTXhnPOJqwDog7bi/r/Wa1tc?=
 =?us-ascii?Q?NYVARs2BGNP9t5xEDZvifq/zGh/0XkQFEMcb3yhhEBSD1QQK1swXqgxITLOV?=
 =?us-ascii?Q?hMUIQWfA/2U+WSsUYspAJwe1aVMASbaFTsNvkMFjpxGC0NN8Km+yxXcmpEM8?=
 =?us-ascii?Q?FCDktEkYiW+zR6Qp9KdwT6wNvjNFEABsZHDxjKGWX1WaeqGuk1r7wMgOZzk2?=
 =?us-ascii?Q?qhrEeN+lU1prLCnebzuKnKSUgnx2NtUE033ugIxwHOhKaRIreF9qSPf+Q0in?=
 =?us-ascii?Q?FD+Wfq8CcJLZ5LV3jzWliYWdqN8NyU2saHR0GfmUCyA/JcaDAiFzim6+9TV5?=
 =?us-ascii?Q?odK4nN/y7PK/KKdZNlwq7IwWOIuQuBRmrib3BlIw06XNCzFWWR7XRRt6kJ96?=
 =?us-ascii?Q?9HX4cFRpFeb8/h1SBuX1s5mcPU7USTfzntV5AU0SELiFCfl65Ux7aZsmTAZB?=
 =?us-ascii?Q?nxhxO++ml2FVvjHTDLLZ42NX/m/KfDn3He4kidVpYdEaUOkRJ9OLvaX0cPgW?=
 =?us-ascii?Q?bXISjI+PQzf4SjIr16X5zLxJCkr//mWA5ukdOyxuCfxSXNcTMaHmZtq4Zqzy?=
 =?us-ascii?Q?gV83rXS5Mf2l/UbAHlqJ2jKJdX2fEaEbgDDACdx5BlpIy0XjsCJCoaERhIXm?=
 =?us-ascii?Q?maQxwIsjahqA++u1rkB87Vc+hAl1kHzYDhPn0FPbQ9ynuw1/kV7nnxjcnLWC?=
 =?us-ascii?Q?en7+ro+cy8RMMzNquP6UWy1tzzwn1WOGcLdMyUOszOMKDXzy/S7olN/qekoc?=
 =?us-ascii?Q?t/gO1ALBHn1f8KnSUB6FBBVuqEbG7VxxSQF0b6rQSzTy4YAucB9NsN+ZA7rM?=
 =?us-ascii?Q?xNw0BkTV3Qgr/63ocFBshHiC7KTX2qNnbTPc2DvRtE3D+lrJjkVwgjyB3C6Y?=
 =?us-ascii?Q?GgnLqlgEgq6ioopCyJZ0ZKUXoEQRvlkpxdPOKQCQ8rCTwqsP90f0ncS9MPv5?=
 =?us-ascii?Q?nlwlU9D4ViEV5PQxOXLlTm0V5FWzSkArwylSIiRMTdtC2fH+S1ADHJzKbjbn?=
 =?us-ascii?Q?IXjJw9YNnztk38TcERL9gmDG8earTt/l61JOo4AErwGyxSqL6VEwC9Lth4Ja?=
 =?us-ascii?Q?UnbOrbeYpx1CsckxvnMAiO2D7mH5YhbpKhHn+Zjrm7OVn75SuQWikto8P8El?=
 =?us-ascii?Q?5DdlGSyck4OnlJWo48koP3dyegv68DFARn4VloOvEi8cZDNW8wLV0CicEv+D?=
 =?us-ascii?Q?dafN0nh2thcrIl/S10CbKMzkZG08RCuS6kGEMGuCwZXW/B4BlOnLSO7Fz3gg?=
 =?us-ascii?Q?yDlA4z5OGYA5KQtOcIiSZt/o+bndWx5jIeC6IsF1lAALMNHDtMUEIyWfafGT?=
 =?us-ascii?Q?og=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3889190-1b81-40f4-1756-08da8c2aa2c2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 14:59:57.6146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mhSf3RpmKlcQSg3ip0GdW5AfZI+7CTP2LsgvhXMsu/gWrZPV50i5yvFipgusCkqVESRC8fKSOzZU/CWnk51LpIcgE+wc+43WV60dEDZRnUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5313
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_10,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209010068
X-Proofpoint-GUID: fIoJOuNmqnYFjpSvnB16oEl1KdiyCEyr
X-Proofpoint-ORIG-GUID: fIoJOuNmqnYFjpSvnB16oEl1KdiyCEyr
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This from static analysis.  The vla_item() takes a size and adds it to
the total.  It has a built in integer overflow check so if it encounters
an integer overflow anywhere then it records the total as SIZE_MAX.

However there is an issue here because the "lang_count*(needed_count+1)"
multiplication can overflow.  Technically the "lang_count + 1" addition
could overflow too, but that would be detected and is harmless.  Fix
both using the new size_add() and size_mul() functions.

Fixes: e6f3862fa1ec ("usb: gadget: FunctionFS: Remove VLAIS usage from gadget code")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
The Fixes tag is arguably incorrect.  Sometimes it is a philosophical
question how to assign the Fixes tag.  That was the patch which added
checking for integer overflows.  So that patch only made things better,
but it accidentally left this from the original code.

From a practical perspective, that patch is nine years old and anyone
who hasn't applied it doesn't care about security.

 drivers/usb/gadget/function/f_fs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 98dc2291e9a1..73dc10a77cde 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -2645,10 +2645,10 @@ static int __ffs_data_got_strings(struct ffs_data *ffs,
 		unsigned i = 0;
 		vla_group(d);
 		vla_item(d, struct usb_gadget_strings *, stringtabs,
-			lang_count + 1);
+			size_add(lang_count, 1));
 		vla_item(d, struct usb_gadget_strings, stringtab, lang_count);
 		vla_item(d, struct usb_string, strings,
-			lang_count*(needed_count+1));
+			size_mul(lang_count, (needed_count + 1)));
 
 		char *vlabuf = kmalloc(vla_group_size(d), GFP_KERNEL);
 
-- 
2.35.1

