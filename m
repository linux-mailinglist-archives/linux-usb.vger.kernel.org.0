Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23D7A24CB10
	for <lists+linux-usb@lfdr.de>; Fri, 21 Aug 2020 04:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgHUC5Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Aug 2020 22:57:25 -0400
Received: from mail-eopbgr50073.outbound.protection.outlook.com ([40.107.5.73]:27655
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726840AbgHUC5Y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Aug 2020 22:57:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCfdkldMgoEZh7fThrgsfSU4LxmvRZeAkQLUViO+cVZLOmaNwXoByy2sX4XyslB9SxJJ1ap7bQkz9CqzKD0V5curkf6AJU8LabZ2ldH8lUCwKGYqrsuh3Fv5xEXja6M3pef6hUT9xRKXC3Obd79/RGKraKMONTFbtzExROVZLfuyhfZYkMH+QfOL1EyDMrQ/IN5ZElo/V6yjTb2xbVz4bEnfZas+gmdnlwgzRUTmpSxCeJqvQ+XbnuSOlO08KjfyUP3KGUtT5mJIIMkmW4xQZ+APJB2UGWgHKhhor5+6EkPjILN/3JtJu+f+zrxQ0guvdSt4gdsZeLTkRFOZvlrzXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/krRLvd/SuWTMIjpxNrkzqnZ+jgfBdjVuApIpNte0f4=;
 b=mdrAyTG2F7Fni2cB5EJJQft8y1E0fF112ySNr/0HAVjxzJpKVVKzW9ur+CW0N8REMipukro8EFKWP1oLY/1fkRZTZOX8h0y62VjCsbKfHbdT40YD1ysE2zMAjjsYWjQwIBeFN3MfECDkpTEJSW7Mf3LY/l9vyZNd3gX9kCYP21IFj9S9cpiEmGe3Mrj7KQpT3UPFSkGWIlu25Rqoene38eu9PI4jDi4Tb3gG0kwJLdZSXmGMkR1giTeRbJwQ3Cwu8itp2aVW6955XnUyyb/WUhO6NvukdaCRn2s39s09gtrBCIIpkpl1KFlf7ROKHEXGJNVyoFff0NG3Ht7kNN8MtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/krRLvd/SuWTMIjpxNrkzqnZ+jgfBdjVuApIpNte0f4=;
 b=nr0q3Th3ZMQga3DUHOAAAsKfCOYHnkVx/laOHNShxNrE/oZc/mnAWCQbKOmHXcF8oIm53jZ2HrHKbLPQBjhxafnom9byEWrB6bju+1pDGzMb8lS6jgxFMFkCqO+b18fqGgh5s4rnqd64IGVvsQYsNSr+YwYr4Pkb75PJxhy5KI8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB7PR04MB5577.eurprd04.prod.outlook.com (2603:10a6:10:8a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 21 Aug
 2020 02:57:17 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2%9]) with mapi id 15.20.3283.027; Fri, 21 Aug 2020
 02:57:17 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Anton Vasilyev <vasilyev@ispras.ru>,
        Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v4 3/6] USB: UDC: net2272: Fix memory leaks
Date:   Fri, 21 Aug 2020 10:55:46 +0800
Message-Id: <20200821025549.4591-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821025549.4591-1-peter.chen@nxp.com>
References: <20200821025549.4591-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0132.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::36) To DB8PR04MB7162.eurprd04.prod.outlook.com
 (2603:10a6:10:12c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR01CA0132.apcprd01.prod.exchangelabs.com (2603:1096:4:40::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 02:57:14 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: efdec1b8-e4b8-43b1-a32a-08d8457dea33
X-MS-TrafficTypeDiagnostic: DB7PR04MB5577:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5577D3637F66080A86163F778B5B0@DB7PR04MB5577.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l0Fa6BVQ/Ngw9zumzp4j5cyCAyVdp2YzKLXgvqnoCnwIkiab9SEbIkdqYl9ijKtuZaZXqBxutYuz5CB7wdgJY/NcuOi/1x8cLOIOFw5fDdcfCl9/6c+456jR3OVKa8TSW3eYJa0MSJnnWb9Vk0MjKvuioLIKOq2JjdaLgVU6N25oXJvpk2Y5HM1L7+35GqozSZKLgjtb/vZINoStZ67LsjCw6DhZ4eXIKOqucY3oOuhtPjh35VLGU42U2OtfOBw34gQ5ppEii8dnEdp9CvY3nj7NIrJ4cJr8d5IqFeeZBG4adAQFzBQ3y7h9lIYPxYgHBTNP4vL0V1jfFufwG2sCcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(52116002)(66946007)(2906002)(8676002)(6486002)(4326008)(6506007)(478600001)(316002)(6666004)(44832011)(36756003)(54906003)(956004)(26005)(66476007)(66556008)(2616005)(8936002)(1076003)(6512007)(5660300002)(6916009)(186003)(83380400001)(86362001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Ru49j7kptQFSaEmS9YcA63we0LOZZwxQGxjWAF1fS7tvpZ9kN7q9mXcjIKTqpLTH80nrfvPKJam019L6gKlbgfvzY8Auz/yKNBKIGZSz5bmKKmATBrqjls6e0gn4qRdm7W0bDJKV/D7T9MiqJdO6Of4T1snZpHjKEB8iZYMDR8r0dibYHNg6LpYN1xr7Fksdk2WBZa2a2XfIRm+Nj8Pgp5cMXNDPO6OZ2+oJtW1FcomTsbWeeMG5MNjhWvBv6zdTWxFIwopJJn51XrpIhDDGd6v9RMQoCjFDdBKNVA4Fbk6I12w0Mw8XLnA6DwZGcx6yT/n1fL401mqSKbUBXMkgaIKm2qyEPJHzsoFNVygsv4Uu1VfAUCcewiKRFyRSGun0C6+hdeMS28/baWtfi8bqNFVa5iYduBtK3IS77MFDpzOGA/SkFvgBv1wT9YEoNw9KmgGVrf3kdXlQHHncMmcuZf41B4ONj8mdq6MXosNo3dI/httWuK3p09PiT6ioiMs6t6TYArs4djQG755f1zn6PShB0pweZES6qSwRCmHBlb9rf/wKe+TBQwkwRZ3/7I4i91IJX2xt/ik2jsyNhFo9q9fKR3rJ8+49MtQIn6dpS2wdzSDOOlAiIjvlbVayVi4agjaBW3ir1v92InV9GwJZzQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efdec1b8-e4b8-43b1-a32a-08d8457dea33
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 02:57:17.7263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BgQCFyZsZpj/grlCp8JkqrTDfLRYieQMt4PRxlsc0y1MLRLcis05tKWW8BDyTMNKrHg4IYPtkW4QV177utbirg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5577
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
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

