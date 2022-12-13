Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20C5D64B148
	for <lists+linux-usb@lfdr.de>; Tue, 13 Dec 2022 09:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234634AbiLMIiC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Dec 2022 03:38:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234745AbiLMIh6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Dec 2022 03:37:58 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E4F192A8
        for <linux-usb@vger.kernel.org>; Tue, 13 Dec 2022 00:37:57 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3784B1305;
        Tue, 13 Dec 2022 09:37:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670920669;
        bh=9UjnWD/hFI04LFKEww1j1w33S+KM6VnzHKAS4D/Jccw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hMh8Js+8DqV0F8zHYkbkwn7PfFAuAcsoNF1WuXT22mORUUacfnuEV5lodcQ7b9owQ
         aKf4/786NLo+eI59SKXrplZIub/8Ov1670Q32ZEa9SuwsuZtYsvpmSq3OMrI0AJmjL
         +PyKvzugTn+OA6+T1YS4wZyyPepmyfR0BqFg0CLE=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 6/6] usb: gadget: uvc: Allow creating new color matching descriptors
Date:   Tue, 13 Dec 2022 08:37:36 +0000
Message-Id: <20221213083736.2284536-7-dan.scally@ideasonboard.com>
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

Allow users to create new color matching descriptors in addition to
the default one. These must be associated with a UVC format in order
to be transmitted to the host, which is achieved by symlinking from
the format to the newly created color matching descriptor - extend
the uncompressed and mjpeg formats to support that linking operation.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../ABI/testing/configfs-usb-gadget-uvc       |  4 +-
 drivers/usb/gadget/function/uvc_configfs.c    | 79 ++++++++++++++++++-
 2 files changed, 79 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
index 3512f4899fe3..ce629f0880a9 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
@@ -160,10 +160,10 @@ Date:		Dec 2014
 KernelVersion:	4.0
 Description:	Color matching descriptors
 
-What:		/config/usb-gadget/gadget/functions/uvc.name/streaming/color_matching/default
+What:		/config/usb-gadget/gadget/functions/uvc.name/streaming/color_matching/name
 Date:		Dec 2014
 KernelVersion:	4.0
-Description:	Default color matching descriptors
+Description:	color matching descriptors
 
 		All attributes read/write:
 
diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 4fbc42d738a4..82c10f0dab71 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -769,6 +769,58 @@ static struct uvcg_cmd *uvcg_format_get_default_cmd(struct config_item *streamin
 	return cmd;
 }
 
+static int uvcg_format_allow_link(struct config_item *src, struct config_item *tgt)
+{
+	struct mutex *su_mutex = &src->ci_group->cg_subsys->su_mutex;
+	struct config_item *streaming, *color_matching;
+	struct uvcg_cmd *color_matching_desc;
+	struct uvcg_format *fmt;
+	int ret = 0;
+
+	mutex_lock(su_mutex);
+
+	streaming = src->ci_parent->ci_parent;
+	color_matching = config_group_find_item(to_config_group(streaming), "color_matching");
+	if (!color_matching || color_matching != tgt->ci_parent) {
+		ret = -EINVAL;
+		goto out_put_cm;
+	}
+
+	color_matching_desc = to_uvcg_cmd(to_config_group(tgt));
+	fmt = to_uvcg_format(src);
+	fmt->color_matching = color_matching_desc;
+
+out_put_cm:
+	config_item_put(color_matching);
+	mutex_unlock(su_mutex);
+
+	return ret;
+}
+
+static void uvcg_format_drop_link(struct config_item *src, struct config_item *tgt)
+{
+	struct config_item *streaming;
+	struct mutex *su_mutex = &src->ci_group->cg_subsys->su_mutex;
+	struct uvcg_format *fmt;
+	struct uvcg_cmd *cmd;
+
+	mutex_lock(su_mutex);
+
+	streaming = src->ci_parent->ci_parent;
+	cmd = uvcg_format_get_default_cmd(streaming);
+
+	fmt = to_uvcg_format(src);
+	fmt->color_matching = cmd;
+
+	mutex_unlock(su_mutex);
+}
+
+static struct configfs_item_operations uvcg_format_item_operations = {
+	.release	= uvcg_config_item_release,
+	.allow_link	= uvcg_format_allow_link,
+	.drop_link	= uvcg_format_drop_link,
+};
+
 static ssize_t uvcg_format_bma_controls_show(struct uvcg_format *f, char *page)
 {
 	struct f_uvc_opts *opts;
@@ -1569,7 +1621,7 @@ static struct configfs_attribute *uvcg_uncompressed_attrs[] = {
 };
 
 static const struct config_item_type uvcg_uncompressed_type = {
-	.ct_item_ops	= &uvcg_config_item_ops,
+	.ct_item_ops	= &uvcg_format_item_operations,
 	.ct_group_ops	= &uvcg_uncompressed_group_ops,
 	.ct_attrs	= uvcg_uncompressed_attrs,
 	.ct_owner	= THIS_MODULE,
@@ -1764,7 +1816,7 @@ static struct configfs_attribute *uvcg_mjpeg_attrs[] = {
 };
 
 static const struct config_item_type uvcg_mjpeg_type = {
-	.ct_item_ops	= &uvcg_config_item_ops,
+	.ct_item_ops	= &uvcg_format_item_operations,
 	.ct_group_ops	= &uvcg_mjpeg_group_ops,
 	.ct_attrs	= uvcg_mjpeg_attrs,
 	.ct_owner	= THIS_MODULE,
@@ -1912,6 +1964,28 @@ static const struct config_item_type uvcg_color_matching_type = {
  * streaming/color_matching
  */
 
+static struct config_group *uvcg_color_matching_make(struct config_group *group,
+						     const char *name)
+{
+	struct uvcg_cmd *cmd;
+
+	cmd = kzalloc(sizeof(*cmd), GFP_KERNEL);
+	if (!cmd)
+		return ERR_PTR(-ENOMEM);
+
+	cmd->desc.bLength = UVC_DT_COLOR_MATCHING_SIZE;
+	cmd->desc.bDescriptorType = USB_DT_CS_INTERFACE;
+	cmd->desc.bDescriptorSubType = UVC_VS_COLORFORMAT;
+
+	config_group_init_type_name(&cmd->group, name, &uvcg_color_matching_type);
+
+	return &cmd->group;
+}
+
+static struct configfs_group_operations uvcg_color_matching_grp_group_ops = {
+	.make_group	= uvcg_color_matching_make,
+};
+
 static int uvcg_color_matching_create_children(struct config_group *parent)
 {
 	struct uvcg_cmd *cmd;
@@ -1937,6 +2011,7 @@ static int uvcg_color_matching_create_children(struct config_group *parent)
 static const struct uvcg_config_group_type uvcg_color_matching_grp_type = {
 	.type = {
 		.ct_item_ops	= &uvcg_config_item_ops,
+		.ct_group_ops	= &uvcg_color_matching_grp_group_ops,
 		.ct_owner	= THIS_MODULE,
 	},
 	.name = "color_matching",
-- 
2.34.1

