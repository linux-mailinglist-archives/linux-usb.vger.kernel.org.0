Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 058FC36F5B7
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 08:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbhD3GdV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Apr 2021 02:33:21 -0400
Received: from mail-eopbgr70055.outbound.protection.outlook.com ([40.107.7.55]:42330
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229482AbhD3GdV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Apr 2021 02:33:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2Z3S0yusfWlLVUUNRvb7lZDo/1/n8m5fXEZdt2jxEdu0y4c7umDiolKhsXdikO1VVD0zD6WuswrHK9GlbaWIuOsyfNLsXeRdbS3sVE0fWxACe7rT8m0AlhUbFsfmqoj0n0B6CM5Wabn27d+1uC+5GgmuDPFW896ybvn6fUMoS6UbqsEjyAa3073pG2Y4A3NNDDGV13TlpAOz4HCZu4fALSTYHcCPK/NKdjcM/2RgcCANYvJ7xNsfZ/N/RTdA7BCl3azxcygbAnPJXHkXOVkzcOxBUGr9C0Kf4lApFBhzuglhNDj3jMNsXf8MmG7gWKXym1pvNtknQnOZJrJ3nd+bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dpd8gSIxgSWVOY3jGpa4I4NSstkqN5kM9CZTFRW/GNw=;
 b=R5jO07rN4v7l1AeuUNP+iA/AYXovIfHcCuo2ewAD9KWp+2XP/JC2159V7sMSTuJyEPGOJBMgzPWk15Md6rSESEJrM1b8h1euslXrCMcrFYYguM7m1wTyxMQcG04VkDa3X3c6jCMxb+F1Rr2fifbxdJE3MBt/a5JUwul1NslCZBE45Ijp6izlmp2hsOwpN3Ylk7jZREaJTnUJfdb4Mq5InhcixFvhy8nXUK2Kiq1XiK58r6su+GKaKclvx10swusZUq0aFSQjzTl0VswSzCqrbo3EDvjMRN4R27VlUqsivjFK2wJ7jjslMjlANpg1eJe3xLVJcxeshaZ0k75i/3Cjvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dpd8gSIxgSWVOY3jGpa4I4NSstkqN5kM9CZTFRW/GNw=;
 b=OkE4pOLr/PC/EPLx9o1trWsHgtgXKetNRW8x+wi1nQ8gI+9fWZAu1NNzMGDFPc+aX6uxhMsmP7r8WL+GbWoQduoShdpAWsBfejO2KBhNOGoPcNj7ELQnbS+mq3SQfGxBx1IvwtOrxvxsxR06M+3P7bHItqHBT1Pid1PGCI/CVIM=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VE1PR04MB6749.eurprd04.prod.outlook.com (2603:10a6:803:129::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 30 Apr
 2021 06:32:29 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe%7]) with mapi id 15.20.4065.032; Fri, 30 Apr 2021
 06:32:29 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        mathias.nyman@intel.com
Cc:     peter.chen@kernel.org, jun.li@nxp.com, jackp@codeaurora.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH v2 3/3] usb: core: hcd: use map_urb_for_dma for single step set feature urb
Date:   Fri, 30 Apr 2021 14:16:33 +0800
Message-Id: <1619763393-20029-3-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619763393-20029-1-git-send-email-jun.li@nxp.com>
References: <1619763393-20029-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR03CA0010.apcprd03.prod.outlook.com
 (2603:1096:203:c8::15) To VI1PR04MB5935.eurprd04.prod.outlook.com
 (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HKAPR03CA0010.apcprd03.prod.outlook.com (2603:1096:203:c8::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4108.10 via Frontend Transport; Fri, 30 Apr 2021 06:32:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2da4e07-18ad-4ddb-b5dc-08d90ba1b9dd
X-MS-TrafficTypeDiagnostic: VE1PR04MB6749:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB67499452C57AF754925FD235895E9@VE1PR04MB6749.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pKgkbdS1XBrp3T8u1jCIP0wcRyfWk9zeQBvhJ8DiiKIwqD2G+hWnXp2BGaLEJcUgMWpxiHY39UHhN4VUFejiEdps24ZtUb8wBgcU8b2lgCmK8c5Qfj5CG15TbesK2pNwuUnmcrSxgRNnvOfVEUA+Hm2bm36qemUJxrVmzqdyMLT7w8w2LQCDM5bG2NPPvmEtQhcBY0QH6OmpGCKzFtXpjenRyLJNqMSWgjZvvNYXKGc1i2KseFY/CheL0TwYkwpQfs25FKjrnAWetJbmtI3c0OYjounUmy9LKHzKo+5wBRaOM+t/S6tjkpLwFaWea71FLdvSrTchFjiS1CVt1Ioz815ij+D73x4uRHCDAHDqQ/01MWjOzO+ucGXwweQ9ZldGTiNGgEbnpXSMfsXN4zT6sKJkc5XmSKEJqPmEfSg+3oGX+rJLLvHBVliFLK4/2YDO0OKtcf/67lWZ0saPuB20foAlE9W/w+oNpSLYBuURlhhv+FHebwjdPeJPExg20JCHiCDoiePnN+5P+MYmhiDWod47OpAR7rDL7cipZBUqjdECuhAZsFM/jQfc+Y/YYU5w6cL0ZDo/oWaU18Omja49W5n9+l8JozzGu++Y52ORFLKmRY/hmQongTgnGQo4qPp7yoorup7qQ+xI9vhag2XNpvCKinmSPwxlmVpasNkJlWY5wO8UwH6iydz7c/OvZZkJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(376002)(136003)(396003)(346002)(478600001)(8676002)(2616005)(66476007)(36756003)(5660300002)(6666004)(86362001)(186003)(6486002)(8936002)(6512007)(2906002)(956004)(26005)(16526019)(52116002)(38350700002)(4326008)(83380400001)(66946007)(316002)(38100700002)(6506007)(66556008)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?aUPxC1HJdqGzSWSGS/xVyYMZVjnBOKd88JuLByXGlC+cSH85CABiryU357Ln?=
 =?us-ascii?Q?Ym1Dao6fs3KR2Wn279WojksXNy8/hZGdvVSy+LpwO2GMSAF35ztTMNt+nayn?=
 =?us-ascii?Q?w3jdYCVXOgyjrQsDjq7CzkQcMHtekCpTP42suNlDAGeVmnJgbd7pvqOPvGU6?=
 =?us-ascii?Q?hVVwXiQ3ro2kaVv48q4cEroNdB/P2nzqmFtCV6zdYZNQGdpRct4iulzqku20?=
 =?us-ascii?Q?t/0/mRch7oLX4r5sQg50QCMXQneMZF5J3MC0xnBelUsQVb5iu0nEWwvtEhKf?=
 =?us-ascii?Q?qvBGkCD3FMzY2e3+yPTFBR17nvstV7ojfVUZeS+At4wEG+6s2b2FcMrG/b1s?=
 =?us-ascii?Q?i/9BryWtUYcOHdIb1bgUCfPIzpeEZv0RE14DHDGN3jenU1CXnusPF7SSa5TV?=
 =?us-ascii?Q?quoqQZSz7RqvmetCm+hbEvQTE9LCfFB7VYFsvtKCd3aBaxwImCh78jCFOCe8?=
 =?us-ascii?Q?bI+vNRhvGA6YLRnRNAZnhDjxr8kuEOLUoOyPSXgxq3aG0OLC1Or+BA0e5RSR?=
 =?us-ascii?Q?WmOL+zsdlxEMttvbMA7KDtTEIbDmFWdj/j5UpVayTIlbLuzNCpi0uBRV5515?=
 =?us-ascii?Q?HEHiqvL3n52DhhllXljpYQt45nTgO/xzepFTl2zT9U5NLfcm+tIAAZJtdbO0?=
 =?us-ascii?Q?dwofU6A0MAue/iwrLxmw0fkyGcO16mb86BZnrIQ5kp7yn3d0UFhVXbeFI/of?=
 =?us-ascii?Q?GYtfLH3H+qVA+VSAWb6aW9cVKpa9DiefK57kkqXEU6aAr8nEf9zU4zh2dMNq?=
 =?us-ascii?Q?lx5AVI+DiAsO05sSldUREtOYKlG9r4crByM4dcoj6UsGSj39ZOJBtHZXx87C?=
 =?us-ascii?Q?qXW3Micl/S9DYrO/jmMR/0LxkMMJIW8pFVAtn5Cky7XM8xcXC0WfVHiWYzSF?=
 =?us-ascii?Q?4O+looEjoL2eM8Pzyjx6SyQ8MNs2Bx3M37LxNcKKrQwHXYJco0uFE5l/UpME?=
 =?us-ascii?Q?WohX3E4cahIzlhH15hm+K13OWUcCMv2/srrlXtrkFDtdvFn9p3bCKZ0ECPOs?=
 =?us-ascii?Q?idugyxXkPZt8SVl7igVx0l8PZ4TA/L8HfL/z8YjyaLJ3cxAtNUl8fdCytv6A?=
 =?us-ascii?Q?D/rwWhpW5ltuxiqujhd5ZPxUg3GuJB7KVIXTKic7MmS3ItLQO3qCoUuXYruB?=
 =?us-ascii?Q?UXnJZHQsw+qwOFzMtTAlVTf54Xs6uA9BcV2lTvE5FkfPQj8bCTvCTzdXZFiT?=
 =?us-ascii?Q?Ka+MWGK45ayev848haNc1TN90c74UMA3Cs2L/JmWOq6dVZjn4hiNfuBWGP7h?=
 =?us-ascii?Q?J0uzakZTe4zq50B3wvZgeqHtQ/JCTz5K/jzCcvbp/SFbz+wpyXpBQT1jyPEh?=
 =?us-ascii?Q?wrU4UoF79DEf1LerUv/Xu7yr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2da4e07-18ad-4ddb-b5dc-08d90ba1b9dd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 06:32:28.8979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2N0q9ZOtEyD76kTxoZ/aczeXfSQwO8PBOJiDtcQ6sw/ikueUL1v4pOL3DIfgt2d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6749
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use map_urb_for_dma() to improve the dma map code for single step
set feature request urb in test mode.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
change for v2:
- Add this new patch to use map_urb_for_dma API to
  replace both of dma_map_single() calls, suggested by
  Jack Pham.

 drivers/usb/core/hcd.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index d7eb9f179ca6..0b89a3dc99a3 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2159,16 +2159,8 @@ static struct urb *request_single_step_set_feature_urb(
 	usb_get_urb(urb);
 	atomic_inc(&urb->use_count);
 	atomic_inc(&urb->dev->urbnum);
-	urb->setup_dma = dma_map_single(
-			hcd->self.sysdev,
-			urb->setup_packet,
-			sizeof(struct usb_ctrlrequest),
-			DMA_TO_DEVICE);
-	urb->transfer_dma = dma_map_single(
-			hcd->self.sysdev,
-			urb->transfer_buffer,
-			urb->transfer_buffer_length,
-			DMA_FROM_DEVICE);
+	if (map_urb_for_dma(hcd, urb, GFP_KERNEL))
+		unmap_urb_for_dma(hcd, urb);
 	urb->context = done;
 	return urb;
 }
-- 
2.25.1

