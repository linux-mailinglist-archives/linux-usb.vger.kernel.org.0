Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF07A24CB11
	for <lists+linux-usb@lfdr.de>; Fri, 21 Aug 2020 04:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgHUC52 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Aug 2020 22:57:28 -0400
Received: from mail-eopbgr50073.outbound.protection.outlook.com ([40.107.5.73]:27655
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725852AbgHUC51 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Aug 2020 22:57:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/SypZR//bkp+bHlYBtjrLpoJmFQkKsj8tUB2DyKYIFqUS3f53bfEjwkeNERb7IZyTefsZjMSOgA7f3u4ACnW7SXa2XMajxsYMIpf+1km0xdmHg7Yg/zbSfVAgYfwUG8pkWSezArLTV35m91Ak7J3kJ1tbYgX6X81vg6FnFU3fcFmcgA9ZLM6TUdU39omu/0ZUzKzpYTSkXNtHh6z+BBp1h6Ylk9xtH3UvkLbVFuOi93cYb55Wqc8ld+nynmmWnqYyRL26w7xlo+4vgNJDVCoxdx7FdTzHTODeY6pZ4fCsF4AMeJXJM7tBQXJ+nkyO0qsKT1dxVacfTxnUZcZzblkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1W3WCbN8OC3F7KdKMlG7SPTkA/1CC+6n6vCaMelW7k=;
 b=B6akdni5a+2N6ndtiwoN8B2EZpaM30I+y3j3blFeiLGOAVPGVwft6/hfAREW1IlRKh2ebs1AILfGK+9DVU1mQQwQqNzVHYxL5DmTc9WBsE6JaGzPbMeJqn9YW1yIdFqi8k9cVIZu5V/YXuR9RSVQc1dIGSUBWgxfknZHAsMo1XzoQncLvWqq64H4xvJtJ9efG32JCukHh5V3FZ+HAc2Gr03lEsMQQ6j/4agq/YnjEta5HeaW4IlyqWduUtIZE71OccVyb85PQSz0kps2eQTRoTITH8QObEDV06TRDmWQIGRCgkl4OHKR+J0UCZQ4Jz7datDPkSMcgTFsTsC4+x8nfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1W3WCbN8OC3F7KdKMlG7SPTkA/1CC+6n6vCaMelW7k=;
 b=TGAPCn2WH0S+giZVU9q3biVVfxlBrhwjfa7U89vtHV01ga4quyYCPhz6qW7ea73C5v3i/JDjWh25kDXOReYWFqYFhCeu3NnRxe5s7PsDrA9nHQtK9/H8pv1uIhJ+Q94b5jnqqyh+1wms8L2hZfD8kQPps6pfAwAR+puNTaMmwIU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB7PR04MB5577.eurprd04.prod.outlook.com (2603:10a6:10:8a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 21 Aug
 2020 02:57:20 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2%9]) with mapi id 15.20.3283.027; Fri, 21 Aug 2020
 02:57:20 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v4 4/6] usb: cdns3: gadget: fix possible memory leak
Date:   Fri, 21 Aug 2020 10:55:47 +0800
Message-Id: <20200821025549.4591-5-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821025549.4591-1-peter.chen@nxp.com>
References: <20200821025549.4591-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0132.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::36) To DB8PR04MB7162.eurprd04.prod.outlook.com
 (2603:10a6:10:12c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR01CA0132.apcprd01.prod.exchangelabs.com (2603:1096:4:40::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 02:57:18 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 893f73c3-e1bc-4365-1ed8-08d8457deb9e
X-MS-TrafficTypeDiagnostic: DB7PR04MB5577:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB55775A9B96C142DBF554BDCC8B5B0@DB7PR04MB5577.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S0+OSk/k+/tw7SfU4q49OzdGlrxMI0FbO9Q0l3eSbLA5FoFTQvF+lQAUJMtXyr+85829ValTqpdWrT1kj2+j2yUqQwyr7w+Lea5QfbpOcISBvI6IUFUQSOff71S2qe1ol9u2p/npagt0Ln/GpbQfMTu5ErXDRLge+fE+L4wPlV8BftpCkKY40ZaGp46nmNPWepWcoyP5WhSZrYXf4qC6n81OH+aPCq6tAmyjqFka9DZSoiJPZMjVeNMNYM/Izj9gUe2ZH9K5W08MRKwSiqyMlltGPHPC36nvTNOfAjqQdcSishIevSHszfqs1iG5oqJK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(52116002)(66946007)(2906002)(8676002)(6486002)(4326008)(6506007)(478600001)(316002)(6666004)(44832011)(36756003)(956004)(26005)(66476007)(66556008)(2616005)(8936002)(1076003)(6512007)(5660300002)(6916009)(186003)(83380400001)(86362001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 3vjcwPuJroD6TXCd4qDiY6lPEiYndoIM+EiMVq4IO5KXJGVF5qTfEsxpcL/SYJSxbkbzFaQSih8oQKIE8ilP1vwPLTXy4MbujJb6fVsfUTCFuiSZ0nsQfLF3EnsJznqobFC408KlvQ6wqpFpVTi6YHmWXYOQ6sK5ty90RmG31hnjzPOmadNXtCUtJntKR6LNUlYEIm/Vtig8EtQEZ2X4K+t+dasPhj7f9vAA0Kyh/+IFeSjlBRiP8Sp9vos8DKLwdBVNRFBWXmSJ3OrIOvoCBlDahwC4c+olyT9Bi3rbf4Ttj/JHe2iW+Bv33iLqRKLyNP5G9+M22gJ5ZnEV2eTVZ4QIdvjld8TxeoZlxS0yanFb/ihMCJ2rt38ciupNHGWNWx/20o9jbSuhv2jxeda05E/cI5poJW7pN31Z8jGkc+MU17Gy2ewe5SSstBIwUGKYacfbS9COqsfCnjDJ2Q6Nvq4gk8toS2te6yAaGkky3TliNgp4Pu4BuFBE6xb8Frk6iE4ZwtiJ9ijHFKQiOxBVsJkUKG86BE/SlkAb+Mmeql6IeAS+Wwb0VMCMQ13JLaokv+nOv5txO7aoNotyTQ+MlP6p2t+eNyDqE0ZYSHZTtrh22VCeH6oiauKpYmAXIOOr1WEqCvOJyiAGxXxzI1BLMw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 893f73c3-e1bc-4365-1ed8-08d8457deb9e
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 02:57:20.0999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zMPxGDTFsr3dh2H1BcGo7brngOj9PRDrxpYKv3bxPE6ZQ2KZBeWnlKTEu9mavTr9STp9+lFp9iNp9s5w+C4fuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5577
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

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

