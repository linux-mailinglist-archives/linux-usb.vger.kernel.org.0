Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24EE0258A9F
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 10:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgIAIpy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 04:45:54 -0400
Received: from mail-am6eur05on2066.outbound.protection.outlook.com ([40.107.22.66]:53473
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726204AbgIAIpx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Sep 2020 04:45:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QAXEVY2zjbvXthskQXQTC1UM1NJ5CzrhLoi85M7IMT8aBy+1kcw9fAe+RKsd1GTJHgOtERnUhxv7AJ75YsJoonsF7WjhnJWph/qZeo4befhupsPilIOccWx4eJKHbvHUNAg8WaoDodv9m3E6d9CSd/wj7U7oYX+GLjEc/NPR0gE/WDGBVxkBrPKGPNDMLEw0PjkXmRDf/LiiZTTgQewi+HmIxj8Wt3dTzbHuQOxlgFtq6hmWf0e/GGP9XJt/AdXe4EWIV6qd1hvD7vymUgF3ckKc+YU9HkJZPDBgrExByEIDL/ybbC4dYvat5HMl4EUDhEofJAjHiGrSVsJtK0EMUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZWP+pWbo5dw9MlRV94vRk/FzC00vnkuaqDk9g9LEOM=;
 b=MvK5E1Dsf37DaOomMdeLpwdhnyv5KaMwznhD+2c/wWOIrZyJcFtDuPchTC/Oms5xVEGku9SkDnj+thUCI8z1oa/TyAdVlcO+pXXEcyxwEXb1gZ6F8vJ51tEcs3UbioOxX7kjiCI/2Irm5+NxYI5MevJYKsIMkBfPycLce14SQUehLQaRhlCLWpVi6ajk1GCMqqqMqJeSrFzl2cbujjk7S49L5J1xL5CJDL81zU99o0kiDMCwdfaB19aXPrH8QUbI1WNyjOSyyyaiXBk4qM6yv26V8UgsLIrKuMlUFWp+JSfRQHeGrLGF2fczf0jZCJtiO+P8V+m8sLr8CMT0GMyH9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZWP+pWbo5dw9MlRV94vRk/FzC00vnkuaqDk9g9LEOM=;
 b=VRVP43lzr9x9QZptWhMnQf0NLU6Biwatekgtri3UtKx848f3eC/+PMX8ceN7KbSMZc8GG/98KRTdKsYwAZ47Rd8sXcK3UCZPBz4UvZTJYvTr/Ddjgh759cgRZCyrj/QJm9E1Do6ezLbN2GgXQ+c9gxulxg4f5W/RIzrOc8AEtQE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4360.eurprd04.prod.outlook.com (2603:10a6:209:50::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Tue, 1 Sep
 2020 08:45:43 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 08:45:43 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 7/8] usb: cdns3: gadget: sg_support is only for DEV_VER_V2 or above
Date:   Tue,  1 Sep 2020 16:44:53 +0800
Message-Id: <20200901084454.28649-8-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901084454.28649-1-peter.chen@nxp.com>
References: <20200901084454.28649-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0226.apcprd06.prod.outlook.com
 (2603:1096:4:68::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR06CA0226.apcprd06.prod.outlook.com (2603:1096:4:68::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 1 Sep 2020 08:45:40 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d48e86aa-c93a-4608-bb3c-08d84e53697e
X-MS-TrafficTypeDiagnostic: AM6PR04MB4360:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB436015815FF3926EFBFAF2A78B2E0@AM6PR04MB4360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8JuX8Ls5GltJH3LFTB4rAKY7uy7dJRa6q6y4vlTu0KI8oiEQe67HHFC53pSB+C/nX5e6QtJ0ltz4aWbgTbQrgQEC9DHg9qto8CTndK9gUWLxeJmfgiq8S67UBDYVlSV9ZMQYJGIkZm+y03QsFcBhGgrfaWl4MtUwzkpdQIHjdojJwdFbrZGxppRe/owiekWJoW7fsp7j0qQCHebv8pcLG+vnp5qKBZ+MCVAVylUD1A48e3taLKcmDAyXvRAIBaKRlnbzGAYRgSwsbGeIwdhJROMM6qZVIJ54QhciyAtszoyKtCagBL7ykYv3zMimyUpK/qLs/QerUIyaJTSmA391GQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(956004)(86362001)(26005)(8676002)(8936002)(66946007)(2906002)(36756003)(1076003)(6506007)(6512007)(6916009)(2616005)(316002)(5660300002)(478600001)(4326008)(66556008)(66476007)(83380400001)(186003)(6486002)(44832011)(16526019)(6666004)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: SK7hVmLVGgb/a2F8Witcf+/k/KiBdqtNbnma5pA8xLpD4AoS3qD8VsFVKt1GEWErMZKyLYqK0wi7brhazDux44qv1477SPmCLLw9/F6Tec+GjJAgnU/APhCTxN2CZVLl7O4cK/jndnExB0NvSS3cN7wrLs6wAAvFq+Tu3CxjidXA3rqk0LvdS3v0Tgp5Cmtj3rg6P5+CUDwx9osH+qdgIsO2plQhOUfLlRbyxg2cQr7KrKP4yGOflELv39cK3/gr9rJa5M3hay0GFZ+jH/hUc+yFKZbeUQAzf4WBW2wLxbPuJGlP84tCwN8Wc+4M9++J5E6b0Nj86jgq1y5un5VHnaMsF5HCRQ0cYIAki/RbXqSTQYVqLw80XOp0nvlAPd1KNL3NxJM5UhCu2iGCu8v0/2zUTM4scmzNouNKKckwB/fBDCzVco36fkZEIPUjjfGQP3AIR7249g5FQGdW6yBK+0ic6oCGGSWT141Z5XTdJLxxjx++zqaSzuR7/m3Pv+H0ZsTJ/IVvJo/RQpEMHXfSfozeDMrwPjr4l7UvJs9KRoQLt1VVJNxCwLQ/Btl9XWPFnZFGhif06O7nmP/mplUSdh518KJqaADDejnMKpPpgIvzAPfCYYPDhByRrFC31zqQjxOWxtAJon9p9+Iy2VtIog==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d48e86aa-c93a-4608-bb3c-08d84e53697e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2020 08:45:43.5196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ugF7UE1OLT2UaaiJO1uWkEALBEFHNHsfGCSqlHS/D7z9f2iBZpiAeNWCWzD5M0SuQgZ7DVtYCoUHtDFov33IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4360
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The scatter buffer list support earlier than DEV_VER_V2 is not
good enough, software can't know well about short transfer for it.

Cc: Pawel Laszczak <pawell@cadence.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 1fd36bc5c6db..82dc362550bf 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -3161,7 +3161,6 @@ static int cdns3_gadget_start(struct cdns3 *cdns)
 	priv_dev->gadget.speed = USB_SPEED_UNKNOWN;
 	priv_dev->gadget.ops = &cdns3_gadget_ops;
 	priv_dev->gadget.name = "usb-ss-gadget";
-	priv_dev->gadget.sg_supported = 1;
 	priv_dev->gadget.quirk_avoids_skb_reserve = 1;
 	priv_dev->gadget.irq = cdns->dev_irq;
 
@@ -3200,6 +3199,8 @@ static int cdns3_gadget_start(struct cdns3 *cdns)
 		readl(&priv_dev->regs->usb_cap2));
 
 	priv_dev->dev_ver = GET_DEV_BASE_VERSION(priv_dev->dev_ver);
+	if (priv_dev->dev_ver >= DEV_VER_V2)
+		priv_dev->gadget.sg_supported = 1;
 
 	priv_dev->zlp_buf = kzalloc(CDNS3_EP_ZLP_BUF_SIZE, GFP_KERNEL);
 	if (!priv_dev->zlp_buf) {
-- 
2.17.1

