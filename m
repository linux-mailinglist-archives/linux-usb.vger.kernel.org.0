Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3104A40190B
	for <lists+linux-usb@lfdr.de>; Mon,  6 Sep 2021 11:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241273AbhIFJnr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Sep 2021 05:43:47 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:56518 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241397AbhIFJnr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Sep 2021 05:43:47 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1868cWml003682;
        Mon, 6 Sep 2021 09:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=x4y1Jx1HfQM1kRvtGVCsGvEjzd3H2v4rspezTRavtlc=;
 b=HjdCQ/u4Dyr7c8lwhz1Cbe9Obf36wg7n+NIvQ1tKZ73EN0cwWhGbTCDsRSpwux80kNK+
 GxuvXy3XJQY7UInvl+rLG0O3rStk/hkxlvw0z2BV3bO5lJ9TaJ/DwpliYUf3FdkEHta1
 TPd1ddYAi8JTSs49NGKBXw2uJFyX0yF0wSIXV2O4ZZ7RNz7pNGe1E6hamR/AhmQlMzjo
 UM5POEuKwykKBntUt4biDkBQqqIoF2I+yc3spZEuZmRjt0fuX3VCe3NTDBzvQYLq1RTA
 92eqcrDj6pRq4/pJpRUxW7ZHxSNbiimcH5Csl/cgcebaH/l4Em23zXYpEaZKQkHd4J/H xw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=x4y1Jx1HfQM1kRvtGVCsGvEjzd3H2v4rspezTRavtlc=;
 b=G8aMuhyaATV0mvS7/OnzUBrUpg2aNLLdekgH3kbK3uUs0d9D7IhWHp3l5OyqlvJ+FXt0
 VhNPx3ExPdwfKAofTzOBkw4emwoYEGNiLz5NVGG/gGz6FUbRGUAPEH7vSPz47+UMGset
 gYD/bFe5Zisna3Xeo1ez5VDNzLVxFezyEEVh274Qi8eXMTtQFgurKtnSeE/0sJHjt+RT
 h3VXVIJz419omNdwm21sNKvEpVrJff0ESzuIe0YJKLSXSR7ckiL1SmtsbJoyM3UeozHi
 UEwz6zOTCVv1Osm2mZ8RXYYVONOzCetNSvF8GEkB/3AM1vf9GhjtKDbpnJnAlzQvUZKZ +A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3avy77hrxv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 06 Sep 2021 09:42:39 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1869ejXI036213;
        Mon, 6 Sep 2021 09:42:37 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
        by userp3030.oracle.com with ESMTP id 3auwwv4h5h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 06 Sep 2021 09:42:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zlh11JCwn8ZQyMpPV7zyzuPVeRJz7en4VlvD0cmaZyKWSk1U69eIaH4+bIYXA4oozNUgOMn69HsUhUnkrQ6bPfWgHeXKuu48LNajPxDwc5ZvDc8zgCxsLLShBpIhWsyWWYfOAfndfGwcgFzGx5ZL5QieSE41EKoJKOIm6XvlqWNn42/Yz4aUD6+vG2yg5/eVVY0kj7j4gpGn0kzFzGb9KFxA22LPDLpYGSCZH5WDESbdj+YXUuRNhr7hQvkM6VmjBueK320MqyZ7Us5TW2SnXPZ93DhxkyqgbKsuzDaZuyvTiYteFJwiNhPIyemfwU9cpn+Ujj+leW1AO7OHFQxy+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=x4y1Jx1HfQM1kRvtGVCsGvEjzd3H2v4rspezTRavtlc=;
 b=Daaz9c3GTmY5PtPh7GW7q2B93KOMl/Z3lEp2vtIhmQePyrxCr1bnNRRPjfJV8Ea27Pc3q76r7mpMlt66IOaxvBTsyCUnVIFlW5fLX9tvkIwSiwNg+uK9kMS8z9fmnwvBh4IgY4Wm1OU7pfNXDar11/8f/+UtKjPP94dZyX9SjfQwF/+otOE0gAKiZSZJpJ568LzsU5Cz+bto8aXx0qSbS+fB2DiqVOM0gz5JwnL1yP/h7JncOkDAJoMtbOKJh7sOSFW+BDa/OJK8V87HF5V0zCmt2k7kZpUhRCk9VOfoOu1h117j36dENT9geiTVhjs1dV3l85apLhx4xUvdOcKDrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x4y1Jx1HfQM1kRvtGVCsGvEjzd3H2v4rspezTRavtlc=;
 b=qtRhjBOAPDQdt1z3wTtY2v9TNTQLAHZJN5rE76hnfaZRN9uI7ReleKssK4uXSFBlHCn8iwZMMnty3Xv9YSMlU+LgUrb0n3TQnMEGJ5xeEw+gA6k3tYo5KDT9JG3iWIOAcBeRd8iITUAKPMJVA3KDqgsY6WNXUpXOu5ggjIVLG6M=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1376.namprd10.prod.outlook.com
 (2603:10b6:300:21::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Mon, 6 Sep
 2021 09:42:34 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 09:42:34 +0000
Date:   Mon, 6 Sep 2021 12:42:21 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: gadget: r8a66597: fix a loop in set_feature()
Message-ID: <20210906094221.GA10957@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0037.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::6) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0037.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 09:42:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c75307a5-cff6-4f75-dae4-08d9711aa765
X-MS-TrafficTypeDiagnostic: MWHPR10MB1376:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB137698880F2454F231CE5B498ED29@MWHPR10MB1376.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ErMmcChLsTWeKytYtP7AYR0VMCV4VbsOznBjO+u3OZk7I8vbTm9g774CthjxT7Be9FQemMVzMS/jPCi6NrIvj6oEfwHjZGWw/COsxhKFxK+oez4inY5F9ZFXhHhyvSlq8ilzMfraOMrncgE3vzPcLe8YXVp+mB7F9gdvks4LuNTyYjlu1gjkf/QVOrdmch/Avi7WWrB2zQqtzSlBI0z3WRtYa8YWNcVTpXfXnUkMSzYdi76nRJauUtN9HW5wwvs3tsVl2WGV14YHiohvZYV/AfE85ecPf11h3PN/sbFcQ6CrOOmPAJMayACcPZ+ffo0lxX8igKqrO2/byQelZMR5tK0BeHe09CchaIH2BOM2DZFV3jaKCPUiH+khNP9byb3pABCpbTFxiGJ94oYRKyQSSTW7uTxwMa59jtOJDSLNwjHLrgAWrrjI4h4IWxXyuD+QSmv3PICzTPM5m547efGVmjMXOr5jQyu/JwrbYdiASRd3SP1LZxPI1DzfrsKwVG5AJlPSKq6TTCTfVYq6qpmu1IixpyeFwhFWnTq/jzK4K2TfMH0w4FUsQSxfZfLyLQHWXI4JgynJQ9mAhUwC2CjAoDbp6tdW4xMPBiyC40RJNhDfht5upM3l2w24FMoXtN0O1FYeQgewvFqLt5qtop1GQKv4cj4IaexXQuKDXn6ip5z1IvSytjdifCnpTFGJrmm69cyOA+XSnPbcS+Gdomb7qA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(366004)(396003)(346002)(376002)(66556008)(66476007)(66946007)(186003)(478600001)(8936002)(110136005)(44832011)(86362001)(956004)(55016002)(6666004)(33716001)(52116002)(9576002)(316002)(1076003)(33656002)(8676002)(2906002)(38100700002)(4326008)(38350700002)(83380400001)(26005)(9686003)(6496006)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yVbDZk3a9ce3/TQCsPnWBK9RYlRZTVc+YVCXC/G+2SVXkdFoVX77DHAXln1D?=
 =?us-ascii?Q?9nQzU8WBwKJIDP/mvjdvE83L5kXRMSjADPGZ2u30kJPirmeRwGeW51t1d5oi?=
 =?us-ascii?Q?HrAgJ1KKahFEL7UmRc09hdoWtU5r/7NZs6t9i30Z7BF62sWsdgtzC3L51rAr?=
 =?us-ascii?Q?BBthTGNvGTS1Uj64hXaV3GBbRHCMEKruN0SMCb5+RyGz8Vs54jy3a1ptCuA6?=
 =?us-ascii?Q?ULifGPx2UyrYocDOECr+9KJKNygFU9xwoF0Pk+tvWcqu7fWLN9Y64tcifMQo?=
 =?us-ascii?Q?LRd/7xdZ0un3Z6RxIBRi4te0lOtJHKrgluRUayBJT01gy3MHLzhzvL5Q3OwU?=
 =?us-ascii?Q?GjdFlB5rQzPGz5D0Es4LQCeF/DA6M4++yn81UcWS41pj/yrAjV3QNngZl/kY?=
 =?us-ascii?Q?IGfUCS7sCLZOv87owX3830w5eBeDsYWoMhqwCPz5q+ZkfEC0TjVHsaG4eu3R?=
 =?us-ascii?Q?u9QJ/KhUsAHHbri+Y8VAHW3aolIg01adIieH9lkOLuj+Pzr73Ujl/HFzdeEy?=
 =?us-ascii?Q?bgMfrCwZ0neGyk+lVnQeeAedzX3G3p6TZ6WGAepKCZDbSjiep/GPWwkfeOVV?=
 =?us-ascii?Q?oubKEZri3LqwceghJKRwNQfFcJNga/9BQRan4L2xLhxvh/DH2NCTJ3Fn9GiV?=
 =?us-ascii?Q?L0AaM7a3lWeFxvrOR8jQP3mbUIWrHWME/LpRHbJWDkeQv6vHz0FDRpoXCcw3?=
 =?us-ascii?Q?B399Yp1lfrisWW+yR3nDepAIWjJvyGfXkMrjIjBj73NijZ1yF3d3UQWURvAH?=
 =?us-ascii?Q?G64nkaqZ2tkc+ud6LUTO5Quog43r2dSD5uVk6p9Deg3DB9zvu0OuzllY9Jtp?=
 =?us-ascii?Q?NO2NvqkbS53RGf78Ew0zW4/+6FudBnkqBMQ6Q16rfsJ+mSuvQ5kCo80qjUa/?=
 =?us-ascii?Q?vgtEtlEmyNsS/cUJU4RhNfyu/ynNbS4ZX1enQR97KjFKmt9+N+tqcB8hH5EX?=
 =?us-ascii?Q?KW5K62Vj9iMrLB//TI5l+YCp5+OOJNh0/zYLaOcAIXR530eokEXF2m3zssUt?=
 =?us-ascii?Q?lgUx2NxdukmC5qd4NxNs5whqHMXA8yl/vd5iOIs4NWZYjsnwzsxcX6GA/qOa?=
 =?us-ascii?Q?NJxndFm2HjHg7AsYJRc7m52d8kbRTOUKSntzV00gyaSr7o/ZFEEF/dkp/eh6?=
 =?us-ascii?Q?XXT/bFs0bTkjH3UlTtJdYNSeEj+61V9C9FNfGP3wAbuK3FEPPu6Q6FX67pS4?=
 =?us-ascii?Q?4ikDynCcVri95z38g8rPUMG17dZa1ugi9r2LNFOcE9ozmPYPbVT7rismAo4r?=
 =?us-ascii?Q?eMi5TiE9P8w81C2ev10ogxr4TEm7Oz3TsRPkeAaRWZnPsm2UcnyhD+liJnHG?=
 =?us-ascii?Q?C7IkoADvFX5mNX3i8XZWsacU?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c75307a5-cff6-4f75-dae4-08d9711aa765
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 09:42:34.2903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mtLwyEpkLhLOGfAO2XoZlgZInQ1ukaG3vYjsocLZFCPR3pMUEeBtZglE/wROUJoD4XTTG3DUQNcPfiENoreoV69kX2d0R6BDQyra/KM7dUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1376
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10098 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109060061
X-Proofpoint-ORIG-GUID: b4mYhirxt45ep2hD90v5N0mHGUOQ2iG3
X-Proofpoint-GUID: b4mYhirxt45ep2hD90v5N0mHGUOQ2iG3
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This loop is supposed to loop until if reads something other than
CS_IDST or until it times out after 30,000 attempts.  But because of
the || vs && bug, it will never time out and instead it will loop a
minimum of 30,000 times.

This bug is quite old but the code is only used in USB_DEVICE_TEST_MODE
so it probably doesn't affect regular usage.

Fixes: 96fe53ef5498 ("usb: gadget: r8a66597-udc: add support for TEST_MODE")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/gadget/udc/r8a66597-udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/r8a66597-udc.c b/drivers/usb/gadget/udc/r8a66597-udc.c
index 65cae4883454..38e4d6b505a0 100644
--- a/drivers/usb/gadget/udc/r8a66597-udc.c
+++ b/drivers/usb/gadget/udc/r8a66597-udc.c
@@ -1250,7 +1250,7 @@ static void set_feature(struct r8a66597 *r8a66597, struct usb_ctrlrequest *ctrl)
 			do {
 				tmp = r8a66597_read(r8a66597, INTSTS0) & CTSQ;
 				udelay(1);
-			} while (tmp != CS_IDST || timeout-- > 0);
+			} while (tmp != CS_IDST && timeout-- > 0);
 
 			if (tmp == CS_IDST)
 				r8a66597_bset(r8a66597,
-- 
2.20.1

