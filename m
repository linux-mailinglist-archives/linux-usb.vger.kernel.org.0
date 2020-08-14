Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C20DC24448A
	for <lists+linux-usb@lfdr.de>; Fri, 14 Aug 2020 07:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgHNF2h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Aug 2020 01:28:37 -0400
Received: from mail-eopbgr70054.outbound.protection.outlook.com ([40.107.7.54]:62158
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726567AbgHNF2g (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Aug 2020 01:28:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGgRyhxuGrAvw4rdxymbP4i42cpF1W2nadGpj/4UI86Rl5tOdDe5kl31QlV9OfTiDccIOR5QwSYmi75rkqVwn4N/k7A3zO27tfSS4g8btrEVFv+uqWBr6ZIB/TPYL9ZwnPVSK8txb7Gisz6mNhmd7eSz2qU+bXxhjJkFgLOgGpU1knrFWz8Iw5xs+LJsJWzxjGcLjiovpqVZoyQqPYbi8o5zjpJRx4jh0CbZRBr4/QGzN+EzgGuPhp03JkvCr8t9c8JlDD873ki6YmEnan3qwhhC/z6vBA37Y09IL8kHGs8THnDrpdywbKhOaLFbAW29xSkoxfsKXaaZ1sZ58S4zsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGRme9I1iCV1dWxDd0zgeAhNJbTyeEfna0s68vwG2WY=;
 b=UvFnJzHl6TF1+COmpp4e2UY0y5864eEq8Mk5Yly/DvWuIqzrSfPgOG8+MnPRenZuqaS2kGM6p18zpi/6Tru9xcCsOSogv8gAv7LW+Hd22x+FPn0vGICdp2q9Stu34KGq3Xjh4cpahO4TYjjY8fRq2RnPd46pYNVejkHe6eP1AojnIUbs8djCgGQ2d16ec7+U+S6dQNWuMtj80+KfwENz+5Ba037rnk/ykGQ+19mUrUw5XiCpMO3rJBTktKxjHM1xi4A5sjyV2uz4zKTZBC5c2SwXXt6nqtEC8D+vOOayl32cmulKXtFf8aeroR2ZBVl23XxBFP8KamRT7icKdYdGeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGRme9I1iCV1dWxDd0zgeAhNJbTyeEfna0s68vwG2WY=;
 b=CybYVF4f7AS9CEHfKcqFmO8tCaCj16M/QbMvwa1foeStN3zGUAAfgrBujCrE5RIuxsIrbmR+lQp8bwZUJEvv+LKiRn7JPGl2Kv6rTXpxWEKuj8A54I0ZmemWyGZD2vwk0N7Vs6qibc5b5dnJkO82bQ9OcCmHwdTAJG2u+y+MOqE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB3PR0402MB3641.eurprd04.prod.outlook.com (2603:10a6:8:b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Fri, 14 Aug
 2020 05:28:19 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2%9]) with mapi id 15.20.3261.025; Fri, 14 Aug 2020
 05:28:19 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Peter Chen <peter.chen@nxp.com>
Subject: [RESEND PATCH v3 4/6] usb: cdns3: gadget: fix possible memory leak
Date:   Fri, 14 Aug 2020 13:27:00 +0800
Message-Id: <20200814052702.22789-5-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200814052702.22789-1-peter.chen@nxp.com>
References: <20200814052702.22789-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0153.apcprd06.prod.outlook.com
 (2603:1096:1:1f::31) To DB8PR04MB7162.eurprd04.prod.outlook.com
 (2603:10a6:10:12c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0153.apcprd06.prod.outlook.com (2603:1096:1:1f::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Fri, 14 Aug 2020 05:28:16 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 372c2843-5f2d-4f86-febb-08d84012da37
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3641:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB3641456464A9DB0BD143A2A88B400@DB3PR0402MB3641.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dniB9n5ySgC7+PbtAyqVIbMmtfQetwjbFdjAsue08dmzhF7+RqmCR8+ftbavjwPpqA7SloNYa1ilOP9vuruDaxz8O7rH43u8h9az6PI2Airof9mFe6jtMCfeWhhS1p2rpcxVw/foHCz7pwsvUPx6SjlcSk7RJYWsw6CkZLk1UGRx6fgJa6aWCdz4P6StW6I4PxsbeDuIUbF63mgBdvvx2ijB1ZxXMcvBDLt+gO4N10Uza0swyuEZcN9Uq+DY0dSIe6DupPKpBf8a2gweZB4ReFY4mXRvt0WIY96eEY6i81vdBHUM2NSL8gmBUbPjTNG0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(6486002)(36756003)(86362001)(6506007)(6916009)(8936002)(2616005)(2906002)(4326008)(316002)(6512007)(8676002)(956004)(6666004)(83380400001)(16526019)(186003)(66476007)(44832011)(5660300002)(66946007)(52116002)(66556008)(478600001)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: nsB/+vgJxas5AfYyKVKQhcJmF+rcRfQZZbju8S+x/jo2ifpWXBDEQMlaekscOafaiQljk4qbeJMjGg+Pn7DM9CJA8JRThDoD2BGmpQ4F5vlNe6CpazMRDjOluaOqu2kD9pkEffZDIvkEKz6JsyZY2wrpYLPHY54FzKPlT+Q5THoS1HucCNf9C8jjCJri2lwKCyIJ1I10xWcNbpLvnMtZqGqnbNlvvKRbZ/gQ2MP3y4E5yH1E5u7BCn+raMde699Pp3ERcPOAfaXSIWJSKehwGlV3KUU4iItmcXtpIr8bFJT2bfE6cZvpy74vxTkOuV1gTOfFPgLYsa5wQDLSDQA74HngHN25vH8mHuN3IxJ0ld57F3F4Jc1J1+vGLZ60BJJ7eb00kATboU5Q9BsGcIhamtai+O5PfETg2iSHM5OA9Bec6EnER9vUZPAkEkGWmgHrnkEy0Lim2njq2JSANVsjGsbHU0r4J7+R5VGtUYSepTi35LuhXMGUqVqVc9wDxGtQvpQgV3ax1D2AdwZcqUYX7PA3xf5YNzDLN37FcjCVE3j0FWmK/+0MTlW8miVXy01guRiSnb5CitYz0i7gDxIl4Rt0natpWY5nTB9uhSDjbm16IuUFFziXb9tEukWZCxXZil7HkSohYbo8tEh0vIzlsA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 372c2843-5f2d-4f86-febb-08d84012da37
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2020 05:28:18.9847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8eaA6ePyCgntr7nMNPZslMekH468wdM1EZWsUxDM/Esw/CHHpoERWiQW5Mm9ES5bRxsovo2R0U6a0IK+B3XIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3641
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If cdns3_gadget_start is failed, it never frees cdns3_device structure.
Meanwhile, there is no release function for gadget device, it causes
there is no sync with driver core.

To fix this, we add release function for gadget device, and free
cdns3_device structure at there. Meanwhile, With the new UDC core
APIs, we could work with driver core better to handle memory leak
issue.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 8bbb38cd560b..721e7914d91c 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -2988,6 +2988,14 @@ static int cdns3_init_eps(struct cdns3_device *priv_dev)
 	return -ENOMEM;
 }
 
+static void cdns3_gadget_release(struct device *dev)
+{
+	struct cdns3_device *priv_dev = container_of(dev,
+			struct cdns3_device, gadget.dev);
+
+	kfree(priv_dev);
+}
+
 void cdns3_gadget_exit(struct cdns3 *cdns)
 {
 	struct cdns3_device *priv_dev;
@@ -2999,7 +3007,7 @@ void cdns3_gadget_exit(struct cdns3 *cdns)
 	pm_runtime_mark_last_busy(cdns->dev);
 	pm_runtime_put_autosuspend(cdns->dev);
 
-	usb_del_gadget_udc(&priv_dev->gadget);
+	usb_del_gadget(&priv_dev->gadget);
 
 	cdns3_free_all_eps(priv_dev);
 
@@ -3019,7 +3027,7 @@ void cdns3_gadget_exit(struct cdns3 *cdns)
 			  priv_dev->setup_dma);
 
 	kfree(priv_dev->zlp_buf);
-	kfree(priv_dev);
+	usb_put_gadget(&priv_dev->gadget);
 	cdns->gadget_dev = NULL;
 	cdns3_drd_gadget_off(cdns);
 }
@@ -3034,6 +3042,8 @@ static int cdns3_gadget_start(struct cdns3 *cdns)
 	if (!priv_dev)
 		return -ENOMEM;
 
+	usb_initialize_gadget(cdns->dev, &priv_dev->gadget,
+			cdns3_gadget_release);
 	cdns->gadget_dev = priv_dev;
 	priv_dev->sysdev = cdns->dev;
 	priv_dev->dev = cdns->dev;
@@ -3121,10 +3131,9 @@ static int cdns3_gadget_start(struct cdns3 *cdns)
 	}
 
 	/* add USB gadget device */
-	ret = usb_add_gadget_udc(priv_dev->dev, &priv_dev->gadget);
+	ret = usb_add_gadget(&priv_dev->gadget);
 	if (ret < 0) {
-		dev_err(priv_dev->dev,
-			"Failed to register USB device controller\n");
+		dev_err(priv_dev->dev, "Failed to add gadget\n");
 		goto err4;
 	}
 
@@ -3137,6 +3146,7 @@ static int cdns3_gadget_start(struct cdns3 *cdns)
 err2:
 	cdns3_free_all_eps(priv_dev);
 err1:
+	usb_put_gadget(&priv_dev->gadget);
 	cdns->gadget_dev = NULL;
 	return ret;
 }
-- 
2.17.1

