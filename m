Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA3A358394C
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jul 2022 09:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232335AbiG1HNf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jul 2022 03:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbiG1HNe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jul 2022 03:13:34 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73EC95C948;
        Thu, 28 Jul 2022 00:13:33 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26S66xgC009609;
        Thu, 28 Jul 2022 07:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=9jdQTK/f9jHCi30SvpDJ+eY7pYaZUd2LVm4VP2Z0brg=;
 b=GbzhY9a1LpTFS08W4OR3IIAxB63Od4ZPqtmRoL/WgF+i+56VGUVKlcm49PD3vMSfNOGL
 wBLv0TSAqaZTUiu3VvDtnX473Hy++m7lNAksnXSqhM8MilEGebUcByqCtNsTUjRbrmcI
 pMI36DhidslS15SXZji3i6UktrN0+sT404JjabjKApDGjrmifUZSSmHEOWwU5nxaDYIh
 OC7u55aUw21ohXN5mC2U5ou+pZD34a8a+wD46rdfZv4larKWXkSz2P6jzWo8w6G+cTSg
 /wh6QT7YGgwv9zwstl1Vuz1xf4HvJ/3ODoAqdHC3P+t3LxVCzcgXbHNraluTCVH9r/Ls Rg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9a4uum5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jul 2022 07:13:29 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 26S6q7vC034494;
        Thu, 28 Jul 2022 07:13:29 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3hh6358ju8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jul 2022 07:13:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LlX1ilGkR9FyLD6ZPwU6X4yCSoILBmvWvg6JV5gfEzIY47hXWiWWyKDZLY5lJrpyTzrfJGIjKF+Zi5HcXjUPxesF0IPuAKp6enPVsamrD9rwNnQWz5Da1nacgxS+1DEzVmT/f2ZA72UJTkOB6myUsYWplx8ZvPwsR4dDB5HpIqAfiP2LPtrgS47TtrlW4JKVBLzVLxM60gkimFxnfiWVHaDmXc746H52vh21OtrZ9YgyIwA/yyBNXrotOcCbfsrOXkBtDuDce+epYUxFyeHYzAitLs+/CVTpcceZWu4XDDN+glxa3Ziycpxy+CkJfE1fS6FDcAQKwhd1Hl+znNQO3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jdQTK/f9jHCi30SvpDJ+eY7pYaZUd2LVm4VP2Z0brg=;
 b=a8BwVVHWeD2rYaWJvTlgp/5oyhHGZ3r+kMGvQOvrE1Xat6l6bGz69j06hmLCecmFnDhGsZE96tSjZ2RcXhjJzNUosWmgVH7XFfxTBynI0K3MFHVD6X+p1UYtXsdbnkSQOqxdz/NJwtHVo1OpbNtgks6XTrO7Ng5LPqXRLWMaRNsBWseooz3Fzf5KC7BX8iHvKzM7Kedn/ivA/Vd5o8Vr7jPawWeejIMTSMH2jWiVy0JyiG2Psoy09YblVohR6kE+00niY6Jgdl7tgoLSNJSaCdmgU73WzfiXPoHIh5uTobcaaMX38jHPEcUfFAxHLe+LZ4i0c4A6GVQqy+F+Mx6wAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jdQTK/f9jHCi30SvpDJ+eY7pYaZUd2LVm4VP2Z0brg=;
 b=Q/0ReBbRPCKqjMYs3vbg+oLNhK7d1KXV0r5pXHfCfpYnJr9FE8FsuJBOf6id70yfcZamly1NVIlQcAoj00KbzCHjwUZjkuOUZS+SLn+KDueSHwgrIllW+EamRInDio3VWV3a3PexzUyW6CYEvMqXcZJUfTwa3t5Uls7dWtcVohQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SN6PR10MB2525.namprd10.prod.outlook.com
 (2603:10b6:805:4c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 07:13:27 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5482.011; Thu, 28 Jul 2022
 07:13:26 +0000
Date:   Thu, 28 Jul 2022 10:13:16 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Xin Ji <xji@analogixsemi.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: typec: anx7411: Fix error code in
 anx7411_register_partner()
Message-ID: <YuI3DBkC983Y3oZn@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0013.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29d59db5-b7cd-4d65-28ed-08da7068aa66
X-MS-TrafficTypeDiagnostic: SN6PR10MB2525:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FE3Z4H6bXtCLkDsTgef4UURHrGCTE2qy2DR6LbvTFY6tUtdaBeAmWrsyCBW7yqUXJrny78XpBn95AaPmdIN5ykVKxN+w1DhimMhrTHQl5oJB5t+WHVoJCJuSbcv8GMRS6m9nXQ2izAsNCubuja8rFNExIKXR4o4eqxAMzLroEAYeB1I8dGDUP6d1ZnmSefsc9CaRXKdh7S+X+zjbprb83kd+1DI7JwkGshiK4Hn7IRXtcr0lORXWuR0UH9LHXph8nP0VizF9nw6MCCHSakRFCbgEPXDQxRNiThl0KR8YKpLNKJPScwP4xWGJ37gBab2JJJ9RLtqKlPxpx8+czQecjWswE3QQiD9hJA8sBu4MfsGPNgVeHXiZDAanzQcMey02pmsWKM49is9TchrD7jE/UTTnSNEAo9QAYM7KoqawtZ9qQyIo5V/XVVZA7YiZI+5U7P1076+zwYlFsuwE+V0+LY6wq7vNRbJk1rwuUREhcscGi1dEv2BWgVGhlLiKFTOvYHJ1Vr5+C5KQaKhwToA9Qm/j+wOMiSqwROnj42phkEyUYsv4cIVLiAJif5Aa2ut/M179oukeXGpEBfhSjqDoN+q5N7lyJJkb5pv2CjmRYp3oWiciDqcFdCQh286GMfQzT0fS06Ac5LV81/54dZy2Sm+dChqEteZVHniPJct9XKjmeB8errfKQe1Ckk2/soJhtF4Ngwm5lZ5iBCqUGZ4cMA7wcez2rNvxndIKGH+xPB2WGisr9LDwlFeQp3zIMyhTgJ9fSKPFs0zI1YT5kqwDIoHQjlNFes/CYPGRw/hK3Mj/9hjx2kAdibHFY3F3oQ3h
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(366004)(136003)(39860400002)(376002)(396003)(346002)(6666004)(38100700002)(38350700002)(110136005)(66476007)(33716001)(316002)(66946007)(8676002)(66556008)(4744005)(41300700001)(86362001)(52116002)(26005)(9686003)(5660300002)(6512007)(2906002)(478600001)(83380400001)(44832011)(6506007)(186003)(4326008)(8936002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?66bswXb+8hm1sbijTH6di4Udqtw7LuC97vMCsCsrbLxAdc8SFsJeOguBLdhy?=
 =?us-ascii?Q?Tf58x1G8IAx8XGIhGcAgdgI6DddSRQqcf9z/EaRpqzgyL7farnax8dS3gFh7?=
 =?us-ascii?Q?KzUwGxZHZVJMaVyDGEwrNmTI0zP/cjMz2Y1eXkCZIOaxb+ZUBAnkyikLoqmU?=
 =?us-ascii?Q?3rTPGeW1HKa4ghzejZi1Hoiw2ZnBcnNOsRPBgQ2r71JAGWzSUPdRPGPXRczQ?=
 =?us-ascii?Q?iR9dPPLD/36e68OAlDcovSppv2b4dnmgyxP2z4kabzu45ozYmsHK0RWsJC1k?=
 =?us-ascii?Q?t0QTVgB1Smf4oa/pNrXSeb77CsFgnllshtWNVE7bvDWxCUrASmqpadwiyDP1?=
 =?us-ascii?Q?tlu/4CAWxr7+eO/il47NalOq1ER5JbtqdAwFK1zB24aA0zw3gUmMmhW0CUBi?=
 =?us-ascii?Q?JgtutcvQcxKXp2xpnF4DmKBTFK2SbWH2B86uF2hYCERrckuKxJ8BkymneBkY?=
 =?us-ascii?Q?/gD1MfhupKr2Sav8MtVPASm0DzTMfCLEUSnXrVPvMPFbBas7fLJ0FIoNw06Z?=
 =?us-ascii?Q?5A/nEB7rOOqV1iYR1u79YgsAqg5k+P/CKJF1J288PAo+C5nnSpDq+BSBIBnn?=
 =?us-ascii?Q?gzBWkfIvfFSI+pNxI2ac9FiwmrqKq7Qv/dOLb7YV7G/JRX8Lknp5TP/a78Qx?=
 =?us-ascii?Q?1bn4oP7QOnTzKcFYseQjMrLS7w+J9UQ16kJaZSbkKbZ8FAFfQDSXK9dZd7V/?=
 =?us-ascii?Q?RG0T45Cor0L+qlx44kj4/XniXtZymwXN5ZvJhQY9n1T9pvy1yyZ40+CUsE3A?=
 =?us-ascii?Q?iyhKYsew3TMCtgnkt66jVX7OuIJRZwK/MilEfb5OD9uzRFphaRjIIfbw9BBv?=
 =?us-ascii?Q?dKvuFrvSCR+HDIgGShvusqLdq27NqIju6qxkrBTwEwYHz6f5gValsP2Ay08W?=
 =?us-ascii?Q?gy0KdUxsJD4d16SYDZsQrnIceEdISn/DmaYLOi7p5E4ofGRYqgkC2osvGFKn?=
 =?us-ascii?Q?dyo+oI5lsStAOdzqR1N4fnbsIrJVztNXvqj4J7b5XBQo1A7PNrOkVt1O770G?=
 =?us-ascii?Q?wqOMaiSZmQBKkDfGR87PE+HcrjPXRXQupvMexyn9yZyqic9/j2tK8FTHP2Vd?=
 =?us-ascii?Q?EnYxHHJZl7MJeeVgkPDQE1GHxo6Xcxe6oXU7Ms0nzzx7E2erM3HcMdMOE6U8?=
 =?us-ascii?Q?OEtt4ntd2fJYmQjyob6CEeRULIcJEPeJFbSh16FOsHS/i7qpWmLj5bmjSbu3?=
 =?us-ascii?Q?L53xvwRFaBoax1ZJLfbBy+yiI36wlod/hFQgCahkTpLHkXj+XApQw429SXzE?=
 =?us-ascii?Q?tS/5/0P4Q+dIWSp+DAnG1a+MmUiBHUqV0MCiBqf/TVbZXZ29igY1GLubxcw2?=
 =?us-ascii?Q?+xPKZiSnchA4W34ztc2WvoeWDOaM5s4XQ8erAV3TbcB8f45/v78jRxGtKQfd?=
 =?us-ascii?Q?h9vMcArlsJBnH7mytNTPS0BhecszXJAd8FWPoXt5XGBNApaZ5BMO76ygYpRx?=
 =?us-ascii?Q?2ug1AreMeOXKOqj1SWGtbUkTV14WQIVvk00MWmfZTIOnZODvdH2x9s9LD5uE?=
 =?us-ascii?Q?dTRRKzWunqm4W2YbVWk0KaCkKkDLkLOTrSkYH7NTlpi854ZTQ9ZxkGg9L3cS?=
 =?us-ascii?Q?e7oQyTddVD7pBBt4dcLLyRfU4Ramy3LDsSGh2OZxKd2vyaT5p68hCu0Pu/G6?=
 =?us-ascii?Q?3w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d59db5-b7cd-4d65-28ed-08da7068aa66
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 07:13:26.5171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UgfmDqAlcbrm/blGoZwoeAaVGSLhPvsQquPh8C1huGNNy7F/3Ob4pq2DRpS6KYisjpZIbXu1kor+bLE/yRB2Um1yhv9dSIM6qzDm+wVH0lI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2525
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-28_01,2022-07-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207280028
X-Proofpoint-ORIG-GUID: ouJ1mz23o2Q2vWW_MINVbcBgPMBk8PCP
X-Proofpoint-GUID: ouJ1mz23o2Q2vWW_MINVbcBgPMBk8PCP
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This code accidentally return success instead of a negative error code.

Fixes: fe6d8a9c8e64 ("usb: typec: anx7411: Add Analogix PD ANX7411 support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/typec/anx7411.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
index b990376991f8..96a3bf96f35e 100644
--- a/drivers/usb/typec/anx7411.c
+++ b/drivers/usb/typec/anx7411.c
@@ -374,6 +374,7 @@ static int anx7411_register_partner(struct anx7411_data *ctx,
 				    int pd, int accessory)
 {
 	struct typec_partner_desc desc;
+	int ret;
 
 	if (ctx->typec.partner)
 		return 0;
@@ -383,8 +384,9 @@ static int anx7411_register_partner(struct anx7411_data *ctx,
 	desc.identity = NULL;
 	ctx->typec.partner = typec_register_partner(ctx->typec.port, &desc);
 	if (IS_ERR(ctx->typec.partner)) {
+		ret = PTR_ERR(ctx->typec.partner);
 		ctx->typec.partner = NULL;
-		return PTR_ERR(ctx->typec.partner);
+		return ret;
 	}
 
 	return 0;
-- 
2.35.1

