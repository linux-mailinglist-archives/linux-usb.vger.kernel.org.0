Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (unknown [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7D27533C96
	for <lists+linux-usb@lfdr.de>; Wed, 25 May 2022 14:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239239AbiEYM1l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 May 2022 08:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242040AbiEYM1j (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 May 2022 08:27:39 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7BEB6D860;
        Wed, 25 May 2022 05:27:37 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24PCEOIB025732;
        Wed, 25 May 2022 12:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=FVfWxrg+A9x2htVI2DL3x6SWcwxX9rAjcKAxaaTPdio=;
 b=HLfzRoq8E95dsWu05sImLvR9w9GKsS1m0ZlOsI60YnVVKmUJUnfkfDA1OiERNQt1PLfQ
 JM0InDDxVyoVpCIa+g6d2gcFu+RmusYtcGPjuDzYqHxakAfNwIVdU9/aiBL72MAXshCX
 UPVf7eUJn9OKwQEY+FlfwQgJX/uNQl/wmQU0e2Uzo3QAYKyFwuhKMSKMovhwShg0YZo0
 61nxlLUz6I0Qf4L+Zh28XnCqAUS+nwvKemg+7JX8l78Kj7t8bwId5TfLW2mbr3IllMzN
 wa1D33yk+jYF/yVIue6S6gA/Zfq/pwKobXavn4Jyjxfw9KA2eEd7yo8yohMZlY0Njl9X Vg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g93tdsyda-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 25 May 2022 12:27:33 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 24PCALvQ034393;
        Wed, 25 May 2022 12:27:31 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3g93x5p5q8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 25 May 2022 12:27:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FP/suaReyv8Ss84wmNdeNYGdcNNe97wVHlDoVu7qFkqbkZvTXAbTi/nhAffaiKqQLiY3gOuZE/P/9P4PW3/I5y1E2AYKmAWRKGYQHJtlF85QAOpqAszMuqY9ejovZ7Xt0/JpvMqXT+D8AP6ybHQZtFsRwbExk++6ARB4KnYcgUFmdsXYnmG0FfVUr/rF8isVn3cUlg/ZnZ26ptotVddsC4y+cACoH5/4B8tAxm8eaXdrKzskokJvG8a9KwAwBo0ZlZskABfsvfyl+ofVoPd229fSYXs6u2YVYcHhydDDLgnnjU1tPQOWt3HFXKOh2C4SM2Tx4BXuEe99QXqxjUJkqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVfWxrg+A9x2htVI2DL3x6SWcwxX9rAjcKAxaaTPdio=;
 b=P41h/UKmRGsFwfloeRdH5ERY2MksO8upRPw8qJGpuFx1P7KOMWLK/vy6IZHMpJevxEa6Sa3LSdO/IVGLVK06nALnpTkR3OUz/hYHGnyw3Gp085ZKvdouspDY/6sdcUn304vI0C9MytkVpXFdUcZuTnctNGYXvwcfevLQQe2GpbRGv//8ifCKS1nxNveg/+3hMvlVDFngkVCsr2Yw9mhCsDAAgWx8IoQSqi39pPTbO7hz/mtmv75NYMoI/s8JCjOCoz/69sKXVs+HcOI36HD5j0o42anPfGHRW3XA/ykqNmHe17uzm2xWz0N5j+hteu/epZyfcqxVftzipPIMFJuevg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVfWxrg+A9x2htVI2DL3x6SWcwxX9rAjcKAxaaTPdio=;
 b=h+2ZaWfwRNom8XSpEzuop4jJFUF90edyme7sFRUSjux/xUO/QFqzZGABpW6H8BfukwBfiUfWWB8cUsRWEi8hdZaOah9wjVPf382JdHvEM9wl2MEh1af3j1nJ87KAwWeJ9PgVDusChlKhXY859t340J3Y6rLyJl9Hx7UNIRL0XEs=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB2843.namprd10.prod.outlook.com
 (2603:10b6:5:62::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.19; Wed, 25 May
 2022 12:27:30 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e%2]) with mapi id 15.20.5273.023; Wed, 25 May 2022
 12:27:29 +0000
Date:   Wed, 25 May 2022 15:27:20 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>
Cc:     Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] USB: usbip: clean up mixed use of _irq() and _irqsave()
Message-ID: <Yo4gqLPtHO6XKMLn@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: LO4P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c469d41b-c236-4ceb-c239-08da3e49ef78
X-MS-TrafficTypeDiagnostic: DM6PR10MB2843:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB28438AF780FF9C6832A1971F8ED69@DM6PR10MB2843.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /hMCakNO+aKqPQWA9difK9+8kJmtjCXmbHRMHp6ffVpaJqBd5L/hQQ0YuOCjuDUiW9TIb98MyLvDB82PF17xjV0D7HT90C/bemqLls0N2I5vetnHZVXC3b6t/qVs59vPsrP58aGseyAholnK29smT+F61HgZwRVUvjWBNJwqYOoHLU6to98nZTSd5jObsaL44Bu11cOyFzMFTt+uInQxspUFNyo28ESi9tTpBKasU/c/f6JhjoUXICz+1BgzqIz0HT5LsFWtLW4vPw8CrOckuAdb475rA/qltatVI7OcLRCq7h5oXlsmnihw8mKGR51CoGg5OJfvZNajh1RpyS6H7fe4ocl3wcExzfmc3jf7gQJ4V440eyyc/VMO4hvv9KncTn9o/QN2VxFX7fwthStDutXElBbOgTR1Cqc8w9QIu4ywmReW3w9wbUJlRu+hHaLhH8AuGvJcrMbVAXVqmcvSc0E5MqD71ig6N4U9K9z2zBuF0qKwEu4V6+PEgQznaUopSHGIPKRtT/V+yDRXxDjODbah9SrCX6JI9tO9cs5D3nDJgPNHl941rlStFqWW4LCqULAtWGPodDQnzH92Bmh7memfUUB28ok3+W6Bq7OWSBImj+DNx2G291T4/dwp8UU+PzNyai27yqQCjFp+AjYpWLgHS49qrx73PPxPUwlhODth+BXjaO0TIQpf+7WjT44Vi7Cl5ANIoeSjfpY66Yhn7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(6666004)(52116002)(54906003)(86362001)(316002)(6916009)(508600001)(6506007)(4326008)(33716001)(83380400001)(2906002)(66946007)(66476007)(66556008)(6512007)(5660300002)(9686003)(8936002)(186003)(26005)(6486002)(8676002)(44832011)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ks2lEWFGaUBM2Lk94rHJ632Jb8ixHM4USOjBYGpFXLUF0ezerUqyp+U7pxel?=
 =?us-ascii?Q?BtIlkn4HhVhGCgMq5j9ahq2Ck8NqwHl3BJvJVShf3q3xh7Hu6B3Ut7TTq72L?=
 =?us-ascii?Q?qvsym6aO7UIvruY+hc/cCMD8i6XegHiAcPOccEyUj+KX4crYQvehDzsyiD69?=
 =?us-ascii?Q?8JmcEZCrVO3KR7ogBzVcOLbPHIMDWqI9/E9Ot5n9+ZY1F8i7L99GVvcVmjzd?=
 =?us-ascii?Q?WBkjdIiKVkrUPz8CeWx9EERWs2gIHgaP4dxyUnLJjWezH/vaUR42mO4zidPL?=
 =?us-ascii?Q?jdOjDOR88B/hWJ5DaTEvs94SSZzWlswQGO8rYaaUHaAFTXVDffG+uQnWkrsh?=
 =?us-ascii?Q?gs4N4BNTw5LBOwdS18hJHY6x1SxyeCZt0V9M5+t9EbJvk9stEqo0Ub8aruJJ?=
 =?us-ascii?Q?crVET7xW8ZultCUZsdhg/grFtmDBQXhTIuPS6IEuHdU2vNeniLxsNGcL1tuK?=
 =?us-ascii?Q?g+E8H9eQ6aLE8klunB6HzT5h7OexxIaSbJX54riCvtiLsvERmEEGyL6WOl7k?=
 =?us-ascii?Q?p/2V7927diNj37UAsfTz0CtpuTnEQvu97Aih7AisH/C/lgBppGSn8IO4sisD?=
 =?us-ascii?Q?9t4fw1uXpb7XIeJ7Kxa/Kl2mkohJItzpEqj1EoqNwUk9xvywOdb9mtwF7ux5?=
 =?us-ascii?Q?5uyLHmDoBBwHsDQ/e6ai25AEbL8pmqclJ+7dW5g3FT/LsLwmj/wjRVcqOrBo?=
 =?us-ascii?Q?mCCAgaosGo6Xhb3dUDH0wNN9YZssw8r5UVZJmitbqQFDnua4LLoDPNodmONx?=
 =?us-ascii?Q?r4lbrdwf46guQhRhwiJfRdzm/joJfxwykN/X6Qs2H0Bwqh8roWQrx3eDED56?=
 =?us-ascii?Q?dNFiJ+3/XOvBakhI856cM0v85n2rZSWFs3Yd+AqoxYnH3d3sRjGq9gkuLrGp?=
 =?us-ascii?Q?x/fp5fHk4RMvtG988lnRl6cVwVXjqAh+CrcCycIEiwyXdDDnEloZp8XoGI1g?=
 =?us-ascii?Q?niZEsV1P9XTi2xGQ+3xH+VYR3dhDfe/Hd2xNgdkufli+bnWBhedCAPOaOoQ6?=
 =?us-ascii?Q?kHeIuQRgvFkVoc2gltVNJKEIUuOdG/ACe+en+E7MuT0mN6lVvjkZKthpQYJo?=
 =?us-ascii?Q?F/DA5Yp8GPS3gUTFpaEVntdUG1N8cmP7Gp0uKlxsANUFhO9JpW5wiIwiGTlM?=
 =?us-ascii?Q?WCMrXNLS5aEH23eIX3Zm6MsxKYF8MD38UmDiGySJi/3ivmqv1oAXPgjCtGOc?=
 =?us-ascii?Q?JwfZM/wIPuLBbkv2x9BZ7fQOlCv4bT+UJhElKxMHn9y2CeO+aPIwWQu2DqiK?=
 =?us-ascii?Q?2fXOhJuXYfrCXrlrxdvF383UUMcri0hDuy+v6q+fo8Nhb9jQwRXDFwFe3vdY?=
 =?us-ascii?Q?///x+l8a5odk9YqxgwTJytM4vh5YGgUtidmvM6ZM9c852HnFEgcYA9jKP8zU?=
 =?us-ascii?Q?kSsXXVrblTt9cW1zE4gnxM3ShAP7zGJuJhYabdpIBSHy4a7FYPIY4fk7oU6B?=
 =?us-ascii?Q?pyradgRlubtYLt+uY0EUIyOcYghmn7hCnsJP5DBofkGJ3oCY8EqrooriEdju?=
 =?us-ascii?Q?w1zmMqq23M2lTLXZ4e88VnfLvw1FPadAFed/lcSPljvBhtoedLrZeHTqIiyI?=
 =?us-ascii?Q?yHYfTq7qoAv03SrbD7gJANoHhsejwdiVBAxX2lOz8b9cXfUEh0CxF6/qriDB?=
 =?us-ascii?Q?xIUHrPKBZjqojaZ1I/r9a9e0+ZyL6O/4dqgDS4Iw8nBzB30jf1eRrKh9wnrQ?=
 =?us-ascii?Q?iwNelCveFMhGft0yqO7I6PchaBX2HjfwEgrNW/ISkSAvEmjKZgcpiAKZU0EC?=
 =?us-ascii?Q?TwOdD+S6kl216vrKCluqpRmVhXoADxM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c469d41b-c236-4ceb-c239-08da3e49ef78
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 12:27:29.8799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jb5195GtL6j/A8Ey/y/edI4E7ID8+ymia8haygBNs2KnTE2KvqEEuz4rJjWIh8T6wp1uVDkzh8FCrjFoC/difg7f0UjuL7S5gYi0SQsGDIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2843
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.874
 definitions=2022-05-25_03:2022-05-25,2022-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2205250062
X-Proofpoint-GUID: rhEa4leU8C0R-wcUreSiDf3ybpEkQ6nC
X-Proofpoint-ORIG-GUID: rhEa4leU8C0R-wcUreSiDf3ybpEkQ6nC
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It generally doesn't make sense to use _irq() and _irqsave() in the same
function because either some of the callers have disabled IRQs or they
haven't.  In this case, the v_recv_cmd_submit() appears to always be
called with IRQs enabled so the code works fine.  That means I could
convert it to either _irq() or _irqsave() but I chose to use _irqsave()
because it's more conservative and easier to review.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/usbip/vudc_rx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/usbip/vudc_rx.c b/drivers/usb/usbip/vudc_rx.c
index 1e8a23d92cb4..d4a2f30a7580 100644
--- a/drivers/usb/usbip/vudc_rx.c
+++ b/drivers/usb/usbip/vudc_rx.c
@@ -104,18 +104,18 @@ static int v_recv_cmd_submit(struct vudc *udc,
 	if (pdu->base.direction == USBIP_DIR_IN)
 		address |= USB_DIR_IN;
 
-	spin_lock_irq(&udc->lock);
+	spin_lock_irqsave(&udc->lock, flags);
 	urb_p->ep = vudc_find_endpoint(udc, address);
 	if (!urb_p->ep) {
 		/* we don't know the type, there may be isoc data! */
 		dev_err(&udc->pdev->dev, "request to nonexistent endpoint");
-		spin_unlock_irq(&udc->lock);
+		spin_unlock_irqrestore(&udc->lock, flags);
 		usbip_event_add(&udc->ud, VUDC_EVENT_ERROR_TCP);
 		ret = -EPIPE;
 		goto free_urbp;
 	}
 	urb_p->type = urb_p->ep->type;
-	spin_unlock_irq(&udc->lock);
+	spin_unlock_irqrestore(&udc->lock, flags);
 
 	urb_p->new = 1;
 	urb_p->seqnum = pdu->base.seqnum;
-- 
2.35.1

