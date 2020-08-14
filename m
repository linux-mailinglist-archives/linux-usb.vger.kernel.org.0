Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2704244487
	for <lists+linux-usb@lfdr.de>; Fri, 14 Aug 2020 07:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbgHNF2R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Aug 2020 01:28:17 -0400
Received: from mail-eopbgr70054.outbound.protection.outlook.com ([40.107.7.54]:62158
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726064AbgHNF2Q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Aug 2020 01:28:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqH9bGU0JvgjqC1qW03zSAsFxS0HpyZX19z/7z6MusFe9p41Bz0WJPfb7HQX8aXp1Os49wM9kNzeCb0zkLy4Z9L9h2towE+1AiuY4Gp1wfQQdjPHankhFEdXPTjtk07+HKCoi3bzohiPigmp7obgWb5MHuVd4baL4tus4emM9oyEzgrYZxfu+6oDNqd1tVDUYK7HN5VCzIviMf79FuhXWEbaBNuIob6K80q6dtkcF+qiyoT4AoGM2ppjvQX7Hyp50Sq1l0mMJNWFWuYsbTBidJOExzEiyKSguyWiw8mK/hr8qumJsXckKRNx/EOFTpD8KNb4TbDuPl+Kbh3ys3dJlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udCwFKaSoJn39tXqaQwXlevdhAGuipW7PXzcqT4FL+0=;
 b=BHyaNTNKKJadgtru+cQpSwlmOWIrMDSabGfGa2u6nFXgpFeTVE6S9HAkuWT1o6yABcbOM2vYRywfFdz54HCOUBCD1BQRXep+2EuJM/b4V2WDJzcR62/XCuPPOnrSwCJM2pyjQuVqtCkyFSbakef0+LOg1r6p+QnW6IY9itbYpJlC7jMb+l4BahDSuYN/ZAgYD+V71AtQ4jEfJQvzZbF1cZ0zJLIK0rakn83zj+sz/uwm5HnHKs6yi10/7BTrfwZ8sR/AkLWKKWNKHvljMptKxQrh2zt/pdr2iAfdbPPcrpJcfZl94uZdoW4eF1+2oqp7PfjBXW6LuRqoKyRzl3bCrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udCwFKaSoJn39tXqaQwXlevdhAGuipW7PXzcqT4FL+0=;
 b=SMm3bTnchLqIUvvYelRn8mUTkNCgXpEgDlWN1FjSvI/GEdQCKIG81XWQViOnJ9xAJOG6B0Yhp6fFcdxsz3w4DeGjocXfbKTzFenZdHCE1ct4pZE32mDQj8CISoLxU2M/X7eq7rPYyLdHSof/d7IgbgoeZW2kBMzZocTRFEo/MHE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB3PR0402MB3641.eurprd04.prod.outlook.com (2603:10a6:8:b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Fri, 14 Aug
 2020 05:28:10 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2%9]) with mapi id 15.20.3261.025; Fri, 14 Aug 2020
 05:28:10 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Anton Vasilyev <vasilyev@ispras.ru>,
        Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: [RESEND PATCH v3 1/6] USB: UDC: Expand device model API interface
Date:   Fri, 14 Aug 2020 13:26:57 +0800
Message-Id: <20200814052702.22789-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200814052702.22789-1-peter.chen@nxp.com>
References: <20200814052702.22789-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0153.apcprd06.prod.outlook.com
 (2603:1096:1:1f::31) To DB8PR04MB7162.eurprd04.prod.outlook.com
 (2603:10a6:10:12c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0153.apcprd06.prod.outlook.com (2603:1096:1:1f::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Fri, 14 Aug 2020 05:28:07 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c8015ab1-3c56-4ed2-fff5-08d84012d54c
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3641:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB3641842D7A71E649D5DD2BD98B400@DB3PR0402MB3641.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: adE9/E+o9JbaWK51KUB5SBA5xj5KAH4ZMfXm4xHQn7LWsJuezKpEQrmOlf8YcSXn6wnFjpBXSIYq1cPRICXN5ygNGSl8l4ig5J7RyAWHHe/acwBYKNMVHKNyg/hCu/hHgpv0zf5AeefRddfDkfpRqig5W+64lDOtrXTyGlYqN9nGrz1gVNAnHOYhyix3nvB/8hFb3L8EQluD0nCSdKQbv8dPvKzBFoLrj2HNOycqY2JplD9IisGBJjFp6zYSaUOM5FPw9Iuyzw2nP6viGgpzAfkRSTPzV0Shg7bfKDsNTRJ9e3OGqXRCpl9K1+UNIGpXM+IXVc1EmI0z3rTxNb1LSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(6486002)(36756003)(54906003)(86362001)(6506007)(6916009)(8936002)(2616005)(2906002)(4326008)(316002)(6512007)(8676002)(956004)(6666004)(83380400001)(16526019)(186003)(66476007)(44832011)(5660300002)(66946007)(52116002)(66556008)(478600001)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: NnANqILaHaB2GlpSpgol/wuumQkwmxbjFzynjC6lF5I5KA+Zrc/oxCxTgg4ALgrIxhYP30fGxEtgrNIhsnIY4WRzOOLoq94vyKUQ2rHouvaQ2HXGxjVP+KZZ0aBjnCfLaEvBD+Yw7yJ9pWIwPBw4rZCpSoEaPpsT0fVnjnbzLQwgScb3gUDWjGE9eSdvF1FMhcvsU43KRvP8X45785vVUklmmFCeu18IsJ/J01UGqAQjj3znLxAcWhy3+CrMm1NnCc5QVe9UcFOZjxm+TsnXg2En7RvzWQI4OPYuOOUERjJmA69QGklROTibG6SeFsr7Jnn8S4PMi1Kj/irkiv8b4U4cx2BT9Y5Nr10OuBAUTYmWcB59YtXotTeLrqzXs4kv9X93X6yhRtfitkI+WV7dfvUPCWoKEvUU8BSttYblqZ58Pm3QTGNTb7BMY3FlQ1A3nw1QOeVo29/kpR973jWJM+T7kpS0h0VWHyY/JbMkTDBqLPcmZ6iFKobZLe4nMfLKlIz2Bvs+LLGkAxNhxs+91eYukKMOmNT1a+FPWXBvJlIjeThcWJ3xODr/O7b5nf2jbwb/eR7EbUfouVUXfBiHwSCyvtO33RzoAIHIHdiZx3fWLHq2bvTSYN8QzII0GCZOjuCD9z0yZkqt44/kAP/PNg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8015ab1-3c56-4ed2-fff5-08d84012d54c
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2020 05:28:10.7039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31xQvq/DDYmNcer39UY6S4e1UP5D4yz91ofvviW5LSzjYuYGmnY2chejOtYGTDTxn0O7HQQW+ahEfo7IEZe0VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3641
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

