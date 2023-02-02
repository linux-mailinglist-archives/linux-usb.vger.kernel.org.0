Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E469687C78
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 12:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232108AbjBBLmJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 06:42:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232090AbjBBLmH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 06:42:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B028C1C9
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 03:42:04 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C40CEDF7;
        Thu,  2 Feb 2023 12:41:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675338120;
        bh=5/uSFl82Tyl8+gMZd4/no6f9B+gN64uZhlP57VxDB7U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CU0RiA2Dy0HJSEhPvYvtIFUuDtzR0Bgou2cbm0XTzDa/Esp8y66fIqM/yuxlhc5jO
         K0Jut9OH82XMe7Nlyq5Q73PyBPt0j0q6/KZPsKBRPvDjUadwEGRu6i0x4/TRWFPIoY
         +alxbv9O1Lyt9H7RSGvpSa/hmLf1PoW7QeG6jbeI=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [RESEND v3 2/6] usb: gadget: uvc: Add struct for color matching in configs
Date:   Thu,  2 Feb 2023 11:41:38 +0000
Message-Id: <20230202114142.300858-3-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202114142.300858-1-dan.scally@ideasonboard.com>
References: <20230202114142.300858-1-dan.scally@ideasonboard.com>
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v3:

	- Removed uapi/ from the include
	- Moved refcnt variable to the next patch

Changes in v2:

	- Renamed uvcg_cmd to uvcg_color_matching (Kieran, Laurent)

 drivers/usb/gadget/function/uvc_configfs.c | 58 ++++++++++++++++------
 drivers/usb/gadget/function/uvc_configfs.h |  8 +++
 2 files changed, 52 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 9ff4b1921ee2..dd14c02dd7ae 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -13,6 +13,7 @@
 #include "uvc_configfs.h"
 
 #include <linux/sort.h>
+#include <linux/usb/video.h>
 
 /* -----------------------------------------------------------------------------
  * Global Utility Structures and Macros
@@ -1841,20 +1842,21 @@ static ssize_t uvcg_color_matching_##cname##_show(			\
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
@@ -1876,29 +1878,57 @@ static struct configfs_attribute *uvcg_color_matching_attrs[] = {
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
index ad2ec8c4c78c..18b9931c85b1 100644
--- a/drivers/usb/gadget/function/uvc_configfs.h
+++ b/drivers/usb/gadget/function/uvc_configfs.h
@@ -37,6 +37,14 @@ static inline struct uvcg_control_header *to_uvcg_control_header(struct config_i
 	return container_of(item, struct uvcg_control_header, item);
 }
 
+struct uvcg_color_matching {
+	struct config_group group;
+	struct uvc_color_matching_descriptor desc;
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

