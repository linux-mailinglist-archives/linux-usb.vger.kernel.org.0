Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85C282432AC
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 05:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgHMDVD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Aug 2020 23:21:03 -0400
Received: from mail-eopbgr150075.outbound.protection.outlook.com ([40.107.15.75]:52133
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726615AbgHMDVB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Aug 2020 23:21:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMAPaDKYKpagZIlL2WxIKuZ1z9zPL+TmdlqD8TcOBwA7udIwuvvWUiY9KFHFXGFBg3Fdnnd4W+4+WFnh/m1LXcz9NJdRRUB6YTu0weNufb9vIrPCLBj3woGIJvPfvaRwk6Pim7+DuW0ug/cwW+XGwFRbazQsnwjUirAiWaZiTPxnkCL7bVnbnLZVCx4A2jV2m9BIKf6APOng+R0IOV6qVzGTSIF609NCFBvOuj+TEsy2Co3PYg68hDMh2a2lCOwWLINDpHU1thbShFADbPul/faNkVN6O60D0eRv0b4QbQZtRvYG1K5HK266uXx/F2kP+px53kc19mnbsT//DrTpng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uz1fxeRwHNTUMuGFz4aIe1+waFCw+PHldU5/u09YuI8=;
 b=KIYrc1rXaard7iHImboI0tJQuI0XXqL+SycfBP6/QIoOoarvGhKMvBsCiThTHyjZbVegoFcFnx+3cyTbiYwCCEkeSFr4pssDdeJNlwqjsf7CBLxH0uqXG2w3fEpJ4vEYqK/3tXoW/BPG7+dTjNOK1kvzk2792my8uAVVTU/Jx1nWEexLkHyhEepGc8bhIyTQLoeQNz4riPog5kWpZwUCeaecfrA1dyOY1yuFBWQbdqjJu0ehmwFCiJjwGC85xJqqETRrx7jt56dtpNHPWPWl05Gj/UbYAAX5Ge7ByPsEFRKfPI4kJ3l0dU5WWb8MPZ33d1FqeFrqVe3DQEHqLDcN4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uz1fxeRwHNTUMuGFz4aIe1+waFCw+PHldU5/u09YuI8=;
 b=r4gAlIo/Wj2mMZ/WZ0HtXlBCceQo4p6V1XnmEw3FEwpl7RoolR0XBqrkw2v8Kac/RlPhxP32UXCD2wApfd9TXJ81KaizOR4xF3pzfbR80Nx1qIfjHQVcItq000ZBRQYGeEBYCtl+r0aeEe6nYFUwBYUmb/9cuLo+da2XijQYF/k=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5911.eurprd04.prod.outlook.com (2603:10a6:20b:a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Thu, 13 Aug
 2020 03:20:57 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.025; Thu, 13 Aug 2020
 03:20:57 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Anton Vasilyev <vasilyev@ispras.ru>,
        Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH v3 1/6] USB: UDC: Expand device model API interface
Date:   Thu, 13 Aug 2020 11:19:48 +0800
Message-Id: <20200813031953.13676-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813031953.13676-1-peter.chen@nxp.com>
References: <20200813031953.13676-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0184.apcprd06.prod.outlook.com (2603:1096:4:1::16)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR06CA0184.apcprd06.prod.outlook.com (2603:1096:4:1::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 03:20:55 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9ef5dee6-9982-47c4-71cd-08d83f37e523
X-MS-TrafficTypeDiagnostic: AM6PR04MB5911:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB59111F8F7539725C5B726FAD8B430@AM6PR04MB5911.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ZQEx5DL17RQpETvHVOqxrU5JOdUhPmSt1DFO6pasQFmHtObmwvvPt0zXJS8cJ992aP7noIVyGIkzfK0sCsyRGPeLDgVvYc7xMe1SFS77Q/7CMkFqYjluNeDesu4qBZEPyqvlzSWR5jZT007G0l5DfV5esbAEtxSIRxFQGcbCXPeXHSV71u9fa7UwNAIPIbGKU5ZfAHsEql33s6Xm/0HPrH+WmsvL52atkFzpTo1Zi3oAIB7KTzqaWYQILpba73dFT1RcXUQyup9uPB6Mm8qJJUbVCNfNXEPvVVPKhl+mpBEa43/iuj1UTXodQqJhkojG7IqsolC5q+h5BPhpzYsJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(66946007)(316002)(66476007)(186003)(6666004)(54906003)(66556008)(16526019)(44832011)(956004)(26005)(2616005)(6512007)(1076003)(8936002)(52116002)(6506007)(4326008)(86362001)(6916009)(2906002)(6486002)(5660300002)(478600001)(36756003)(83380400001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: d2ELHUvZztctaBh0B5utAZ7f77O6fNCUWZbzJv+sHkvz/oSbGZa27+4CUzFklex3+/CmI2F3QkZ2thUJIMddOVgJi/0Kl8R2JNGm2oca3m7QoTHEzCan/+ymnAf59SfO6zE7R5PavAB4Hg3M0VRaWEXshXLZYISVxU/bcoywmmQBSnqRiSUDdXOYDURZ/QTESX/AIiro8yamDmrQYUVpu/eMCCM6F5JXTMQHlU6ydd1xCXuXeawsvIyWDOrvxW0YcbzgokqQX/TpgE1PVwLMiu0F6qCLRXZW/B4rCQXZ8gyTMQ45EjoBRdzNQ9asWq++qffNvur5v5b+NO+UR0thK+twq2rGcDwyl0QkzbuqLJm77NsAxK5qM2VYnNxpXQ8rx/lXv75RVqm3wSxVz0oGYxXbkg+uwi16FbiteVpKvYvC4YEvBp9IfXs+/Qax8ue84J2IJuGe7m790Fn3pymv0AXaWglGy3sEjXNBRossffxcYrmqkvsh1QZLwNNOM8wKgg/4ccZzqrvkZEAgkHyOfHPc+J5EJbvUqoC4vmoPhaOk9GzAc43k4Vi3HK8f21KgXyrPxr7mjNTZMKJlQmE5b7cyFx4eYeUoRfcGalTiRXbdQQnky1tixZzIsaTPFBNrcYCZ7UIqpxf3+qr7ysaqbA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef5dee6-9982-47c4-71cd-08d83f37e523
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 03:20:57.4554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: myu8QUHVOV+k8oqwDE3EwtHgpXCw5zxwbn1+FcNbg6C3Uh/9zEJzdqSfjc4bYrxyKGb0g2NwvJdeIrjTpNe3kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5911
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
 drivers/usb/gadget/udc/core.c | 78 ++++++++++++++++++++++++++++-------
 include/linux/usb/gadget.h    | 27 +++++++++---
 2 files changed, 84 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 4f82bcd31fd3..2b6770d9fb3f 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1164,21 +1164,18 @@ static int check_pending_gadget_drivers(struct usb_udc *udc)
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
@@ -1189,17 +1186,32 @@ int usb_add_gadget_udc_release(struct device *parent, struct usb_gadget *gadget,
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
 
@@ -1242,8 +1254,30 @@ int usb_add_gadget_udc_release(struct device *parent, struct usb_gadget *gadget,
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
@@ -1311,13 +1345,14 @@ static void usb_gadget_remove_driver(struct usb_udc *udc)
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
 
@@ -1340,7 +1375,20 @@ void usb_del_gadget_udc(struct usb_gadget *gadget)
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
index 52ce1f6b8f83..e7351d64f11f 100644
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

