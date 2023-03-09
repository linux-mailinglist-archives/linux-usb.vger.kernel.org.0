Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3A4F6B222C
	for <lists+linux-usb@lfdr.de>; Thu,  9 Mar 2023 12:04:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbjCILEF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Mar 2023 06:04:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbjCILDC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Mar 2023 06:03:02 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D382AE9CD2;
        Thu,  9 Mar 2023 02:59:00 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33771589;
        Thu,  9 Mar 2023 11:58:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1678359518;
        bh=UKiK+zI10UGj+RIxeIufRYqUu7FHa/CmqAkga8YAWaM=;
        h=From:To:Subject:Date:From;
        b=lC8/u+45YyNh3yRUInIT5iqh0EOU69UzbWLS9oZmynMj7zQPAAOkGCA5faztLtPN7
         SXko5zToCzEtCyR/A9V9mM3477Y13peAMqz571zHGV5/A/gthMxG0Fpp+BzvRrtuY7
         66NI21xQKR+IouorDsQ1nGqaCnpDNSgNXwBQeY5k=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        linux-usb@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v2] usb: gadget: uvc: Make bmControls attr read/write
Date:   Thu,  9 Mar 2023 10:58:25 +0000
Message-Id: <20230309105825.216745-1-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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

For the Processing Unit and Camera Terminal descriptors defined in
the UVC Gadget we currently hard-code values into their bmControls
fields, which enumerates which controls the gadget is able to
support. This isn't appropriate since only the userspace companion
program to the kernel driver will know which controls are supported.
Make the configfs attributes that point to those fields read/write
so userspace can set them to appropriate values.

Document the new behaviour at the same time so the functionality is
clear.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---

This patch is based on usb-next, plus my recent patch "docs: usb: Add
documentation for the UVC Gadget".

Changes in v2:

        - Added explanatory documentation

 .../ABI/testing/configfs-usb-gadget-uvc       |   4 +-
 Documentation/usb/gadget_uvc.rst              |  28 ++++
 drivers/usb/gadget/function/uvc_configfs.c    | 121 +++++++++++++++++-
 3 files changed, 149 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
index 80b98a4a4d0f..4feb692c4c1d 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
@@ -76,7 +76,7 @@ Date:		Dec 2014
 KernelVersion:	4.0
 Description:	Default camera terminal descriptors
 
-		All attributes read only:
+		All attributes read only except bmControls, which is read/write:
 
 		========================  ====================================
 		bmControls		  bitmap specifying which controls are
@@ -101,7 +101,7 @@ Date:		Dec 2014
 KernelVersion:	4.0
 Description:	Default processing unit descriptors
 
-		All attributes read only:
+		All attributes read only except bmControls, which is read/write:
 
 		===============	========================================
 		iProcessing	index of string descriptor
diff --git a/Documentation/usb/gadget_uvc.rst b/Documentation/usb/gadget_uvc.rst
index 6d22faceb1a0..62bd81ba3dd1 100644
--- a/Documentation/usb/gadget_uvc.rst
+++ b/Documentation/usb/gadget_uvc.rst
@@ -275,6 +275,34 @@ out with 0x00, for example:
 
 bNrInPins and baSourceID function in the same way.
 
+Configuring Supported Controls for Camera Terminal and Processing Unit
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The Camera Terminal and Processing Units in the UVC chain also have bmControls
+attributes which function similarly to the same field in an Extension Unit.
+Unlike XUs however, the meaning of the bitflag for these units is defined in
+the UVC specification; you should consult the "Camera Terminal Descriptor" and
+"Processing Unit Descriptor" sections for an enumeration of the flags.
+
+.. code-block:: bash
+
+        # Set the Processing Unit's bmControls, flagging Brightness, Contrast
+        # and Hue as available controls:
+        echo 0x05 > $FUNCTION/control/processing/default/bmControls
+
+        # Set the Camera Terminal's bmControls, flagging Focus Absolute and
+        # Focus Relative as available controls:
+        echo 0x60 > $FUNCTION/control/terminal/camera/default/bmControls
+
+If you do not set these fields then by default the Auto-Exposure Mode control
+for the Camera Terminal and the Brightness control for the Processing Unit will
+be flagged as available; if they are not supported you should set the field to
+0x00.
+
+Note that the size of the bmControls field for a Camera Terminal or Processing
+Unit is fixed by the UVC specification, and so the bControlSize attribute is
+read-only here.
+
 Custom Strings Support
 ~~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 62b759bb7613..9bf0e985acfa 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -334,6 +334,64 @@ UVCG_DEFAULT_PROCESSING_ATTR(i_processing, iProcessing, 8);
 
 #undef UVCG_DEFAULT_PROCESSING_ATTR
 
+static ssize_t uvcg_default_processing_bm_controls_store(
+	struct config_item *item, const char *page, size_t len)
+{
+	struct config_group *group = to_config_group(item);
+	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
+	struct uvc_processing_unit_descriptor *pd;
+	struct config_item *opts_item;
+	struct f_uvc_opts *opts;
+	u8 *bm_controls, *tmp;
+	unsigned int i;
+	int ret, n = 0;
+
+	mutex_lock(su_mutex);
+
+	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+	pd = &opts->uvc_processing;
+
+	mutex_lock(&opts->lock);
+	if (opts->refcnt) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	ret = __uvcg_iter_item_entries(page, len, __uvcg_count_item_entries, &n,
+				       sizeof(u8));
+	if (ret)
+		goto unlock;
+
+	if (n > pd->bControlSize) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	tmp = bm_controls = kcalloc(n, sizeof(u8), GFP_KERNEL);
+	if (!bm_controls) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
+
+	ret = __uvcg_iter_item_entries(page, len, __uvcg_fill_item_entries, &tmp,
+				       sizeof(u8));
+	if (ret)
+		goto free_mem;
+
+	for (i = 0; i < n; i++)
+		pd->bmControls[i] = bm_controls[i];
+
+	ret = len;
+
+free_mem:
+	kfree(bm_controls);
+unlock:
+	mutex_unlock(&opts->lock);
+	mutex_unlock(su_mutex);
+	return ret;
+}
+
 static ssize_t uvcg_default_processing_bm_controls_show(
 	struct config_item *item, char *page)
 {
@@ -363,7 +421,7 @@ static ssize_t uvcg_default_processing_bm_controls_show(
 	return result;
 }
 
-UVC_ATTR_RO(uvcg_default_processing_, bm_controls, bmControls);
+UVC_ATTR(uvcg_default_processing_, bm_controls, bmControls);
 
 static struct configfs_attribute *uvcg_default_processing_attrs[] = {
 	&uvcg_default_processing_attr_b_unit_id,
@@ -445,6 +503,65 @@ UVCG_DEFAULT_CAMERA_ATTR(w_ocular_focal_length, wOcularFocalLength,
 
 #undef UVCG_DEFAULT_CAMERA_ATTR
 
+static ssize_t uvcg_default_camera_bm_controls_store(
+	struct config_item *item, const char *page, size_t len)
+{
+	struct config_group *group = to_config_group(item);
+	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
+	struct uvc_camera_terminal_descriptor *cd;
+	struct config_item *opts_item;
+	struct f_uvc_opts *opts;
+	u8 *bm_controls, *tmp;
+	unsigned int i;
+	int ret, n = 0;
+
+	mutex_lock(su_mutex);
+
+	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent->
+			ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+	cd = &opts->uvc_camera_terminal;
+
+	mutex_lock(&opts->lock);
+	if (opts->refcnt) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	ret = __uvcg_iter_item_entries(page, len, __uvcg_count_item_entries, &n,
+				       sizeof(u8));
+	if (ret)
+		goto unlock;
+
+	if (n > cd->bControlSize) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	tmp = bm_controls = kcalloc(n, sizeof(u8), GFP_KERNEL);
+	if (!bm_controls) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
+
+	ret = __uvcg_iter_item_entries(page, len, __uvcg_fill_item_entries, &tmp,
+				       sizeof(u8));
+	if (ret)
+		goto free_mem;
+
+	for (i = 0; i < n; i++)
+		cd->bmControls[i] = bm_controls[i];
+
+	ret = len;
+
+free_mem:
+	kfree(bm_controls);
+unlock:
+	mutex_unlock(&opts->lock);
+	mutex_unlock(su_mutex);
+	return ret;
+}
+
 static ssize_t uvcg_default_camera_bm_controls_show(
 	struct config_item *item, char *page)
 {
@@ -474,7 +591,7 @@ static ssize_t uvcg_default_camera_bm_controls_show(
 	return result;
 }
 
-UVC_ATTR_RO(uvcg_default_camera_, bm_controls, bmControls);
+UVC_ATTR(uvcg_default_camera_, bm_controls, bmControls);
 
 static struct configfs_attribute *uvcg_default_camera_attrs[] = {
 	&uvcg_default_camera_attr_b_terminal_id,
-- 
2.34.1

