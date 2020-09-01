Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2EAC258A9A
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 10:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgIAIpg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 04:45:36 -0400
Received: from mail-am6eur05on2066.outbound.protection.outlook.com ([40.107.22.66]:53473
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726102AbgIAIpc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Sep 2020 04:45:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9AFuiFRolVvn/dQTMsKKowf73IDq12nKXdI9jyvFROFt+KLxYslYn8loceTnhkXiQfxEYPgjedeWnbM//pfiR35mq6Z/uihtLknJ+cNcm1rdW4dGvKJBWl8bIzeB0oqJN1c3b4OkXkGbKvYSlyulTdWuKZ0SqHnsCjsYjdcSVgvtD3SLfRuD+iFsem1AHhcnK+9Tuz3Q7RxMajtjZsqnoDz9gpL1GMnHdPzT8pfzW4zSyR3WdZ4IBeg150JIC8dUwY8HMZSKLnmTRtt/5fho61LkO/A9N9zRc7SOmQ8Wu01DoaUWhvN8XwjrgsJZkhupF2KtGBfU3ScRCkpFcm4Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpWW6CynpXwRUl7rbuq/HIXcUDl888Iu3yCla980YuA=;
 b=kdlD5r/Z4n/Zu+yoHX4vOxp9W/t8cfTb+GN9t7Bd1bV5eHm2UqC8UB6l41gWVT71TMhS/dNjHjzVqmeuZ+tYiXsiDyHmSspzb4zjoLlTO8aP7UI1mw5pOAB8ZPl6zdn4nKD+Dv+QdU/sf/fPJhE7j7xkhoFdCwQECJFWbjZ1l7+B9JvbfNG52DDbJgLuTQpzXOJzkmt2sI9PGNGxFGUdcJ9FWw5M0MGYDB5h1BG/xsYswf1Ae365VDHmSJk+q6laoQLzspme17rsOVUHJC7AWRlIvlyb05oJTZMbFcUfWHO4+bUIRuV2c3rYgrKqWUXeKudgGwb1nClzoe1N/Gfz/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpWW6CynpXwRUl7rbuq/HIXcUDl888Iu3yCla980YuA=;
 b=m6CdKXyif3VK8YrHavdiQuDoZUxJqLVXlT/lhkX18Fs7td/3DjVOtF4IAo2FP89VY5z20xVLYrMkxay9DuJyRwavW9nJr8EKTtBtyMJ6ZBYhdH7/I00T/JqamVxHddgNU/GwGTq6Jfj9jHAoykAzWjgUwTSY9/2dzHYKJDHk75o=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4360.eurprd04.prod.outlook.com (2603:10a6:209:50::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Tue, 1 Sep
 2020 08:45:29 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 08:45:29 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/8] usb: cdns3: gadget: improve the dump TRB operation at cdns3_ep_run_transfer
Date:   Tue,  1 Sep 2020 16:44:48 +0800
Message-Id: <20200901084454.28649-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901084454.28649-1-peter.chen@nxp.com>
References: <20200901084454.28649-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0226.apcprd06.prod.outlook.com
 (2603:1096:4:68::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR06CA0226.apcprd06.prod.outlook.com (2603:1096:4:68::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 1 Sep 2020 08:45:26 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 372a195c-a421-4767-6bbb-08d84e5360e8
X-MS-TrafficTypeDiagnostic: AM6PR04MB4360:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4360E157A7E73B6473073CC98B2E0@AM6PR04MB4360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zV5CcLvgDc0AK82QGL3EBZbR2aOIuCrhpiY5uzoyxcAE+mV3W8U0n5Tpt7plTNbNPNXh7WlxfqtLrzI3UCJ3tEtS722P95eRhM7rhZJ/IB38cPetZJXFvuxc54uNBmot1IOh35XfJM34guuHbsChxzfCGFa7K94Q3rnQWBZg0cg6aNgIAnO3n5L938a57N0AA6jUuoty4yd12p+D61HvOUjIbjKh0rSuXZgQLFJkrvvD5wGGCgtKGwmKvlPuASW6HaHM7/0xg1y+4NVyjYZvyX75YZo53wDo60nBA+LkF4oFtcnvRZrmgWRQb8uX3o7f2PjToCzfL3Ck/5CSMiEgDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(956004)(86362001)(26005)(8676002)(8936002)(66946007)(2906002)(36756003)(1076003)(6506007)(6512007)(6916009)(2616005)(316002)(5660300002)(478600001)(4326008)(66556008)(66476007)(83380400001)(186003)(6486002)(44832011)(16526019)(6666004)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: vplnAKpocNsfMzjBN7B+ozNWENkhT/04gRyhOlaJmZieWcju6Liy0YKDhnqv0mBz4/QVAY8kOsznocl20imYL1GLbGxxwZiChIcJZjmdavTXK2SUFZ2NanrRPXA9s2HGB7+7krnQ6DHj33GYIf+B/cYuDbAzfj5QBxW6abtElu6P131CW0tzdpcee49dkRBBuN8qOwRSrA2v3p9jHWGKuhSWvGU2GtoChrPqaFafsRUrVLDiesZX1egp2DqunVvig7gK7RWCIIW04fWGeYR1+LkFBIWJtXiJxlJWYlTv/l+JiLxd08AyRtIbXlee7Xi96bt9ueOeL6/kf90vHeMG7GBMBLJLPEymg+5k4Tg7IQcgnfobyaModtpzN4i/87UVKXpeLx5UJwYgZXLn9E4sdGGDsEMTp+iyXuPGW36LI+13ieCgDk6KLXE35VhrREfp7/RiJIxppvsbMRNE+Rj1I6FtGahLtAPqv6gorNiZf8o2oXIMjOoX6HZL5ul5iSNygWxksqVhohhSD8qTYwCwx7g0aHQ7jPUopnd1b5hPN8LI6c0xa/mZHXetIAvL4ii9hJ/VXeVFlmH5sJNhIG64zn94yb53i+qn5zXHzFTIVMM10Jdg050B6HQS2qRXFLT1OCbATIx+Dvr3YUjG9RzLHA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 372a195c-a421-4767-6bbb-08d84e5360e8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2020 08:45:28.9724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5WCG8c+1KxuCkAQYvIbPzgC2jD5/jVoySAiPosjL88ow/Lj4gV4BQfO6FC1pbDg1SiLiIawf1pSg7ARLdhxyfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4360
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It only dumps the first TRB per request, it is not useful if only dump
the first TRB when there are several TRBs per request. We improve it by
dumpping all TRBs per request in this commit.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 50282cab5fb6..f68c30b808dc 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -1089,7 +1089,7 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 {
 	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
 	struct cdns3_request *priv_req;
-	struct cdns3_trb *trb;
+	struct cdns3_trb *trb, *link_trb;
 	dma_addr_t trb_dma;
 	u32 togle_pcs = 1;
 	int sg_iter = 0;
@@ -1130,7 +1130,6 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 
 	/* prepare ring */
 	if ((priv_ep->enqueue + num_trb)  >= (priv_ep->num_trbs - 1)) {
-		struct cdns3_trb *link_trb;
 		int doorbell, dma_index;
 		u32 ch_bit = 0;
 
@@ -1265,7 +1264,22 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 	if (priv_dev->dev_ver <= DEV_VER_V2)
 		cdns3_wa1_tray_restore_cycle_bit(priv_dev, priv_ep);
 
-	trace_cdns3_prepare_trb(priv_ep, priv_req->trb);
+	if (num_trb > 1) {
+		int i = 0;
+
+		while (i < num_trb) {
+			trace_cdns3_prepare_trb(priv_ep, trb + i);
+			if (trb + i == link_trb) {
+				trb = priv_ep->trb_pool;
+				num_trb = num_trb - i;
+				i = 0;
+			} else {
+				i++;
+			}
+		}
+	} else {
+		trace_cdns3_prepare_trb(priv_ep, priv_req->trb);
+	}
 
 	/*
 	 * Memory barrier - Cycle Bit must be set before trb->length  and
-- 
2.17.1

