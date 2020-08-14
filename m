Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38449244489
	for <lists+linux-usb@lfdr.de>; Fri, 14 Aug 2020 07:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbgHNF2e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Aug 2020 01:28:34 -0400
Received: from mail-eopbgr70054.outbound.protection.outlook.com ([40.107.7.54]:62158
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726541AbgHNF2e (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Aug 2020 01:28:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQ77mGaI316Nv44jCJT4qpw3HocfkW9jw/3q3oRL2nYJUC1RFxJBvqzcgiqMSobM4qW8kS+AqYboLiDbU4+584h+ghQUug8jLaIvwJc8eSWp+SVPnCkn032taeng8dRp/wXFgURJoGon36FeyPQ06aa3Yv5ZHQ1tfgyOfRgI9xWov1oUspSgRD+yGytHNS0EN0UFar053tkGiAwfUQBO8ozeNbTFL7ESAfyDaFHYV0V3f9v3+LNOVSMmtB6MxZ8zHfwrXGLm+hyNebFmuMyCaJk4D+IDr9UyZ/IhVmgajviTffkYQBZAMx2ewbpo3RaKUPoZt/XjMf8g04Is3JbIGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgDRyD9GW5UocNrQN+zf9Fhu7emuO9zvFwfAszAspFo=;
 b=F7OiTNwZtHANLe86JtlLmVNTtt2XaVhaNPzbNj6z0j+BcXcwmsdZ84GK909xFAVIca1JvcZecZ7bavMofCD8NuHKN2TpzyFsM/O/hY49qSYT+5xTRpHllQnOaU6A3HbWwDteyJYQo7+gRK7/jHQ/dhsHngP89Sdc9KN1agNnc/weDiYrWan6Gj1ZzA3CTjwhNueaw7EI8OprPWAt134rzfdNLx03o+12wd70PPB4h5j354fJM/1PqjEa3gVDN8Ck8dqwq9PMWvVQH2/NU7n49KLY2pTj0NbLgxtFCIr20H43LYEW2FMVPSqn4OVE3BpsthuLdbrxijKIooiSIIXRsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgDRyD9GW5UocNrQN+zf9Fhu7emuO9zvFwfAszAspFo=;
 b=Q2YXslu4IGZRBHigP0XQ7U86eiWJPTCfcjvyPt8HnRPMqEC8BkQ0++1hUHOyxo11msr/jwj9anxNWhwIvgQczdMxqXAA5sGsmE/6otql5H90XpjMzwQ2K22sOad5a6vpMBVrZTsW3l7knW+LwgGNiz9DKLLr0S06XSQagfIWVaI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB3PR0402MB3641.eurprd04.prod.outlook.com (2603:10a6:8:b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Fri, 14 Aug
 2020 05:28:16 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2%9]) with mapi id 15.20.3261.025; Fri, 14 Aug 2020
 05:28:16 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Anton Vasilyev <vasilyev@ispras.ru>,
        Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: [RESEND PATCH v3 3/6] USB: UDC: net2272: Fix memory leaks
Date:   Fri, 14 Aug 2020 13:26:59 +0800
Message-Id: <20200814052702.22789-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200814052702.22789-1-peter.chen@nxp.com>
References: <20200814052702.22789-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0153.apcprd06.prod.outlook.com
 (2603:1096:1:1f::31) To DB8PR04MB7162.eurprd04.prod.outlook.com
 (2603:10a6:10:12c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0153.apcprd06.prod.outlook.com (2603:1096:1:1f::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Fri, 14 Aug 2020 05:28:13 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9e4808fa-d68f-4eb4-8a66-08d84012d8c4
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3641:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB3641341C212FA7392E9E6C9C8B400@DB3PR0402MB3641.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rPtUb4r/FVvExh4D+5pj/8RoHlt82ckHdpMfijc5tRufT2wmewyNtynq5L1xIqY9A/vrhQ7+slQ2Bt8YA/bXyt9rbykbfuTmNVGtZwiPGr1LkgMejG+RbP6AaEwLEDHJpq4ChOxnlY9wK4m8TTyOs70FEaAcr/OwQdzrZIyYqWHOR6Zls1aWS+53kdcx1jdImvXJg/81x3xDm1YW6O77X8GXCweRfoHzxcaGkgdiFeyPffacfC1Ere3477lx9iJM7YNZW9jI54g0mG601mDnuaxIfyDqhLPatr7ZW1GOeSsyx6VFjQzZXs8tdnSgbB3NXh+B24WrI3RFKRrQlIMVbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(6486002)(36756003)(54906003)(86362001)(6506007)(6916009)(8936002)(2616005)(2906002)(4326008)(316002)(6512007)(8676002)(956004)(6666004)(83380400001)(16526019)(186003)(66476007)(44832011)(5660300002)(66946007)(52116002)(66556008)(478600001)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: fvjLhAAwFulPJeAr8u41O5HcmTPzG1iYZfdOqbIBXQ/9If9fQlRC88NU/QeI5YLQq8q4cdNgir7EiCMDAKgpEaYu60lLFHnFQCwiaAFamCe9cN4uEkNwQCmgNrmkG08fSWz4VwBT9YFlRI/5W4xVwEoBNCOmJZ+9ZTWQeKHX7vy66dweUo2rLKB1yt293A+dGvln4JJYdAv5fKL6Ur5Pdf2E05vzlYoJgScL+doNJ7p1Qq+dG3+FaU8UZhF4DDc+CQQYbCvl9Afb71Lo3kVCBQJx2pZQa/cyM/IUA/Xamswm4aWjdpiCDgeJBZ1uRtBLkIZ7ITdUESa+6F7IeyiQbwut94/79Ug4V/++dL9a3U39ye1iU2l3+shn7+qqJgDko8+qk5LH8pAMfJGF+ICb8vZTEet2vn8kkS/tStzwoHonsuk/0D2glV0rbeiYez9pYly/wuPt8bzVFVh8XO4byDXK5eApbE/V8jKk5y6KoxV6Hmq6ajjZchPXDA1x9qYf3JkrteYu7yf6dVhbJd32lqh7G416EnL6k+c/gg4eshh/J8bN+LtIo1mhFZqcw+ppTzLkl7rysBxWtalvNNMRXimt4s5GlmbISva4A50KI4lkJf5Lju0alcLMva+QOm1KmCwgw3ZXTuHPs8P0ONSWOw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4808fa-d68f-4eb4-8a66-08d84012d8c4
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2020 05:28:16.5503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: La95qu6k7DKiJXD8ULAsZQ7YpLEnF/A1DMtXLCd+JFVLQbeJsg0DFfOd9i4JDkQBaL13qrss3K8gr2hzNyZnbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3641
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
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/gadget/udc/net2272.c | 23 +++++++++++++----------
 drivers/usb/gadget/udc/net2272.h |  1 +
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/net2272.c
index 44d1ea2307bb..46d1e23c575a 100644
--- a/drivers/usb/gadget/udc/net2272.c
+++ b/drivers/usb/gadget/udc/net2272.c
@@ -2196,7 +2196,8 @@ static int net2272_present(struct net2272 *dev)
 static void
 net2272_gadget_release(struct device *_dev)
 {
-	struct net2272 *dev = dev_get_drvdata(_dev);
+	struct net2272 *dev = container_of(_dev, struct net2272, gadget.dev);
+
 	kfree(dev);
 }
 
@@ -2205,7 +2206,8 @@ net2272_gadget_release(struct device *_dev)
 static void
 net2272_remove(struct net2272 *dev)
 {
-	usb_del_gadget_udc(&dev->gadget);
+	if (dev->added)
+		usb_del_gadget(&dev->gadget);
 	free_irq(dev->irq, dev);
 	iounmap(dev->base_addr);
 	device_remove_file(dev->dev, &dev_attr_registers);
@@ -2235,6 +2237,7 @@ static struct net2272 *net2272_probe_init(struct device *dev, unsigned int irq)
 
 	/* the "gadget" abstracts/virtualizes the controller */
 	ret->gadget.name = driver_name;
+	usb_initialize_gadget(dev, &ret->gadget, net2272_gadget_release);
 
 	return ret;
 }
@@ -2273,10 +2276,10 @@ net2272_probe_fin(struct net2272 *dev, unsigned int irqflags)
 	if (ret)
 		goto err_irq;
 
-	ret = usb_add_gadget_udc_release(dev->dev, &dev->gadget,
-			net2272_gadget_release);
+	ret = usb_add_gadget(&dev->gadget);
 	if (ret)
 		goto err_add_udc;
+	dev->added = 1;
 
 	return 0;
 
@@ -2451,7 +2454,7 @@ net2272_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	if (pci_enable_device(pdev) < 0) {
 		ret = -ENODEV;
-		goto err_free;
+		goto err_put;
 	}
 
 	pci_set_master(pdev);
@@ -2474,8 +2477,8 @@ net2272_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
  err_pci:
 	pci_disable_device(pdev);
- err_free:
-	kfree(dev);
+ err_put:
+	usb_put_gadget(&dev->gadget);
 
 	return ret;
 }
@@ -2536,7 +2539,7 @@ net2272_pci_remove(struct pci_dev *pdev)
 
 	pci_disable_device(pdev);
 
-	kfree(dev);
+	usb_put_gadget(&dev->gadget);
 }
 
 /* Table of matching PCI IDs */
@@ -2649,7 +2652,7 @@ net2272_plat_probe(struct platform_device *pdev)
  err_req:
 	release_mem_region(base, len);
  err:
-	kfree(dev);
+	usb_put_gadget(&dev->gadget);
 
 	return ret;
 }
@@ -2664,7 +2667,7 @@ net2272_plat_remove(struct platform_device *pdev)
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

