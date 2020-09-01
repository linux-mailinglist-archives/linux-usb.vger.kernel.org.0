Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB232585A8
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 04:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgIACel (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 22:34:41 -0400
Received: from mail-eopbgr80078.outbound.protection.outlook.com ([40.107.8.78]:38116
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726489AbgIACel (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 Aug 2020 22:34:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NEbYjR7EDhpCYGUX45Xw//S9tTyQNyr/RS+0PUBmPDs5KBPqUdiQC1dhiz9hRcKv37a1CNtN7ogTijzhGR8euTA1/mhshgk6skgSLIfG/v4Lr686pBXJN6g6ETj5lkjx+Ok+cx+NY8+nUjzOXbW6GpgJwUyjhdA+lTpP6U5O6g9OaPGPx0x6pTneA7uguNGVlszV56p2QS6xdxTjmxQPCgMlpCxiG1iDcM2WMNBt+WkBrij4QEQXmE2/RamZP8V5OzevIMvOL51amtv0t/ksmUBVJS7xbuMm6z7zQcr1/sig3qkUFwNSo4jYBjr9Xu7n3+PPN13PVpNBKwSaGQFNOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bItBgTQ7MUz6WhdxjjoI2x7sUbGIQEpF5NxMzoh/wE=;
 b=cHa972UVzDgRKufUfSK4TWnjXdVgLR2cYOVVL4/V6vMVsSOukOssUdSrGdvcr66BTkM9vslNOYUFygjhf8b+/0AfH0fbLCt2o6TLZUFi/xaq8mtCTbUxM9DG16R0JNnzXrkTn0PFBiA+dYAKqdrz3EEAv3mgV6/sSRWPdZhvTkOjGtq63MAJzJzZwChPC/GYqPyAsgGHwFuSFtD8pobDbcr2ey+qE9Bhge+6DBb/dZOllryeosFVfNZqQ6Yx6dtqFtoY1dFOvV8oCI1BbNNtPkwwWlv+EVVy8WWQn/c7cZkvQBbZNquRiDrfQNMnnEw3IWOKmPIvpe+/VfBmtzEZ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bItBgTQ7MUz6WhdxjjoI2x7sUbGIQEpF5NxMzoh/wE=;
 b=fGS1XSQzQK8G6Tesfw2Gpz9xPrdNaj5LAcPiG7F6mOP2IbJb5qvyqBAm0THhm+EHQiQXgZAHpAMvJycRgpi8QjhASmojoZ2uab5q/PSNR5iG3X4Hd8pN5c8qSPVIm2exA9s806MOow3ml501oRkgUNNMIlnsgmpxe7Em9AEKQ3o=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6998.eurprd04.prod.outlook.com (2603:10a6:20b:10a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Tue, 1 Sep
 2020 02:34:35 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 02:34:35 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 5/5] usb: cdns3: gadget: move wait configuration operation
Date:   Tue,  1 Sep 2020 10:33:52 +0800
Message-Id: <20200901023352.25552-6-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901023352.25552-1-peter.chen@nxp.com>
References: <20200901023352.25552-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:3:18::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR02CA0046.apcprd02.prod.outlook.com (2603:1096:3:18::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 1 Sep 2020 02:34:32 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: deb838c8-309f-4ab8-6ae4-08d84e1f9097
X-MS-TrafficTypeDiagnostic: AM7PR04MB6998:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6998E591D09217D4BF2985938B2E0@AM7PR04MB6998.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:439;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: id5FkXON/uXZI1Uo7ronp0wnr+H/0m3oXwvevEC83+OA8gTxCI6+5Bp4gkR8mBPRpE9xSD39Tc2vQXJyLvFgjE0zjGcXoK5+zb0oYsHEV8p0QYX8/R8BAGA7asXBRkoSs8/qFu26nBVlTT/oxbl++5F/XefYLfTshAd8zdhzb1eJa0cuJYdAaq8btOeT7i/jETd7PCWpUlwlt5QFUdZre4dC5KiiZchiMu+YtU+eVkBLKqyW0jrPSU4wugNYxiinyBwGSkN/PMoJrEsoM7hH04FZsI70sNn3e6lu6fsijGl91ldEvYImHxVcyt2tcWmnxIX3r8fWI4bdp74XJK0XMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(6512007)(6506007)(4326008)(16526019)(186003)(83380400001)(1076003)(26005)(478600001)(6666004)(6486002)(2616005)(52116002)(8936002)(2906002)(6916009)(36756003)(86362001)(5660300002)(8676002)(66946007)(956004)(66476007)(316002)(66556008)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: oDGntNHuwu4HEcIh0yEgvJMJp4Zbv2l/xSi4TilfIwk9Z4PqRql3LHyNFIyUP2Z/gwrUQ35KaJTehtBCAUw97uKOK1IGvh3V5gLxr71nBkW5sRpIy/IPku8aSlN879OB1Ntlfv+5B1CxFj5+om29YFoPIm0WTgSV2aI5791fdFjRnr+8bbl2qBcGCPk43AFXM2LkVSvaVjqY+aMkX5W3zuZSLsi/7+5ISi32VMldvTu3iAmeSsicLmzSGoqKBS0NkGp75o9wFNmckXSMszhYtjJTG94svIIib+rzPGJVjHTyG7G/BCKjFOehJ67HRlz1HZlT35VIs5ZzaKI0vw93F2cfbPnuj8jLSHAWr0fP2pUsQNtiuodT1UGMyttWOPsrrclMIuIBBG097P2913nyUfoCbuMO2lJHlmB4rJtSsDajFGbb4dWN76l5CGVIx2TpA80c6j6ESGdoarGWBfCdTlkV+Nq7sLZA0FB6tB4B8j8s7ore6ZgfNyJELDqfC1mccmWOk+AL2yp248+lUxfc40zmfi3R3igZUpFwPnLjQJcoR0pus1Ij8MFKxLFuYXI5QF4r7SAbaXN20MEJ/kIn7xhfnf9lm8TvfxPpIE0m+QFQrSJAmXM3WfIFT6XVYHT2tvmB4aGsirLxpGVD1cQ5CA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deb838c8-309f-4ab8-6ae4-08d84e1f9097
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2020 02:34:35.1751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DcHkUvJ4cnJ3uTJo4EF/z9K/oHiqBdeh8ubzsXjB2J+4EubqeJgIUawaASS0hM0Tj5DtDe7sA7SAQe111n7h5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6998
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

After commit f4cfe5ce607d ("usb: cdns3: gadget: improve the
set_configuration handling"), the software will inform the
hardware the request has finished at cdns3_ep0_complete_setup.
The configuration set bit is only set after request has finished,
so it needs to move waiting operation after that. Meanwhile,
if it is timeout, it will show warning message and return error.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/ep0.c    | 10 +++++++++-
 drivers/usb/cdns3/gadget.c |  5 -----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/cdns3/ep0.c b/drivers/usb/cdns3/ep0.c
index d9779abc65b2..4761c852d9c4 100644
--- a/drivers/usb/cdns3/ep0.c
+++ b/drivers/usb/cdns3/ep0.c
@@ -717,9 +717,17 @@ static int cdns3_gadget_ep0_queue(struct usb_ep *ep,
 
 	/* send STATUS stage. Should be called only for SET_CONFIGURATION */
 	if (priv_dev->ep0_stage == CDNS3_STATUS_STAGE) {
+		u32 val;
+
 		cdns3_select_ep(priv_dev, 0x00);
 		cdns3_set_hw_configuration(priv_dev);
 		cdns3_ep0_complete_setup(priv_dev, 0, 1);
+		/* wait until configuration set */
+		ret = readl_poll_timeout_atomic(&priv_dev->regs->usb_sts, val,
+					  val & USB_STS_CFGSTS_MASK, 1, 100);
+		if (ret == -ETIMEDOUT)
+			dev_warn(priv_dev->dev, "timeout for waiting configuration set\n");
+
 		request->actual = 0;
 		priv_dev->status_completion_no_call = true;
 		priv_dev->pending_status_request = request;
@@ -731,7 +739,7 @@ static int cdns3_gadget_ep0_queue(struct usb_ep *ep,
 		 * ep0_queue is back.
 		 */
 		queue_work(system_freezable_wq, &priv_dev->pending_status_wq);
-		return 0;
+		return ret;
 	}
 
 	if (!list_empty(&priv_ep->pending_req_list)) {
diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 829bc917df39..2ea4d30e1828 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -1309,7 +1309,6 @@ void cdns3_set_hw_configuration(struct cdns3_device *priv_dev)
 {
 	struct cdns3_endpoint *priv_ep;
 	struct usb_ep *ep;
-	int val;
 
 	if (priv_dev->hw_configured_flag)
 		return;
@@ -1319,10 +1318,6 @@ void cdns3_set_hw_configuration(struct cdns3_device *priv_dev)
 	cdns3_set_register_bit(&priv_dev->regs->usb_conf,
 			       USB_CONF_U1EN | USB_CONF_U2EN);
 
-	/* wait until configuration set */
-	readl_poll_timeout_atomic(&priv_dev->regs->usb_sts, val,
-				  val & USB_STS_CFGSTS_MASK, 1, 100);
-
 	priv_dev->hw_configured_flag = 1;
 
 	list_for_each_entry(ep, &priv_dev->gadget.ep_list, ep_list) {
-- 
2.17.1

