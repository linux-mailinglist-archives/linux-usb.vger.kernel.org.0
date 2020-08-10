Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B61E2400CD
	for <lists+linux-usb@lfdr.de>; Mon, 10 Aug 2020 04:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgHJC0Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Aug 2020 22:26:25 -0400
Received: from mail-eopbgr70080.outbound.protection.outlook.com ([40.107.7.80]:49993
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726402AbgHJC0Y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 9 Aug 2020 22:26:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bz68hs7h8cgF6uFHN43XsZ/K4xD0opLTvAP4iC7jiK/n1XU7cv0oBWAovROAi4pNDflI9jQyTms30qukYSUdlsIdvi54FwmCe4JNjdG3mHZgiZhRTHLZHfAbSg6r78Wf5sUpXsdB59e/1mSvTy2yuYDS8PBbVTNNQwIHZ7g2HfI5GxVNTtIpxs3mKihuwBQigz7BWe3KXHGYZNQiMPIJ6DWkSstsZ0ZsI3C1Qt0JmguZjy6SA9uAOZrY9DVFMP+KdtqmL9mON1SBrK4ZjR+6ShE1DFVfa2u3DEUJ5TOoXeOpP+btuKUOoLWUDJomgetXkekJjUunhBoLCgaOREytkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlxMPzRrhT+g/0BmGIa9cw8LRpA3I2/1TEMCGDMOGbQ=;
 b=kbIOzcb/o9MyGsnlpS9Sd1qXlrTi8EUICE8oeUYaV8QjYoJl+R8JrGW90tJG8hAu7LWY4WMHpCRlgbgeHCXlGo1pUCNEMJW4bPW/73ghHuoBprGunEQB9iPPrd5IbCabbgjCt2MaaPZuyn7J4EKPS0hLxZ6cbkSvLwGYD6cCcGdOVqcv5OYY6mA5J9d/WuUsiG0hHNOaf++poYWPh05xmdgCt4ho1Q0VeFOEx3QHa8OlJGr+MTuHSvNBlozpV77clZebPsU6HsqQZzBXhg96MFx2qYy/U88d5nUTzF97Ap+EwpOwYmZf+ZwmEMGwT037KGjFJcKGdhLVFvkZCHRXfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlxMPzRrhT+g/0BmGIa9cw8LRpA3I2/1TEMCGDMOGbQ=;
 b=PkAY4wde/WBQrgVU0UdMoNz88B42k1JWjbkJvKoNsEyJm3JFuFQWRfXa6sEOKM6xo2Z0/WO4RMWvUwYF3Ok1l8/D1iISXRcyMpcpDOnFje1wD7DtA4qPWUFH0CHVqrasptUCRqC6sbdGWg+OQL5RRj2f7yiSg91pPeOGadXU6vc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7160.eurprd04.prod.outlook.com (2603:10a6:20b:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 02:26:18 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.023; Mon, 10 Aug 2020
 02:26:18 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 2/6] USB: UDC: net2280: Fix memory leaks
Date:   Mon, 10 Aug 2020 10:25:06 +0800
Message-Id: <20200810022510.6516-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200810022510.6516-1-peter.chen@nxp.com>
References: <20200810022510.6516-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:4:91::24) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0120.apcprd03.prod.outlook.com (2603:1096:4:91::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.5 via Frontend Transport; Mon, 10 Aug 2020 02:26:16 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 50bc23e8-b8a3-49dd-1e90-08d83cd4c390
X-MS-TrafficTypeDiagnostic: AM7PR04MB7160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB7160D926169422E23F4C4ADF8B440@AM7PR04MB7160.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A9MFCyfn4LDbaHkDtJpTEmgMjcoIXzbyTB28p81ldibHtwx3/F99gI6LtDjSKicP4P8MovK/cL88WjbneKMOfsVKDiEWKf8LlBOtTrdM3A1/TPNTAvVTeC3riD5KRF/aN9e5Q2SimvDK/evzMUsj3SuAth5V3hY8q3RTWrtQIUXt+4XdeGwqlhWnvqFUX2hEw6toGBA9ayECAhMHA3pkZNn3XYB6nqVV1Tq5/PYK8sedqLrlS05AKJkrjOsn3ou27FdDhGmVaHs9oV10tiTifzMNa5vajraDaAChsNL7CApuW0fZEMZJHf8lIiwHF2myxF3/KAjspiXE5RfFFnWSSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(36756003)(2906002)(86362001)(83380400001)(1076003)(5660300002)(6916009)(6666004)(6506007)(6512007)(44832011)(2616005)(956004)(8676002)(66476007)(8936002)(66946007)(66556008)(478600001)(16526019)(26005)(52116002)(316002)(186003)(54906003)(6486002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: DsWQRA+wS6uog9zUbTGqTdoNl4jIHvJ+1h1zdWrgLqqUkmB3/x8ycCwqJgIqCfhekRjwl7ok7KhkEHtyy1T0cMrdVBDh1KVct6uYutr3OyOklz8eRk2sOsRNuH0z8SvMMHKo19umuZdH0f7yEQqIVNeyxPOEyCbYAhvlrMijS5ZHgXDuhS1XkwHWtu9C2rQVlIh9wmRn9IZUhwmBiJaOvoBjsupagUr+sA0q2L2PIrP2jh8eVsxNY95WTiDU+CQ37u8cZwfcOFRapuxBMSPyhKCqjBLLEEPey7/6CkdbE70QwLYRFR3qlk9xZfp1m54wRC6wxbJFnilitaZSFTtjIgGvgOtzGHlPp3vVopDHSIuJDWuAg0m8sRaAWBYGeyg4vHcXtcqfOc4oIozqp9rljOjoyAmhkjkMTruojA0V35tAa+DQocpuGeLWIt58+w688tmHaiwvLHjnlCnLlhvp8XKgjvZ1rVcFKtBuchxDdr8VX2SNOcIZc4DAI4aKyBcH0Db5l0MXj+aZekxkVKmanE1a45hjn2uMgXwpQCHDr3ZaTrM2wtCKRsxWvjKXk23++mM5zhUW61hv4INxgQEdC7TzijRpe34IhfU0Jr6PM+s+G+nZ+09NNeyENvfICDZbRgmyK1IZVqV4NAfObuhSiQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50bc23e8-b8a3-49dd-1e90-08d83cd4c390
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 02:26:18.6482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFfL2R2mDVg3O8IZFu3KVVJKqxwOiE6uj6yzQxAhYJqjxBddDgXs5D5XyiCkxSwncttGZfp9sItHmUhtIQoL4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7160
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
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Changes from v1:
- Simplify the method of get private data pointer at .release function
- Add my Sob

Changes from RFC:
- Using usb_gadget structure to get net2280 private data, and
update commit log accoringly.

 drivers/usb/gadget/udc/net2280.c | 11 +++++++----
 drivers/usb/gadget/udc/net2280.h |  1 +
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/net2280.c
index 5eff85eeaa5a..68ac90b9d644 100644
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

