Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22D064C85E6
	for <lists+linux-usb@lfdr.de>; Tue,  1 Mar 2022 09:04:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232969AbiCAIFd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Mar 2022 03:05:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbiCAIFd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Mar 2022 03:05:33 -0500
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE017C161;
        Tue,  1 Mar 2022 00:04:52 -0800 (PST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22180TMb010124;
        Tue, 1 Mar 2022 08:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=TURP6fP9an0G/D9QqOJMR3tb5WenXbmsfGQLlDZdHeA=;
 b=olYtv/KH4SW/Yq865HrIa0ajPwmxHCbQR1+fFUlPaaPKhccuaec8d6nPkpf4GfKmxjzz
 Bk0X3Y6D2vCUsntHE/q1wjMo2jYTYdksp7hQLBZFv2XrUIGmQqb3Tu9ataXEioBNjp1a
 L28NoMLXNlPZWsAWSxjvccuajazfTJVMe0/T0XcDMhEdGqSAz3c/en/AseLTmOJCzgon
 AMTsBtDhLkZ8B5TnZWoeCLNOmcC4dSQs4MA6Da0D97Ir4G67QvGjbEe5UkPQNOFTP85O
 OpPivPLKTTEmCHDtfmy/hjhoz84BBI6EYoCHpvJNfmM7mP0GWeTReWzfAcKCJbd3jXj4 fA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3eh1k41we0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Mar 2022 08:04:40 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22181GXh099199;
        Tue, 1 Mar 2022 08:04:39 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
        by aserp3030.oracle.com with ESMTP id 3efa8ddtha-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Mar 2022 08:04:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3qqChcZXN9oeI9M1g26KRgYL1WRaFDUdpz0FBnMz58suQLfyiBMjSqEcK24hhfl2cXvTIvU10SGrwuLBWcdNO3kvINh+pqmMEBHFXB0DGb/inOGCUJr5QAmNVhjDzoc+cJvsF9FtG4nDdhM2GdW95TSPgNWppUpkxAUzUPOItgeiyeg5lJOM+xOh5MkMRlotAeUHv/IhJnhb5hBiv+WHDdCclXl6ALepcsXk7J160DaSbAoMndYipbahyUmaWihiZSr5r6mLY08fY/e/7heJDfGQkPuXMHkYXbNaXSJcJJLH8i5z9C8Y4zw+c714J0A2QCjC0K5wnH3x6d84irXdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TURP6fP9an0G/D9QqOJMR3tb5WenXbmsfGQLlDZdHeA=;
 b=I27XBq5K1+ooVO55XUAaSGR64IRrfhtYalz+wuCRc65vWQT19P4UaJ8u+W+P4fK4fSdKd328KGeQAouNKmsmWXj4UHummVITkNbRU1vHYfr2L3/Us+aeBPvTox4T716JL0eVbCTEpHLN3lF6/4TZaq2aSHufWEHgYo/pIq+6P+KW+byW1aMolnpcHxsvJ0jO9AxrEpRWfHPDIclikshIBRmeEcYH3tEvRwkcM/oIn/vyHUzxoMH8h6pFNDZ0Q5T+jkooYGbSbThEIJPgoD11/zUTM86nSNUp3t7O9Izhwr9q993ChA2MBDgWjPKyEOPSOL0lb4vtjx0UeXHo7Wa1iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TURP6fP9an0G/D9QqOJMR3tb5WenXbmsfGQLlDZdHeA=;
 b=E9iCV4/Jl7tDGH34+kkHK/1363FBultPpKqRiqSoYMVPZSBvstqrKLe0texP9KRlDxk+OD8eUVM8ZjwRMdsziMGYkmFveyXzB9WxnCT4TmkdtyRBM5KILetP5QoGqyN9ctl3TQZ0+NRA8aGMvKm3ChkALrKJcRMWn3/p2lDKFIs=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH0PR10MB4581.namprd10.prod.outlook.com
 (2603:10b6:510:42::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Tue, 1 Mar
 2022 08:04:37 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 08:04:37 +0000
Date:   Tue, 1 Mar 2022 11:04:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Daehwan Jung <dh10.jung@samsung.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Christian Brauner <brauner@kernel.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: gadget: rndis: prevent integer overflow in
 rndis_set_response()
Message-ID: <20220301080424.GA17208@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0165.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c10a0273-54cc-45d9-189b-08d9fb5a2115
X-MS-TrafficTypeDiagnostic: PH0PR10MB4581:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB45812C93FD46F7D41A7E07BC8E029@PH0PR10MB4581.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SmTl5Dg2KQc9pKg9lDyEYDzBIO/V9YNCiWcQGDpJDgJJQFpPMtVlPPMLodupUK6UJh2YDBhrAF55/irwC09cpG1j5kkxFsDMgQymTjhK+EMkc6T5vgkvEEjeka9WcsGtJ4iG9dc1Qto2+ssqjsHzG8MUm98zPXGT6H7004lK3c15iOkSnVz1ZiMlTQLFOGHovq2YbN0uWIfEhBjCjH5r2d2yXEZhWwhT+Y4d1+SEp/E+U1pXKqrpRiNjAVVQ+rZ92U024hoVzs43p9wj9DuMI7eIz4IJOI48zEpHFe2S6OW30YiMo3qKuAKedFSLtvUIrUPAUKlTOc/gg/qnVALga+Ml48PLPfHTxGyDCotT1/+ptUh55GfQpLKaPPvxT27zLlM0NsFDZFHh0LKz6ysn39NtVlQwOWywwPjtZiC+AhR7FTRH49RcDjakyMicuNA8tMFiDjZ3X+2tgw587asqcXW19aZly3TmEliznLN7I3Kltq63tbLHLIVVAQ6POtYAu3qPcr/k1IDEsueYG/oQ1RHKQQQGxOC7tKoIIacIRtWKLKTZQlVKQOhL8IzeVqwhzpm0tI9oofEgwZBqXHc+sxwyO/zzZNrMx8D9HR01ydumZDdHYg4lOJzg7W6yX5AsBW0PuRoitjA7okf6uwt5jOLFO1MgDm+B/fcHnV64GDJy5sz1fiN5CRdSxzBMcLj8QrAoaoJmtiwc61HMGrxmbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(54906003)(86362001)(186003)(8676002)(26005)(110136005)(52116002)(33656002)(1076003)(66946007)(316002)(66556008)(33716001)(2906002)(4326008)(6486002)(508600001)(66476007)(6512007)(6666004)(4744005)(9686003)(8936002)(44832011)(5660300002)(38100700002)(38350700002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JkqbHKQ5QniYVxvd12THB4vxaKdLcTYHoRXD067nb+wRCgrJHd4P+Tqtx7cV?=
 =?us-ascii?Q?HH7JM+JV043cZ4ur/KF6KHo880ooA2CTVfdNX/LFy00Iqn/I0nISMXbv9zEw?=
 =?us-ascii?Q?xdi8+Tcokq2NAJLp7Wp42UhQT4W3ns6r//UwuEy+szWBUgZEDpNjAr9S4KNw?=
 =?us-ascii?Q?6491asJxwudySENTmM4SAO5fmWRyMSAA4fJWYrp9+Lrpx9jtAYxfoTbEontt?=
 =?us-ascii?Q?KxNwgAUQQJbR7Mn9Cxqo1iRta/zHrF2w9TLDDmZPcM7B8T/LLcOqCnU1Iw0p?=
 =?us-ascii?Q?SFBAsCQb/xSQhaC7YOJjwY3+Q4+tQ6DuD2enRqIG4aEqv8TpRiP2O7bUrD/v?=
 =?us-ascii?Q?chMH0XpJ6ntrf1jTyJknV3lgBXY7cCMNtkuhCS+WiOz1BTMw+eVr98CpvQJB?=
 =?us-ascii?Q?DiGz/+qIzfk2jEfn5ZZj4CFa7coJM07NGNi9ItzVwHc9kUODZ4ywWk1zEp1v?=
 =?us-ascii?Q?6hU6xdzJf0PICiwz6eky2RGkP9bkMq9UkHbSK/fHfvuC/jx4P+sKXdmkh/ie?=
 =?us-ascii?Q?EfAty8bOt3naCJd/qZz40apGUlT5lb/EXfXDeRz2nQ2AKzO40Hzn3tfDeepX?=
 =?us-ascii?Q?GrxTDK3ZvNBsit/JwHcKqA3mJN42b2EnKkyzmdUKG9LyaOQ2HyS9EvBx/y4A?=
 =?us-ascii?Q?sEDp4qGSabSx1jsdj4aZTj+7WGo9fGtWAw9vSM5HetLtITJ9jcUEeKvcTZbv?=
 =?us-ascii?Q?+fcik5rndIHYcM6dazdQ1yR7I3ZfzIi/XkUzD/r49OkQHBUVuAHtF3tseYJw?=
 =?us-ascii?Q?1CqP/0xw5YFDHY+gUwxEV5sMLoxyXCA/WDmFKF0kfdwX4o8ferfxqnc9xpgs?=
 =?us-ascii?Q?JZuVpXDTF3yD8V5ys2BYqoceQV0tVdvFybpoJa/GkiKPkU6O+xaWOBy95qoz?=
 =?us-ascii?Q?vCEryN8Mo3uARDTfxnRSpI13rgX8SyecA9Am4hy5yYveBjVZUwHSZGF95cIG?=
 =?us-ascii?Q?1sdZzyF69az1ZJk6QsO019myY9oaNa3v4SnskIYQGxf/SDWLEa5lWO0KYfiz?=
 =?us-ascii?Q?HBd0hZqNFsA+ezpMUy+tblkjgGkubs+dadPlAXuhq9pYcpKNn3kNpJ5e/1KW?=
 =?us-ascii?Q?TnISMxg4B5RaAmQKKngPalaRiZ0nY4EUhlgo1D/bvZI3U0DvkrXoISuBwLsv?=
 =?us-ascii?Q?Q7KcvYJtcSFiLCmOd2sU0pWHCj8vA/Vve/OeRl0491t+Kd+tTXE8G6N+hKQM?=
 =?us-ascii?Q?L+mAddPw/QFLIDu9cE2deZtLdY+BhSDZLfns9g/0dRbExt3p+vUa1pyAdqqK?=
 =?us-ascii?Q?IILgeVj25uVpbMskVxyjtOe92uV4aHDUMRDw4W8dXECWkXcoYSEKhWRGYSEf?=
 =?us-ascii?Q?8PCA7J2+n1e5IT3l0PXXa6Um2Dvuemm9UWDzWAGI4xt9UIz74fzKcE97+0O5?=
 =?us-ascii?Q?BqrOnxUtEn50Io9eFbJp9PwdkojsePQQN9uZIemc06itxaKUukKIZU49uml3?=
 =?us-ascii?Q?W/HTIjGNAtNE8YpVxqIJAJ1mMd/ApaveUFSGZK1hj2kRqGPlZxohtuAIhC88?=
 =?us-ascii?Q?l4f0Z7+LQp0+4UDlAJn/zjumbY0PqzYlLH2ZYZiscEvTzU3ftJdl+p9zweky?=
 =?us-ascii?Q?Nev2jOCrF7F1Yv1c1Vu+je0r38by9LiFnEq3rIekiHBv9xcIbLdjK83Ky9ZW?=
 =?us-ascii?Q?awbXCiDpGOs1fN6phjnyO4BwaD3mx72WtNtzlA6/c1zOQrTFyie/TAvjvsa7?=
 =?us-ascii?Q?Kqez3Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c10a0273-54cc-45d9-189b-08d9fb5a2115
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 08:04:37.1544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GNQYqYxKjgyRV0EAmReQm6ysWkHY8Fz7OPySxOpWtxbDVRW0VG9OlKbrOV6oxA0dMSvN4FBUT7vjRWflkUfhDccTWmSK2PTapHMB/Y3kUeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4581
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10272 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203010038
X-Proofpoint-ORIG-GUID: ZUvytvGOVgI00-0e1wkGsOTx5idVD-gb
X-Proofpoint-GUID: ZUvytvGOVgI00-0e1wkGsOTx5idVD-gb
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If "BufOffset" is very large the "BufOffset + 8" operation can have an
integer overflow.

Fixes: 38ea1eac7d88 ("usb: gadget: rndis: check size of RNDIS_MSG_SET command")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/gadget/function/rndis.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/function/rndis.c b/drivers/usb/gadget/function/rndis.c
index 00b3f6b3bb31..713efd9aefde 100644
--- a/drivers/usb/gadget/function/rndis.c
+++ b/drivers/usb/gadget/function/rndis.c
@@ -640,6 +640,7 @@ static int rndis_set_response(struct rndis_params *params,
 	BufLength = le32_to_cpu(buf->InformationBufferLength);
 	BufOffset = le32_to_cpu(buf->InformationBufferOffset);
 	if ((BufLength > RNDIS_MAX_TOTAL_SIZE) ||
+	    (BufOffset > RNDIS_MAX_TOTAL_SIZE) ||
 	    (BufOffset + 8 >= RNDIS_MAX_TOTAL_SIZE))
 		    return -EINVAL;
 
-- 
2.20.1

