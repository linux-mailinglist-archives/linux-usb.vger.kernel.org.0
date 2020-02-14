Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18CB815D29B
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2020 08:15:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728851AbgBNHPe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Feb 2020 02:15:34 -0500
Received: from mail-eopbgr140087.outbound.protection.outlook.com ([40.107.14.87]:21077
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728740AbgBNHPe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Feb 2020 02:15:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRBxOfti/qdBpPS9ZcpHxpq0coHHeCmFTcjwCUFo2z7WZNweZJ7tmWtipnAgW4NYrS63YwKHGLalUHadN9UuROmainqnEMww0sGSoDmxorseb0CWPR3wMXfI5HkO+Mrogd79/AC9LOt4bW6ygVL0DUwiQ8eiPO1MD4c442VNyv5U+aIYRM4hnxjmRVeeYN98cSZKdjFEmD/tIZUq99wT31bS1+KUTshyiGtWV9ZpzkIwtse30pS6MYCzef21uafqsQFdZRbfSJbJ0ouuolaJxHfOkL9j4g9kaLD3gIANtWvi5BlWmRay8sEtd8hWNt4g8boN9PAJr7udNP48xzBxAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9CNIulhD0DUgQUsKXsNyLZGIVf4346nWW1koABr5NM=;
 b=fJM82m3C9DgX7tYXwjjiw4pPyro0WkdcCxId/KY+4Gm6pepdu6C9cA8x7f6S6NzkBV/KCUffOgP3F2uK8llaiCwyo6NiBK4kH6OTxPd6G2LV2NbWAgS+yWLVsHu4MLuSMlBxKKTmptQHvXG2Z9Sqq0u3kM5EDJMc4zpaf+IZl2nl0zIvs2Sa/1Ns265An/YPKrE0ackQz0SFvNpyjoHHZv8nIAbT7BjAH6tX2gCq4uEJTWaRJ+Pd18ODy4vS065ioKrjFWjWJr2QV9Blcb0S0nv3xuYdzr9JYIDvv0XKFVln0ZpMYjTiFFXuQYDZy68TH/SPIfPJF/XJqTer92kXAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9CNIulhD0DUgQUsKXsNyLZGIVf4346nWW1koABr5NM=;
 b=H2PwfahMDS4pso10VKGxX9ZCOEVXewMFcS9LE6rixOEw/BtfdvFOFf2dJSmAXNTvn28m4RV2EkPZe7kxD83Avsjc4bJxMwo5uO84FPaGBZ2GOttqgLgAzI3eUKEBOJeiOpWeZaTlLJ46UWKe2OWgdDpKp9pVTE0sy5x2GFiqGlQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB3997.eurprd04.prod.outlook.com (52.134.123.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Fri, 14 Feb 2020 07:15:28 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2729.025; Fri, 14 Feb 2020
 07:15:04 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/2] usb: cdns3: gadget: toggle cycle bit before reset endpoint
Date:   Fri, 14 Feb 2020 15:14:14 +0800
Message-Id: <20200214071414.7256-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200214071414.7256-1-peter.chen@nxp.com>
References: <20200214071414.7256-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0111.jpnprd01.prod.outlook.com
 (2603:1096:405:4::27) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:5c::23)
MIME-Version: 1.0
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by TYCPR01CA0111.jpnprd01.prod.outlook.com (2603:1096:405:4::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend Transport; Fri, 14 Feb 2020 07:14:43 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 80974b6b-0c35-44bb-b852-08d7b11d9252
X-MS-TrafficTypeDiagnostic: VI1PR04MB3997:|VI1PR04MB3997:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB3997C3A13C41FB36B05299B98B150@VI1PR04MB3997.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 03137AC81E
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(199004)(189003)(478600001)(66946007)(6916009)(44832011)(81156014)(36756003)(316002)(8676002)(81166006)(86362001)(8936002)(956004)(2616005)(6486002)(26005)(6666004)(2906002)(16526019)(186003)(66556008)(1076003)(66476007)(6506007)(5660300002)(6512007)(52116002)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3997;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RL6JUWZn7CkS9jCCxmb16V/XmlDVzIO4jNnQMDmKZtwQhjI/qmbm1AtOkouK34EdJk7x7HkYn1FqnJxG4w3p/dRxdpr6kAQHjQoueQ4uU7Xj5BgRlN2y7lWizcerpm6caxeHJ7JIQjMMFdu6wIbuDztpgEAf2bPyHfBQxmkWR+fSyDNYwCGfQZnQ7mKEBQmORX/mVI0py/MKJUKWia/lRmyOYS526IMVx8q9wK4IRRj3V8TlNKLBT4BEKrafiS2EF7DUbhIZTy76JeF2908+8Esgr/Bfq3QkEAwV23c59KhsSWtwh+38LUjnMGnSn/Owom7I9Lp+cAXamltDrY7OBJp0dTcS2u1S+DjHuJ9caPG3cy7SNmPLWpywBjzCtlLylp00AZElVBsByofN8liqgjfSAdeRLENh9Ly4SQYZ9NOFnwlO5fY/kR5X0AfGi+mu
X-MS-Exchange-AntiSpam-MessageData: +tsTO7cSSgs1JlhHTGFmgY081I3WqxB/WmSAlj+APBVF3cJs+Frv7VaO9MQ1e8EMFsq/G5GMJ+/utuOede1gP6dk47P6Mp7sVpt+9RmimiQS2UD2KePNsAm50UGwZnRmjX6nCCA3Vvf6QI7ITGJlzA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80974b6b-0c35-44bb-b852-08d7b11d9252
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 07:14:46.5545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVCxKy6aVShK/gDeya+EmCFVnp4Uus0XwpPWg9UkRIS3QxUF8Pos4hmJcULPekHXsFxrKF1AUkvgv16aJPuY7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3997
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If there are TRBs pending during clear stall and reset endpoint, the
DMA will advance after reset operation, but it doesn't be expected,
since the data has still not be ready (For OUT, the data has still
not received). After the data is ready, there isn't any interrupt
since the EP_TRADDR has already points to next TRB entry.

To fix it, it toggles cyclt bit before reset operation, and restore
it after reset, it could keep DMA stopping.

Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 1d8a2af35bb0..7b6bb96b91d1 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -2595,11 +2595,21 @@ int __cdns3_gadget_ep_clear_halt(struct cdns3_endpoint *priv_ep)
 {
 	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
 	struct usb_request *request;
+	struct cdns3_request *priv_req;
+	struct cdns3_trb *trb = NULL;
 	int ret;
 	int val;
 
 	trace_cdns3_halt(priv_ep, 0, 0);
 
+	request = cdns3_next_request(&priv_ep->pending_req_list);
+	if (request) {
+		priv_req = to_cdns3_request(request);
+		trb = priv_req->trb;
+		if (trb)
+			trb->control = trb->control ^ 1;
+	}
+
 	writel(EP_CMD_CSTALL | EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
 
 	/* wait for EPRST cleared */
@@ -2610,10 +2620,11 @@ int __cdns3_gadget_ep_clear_halt(struct cdns3_endpoint *priv_ep)
 
 	priv_ep->flags &= ~(EP_STALLED | EP_STALL_PENDING);
 
-	request = cdns3_next_request(&priv_ep->pending_req_list);
-
-	if (request)
+	if (request) {
+		if (trb)
+			trb->control = trb->control ^ 1;
 		cdns3_rearm_transfer(priv_ep, 1);
+	}
 
 	cdns3_start_all_request(priv_dev, priv_ep);
 	return ret;
-- 
2.17.1

