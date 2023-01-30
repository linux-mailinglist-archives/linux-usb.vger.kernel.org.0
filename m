Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1CD6809B1
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 10:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235583AbjA3JiM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 04:38:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236281AbjA3Jh4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 04:37:56 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C7604210
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 01:37:28 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F42C1802;
        Mon, 30 Jan 2023 10:35:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675071305;
        bh=ZUWScFNRy+KPZS8awvny5eJ8KLrXuaGBXfH9458tiCM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=S3iAyjAiAMT2BdrIADkDTT3C4BEAfBF77/lnheaX+CDQUKIFCoMXYNE/X7SV2sljw
         rwerRBWqwuqbx0wZ/o4or8z+m6m4cgud0YlKCQ4JEF3zgyfkVRJpaVp79zoKK8ccu1
         pBEKF1gqB5I8Enx5A7TaQQVNIFAINkWg+FQ/tQFo=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com
Cc:     mgr@pengutronix.de, balbi@kernel.org,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        stern@rowland.harvard.edu,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v3 06/11] usb: gadget: configfs: Support arbitrary string descriptors
Date:   Mon, 30 Jan 2023 09:34:38 +0000
Message-Id: <20230130093443.25644-7-dan.scally@ideasonboard.com>
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

Add a framework to allow users to define arbitrary string descriptors
for a USB Gadget. This is modelled as a new type of config item rather
than as hardcoded attributes so as to be as flexible as possible.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v3:

	- Moved this functionality from the UVC function to usb gadget core.

Changes in v2:

	- New patch

 drivers/usb/gadget/configfs.c | 172 +++++++++++++++++++++++++++++++++-
 include/linux/usb/gadget.h    |  11 +++
 2 files changed, 181 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index e0f93c42cde6..7c8b8ab5dfa3 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -88,6 +88,8 @@ struct gadget_language {
 
 	struct config_group group;
 	struct list_head list;
+	struct list_head gadget_strings;
+	unsigned int nstrings;
 };
 
 struct gadget_config_name {
@@ -778,8 +780,174 @@ static void gadget_language_attr_release(struct config_item *item)
 	kfree(gs);
 }
 
-USB_CONFIG_STRING_RW_OPS(gadget_language);
-USB_CONFIG_STRINGS_LANG(gadget_language, gadget_info);
+static struct configfs_item_operations gadget_language_langid_item_ops = {
+	.release                = gadget_language_attr_release,
+};
+
+static ssize_t gadget_string_id_show(struct config_item *item, char *page)
+{
+	struct gadget_string *string = to_gadget_string(item);
+	int ret;
+
+	ret = sprintf(page, "%u\n", string->usb_string.id);
+	return ret;
+}
+CONFIGFS_ATTR_RO(gadget_string_, id);
+
+static ssize_t gadget_string_s_show(struct config_item *item, char *page)
+{
+	struct gadget_string *string = to_gadget_string(item);
+	int ret;
+
+	ret = snprintf(page, sizeof(string->string), "%s\n", string->string);
+	return ret;
+}
+
+static ssize_t gadget_string_s_store(struct config_item *item, const char *page,
+				     size_t len)
+{
+	struct gadget_string *string = to_gadget_string(item);
+	int size = min(sizeof(string->string), len + 1);
+	int ret;
+
+	if (len > USB_MAX_STRING_LEN)
+		return -EINVAL;
+
+	ret = strscpy(string->string, page, size);
+	return len;
+}
+CONFIGFS_ATTR(gadget_string_, s);
+
+static struct configfs_attribute *gadget_string_attrs[] = {
+	&gadget_string_attr_id,
+	&gadget_string_attr_s,
+	NULL,
+};
+
+static void gadget_string_release(struct config_item *item)
+{
+	struct gadget_string *string = to_gadget_string(item);
+
+	kfree(string);
+}
+
+static struct configfs_item_operations gadget_string_item_ops = {
+	.release	= gadget_string_release,
+};
+
+static const struct config_item_type gadget_string_type = {
+	.ct_item_ops	= &gadget_string_item_ops,
+	.ct_attrs	= gadget_string_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_item *gadget_language_string_make(struct config_group *group,
+						       const char *name)
+{
+	struct gadget_language *language;
+	struct gadget_string *string;
+
+	language = to_gadget_language(&group->cg_item);
+
+	string = kzalloc(sizeof(*string), GFP_KERNEL);
+	if (!string)
+		return ERR_PTR(-ENOMEM);
+
+	string->usb_string.id = language->nstrings++;
+	string->usb_string.s = string->string;
+	list_add_tail(&string->list, &language->gadget_strings);
+
+	config_item_init_type_name(&string->item, name, &gadget_string_type);
+
+	return &string->item;
+}
+
+static void gadget_language_string_drop(struct config_group *group,
+					struct config_item *item)
+{
+	struct gadget_language *language;
+	struct gadget_string *string;
+	unsigned int i = USB_GADGET_FIRST_AVAIL_IDX;
+
+	language = to_gadget_language(&group->cg_item);
+	string = to_gadget_string(item);
+
+	list_del(&string->list);
+	language->nstrings--;
+
+	/* Reset the ids for the language's strings to guarantee a continuous set */
+	list_for_each_entry(string, &language->gadget_strings, list)
+		string->usb_string.id = i++;
+}
+
+static struct configfs_group_operations gadget_language_langid_group_ops = {
+	.make_item		= gadget_language_string_make,
+	.drop_item		= gadget_language_string_drop,
+};
+
+static struct config_item_type gadget_language_type = {
+	.ct_item_ops	= &gadget_language_langid_item_ops,
+	.ct_group_ops	= &gadget_language_langid_group_ops,
+	.ct_attrs	= gadget_language_langid_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *gadget_language_make(struct config_group *group,
+						 const char *name)
+{
+	struct gadget_info *gi;
+	struct gadget_language *gs;
+	struct gadget_language *new;
+	int langs = 0;
+	int ret;
+
+	new = kzalloc(sizeof(*new), GFP_KERNEL);
+	if (!new)
+		return ERR_PTR(-ENOMEM);
+
+	ret = check_user_usb_string(name, &new->stringtab_dev);
+	if (ret)
+		goto err;
+	config_group_init_type_name(&new->group, name,
+				    &gadget_language_type);
+
+	gi = container_of(group, struct gadget_info, strings_group);
+	ret = -EEXIST;
+	list_for_each_entry(gs, &gi->string_list, list) {
+		if (gs->stringtab_dev.language == new->stringtab_dev.language)
+			goto err;
+		langs++;
+	}
+	ret = -EOVERFLOW;
+	if (langs >= MAX_USB_STRING_LANGS)
+		goto err;
+
+	list_add_tail(&new->list, &gi->string_list);
+	INIT_LIST_HEAD(&new->gadget_strings);
+
+	/* We have the default manufacturer, product and serialnumber strings */
+	new->nstrings = 3;
+	return &new->group;
+err:
+	kfree(new);
+	return ERR_PTR(ret);
+}
+
+static void gadget_language_drop(struct config_group *group,
+				 struct config_item *item)
+{
+	config_item_put(item);
+}
+
+static struct configfs_group_operations gadget_language_group_ops = {
+	.make_group     = &gadget_language_make,
+	.drop_item      = &gadget_language_drop,
+};
+
+static struct config_item_type gadget_language_strings_type = {
+	.ct_group_ops   = &gadget_language_group_ops,
+	.ct_owner       = THIS_MODULE,
+};
 
 static inline struct gadget_info *os_desc_item_to_gadget_info(
 		struct config_item *item)
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index dc3092cea99e..00750f7020f3 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -15,6 +15,7 @@
 #ifndef __LINUX_USB_GADGET_H
 #define __LINUX_USB_GADGET_H
 
+#include <linux/configfs.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/init.h>
@@ -821,6 +822,16 @@ int usb_gadget_get_string(const struct usb_gadget_strings *table, int id, u8 *bu
 /* check if the given language identifier is valid */
 bool usb_validate_langid(u16 langid);
 
+struct gadget_string {
+	struct config_item item;
+	struct list_head list;
+	char string[USB_MAX_STRING_LEN];
+	struct usb_string usb_string;
+};
+
+#define to_gadget_string(str_item)\
+container_of(str_item, struct gadget_string, item)
+
 /*-------------------------------------------------------------------------*/
 
 /* utility to simplify managing config descriptors */
-- 
2.34.1

