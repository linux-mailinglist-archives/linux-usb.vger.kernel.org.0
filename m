Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F22923EAA5
	for <lists+linux-usb@lfdr.de>; Fri,  7 Aug 2020 11:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbgHGJnA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Aug 2020 05:43:00 -0400
Received: from mail-eopbgr50089.outbound.protection.outlook.com ([40.107.5.89]:59671
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727053AbgHGJm7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Aug 2020 05:42:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jafFUnDVOl0ENb5WA6PlkhOM/UIXri6+FIxBntPHOaEF0qrq7+zhS6en5djJw3iMx2oYp4fN6Pj5Ol6nVvyPI+Z/N+xQVMVewIpAQJyo2LtI0AWziwd4FIAx78EfE2yfv3ZUU5pLu3LD7UGfHnBGeMjGuRF1vGUk7Vxe/kfsIXumgyveIfrgd7qRu4mu7fWxTYK4uTx63bplvaLrkNLq+EF3ZKqbSAYiECfN+XtYHegqqgmWOk1n5yKfacRXuEQRdH+YJRHrt202eOEFrfmwN3qJxwTYfDu4o/XkvCM78J9rcsVZyT4PFhRztC5KJ38On/TGkczCxRTrFW1Q6xqnuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21l/gh3hvYNakCn64n/3nXvrnC6AZI1xTWGT9r3k3nM=;
 b=PMS6MpUuaNwlJWch44YJayngpkmhdU++kOh+3VDV5uy8q/jYRWMTZl3WTywrvNdH9IRiGYlmfadcusW3LczdLjhzSySQ6XcG7SudUZRQPpcTMzpLhzsZU1js52NjnF4oERPUEhZqB51NGJDAge4Ldj1IJEuFFP1+iGylVpBx9fOfsDsw9pYj1WOnQDrEdM3C99eJE3RS0+rX70Zkbhq+IaBalXLh2i8yGvCyBHkoEnjG0f5ZkYWkCktJFImdZHXPwc3iW7BMR0/CFZMGNXWE/uaquqHtpjJ4Rx0/1qTlwBJibWtCIWLNPASiVGS1qz3htmSEEJz78AjrRktJOuDb/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21l/gh3hvYNakCn64n/3nXvrnC6AZI1xTWGT9r3k3nM=;
 b=hrp/c8bL4LdD3I5zO9yiTWKZJ0HRxYCddyfPD0BJUJgRqpK74u1DpnI9E08Sj4JLiy/vfXAHlAbxzL0ZMjqnG3t2OsymTaQMBs0zGSMFlPMTCnAdtgBMSOE6+Fm/J6kEIpP0hKQHs8PB38IZtMfXjnjBuzLVFuQ6o++rkw26BeM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7077.eurprd04.prod.outlook.com (2603:10a6:20b:11c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 09:42:52 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 09:42:52 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        Anton Vasilyev <vasilyev@ispras.ru>,
        Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 3/6] USB: UDC: net2272: Fix memory leaks
Date:   Fri,  7 Aug 2020 17:41:48 +0800
Message-Id: <20200807094151.13526-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807094151.13526-1-peter.chen@nxp.com>
References: <20200807094151.13526-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:4:91::17) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0113.apcprd03.prod.outlook.com (2603:1096:4:91::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.5 via Frontend Transport; Fri, 7 Aug 2020 09:42:49 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e07387b0-a52d-4280-7584-08d83ab640d8
X-MS-TrafficTypeDiagnostic: AM7PR04MB7077:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB7077DA73514844388DE169DE8B490@AM7PR04MB7077.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fo9zcJSZRmWlm3hqWPs/eBUxfiwE/nDoZOTi4vrUlvgCA4I4ulHJuifxBgT+/3FgXVnuX4QRHeTjqg3akfe/FFYI5Q56L8mY3wi1TpcNh9gXUewloyhK/Vs62XbQLCbGxx3BEZsGmaNBpUUWcUL/P4dchnn08ky6rZJNtQ8Ce2E5D7wDKxCrFQZPLsm9huBU9EEL3FTCuTTYc0pCW+yoCk1Lm9gKmriddefoIyzbluX+sPFaBq6fS+OVwDP0BOHzOlefnhoElamP/qhdXllu6Ml8b/HPuTDFWc8ZZqzmgtv0tv5OeHY+xD1cYJC9sGP+8DmIG0CGE5Wr7eEk0pk5cQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(136003)(39860400002)(376002)(396003)(956004)(2616005)(5660300002)(86362001)(16526019)(44832011)(6486002)(186003)(66556008)(66946007)(4326008)(6512007)(26005)(52116002)(8676002)(83380400001)(1076003)(54906003)(66476007)(36756003)(8936002)(478600001)(6916009)(316002)(6506007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: RKKjFvxzlfCpm48M46Bnb9+oIXkoWCtdQKwelgn7Rhnc8gFltx4Uf5+9i6oQlDFedXnJ1EujWn2ZUzbegtoeS3jirNcnB9ucEyK8PW++ybVHIKXVee6aAauLSOsTzycEU5atvOUcoGQBGmpT/nxwy+YeytaS8GZB2QgfzhIlslOCv0XY0XN0rIR744SPm5670tC1E9sz/olW4KBeB0MD98QFWu9E3YyFg0gDSaoLf0tAWwQnX51uQvPCU8ajlM2Ad/bRuHD6JZ5FLjLbM+DYR5rMBkbZCAlKsEuwzBEcDNizdySsGIYGhNOSlJkEZHsYpx4JwJ/mQ36NgC7ISbR7iPCkgFTqA7ZK7pO5su/TbBAiQ5l7ktUouwPyOPgsU/4j/rV5UMIBNcnGlgzwCINS6ZuDc9oGcQAxAjxrBcZfA5BivRQvTnb4j6SP/8dxRXygngpOKrGi3X+5UaWrEgc31JDfpwhbn5kF9pS7xZR8SPOPA6pd/Ij6VoU2/Y1F+8nOXBXFP0Xf17fJ+IQQh9iMfhJr8ZupQ79bjRIYerkt0nuyFmDa8ZaC8+5fq+h+GGOlVLMh0/w6vUI02geDYIhRzvYRnx2mLuPYMG1Xiud6K5CnFVrYjm5u4MmNM5eO3nHRhRStH+s56qAVhHimjh4qWg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e07387b0-a52d-4280-7584-08d83ab640d8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 09:42:52.0954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Pq7p0zqGGCupdWGR5SaRM4NlhYRsO6NrZNl9Y7d8XEwe9aRhcY94qOrRFcODMwqa+WTDnbfmquczhKp4rqfvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7077
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
to get net2272 private data.

CC: Anton Vasilyev <vasilyev@ispras.ru>
CC: Evgeny Novikov <novikov@ispras.ru>
CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
---
Changes from RFC:
- Using usb_gadget structure to get net2272 private data, and
update commit log accoringly.

 drivers/usb/gadget/udc/net2272.c | 25 +++++++++++++++----------
 drivers/usb/gadget/udc/net2272.h |  1 +
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/net2272.c
index fbbe62513545..0168d76d75b8 100644
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
 
@@ -2449,7 +2454,7 @@ net2272_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	if (pci_enable_device(pdev) < 0) {
 		ret = -ENODEV;
-		goto err_free;
+		goto err_put;
 	}
 
 	pci_set_master(pdev);
@@ -2472,8 +2477,8 @@ net2272_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
  err_pci:
 	pci_disable_device(pdev);
- err_free:
-	kfree(dev);
+ err_put:
+	usb_put_gadget(&dev->gadget);
 
 	return ret;
 }
@@ -2534,7 +2539,7 @@ net2272_pci_remove(struct pci_dev *pdev)
 
 	pci_disable_device(pdev);
 
-	kfree(dev);
+	usb_put_gadget(&dev->gadget);
 }
 
 /* Table of matching PCI IDs */
@@ -2647,7 +2652,7 @@ net2272_plat_probe(struct platform_device *pdev)
  err_req:
 	release_mem_region(base, len);
  err:
-	kfree(dev);
+	usb_put_gadget(&dev->gadget);
 
 	return ret;
 }
@@ -2662,7 +2667,7 @@ net2272_plat_remove(struct platform_device *pdev)
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

