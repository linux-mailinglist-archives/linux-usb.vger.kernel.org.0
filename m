Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD3D82432AE
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 05:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgHMDVI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Aug 2020 23:21:08 -0400
Received: from mail-eopbgr150075.outbound.protection.outlook.com ([40.107.15.75]:52133
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726567AbgHMDVH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Aug 2020 23:21:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bchw30I7iYAXlsqwrpm0QEvG1jehsS58sChTW0sSpDt+c/LIerpQk6wrqxo81C397hxF4vL1bqxWBWfQ2+bhGRx1GRm8nb3pOF/iDNVsfCrgUFybNwM1VM4teK8evE0FxnmZgOELKNRK/bwlfoTp43QHP8+Sx5WfbCMQF96l9aliAalyxy6OFHHt5jcCnyaBfDko+u38UyliKjANUIbk5ILNarVefX7AKcQ5paoXBKkN+jBwl4VUx/p9xFembOXa8YUY5UTjkKhVR/bI8hKWCvuUt5bC/JGe/NEi52cto93HK79sO8u7vVAGijuSKmOJIg1dVPpFliuGlz7/U9FwUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEXX6U4YyXwiwT5ohuQttg5CvSq+xUitFG+682AuoPY=;
 b=Ni1NlrbCc8zUEQMKRHXO7LJfORt9j6ft3ZfoysGC+X0lsJqz2tlAAGhqUUYQds1B89mKda77N8iew8joIVRq+00VR2CgWBgb5UWmruSJ+f0MiZqCOGZR/mS1o5lzK7MeVxBfvcz8JQ12zHog7hV4PasGz3vSlw7pjmb+jmy+HOZOn2/WunJRxLDQqFfmLZmMme5SxSYm/CDf7CiPN6amRxpNig328mpcks1ll/CxJ4ZavhtYlfwf6byzVY4eK2jFFPHk5KC223tk3kq7KKZsPXv72mI7M0iBlg2CcvgMv+vcwH8aJXRTluyUmJwi0Zfs4N8F17l3DuXXKNUkWEVhFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEXX6U4YyXwiwT5ohuQttg5CvSq+xUitFG+682AuoPY=;
 b=Ius0j09ZbVGuA44Xoreret+WwDMaLQoWFmWbyU1+QQAW9nzoHuXWPL8IV4ZH3qWdd+ZsL6QnhCbLMMju6V5Gq51mJbW4Ipyt1ZtbiP2a6tz2WHRIXhdmPvycwb8VH0I2nlX1mORqeNaVzAfiLoVuCkNzN9y56pGnAA3/XEDdtu8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5911.eurprd04.prod.outlook.com (2603:10a6:20b:a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Thu, 13 Aug
 2020 03:21:02 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.025; Thu, 13 Aug 2020
 03:21:02 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Anton Vasilyev <vasilyev@ispras.ru>,
        Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH v3 3/6] USB: UDC: net2272: Fix memory leaks
Date:   Thu, 13 Aug 2020 11:19:50 +0800
Message-Id: <20200813031953.13676-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813031953.13676-1-peter.chen@nxp.com>
References: <20200813031953.13676-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0184.apcprd06.prod.outlook.com (2603:1096:4:1::16)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR06CA0184.apcprd06.prod.outlook.com (2603:1096:4:1::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 03:21:00 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 20e562be-31d5-4a60-cfac-08d83f37e81b
X-MS-TrafficTypeDiagnostic: AM6PR04MB5911:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB59112EB184B464E3C5EEFF1A8B430@AM6PR04MB5911.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yXmHFZ5/8yAOXhyMF47w/g5sqGFC+xdGq5iIuW4w2Ah5ObubMvkPHcBUFScpqPkf5Du+zAe+GTZzhOOu0JXzXaODX/aEz67MCxzYQk45a6M9nEB+yGKmdSiXTPZJNzXnqDrHjfoS3vQPBBUwPINbahzISuIszOGrIBuG5y8S+4WtLmGw5vBGlwYny4rjYCUKwRfNpCnJlfEnqKIscVKoQO31wAlMzv8t+hNjfZA5wmZZHqyMLQ/sIVtmtp46QmdJr/VrQ2x5Xks0MpxsXAGzzGT74MRYEXZ27mq33iZWfbCzQvI3MymyDed2ZRxXJXwP5HuQTZl6Yws4nQUuQT8uqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(66946007)(316002)(66476007)(186003)(6666004)(54906003)(66556008)(16526019)(44832011)(956004)(26005)(2616005)(6512007)(1076003)(8936002)(52116002)(6506007)(4326008)(86362001)(6916009)(2906002)(6486002)(5660300002)(478600001)(36756003)(83380400001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: jlJIfzCdqguFKllhRY0YCfJvRYQo/xaLmQm3Q+oHyxbM5ceF19xjgX8g4A0HWSlCFmVh5sSMvADrie3t663WC7I7tvYHVbkfoIOVmKjgV10cqji+iM4Ckoh3Gi3VG4Fzq5kmuc/RQPieB/uOjrq68NqFTQcak35ipLgbEkircHdLt/kuzmfzNCXZR0dmuqegXXTCyXpeRRsB/2wHQT2iOeWKZ4t7mJ5KmOfH6DCzUgPhUD5VsxSlhfs0mMIQpMkfePAu38qMTedE72ajzHUuMbxQOms7ri1Hu5V6NlLkITLrblNtCiD8V+zj35qRfzMSNDjaXtuHvUnkXd6S9hrGBEpfSgV+29/C1B8gFMmNyw3YWbDPBDrO/GWzWDDdVh4ol/F8XPGESg8pEHNrQUSqh3Kd19rlALlg427Ts/FgMCG+3lHFpq7mARN+2mMqkP1g964N8AbEdlzjSfKVBgLP9rArdsRGryXzIaEJ3TLoyWcnHLCvzgHxS0uBZDnQZ4Jeuxa/VJJLyIVz5rOcl7Wzqvu6nl8RwsONlsIgRExhO7yJiPBwuzHXp8deBsBapSSBnpXxeB/7rJSDpics4LXbY8cFKvXBJ8ZAy3nvb9JdhwIFACPqsahl3KG/4Fzfk/vFyoezx70qGKYT3mHty83PVg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e562be-31d5-4a60-cfac-08d83f37e81b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 03:21:02.4386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00aup4W8a+/CV58UNgbi0NtU+VRwuF68ewQkyOFcHjIb/gPNck3j3Om7CHzQlaYcrfEaHfW42aaqdRbCTQSVnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5911
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Alan Stern <stern@rowland.harvard.edu>

Like net2280 (on which it was based), the net2272 UDC driver has a
problem with leaking memory along some of its failure pathways.  It
also has another problem, not previously noted, in that some of the
failure pathways will call usb_del_gadget_udc() without first calling
usb_add_gadget_udc_release().  And it leaks memory by calling kfree()
when it should call put_device().

Until now it has been impossible to handle the memory leaks, because of
lack of support in the UDC core for separately initializing and adding
gadgets, or for separately deleting and freeing gadgets.  An earlier
patch in this series adds the necessary support, making it possible to
fix the outstanding problems properly.

This patch adds an "added" flag to the net2272 structure to indicate
whether or not the gadget has been registered (and thus whether or not
to call usb_del_gadget()), and it fixes the deallocation issues by
calling usb_put_gadget() at the appropriate places.

A similar memory leak issue, apparently never before recognized, stems
from the fact that the driver never initializes the drvdata field in
the gadget's embedded struct device!  Evidently this wasn't noticed
because the pointer is only ever used as an argument to kfree(), which
doesn't mind getting called with a NULL pointer. In fact, the drvdata
for gadget device will be written by usb_composite_dev structure if
any gadget class is loaded, so it needs to use usb_gadget structure
to get net2280 private data.

CC: Anton Vasilyev <vasilyev@ispras.ru>
CC: Evgeny Novikov <novikov@ispras.ru>
CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
---
 drivers/usb/gadget/udc/net2272.c | 25 +++++++++++++++----------
 drivers/usb/gadget/udc/net2272.h |  1 +
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/net2272.c
index 44d1ea2307bb..463077fae820 100644
--- a/drivers/usb/gadget/udc/net2272.c
+++ b/drivers/usb/gadget/udc/net2272.c
@@ -2196,7 +2196,10 @@ static int net2272_present(struct net2272 *dev)
 static void
 net2272_gadget_release(struct device *_dev)
 {
-	struct net2272 *dev = dev_get_drvdata(_dev);
+	struct usb_gadget	*gadget = container_of(_dev,
+					struct usb_gadget, dev);
+	struct net2272	*dev = container_of(gadget, struct net2272, gadget);
+
 	kfree(dev);
 }
 
@@ -2205,7 +2208,8 @@ net2272_gadget_release(struct device *_dev)
 static void
 net2272_remove(struct net2272 *dev)
 {
-	usb_del_gadget_udc(&dev->gadget);
+	if (dev->added)
+		usb_del_gadget(&dev->gadget);
 	free_irq(dev->irq, dev);
 	iounmap(dev->base_addr);
 	device_remove_file(dev->dev, &dev_attr_registers);
@@ -2235,6 +2239,7 @@ static struct net2272 *net2272_probe_init(struct device *dev, unsigned int irq)
 
 	/* the "gadget" abstracts/virtualizes the controller */
 	ret->gadget.name = driver_name;
+	usb_initialize_gadget(dev, &ret->gadget, net2272_gadget_release);
 
 	return ret;
 }
@@ -2273,10 +2278,10 @@ net2272_probe_fin(struct net2272 *dev, unsigned int irqflags)
 	if (ret)
 		goto err_irq;
 
-	ret = usb_add_gadget_udc_release(dev->dev, &dev->gadget,
-			net2272_gadget_release);
+	ret = usb_add_gadget(&dev->gadget);
 	if (ret)
 		goto err_add_udc;
+	dev->added = 1;
 
 	return 0;
 
@@ -2451,7 +2456,7 @@ net2272_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	if (pci_enable_device(pdev) < 0) {
 		ret = -ENODEV;
-		goto err_free;
+		goto err_put;
 	}
 
 	pci_set_master(pdev);
@@ -2474,8 +2479,8 @@ net2272_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
  err_pci:
 	pci_disable_device(pdev);
- err_free:
-	kfree(dev);
+ err_put:
+	usb_put_gadget(&dev->gadget);
 
 	return ret;
 }
@@ -2536,7 +2541,7 @@ net2272_pci_remove(struct pci_dev *pdev)
 
 	pci_disable_device(pdev);
 
-	kfree(dev);
+	usb_put_gadget(&dev->gadget);
 }
 
 /* Table of matching PCI IDs */
@@ -2649,7 +2654,7 @@ net2272_plat_probe(struct platform_device *pdev)
  err_req:
 	release_mem_region(base, len);
  err:
-	kfree(dev);
+	usb_put_gadget(&dev->gadget);
 
 	return ret;
 }
@@ -2664,7 +2669,7 @@ net2272_plat_remove(struct platform_device *pdev)
 	release_mem_region(pdev->resource[0].start,
 		resource_size(&pdev->resource[0]));
 
-	kfree(dev);
+	usb_put_gadget(&dev->gadget);
 
 	return 0;
 }
diff --git a/drivers/usb/gadget/udc/net2272.h b/drivers/usb/gadget/udc/net2272.h
index 87d0ab9ffeeb..c669308111c2 100644
--- a/drivers/usb/gadget/udc/net2272.h
+++ b/drivers/usb/gadget/udc/net2272.h
@@ -441,6 +441,7 @@ struct net2272 {
 	unsigned protocol_stall:1,
 	         softconnect:1,
 	         wakeup:1,
+		 added:1,
 	         dma_eot_polarity:1,
 	         dma_dack_polarity:1,
 	         dma_dreq_polarity:1,
-- 
2.17.1

