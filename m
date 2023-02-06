Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10D0468C305
	for <lists+linux-usb@lfdr.de>; Mon,  6 Feb 2023 17:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbjBFQU1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Feb 2023 11:20:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231383AbjBFQUW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Feb 2023 11:20:22 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A15AF26851
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 08:20:04 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4891E61;
        Mon,  6 Feb 2023 17:18:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675700308;
        bh=6ZWP/tsRp3r3+AMZMTSIl2MoKASbGQgR/aLRov+z18w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Xj5ZGFYZ9egQcUXCEqhNVf2p+seebl4gqHvHBHjzPwy3AtGDp1Vbk4H1QKUVLto6z
         xEUwCQN61GAzRoRDYRCMSmE7ExFSF6HyN1XKXwkFMheNqJ028XuYZjgaTslpNmktyO
         XRZKr6nZL6gq/gkdgprCM+Hr22HNE8vyxeWh/zWg=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com
Cc:     mgr@pengutronix.de, balbi@kernel.org,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        stern@rowland.harvard.edu,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v5 07/11] usb: gadget: configfs: Attach arbitrary strings to cdev
Date:   Mon,  6 Feb 2023 16:17:58 +0000
Message-Id: <20230206161802.892954-8-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230206161802.892954-1-dan.scally@ideasonboard.com>
References: <20230206161802.892954-1-dan.scally@ideasonboard.com>
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
Changes in v5:

	- None

Changes in v4:

	- Replaced IS_ERR_OR_NULL() with IS_ERR() (Dan)

Changes in v3:

	- Was 7/9 in version 2, moved the same functionality from the UVC
	function to usb gadget core.

Changes in v2:

	- New patch

 drivers/usb/gadget/configfs.c | 93 +++++++++++++++++++++++++++++------
 include/linux/usb/composite.h |  1 +
 2 files changed, 78 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index ac275855eeb6..06a0b73e0546 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1597,6 +1597,80 @@ static void purge_configs_funcs(struct gadget_info *gi)
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
@@ -1640,22 +1714,7 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
 
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
+		s = configfs_attach_gadget_strings(gi);
 		if (IS_ERR(s)) {
 			ret = PTR_ERR(s);
 			goto err_comp_cleanup;
@@ -1664,6 +1723,8 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
 		gi->cdev.desc.iManufacturer = s[USB_GADGET_MANUFACTURER_IDX].id;
 		gi->cdev.desc.iProduct = s[USB_GADGET_PRODUCT_IDX].id;
 		gi->cdev.desc.iSerialNumber = s[USB_GADGET_SERIAL_IDX].id;
+
+		gi->cdev.usb_strings = s;
 	}
 
 	if (gi->use_webusb) {
diff --git a/include/linux/usb/composite.h b/include/linux/usb/composite.h
index 7ef8cea67f50..608dc962748b 100644
--- a/include/linux/usb/composite.h
+++ b/include/linux/usb/composite.h
@@ -494,6 +494,7 @@ struct usb_composite_dev {
 	struct usb_composite_driver	*driver;
 	u8				next_string_id;
 	char				*def_manufacturer;
+	struct usb_string		*usb_strings;
 
 	/* the gadget driver won't enable the data pullup
 	 * while the deactivation count is nonzero.
-- 
2.34.1

