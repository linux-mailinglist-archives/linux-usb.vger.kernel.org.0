Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 568092A486E
	for <lists+linux-usb@lfdr.de>; Tue,  3 Nov 2020 15:41:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728035AbgKCOl1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Nov 2020 09:41:27 -0500
Received: from mail-eopbgr80072.outbound.protection.outlook.com ([40.107.8.72]:48501
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727742AbgKCOkO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Nov 2020 09:40:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MbBY4dF9dlU/GhoMAkQfX830waoisxvLJrKE1e3C3EAoDvNvzACDHPNM7UMd7QTa0yw5GTyCTeGP0kPSdOT1v50Z2QWZAmNB1MPcr7nfOnnFdn333jC1FOIskEdId6DaL9ZwFl84Z9sZlbQofn3tS0eCEGyFl5xHMuiBneNJdIotJ0RXRpmdUEerM/4IY7w+j5XPoPZUjjruGAMdSJh2zOz2nm0kv98QBMo1tUS1CFbjVK/5T1nQB2HqagwqsDe4DHdw8EwX4FScgcwo+qMvuWrnhMjt0G3VlpOvmkkMk+FDn+6ee8Quyayney3vHKIU6qbeOA45gKl2YFdIuYX47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmJhA46Tr3+EEA0mxLbZGVSVw+fkV+VRMZK4nS3zhxM=;
 b=b1dBXrOMYMLadFey7Jo+nu0/fWIOOQVV+D6Ebb9d97DZcJXlaQ2jSmIO03091lQAzdayKczSGdfTrrlHAKXw/hX/kXbfx+4VJmdAK/0ZdOUBo7SecS5vUFtbD0V8ZafO7AHKnTygz5rk/bP0UrHU3eFplzEeivTPc3G4v3NqHnHfOWabi5JkiQQ0jbuAI7xYNEOOJAf9MQ159JED2V6RA+berWqxDctdQ2nqPH+NPIybmu1Q49oocZhCUe0U+tJbl+iPMt2fQqcIB0gmdJIokLEAIvDgfWluxi3zCxYcaY6UUIHkXPCtAHcLD7XMyArs9SZIjEPdCL+rIcLDesN7Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmJhA46Tr3+EEA0mxLbZGVSVw+fkV+VRMZK4nS3zhxM=;
 b=mtL1dX6X7xMTP9YIg44wFaHdp7e2q+Z1Zj/EuP6l4wmw36dfQad6aNzb6TvPeC6ZFlu35QauDtX0ZgBWSOh2US/Xja1VPWzgIQ/eeW8D6163iSj6Ev9Ur/hZG3ukv08thkcnEcKPCTRcfGkXVZP+5E7s0F01p6tZGAXM9FLUWoQ=
Authentication-Results: cadence.com; dkim=none (message not signed)
 header.d=none;cadence.com; dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB4004.eurprd04.prod.outlook.com (2603:10a6:208:57::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Tue, 3 Nov
 2020 14:40:11 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 14:40:11 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     pawell@cadence.com, rogerq@ti.com
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 1/2] usb: cdns3: gadget: initialize link_trb as NULL
Date:   Tue,  3 Nov 2020 22:39:28 +0800
Message-Id: <20201103143929.8257-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0141.apcprd03.prod.outlook.com
 (2603:1096:4:c8::14) To AM8PR04MB7300.eurprd04.prod.outlook.com
 (2603:10a6:20b:1c7::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR03CA0141.apcprd03.prod.outlook.com (2603:1096:4:c8::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend Transport; Tue, 3 Nov 2020 14:40:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 09628d3d-a9c2-49db-c444-08d880065ded
X-MS-TrafficTypeDiagnostic: AM0PR04MB4004:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB40041EDF0411296798D433538B110@AM0PR04MB4004.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HnzxAd233rBow7MJkhXBZCCf0Dk16hA2EhhBCkZ50PHtbUmysR71EytZKZ8PoS4DJHR/I872zVRHZDCsPvkbnrRyBYJrDjYLgHxrlC+3ezEr+afOTWifbYEmD00eUTHDc1FtV3gK7ZksHfZy6uCi/zAtSYpPreY5Yh4a/sGJ+1zAmYCAHgEOvnxgeZsZbali4bNYFY/qsp7LJCxyFq/QJ985hXc+/fODfdwMg9/930PLiYGC1Xivo+fDI3kDgi2OhWN5lsE0OMS/e/ncS4KOLA++1GTVqHYFR/RqIkTLmWw3WpMZsk6vyrE75UMTVcZl
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(44832011)(6666004)(6486002)(8936002)(52116002)(66476007)(66556008)(8676002)(66946007)(54906003)(4744005)(498600001)(5660300002)(4326008)(6512007)(2906002)(186003)(2616005)(956004)(86362001)(26005)(1076003)(16526019)(6506007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: TWodVSz/wdZK8nnqGVZGzTpNo2SIT7BdqBVBVmUFZBzTeS+VwnZSMKTHgfZEtSo/c+FIpxyXHKKgmM5p+bseDqTPylieNXEIuSm3ENYgg2T5mgRGtdq0QqM/H6Kb5iIHRotapCh6bP5hG68PMw6Ls8j9BSqBXHI4GQHNqJh1yR2No1NyDP3+ZQ5eSxW9MJF1IfeSuJPn8L8mBTKKX/hX3hrZkc6/DUPY7lJ8Xly3+gBD3zxWlb9Tp583t4uX0WJzup9LoPPydUKFPRpzyroZQdZO/UhaJFdS3rhkAJ7ci+k8Ls4d8VIoQXImYM6JswGB/yzi2DnU9t3ilKPXGuFJdSzSfIAN2JTdTT+DXOaVtC8RqJLN9p0EK6vfjBCBOWlj+ocK4kbFFbEMmLEiVXjhLuZ2m097ic0sRwyjIDjww3+TBTsw8zt1t3m1CJB2qn3BEkHFr6j4fiixq411zyUH24/Gyg3yzK9uyaA64dN9SBYZvC+/V0EMBMDZ71p5gMjUYUXogAi3hpBM9G3E2bl3H4yGWhAdL3jaO9uj0PdwPjYrMpeY7gIGzgSWGdYve4B1FnZ7CVG+aIdxUapB5XhIwtn19qrGSM3PjTcydUBy6NRvqHs7AHD+nC2wUKDVb8tmLd8tax2/T/dUkKQLHLTMBw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09628d3d-a9c2-49db-c444-08d880065ded
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 14:40:11.0352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nklZxT2sdWi7sE15f574MWcBn6/OTqv3wXHaR3LS+zwZv/DH0hoacFae9HKihzTRYZvj4HoxQdPwrdXe+W7V4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4004
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is an uninitialized variable "link_trb" usage at function cdns3_ep_run_transfer.
Fixed it by initialize "link_trb" as NULL.

Cc: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: 4e218882eb5a ("usb: cdns3: gadget: improve the dump TRB operation
	at cdns3_ep_run_transfer")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 26232917197a..ec1730109fd8 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -1114,7 +1114,7 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
 	struct cdns3_request *priv_req;
 	struct cdns3_trb *trb;
-	struct cdns3_trb *link_trb;
+	struct cdns3_trb *link_trb = NULL;
 	dma_addr_t trb_dma;
 	u32 togle_pcs = 1;
 	int sg_iter = 0;
-- 
2.17.1

