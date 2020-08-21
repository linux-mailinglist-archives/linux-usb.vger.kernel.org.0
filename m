Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC7E424CB0F
	for <lists+linux-usb@lfdr.de>; Fri, 21 Aug 2020 04:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbgHUC5X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Aug 2020 22:57:23 -0400
Received: from mail-eopbgr50073.outbound.protection.outlook.com ([40.107.5.73]:27655
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725852AbgHUC5W (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Aug 2020 22:57:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0kxJBn1W5r8jDEQqZ9jvzfb+hEDNha7ML6eV0cUXyifREdrTsLbd6RpgNDu1Gp5/JII7TV55raA2YTn5TPgaozT0U2Dpyo/5YaHUnLtidjpJaZTw2SAt+I2rYX0AELwrBoWZ31AdRGjtldJc7/tUYaqf6QTq3YUyMNeIbegLea5n3gREco4Xdmstt/yMVjXAOoFHym95jbBPsvQQeJxAFjSx/sy/FaSZ9npRccGNO5Otob+KVpTIlP9OjhgSbevQQ7YRmYtQ0QMEk52yoRx5WIk/WQ3F/ZAG5hHDVN1CMN20I7fT1TTYe9yuFoQLwKbyFe5ypQ4HhL08LY9sxKflA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWXQdHo3prLIR1gqseQQ6qkOo4GyDPRznnvcOyp9Yio=;
 b=PbPYqGxg7f7c4DArZcHEn0c+WoSvHcCdyzMqGdS4n5hz6qsdqVy3H8c7WeDDMFkUOAJrlx6uFJCDq36ljFrTOILvi4aId4ESrKEb3Nhi8Jtp8q1afakX3AjY/2j4x+Jywt2u1MshQwjg30JQRBSyS5vflgB0qHLxsAAXYfOafDc0E5tJDsLJqspl7BTjF3ydXldiLl8vWq+vbsmwEiAm5hqqPXi8GCHANZLWG6olN/jOZQrJNzSEm0PNM4+PmeqVtr06rQEiGAGVSnXWkQr1RR74aEPO3xmqIsbR+dJV3rXFlEQjbFj7kYeQggPYWphznlyNKKYEmB5ljKw3FnNf4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWXQdHo3prLIR1gqseQQ6qkOo4GyDPRznnvcOyp9Yio=;
 b=XAqrXbk3sVZlz05FMy6wOLXRFswpXuGs9EyF1CYGZaPEg5dHeLEfWqztHBHPR7c/sBmvuKDr45wFR2kOqylHhi/TGPMpoAypvzD9khoJtDVJOsJ+zkGBOiKx7yoBTTVdCzu1ra5QrBQLoIYey+49OF+XSc8lx0AecXFcNRklbHI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB7PR04MB5577.eurprd04.prod.outlook.com (2603:10a6:10:8a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 21 Aug
 2020 02:57:14 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2%9]) with mapi id 15.20.3283.027; Fri, 21 Aug 2020
 02:57:14 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v4 2/6] USB: UDC: net2280: Fix memory leaks
Date:   Fri, 21 Aug 2020 10:55:45 +0800
Message-Id: <20200821025549.4591-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821025549.4591-1-peter.chen@nxp.com>
References: <20200821025549.4591-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0132.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::36) To DB8PR04MB7162.eurprd04.prod.outlook.com
 (2603:10a6:10:12c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR01CA0132.apcprd01.prod.exchangelabs.com (2603:1096:4:40::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 02:57:12 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ed68b430-9a80-43e9-b85a-08d8457de859
X-MS-TrafficTypeDiagnostic: DB7PR04MB5577:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5577C4E5D98AB49274E142EB8B5B0@DB7PR04MB5577.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LRJHVxpZhM2Ke+/6x31wmqaNbVBbsf2Fwt8k3C5pnAcPEvt4XG5aDoEimSmlRVOSYD8D0t3aL9MUzCOxXO/TMf77FaIubjrmp58ZyRKnRqVtWBPR7GI9loUtHQlzJc6FrAw+k45KLG3BI138ZiSzW8mfhPyDU1STIsu/RMaEBKFua8Gl4o2Y8k1ySFhQ30bOwcwtbsz+n6fdbQC36ynjB2Dj1jkufC+UB7NrUy6ZftqBATJAm6FU1Iz/ecA7wFDrhRCEy7H+NVw/nn/reumy3C9VPjSCXEmlCzlL4cXPEf9Nh3UPasPBYJgyik3N2BEyALGmsSV/dAMAnTuphSsXQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(52116002)(66946007)(2906002)(8676002)(6486002)(4326008)(6506007)(478600001)(316002)(6666004)(44832011)(36756003)(54906003)(956004)(26005)(66476007)(66556008)(2616005)(8936002)(1076003)(6512007)(5660300002)(6916009)(186003)(83380400001)(86362001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: ZWrnBAKxzCQtJbX1etTs/g/ziE9XnG3NYTDN9c6RMP9nxwhxD3TKnZEJn+a7BzP3CjG8JmqPa6cs1lMbmAvdKYJ67Lc5JWyhivFci96aYFF1XZMATj0S+/2cJPT02Rln2WfUZv9eQ7ej7TxXOBpEh+oJma7tTbPQDxjG7WcQ4Ia2XOSFLuH5WTf7UUQue7J50QDoCXrxg1/KFb2C3sYszrUkYwcDIhAt5EuxdGdQbjFDLur9SitE7M8QOE9mV55z5BqM55g4mNoCyyB5J9Np00WfmxeAUowJjUX4jtPnkMYY5FHN2BnZ5LI9Kto251nakzjA72RKw/yKm75U1XNkxmgYIYp8XytXRj3P4zKqswBZ1yvoiQhhCWRHTrAJNVYrLXOE0njh7/tUUCrt/CRy/JrDfbt72lUmKpvXyysktCNPv0Cf0uyidvECz3jlWQJOCEGaMatLwbpSmjBPtEv1o+OfAQoExJ/aIZZGenyQcLPdIkzwJa6GNJ9jZhgAVjf9b9JxdX/4yCss1h2mYdIgxnW9o/3sg9upVLcjamtyB/NFRJpNyxFthfIWXximAEoxlDaoCYk8pujOHY8ZtyLngUogZNvmP2ex8ym15CjK9ms5DjPdMpj84OzuZ0RDfCzFwp9LPRlQFhdU16QkUoUZKA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed68b430-9a80-43e9-b85a-08d8457de859
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 02:57:14.6214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6nq6ivCtwt81dAszVNZ2lUsQQ7CcDoIjNr/f4tccElMOM6n06ALSpp37A74Ph4yGz09Nbz4h8m72HioXisOew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5577
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Alan Stern <stern@rowland.harvard.edu>

As Anton and Evgeny have noted, the net2280 UDC driver has a problem
with leaking memory along some of its failure pathways.  It also has
another problem, not previously noted, in that some of the failure
pathways will call usb_del_gadget_udc() without first calling
usb_add_gadget_udc_release().  And it leaks memory by calling kfree()
when it should call put_device().

Previous attempts to fix the problems have failed because of lack of
support in the UDC core for separately initializing and adding
gadgets, or for separately deleting and freeing gadgets.  The previous
patch in this series adds the necessary support, making it possible to
fix the outstanding problems properly.

This patch adds an "added" flag to the net2280 structure to indicate
whether or not the gadget has been registered (and thus whether or not
to call usb_del_gadget()), and it fixes the deallocation issues by
calling usb_put_gadget() at the appropriate point.

A similar memory leak issue, apparently never before recognized, stems
from the fact that the driver never initializes the drvdata field in
the gadget's embedded struct device!  Evidently this wasn't noticed
because the pointer is only ever used as an argument to kfree(), which
doesn't mind getting called with a NULL pointer. In fact, the drvdata
for gadget device will be written by usb_composite_dev structure if
any gadget class is loaded, so it needs to use usb_gadget structure
to get net2280 private data.

CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Reported-by: Anton Vasilyev <vasilyev@ispras.ru>
Reported-by: Evgeny Novikov <novikov@ispras.ru>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/gadget/udc/net2280.c | 11 +++++++----
 drivers/usb/gadget/udc/net2280.h |  1 +
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/net2280.c
index 7530bd9a08c4..d50bc6e19f2a 100644
--- a/drivers/usb/gadget/udc/net2280.c
+++ b/drivers/usb/gadget/udc/net2280.c
@@ -3561,7 +3561,7 @@ static irqreturn_t net2280_irq(int irq, void *_dev)
 
 static void gadget_release(struct device *_dev)
 {
-	struct net2280	*dev = dev_get_drvdata(_dev);
+	struct net2280	*dev = container_of(_dev, struct net2280, gadget.dev);
 
 	kfree(dev);
 }
@@ -3572,7 +3572,8 @@ static void net2280_remove(struct pci_dev *pdev)
 {
 	struct net2280		*dev = pci_get_drvdata(pdev);
 
-	usb_del_gadget_udc(&dev->gadget);
+	if (dev->added)
+		usb_del_gadget(&dev->gadget);
 
 	BUG_ON(dev->driver);
 
@@ -3603,6 +3604,7 @@ static void net2280_remove(struct pci_dev *pdev)
 	device_remove_file(&pdev->dev, &dev_attr_registers);
 
 	ep_info(dev, "unbind\n");
+	usb_put_gadget(&dev->gadget);
 }
 
 /* wrap this driver around the specified device, but
@@ -3624,6 +3626,7 @@ static int net2280_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	}
 
 	pci_set_drvdata(pdev, dev);
+	usb_initialize_gadget(&pdev->dev, &dev->gadget, gadget_release);
 	spin_lock_init(&dev->lock);
 	dev->quirks = id->driver_data;
 	dev->pdev = pdev;
@@ -3774,10 +3777,10 @@ static int net2280_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (retval)
 		goto done;
 
-	retval = usb_add_gadget_udc_release(&pdev->dev, &dev->gadget,
-			gadget_release);
+	retval = usb_add_gadget(&dev->gadget);
 	if (retval)
 		goto done;
+	dev->added = 1;
 	return 0;
 
 done:
diff --git a/drivers/usb/gadget/udc/net2280.h b/drivers/usb/gadget/udc/net2280.h
index 85d3ca1698ba..7da3dc1e9729 100644
--- a/drivers/usb/gadget/udc/net2280.h
+++ b/drivers/usb/gadget/udc/net2280.h
@@ -156,6 +156,7 @@ struct net2280 {
 					softconnect : 1,
 					got_irq : 1,
 					region:1,
+					added:1,
 					u1_enable:1,
 					u2_enable:1,
 					ltm_enable:1,
-- 
2.17.1

