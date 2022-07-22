Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8219157DA45
	for <lists+linux-usb@lfdr.de>; Fri, 22 Jul 2022 08:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234088AbiGVG32 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Jul 2022 02:29:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbiGVG3Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Jul 2022 02:29:25 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8C7886C24;
        Thu, 21 Jul 2022 23:29:23 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26M6Sqod002651;
        Fri, 22 Jul 2022 06:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2022-7-12; bh=f8jxfe30XavxzMCVq0BSZ4xR1PtVGlKuKTTJfVqeqeI=;
 b=22obiOxh2vjsA3S6RNZE9N5hMrv1q9pG8T608iR6b7DFcAP+69r8l51wn8oSBawqOBwW
 ibnIQ2/IVGWX4vgz7C1tqvin6ZMvYwPWlbFsvirluN8J8shD3V21V+lHPgWC4GiIeuoV
 UbQTfP5mn66i6T8pOBUB520cO8fBkUqz7l/7xX0wDbkj5LLDT1ccdrknIyIWgPQetzJZ
 8vDxKB4SkfYg+svqJqvOWG2OvLsw726bWBuZ0K7JYsbydENxgKmdeFasaCdyo27c4U8Q
 M0EH4m8NB5TIWEzsfYd0l0mPfmXW/tqFgX/mWsVfANNyrL4ep1y19NDBe47//HQ3SweM Ew== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbm42pje3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Jul 2022 06:29:20 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 26M3K0Rd002589;
        Fri, 22 Jul 2022 06:29:19 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3hc1mdxnhj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Jul 2022 06:29:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IL6DVXoUGduIZVbhhqqt6gXS8x8L3CoBQXEenXAVC1s552ZYN4r8RIT3j8JrfRJLn0uNxPMskGO4GbVf3EqlfU4E1KDUY6SjGkQdiR0Bjp+HlWIpeF1MWpM8aBTu+LSIprfgeLgqQXZ+2pQWTa+sk7DTHuUpYd07SlCZM2r4WJ/wyAIdsbdUk7aIQeT248Z8VSoMqCANXHmBoTT8LEQ4+yBOm2BEJCP1uZgMynMCWRyLdoidZq2H7lzC85Qd92qNgr5gjoGceu+9lK8FA0XHJNL72E9leubKOZDj3SBUtbFWtQeq9raHXJcq1QBB8vw80PXEWbCDtu7lWxkv5DaR6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8jxfe30XavxzMCVq0BSZ4xR1PtVGlKuKTTJfVqeqeI=;
 b=afIXOgHXpO+l9UJR1Htcpks1rKCF9F0bvQepV7oo9JNTiIbOvsxUX5sfHQjO9GWO+UsE+YcQgznT18CaMPFzMy35Ag3mBcdI8yaO2VvaY7ZIK4aXYzX7B+d2t5ruDoI94QYqn1oyA+Sb615FhKvn4vi4mHkDxy6eCnQ2V3BKCGVltM9d/EnQTORDHZ+UBhAxernXF92reWHE3ZURFKqQywz9UcKRXkaIjD3MQ0jwYS+iOZ+dwqwxIb3qrwtJigClnKGjbn24BHE4vO86SM+/dNJRIZq21siW32M+tvL8CC94HXEYaqJEPE60FM9Co4dps2mts61WCVBlQXsrxy1XlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8jxfe30XavxzMCVq0BSZ4xR1PtVGlKuKTTJfVqeqeI=;
 b=tgRXKN4WL/2oA0ltqR+HJ+Vc7JDWF6uKj+S79BmNJVa/TdSx+mt7asGsozFjr3N3BRGVPz6O8PQwhg9/89qkwg4egXj1FMrxJqra9F0dh93PFNMx6TG+/6S2z0jXlYf8og5YP8eVBkLypFZ9kqwpajCrCMIEs/priSdnWFBgT8U=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB5744.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 06:29:17 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97%4]) with mapi id 15.20.5458.018; Fri, 22 Jul 2022
 06:29:17 +0000
Date:   Fri, 22 Jul 2022 09:29:07 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Xin Ji <xji@analogixsemi.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 2/3] usb: typec: anx7411: fix error checking in
 anx7411_get_gpio_irq()
Message-ID: <YtpDs8VsWIbl/Smd@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtpC5s4/AD8vFz+X@kili>
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZRAP278CA0018.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::28) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0780796e-5116-4bb6-102e-08da6bab80fb
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5744:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0XU9bVFKNHj6zEw+wgtOY21Y0O6zrr2uMsVI+AF/mNrJONskNYq2i3Jye0mn63Js6ZAh5KsIots6fge2LxyY5lZX9eoY5Ec/tVc9cSaCJEpE9NQSLuyyhP8MWfd22DEk38cgBcdraVqlL+8OzEIN6kpGMYm2dRCFqimB9Z7udJMxD8mqtsdFcct7U8ruRB2TlQugrKf8g22Rz/YVLT/TOtjco9rlAe0ild0kp5HkdtuFIvWhh8vr76KyOE6OFLuWM3aC3Kdag7iKmxha5Mfttve+UxzG3wwkNEkao9EvagKOgR5AnYMX9VOk1D2LmoaZ6qC1+TUlD/Rv2Rb+XT1xPs27yNUDdf+yHDggZSqhfsNtZI1+faQETpFEWAWFd9afYMrCDoGuSgRYLmqG7FwMcqcHgGDf25OYQAtI59LEK4aUaGULWyDwBTARfdmDgw4GaTDe0vSuMlyn0EfoTrrRwE+9KlUwgRkxPoNNM1Jxtipwoz/FuWiyrggMIme407Rc/AcgrCvlzmCRtIIRScGOWcR32HAb1ZQRkmAZTNncFWatPMmTqfQmwGQJq0PsrT+wEwxLItFcT7nl4w8s1YjmWNbFq/g8bZWbFQZ+J5Cxgzyt1kucB1fIDZh1XWDwAXF9syb0Hzq9KlfZciTbpgbXNO1l/sndHcv2x8J7+ARv4PxJtLoVJtaNZq7FuWD5/NPsKYjF/EG74GXtusHRdFr4DYTquKyE1TD/xJhMtYPnHMbR+pwomVVMG8fGXy+xbmhG0BeewoJ0fjorbzABT2y6aSeEHoYqzKf2ehL3Ml+2bnih9+IFjV3a4g4/7wk5D6EI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(136003)(366004)(396003)(39860400002)(376002)(346002)(84040400005)(33716001)(86362001)(38350700002)(478600001)(6486002)(38100700002)(44832011)(8936002)(316002)(5660300002)(66556008)(4326008)(8676002)(110136005)(83380400001)(186003)(66476007)(6506007)(6666004)(41300700001)(2906002)(26005)(6512007)(52116002)(9686003)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cBXmUcZLxEhkmgHWSNpMh5dGUuH23ndhVmcXBpD5f0EHEEIOm5uFM9HgLtab?=
 =?us-ascii?Q?Lk5zaukBJbEVSbKC00EGFfnZXQf07bpNvdtIHQ7dQnbk4AKAbblmsp+FMXY0?=
 =?us-ascii?Q?btmQrXjnNEC1v1P/MbJ2xpm3hTp6eB2pBFCZ0RxIZ4QNfXAoRBgwydtNwO1w?=
 =?us-ascii?Q?PD1kxa2WgRnsn1JWtzKVg0XQmaV3fpJXykqsW6tfhs4FrQ3IiLOUtdt0A51H?=
 =?us-ascii?Q?L/Ntt2YWOF+R0W6HcVJdJjHCdJyZ7enL4tNuWaAJ+hiWslvEy2guMw1MZElb?=
 =?us-ascii?Q?cODyVKGz0w6lifosc0bSZUo6bdTbCfaG8HQTke+bR6hL7lJO3HWjoHXyybkr?=
 =?us-ascii?Q?wZ0O9BNlDl0eZaD8Hx75ePGJfrDqUcP5heZy0SQm2gJMnaDq3hGhMn8G+Szz?=
 =?us-ascii?Q?1pv2D+E2LBBvg5S6m5DRb41ZRM5GJfdYtsFFTTB7ldqd6rWPxPnj3xzDagB8?=
 =?us-ascii?Q?KAW0RHP2NhlD6lSvhOVs8ju9ldmclcc0PistwXTlz6HSDeGZ83kPwRfVHW/s?=
 =?us-ascii?Q?zXepRHTrpwUSiL0Iz7huU0jce+KO2KldI+lGHjzVD27s5K4jnGLkfP3MPuaM?=
 =?us-ascii?Q?+vvPNia/L+NqO4HDnsl782XQEImwKyr3VBNfbYkGIYhXuktvCfY9Cdk8k5Xl?=
 =?us-ascii?Q?6LUqIoDojVlL0io8wE03bFIkVpIKv2tf08v3137yyIo485IMQvgJ7PTf3Xm2?=
 =?us-ascii?Q?+pVourBlaeJ1kA2tx1s7Up6MGsMUcuOpV1rGtWIBPM3WZLdvRILCiRQv06ov?=
 =?us-ascii?Q?7Li7vQizFHGkmMwkU9/pfWXIWLOnig8LIzkyoJIT9N7jJeqnuwjJmChE9HiM?=
 =?us-ascii?Q?P/jdidweaGa87g1ql7l8wVQLTnIh2iDFCzycYpylaOBVZNMhMQdtwsk6WGe9?=
 =?us-ascii?Q?IFAYXVa5DptcDuTHWrWA39ho9gLheyXabJy9BsZco3htuFCPOoNh1p7d3t5V?=
 =?us-ascii?Q?AXxHv0qx95Pt176gjGQ5uvEGnUvflcKm/ev16gf98EfcfFtXJ+Aynz8kf5vy?=
 =?us-ascii?Q?ryWorSTc/CDfn9JAnRKjxLoWk6fqwA5c/H/i49PjkWZn5uud2GrTXrNayEK1?=
 =?us-ascii?Q?KmmbgLQqRMRyPhpI9/2VCWAw8/aZptbcIIzOwl4r80m5rJyTEaJ7b21cSJMi?=
 =?us-ascii?Q?AkfkKpfMpIdi1XCb7IttQ1FCnuAPbtIM0eZXOZShPWIu9x/ZG2PXT39/mFRA?=
 =?us-ascii?Q?RQfx3wCkvl1RJtGIOXfWW0nJ2ef0Sqe/U5qZdYrPqFHSjx/CvyjFovMwfH6D?=
 =?us-ascii?Q?XqI94hTqmGqW35Aw4SFBDo9GmimOiltHSbk8k9TVIp5oU6M3FOGEg7PwsnkH?=
 =?us-ascii?Q?yaDBhAl1uvPwxVh7ai4lrvNyZs0mcc9H0NA4xFERA28ZUqERPtt8iiy8bn5p?=
 =?us-ascii?Q?jMznhgLRgqvHAnbRgWWrCfk5kD3HZ6fGg+zJ+84ufO6P4gJAYQVGLyNBc6JO?=
 =?us-ascii?Q?ozeBWA8/nnaDpd2szRtYCU0KOWSAQBovnAOzV5w4Ki/CTFOiBGBMy/1nOv/G?=
 =?us-ascii?Q?cqtMlMzUp1+o6PccVX59i0TkXQxn6sM3Nb1kGYeHzrtpy0lVvfEgWLcrzjOZ?=
 =?us-ascii?Q?TR8s8+YKp1luV5eLyULSdE2/dyEAgTE3HvvaM1RWdxre/NoOowdDN6g1fJwx?=
 =?us-ascii?Q?nw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0780796e-5116-4bb6-102e-08da6bab80fb
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 06:29:17.5269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZMNO5YLq3lWURYudLt96sUDg9FMzQNWHMvm8NDaeyFDCro34vBqijnEgAsoGX8Sj1GSLIlmeg0u6R8Wf4gA3nOvneRhVnw1M4FmAs3HmAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5744
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_28,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207220026
X-Proofpoint-ORIG-GUID: NX4hAv9EWKD6OLY2VLJSfTzDtyyRxApQ
X-Proofpoint-GUID: NX4hAv9EWKD6OLY2VLJSfTzDtyyRxApQ
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a minor bug which means that certain error messages are not
printed.

The devm_gpiod_get_optional() function can return either error pointers
or NULL.  It returns error pointers if there is an allocation failure,
or a similar issue.  It returns NULL if no GPIO was assigned to the
requested function.  Print an error in either case.

The gpiod_to_irq() function never returns zero.  It either returns
a positive IRQ number or a negative error code.

Fixes: fe6d8a9c8e64 ("usb: typec: anx7411: Add Analogix PD ANX7411 support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/typec/anx7411.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
index 4f7a5cc968d0..311b56aaea9f 100644
--- a/drivers/usb/typec/anx7411.c
+++ b/drivers/usb/typec/anx7411.c
@@ -1326,13 +1326,13 @@ static void anx7411_get_gpio_irq(struct anx7411_data *ctx)
 	struct device *dev = &ctx->tcpc_client->dev;
 
 	ctx->intp_gpiod = devm_gpiod_get_optional(dev, "interrupt", GPIOD_IN);
-	if (!ctx->intp_gpiod) {
+	if (IS_ERR_OR_NULL(ctx->intp_gpiod)) {
 		dev_err(dev, "no interrupt gpio property\n");
 		return;
 	}
 
 	ctx->intp_irq = gpiod_to_irq(ctx->intp_gpiod);
-	if (!ctx->intp_irq)
+	if (ctx->intp_irq < 0)
 		dev_err(dev, "failed to get GPIO IRQ\n");
 }
 
-- 
2.35.1

