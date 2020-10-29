Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3365629E7EF
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 10:57:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgJ2J5A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 05:57:00 -0400
Received: from mail-vi1eur05on2044.outbound.protection.outlook.com ([40.107.21.44]:27135
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725779AbgJ2J47 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Oct 2020 05:56:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLNqbNu+A9RG3AU/1m3Z1TP5iR1KIbQM4ANQ8xRzyf3qLwgKNgv3cXpef3KFpQK50vznuXiIhUHt6jbLyPRxjqnwBf/skWDVEpnmNreYMpaSByJphtLhp/zWy2049SGOC1roMiWdBxgKB2PUHlQZeenqzWzGKs2A0LsxbjBsz3n8tGWC+5wKONNx2xHXeEgWxI4o1pcMzQNPlhKQj8cEdsa+uh3iRdhOK1RRalCyHZLdof9Hbpim0sn0bCKJtvPXM2EiOQ6wxKv4w9T9IFmTeqU/W2pximqsKPvxw97I3e9S7s3G45TBOsFLR+Cm1d3L+JZdJTDfT4LpS6xmdUKZ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brFVvTc/3HDDF5VZv8kc/qO4GlXbzFKbXeTVhfAM6Jw=;
 b=h265XQAEYt49VGTN9K2dOfYBZDxi7LSjA87nYU5w8uHVmedztUYvGfMXs26gOq8sx/6SKFUOKP2uiMBuXOnOSn3nD8X2vQ/6AaT63wD0ckhIp2nmBGT+3Guv1idkJ6peTSLaK8UqiE40rOdvSTFaFShWknkwDmYogG90Y7oziL5sSfd1gNYT+/9ZbP8PcS7DZqqjXLOzYqofOe6ldBPE1qm1P8t+qVDSpRnOOOV/hTGO7+PDhRdhuf1W+OynuCPa6+VcxW2DlDkvbyZXqTXukamiMKKL0MJiGwO87Pme1/NDgD3fOpM2eITR35pDluo9YKeSA2QN9JqB7yrP57by6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brFVvTc/3HDDF5VZv8kc/qO4GlXbzFKbXeTVhfAM6Jw=;
 b=eeqdxOP2oQnKieaNw9KcQGpkWneIlsGhJx4kWucwp/JAoPsep/RtKqfn5E7CiYRV17XYsm9+/dv9d77HZl/xBbK1tmJrErdH8k9ba6kDmAvc7d10ZkiuMl+v69SsO/mKe0Q10xSbcrDdSdAdMza3sbS+RG3+W1Syp7IuxruJtdA=
Authentication-Results: cadence.com; dkim=none (message not signed)
 header.d=none;cadence.com; dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB4353.eurprd04.prod.outlook.com (2603:10a6:208:65::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 29 Oct
 2020 09:56:55 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3499.027; Thu, 29 Oct 2020
 09:56:55 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     pawell@cadence.com, rogerq@ti.com
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v3 1/1] usb: cdns3: gadget: own the lock wrongly at the suspend routine
Date:   Thu, 29 Oct 2020 17:55:18 +0800
Message-Id: <20201029095518.24375-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0069.apcprd02.prod.outlook.com
 (2603:1096:4:54::33) To AM8PR04MB7300.eurprd04.prod.outlook.com
 (2603:10a6:20b:1c7::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR02CA0069.apcprd02.prod.outlook.com (2603:1096:4:54::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 29 Oct 2020 09:56:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0843c054-c699-45d3-8921-08d87bf0f7e5
X-MS-TrafficTypeDiagnostic: AM0PR04MB4353:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB43537B873A3A3DA26EFF41F18B140@AM0PR04MB4353.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xtaPfrKCSj/RDwZ3txBzWVthdf6tCPq48Z4i8EY8xb5O45PA1vSP1LnFIqvNiLgtD/6UijXpGP9GSSw0IU6pvyyw3m4052KBv6WwrlFRmpJtvIT/nX23p2Enw6zlJAoQwqPvk3EvWwB0kXAgCpbz+x13hpYOfZeWVZb1heOgHwc2mKJgvW7Mg2Ry+09vOQZ7M5JUoG6DzBgvwGg9aqD/ql/k6L7+OStUQKZy1JbAMIc4PKIHiSatA40fDw9/dd90hRR82ytjprMggZzUWyTKH8/J+tz+Y5yLdpLuqziAJsngu3cfrMJ2maQ0U6D29wukT4P4KGSxHibSNHcKXIgb7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39850400004)(346002)(376002)(136003)(66556008)(4326008)(86362001)(36756003)(44832011)(956004)(66946007)(6666004)(2906002)(15650500001)(26005)(66476007)(5660300002)(52116002)(8936002)(478600001)(6506007)(316002)(83380400001)(6512007)(2616005)(8676002)(16526019)(1076003)(6486002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: fYGzszua5HjP0YYTteQMn6KS0pK8x+lyL11u02RDCRBKTs0eE9EMT2dXoVzC1ohrncdcoCquBfdN3f2S0WzekjHw/p2aEswsM7P/2SLt6wAaIAPhuLkq/IcKjfOJfyimfHL7VahYSbgGndp+qtCdlgUBTewThOVJ+nHX9tLUS3w8dypDujnXBGSrRGavwzS9lATC3H75HzxuZIZXe3AIzP4lOIAO92nY+k/caEZ1zq2ya9CHNlxJ/Ts469FQ9nAa0Q/PnNBZUNXrYi7Eo4Z30e9LoC7IjWP3BZGGeyhESrKNXvr+jiEz1xfT8mGgUVFdEfBFXZxMQN6yt/Qgcp8fF6v9Rm9LJ8mg98azc7UkskZ5FHv7tnvzkLVrtJ3iH1J54ft2nblQSEiRDeqMRJhy4BYXSTRUWFghiT8Rydax0tIgQJAR9IFSscOTtABUTVxvt2MhAb3x61ntBE7YnOGfvTHfuqPlrhZlCT4Gfvh8pnozxY1Yc4vA2IhTgCfVL/ZxfFn2aLpeIjBakp32d7yyexYeExzsqLrTOslHhQg4Vlc9ESTIFsLAPk3TCOZnqJLs3udbs2s5KEGXwtZuT0f5saCeiP3Pd+D1+aX7sqn3K3o4Ar/XQVrJrKdNA0n7w0eHkNtBS/wDZv2VPh4ogAjN+A==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0843c054-c699-45d3-8921-08d87bf0f7e5
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2020 09:56:55.6040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ICmYaA3s23zftwfL8ucSzocyONF5mFEfI6RpATuA/u/NhaxbvXUP2gRMdkLmq6VPtCGSa+9u1upppqhhkK7cfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4353
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
Changes for v3:
- Add __must_hold sparse checker

 drivers/usb/cdns3/gadget.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 6ff3aa3db497..8e02ccdbd4c5 100644
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
@@ -1759,6 +1756,7 @@ static void cdns3_disconnect_gadget(struct cdns3_device *priv_dev)
  */
 static void cdns3_check_usb_interrupt_proceed(struct cdns3_device *priv_dev,
 					      u32 usb_ists)
+__must_hold(&priv_dev->lock)
 {
 	int speed = 0;
 
@@ -1783,7 +1781,9 @@ static void cdns3_check_usb_interrupt_proceed(struct cdns3_device *priv_dev,
 
 	/* Disconnection detected */
 	if (usb_ists & (USB_ISTS_DIS2I | USB_ISTS_DISI)) {
+		spin_unlock(&priv_dev->lock);
 		cdns3_disconnect_gadget(priv_dev);
+		spin_lock(&priv_dev->lock);
 		priv_dev->gadget.speed = USB_SPEED_UNKNOWN;
 		usb_gadget_set_state(&priv_dev->gadget, USB_STATE_NOTATTACHED);
 		cdns3_hw_reset_eps_config(priv_dev);
@@ -3263,10 +3263,13 @@ static int __cdns3_gadget_init(struct cdns3 *cdns)
 }
 
 static int cdns3_gadget_suspend(struct cdns3 *cdns, bool do_wakeup)
+__must_hold(&cdns->lock)
 {
 	struct cdns3_device *priv_dev = cdns->gadget_dev;
 
+	spin_unlock(&cdns->lock);
 	cdns3_disconnect_gadget(priv_dev);
+	spin_lock(&cdns->lock);
 
 	priv_dev->gadget.speed = USB_SPEED_UNKNOWN;
 	usb_gadget_set_state(&priv_dev->gadget, USB_STATE_NOTATTACHED);
-- 
2.17.1

