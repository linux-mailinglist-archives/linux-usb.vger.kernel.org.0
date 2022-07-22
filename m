Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4914357DA3B
	for <lists+linux-usb@lfdr.de>; Fri, 22 Jul 2022 08:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234135AbiGVG0B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Jul 2022 02:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbiGVG0A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Jul 2022 02:26:00 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 149297E007;
        Thu, 21 Jul 2022 23:25:58 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26M1YFuO024876;
        Fri, 22 Jul 2022 06:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=Gnp1G5eDmDAKOtKSGwTf7mbuU+MIncH1NaogSnqegkA=;
 b=qpv3xoCPhpNwnQ9PIwn2S8id7eR6ImoxZptubLynHjyBNnUj57ljwwCayAuhJ2NFOpia
 OyTCcRqiErXu7PXtIMU0QECKq/ljNV4F/HrazHpMsDpUfIKEm6J1Zb4Wp6G1CRKtQ+Wg
 v4mTGkoCYMFEMFr/XaxW3gAnh9k8QoNH/TyMh4CoFoEqbOQ/2FxGI8+FkiDWgDmup5L8
 bOS8fY2AUeN0suZ4wKbWX3W+Pkb7Ud4epvQ+XQLtkcK7ZTbNjBMybJpTapx3+CsaIXxo
 cQX5uS7kBIUJl4nvgsG2fBjTowxouhRhKDrvZeLdqNYlSUJE+Je+e0i1rPt5zS6HEbWQ Sw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbmxsefx0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Jul 2022 06:25:54 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 26M21pAv022262;
        Fri, 22 Jul 2022 06:25:53 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3hc1huqehn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Jul 2022 06:25:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPTNXTtWnMRH0d9hDnjjmSxXjjdSuXBqWa+ImA/xxvCVPK+QGZQRwbkMhp5LdtX3H3bEHRW8Se9RCn1eJuNKpBa3zlPYrrVlLmvJiPacd/Ng0PHlo/QPRKnmE9B6I8USVowT9JNPMLkpsiYvt7gZyN+3d2jIhO+Juz1dKVwJUI2bHRbtpEZgtX0Df0gunzeQczmj3UoTNoHebz5QMzbHhtfr8vqBbSCXZvLo132GrR6k9ijipeYbl4FJVldpvlMp+/In4A5qt2Y34qiKgservt8iSQAyqGaJY50RQruL/474PQxjj9LJngG0Nel4zi2vWC9fOZgx0fJoJwZztAmrQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gnp1G5eDmDAKOtKSGwTf7mbuU+MIncH1NaogSnqegkA=;
 b=COsyPnM5PFdcgecD3F2+JEcb7PofCND8Xu1exkLoKoLkUdnLxZVKUtiaDBGiBHozHwupsF0WZEpYAbcTCInkrbJHUo5SGQ1b2+SSgaU4+rUCWrbKklR8491hfcARDZc6rOCe2h7HzyOYWHgIIz3gZVu7h9NdP5SfpjWds78TcVpKcnVNpxqNll2cJ81OZ/v30LDzaCqB31FeWVoHvfKBbJyZ4QKKFgPT2Xjz9BZopirHYkpXSIJB2JUPErUjHD3U1RqBDCVfm6jbcoJhpp6rB/2shwzIhfGDQ9rDbxcdvhApcG9QCLnMad2JLcM4spu7VE8GZxw22PJEh7Y/qWG9rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gnp1G5eDmDAKOtKSGwTf7mbuU+MIncH1NaogSnqegkA=;
 b=semVo7Xx6hAfEU4r2CtJ8QKDv91TV/d6IIXg9aUetFTyeoDgcjBmvLAE150jQw14mvhUicmfsrZnJUKFfIUJOlVC1tFdqHvLWzljffSS1CmesEr7IzvDRKsLgiBQkh/N3ig9DOpl24J69csjYc3wowAPSukHOBKNld+1Rke66cQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB5744.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 06:25:52 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97%4]) with mapi id 15.20.5458.018; Fri, 22 Jul 2022
 06:25:52 +0000
Date:   Fri, 22 Jul 2022 09:25:42 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Xin Ji <xji@analogixsemi.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 1/3] usb: typec: anx7411: Fix an array out of bounds
Message-ID: <YtpC5s4/AD8vFz+X@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0029.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56efa058-bbbd-41eb-4bb6-08da6bab068a
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5744:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qWZu5p+Po2LXI8wHYJMnGpIDB0wwozCuyPjdf6PAI6o28Q+AoQjZUvhr5W2LPkm7wePDstJ2AsAifwoaKkR3h1IW0XbAFAPeD+uIcBOKO7Of6loF2JgKz8DPa/Lj1B9U90svqdTxCFEOB+Os2faORYa0rfyog7zn9fhGNJIXCgpTb4ZOCoSf7QSksQhovML9fQtQXGn4lUTSSAlqgHsqFh1ie+3G/R99wdiCabcBmy0cb6PsnLCqyvw25KAR8dEG5asTfZ5UyPLN7PaWDyMiHAKFHA4wZJYMkfkr3czbX0xgskcTlagM6ObfaV5PHeSTN01auGxP/yZGK/ydoaD4z9j+FnbozwgJ0khESra0W+y3hE9laeZzFLUpHSzet5fvlKWrEeLKVFuJ5ULaQyV/n9eFIJT4vY1GKcvBxrbh53wowK7nVeVn/fZiyYgdBEWljepgQgY2ByE7VgauZ2mSFN4T1uNuBzgVYRneSxvM4Xlzxsxvd/MYdwaZbjhrKSyR4F09laqRwIebZPnSu2/7ZRTzhMD8fnBOvlrk/NX+gmxd4nNC+qRrjWYyidb770MADYUC5+/cVkoCTjcuyimSYbexmKlIV3uDX6//kCqmXuS0lhucKGwxFMj63lbPopsQFAAFrj9qPW9paLCMHVDobFUa++JWXT5+Ggi86msuMjFGBDnqFU0SnRB0x4lAp9zAWw2ARQ22puo52LLOnOTibKfRYq4UFaGRnVpwYEyquRuiROCNmgm3KPnNLCOxBAxxMCS+uciwigyWNAU9dNZOLH/+tzk/9Y2TviGDEJL6+eYnaUa1yy7MKoxIyfewP6gJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(136003)(366004)(396003)(39860400002)(376002)(346002)(33716001)(86362001)(38350700002)(478600001)(6486002)(38100700002)(4744005)(44832011)(8936002)(316002)(5660300002)(66556008)(4326008)(8676002)(110136005)(83380400001)(186003)(66476007)(6506007)(6666004)(41300700001)(2906002)(26005)(6512007)(52116002)(9686003)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8ZKkgRgCQCxv8shF3K+lyaTQHMjtlmset70lH/1tNcvvFGYLGg/8luCnFiGc?=
 =?us-ascii?Q?iJdxHbpAXhip/e1Zfq6o4yT97Oi+P+/0AaGKCDv5UGExp9ORTDsm3YdGs+cJ?=
 =?us-ascii?Q?nOHHUSFihAVAvcxfAzc9/fro/lOCZ8/bWlzKu+Nq6vctYFBi2KIZmwc8y+da?=
 =?us-ascii?Q?1yvq1m74iC+WhRVJ9+9t+rexypZ/wai5reDYwUcoBFq2uS7lXvanV/dcfnSB?=
 =?us-ascii?Q?Jh1jBBjo1SIDQg/QNpkupGn32TNOt6WHkzgsR8FholGJ0EwhCvRyAm+wDcn8?=
 =?us-ascii?Q?uurAqmHzljIqmcbx9R/JIDCydeOFRiTNyzNv1e46cCaNsZ65vjy3ZAkgt+HN?=
 =?us-ascii?Q?DUdaO6B4QZe6FT0WAU73l5OVNFu3u6P1AEUiqluGJLrWeOQfsDyCLVWbGdrD?=
 =?us-ascii?Q?u2xSj87IyotdWtmKLFUF6fKruzyHdFi34tkkV/eP+4ErwQVpIIt/KkjhzjB8?=
 =?us-ascii?Q?wJQUbEzC15rreJxeGEjMwuh74YNWdWbtmT+vH5sEtEu9uDDRxJm28+8eVdjg?=
 =?us-ascii?Q?HiQ3R0SjZQtaEDCXyIEEL7J9ExHTKUW0Znz9Bc4IoSW3ELNzVqQco0y5BFKt?=
 =?us-ascii?Q?61k+QonBBMJ6Nt0hFo0hMJcgpwjA/5AVqTgF62IgSBcZG2BOvmPYv2m1hp/+?=
 =?us-ascii?Q?X3IUA6Dlck5CbKdgffy6ahaO5ZhtVQqXp23zOZg+RFGkk3sH3VQSvjgnVHLv?=
 =?us-ascii?Q?DFD/s5Ts6WjYLGA7XDSw/KBph9t1FG8/1/HOuLtfuOG4QT5tCh/NmDx144ae?=
 =?us-ascii?Q?CV99TpnRKHhyBvYQa0wVE6SFLHpztLwDgLmyfwks3sPDlQL8Su2QD97JdigB?=
 =?us-ascii?Q?pBmtNiX0kg/oQ6mF9ZnSt6okht6JMR94y2bjVpwBU2HAX1FAOOUj6iHzhADw?=
 =?us-ascii?Q?SlnBFIspyT4F5E7uAdcUPiCj3VtSXL4t2sJHcb0Ou72+WdAB7NFpM12O+T1D?=
 =?us-ascii?Q?i925G8tGmHKGDvDXiju2FA65I7SnjHsJbnP2esalMC2hW9iCrxXDHNwejWSY?=
 =?us-ascii?Q?oyL/t+0wiPqQV1nsE+WrlITAGcvJD1/fzI1In3EhXm8ztUCJnwe8RRr80mKC?=
 =?us-ascii?Q?SNnFKIOoSfNzt6aOPueduI3dNAxtKexbXVH4VPvFnHJEqif/w6sQcja6+3Qj?=
 =?us-ascii?Q?tOeXfwm6LDJeLSnmfQ1qiEMsEYtEof/jEZcfHJJQhKKqzitU3FmhKPx1CiG2?=
 =?us-ascii?Q?y6sKxa1ZNVrtQ9t+KRyXZ2ys0qqq197ALakkjP3lo2ATMjxn7oIGVTarqYXa?=
 =?us-ascii?Q?jlgQHADPYaOxtgYrtT/SA890tsg3TBZayufJXb+lCqsIEMoU8AMz96qTwZ3L?=
 =?us-ascii?Q?w+c6pQnQadmSSXxtSgMuffJ62EtqLy8VUF5vPJltXKEO6slGrlD/e/kli52f?=
 =?us-ascii?Q?QsyFFma2lgfrNofRph4JlRQ0Kg2+6GNw60/1NiMV1V4tQAxXmU+bammtc2tg?=
 =?us-ascii?Q?NNrrwVOTbMg+s8H8Cz0UB9lQgMvW49yidnXLX+CmHE0CZAMmYfkv1JKeYuSB?=
 =?us-ascii?Q?jObVZp0hEdHYMSNeQawsqfEHhz70+DNUjT+zo0lScEWpNjwY8rgXDsZMFQfC?=
 =?us-ascii?Q?Y21d/TGXbLbZfUJ1dxw+xANutM7jdE++GBMKJS4wZfCLtixXuoTTvyn9WdsY?=
 =?us-ascii?Q?DA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56efa058-bbbd-41eb-4bb6-08da6bab068a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 06:25:52.1996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GV0XVKkfSfXzXp1r/PNh1CAIlHFLff4bRNy9g05CR+VCptYhj4k3ruc3THslhh6DcysSZiBa1BqY6c4LyeszS5lrUZp11SUcY9U5w0Y3VyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5744
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_28,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207220025
X-Proofpoint-GUID: UeDjDRYcAPP8khjr0mFm2aZhWc-sJIW6
X-Proofpoint-ORIG-GUID: UeDjDRYcAPP8khjr0mFm2aZhWc-sJIW6
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This should be ARRAY_SIZE() instead of sizeof().  ARRAY_SIZE is
4 and  sizeof is 8.

Fixes: fe6d8a9c8e64 ("usb: typec: anx7411: Add Analogix PD ANX7411 support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/typec/anx7411.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
index b990376991f8..4f7a5cc968d0 100644
--- a/drivers/usb/typec/anx7411.c
+++ b/drivers/usb/typec/anx7411.c
@@ -992,7 +992,7 @@ static int anx7411_register_i2c_dummy_clients(struct anx7411_data *ctx,
 	int i;
 	u8 spi_addr;
 
-	for (i = 0; i < sizeof(anx7411_i2c_addr); i++) {
+	for (i = 0; i < ARRAY_SIZE(anx7411_i2c_addr); i++) {
 		if (client->addr == (anx7411_i2c_addr[i].tcpc_address >> 1)) {
 			spi_addr = anx7411_i2c_addr[i].spi_address >> 1;
 			ctx->spi_client = i2c_new_dummy_device(client->adapter,
-- 
2.35.1

