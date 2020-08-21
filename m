Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6276924CB0E
	for <lists+linux-usb@lfdr.de>; Fri, 21 Aug 2020 04:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbgHUC5V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Aug 2020 22:57:21 -0400
Received: from mail-eopbgr50073.outbound.protection.outlook.com ([40.107.5.73]:27655
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726840AbgHUC5T (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Aug 2020 22:57:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENN57ja4kOXUUAyXyoNVgwqec8CKrv2STpvEa154UPjruxr6ZyIkfCgxy81fwE3X/TAoQ42XiSCq4tTcEN8B7RKpsveMarN96lN3q2VCnj8X0fFvZmee9NLkZgJYWA7Orrlj9xe5G+rgyo2lb+I32SVzIzzJTPyZQyxi6AJWm2CoCVI7IM0aKzNsUtE8UGQKqYVLtTd40VG9rqdSt9KQxQeaeSgL9C0yW56+CvN9YBrE40LQfxM4ld+QDFvAWsp0gPOVrQj/W9LVjrQnv4U3b8i2AtPd7WapJdF8Cv2YNgJTouG6pphF1MQVIiyThY451n8x5WVgCUgv9CVq8UeAow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcJgp55CMnKk0PxezJBoVVKxO6IRcMCgPjdetmsCfoA=;
 b=JhRwUwwN6BQZ/HnnP8MHWZmWk4ZcIejqJTsVGRtWlGarfjWJwGk39VOW4UH2LM9Djt26QkwdsN+SsW3VezU+jXK7bMJRuATPjiHO7NSvnzhLbjbkD3FLGRmpGkVbhiYJTLDDvLdHZQWlB5Nx1aYv4p2N6acgTK+J67py6+rwS3JRu3gqXc7oGNS4dZNubg4R9E3W5gL+qAh5ZNSC53yezLu0iPdM7Shi6P/bSVo1V8Cm+qX4Ma3UQ+K3wHqZZCvH7hFUyg6+uATVuHp3gLQWLz167s7gMF07npPoXoUd4fuPrLA32HbH06/rF5kV2JU2XPugwUxf0APlSCqyzET3tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcJgp55CMnKk0PxezJBoVVKxO6IRcMCgPjdetmsCfoA=;
 b=b3rQdKKzQAUPOsjFVfjuI4AJCqHA10778NOk/Ek2pj0urTfxCZ6JWItIVBnBv3SBaLcwvXl/f8KtCCqFvT2LIObFbHXfLzj08mvGfNqBxX2uBpNC+3aFpf4E4lSEXKrjj/Lleth7yI83IC9yUF+I1QCcotrntRFbrcseUnd5NTk=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB7PR04MB5577.eurprd04.prod.outlook.com (2603:10a6:10:8a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 21 Aug
 2020 02:57:12 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2%9]) with mapi id 15.20.3283.027; Fri, 21 Aug 2020
 02:57:12 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Anton Vasilyev <vasilyev@ispras.ru>,
        Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v4 1/6] USB: UDC: Expand device model API interface
Date:   Fri, 21 Aug 2020 10:55:44 +0800
Message-Id: <20200821025549.4591-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821025549.4591-1-peter.chen@nxp.com>
References: <20200821025549.4591-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0132.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::36) To DB8PR04MB7162.eurprd04.prod.outlook.com
 (2603:10a6:10:12c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR01CA0132.apcprd01.prod.exchangelabs.com (2603:1096:4:40::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 02:57:09 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7a043302-8a7d-4304-6530-08d8457de6c4
X-MS-TrafficTypeDiagnostic: DB7PR04MB5577:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB557763B306F6587C737EDDA58B5B0@DB7PR04MB5577.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aFSOWFHlAoU2sEONsnxCYWgyMuTlgVza3Jwq5CxG7XGVyEt8fWWctbpGVmgNAbeWWcX7ZglOlTw5u4ygJDR3HRqU1KytT3IIhxv+sLmYxVI/nnc0lPEVZIJgqDVkAO3qnPk6mX4TvfehV8MKLAHDdWqEywH+L6HN/b7LcR0C44lnRgS5Gw2LO6nS+UG9nmSUwwwmfthBgYpg+MEvgeINEXq5K8qvs20XoX42Urf0IuwquIyvvP2C+Gc2cjOOBmgcCNnNC0KjT/DybExHB64NAWjxLMe2yyR9KjADWDupU6igMt7R5whYdEp61T1rUyDaXmX5oCSc0UUEwYjxCVDRDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(52116002)(66946007)(2906002)(8676002)(6486002)(4326008)(6506007)(478600001)(316002)(6666004)(44832011)(36756003)(54906003)(956004)(26005)(66476007)(66556008)(2616005)(8936002)(1076003)(6512007)(5660300002)(6916009)(186003)(83380400001)(86362001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: q3knvGC28wQbQbN0ndPZmxNYYkFKXyujPIkDLAZU548RgigcMjJ0IfexWiKna3FLTL5X5vU7d23m+QrV0Xp45uO+JC6n7Y/Oag9B41MUJRAR6LlWWBfr1OfCsoXwI+Ac0MGBEUWGA4tWapBFHMkDftUvU4VqcS2kmpzdnx1V3zJqiO3Teurq+u7UyoJUvDaZ/8vPwiK1ef5Qx8kemt4BW26GQRj5MpqR5BomFDedczYE/9ryUYCEaCbqgDuUQPAj15vDbGKvn6+fXZlLTw1Z85fQhiv7K2fAAnD2TzLa8xw+NA7es39936iKwqp2e/0bt5+tqQTImoCgympxlL7my7OeTRWUsChPd3fvFSk4+n+htKDmfXPvw3n6e7U6VAMJhb8Z0k13WsA0NiBa/5nK3h0qrcLD+dH6U4DHPWriR5uYVPNB38R1oNPWJtuFxslbtY84Lic4JQymViyP0ACqT1Ns9612I9zJSFUp6sMC+r/HXvjaP6SwM11mHQrrwydC2VwxYVVR9iFrnJSao5mdBhRK0x/2lQRBBKJz9NNdY7MQl1dMEv57LRxKrrELBskAjcDBkcEPp2RDwYkaH5euT9K7NSNJS4PhpkEL/hgqqx7RyLF/uo2j3Lt9fcuhemaa18xN7k4h5IUWh1dzojyglQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a043302-8a7d-4304-6530-08d8457de6c4
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 02:57:11.9740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: REfhCgkDg9RqYLH6jKf2CfQ6dyvKR+zkzYjUEC0/v6fvRR6WeHsy5GpvU+R4FkYsVjcy1U0g5IPrjXnkDj80bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5577
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
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
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

