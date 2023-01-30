Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 164756809AD
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 10:37:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233090AbjA3Jhu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 04:37:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234878AbjA3Jhd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 04:37:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6B12B0AA
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 01:36:59 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1075121A;
        Mon, 30 Jan 2023 10:35:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675071305;
        bh=pegICoaCTjb8bnQP3K5BwXaEfXH2uU9fBd1WMAqGmJU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z+Ff4/L9oMD5t0guiFG9EGTs9t2z9pz+ZN+B0cHJZDzFC3E0bJfBT32irtKzKWE4o
         ulFzCVLDIed+nQujdO64MYFpTE2I4j9iusifnorAVp7vpsTIdkVrSGnve4bOUuqpFu
         TLJbapzK+460QLfS7TejW3vRXcntUp6o5M2lbr/s=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com
Cc:     mgr@pengutronix.de, balbi@kernel.org,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        stern@rowland.harvard.edu,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v3 05/11] usb: gadget: configfs: Rename struct gadget_strings
Date:   Mon, 30 Jan 2023 09:34:37 +0000
Message-Id: <20230130093443.25644-6-dan.scally@ideasonboard.com>
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

The struct gadget_strings really represents a single language in
configfs. Rename it to make that more clear.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v3:

	- New patch

 drivers/usb/gadget/configfs.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 0853536cbf2e..e0f93c42cde6 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -79,7 +79,7 @@ static inline struct gadget_info *cfg_to_gadget_info(struct config_usb_cfg *cfg)
 	return container_of(cfg->c.cdev, struct gadget_info, cdev);
 }
 
-struct gadget_strings {
+struct gadget_language {
 	struct usb_gadget_strings stringtab_dev;
 	struct usb_string strings[USB_GADGET_FIRST_AVAIL_IDX];
 	char *manufacturer;
@@ -365,9 +365,9 @@ static struct configfs_attribute *gadget_root_attrs[] = {
 	NULL,
 };
 
-static inline struct gadget_strings *to_gadget_strings(struct config_item *item)
+static inline struct gadget_language *to_gadget_language(struct config_item *item)
 {
-	return container_of(to_config_group(item), struct gadget_strings,
+	return container_of(to_config_group(item), struct gadget_language,
 			 group);
 }
 
@@ -755,20 +755,20 @@ static const struct config_item_type config_desc_type = {
 	.ct_owner       = THIS_MODULE,
 };
 
-GS_STRINGS_RW(gadget_strings, manufacturer);
-GS_STRINGS_RW(gadget_strings, product);
-GS_STRINGS_RW(gadget_strings, serialnumber);
+GS_STRINGS_RW(gadget_language, manufacturer);
+GS_STRINGS_RW(gadget_language, product);
+GS_STRINGS_RW(gadget_language, serialnumber);
 
-static struct configfs_attribute *gadget_strings_langid_attrs[] = {
-	&gadget_strings_attr_manufacturer,
-	&gadget_strings_attr_product,
-	&gadget_strings_attr_serialnumber,
+static struct configfs_attribute *gadget_language_langid_attrs[] = {
+	&gadget_language_attr_manufacturer,
+	&gadget_language_attr_product,
+	&gadget_language_attr_serialnumber,
 	NULL,
 };
 
-static void gadget_strings_attr_release(struct config_item *item)
+static void gadget_language_attr_release(struct config_item *item)
 {
-	struct gadget_strings *gs = to_gadget_strings(item);
+	struct gadget_language *gs = to_gadget_language(item);
 
 	kfree(gs->manufacturer);
 	kfree(gs->product);
@@ -778,8 +778,8 @@ static void gadget_strings_attr_release(struct config_item *item)
 	kfree(gs);
 }
 
-USB_CONFIG_STRING_RW_OPS(gadget_strings);
-USB_CONFIG_STRINGS_LANG(gadget_strings, gadget_info);
+USB_CONFIG_STRING_RW_OPS(gadget_language);
+USB_CONFIG_STRINGS_LANG(gadget_language, gadget_info);
 
 static inline struct gadget_info *os_desc_item_to_gadget_info(
 		struct config_item *item)
@@ -1316,7 +1316,7 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
 
 	/* init all strings */
 	if (!list_empty(&gi->string_list)) {
-		struct gadget_strings *gs;
+		struct gadget_language *gs;
 
 		i = 0;
 		list_for_each_entry(gs, &gi->string_list, list) {
@@ -1598,7 +1598,7 @@ static struct config_group *gadgets_make(
 	configfs_add_default_group(&gi->configs_group, &gi->group);
 
 	config_group_init_type_name(&gi->strings_group, "strings",
-			&gadget_strings_strings_type);
+			&gadget_language_strings_type);
 	configfs_add_default_group(&gi->strings_group, &gi->group);
 
 	config_group_init_type_name(&gi->os_desc_group, "os_desc",
-- 
2.34.1

