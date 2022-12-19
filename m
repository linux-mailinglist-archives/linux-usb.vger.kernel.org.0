Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEF0C650DAC
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 15:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232417AbiLSOoE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 09:44:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232385AbiLSOno (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 09:43:44 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E391063C7
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 06:43:38 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2308E12F3;
        Mon, 19 Dec 2022 15:43:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671461014;
        bh=C5os0NFKPycqYxIaJRMufHXq0jKTeyhPexEOiujxQgI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eHMWMXoh5RjohP/OREU5M4S7Qv9k5X3Wz6IMRBJT48tPSGg+nIjt5LGMZ2XNHz2dq
         hmWh7S4GB+ovKM4zpP9v08m+L9nLNtdyraf1rhL9ODT8QhkqcCNSdu6NnE+UEcufaw
         4pZINGPPciw4qaaFTiAozfcCHJidLnfJa264ylBY=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v2 3/7] usb: gadget: uvc: Add struct for color matching in configs
Date:   Mon, 19 Dec 2022 14:43:12 +0000
Message-Id: <20221219144316.757680-4-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219144316.757680-1-dan.scally@ideasonboard.com>
References: <20221219144316.757680-1-dan.scally@ideasonboard.com>
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

Color matching descriptors are meant to be a per-format piece of data
and we need to be able to support different descriptors for different
formats. As a preliminary step towards that goal, switch the default
color matching configfs functionality to point to an instance of a
new struct uvcg_color_matching. Use the same default values for its
attributes as the currently hard-coded ones so that the interface to
userspace is consistent.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v2:

	- Renamed uvcg_cmd to uvcg_color_matching plus the associated
	  variables (Kieran, Laurent)
	- Added a refcnt member to struct uvcg_color_matching

 drivers/usb/gadget/function/uvc_configfs.c | 58 ++++++++++++++++------
 drivers/usb/gadget/function/uvc_configfs.h |  9 ++++
 2 files changed, 53 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index e28becd435bf..147d3def24dd 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -13,6 +13,7 @@
 #include "uvc_configfs.h"
 
 #include <linux/sort.h>
+#include <uapi/linux/usb/video.h>
 
 /* -----------------------------------------------------------------------------
  * Global Utility Structures and Macros
@@ -1788,20 +1789,21 @@ static ssize_t uvcg_color_matching_##cname##_show(			\
 	struct config_item *item, char *page)				\
 {									\
 	struct config_group *group = to_config_group(item);		\
+	struct uvcg_color_matching *color_match =			\
+		to_uvcg_color_matching(group);				\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
 	struct mutex *su_mutex = &group->cg_subsys->su_mutex;		\
-	struct uvc_color_matching_descriptor *cd;			\
 	int result;							\
 									\
 	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
 									\
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;	\
 	opts = to_f_uvc_opts(opts_item);				\
-	cd = &opts->uvc_color_matching;					\
 									\
 	mutex_lock(&opts->lock);					\
-	result = sprintf(page, "%u\n", le##bits##_to_cpu(cd->aname));	\
+	result = sprintf(page, "%u\n",					\
+			 le##bits##_to_cpu(color_match->desc.aname));	\
 	mutex_unlock(&opts->lock);					\
 									\
 	mutex_unlock(su_mutex);						\
@@ -1823,29 +1825,57 @@ static struct configfs_attribute *uvcg_color_matching_attrs[] = {
 	NULL,
 };
 
-static const struct uvcg_config_group_type uvcg_color_matching_type = {
-	.type = {
-		.ct_item_ops	= &uvcg_config_item_ops,
-		.ct_attrs	= uvcg_color_matching_attrs,
-		.ct_owner	= THIS_MODULE,
-	},
-	.name = "default",
+static void uvcg_color_matching_release(struct config_item *item)
+{
+	struct uvcg_color_matching *color_match =
+		to_uvcg_color_matching(to_config_group(item));
+
+	kfree(color_match);
+}
+
+static struct configfs_item_operations uvcg_color_matching_item_ops = {
+	.release	= uvcg_color_matching_release,
+};
+
+static const struct config_item_type uvcg_color_matching_type = {
+	.ct_item_ops	= &uvcg_color_matching_item_ops,
+	.ct_attrs	= uvcg_color_matching_attrs,
+	.ct_owner	= THIS_MODULE,
 };
 
 /* -----------------------------------------------------------------------------
  * streaming/color_matching
  */
 
+static int uvcg_color_matching_create_children(struct config_group *parent)
+{
+	struct uvcg_color_matching *color_match;
+
+	color_match = kzalloc(sizeof(*color_match), GFP_KERNEL);
+	if (!color_match)
+		return -ENOMEM;
+
+	color_match->desc.bLength = UVC_DT_COLOR_MATCHING_SIZE;
+	color_match->desc.bDescriptorType = USB_DT_CS_INTERFACE;
+	color_match->desc.bDescriptorSubType = UVC_VS_COLORFORMAT;
+	color_match->desc.bColorPrimaries = UVC_COLOR_PRIMARIES_BT_709_SRGB;
+	color_match->desc.bTransferCharacteristics = UVC_TRANSFER_CHARACTERISTICS_BT_709;
+	color_match->desc.bMatrixCoefficients = UVC_MATRIX_COEFFICIENTS_SMPTE_170M;
+
+	config_group_init_type_name(&color_match->group, "default",
+				    &uvcg_color_matching_type);
+	configfs_add_default_group(&color_match->group, parent);
+
+	return 0;
+}
+
 static const struct uvcg_config_group_type uvcg_color_matching_grp_type = {
 	.type = {
 		.ct_item_ops	= &uvcg_config_item_ops,
 		.ct_owner	= THIS_MODULE,
 	},
 	.name = "color_matching",
-	.children = (const struct uvcg_config_group_type*[]) {
-		&uvcg_color_matching_type,
-		NULL,
-	},
+	.create_children = uvcg_color_matching_create_children,
 };
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/usb/gadget/function/uvc_configfs.h b/drivers/usb/gadget/function/uvc_configfs.h
index ad2ec8c4c78c..c7392c9b840e 100644
--- a/drivers/usb/gadget/function/uvc_configfs.h
+++ b/drivers/usb/gadget/function/uvc_configfs.h
@@ -37,6 +37,15 @@ static inline struct uvcg_control_header *to_uvcg_control_header(struct config_i
 	return container_of(item, struct uvcg_control_header, item);
 }
 
+struct uvcg_color_matching {
+	struct config_group group;
+	struct uvc_color_matching_descriptor desc;
+	unsigned int refcnt;
+};
+
+#define to_uvcg_color_matching(group_ptr) \
+container_of(group_ptr, struct uvcg_color_matching, group)
+
 enum uvcg_format_type {
 	UVCG_UNCOMPRESSED = 0,
 	UVCG_MJPEG,
-- 
2.34.1

