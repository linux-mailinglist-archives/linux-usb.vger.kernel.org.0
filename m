Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B52B02955DB
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 02:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894512AbgJVAzz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 20:55:55 -0400
Received: from mail-eopbgr140089.outbound.protection.outlook.com ([40.107.14.89]:31714
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2894507AbgJVAzy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Oct 2020 20:55:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWHIcmVu8CHuNWdL2jCS/sijhilufKEcw5wtYuXsJqaOHZKc80J6QWlURfxI24aiFqwyH9gquFoDpIcnQh3MwPJ868EEGYh0KLL4LMxopVYscqz7FWsm4u5UvtQJUzU/4k8bOb2uhmby91ZN1/M9/8ux16xo7gSGOBHhflv1XaDrUrua+ILzQFQKW5TgdQao853bt4Y7NYywGQe3mS/GGGPgSFE4MLCbDAb7ebKfkgdsogU8NRD7Sh2ZxuA7Hij/E3kbjMKgIZ9MS0RMX59rn0ksTTFG+uR71kgjQRPrkLxmZ67n1efs/Y7DyMSr2Fi5FzDg+zjPudzx8Ttxgxn2pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCETu0MmhegaGIC5cmmkurT+73lcQtLVZQe6ABQDNv0=;
 b=I/f95ndPn9qvI5Nqbd95/oTpf0fTFGLmgH6gsxYXYq9t4YjSt3eZiy7VZ0jbnxHiUriZjVWM7E89PKCZgQtkt5pGky3TQPrlIEI7RJy7s0Y79QMaM6W6jm0Zmzx6V1ewvb96s/oVZemeemxvVfgrKgaZ12HbGUvs51EPMUuWUJc0tfyB4NMs/HuefyrO8gWG+PjTTolwt3l62mNdXAbYvLCmMtwL9hm3MfoTC15PdcTAQ0BTCsjK+UiU+trrytM3r61pIKqa19NR9CUslptGRJnKiiEX4nXMKMFHfPIEygfLg5oc4BEN5lc1/rrBxwpOk5hBM0psehTVX/U9Tk7iTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCETu0MmhegaGIC5cmmkurT+73lcQtLVZQe6ABQDNv0=;
 b=lpu36HI0J73cnNTtWDae1TBomN6hapiBNCqXbTuW9mD/wOkhTZFj1HX3lyhfUmr8+u8VNuRnw9xgZ5Nc7hM/cV7I0++5hBevB7Q3b7YwvGvpFxhF725XMgPtenZ1mt8emwjaF8HwkkKJIwrSuhihBKRjqHof062vL32ooaA8yec=
Authentication-Results: cadence.com; dkim=none (message not signed)
 header.d=none;cadence.com; dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB4355.eurprd04.prod.outlook.com (2603:10a6:208:5a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 22 Oct
 2020 00:55:50 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 00:55:50 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     pawell@cadence.com, rogerq@ti.com
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 2/3] usb: cdns3: gadget: own the lock wrongly at the suspend routine
Date:   Thu, 22 Oct 2020 08:55:04 +0800
Message-Id: <20201022005505.24167-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201022005505.24167-1-peter.chen@nxp.com>
References: <20201022005505.24167-1-peter.chen@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0102.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::28) To AM8PR04MB7300.eurprd04.prod.outlook.com
 (2603:10a6:20b:1c7::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR01CA0102.apcprd01.prod.exchangelabs.com (2603:1096:3:15::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 00:55:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b0a66eda-817c-4ad6-18fa-08d876253875
X-MS-TrafficTypeDiagnostic: AM0PR04MB4355:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB435508514F2B3A12543963338B1D0@AM0PR04MB4355.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nwHacmOo31CM2LgWS8a38aUa2Y2xoME4VwgnYco5lzbyaa5SU/k/qcXgUzB6zYlz+Tu5OrF9+Mt3B9Db8gERayQE1WDYGyOAbXjhtjWNKeP89mcLe3jLKe15Mp/NCmH+VqDhI7sMP+tEywC5eBfFEnrgCYr69jcbQXAKwMNVYRUu02If6N2shB3TdJz1MwyaqEwY4JbR1Mz3lDttM7JaD3+Zm3zYiVqe8AUeDJwuth5xs5jK51J4ZnK+QNJTw67G9//fxQDwzNMZmgFmiE2Ke3cLF2V2Ax1ngp01+N6eWH3vIu29GZZOGL4yAaCW6wx+Q4a+QOp18Siq0ufNVIv4vA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(86362001)(956004)(8936002)(6486002)(2906002)(66946007)(6666004)(66476007)(66556008)(5660300002)(1076003)(15650500001)(36756003)(316002)(6512007)(44832011)(2616005)(16526019)(26005)(478600001)(8676002)(52116002)(83380400001)(186003)(6506007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: BYTIXSTRuqYjNjBlb4tcJqIxMQqtc/NTieZBz7p2aO/J8na9K6RoZrAv/OMMThM4zNO2mNVBO5oiLORwAi6SSh3hh8QANUHdZ0qUZ5suoUvHNrgYNyMefNJHWTK/drx9epKXjFhaPbgi+5GvpkS7zvE2lx1vnK1/j5ROaIMCLGfHlSPEsZgj4zf3XQJDK71pEzm1fzACn2zJOzzz2yYh2Gj4VYam6jFoFDLmODTu/9jd/nvSYIWRtdCkCfK80XxujQhyGIdkL1XeEg/FcCMuJtRCNHTS15/djtbOoul0uFrkpRtI+NZPsn1zC8iBvLuxroPn2INZPDnA9GlrpSRFwbxxt1SL1nzIhOmlE9n2DRwr1fJAaiSsozzAQNr1GfAcxuTefdwEzj9PuZHvpCT3qzJ8Q5zA/Mr3OP2/Ij1jMF2izBkxLzmBE7zEapM6KZ6S1A8gf22Kq9OLYMleMH8KCzjzzEP2CFO3DQF6rKYflox42vjo95Q2APzlLishOt/bRZuu9r1wvIC5EwRaYBwkC9LV4UXDa/0Wguh6H9VxCEfY2WqT/r2eqZTITGANG216rz7fjiiXxSEftOIPX1elJvSJPEwJDE3iCPvQC3a78JCD5SXxr5tXAm2wi94Bbal0DUzH0e1qQ8B/TlmVf31UoA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a66eda-817c-4ad6-18fa-08d876253875
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 00:55:50.8131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPwCxRijHAlPakgAR5FkKPmVaDn5LYdRqAzIZSVQ6aJiVY/i7QpOxtqk819VDS1tHYHE3RMyvT34SNd3gxMaVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4355
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the system goes to suspend, if the controller is at device mode with
cable connecting to host, the call stack is: cdns3_suspend->
cdns3_gadget_suspend -> cdns3_disconnect_gadget, after cdns3_disconnect_gadget
is called, it owns lock wrongly, it causes the system being deadlock after
resume due to at cdns3_device_thread_irq_handler, it tries to get the lock,
but can't get it forever.

To fix it, we delete the unlock-lock operations at cdns3_disconnect_gadget,
and do it at the caller.

Fixes: b1234e3b3b26 ("usb: cdns3: add runtime PM support")
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 6ff3aa3db497..c127af6c0fe8 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -1744,11 +1744,8 @@ static int cdns3_check_ep_interrupt_proceed(struct cdns3_endpoint *priv_ep)
 
 static void cdns3_disconnect_gadget(struct cdns3_device *priv_dev)
 {
-	if (priv_dev->gadget_driver && priv_dev->gadget_driver->disconnect) {
-		spin_unlock(&priv_dev->lock);
+	if (priv_dev->gadget_driver && priv_dev->gadget_driver->disconnect)
 		priv_dev->gadget_driver->disconnect(&priv_dev->gadget);
-		spin_lock(&priv_dev->lock);
-	}
 }
 
 /**
@@ -1783,7 +1780,9 @@ static void cdns3_check_usb_interrupt_proceed(struct cdns3_device *priv_dev,
 
 	/* Disconnection detected */
 	if (usb_ists & (USB_ISTS_DIS2I | USB_ISTS_DISI)) {
+		spin_unlock(&priv_dev->lock);
 		cdns3_disconnect_gadget(priv_dev);
+		spin_lock(&priv_dev->lock);
 		priv_dev->gadget.speed = USB_SPEED_UNKNOWN;
 		usb_gadget_set_state(&priv_dev->gadget, USB_STATE_NOTATTACHED);
 		cdns3_hw_reset_eps_config(priv_dev);
@@ -3266,7 +3265,9 @@ static int cdns3_gadget_suspend(struct cdns3 *cdns, bool do_wakeup)
 {
 	struct cdns3_device *priv_dev = cdns->gadget_dev;
 
+	spin_unlock(&cdns->lock);
 	cdns3_disconnect_gadget(priv_dev);
+	spin_lock(&cdns->lock);
 
 	priv_dev->gadget.speed = USB_SPEED_UNKNOWN;
 	usb_gadget_set_state(&priv_dev->gadget, USB_STATE_NOTATTACHED);
-- 
2.17.1

