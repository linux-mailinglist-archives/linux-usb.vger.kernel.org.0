Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8CE5571B9
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jun 2022 06:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbiFWEli (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jun 2022 00:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231951AbiFWDHT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jun 2022 23:07:19 -0400
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20056.outbound.protection.outlook.com [40.107.2.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E496443E5
        for <linux-usb@vger.kernel.org>; Wed, 22 Jun 2022 20:07:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hz7q0vkA+Q2DCc3g9l7uH8ocG+yIVAFX+j1zKsDytCIa5AFIReUvE5Fgfd8FIs0d0MOim7T8lveuSKFjqAOqv6dQs/GjWraGJGudw99x97A/NIrPKNpUXhpPHuuSVAQfBQqdm77a/P9AW8vIO3e6IVuCCs+LX+t0FsQYnRlDtffULh3uPVCMq9TiwwFXuaykqO7AOODFfg1ZyeBKoESGgA3A1vuNWfyqXRP6G4ZBdko1P63/LaXcm4mRNdxokAGif+nMQSU4/tLmodq+WmmAT2KXagOUHSFttO3SdAH5apteBJp0VNr+xK1HSs+4m7fFx+VnsFynMHqYIeBYgjnc8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivQybAig8niBvd78NY1XcYpOt7uPBlcP/XNWODsS1mE=;
 b=YBvt/UiS0ZEYSmY7j82WOT7/Z67m7TOl8j+adNRJ4XsQrLBjqM0j+zD19xxg+t32Cj8bzuoBY8sxuGj3TaWH8d1zDICJS1boFpqVpKGXQkLggz0VKeuyoafDmU11bCm0rVwfG9YukQOR6oAAi/wZ2HSW6H+DVy8EtiGvFtPjMFBkniHEmrjyBKED9hejh+ZTQA5F213Z2YK8dRTSVQy/2Wr6lAtD6iCGRqNtzgm/P2fW3RlSkM3QZgI1U6StHECjqnUcKhrb5toJ5pERViZbJcPyqF+KtlnbBPd/3Ehl0yaAjh6RkcduzjN50w8Iea4BS5i8PoFdZ0ft2J2/DSQXnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivQybAig8niBvd78NY1XcYpOt7uPBlcP/XNWODsS1mE=;
 b=GtKfoZquFZvN7G+IiYsq2SCS6bMBmhNkbSGayPzA73MAeQKM1HHy5Zerinag1riTuKEkuKB1k8yBEMx1OR/BpwuMzril3wf6zdNv3Bw/cPDDdXWuMlhBRIJ5r4M6HQeR4JB4oNoqz+R4o1bFNSgk8YZnJeV9igAeEWHwEZvkX/I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by AM0PR0402MB3523.eurprd04.prod.outlook.com (2603:10a6:208:1b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 03:07:15 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::b1cc:4d23:3361:127d]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::b1cc:4d23:3361:127d%9]) with mapi id 15.20.5373.015; Thu, 23 Jun 2022
 03:07:14 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, linux-imx@nxp.com
Subject: [PATCH] usb: chipidea: udc: check request status before setting device address
Date:   Thu, 23 Jun 2022 11:02:42 +0800
Message-Id: <20220623030242.41796-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0097.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::14) To PAXPR04MB8784.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68eaa275-270b-49bd-a637-08da54c5792e
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3523:EE_
X-Microsoft-Antispam-PRVS: <AM0PR0402MB3523EA61D6019AB20A1DD1888CB59@AM0PR0402MB3523.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 44zR85Cg/2PS8kR/o9iqfb3SQ3twlAaPVARj29qJEjN1XYJ3BtJnVrtHnnqHGwnIK9iwABygIAx7xEUi7smpanr8zX+U0AjImOCd8+68K2uIt2EedO1lpeNwZc9lm64mNSLoTJ5n9EO5DQ9qVKoa8bNr+LtSxywm3jjgr3QHpY9V1r8owhUVR3Fz2zQs9duG2t155lgwIFDl+4KXZ4wPrzkJuh+e0rp72GZb7yhEG4hv0oodrJZmWC2SFpwSg/WUo9nKn6E1Er+HJKkAn2I6DEJBn+3Zl1Mb3NwPYPraDPXdkIAe/ux2FApj0bKckFkkCnEB83QfwaRndMgR32p8jsdEreRZUAmwkU1xBkpG3nGHjcvdNXBSjrvMb2sK2LmZ/hAhLrIRy74J7q/JM6YtXC6mbnN31fJ8jwmM7zpOaE61mcYPLZ7+lXv9ANYrWBxM+igum0gAElBx5nCe6MNVdfYdjsheDu0mEAPSmJf9njw2MvWWLvAObT7VImhkNky6eZxGKVXTZgD4LI4GZWEh42LKICZCAmStzf2tU4JcfbiToE3S7J/Ym2pZjsxHmy38n+IJGPRAr7TV0qLOz5hELaRCj0apxKtPEdo0cAUITsSJcg2rdwiC3LRpJ6Xa9qX3hmntm6WJF4SxjSqyc6axnfe7ep0m4ItB3BurJUTSeYwAmeH6QZM4eSnEY0O2fMp5arvL4A44fjHu+auXbRACPqgwKjYKHyWX7HMRfI1Ml9pEA2wpekTin6mve1WkHQhF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(6486002)(38350700002)(66946007)(38100700002)(8936002)(66556008)(8676002)(6506007)(2616005)(66476007)(5660300002)(478600001)(4744005)(1076003)(186003)(2906002)(83380400001)(4326008)(36756003)(6666004)(6916009)(6512007)(52116002)(86362001)(316002)(41300700001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EmToC4QlpTQKbfu5AEVU4YKFRxEnXgePI0gPLgNhTtQeWZULxFcOBxHGw5xT?=
 =?us-ascii?Q?R4vr8iVXFvPEMbrVYYirrHavMNBse5y/1yYC+1zZAqgCgXxVQ4dHjHOiNRnk?=
 =?us-ascii?Q?+90be2VU1O6Ikj3gG1bakpa1wPT5Yc5Wba5mq/jEro6VVjs4uWZ8/CfHeHrt?=
 =?us-ascii?Q?fs+O0CUqorsD+JToeKNy0gtIGeqWDxG5+sXKw6DaRpONfv0TzpeIRQ2ONXeA?=
 =?us-ascii?Q?WYk0MQ0dfJ3kZ+8XsmJgXxKWY8A9D1CBo5eXSL61N4tfZvmJRBNsTrD++dyo?=
 =?us-ascii?Q?BNAJj87AOAT1PHca8k9tk+ddejE2g3pnI6PnRyEzboqIuFz0ZoI97aQDlRqQ?=
 =?us-ascii?Q?BaJze8C+3/XsqxUA1HY0wzg8BjKA9vFZleY8uEt27EIZuC+jkGNcBQk1H/i/?=
 =?us-ascii?Q?yzV/61GLIi64P/dRm/P+NtSWno4679Yj/pSWSHkdDvkll1q9aNX0+T0+4jCy?=
 =?us-ascii?Q?K9p0oUcNMei35E+YNUPJZ4EpFQ7wpmUQbFT4SDBcE3RKkYV5IouvYblefXue?=
 =?us-ascii?Q?+NkrcmYpAhNntOml8VPlLf0bl/MKk1TCZr6bGGYae7jJpPEAo1LX0QY0bOR3?=
 =?us-ascii?Q?k6OYKvsvm/VXV5XF4yAVFLhTgu8s/iUTM0DZRdDyUxxqs4H/jqtfN07BbQVT?=
 =?us-ascii?Q?CS1mK61qn2yfBSMD+yrBkasnTddeixkjI6KQpurlFMGrkDSlQoCshBBjcQ1l?=
 =?us-ascii?Q?TA1cJrRfxK9/Yk5oUBVZqPAZRMCjuvboIO5gedGBKniedtNiZW/M/BayuhTD?=
 =?us-ascii?Q?bXBLC17DpIuoQfsvJi2q8aqBEavr1XdwXgsIXxXTTDKdf+r9eHu0cwi6zwqa?=
 =?us-ascii?Q?9gn4e6IKalWGdhs0ztd3XSUXJa4v14ho5u+M2VU80+43yVOMuPAbysWPT7G1?=
 =?us-ascii?Q?ffpd211C6/gP7JhUK1ALRloPhKQmPjnr9D7RWqfDrZa9TYemm8iKvjQi0rqi?=
 =?us-ascii?Q?oSDPBMtJNUosSQqBg2ncBQjSYeAhlSit/DATAvdZOnH7z5Tq3GARrscbrtID?=
 =?us-ascii?Q?SwYWbwaye5whGBRUXST//JDxYbhREftSZl1Cw7Y7auHhhQPZKRswDPqoLIOe?=
 =?us-ascii?Q?TC8aCpcs6hYelZ+J2bNoErKLvFkfLXCsEngPXcr5kV9YHhlR4eViSXVecJ4e?=
 =?us-ascii?Q?04uZojjxWVtSwA2Cv/G2Qw7oe2IegZnQMlQvTEdqCCF7g6RRZ0N7WJEgwZRv?=
 =?us-ascii?Q?F/++/SuJ5YcObjuXpc/1KJtGXGsPGPnfKzYvPZg1DyH9sMlLGp/g+0PMcN3Y?=
 =?us-ascii?Q?gHL+mlArcLmg/s7WxI5y7XkqZArirRx9ad54aFco+WI1+Bs2MI/xo918KkC+?=
 =?us-ascii?Q?aKGKezvBzoXYC/72MBpUBMU5cp7eSfVWYzjd4xBlSCwH5bmdbVB7x1kreIqS?=
 =?us-ascii?Q?gaRtiYlgmY/EA6Q8xfzvdWQX5JX0sC2W1uPyxpSObnoSuhUzVGEggItVzT04?=
 =?us-ascii?Q?OUnNeq2k/aWsu7eBtDa1Tj2LFZmHibjKzjjMlaW61vVWVYW6CAkvQ97sVIQd?=
 =?us-ascii?Q?xrQpUWYZMEo6vphn7onyubxGdfaOsfqzSsrprSPaZBxg9x8XNhZCCmcUhLRj?=
 =?us-ascii?Q?OssfgThBbB0Plype7h1q6AeA3cSRq4bybwpSD1CMxPBAoPekKMUIw3rTMJLT?=
 =?us-ascii?Q?Z3hzYfwsbeGnpgJ73x8sRtE+3hT10Auw4CLMoksHsseGqZboExMswS3kaELS?=
 =?us-ascii?Q?uIdI10MfadZ7aAGkBtk3tIUjjuIjb5nHl60n7c3HnlPI9Wzg0274n4u7NpJe?=
 =?us-ascii?Q?BitNQKPtUw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68eaa275-270b-49bd-a637-08da54c5792e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 03:07:14.8499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMFPEc9RQyvw/aspxxSFd7ObYa4MSKPsC5HkwdbtuWbSXElUpF2SDBq2gKXmrVHX7PDkOxotQ9wCpXBuR1tnEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3523
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The complete() function may be called even though request is not
completed. In this case, it's necessary to check request status so
as not to set device address wrongly.

Fixes: 10775eb17bee ("usb: chipidea: udc: update gadget states according to ch9")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/udc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 0c9ae9768a67..8c3e3a635ac2 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -1048,6 +1048,9 @@ isr_setup_status_complete(struct usb_ep *ep, struct usb_request *req)
 	struct ci_hdrc *ci = req->context;
 	unsigned long flags;
 
+	if (req->status < 0)
+		return;
+
 	if (ci->setaddr) {
 		hw_usb_set_address(ci, ci->address);
 		ci->setaddr = false;
-- 
2.25.1

