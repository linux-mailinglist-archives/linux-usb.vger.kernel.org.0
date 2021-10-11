Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02BCA428D30
	for <lists+linux-usb@lfdr.de>; Mon, 11 Oct 2021 14:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236685AbhJKMkI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Oct 2021 08:40:08 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:45090 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236641AbhJKMkH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Oct 2021 08:40:07 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19BCMRA2010572;
        Mon, 11 Oct 2021 12:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=oXnOlFYvDkQwAf/JJTyzh0RIDkj1mKWOJJYv3+dJGUM=;
 b=pZKwdn0xxnE+Ny5axkRfHsX+xtm3DIxOKVhb/m0WcbBOtq5M65DKMdVsarHbfEyGjp31
 qw3nkAL8TUfhYkb2UnkBbeJ8w7/Qqg3EqPgljzQdXtk1/D0yckMcBOjZnFztbHCE/RdP
 pbHQjETkEhQCVuPyHbCimvQo0XBtV1MbbbePtFONLRsFnrTeAISbjn+kt6ag9y95OaNx
 xcHYiCtVhND90yvN3uXIIE6F02rQ0nN16+zypcYNiPZaGS8Iv8MCT3LZvZLh7EZKa4O4
 l8ORau8Ho3mXFT4eWfG99DFMdeYW8p4gzUefWeOGw2U/xX7e0jgQccXawwCKvCSjiA7U mg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bkxs5bume-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 11 Oct 2021 12:37:54 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19BCUtgR191074;
        Mon, 11 Oct 2021 12:37:53 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
        by aserp3020.oracle.com with ESMTP id 3bmadw6fm6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 11 Oct 2021 12:37:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NkZrdjPD4VTGZr6WKuh3ImjxyWi0hRHt1KQSgrx/8WUnLscUQ0q4VgpBbCliIQc4ESNI/w3jMmuTg92YZXe5CEdNx7fY+eSdO/BpnGSYtobp1dCMJImF/tk6z+/FI/NhchXyIJ7JxXaDkKFuWrCCdssxKjKzykbkKjUSfVxI3FNDlht5wYmcdU6eVKPD4SVO6OWhOGUCl7kqyw0Nq2orgNndya73tcm27KhjNKub9MEIhpvn9yi4Bizf9Ozc7bdOeYwgiuy3kx3nqcEfoRpdvvV9OP3xoxAyD1RAJ0AAdv8N/aKGfoDTGIRxqrnb+1BAVh7l0iPsu8eytONcOdsYGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXnOlFYvDkQwAf/JJTyzh0RIDkj1mKWOJJYv3+dJGUM=;
 b=O11eTP6AqOHwTfK2hK3ifZXNvGRp2D5qJ6pCoj/JMzaKUgQm5t/ROASoN06roh0ppKSNuZxPB97R87FD/goLKy6eypHDM3YwY24/0413gMbm4cvam1mjmslecZaV4Aqs/0CM0ICZ/X8RwbrMFZnXwNKLvxmqrgEY8VmeOPn1dQDFFBsoED/5sTUSF2Y90IjDCcwyZklY5KqaHDkoEN9kPEV2qFKapb+MbNqeWmeyiuRgYhCHkiiOrHES4OMBPWfuV1RDdEyaSLTtxIEYkWLGAy+jCRulCcyrusb8RmEAabTp64OS3EJdouIuCQg+14Qczc8wWGqc19PpxfZCn4oPtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXnOlFYvDkQwAf/JJTyzh0RIDkj1mKWOJJYv3+dJGUM=;
 b=rW4brz7WDqTO4k8qmVFVWWh9pByStoLEwDIdSc+LbexDbZ2wdXwmYMNjo65yjieFKGLBpvWReCJo/e+xdGNUZv28oEfBxff0bTDSgbCX/hMAYh+0F+YJObKEEviOavCNEP+U/mZqUicQVl4KgLsNMVKHQJLlvH6bGDFzwx2Ljbc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1822.namprd10.prod.outlook.com
 (2603:10b6:300:10b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 12:37:51 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 12:37:51 +0000
Date:   Mon, 11 Oct 2021 15:37:39 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: gadget: hid: fix error code in do_config()
Message-ID: <20211011123739.GC15188@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: AS9PR06CA0287.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::21) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by AS9PR06CA0287.eurprd06.prod.outlook.com (2603:10a6:20b:45a::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 12:37:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 492fdded-a96d-40a2-a604-08d98cb3f072
X-MS-TrafficTypeDiagnostic: MWHPR10MB1822:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB182204B5EC603302DADF84E38EB59@MWHPR10MB1822.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2bxBocYSFsWDCB2dfDAPbxwc3m6bFhg0xHai/VH4lPGuTwzfx4opVOSNw30SGun+Z5cVkXZ4cn+f6Lq8VeEAgVsjb/w4sLy+EsyjuGkQcuJrVjDBXFlk9pTACsBamfutJF+OYzY2yJ00SYMm02YLXtsj9No3fDQgeog1Sm2ef4P60in0bKqa0+iz+8fn3pSa9+irbDOBM9JSsbZ8AGm81pfdJICZ8+SUCwe4exwun8OPVYsICs+TL4iqfhrK6If5e5ZNwXE7ztHnY4DpdGOd4RODhWQWRPntJrrTSXHnNdXn/nNtpoLeNDkCqah+CCdpzpqwWUYwTuMVNrB/wLCWRHm8F6CdCzWASXFUX86acG1tQABadJB8WtXIKwvFs+BP8jcF1nCZZ9sDYAO6XpokbV3Yc7RAUyxtmNeyxxa64fCIRw+/T0XZo12tG/mriLRI7xKywYqqhfol765FiFh4qmtlDN0HL6BotcmQhIiqVAAS7xqXM8tAsjz/Vc1J7DuuoJN65jNDcqU86pOJArYT6qQ5EG70tW2q1KVSZBj0NeaCKLdCCuwOXcuMIGXU5kinx721iytjz2KqfuTjTxYbRZ3NrnPn3da/bgBYlrjkSX9v8+liX2hQGXW4PdHKTwhNnrm+IgR88Q2EVY6LhHXxFzDsiUpp0oY0zHKMfc95odgiOQHvDSTBrDJ4E9fpNf7QAge95sxlqRcf3IxgaYzUiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(9576002)(54906003)(110136005)(186003)(9686003)(55016002)(44832011)(83380400001)(4326008)(26005)(33716001)(5660300002)(33656002)(38350700002)(316002)(508600001)(66476007)(2906002)(66556008)(66946007)(1076003)(38100700002)(52116002)(4744005)(956004)(86362001)(8676002)(6496006)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M1Yr4ClF5vGBEGE2HXsm2ZbXd6lLq2s0C3mYRgfEarTQzkw+mTzj349WTWaB?=
 =?us-ascii?Q?PLRotnjJx94RqxLffBomubcAVJb4AQgsU09HZ8fANPNMvBukzybkU9cTEJ4k?=
 =?us-ascii?Q?Dm3X5rVdpn9TUyR/Btd0Qnm5HmXaU/4QiIykUn3hYeL3KJro5WCZh1ZIX62F?=
 =?us-ascii?Q?Nxa6Na+nrPJNv7ROTRa8aR/lf6miEoYfEjD2Wf8HJbusi494koLvMbEM+TGn?=
 =?us-ascii?Q?+reC36gtTlznpqCr5kp354YUtQs8J9lBLMlIip4KKrKGJrbKJnPq+iPDUwH3?=
 =?us-ascii?Q?r5k9r1BgzSuKYPxu4qA82od4nFC8G91W8MAzA6nU2QmYEFHy8BDxR1fMOSY+?=
 =?us-ascii?Q?LXIMxBvyMJETcCVtP84GiBF8KuamlZboY/j+VnQymi+jd94kPAKt5hd8Ugqu?=
 =?us-ascii?Q?JMukychvcDYWu58MfvJ67t0fJnJVLJ74R8MXS69Y38IckqhB7oDl4IcHH9RN?=
 =?us-ascii?Q?G7oJIvPx+1x+GXItmrS/LeqkSfkH6dlpF+ErimISEjv4ly1O3oGhO/WNSU/F?=
 =?us-ascii?Q?4xdUGxiiEEAwV+kOD3/uzEQbDkNbBMBxnNELf0yiuoZmnDz7qeya22wF8KeQ?=
 =?us-ascii?Q?JX5yiSNIj4VGUqhg8oQXwra6GEBlPDfgufHhtKOhdQwQubUCvwnSdbhi9Z3K?=
 =?us-ascii?Q?6R/TjMibIf10M4iB+Gtnk1s4b0ZAv0X9amR2c+/uDYXGowhkVkLgShOAhzWd?=
 =?us-ascii?Q?9LWTmIGVT4R+xJfCVEOzDCkFtfQ54DklyVhTu4f3yumfwKHL4mFLbuWvzg9Y?=
 =?us-ascii?Q?oSpEs21TRvyTusaE5IT41iLdw99XOvxDGQep3ygQ6jlLT+w4el92T3ggqOzZ?=
 =?us-ascii?Q?FlAMQx5tCczSf1U0GFZiAUXd1MNZ7+c8nb1jH4Y95mtKg+PBi4DwP6X3Hneb?=
 =?us-ascii?Q?GKc5uFRGMdGwKE+/fYFDZQITyiqnW6mw565WF0wTjjQgvafqxDGeJjnso2ju?=
 =?us-ascii?Q?KTFXKe1Ab0Y/3TPUq8oaytfi7mw08L+MIG4EBuaeHefDdMMN2A7hbCx9SSEM?=
 =?us-ascii?Q?+wlZC+pesARbmFFvxxRWk9jWj0EEypPf8IXYrng6qJiLPu0I9cuMtpFQj0H1?=
 =?us-ascii?Q?IKEOvrYP2lWsb7oEOD6JnQZVMNRQuIJV5VrJ7TLECP9bjR7siPdWw+oxT2eA?=
 =?us-ascii?Q?J3cpWotCofEQPjqzRVVveOj4XY5RPqvwXzhezrKGEQWy/vha0s8ufSP4CrEP?=
 =?us-ascii?Q?erhT6K1x6ItvpTSL/i7tv+/E+gfeVoi1npGd2Sbxh8Rt1GYa9yS+Me7fXAF/?=
 =?us-ascii?Q?gEOLC62tdUvNRwNZbAcM+5mHeXaANpsjxqneQNQKSxfxqEYFTKYxjHksN/50?=
 =?us-ascii?Q?amVvVsGUjJHQScvbxlxyuOIH?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 492fdded-a96d-40a2-a604-08d98cb3f072
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 12:37:51.3724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3CfNRye1pycSv2Si2R9f6LYRbiHlOOSqhyryRHsyglTF0v9bnopXuLfMb4I0GLvRlVMnkwpp3Izw2e6p0bXsJ1EDf3EV8UoAsAVojCgbyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1822
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10133 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110072
X-Proofpoint-GUID: eUZwGX0P4ztmXSGfqk6667coBfLLdlzv
X-Proofpoint-ORIG-GUID: eUZwGX0P4ztmXSGfqk6667coBfLLdlzv
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Return an error code if usb_get_function() fails.  Don't return success.

Fixes: 4bc8a33f2407 ("usb: gadget: hid: convert to new interface of f_hid")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/gadget/legacy/hid.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/hid.c b/drivers/usb/gadget/legacy/hid.c
index 5b27d289443f..3912cc805f3a 100644
--- a/drivers/usb/gadget/legacy/hid.c
+++ b/drivers/usb/gadget/legacy/hid.c
@@ -99,8 +99,10 @@ static int do_config(struct usb_configuration *c)
 
 	list_for_each_entry(e, &hidg_func_list, node) {
 		e->f = usb_get_function(e->fi);
-		if (IS_ERR(e->f))
+		if (IS_ERR(e->f)) {
+			status = PTR_ERR(e->f);
 			goto put;
+		}
 		status = usb_add_function(c, e->f);
 		if (status < 0) {
 			usb_put_function(e->f);
-- 
2.20.1

