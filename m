Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3992400CE
	for <lists+linux-usb@lfdr.de>; Mon, 10 Aug 2020 04:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgHJC03 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Aug 2020 22:26:29 -0400
Received: from mail-eopbgr70080.outbound.protection.outlook.com ([40.107.7.80]:49993
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726219AbgHJC01 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 9 Aug 2020 22:26:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2DymKdTclkgZbotoUrP7ZPKlGL3M2XwQufPK20Zz7Q3PtYkRJmT2/d9mU4JcO4nYdXHIUQX/zEhtrbsu0HwtXNoPSUyWN6Uyub2+WMzhpgQyegBa5CdbhE6NYG21O1G4Op7+IBa3emgQlL0N/55HTE/Auovq/iNhqQ+0qcp6COH0ZcNZNnIqgaEkP7IAdQDBBzcO7Ewa0lp/AUHt4ocGJNBdbO5zH7e2hL0eC3bWpNDPXyHfVPnqi5VZPAoalx414gBsGO8V3qczRQ2AbUfQW7IyBv79u00z+AaB+MrWFGmMunpRF0RSfALEKlBPiNwF6I/6S8yFtdLk5+cEGQW/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWb9CNVmwSSWlae+Jzh6HOd1AgzSkK1zXwCWbbZdXUw=;
 b=fIb90bs8Fkv1zt11tBnUJ44vIJHRy9R0YBh3gh2e1CZ3SJemPpmxITRGp1Lwia1K4mY1XWR3qUOE6XZEFpw3lYgJlHNrPmBk0ndupStdIDE2uZM1TPRnHF4RhR9Fy92O4KewdGx7gaPsSPhsexoB4m5vtWNxKSPw/Re9NmUpaPGNjlBKgUOxXdhILyNqbEZlZ0IBfS493Dwu/wzcqcHUzHnz56AiB7Ab36LWHwNZUBnj7/MGVp6uQc9rM9thmB1msW6IVPOCF7rnUmahhVqIdqnPQhXHGAiUhPvyiesZAUfX/f17+9JcabSABPs1mm7YxmrTzOVux2nfPXViyzwzxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWb9CNVmwSSWlae+Jzh6HOd1AgzSkK1zXwCWbbZdXUw=;
 b=gyJEdFDjeTiuh03q/io5W08Ly6XiHOp8Vi4ZHBl4N3wUJAFT811Rko3PlolGKbfsFatY1dWha75RwjciIhsreP7GmEU6bAMoF8kNQ/H1Lylqif+iIDUse+M+dAFhUgDLDnEYptpsnUGk/4T/meojK981RFJOyZzdZU6q4Tw1xsg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7160.eurprd04.prod.outlook.com (2603:10a6:20b:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 02:26:21 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.023; Mon, 10 Aug 2020
 02:26:21 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Anton Vasilyev <vasilyev@ispras.ru>,
        Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 3/6] USB: UDC: net2272: Fix memory leaks
Date:   Mon, 10 Aug 2020 10:25:07 +0800
Message-Id: <20200810022510.6516-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200810022510.6516-1-peter.chen@nxp.com>
References: <20200810022510.6516-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:4:91::24) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0120.apcprd03.prod.outlook.com (2603:1096:4:91::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.5 via Frontend Transport; Mon, 10 Aug 2020 02:26:19 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 295f1580-56aa-4369-fe68-08d83cd4c57f
X-MS-TrafficTypeDiagnostic: AM7PR04MB7160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB7160C0B1FF162153B67340968B440@AM7PR04MB7160.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rVFNyrenj8WqZPuH/CxuAycwMncwY13a2V6y3XPkM5Tv+RBg/tTkHx57bDiM8i5TIvEKdK+nXFmSNJOAes6hTgpTSzac/SWgiRK86azBcX6R9aXLskwwRvQH1RAxPuj+KpvLG8qVINURauA9rYd/kvWWB5OOzzMfRUbQGXiq80AkopPKYUUD+XkHfqFp2HTM3dggaXSq7G7wcyeEk13iktO0IgRvpsDwAit7fZP2y+BhKpdw1EK5KunAxvsj7M23T9ZMo6fDFVCneTBa4OyczYDRIwZo9jWA+Sxh0pAarOc2PWVKTjFK7lgZUfkjLeDodV990hqImTDjNs4zwebh6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(36756003)(2906002)(86362001)(83380400001)(1076003)(5660300002)(6916009)(6666004)(6506007)(6512007)(44832011)(2616005)(956004)(8676002)(66476007)(8936002)(66946007)(66556008)(478600001)(16526019)(26005)(52116002)(316002)(186003)(54906003)(6486002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: y7XSMt833Uk2ZTTi7+LvKyH1B2P7hMVL1w9bZRdjhA4CmpK5umZShQB+GIENMjvwQe5IMevJnSdVCHBPywkVvi0S8LrmjDL038T5QBrBjOQaJmpBRuRJpXM6h2Cauz5hl4QGb/JpwQC5J6Goj7msUpNQ+uhNaiEIakLoJE5XA9VykjewNEmTOZ5wBmfVRjmflAe0mnDxrW8V2awJW04j9VOiw6E8w3EY6ixA7WnSSQhd7p+6XSFDJNpESBanRx/18v5uNzAo9e6Hiy4akCqj+/OQ18zsvGtlZyrJgiKvnKyMK1WLuVqHJfU4Vf3MjwiPPOIcWEOa9qaK9yhigs9SrryybN62a0pbysqcM6oZLJ5mUFqZJRXd7wHD4y1IxzODnd/eA5TlWu8JdEBk2Un1lPKwkoie2Nt/DCm+39HqWHSB3evi0xJ22lwLTcYSo3BvT82wwwfl43VjPz/VA2lFWydpbsbDnA8F1gy38tJ6x8wNTOD5fyUOWW/aIAav0rQjIX9AMxwoyqRvXVBiXGz/t4p3LtDCFeFrYGqZFGfXA3Hl5dvstPApceM2vZKikscPY9gKeESXmnrDIrNnJSAGWalCHuP+R+XJVUZMKTxsLFrkx3u+bhUAK4Mz60xeE8i+L5AzFx3Yp5ceRop0Il/HyQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 295f1580-56aa-4369-fe68-08d83cd4c57f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 02:26:21.8850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zaEHXFL2QNsw4wekRNob4Uu2RIOnLz/IjIWON+qT2HeDh/N1PXWx1KKsCC2cdg9l0czbDL8Sfdytb7amvWdTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7160
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
Changes from v1:
- Simplify the method of get the net2272 private data pointer at .release function
- Add my Sob

Changes from RFC:
- Using usb_gadget structure to get net2272 private data, and
update commit log accoringly.

 drivers/usb/gadget/udc/net2272.c | 23 +++++++++++++----------
 drivers/usb/gadget/udc/net2272.h |  1 +
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/net2272.c
index fbbe62513545..7046b7eda900 100644
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
 
@@ -2449,7 +2452,7 @@ net2272_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	if (pci_enable_device(pdev) < 0) {
 		ret = -ENODEV;
-		goto err_free;
+		goto err_put;
 	}
 
 	pci_set_master(pdev);
@@ -2472,8 +2475,8 @@ net2272_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
  err_pci:
 	pci_disable_device(pdev);
- err_free:
-	kfree(dev);
+ err_put:
+	usb_put_gadget(&dev->gadget);
 
 	return ret;
 }
@@ -2534,7 +2537,7 @@ net2272_pci_remove(struct pci_dev *pdev)
 
 	pci_disable_device(pdev);
 
-	kfree(dev);
+	usb_put_gadget(&dev->gadget);
 }
 
 /* Table of matching PCI IDs */
@@ -2647,7 +2650,7 @@ net2272_plat_probe(struct platform_device *pdev)
  err_req:
 	release_mem_region(base, len);
  err:
-	kfree(dev);
+	usb_put_gadget(&dev->gadget);
 
 	return ret;
 }
@@ -2662,7 +2665,7 @@ net2272_plat_remove(struct platform_device *pdev)
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

