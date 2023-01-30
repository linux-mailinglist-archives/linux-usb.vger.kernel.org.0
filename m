Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E057B6809B4
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 10:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234878AbjA3Ji2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 04:38:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235037AbjA3JiY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 04:38:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBE9793F0
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 01:37:53 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07225185A;
        Mon, 30 Jan 2023 10:35:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675071306;
        bh=OibA0AHJbaJNuFVSV7nGcAehjfs+FN4OjiDL0H8f0r4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iKpBc5imhbEuHPQ+JHMLEuOEHcW0eB3TI6+52Ziu2dr9j3V4uxtwsDlDlrznEcDTN
         e3IQqyvd7ifUZNZdyMFFUhs1d3H/qLkPEl/AR/4heDzkXXOVwzl57KTz94j69763Dg
         aeKYeX+Sa7f0+yUAnecYEOAUK68lixlPezfp0qgA=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com
Cc:     mgr@pengutronix.de, balbi@kernel.org,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        stern@rowland.harvard.edu,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v3 07/11] usb: gadget: configfs: Attach arbitrary strings to cdev
Date:   Mon, 30 Jan 2023 09:34:39 +0000
Message-Id: <20230130093443.25644-8-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130093443.25644-1-dan.scally@ideasonboard.com>
References: <20230130093443.25644-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Attach any arbitrary strings that are defined to the composite dev.
We handle the old-style manufacturer, product and serialnumbers
strings in the same function for simplicity.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v3:

	- Was 7/9 in version 2, moved the same functionality from the UVC
	function to usb gadget core.

Changes in v2:

	- New patch

 drivers/usb/gadget/configfs.c | 95 ++++++++++++++++++++++++++++-------
 include/linux/usb/composite.h |  1 +
 2 files changed, 79 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 7c8b8ab5dfa3..c2f23a63ab10 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1441,6 +1441,80 @@ static void purge_configs_funcs(struct gadget_info *gi)
 	}
 }
 
+static struct usb_string *
+configfs_attach_gadget_strings(struct gadget_info *gi)
+{
+	struct usb_gadget_strings **gadget_strings;
+	struct gadget_language *language;
+	struct gadget_string *string;
+	unsigned int nlangs = 0;
+	struct list_head *iter;
+	struct usb_string *us;
+	unsigned int i = 0;
+	int nstrings = -1;
+	unsigned int j;
+
+	list_for_each(iter, &gi->string_list)
+		nlangs++;
+
+	/* Bail out early if no languages are configured */
+	if (!nlangs)
+		return NULL;
+
+	gadget_strings = kcalloc(nlangs + 1, /* including NULL terminator */
+				 sizeof(struct usb_gadget_strings *), GFP_KERNEL);
+	if (!gadget_strings)
+		return ERR_PTR(-ENOMEM);
+
+	list_for_each_entry(language, &gi->string_list, list) {
+		struct usb_string *stringtab;
+
+		if (nstrings == -1) {
+			nstrings = language->nstrings;
+		} else if (nstrings != language->nstrings) {
+			pr_err("languages must contain the same number of strings\n");
+			us = ERR_PTR(-EINVAL);
+			goto cleanup;
+		}
+
+		stringtab = kcalloc(language->nstrings + 1, sizeof(struct usb_string),
+				    GFP_KERNEL);
+		if (!stringtab) {
+			us = ERR_PTR(-ENOMEM);
+			goto cleanup;
+		}
+
+		stringtab[USB_GADGET_MANUFACTURER_IDX].id = USB_GADGET_MANUFACTURER_IDX;
+		stringtab[USB_GADGET_MANUFACTURER_IDX].s = language->manufacturer;
+		stringtab[USB_GADGET_PRODUCT_IDX].id = USB_GADGET_PRODUCT_IDX;
+		stringtab[USB_GADGET_PRODUCT_IDX].s = language->product;
+		stringtab[USB_GADGET_SERIAL_IDX].id = USB_GADGET_SERIAL_IDX;
+		stringtab[USB_GADGET_SERIAL_IDX].s = language->serialnumber;
+
+		j = USB_GADGET_FIRST_AVAIL_IDX;
+		list_for_each_entry(string, &language->gadget_strings, list) {
+			memcpy(&stringtab[j], &string->usb_string, sizeof(struct usb_string));
+			j++;
+		}
+
+		language->stringtab_dev.strings = stringtab;
+		gadget_strings[i] = &language->stringtab_dev;
+		i++;
+	}
+
+	us = usb_gstrings_attach(&gi->cdev, gadget_strings, nstrings);
+
+cleanup:
+	list_for_each_entry(language, &gi->string_list, list) {
+		kfree(language->stringtab_dev.strings);
+		language->stringtab_dev.strings = NULL;
+	}
+
+	kfree(gadget_strings);
+
+	return us;
+}
+
 static int configfs_composite_bind(struct usb_gadget *gadget,
 		struct usb_gadget_driver *gdriver)
 {
@@ -1484,23 +1558,8 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
 
 	/* init all strings */
 	if (!list_empty(&gi->string_list)) {
-		struct gadget_language *gs;
-
-		i = 0;
-		list_for_each_entry(gs, &gi->string_list, list) {
-
-			gi->gstrings[i] = &gs->stringtab_dev;
-			gs->stringtab_dev.strings = gs->strings;
-			gs->strings[USB_GADGET_MANUFACTURER_IDX].s =
-				gs->manufacturer;
-			gs->strings[USB_GADGET_PRODUCT_IDX].s = gs->product;
-			gs->strings[USB_GADGET_SERIAL_IDX].s = gs->serialnumber;
-			i++;
-		}
-		gi->gstrings[i] = NULL;
-		s = usb_gstrings_attach(&gi->cdev, gi->gstrings,
-				USB_GADGET_FIRST_AVAIL_IDX);
-		if (IS_ERR(s)) {
+		s = configfs_attach_gadget_strings(gi);
+		if (IS_ERR_OR_NULL(s)) {
 			ret = PTR_ERR(s);
 			goto err_comp_cleanup;
 		}
@@ -1508,6 +1567,8 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
 		gi->cdev.desc.iManufacturer = s[USB_GADGET_MANUFACTURER_IDX].id;
 		gi->cdev.desc.iProduct = s[USB_GADGET_PRODUCT_IDX].id;
 		gi->cdev.desc.iSerialNumber = s[USB_GADGET_SERIAL_IDX].id;
+
+		gi->cdev.usb_strings = s;
 	}
 
 	if (gi->use_os_desc) {
diff --git a/include/linux/usb/composite.h b/include/linux/usb/composite.h
index 43ac3fa760db..85c7f6036933 100644
--- a/include/linux/usb/composite.h
+++ b/include/linux/usb/composite.h
@@ -483,6 +483,7 @@ struct usb_composite_dev {
 	struct usb_composite_driver	*driver;
 	u8				next_string_id;
 	char				*def_manufacturer;
+	struct usb_string		*usb_strings;
 
 	/* the gadget driver won't enable the data pullup
 	 * while the deactivation count is nonzero.
-- 
2.34.1

