Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (unknown [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24847533CAD
	for <lists+linux-usb@lfdr.de>; Wed, 25 May 2022 14:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236374AbiEYMan (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 May 2022 08:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbiEYMal (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 May 2022 08:30:41 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A506D3B7;
        Wed, 25 May 2022 05:30:39 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24PCEAJp029544;
        Wed, 25 May 2022 12:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=YYhfJzmXQH/RkrhpSlNm6g+cOhnxrPT3K0/I6wHJpZM=;
 b=YawDZwMVZMJBqkPPxRA9AGS4qKSyu3skSc8pNY5RGirievHsi/HSMUiNHLy5caLXa6YS
 /Sk6VDLBvk6QjKGm7L0k85bxVjNnApGW+fJ+PoEGcDrl9ZE4P0HUSRv8VM3HanT2aDWl
 7CLdkppXvoNxoF+ThOUDe0xH14iRKV0AhRcg2uS8y0Fkb1iWyh5cfJpDwz2QoNYJYg6z
 kW9od/fxYWPWe20QpUng7a8rnMM16x56DUo7K/Ud4BPL3njWrvI5QvGJd0LQiU0JjUxZ
 pz8ARKzCPloRehfhaQdoMmcb1N5CJSD/GBh6hS+MKWW4H8dwRFg73g+UGi1mPc5Tffqo xg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g93tc21ka-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 25 May 2022 12:30:26 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 24PCUBrO002561;
        Wed, 25 May 2022 12:30:25 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3g93ww8204-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 25 May 2022 12:30:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7GUOAhpeyPsSfEt1rWmOtimwBv9sL5d0zwy5jsFPNEjVTVaFACDr/y2A5c+LgOJLueQ7LjM4WcvQTW9nzZ9+5WJyNwgB+bThzXgqIkWB9ENltwgadIhPEk4LGA/XqJ4dC5pQZ1ITYgmECw0Gj8PCIPYHHacngjnMFl6TSXpPGq9JEN5Wvz0+Cm5WXEMOMiZiBA1CZaJUcQYs+CJU5UhALeCjp0d8sJi+yUbzce7M3OxybxSZ32iNi+1jWOLCRpEbQ/RHZICl6uUuQ81pZjWIZGluKkwY0fXJ0Br03GapZVvLItCBPwf5gxeDnuO0r5VXExvp/4WRzH4Qg1G065CXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYhfJzmXQH/RkrhpSlNm6g+cOhnxrPT3K0/I6wHJpZM=;
 b=lv6MwDOPC28yGmUvWRnHyi98mrk0GPPv6zKd7GQb7NyLOcs7zMRO1NtPA8K0rWUZM4PB29Inz5xNXlo1TS3Jud2r6ouQV4BSjfjASdFugEESr87ZTOxe0lmrhAp5jpSV4j83lPfn5eH1ZmXRJbTrfJe6UlAHSHfikEiiSWgcC7z/0oCoheBek2bcyKj03IZJx84Xs71CG8XdnVbabBn8xD046qWXGPoVLNS49C38oRrHkgPNF7ItDxUEwE3yyeNLwHD9YI2WZPwRK/MzVS6f1C0QegxcdlGJoyKTSCPkkC8s+WlYxrjeq0zIuPZciEjKIfQMRPj8rcBLgMp99ZXeLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYhfJzmXQH/RkrhpSlNm6g+cOhnxrPT3K0/I6wHJpZM=;
 b=DChubd1+a5AWL8/yBi0VVL/+4+ncQvRIvzdRFW6PYcTZpW2c2YnTAAbwE1ZXajKfG5g1AOHCkD7XS+FLLPAgG7XiUPn12YzBaya1rDU0kSEyb5zprjRdtaOrBWlHcJfG/auT51U/RHsQd+TiMaSxpVL4Is9/XkVUa6VjIhV6uWA=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN0PR10MB4935.namprd10.prod.outlook.com
 (2603:10b6:408:128::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Wed, 25 May
 2022 12:30:23 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e%2]) with mapi id 15.20.5273.023; Wed, 25 May 2022
 12:30:23 +0000
Date:   Wed, 25 May 2022 15:30:13 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Igor Kotrasinski <i.kotrasinsk@samsung.com>
Cc:     Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usbip: vudc:  Don't enable IRQs prematurely
Message-ID: <Yo4hVWcZNYzKEkIQ@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0145.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::15) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3067c6ff-039c-47cd-f7e7-08da3e4a570d
X-MS-TrafficTypeDiagnostic: BN0PR10MB4935:EE_
X-Microsoft-Antispam-PRVS: <BN0PR10MB49359D3E2DE03BE12A36AE448ED69@BN0PR10MB4935.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hFeMNDzskJcryMs4RgK158xHfz2z86Tf9KAHntfUmsK720qHa2z3friz1EyuOGH8eGuWlEAtWEvRwlXQnkeNmljTX6xCD5Da3cC3ivo+cD8P4ppEOn1Ya+4fLL48hZErf5DUdEz7FoWAAsqamBvZGykUhSWnt9rWq/7VT0Yj+ZdxScLEDIaYzLlunF7uTdTH4MSz/KcmzaxgTTz/S06GSbQjr0hfrxIZT61sgBgt2GY0K1eztHYnR2FgrL0ExVNn06VXTczvp4iMK+kGSgRyKB+E0CZQlUoWZ1949je4nPP6az2+M6qggM/Lh2ST0fJ7dtTheIUseepKZX6raM0kxqSMLjx82Db1Ki3ELiSjaOUMAUJ82S6JRlfsqx/Y0M9rI0Hqlci6f+3GQX9QMETQ/FOkRQpAcec6Nz36staaEASXH591GkjixROYAJZsRcdQHHU/nkNAmGAHxXRsG6zfYpQP9VL5uI9ZmcV7asb1sAzpFn/UvvtXl88kluTdX+hoqYS5z1s/hIzKyiZFIPyq7QyuaWKxmQm869+KzRL09w5vtSkeY4NGh8jIu/vZmsTzZ6f7Qh/EhP64Z3hY4Eyc0pqoq5agHAwaBiPWPDr5uzKmYZ0qqLIBsK9jOOtZnFTvN1hu0bpxSBysjCIYiVtgJ0/SvMnZgBRgznFl+kzw8PSOW4uyrHOEw0VClunq17TL7T4q5KxbwICv+ckbi1COtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(86362001)(4326008)(8936002)(5660300002)(6666004)(83380400001)(6486002)(44832011)(52116002)(6512007)(9686003)(26005)(508600001)(6506007)(54906003)(186003)(316002)(8676002)(33716001)(66946007)(110136005)(66476007)(66556008)(38350700002)(2906002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bT94PR1Bv39C1BNlOjb+wBdk6z1RsCQONl2bnL1urNUXjrudZ8wMl62YPeOA?=
 =?us-ascii?Q?2dvopK7O3CiJ9gExXvBsEeio0ZwZFVtFCd3LZTcGdSzWIdb+shglN+QRa/tN?=
 =?us-ascii?Q?htAqpR8LNKIP2U8FYBKKlreeg24Xb4VvAhh+/csvDII7d2dgkNE+6LC8l53/?=
 =?us-ascii?Q?545LqSipczblfTvUq9pKQp+wtxMxfw8tpmFS2aEed9YzlHA2njUow9YVtCCU?=
 =?us-ascii?Q?jxvUpOYMzfOkQMm7MRU+OMaYbXr6OkaphHgXdDQSjf2eAknL+X8UVXWI15mS?=
 =?us-ascii?Q?QtNGr84sGrN4XvBjU5ggILt1lO0kIBVweORcquxlxX0g4boJQ0dkLm1PszM8?=
 =?us-ascii?Q?lMeQdxF8aDutUF4HZvwKDZ0MRcjRM9NHCv7dkyP4FFSEjfjeSV3Zup3kD+ww?=
 =?us-ascii?Q?UBwTMsDzRpc+3bxXovrHnYZamrZyTNWNcO6m6uUUnaWaNQF0kC43Hl8HsBtw?=
 =?us-ascii?Q?7WDGjHRzoiyZapt9iCGd4R8Ya0TDwVaNl9RCslCI1AQw6VmhVdraYV2PbkdA?=
 =?us-ascii?Q?aJHakeoUQfIcabYXEcig0eusDr22uY9xr17eatoaw2cEqKAgHjL33XfLhSiZ?=
 =?us-ascii?Q?60Mfd4tGgk8MFRdobaQprbGy6cREHtO73ZSNzox36gINZ8WhNsU9QH15zHMY?=
 =?us-ascii?Q?Jv7+5fsbDObDQNy4J9VrmnWDdajdfJmxtHORkQBUZUjTaO1HD0xbnwfx08h2?=
 =?us-ascii?Q?STYl3dXdruOAaamPskBy/PE/rdH+tCMk2DsZapw9LhBqwOG5av0xVDr7JxBz?=
 =?us-ascii?Q?7K1FMMOpthiMwcFzlX/H64tojcWX6fF5fwobI7P9cIbuMGJKuXmi8CoIzogH?=
 =?us-ascii?Q?ftnNwum509tSj28UxpU1eIOZRNYPrdF+td2J3HbROmrklIQ956QdIMfgPQf1?=
 =?us-ascii?Q?vGn+sCYNBmhwPs7XteFhlCOlmnVTfTfwWD/z8DAAjxkt8p/R8K/qt1b/kR+s?=
 =?us-ascii?Q?RRTlD9AZor/mRUuVBVo2c3NmKf7JeENRGKDdVVv9z+/qC3j/3QAz4zwiSCYo?=
 =?us-ascii?Q?5pUU/eDIRgU1tZVSm6f9qeNKr6aADZrALrlx7PIWSSPX2pDCpmOfN6pN7WLV?=
 =?us-ascii?Q?HQZt/rmLRrVDiZUSja33KWvqpMDiiKSMs0D43f+N13VBSsS7OAk03RklCEm4?=
 =?us-ascii?Q?ZJ6Ey1/CfNHdDl47yN+wlCKexnOq9gP9FP2KpEMTph9riLC0ckbONzFuph7f?=
 =?us-ascii?Q?H90Fe/tE8LKLFdhOecD0ApYyvJExgyxkI+H/aOIx62I49rV7rq2r0Qk5+Jqx?=
 =?us-ascii?Q?YxO95YYNAM1yc3S4M1MDOwCY5OD1Ee8M46zITzqiLBj1iT/k4hmx1Zbrwwfy?=
 =?us-ascii?Q?iB6lIZuLko7R4KdyWEOvlNkJSBdNnLTmNUIf/j33F2f5kEwpIeI10H++7sTd?=
 =?us-ascii?Q?6eSIjg4D/ztsxpafkKi0bQYrkgc5LABaDysEM2LOCY37zkHC3p47bPZ4FcdQ?=
 =?us-ascii?Q?n7wXVEBpuxMOc0tWs19Oy0OuWuOScsby7CraJjFuS77u7UNHcA63qHVJNovH?=
 =?us-ascii?Q?Vh0bmf6D2OT2xKIfzsN4j5vFqJ9M2wlDdTZu3VeN5Tg+EHSguaadfCigV+aa?=
 =?us-ascii?Q?3t8UeuPVWZkV/42UHrMpdN2pXOXa8/8F7We0Y1w5IvarmkmCI4Aj7QFgfmz/?=
 =?us-ascii?Q?fUHD7VtyycuLuQyrK8W7UiSlRMs9aum/0xjs17si2UbwgvREf1ApJO3Fw2Ft?=
 =?us-ascii?Q?3XfPu/a9H5EdSuIwA9fN2STPCRwtbLkwuEwHXIGEgWwT1CnMkJ2aEx6kkYEO?=
 =?us-ascii?Q?YiQqhNat5oa7VeLLhE8ZoHfIgkMHKm0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3067c6ff-039c-47cd-f7e7-08da3e4a570d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 12:30:23.6787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ArERhYiLcVW/mn/N4S0YBF3OTB/ws4QUhirsQ+dDMi7lZbFWoo3EpiiNxYW1VMpu2ZsnM+M05nCxW1uviHFiQ+UrA7I0kfIfjau8AnwzxQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4935
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.874
 definitions=2022-05-25_03:2022-05-25,2022-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 mlxscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2205250063
X-Proofpoint-ORIG-GUID: qGIvg_UIiZJwBYRdZlULOewr-Cizl64W
X-Proofpoint-GUID: qGIvg_UIiZJwBYRdZlULOewr-Cizl64W
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This code does:

	spin_unlock_irq(&udc->ud.lock);
	spin_unlock_irqrestore(&udc->lock, flags);

which does not make sense.  In theory, the first unlock could enable
IRQs and then the second _irqrestore could disable them again.  There
would be a brief momemt where IRQs were enabled improperly.

In real life, however, this function is always called with IRQs enabled
and the bug does not affect runtime.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
An alternative fix would be to make changes below and also change the
outside _irqsave/_irqrestore() to just _irq().  However, that's more
invasive and riskier with no upside.

 drivers/usb/usbip/vudc_sysfs.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/usbip/vudc_sysfs.c b/drivers/usb/usbip/vudc_sysfs.c
index d1cf6b51bf85..c95e6b2bfd32 100644
--- a/drivers/usb/usbip/vudc_sysfs.c
+++ b/drivers/usb/usbip/vudc_sysfs.c
@@ -128,7 +128,7 @@ static ssize_t usbip_sockfd_store(struct device *dev,
 			goto unlock;
 		}
 
-		spin_lock_irq(&udc->ud.lock);
+		spin_lock(&udc->ud.lock);
 
 		if (udc->ud.status != SDEV_ST_AVAILABLE) {
 			ret = -EINVAL;
@@ -150,7 +150,7 @@ static ssize_t usbip_sockfd_store(struct device *dev,
 		}
 
 		/* unlock and create threads and get tasks */
-		spin_unlock_irq(&udc->ud.lock);
+		spin_unlock(&udc->ud.lock);
 		spin_unlock_irqrestore(&udc->lock, flags);
 
 		tcp_rx = kthread_create(&v_rx_loop, &udc->ud, "vudc_rx");
@@ -173,14 +173,14 @@ static ssize_t usbip_sockfd_store(struct device *dev,
 
 		/* lock and update udc->ud state */
 		spin_lock_irqsave(&udc->lock, flags);
-		spin_lock_irq(&udc->ud.lock);
+		spin_lock(&udc->ud.lock);
 
 		udc->ud.tcp_socket = socket;
 		udc->ud.tcp_rx = tcp_rx;
 		udc->ud.tcp_tx = tcp_tx;
 		udc->ud.status = SDEV_ST_USED;
 
-		spin_unlock_irq(&udc->ud.lock);
+		spin_unlock(&udc->ud.lock);
 
 		ktime_get_ts64(&udc->start_time);
 		v_start_timer(udc);
@@ -201,12 +201,12 @@ static ssize_t usbip_sockfd_store(struct device *dev,
 			goto unlock;
 		}
 
-		spin_lock_irq(&udc->ud.lock);
+		spin_lock(&udc->ud.lock);
 		if (udc->ud.status != SDEV_ST_USED) {
 			ret = -EINVAL;
 			goto unlock_ud;
 		}
-		spin_unlock_irq(&udc->ud.lock);
+		spin_unlock(&udc->ud.lock);
 
 		usbip_event_add(&udc->ud, VUDC_EVENT_DOWN);
 	}
@@ -219,7 +219,7 @@ static ssize_t usbip_sockfd_store(struct device *dev,
 sock_err:
 	sockfd_put(socket);
 unlock_ud:
-	spin_unlock_irq(&udc->ud.lock);
+	spin_unlock(&udc->ud.lock);
 unlock:
 	spin_unlock_irqrestore(&udc->lock, flags);
 	mutex_unlock(&udc->ud.sysfs_lock);
-- 
2.35.1

