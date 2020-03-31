Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91BDA198E00
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2020 10:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729989AbgCaIKR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 04:10:17 -0400
Received: from mail-eopbgr20080.outbound.protection.outlook.com ([40.107.2.80]:8974
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729950AbgCaIKR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 31 Mar 2020 04:10:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TX60A8Jl48lIqwixHe02oPwWC9XAFMYVl+AnxEDtw48YpSLPpae4P76OIP8qB+TRSkrjXgQ3tR0Qa9DG9g2gihVENqqBMCh+su0XyBP10Wi82Ylmj7c1eFgliP98HZinZrjF/Q78RZFfBW4F7HoXzzwrtfW6eEPfQ8jdvIDjYEtR1eAQfjB9UqpBSzl1lmqf6fP0pN46KzmFXnoQJvtfSfUQPgnDhK09bfr1SkLgHLmO8G0/yl3v6yulT129i5iOR6VB2DrilK83QHGKXvxudIhHQwqdE2jPA3S2N0yEbvqD3plRY/m3I2wYdBIBzvpjmNrbBIP1msMcjSom/hVidw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJhyJsbya4+B58sp87W4OdZVrtusWyLWTMAsTpXmEWs=;
 b=mTt+XaoJD2TeOUJVeK90IhMZg9PDDwmbeYVhVWfUCe+YFTUVviW8S7aPUVu/Vd140WNoQZqhlGB2uXXTvdgPDS7v9jx/bx5hcvtK53LBmbgTOQxOyIKwZMCmmJDI8uRVFeTgx0pVyra+zgKAq+JhLEnfoicczsPM3ZoX3eUuPWJYUoVfo9AiCD/LBGV7V1oiwKMyNaREW1iBPgw0ALe5zvgI+NSyIe3SiHN6+h7dpwLo5yWmY2SxOvBfCzMX/bykUcQQqF5zND+DmzSGsrSwm4X6sG2pbPfY2oaQjsXJa8h9nJ1Kszg8OFusMWKeXRlxRoNc3JasMWcq/IowHpaWjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJhyJsbya4+B58sp87W4OdZVrtusWyLWTMAsTpXmEWs=;
 b=Pn6wVNwL+zmu0zdnyqLzndILsUv9W/Oz2WUBmMvpLLBVohhwgZotwpYN9hXZjMaUmaBJHqRGASCeJElC0fSgiWJ/I8FmK0icGKWdcnrXLPm61jJEzhzT+bnbBSyjAxG4yzzHLh+Ahok27IemULXNeTRiVXwzElNGIFQWGU1gZZM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (52.135.57.84) by
 AM7PR04MB6934.eurprd04.prod.outlook.com (10.141.173.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Tue, 31 Mar 2020 08:10:12 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273%5]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 08:10:12 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 4/4] usb: cdns3: change dev_info to dev_dbg for debug message
Date:   Tue, 31 Mar 2020 16:10:05 +0800
Message-Id: <20200331081005.32752-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331081005.32752-1-peter.chen@nxp.com>
References: <20200331081005.32752-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0123.apcprd03.prod.outlook.com
 (2603:1096:4:91::27) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR03CA0123.apcprd03.prod.outlook.com (2603:1096:4:91::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.9 via Frontend Transport; Tue, 31 Mar 2020 08:10:09 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7c45c57b-f99a-4cf2-fc41-08d7d54aef69
X-MS-TrafficTypeDiagnostic: AM7PR04MB6934:|AM7PR04MB6934:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6934D3840480EDE81C0C21AB8BC80@AM7PR04MB6934.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:77;
X-Forefront-PRVS: 0359162B6D
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(66476007)(5660300002)(6916009)(16526019)(186003)(6506007)(52116002)(26005)(6486002)(6512007)(44832011)(8936002)(956004)(4326008)(81166006)(66556008)(8676002)(36756003)(2616005)(81156014)(316002)(478600001)(6666004)(2906002)(15650500001)(86362001)(66946007)(1076003)(473944003)(414714003);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9YYcG0PxVtG4itFnDT3IHY6RB1xyM9uAqiZ6atqL1uFPKmwR7WToClTG+8aH/zryabFy6pUwbJtpS/beNIYIm4UqiKHkZ3MFPtUnwbYENYAi7AULYc9/spmQijHKdSUJ2WOy/DJyBTQDB6m8ENH1TA7yfLPcVc0veiFlNquTN9o9GZJEnF4qafqGaDn7eiwflKUJ6NR9PRVcu2YYmzM93FiboWxrVd2sKiPqKgWAw2ceZx+8psKxsluyTLDQeoabSrWuvIZaW8mgO6LT8pj2Vau4EhUAAbRAffU1TCu0cZucMEdU737eFemAdW557U6LEzm2ZH0RkBagfrSQmcq/iNywHcbiAwmo34mV72KVas6vh7DoPlEeLlfhTugm7Ih7hpQsFWKHzZrR2A29Dv4bsjzSikxIlRu5heQzzvN3GwsuiPi/M70dUZopQTMSR5rz5u2ze26yoN2QXziD+myzB5ORr0ATmQQgp1r5miv8VKHJ1UFwXfXI0Sh/77YCVCsUvvHz4oQ0aEZV6+k30cUQoQ==
X-MS-Exchange-AntiSpam-MessageData: Oz53O115HemI7JUTYdm5HhGFuORzMeyx0osWvVFrx7F5W9KWiJLbrYhx0zm7yVQJuBLgTo07qSci1reRHkCn/XARHmnuS3iFhaxAjxMCoytsg0a04xfico3LlsT+CLcUc3khTgiQOYcIdC1LqnlBDw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c45c57b-f99a-4cf2-fc41-08d7d54aef69
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2020 08:10:11.8963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7K9zG2mFqlFZxPBXLTLGFir4bihpTMPeWEfCobAWA68XNxKPkMASq6Cv5FZN27B5tGlj/pPOwUAD+DE2V/CuhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6934
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

During device mode initialization, lots of device information
are printed to console, see below. Change them as debug message.

cdns-usb3 5b130000.cdns3: Initialized  ep0 support:
cdns-usb3 5b130000.cdns3: Initialized  ep1out support: BULK, INT ISO
cdns-usb3 5b130000.cdns3: Initialized  ep2out support: BULK, INT ISO
cdns-usb3 5b130000.cdns3: Initialized  ep3out support: BULK, INT ISO
cdns-usb3 5b130000.cdns3: Initialized  ep4out support: BULK, INT ISO
cdns-usb3 5b130000.cdns3: Initialized  ep5out support: BULK, INT ISO
cdns-usb3 5b130000.cdns3: Initialized  ep6out support: BULK, INT ISO
cdns-usb3 5b130000.cdns3: Initialized  ep7out support: BULK, INT ISO
cdns-usb3 5b130000.cdns3: Initialized  ep1in support: BULK, INT ISO
cdns-usb3 5b130000.cdns3: Initialized  ep2in support: BULK, INT ISO
cdns-usb3 5b130000.cdns3: Initialized  ep3in support: BULK, INT ISO
cdns-usb3 5b130000.cdns3: Initialized  ep4in support: BULK, INT ISO
cdns-usb3 5b130000.cdns3: Initialized  ep5in support: BULK, INT ISO
cdns-usb3 5b130000.cdns3: Initialized  ep6in support: BULK, INT ISO
cdns-usb3 5b130000.cdns3: Initialized  ep7in support: BULK, INT ISO

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/drd.c    | 4 ++--
 drivers/usb/cdns3/gadget.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/cdns3/drd.c b/drivers/usb/cdns3/drd.c
index 16ad485f0b69..58089841ed52 100644
--- a/drivers/usb/cdns3/drd.c
+++ b/drivers/usb/cdns3/drd.c
@@ -329,7 +329,7 @@ int cdns3_drd_init(struct cdns3 *cdns)
 		cdns->otg_v1_regs = NULL;
 		cdns->otg_regs = regs;
 		writel(1, &cdns->otg_v0_regs->simulate);
-		dev_info(cdns->dev, "DRD version v0 (%08x)\n",
+		dev_dbg(cdns->dev, "DRD version v0 (%08x)\n",
 			 readl(&cdns->otg_v0_regs->version));
 	} else {
 		cdns->otg_v0_regs = NULL;
@@ -337,7 +337,7 @@ int cdns3_drd_init(struct cdns3 *cdns)
 		cdns->otg_regs = (void *)&cdns->otg_v1_regs->cmd;
 		cdns->version  = CDNS3_CONTROLLER_V1;
 		writel(1, &cdns->otg_v1_regs->simulate);
-		dev_info(cdns->dev, "DRD version v1 (ID: %08x, rev: %08x)\n",
+		dev_dbg(cdns->dev, "DRD version v1 (ID: %08x, rev: %08x)\n",
 			 readl(&cdns->otg_v1_regs->did),
 			 readl(&cdns->otg_v1_regs->rid));
 	}
diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 3c05080a9ad5..2dab1da4a2bc 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -2954,7 +2954,7 @@ static int cdns3_init_eps(struct cdns3_device *priv_dev)
 
 		priv_ep->flags = 0;
 
-		dev_info(priv_dev->dev, "Initialized  %s support: %s %s\n",
+		dev_dbg(priv_dev->dev, "Initialized  %s support: %s %s\n",
 			 priv_ep->name,
 			 priv_ep->endpoint.caps.type_bulk ? "BULK, INT" : "",
 			 priv_ep->endpoint.caps.type_iso ? "ISO" : "");
-- 
2.17.1

