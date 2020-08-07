Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4E6E23EAA0
	for <lists+linux-usb@lfdr.de>; Fri,  7 Aug 2020 11:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbgHGJmw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Aug 2020 05:42:52 -0400
Received: from mail-eopbgr50089.outbound.protection.outlook.com ([40.107.5.89]:59671
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726854AbgHGJmt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Aug 2020 05:42:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQFI0eVDh19xsfxLY/igEpLSZ3LY6YuzkA3xDEICpDX8323bM/NHdblbOOZXk3aFkBEGo2+W/wCg57xfAptFWN6AhVE1cf0XE4CDH59NsTlWKIwF5UzeQ+/zEIVucN7ry5MohYnrYTHJFFmvfIich1RDJSlH3BBzKf8J+9havnMlxf9qR+nNIEae4o4nFsVxeeHokuUIRAcw/qCwAWBtRNpckcIMP6hZWfOv2f8UWGoqqx2zemLRC86Cjzrvd9ogO2jdELdg2LBBno3RFrVKMB1dpmtK9MkSnDUffLIIE27BlzIcBOBGJFNYqa0IqXWM2ZwEZ08r3XBD687kUi7+Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vxPPPntnViZsryI+nEulTcedG4sa2olk/BSe5ZZK2s=;
 b=MXSfLjwHCZauBPRyZWR72WFfTkEaDN5PzX6JUBSYpl7/risKMars/BWthdJLYGexIqQt2OWwjIstqJraHMR6L0MAYmPGLBiv7CVQmbueTmHrNFrnWQQkCDIg8RynbTCTQBBePX02my5RPY7Efpr2O8bmYfAmK7M9R1HNxjPkuFGeFPKVXhOY7P/kw6r+x/bbuPKrWSFDujNFh7QomQ7f06VZ+I0bADBqFxN5m/JthT5x9yXHFzuVbGfmTDimG9kRlsbbENZHs7EexbHikxAC8WSi3ufHZMRqv3vh97rGoarpEww8uYPGpC6PBKXMnUcqgHvUYg0B2WgpyLwWgR4SIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vxPPPntnViZsryI+nEulTcedG4sa2olk/BSe5ZZK2s=;
 b=XgoV4nerxBaXy6QlTVpajLZ6ME45FP6XBUxQQ+hfUmeMt3DpykJVNZxjQzXUUhq7hB3Q3zXEvBTryXwJoFF0+fpvOU7YIwWGe6bbsITCqco4sHwOf3RH5hzmGauENC1eo68O9s6V36um/kY95lexF6atJqMSDIa82fJ6KvysjwI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7077.eurprd04.prod.outlook.com (2603:10a6:20b:11c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 09:42:46 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 09:42:46 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        Anton Vasilyev <vasilyev@ispras.ru>,
        Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 1/6] USB: UDC: Expand device model API interface
Date:   Fri,  7 Aug 2020 17:41:46 +0800
Message-Id: <20200807094151.13526-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807094151.13526-1-peter.chen@nxp.com>
References: <20200807094151.13526-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:4:91::17) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0113.apcprd03.prod.outlook.com (2603:1096:4:91::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.5 via Frontend Transport; Fri, 7 Aug 2020 09:42:44 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1376035e-25bf-4f95-b142-08d83ab63da4
X-MS-TrafficTypeDiagnostic: AM7PR04MB7077:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB70770A0FA4E53583C43AFDBA8B490@AM7PR04MB7077.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:392;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gpOHVdO+zLNNDq4uWwsDldDqnQzmhxfkPTBbbM51R3EbknjYfOniDsH7rmAXEUOjhSiY/EzotpGmCI/tgz9L8BpEVnbibMVKot1ViInF7WCyl8lHCip1q69joLlTAR9smjVgR3Xc+arVvEdERF4Ic/QIyUhB2V2Fm/ZQfWBQ7RU0bpQk8EOBKtKUYR5J8OhiC66487bVbZtGeljOa14SidqVXy37+JZsun43gXNeH8ydtIDjrMdoy3NDuig7RSFavD7ukMBDKlWTLz3e8SD38vsEMZ7EcwMtpC+klG9CVl288B03LhtPkksp08FZvKWUEfE30EIH7auqyB6Gq5Fygg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(136003)(39860400002)(376002)(396003)(956004)(2616005)(5660300002)(86362001)(16526019)(44832011)(6486002)(186003)(66556008)(66946007)(4326008)(6512007)(26005)(52116002)(8676002)(83380400001)(1076003)(54906003)(66476007)(36756003)(8936002)(478600001)(6916009)(316002)(6506007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 3mqbvOj0egR4K+40TXXTzfb/IZGnfXroSmAoCwdQIAngwsCT2ty54/Uym3Kf/HHgHx63sZ9mMF4U6JtUIrrQ2F4zhQYgft49a/2/HfrUeee8tQ4RtBnNxMrohoCcpKP34HslWBX0hThBVS/agw9v1rBKZOwrmQ868nnsUxrZadB6C0WCeiJ3YqzqZTNqJgrK1U41ygZBBaBF2wKt0ly+UJbUxBd6GWaZjCkSD9Cn5mAfDswrngteVWr0dcUi2xti73jxa16whx92LlUfIx/0QCBUIdd5xcaJSwmZZLNwwhgahphuIHI7B9j5Fdc1CWv/VdKN2B5L786Bc7xEvtgkL+7nfiUHBRRAHaZjpwGIm13mztO4K7B6uCcrAmQulP+Jhr2+10Tm+zcVbpOAPsGyG7V541LCUNl18CwWabU0RCjN1GLf5GAVMT/qQ2TyqGve2Gxj6+/1B+11uJbKz1hk1VmwWF3iCFcjaqHiES+GFR/Cg8M/TtOt5fbam7Ai+0673i4/SGVD15H55HNJTU9bLLZJhMQmH7Oj86qJ2ng7RYlZVmT6l38cG9oJzDQr8FrsLmAAGz3UaEFuPMsqI4Tghm5PcC4Y3W7yotSGmmX5JjBiGUev8ISv9XKSdAwiMZWO6hFIs0G8iytoMc0uF+JDoQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1376035e-25bf-4f95-b142-08d83ab63da4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 09:42:46.7678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /lioqhB8TZSc53ESWE3f8AP73752r2zQsBLqOdAK7U3UuKY0u6nz6j7NSrDE5N7bX+w3MBrW/Zm1ZzVyiSPHpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7077
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Alan Stern <stern@rowland.harvard.edu>

The routines used by the UDC core to interface with the kernel's
device model, namely usb_add_gadget_udc(),
usb_add_gadget_udc_release(), and usb_del_gadget_udc(), provide access
to only a subset of the device model's full API.  They include
functionality equivalent to device_register() and device_unregister()
for gadgets, but they omit device_initialize(), device_add(),
device_del(), get_device(), and put_device().

This patch expands the UDC API by adding usb_initialize_gadget(),
usb_add_gadget(), usb_del_gadget(), usb_get_gadget(), and
usb_put_gadget() to fill in the gap.  It rewrites the existing
routines to call the new ones.

CC: Anton Vasilyev <vasilyev@ispras.ru>
CC: Evgeny Novikov <novikov@ispras.ru>
CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
---
Changes for RFC
- %s/intialize/initialize
- Delete the net2272 and 2280 description at commit log

 drivers/usb/gadget/udc/core.c | 78 ++++++++++++++++++++++++++++-------
 include/linux/usb/gadget.h    | 27 +++++++++---
 2 files changed, 84 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index ee226ad802a4..473e74088b1f 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1162,21 +1162,18 @@ static int check_pending_gadget_drivers(struct usb_udc *udc)
 }
 
 /**
- * usb_add_gadget_udc_release - adds a new gadget to the udc class driver list
+ * usb_initialize_gadget - initialize a gadget and its embedded struct device
  * @parent: the parent device to this udc. Usually the controller driver's
  * device.
- * @gadget: the gadget to be added to the list.
+ * @gadget: the gadget to be initialized.
  * @release: a gadget release function.
  *
  * Returns zero on success, negative errno otherwise.
  * Calls the gadget release function in the latter case.
  */
-int usb_add_gadget_udc_release(struct device *parent, struct usb_gadget *gadget,
+void usb_initialize_gadget(struct device *parent, struct usb_gadget *gadget,
 		void (*release)(struct device *dev))
 {
-	struct usb_udc		*udc;
-	int			ret = -ENOMEM;
-
 	dev_set_name(&gadget->dev, "gadget");
 	INIT_WORK(&gadget->work, usb_gadget_state_work);
 	gadget->dev.parent = parent;
@@ -1187,17 +1184,32 @@ int usb_add_gadget_udc_release(struct device *parent, struct usb_gadget *gadget,
 		gadget->dev.release = usb_udc_nop_release;
 
 	device_initialize(&gadget->dev);
+}
+EXPORT_SYMBOL_GPL(usb_initialize_gadget);
+
+/**
+ * usb_add_gadget - adds a new gadget to the udc class driver list
+ * @gadget: the gadget to be added to the list.
+ *
+ * Returns zero on success, negative errno otherwise.
+ * Does not do a final usb_put_gadget() if an error occurs.
+ */
+int usb_add_gadget(struct usb_gadget *gadget)
+{
+	struct usb_udc		*udc;
+	int			ret = -ENOMEM;
 
 	udc = kzalloc(sizeof(*udc), GFP_KERNEL);
 	if (!udc)
-		goto err_put_gadget;
+		goto error;
 
 	device_initialize(&udc->dev);
 	udc->dev.release = usb_udc_release;
 	udc->dev.class = udc_class;
 	udc->dev.groups = usb_udc_attr_groups;
-	udc->dev.parent = parent;
-	ret = dev_set_name(&udc->dev, "%s", kobject_name(&parent->kobj));
+	udc->dev.parent = gadget->dev.parent;
+	ret = dev_set_name(&udc->dev, "%s",
+			kobject_name(&gadget->dev.parent->kobj));
 	if (ret)
 		goto err_put_udc;
 
@@ -1239,8 +1251,30 @@ int usb_add_gadget_udc_release(struct device *parent, struct usb_gadget *gadget,
  err_put_udc:
 	put_device(&udc->dev);
 
- err_put_gadget:
-	put_device(&gadget->dev);
+ error:
+	return ret;
+}
+EXPORT_SYMBOL_GPL(usb_add_gadget);
+
+/**
+ * usb_add_gadget_udc_release - adds a new gadget to the udc class driver list
+ * @parent: the parent device to this udc. Usually the controller driver's
+ * device.
+ * @gadget: the gadget to be added to the list.
+ * @release: a gadget release function.
+ *
+ * Returns zero on success, negative errno otherwise.
+ * Calls the gadget release function in the latter case.
+ */
+int usb_add_gadget_udc_release(struct device *parent, struct usb_gadget *gadget,
+		void (*release)(struct device *dev))
+{
+	int	ret;
+
+	usb_initialize_gadget(parent, gadget, release);
+	ret = usb_add_gadget(gadget);
+	if (ret)
+		usb_put_gadget(gadget);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(usb_add_gadget_udc_release);
@@ -1308,13 +1342,14 @@ static void usb_gadget_remove_driver(struct usb_udc *udc)
 }
 
 /**
- * usb_del_gadget_udc - deletes @udc from udc_list
+ * usb_del_gadget - deletes @udc from udc_list
  * @gadget: the gadget to be removed.
  *
- * This, will call usb_gadget_unregister_driver() if
+ * This will call usb_gadget_unregister_driver() if
  * the @udc is still busy.
+ * It will not do a final usb_put_gadget().
  */
-void usb_del_gadget_udc(struct usb_gadget *gadget)
+void usb_del_gadget(struct usb_gadget *gadget)
 {
 	struct usb_udc *udc = gadget->udc;
 
@@ -1337,7 +1372,20 @@ void usb_del_gadget_udc(struct usb_gadget *gadget)
 	kobject_uevent(&udc->dev.kobj, KOBJ_REMOVE);
 	flush_work(&gadget->work);
 	device_unregister(&udc->dev);
-	device_unregister(&gadget->dev);
+	device_del(&gadget->dev);
+}
+EXPORT_SYMBOL_GPL(usb_del_gadget);
+
+/**
+ * usb_del_gadget_udc - deletes @udc from udc_list
+ * @gadget: the gadget to be removed.
+ *
+ * Calls usb_del_gadget() and does a final usb_put_gadget().
+ */
+void usb_del_gadget_udc(struct usb_gadget *gadget)
+{
+	usb_del_gadget(gadget);
+	usb_put_gadget(gadget);
 	memset(&gadget->dev, 0x00, sizeof(gadget->dev));
 }
 EXPORT_SYMBOL_GPL(usb_del_gadget_udc);
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 298b334e2951..791571f5191e 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -436,6 +436,7 @@ struct usb_gadget {
 };
 #define work_to_gadget(w)	(container_of((w), struct usb_gadget, work))
 
+/* Interface to the device model */
 static inline void set_gadget_data(struct usb_gadget *gadget, void *data)
 	{ dev_set_drvdata(&gadget->dev, data); }
 static inline void *get_gadget_data(struct usb_gadget *gadget)
@@ -444,6 +445,26 @@ static inline struct usb_gadget *dev_to_usb_gadget(struct device *dev)
 {
 	return container_of(dev, struct usb_gadget, dev);
 }
+static inline struct usb_gadget *usb_get_gadget(struct usb_gadget *gadget)
+{
+	get_device(&gadget->dev);
+	return gadget;
+}
+static inline void usb_put_gadget(struct usb_gadget *gadget)
+{
+	put_device(&gadget->dev);
+}
+extern void usb_initialize_gadget(struct device *parent,
+		struct usb_gadget *gadget, void (*release)(struct device *dev));
+extern int usb_add_gadget(struct usb_gadget *gadget);
+extern void usb_del_gadget(struct usb_gadget *gadget);
+
+/* Legacy device-model interface */
+extern int usb_add_gadget_udc_release(struct device *parent,
+		struct usb_gadget *gadget, void (*release)(struct device *dev));
+extern int usb_add_gadget_udc(struct device *parent, struct usb_gadget *gadget);
+extern void usb_del_gadget_udc(struct usb_gadget *gadget);
+extern char *usb_get_gadget_udc_name(void);
 
 /* iterates the non-control endpoints; 'tmp' is a struct usb_ep pointer */
 #define gadget_for_each_ep(tmp, gadget) \
@@ -735,12 +756,6 @@ int usb_gadget_probe_driver(struct usb_gadget_driver *driver);
  */
 int usb_gadget_unregister_driver(struct usb_gadget_driver *driver);
 
-extern int usb_add_gadget_udc_release(struct device *parent,
-		struct usb_gadget *gadget, void (*release)(struct device *dev));
-extern int usb_add_gadget_udc(struct device *parent, struct usb_gadget *gadget);
-extern void usb_del_gadget_udc(struct usb_gadget *gadget);
-extern char *usb_get_gadget_udc_name(void);
-
 /*-------------------------------------------------------------------------*/
 
 /* utility to simplify dealing with string descriptors */
-- 
2.17.1

