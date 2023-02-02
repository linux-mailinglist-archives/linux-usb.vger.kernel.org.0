Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD366687C7C
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 12:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbjBBLmW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 06:42:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbjBBLmU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 06:42:20 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A23468C1F3
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 03:42:14 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D4F01490;
        Thu,  2 Feb 2023 12:42:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675338122;
        bh=NFlApynxCprYuPmB3/DwD6LE6MUXOaQJj8ORKxPkJUU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FovBEJoMwgmvo62bYE9ZQZbf64Y+mpZl7ScCR6rHAf//1ZaQ9m/Oiclwn7PDDt4d4
         Pw90Sfp0myLCFGf6WthkyZasRIG98ZpFZ1JTuThDk1WL9zRe9xqGUxj/mfvNIfIJ/K
         nSuKv3d1iBoyksw+nw/MtehDmjYPXi5KIUXH69lc=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [RESEND v3 6/6] usb: gadget: uvc: Allow creating new color matching descriptors
Date:   Thu,  2 Feb 2023 11:41:42 +0000
Message-Id: <20230202114142.300858-7-dan.scally@ideasonboard.com>
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

Allow users to create new color matching descriptors in addition to
the default one. These must be associated with a UVC format in order
to be transmitted to the host, which is achieved by symlinking from
the format to the newly created color matching descriptor - extend
the uncompressed and mjpeg formats to support that linking operation.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v3:

	- None

Changes in v2:

	- New section of the ABI documentation
	- uvcg_format_allow_link() now checks to see if an existing link is 
	already there
	- .allow_link() and .drop_link() track color_matching->refcnt

 .../ABI/testing/configfs-usb-gadget-uvc       | 17 ++++
 drivers/usb/gadget/function/uvc_configfs.c    | 99 ++++++++++++++++++-
 2 files changed, 114 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
index ef3b8b852cd2..fec205044c87 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
@@ -179,6 +179,23 @@ Description:	Default color matching descriptors
 					  white
 		========================  ======================================
 
+What:		/config/usb-gadget/gadget/functions/uvc.name/streaming/color_matching/name
+Date:		Dec 2022
+KernelVersion:	6.3
+Description:	Additional color matching descriptors
+
+		All attributes read/write:
+
+		========================  ======================================
+		bMatrixCoefficients	  matrix used to compute luma and
+					  chroma values from the color primaries
+		bTransferCharacteristics  optoelectronic transfer
+					  characteristic of the source picture,
+					  also called the gamma function
+		bColorPrimaries		  color primaries and the reference
+					  white
+		========================  ======================================
+
 What:		/config/usb-gadget/gadget/functions/uvc.name/streaming/mjpeg
 Date:		Dec 2014
 KernelVersion:	4.0
diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index a210b1990080..e2ffddb969fd 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -824,6 +824,77 @@ uvcg_format_get_default_color_match(struct config_item *streaming)
 	return color_match;
 }
 
+static int uvcg_format_allow_link(struct config_item *src, struct config_item *tgt)
+{
+	struct mutex *su_mutex = &src->ci_group->cg_subsys->su_mutex;
+	struct uvcg_color_matching *color_matching_desc;
+	struct config_item *streaming, *color_matching;
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
+	fmt = to_uvcg_format(src);
+
+	/*
+	 * There's always a color matching descriptor associated with the format
+	 * but without a symlink it should only ever be the default one. If it's
+	 * not the default, there's already a symlink and we should bail out.
+	 */
+	color_matching_desc = uvcg_format_get_default_color_match(streaming);
+	if (fmt->color_matching != color_matching_desc) {
+		ret = -EBUSY;
+		goto out_put_cm;
+	}
+
+	color_matching_desc->refcnt--;
+
+	color_matching_desc = to_uvcg_color_matching(to_config_group(tgt));
+	fmt->color_matching = color_matching_desc;
+	color_matching_desc->refcnt++;
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
+	struct mutex *su_mutex = &src->ci_group->cg_subsys->su_mutex;
+	struct uvcg_color_matching *color_matching_desc;
+	struct config_item *streaming;
+	struct uvcg_format *fmt;
+
+	mutex_lock(su_mutex);
+
+	color_matching_desc = to_uvcg_color_matching(to_config_group(tgt));
+	color_matching_desc->refcnt--;
+
+	streaming = src->ci_parent->ci_parent;
+	color_matching_desc = uvcg_format_get_default_color_match(streaming);
+
+	fmt = to_uvcg_format(src);
+	fmt->color_matching = color_matching_desc;
+	color_matching_desc->refcnt++;
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
@@ -1624,7 +1695,7 @@ static struct configfs_attribute *uvcg_uncompressed_attrs[] = {
 };
 
 static const struct config_item_type uvcg_uncompressed_type = {
-	.ct_item_ops	= &uvcg_config_item_ops,
+	.ct_item_ops	= &uvcg_format_item_operations,
 	.ct_group_ops	= &uvcg_uncompressed_group_ops,
 	.ct_attrs	= uvcg_uncompressed_attrs,
 	.ct_owner	= THIS_MODULE,
@@ -1820,7 +1891,7 @@ static struct configfs_attribute *uvcg_mjpeg_attrs[] = {
 };
 
 static const struct config_item_type uvcg_mjpeg_type = {
-	.ct_item_ops	= &uvcg_config_item_ops,
+	.ct_item_ops	= &uvcg_format_item_operations,
 	.ct_group_ops	= &uvcg_mjpeg_group_ops,
 	.ct_attrs	= uvcg_mjpeg_attrs,
 	.ct_owner	= THIS_MODULE,
@@ -1978,6 +2049,29 @@ static const struct config_item_type uvcg_color_matching_type = {
  * streaming/color_matching
  */
 
+static struct config_group *uvcg_color_matching_make(struct config_group *group,
+						     const char *name)
+{
+	struct uvcg_color_matching *color_match;
+
+	color_match = kzalloc(sizeof(*color_match), GFP_KERNEL);
+	if (!color_match)
+		return ERR_PTR(-ENOMEM);
+
+	color_match->desc.bLength = UVC_DT_COLOR_MATCHING_SIZE;
+	color_match->desc.bDescriptorType = USB_DT_CS_INTERFACE;
+	color_match->desc.bDescriptorSubType = UVC_VS_COLORFORMAT;
+
+	config_group_init_type_name(&color_match->group, name,
+				    &uvcg_color_matching_type);
+
+	return &color_match->group;
+}
+
+static struct configfs_group_operations uvcg_color_matching_grp_group_ops = {
+	.make_group	= uvcg_color_matching_make,
+};
+
 static int uvcg_color_matching_create_children(struct config_group *parent)
 {
 	struct uvcg_color_matching *color_match;
@@ -2003,6 +2097,7 @@ static int uvcg_color_matching_create_children(struct config_group *parent)
 static const struct uvcg_config_group_type uvcg_color_matching_grp_type = {
 	.type = {
 		.ct_item_ops	= &uvcg_config_item_ops,
+		.ct_group_ops	= &uvcg_color_matching_grp_group_ops,
 		.ct_owner	= THIS_MODULE,
 	},
 	.name = "color_matching",
-- 
2.34.1

