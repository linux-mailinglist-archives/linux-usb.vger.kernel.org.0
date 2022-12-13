Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC6864B144
	for <lists+linux-usb@lfdr.de>; Tue, 13 Dec 2022 09:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234615AbiLMIhy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Dec 2022 03:37:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234634AbiLMIhx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Dec 2022 03:37:53 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 167B717E1C
        for <linux-usb@vger.kernel.org>; Tue, 13 Dec 2022 00:37:52 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8B87AFC;
        Tue, 13 Dec 2022 09:37:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670920667;
        bh=jpnwX33Z2/GJYFO1jLKqXwMlj2AtRmb+t8wezlKHXos=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RtXoTwC2+ZeRjbE/c8GnotA6BYC1SsAR1Xxsoj71hhKLn4xkA8/8y1cmMXYklupA6
         ZQyU7+jI8JLhVT0ZlU2DHBqV6KVnn/L4VFiDICLhbNBkMCBBxaop9R0yUuHI2kOb/F
         W4xXkPby2irNSU8HvqXgqK8aItBowxjHSNW9J8n8=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 2/6] usb: gadget: uvc: Add struct for color matching in configs
Date:   Tue, 13 Dec 2022 08:37:32 +0000
Message-Id: <20221213083736.2284536-3-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213083736.2284536-1-dan.scally@ideasonboard.com>
References: <20221213083736.2284536-1-dan.scally@ideasonboard.com>
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
new struct uvcg_cmd (for "color matching descriptor"). Use the same
default values for its attributes as the currently hard-coded ones so
that the interface to userspace is consistent.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/usb/gadget/function/uvc_configfs.c | 55 ++++++++++++++++------
 drivers/usb/gadget/function/uvc_configfs.h |  8 ++++
 2 files changed, 49 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 26d092790f12..9918e7b6a023 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -1788,20 +1788,19 @@ static ssize_t uvcg_color_matching_##cname##_show(			\
 	struct config_item *item, char *page)				\
 {									\
 	struct config_group *group = to_config_group(item);		\
+	struct uvcg_cmd *cmd = to_uvcg_cmd(group);			\
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
+	result = sprintf(page, "%u\n", le##bits##_to_cpu(cmd->desc.aname));\
 	mutex_unlock(&opts->lock);					\
 									\
 	mutex_unlock(su_mutex);						\
@@ -1823,29 +1822,57 @@ static struct configfs_attribute *uvcg_color_matching_attrs[] = {
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
+	struct uvcg_cmd *cmd;
+
+	cmd = to_uvcg_cmd(to_config_group(item));
+	kfree(cmd);
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
+	struct uvcg_cmd *cmd;
+
+	cmd = kzalloc(sizeof(*cmd), GFP_KERNEL);
+	if (!cmd)
+		return -ENOMEM;
+
+	cmd->desc.bLength = UVC_DT_COLOR_MATCHING_SIZE;
+	cmd->desc.bDescriptorType = USB_DT_CS_INTERFACE;
+	cmd->desc.bDescriptorSubType = UVC_VS_COLORFORMAT;
+	cmd->desc.bColorPrimaries = 1;
+	cmd->desc.bTransferCharacteristics = 1;
+	cmd->desc.bMatrixCoefficients = 4;
+
+	config_group_init_type_name(&cmd->group, "default",
+				    &uvcg_color_matching_type);
+	configfs_add_default_group(&cmd->group, parent);
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
index ad2ec8c4c78c..f990739838d5 100644
--- a/drivers/usb/gadget/function/uvc_configfs.h
+++ b/drivers/usb/gadget/function/uvc_configfs.h
@@ -37,6 +37,14 @@ static inline struct uvcg_control_header *to_uvcg_control_header(struct config_i
 	return container_of(item, struct uvcg_control_header, item);
 }
 
+struct uvcg_cmd {
+	struct config_group group;
+	struct uvc_color_matching_descriptor desc;
+};
+
+#define to_uvcg_cmd(group_ptr) \
+container_of(group_ptr, struct uvcg_cmd, group)
+
 enum uvcg_format_type {
 	UVCG_UNCOMPRESSED = 0,
 	UVCG_MJPEG,
-- 
2.34.1

