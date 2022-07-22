Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBDD957DA47
	for <lists+linux-usb@lfdr.de>; Fri, 22 Jul 2022 08:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234151AbiGVGaO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Jul 2022 02:30:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbiGVGaM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Jul 2022 02:30:12 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56EABBE12;
        Thu, 21 Jul 2022 23:30:11 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26M6Sp3U002641;
        Fri, 22 Jul 2022 06:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2022-7-12; bh=AzRP7SU1XHBsvAe3JwIxh8R4qPtC0oVEqGXF7l2ASlI=;
 b=NEX1ulH5AdP7WpJBXrlwitaEOXrq6LOn/UO2+EpFKLLDiOs69V2MltMOTGs/fKcJhAvl
 FX2An722C0O7w7KPL3qoWguuljfooJ2YevjteoikzCb2V2WtFjJt/kSqazXfHvjDpBom
 4c5LU5xhmbybiD2BbJxSKQaFd2q7hDtCfxSTceq4mqLpmc5SR05baR5us2v3HvpeH/OL
 5vyAw/7KjqEQ73if0wa94RsJ65OhCE6NMxO1dYAZHG2Nr9OD05uhixZE1qOJqOTmP6i4
 Uv7oDO8n5em1YgHG4vSp1lSWLkxmN211DETyikrunMXbEAOCu+QW/B+EzPBef8MGM6A9 Vg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbm42pjfx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Jul 2022 06:30:06 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 26M6QPRB016513;
        Fri, 22 Jul 2022 06:30:05 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3hc1eqctn8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Jul 2022 06:30:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjRJzLi9n85TUc6DDy2kMfctp16NtqFPUT9b+b6LMbEEkkk1aVXcEQrWKlTNmylcRJny2J6eoiksw6Y4+wsUEp+AG9wKTJdynxSsff8xe25iiGhX4mdG2m1IpOG4/V05l/cOjQQvHkF5kImKOa9glPBXmTj319JyTBil3Sl6CdxwAAr+/BwG0FNndpsI1PjlGMimmCKrsF/zK7SQRdY4jndyze+cnsMUB2nuWhsP/8L0Jmq/svq0c07xIem+zwvyHg2e+mgObYDspPHgnPSFPJUJiIFNLEb1UPzoBIPmeM3Zqg8Q0Wm3ATehIEyYKPuYgDtaTTBqoJXLbcn0wVLObA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzRP7SU1XHBsvAe3JwIxh8R4qPtC0oVEqGXF7l2ASlI=;
 b=G9JjP1LaUyjWDl6u2jNeuUU4kDzHuO3z9lJWrrxJagjP0WzB0Y3Prc+tFQJcEqZ1zNeSxt/D2+vw2QxhYkWRXJVJitjn9Pg/heqrq90Kf4lTOlUVaTvYcule5ENuMjLNdn5o5RlsgHrDo46j+11XjRFgIcLyfFGU1N6+yLkyffsITomynVMV9/hR78xETHE/T3cW0u2XW33C+pxgi/z77NVxmQwOeWiSxy4Tm9bTpDY080YlWbHeX0qNSmPKIMK1HRElby4gGt87WxXaHUHZWU+kmOSOeqJ/ZYoDbnGQyNRl+UbAVFuRSASsQSk9JLwSdVTkTDVuiv6jdRN8/5jkSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzRP7SU1XHBsvAe3JwIxh8R4qPtC0oVEqGXF7l2ASlI=;
 b=Se+2g5D5c05rA1M+EcWh1/5sIzPF9EgxDFpUJvlbxRr2EhSMYU2aoWcqcU8TmYuKF8KxqVcw+Cb5d93CiN2VddSGt6kNcQ4wLNCU+iLRabKwMpz8FPnWETNbprO5Ipe3wWbGgWNnrkiUX7uadr3aNOKOMYeX6jf0h0tNKbecC9Q=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB5744.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 06:30:03 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97%4]) with mapi id 15.20.5458.018; Fri, 22 Jul 2022
 06:30:03 +0000
Date:   Fri, 22 Jul 2022 09:29:52 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Xin Ji <xji@analogixsemi.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 3/3] usb: typec: anx7411: use semi-colons instead of commas
Message-ID: <YtpD4MKBa43higNc@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtpC5s4/AD8vFz+X@kili>
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0079.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dea810c6-3780-49d6-6e1b-08da6bab9be2
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5744:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J4bGgqAwxHBmsLiGSJM7MMlCK4XB/oHNCF9RlvpFLAFgfbpGqDx3ZbXETmjFcozaX46lkBoAQRBH/mrag4+Krxx09+14y9LXq7QNZU6SyjUTi3jMvmuL2Z5SH4qheZW/v2antqVVLXMoU6UbjGHTCZMV0gh8cAYb89sBmE9M9hByKWVwNEyYyKMLTSSXQeuQ4LMJ7ZLDVb7HJQ/mx5/jBtLzah87i2cuf4lPmuXCckj12u3CwiO+Bl9eKoTy0JfyFhUhlwfx3x/efr7uCfn4v5evytdQ7E0XWzEp6QuFynoG8gwp/AUSXEr/9iKeaQOzQvVUSdskYRSLfFkYRLwLKqQZm1HqKevqXTRCplSxxlhpK9U9WTe9HKP6cqpqYSuvV7n8221lB6BjNAXw39zOvDEd9rvQUUSElPjvd10dRSFEAIpKRDes6wiSY+yVOiwPjQ4qVc8HCmkFdhMUVtoNhLIhuqcEErk/jpIscl5lErfwrSz6iQNDrvnR/1zLmNV2HPFGMhbdlb3TEWMrGLe44kiotRAduyPMGsNdIPl+/WWowpyx9ENYjhdOVmmbozkat24P84aSDV0Kom912USzSPWe6qZZQ6zk8/6AZH4RIj4WTxWHRF9gb53aFIp95v9TDeYZy1gm9hV4Idnll5SoQTOYSIkWzCj6Aq0Z/qLUWEhI7JZTLQpBW2UdtLOJXaVIY8bIeoyFXumgvhi61oGzsDGc9bEzKfvbOaA8DImbFFG0IZeIRcTpxpJe7TKeG4eZtphlOXu2RMiNxYBH3OuMUil0T0i1NipOpB9dYasTgpl71BAdTaloT+PC5JqgG1fU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(136003)(366004)(396003)(39860400002)(376002)(346002)(33716001)(86362001)(38350700002)(478600001)(6486002)(38100700002)(44832011)(8936002)(316002)(5660300002)(66556008)(4326008)(8676002)(83380400001)(186003)(66476007)(6506007)(6666004)(41300700001)(2906002)(26005)(6916009)(6512007)(52116002)(54906003)(9686003)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9fyvz90/E32D/M2AWJ06mhO7ZO/+bBnMCCFpfybe64+q6T7YIGmE28o2/lU2?=
 =?us-ascii?Q?zgV85h4CtPSVFherbCqHVuw6ce9dDTsq+eA6dDII6pPk3E3ffFn2jU/9t7cl?=
 =?us-ascii?Q?+FWuApp04hMtq4qT913/hTUGk6c7k9amZr1knR2GY8R6G0kx48qbn5zzYVQk?=
 =?us-ascii?Q?/YQta68GEWOquJVjj5CEU3HGhdjrUnShcrjW9VLCwWU6rLRlqHSkfC8c9hZV?=
 =?us-ascii?Q?hBSKrueYlv6pCGnYiveJf61VFUhXuKo/eESPPn3dlzRNTWd6/Akdjn/PrESm?=
 =?us-ascii?Q?KTij6EJs65skyTUGqTjrhlqkm3K0q5iKvskcFxzwDfB7Y3uPDiHzt3BHyWIy?=
 =?us-ascii?Q?We1dYRszYuDwmfIXxPitQA/VT+mbSxAdsdVy9dQzQsrIePGjR02hFk8gTMva?=
 =?us-ascii?Q?6tIqzlZirlpqqLXPtSWVM84Ij+txapezoJnxxTYCWYLZIWSJDAeCsHAlVZQd?=
 =?us-ascii?Q?Vo6FQpIC4MnCWD5cWi/4mcgr4XkpE2VB1siOhjhQzRmRACY0UbkHTeKAoGFV?=
 =?us-ascii?Q?3BQNwittV5Fz7zQO7fqpNUPzX0Th/HDK2yAIi+FMBsUxnFqVLPAUhYW7CEB5?=
 =?us-ascii?Q?hrF0CRtPCBs9GKzZgm8k4TMf2cJrBNvKteP+sVfz5V9pK8EQwUTm52Js+l+O?=
 =?us-ascii?Q?ZS+97JoMfum2iGOgmbYwzyu+UtJlodJf52kNVtToCrwEn6aSmyoVXsGlKXyn?=
 =?us-ascii?Q?rKUakVGyrpLArKT40Vtbl09KfbSc7FaWhwd8ZEKO+zOseQHoUHfUeKD1vCrK?=
 =?us-ascii?Q?SbbSeVNIYHSgVhgx9nXc8yY+/1ccrXwrxdd9WfrRYXdOv3PI36PDEvo+e875?=
 =?us-ascii?Q?lmVvuFDbgedIbtcjki6/1c/Ceo41lFzF+Wnvqd0nQf6xqm4r+8HyYhxEihOF?=
 =?us-ascii?Q?kHtxpoB+wTcDNtbFXWwpq5o3KnkJMiBFGYWZnav5JaIDWaYdymCxrCrr2kQI?=
 =?us-ascii?Q?yhUqcrbGKDHjrCXjaiq/JRi+CDpw7NtiAndXA0QRklVvBHiHKCJbK6ddyPX8?=
 =?us-ascii?Q?R0PGpnMXUdrvv450d62gKftpHZpvDP/x1GZbDeMeTisLPd+a7yFch6rEQ8mC?=
 =?us-ascii?Q?+fSA/H8mzxbv+opplW41zef0hq+4KiFfdyZY95wRyd969Oj1zXghsNbirEsW?=
 =?us-ascii?Q?1RBjeqQiod/OoQB0gUyxjvRhKEYZ4zupnWzEcL/HUHb2OWNrj8TyECBWTPhk?=
 =?us-ascii?Q?SMwYGtP7vz1Edx38wfiewTCNE4jtkr9nlXgZDamVBXOMC4pAbAxxgFYPHCDA?=
 =?us-ascii?Q?019/1BJSfqBN2uEaQg36vtDCmNqe15qt9yd+7qEZjVC5UHeZ7SNcyjmjtnpC?=
 =?us-ascii?Q?RZOcsVcXnKyZz1g6HozuOJHxR3AD4kEJuIVxwItIRLp+nwUShCiCVQLVcFAI?=
 =?us-ascii?Q?3Ty2EUImcvOmd+9LtCkwhmPXtZRjqRzcOcg1Y4ZMtQFdaKUOlKQghAPideRn?=
 =?us-ascii?Q?Q3+8WsFlaLr6KiAepOHgTjL8/xZly8uNw2xRQEKp1+4h73CXMVo2PQERxAHd?=
 =?us-ascii?Q?yPZkZT4pWVsC5xfCxYddwxm7tGEj2/t9hmiYu7dkx/KGIn8Ovnhh8Qthngvs?=
 =?us-ascii?Q?MwwDFJ7/OwGfZAYPqoN5EY87jOh96Efh5P/GTiX/8sfD4Gl37yiRMYWV3e5l?=
 =?us-ascii?Q?Gg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dea810c6-3780-49d6-6e1b-08da6bab9be2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 06:30:02.8358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: auAGZBtxH9txrjRjryoKMg6gGawiapjdern3QgBdtVqDdOvAoKEqN/hOUsYgemQH4ZvmtaLigt8jRU+OEwJSejOMwD1TlbuS34OnUtOQqJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5744
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_28,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207220026
X-Proofpoint-ORIG-GUID: kTNMypMJFkOQqvbiY9m_9h7QDWsGvfAV
X-Proofpoint-GUID: kTNMypMJFkOQqvbiY9m_9h7QDWsGvfAV
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Semi colons and commas are equivalent in this context but semi-colons
are better style.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/typec/anx7411.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
index 311b56aaea9f..18a6a6a8b9eb 100644
--- a/drivers/usb/typec/anx7411.c
+++ b/drivers/usb/typec/anx7411.c
@@ -1421,12 +1421,12 @@ static int anx7411_psy_register(struct anx7411_data *ctx)
 	psy_desc->type = POWER_SUPPLY_TYPE_USB;
 	psy_desc->usb_types = anx7411_psy_usb_types;
 	psy_desc->num_usb_types = ARRAY_SIZE(anx7411_psy_usb_types);
-	psy_desc->properties = anx7411_psy_props,
-	psy_desc->num_properties = ARRAY_SIZE(anx7411_psy_props),
+	psy_desc->properties = anx7411_psy_props;
+	psy_desc->num_properties = ARRAY_SIZE(anx7411_psy_props);
 
-	psy_desc->get_property = anx7411_psy_get_prop,
-	psy_desc->set_property = anx7411_psy_set_prop,
-	psy_desc->property_is_writeable = anx7411_psy_prop_writeable,
+	psy_desc->get_property = anx7411_psy_get_prop;
+	psy_desc->set_property = anx7411_psy_set_prop;
+	psy_desc->property_is_writeable = anx7411_psy_prop_writeable;
 
 	ctx->usb_type = POWER_SUPPLY_USB_TYPE_C;
 	ctx->psy = devm_power_supply_register(ctx->dev, psy_desc, &psy_cfg);
-- 
2.35.1

