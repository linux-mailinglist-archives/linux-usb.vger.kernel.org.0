Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD5C2400CC
	for <lists+linux-usb@lfdr.de>; Mon, 10 Aug 2020 04:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgHJC0U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Aug 2020 22:26:20 -0400
Received: from mail-eopbgr70080.outbound.protection.outlook.com ([40.107.7.80]:49993
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726219AbgHJC0U (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 9 Aug 2020 22:26:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0gYxt50NF92tdfYO8COgnKv+q01OwEL2bCLUKUM65LtkpcFuRfBlJRrqkbIcO0qN6j9hjeX5CU2hdsjA6tyFFtWQx3jOsAeVw2wu7Dl/RMTevD/VDDjhaove8DyFHK/gWjLzwb+YwAVKTQTUTX+yfad5S65inkuToV7nu+V9W9yJZtSNRUOxdgoFocKoS7b/MNuXOiswEhR1hnwTJ4UtqCagQGBdV0AzJ9ZqEO4qMC0lU3QK2Sg8LSf7dnSJYl9Bs1WQHiKD1iscqmZPsX8holRUWOyILt4nX/HWpyv28Km5b7LHHrDZu0zOp97zJHkaI7vucRthXKDWXT3b2Qb0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbyXripJCHFzmjrlked+NH8AMepnnYixIufdUp/SSts=;
 b=IOxIp4cgp0meVUwXnrUyAL3OYMOY1yxNJVK/xrz6hRbfFjwcckMLMXjEGe2k0z5ODvHwqJjXScILSfCakwJh3bfbfpaaa9UeJ2p9qelhPm7sevjSerj/cR0PundMHgccvoQTphBPfPrTlCOkcFLjbdNu6KjbpjMTgq4CYezypBrCN/fxsb5qAE32UWBN8Ba2BfmECf0Y5Xo0bEOF7iotbXsU9x1VbzcjL2ie9vC7chN3bBndcijMCfoax/oeKz+hvrAZB0Y10tDCA6mVsW7P+3Ovco9TP4PRsYDyEYN/iVR0aQkueIjoqzo9bR3JO72WVjW933mSrouMgeGCd+WVHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbyXripJCHFzmjrlked+NH8AMepnnYixIufdUp/SSts=;
 b=pkvwRMoZ/7txZCakjYHeNNpJ9NbMomCPdo+l39uiVCFF/CAWodOTZmuGOtqGjuCcrqiDr4M3rc0D246lc0S8NzTy74AXY1/IG3ORbG6F4gpum+cMiJM2KUKuU1+wWtIjwPPzWymMFhQxDVcZOU4gMgh/5w8em91hjovGZOPRabg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7160.eurprd04.prod.outlook.com (2603:10a6:20b:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 02:26:14 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.023; Mon, 10 Aug 2020
 02:26:14 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Anton Vasilyev <vasilyev@ispras.ru>,
        Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 1/6] USB: UDC: Expand device model API interface
Date:   Mon, 10 Aug 2020 10:25:05 +0800
Message-Id: <20200810022510.6516-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200810022510.6516-1-peter.chen@nxp.com>
References: <20200810022510.6516-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:4:91::24) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0120.apcprd03.prod.outlook.com (2603:1096:4:91::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.5 via Frontend Transport; Mon, 10 Aug 2020 02:26:10 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4d5cfd54-b2fc-4eb3-e844-08d83cd4c116
X-MS-TrafficTypeDiagnostic: AM7PR04MB7160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB716065170F588139D0CF3BBC8B440@AM7PR04MB7160.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:392;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JUQJI5ZW3Osq3pmX8lWcweyEUcZJTCvlKIFFnfi4AqPQ6TQeW7pqER/yNzC50eJamPzpm2LAVp6vVjTNmK1pLuAkh1Vg2qT8+6iex3w3o4eX6BfMlXDtZfq+PB3ID7FWnvZIXYRSupydjQE9rKY9VzXGsFhDgztMnzPIfB3RxlFZzT0lHCotValxB3cHgiQA6c0ezt3tTcUyoudjKBSydG5wgd0YxfmAZ7aEonI+COs+zGsc3t6YBgc73Q5olEIyh+bZ/ydE0hzL22MjHgLQq2bGPtRNLAkpBNIgFcbW8OD/xrLZpzXEJ5ZBWOwOjlQNixMWRKuhSzuaTsukYKYCyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(36756003)(2906002)(86362001)(83380400001)(1076003)(5660300002)(6916009)(6666004)(6506007)(6512007)(44832011)(2616005)(956004)(8676002)(66476007)(8936002)(66946007)(66556008)(478600001)(16526019)(26005)(52116002)(316002)(186003)(54906003)(6486002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: O6S12XEhwxa4nIB+y35J6XIMz9owYc6b6dNb0jkJPntKugHX+JBLfC4XdyDKd6HQZeYG7qL/8A/JvulHqKXgAqPH4fmzUGlaF73NXIKowvfxjZ9TF7YfJwCsscrPlF3aLc8mE4Cxt9E1fUScVjHzyc82V3ZjyzpOuE8D6fgLBbygYiGa9bttJOKJNL2z0P+wpACB2cUOUdxd2FRUWJo2Y6mOh0Op6xTLHd1Z8PtW4r68HD6Q1axVPJIDBNZbWq0ELlVPUHZw60RRTYIp8LUHYRUeAJoxA8LfjV2Dp9JUP/W40LNoKfMtvHrjMbsZKw9SWQ9mq6tmCFnHTAPH4J0NAG1XVw1RhYfdX+cOd5HY2+8Xeysm2YfCny8eFcGNP9Vk9NXhohxHYMbvtr3StnaAtI262v9gpwUe8kJepaYQTIVbvJvZoHN7REQ2hdCZqEhy6laKDioWe46es9lxnEpbHu6jA2fESb91xbRbYngCKjP4GeGq2YkVFGsng3smd6D3iswimCKyzasej2knXco9C4HOZHl6IX6ikZ974ELBlXNDMRL8f7h+C1N7YHRiZGy+p3sUmvyf4AM0LBm0qiPuCvRCmnSjoRAV3f/XdOO9ycYKpd92t70R0w85bCL3zpu4KIOPmC/3gMtTVqLzVzb17w==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5cfd54-b2fc-4eb3-e844-08d83cd4c116
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 02:26:14.6657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLuUQSKakCQk2CUVNzDUYixtHEA2wPkIPc6hmNmOsYqmmGBGRzxh9JQXEHHu44NztYMMm8sUorxOajpuuu4mIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7160
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
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Changes for v1
- Add my Sob

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

