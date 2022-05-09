Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3297251F7F0
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 11:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233213AbiEIJ11 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 05:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237506AbiEIJMu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 05:12:50 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B72E9130C63;
        Mon,  9 May 2022 02:08:43 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2497K7iU024435;
        Mon, 9 May 2022 09:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=gCEJuFqJKTJOTQ00WzI0texq0d3tDK300G8wORL63Wo=;
 b=sp6IHsP4QaNcDOdZ8pHsxBWMx3Ht1yvDBmVNaoDvgolmMeLTwJ8IjUWgmePdDf5G4hEs
 58YKc0FuqTG/g6/eq+HvZmn5kLmvlOOQPIC7wxYZ4fblOhpaiIvuq4DcsBlpCFxGRNOh
 n6cZ6YDrtNe47wEouqBFLWgQSsOh080+O0PgOiToJW2ylXkNwvRYDTPebbBLZRe+qOCz
 Gltwlq5mZHdhzjGYB/UufyEKZFz1dXMtLiWGOFy/PvIzWsMY76G8SmL1ioz99aVvsMgV
 tJJavyqkHyZiqyR9ZL++ENr1TxLewH88INXt7WnWOUCAeLNI8It+WIadYqk1cf2aspCk nQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fwgcsju0r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 09 May 2022 09:08:39 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 249977xN014125;
        Mon, 9 May 2022 09:08:39 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2042.outbound.protection.outlook.com [104.47.74.42])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3fwf77uuta-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 09 May 2022 09:08:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4oZKhj3ZFg6EU2LkmOYZ+9o8hSo9OzK4Ii2L5lA5BJ6h/2oj3S0Paeg2exogZYy7IAOCzY4RthzVAcYClhXZ7bT+naIihxCdiHjSJL63w60rdi+yGL2whP5zX0t9wYgSzoobRzItvmGSezWqR3TzsxQ2CCYFP5jhJZr/DBzoe5o4s9MJ3aGDM8KjRuOAVlL70Tn8TpPtFBkcce1kcGSVON7myhmvQn4KCMB30LnwMBB0EdT/JgbSqN0b302eCh/UIbfizp35NxkBUJGIeqUnhr8aO3ob1URkzZViiNPz8T1tagRDwq1aQao2LJjIbEYZmb59KMMDGhWG2gmNXqKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCEJuFqJKTJOTQ00WzI0texq0d3tDK300G8wORL63Wo=;
 b=NXJAxLCQAfeeFnDe5NQR+/Rkpa8IRAzqwiDkAjjbApNQ8L4Z2+zosq60ug3932rQu9+PJeubOmfKuQuJtoWR/4WA2MbLbOh8eKc+lenXj8ea2SY0+FUIMLydqHbuVx3GNOpxOzXsl+qYJccaZgwOy8ssrjM6Hv/zsalhhycQTuWllJSk8CRQRvAkWbzhPFJlftkmnyzlnp3hUSNIURnjkw+z5roNlDg+YI2n3iggKuR6AUlnCQgMVBH5JkArXlVb5kd4nYUE2RdcSs1hNuZKtQmLVaUTawKWsBLCGUar5lx7u4Tq+C16mP9RFvAdILxzFPW92liVdHb8ymumbTm/Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCEJuFqJKTJOTQ00WzI0texq0d3tDK300G8wORL63Wo=;
 b=xa1KNPdG3vlwxyL8A7E7FDpEX4FodxgjhYtAYxrOXqT6WWRRZJv/l/k2NqyoVgMen2hB9TLN3Sk46HHzrok2Zzh1bfvokEb1lEfKkkhyzvfW6cFIS1N6GfhKZRwAlBNTXhb9kCRUTeb3F54OMHD1Y57A6M/mN9DthLCB4g049rI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 09:08:37 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba%5]) with mapi id 15.20.5227.020; Mon, 9 May 2022
 09:08:37 +0000
Date:   Mon, 9 May 2022 12:08:28 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: acpi: fix a NULL vs IS_ERR() check in probe
Message-ID: <YnjaDBXLmwouCB3M@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: LNXP265CA0056.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb1aab43-b6d8-45db-9252-08da319b808c
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4542:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4542579179B609476768CCAE8EC69@SJ0PR10MB4542.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i7E6eXYzbpTM9czzD9a6pY+qIoqPV4lL2cc5V6OFJSnCTbvc2ryXqQiVYDQ/YrbBK6Rw8r5xM9/7VK8fqrHzj3OcCvtpLfqBfhE8s8T9pR7C3akrKCOFqfBnDe9UiX+TBquSh6MLMFcnJ7PC1BWhlm7vHmtH5R8b+MsdblvKeMm8lahbRZWYZ2sGD4LIVtWu2Z7UCm2w7G7izEVvpU1D23Hs4ryDrvqZB0uEK6lBvABl9LZOvxOhFGflR28elU+bkO4UMkbu6sqpqfuvARDEGOj8faDVoSh2lyBRqxfoA4RSwHpmLNTHlcXdPT3powQbgplEm5z8mziOScHvyJm+gAanWc/37s6eNxWonNlnQs++T8Pc7Bx6JLk3WpFxYjknPMCE+PNWYo/koqpbmRZm74+RbpLFh88x6UdUyi5v2ZOMuI0q7cjGDPp1R5AQnAPiIRqEMhUGFOt67pyLdTHz80Gx52xVuiUuFfcqLLCLT86e/iQzuBuG1pTEIpDGzY++yEV4vQb44w+o0Yfy7arGLPCDBG9QPro7y8qv2B6MKbm+FdMjnp4dpSxeocatur0sdHYO6SYM3KAv4eLqSvPKKuooJFtNm4Artn1I9Q98FUWg3bDMTVJ1xtKWsXZdhgVnzSUtLxBiCtxHZEQyROgKhzK2rUeDIHSG1ZbKJWTVS+FzUGSMGPAPZoAyFMOYIpynPB5fFCf2naRx3wPn3daotA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(33716001)(38350700002)(38100700002)(5660300002)(83380400001)(8936002)(6506007)(86362001)(66556008)(44832011)(9686003)(508600001)(4744005)(6512007)(6666004)(26005)(66946007)(6486002)(316002)(66476007)(4326008)(54906003)(8676002)(6916009)(186003)(52116002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M2/KsJqYqFmXU353T4XbdLNaW3gGU7QikJ9TjeReypf+JTM9CaKQJXe7Vr+E?=
 =?us-ascii?Q?AZByVYujM51eGCRnvVl2zcKl4nXTbYih/rGOYfpplWo3Uvvae1VPohhkHzK6?=
 =?us-ascii?Q?GLK0vxRtvXDgD/HYS2V/UpKCz/6CAPnR+YGeqO+vx6NK5duFjePHF1YNqPZo?=
 =?us-ascii?Q?ikd5ToJGCcSn2yd2FSYOSJHNReG4YUo05ZlagbIc4wKlRQgn60/243sZGXZb?=
 =?us-ascii?Q?/l1fbkPmFLnNMnlSrz9gkamEiK6e1+8NqkcZHtv5zr71/qY6wl7ZL5/zTBfs?=
 =?us-ascii?Q?m9EkPalB5cwDef5JKiXJVNVl+w4ioIIYXxu7oLzece8VSTUU4UPA2qbWQnIO?=
 =?us-ascii?Q?PJieYkdPwhYPvH1YD3U6VbhuHvdKy7IKmhvY2QXWBUDxEEaLIwl65S9d5qpz?=
 =?us-ascii?Q?XOlfRUTpoMXlJKUFIyZ68g3+OS6PNhlN++yfoP8UZPbBmdnNp72LvG8yibuL?=
 =?us-ascii?Q?KKTwLsBiSZKNxRSTvoYwuK1/S6qwwUbvci5jUMoHLaBSIJAh5S1K3Hn7YmQg?=
 =?us-ascii?Q?bmwBWvGBygzLs6QQmXyFGnx+rh9JWrf8/mHsJ7l9HoFxXN4Ga46QUZTOwdRr?=
 =?us-ascii?Q?LcBS7Kj0YjOaZuepGmYJ8qNJFNDlvjmCBJIH/wA11le7QmrL90qJZb8f78Q4?=
 =?us-ascii?Q?cJ7nIvQIuLBLFY5xm51kf571MslvOBXDStsvn0k0Tnenn+cUqg7IhRzxI78O?=
 =?us-ascii?Q?48l2k4kUNEv1vlOeearr2WfDileLxJtkwf/wTlVtciD7Xdq5lyv2exw/ebaI?=
 =?us-ascii?Q?1+LDwmFgqM50zQy/+T7fXP8voAQr1kByI0nAo5Xld/AeL3Es4t7t4+nARXKZ?=
 =?us-ascii?Q?X8y2T5JuU6WrB9LYYkmG4w3fcoH3nMpzEgqla0T6MVFDYx6GyHVooleI3qlZ?=
 =?us-ascii?Q?vX/a0S1S4MjB++7R6IgMjoJCZrq7zOI0i3vlF+G6MIaRbzZVvvjNnYTPDIk9?=
 =?us-ascii?Q?1fhCGEMRvbjrWEZseoTuInceDfkKIrdOFf0V/joWLJ2tII+W6NJzBJ0LCHAm?=
 =?us-ascii?Q?sBGpqGnJV0K789EMCvtyHzesqpZPSfoWio2XPSx2E+1IGKIahHrLinxU3+hb?=
 =?us-ascii?Q?UCtGcyDRitvTrpQLpoZLLYocPtNthnoi+LRUAiPFfW5Ktec7RHA70wMU6jNB?=
 =?us-ascii?Q?/SEX+z/1UpPlWPam/GDLlmSrPMWOInwn+XBbErVLagNZg47f6V+P9jOr1AzU?=
 =?us-ascii?Q?hm5NoCqY1fED20mFqDhhQGZbOFCDy+aV1zfZ8OkRIc6o0+EXamoqizYEUOAD?=
 =?us-ascii?Q?IBW5UVhTN7CdHSx56bbSRgvGk9iJCc0EJwzxhlhjYBd+A7jaRlJLGvO7pPgA?=
 =?us-ascii?Q?O4t/nrTcJHJRPY6hxk//XldTbaN2cbJWTq96C8FyqyYOhzDQvQ118uROIUyw?=
 =?us-ascii?Q?HoyZpLxw+ooEoQUFH+BGUGxoadJQa9VPVl+QxNXr7Dj8xmaBoClOKqoCwGA5?=
 =?us-ascii?Q?QQA7lRiheK3tO7a32pO88KC1KspCFxOCyIplGvjTL8VvtEjZC2V8hzC/FybP?=
 =?us-ascii?Q?hRXusDrGKV5Zf5+WVR/sjusGxYier8lUKvvRnSoxBsQ17vbPrL5hJ4iRi3E3?=
 =?us-ascii?Q?htX6FU0tVTzm5iTRoiuuP15zq0OSMa0EuL2OQHaTo27sT8ygwX2LLe4vzhus?=
 =?us-ascii?Q?JT+jRBC6Y2HtAkB4scKKqN7Qwe/zJlEX+HWQHjT9Taaf6FOF+FwoXQwVFjgP?=
 =?us-ascii?Q?1eEK16uKPu9BPxyKjAqYShcb9l3NW8nF5wzqIuVv62DBakm9Kac//6VlwO5z?=
 =?us-ascii?Q?IW+nVpzNCVDKcTXonkXP7ZaYTDmpoOY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1aab43-b6d8-45db-9252-08da319b808c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 09:08:37.6015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZxe+/+XzUs2zaqzHA1pdtzMkuz4KGuZJ7OV3Fgtmlwphp7QJBn2CcvmVokfceXicbn2+XfSaS9u+hwLaNDw1dDtqnqTeWOXi2ga/kvvLX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4542
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-05-09_03:2022-05-09,2022-05-09 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205090052
X-Proofpoint-GUID: 1pyG5RNRPtFbZd9LDFAxwl8wASBGexk2
X-Proofpoint-ORIG-GUID: 1pyG5RNRPtFbZd9LDFAxwl8wASBGexk2
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The devm_memremap() function never returns NULL.  It returns error
pointers.

Fixes: cdc3d2abf438 ("usb: typec: ucsi: acpi: Map the mailbox with memremap()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/typec/ucsi/ucsi_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 7455e3aff2be..8873c1644a29 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -133,8 +133,8 @@ static int ucsi_acpi_probe(struct platform_device *pdev)
 	}
 
 	ua->base = devm_memremap(&pdev->dev, res->start, resource_size(res), MEMREMAP_WB);
-	if (!ua->base)
-		return -ENOMEM;
+	if (IS_ERR(ua->base))
+		return PTR_ERR(ua->base);
 
 	ret = guid_parse(UCSI_DSM_UUID, &ua->guid);
 	if (ret)
-- 
2.35.1

