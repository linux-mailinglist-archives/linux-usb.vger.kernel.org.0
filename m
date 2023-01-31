Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE106829C2
	for <lists+linux-usb@lfdr.de>; Tue, 31 Jan 2023 10:58:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232060AbjAaJ6C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Jan 2023 04:58:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231778AbjAaJ56 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Jan 2023 04:57:58 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 224A1213B
        for <linux-usb@vger.kernel.org>; Tue, 31 Jan 2023 01:57:54 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B38FED6;
        Tue, 31 Jan 2023 10:57:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675159072;
        bh=XAx5kiiJeX1IXIfBKVv4CSBWQctyzscAtz2ToSWyxRw=;
        h=From:To:Cc:Subject:Date:From;
        b=a7iBGoTjGnZHHVoaArXmvGUWO9OwWSTZWh78Skcd03WSNEQoV4iOzAKecF/wiHED5
         florA2DB8vPgZ3cT6e3An0KXxG8ylbHUZmk3e1WdvI7YwOjPwxpz54KIWnKgBvC78N
         9PxK8WRizpmn/1ivd6Oe+lIPuaalatHbGhxSlIq0=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        gregkh@linuxfoundation.org
Cc:     kieran.bingham@ideasonboard.com, mgr@pengutronix.de,
        torleiv@huddly.com, Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH] usb: gadget: uvc: Make bmControls attr read/write
Date:   Tue, 31 Jan 2023 09:57:38 +0000
Message-Id: <20230131095738.429197-1-dan.scally@ideasonboard.com>
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
fields, which enumerates the controls the gadget is able to
support. This isn't appropriate since only the userspace companion
program to the kernel driver will know which controls are supported.
Make the configfs attributes that point to those fields read/write
so userspace can set them to appropriate values.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---

This patch depends on "usb: gadget: uvc: Generalise helper functions for reuse"
from my recent series:

https://lore.kernel.org/linux-usb/20230130093443.25644-3-dan.scally@ideasonboard.com/T/#u

 .../ABI/testing/configfs-usb-gadget-uvc       |   4 +-
 drivers/usb/gadget/function/uvc_configfs.c    | 121 +++++++++++++++++-
 2 files changed, 121 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
index 31636695f2d0..ddd532f30323 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
@@ -74,7 +74,7 @@ Date:		Dec 2014
 KernelVersion:	4.0
 Description:	Default camera terminal descriptors
 
-		All attributes read only:
+		All attributes read only except bmControls:
 
 		========================  ====================================
 		bmControls		  bitmap specifying which controls are
@@ -99,7 +99,7 @@ Date:		Dec 2014
 KernelVersion:	4.0
 Description:	Default processing unit descriptors
 
-		All attributes read only:
+		All attributes read only except bmControls:
 
 		===============	========================================
 		iProcessing	index of string descriptor
diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index ffa338643cc8..5e6848420728 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -333,6 +333,64 @@ UVCG_DEFAULT_PROCESSING_ATTR(i_processing, iProcessing, 8);
 
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
@@ -362,7 +420,7 @@ static ssize_t uvcg_default_processing_bm_controls_show(
 	return result;
 }
 
-UVC_ATTR_RO(uvcg_default_processing_, bm_controls, bmControls);
+UVC_ATTR(uvcg_default_processing_, bm_controls, bmControls);
 
 static struct configfs_attribute *uvcg_default_processing_attrs[] = {
 	&uvcg_default_processing_attr_b_unit_id,
@@ -444,6 +502,65 @@ UVCG_DEFAULT_CAMERA_ATTR(w_ocular_focal_length, wOcularFocalLength,
 
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
@@ -473,7 +590,7 @@ static ssize_t uvcg_default_camera_bm_controls_show(
 	return result;
 }
 
-UVC_ATTR_RO(uvcg_default_camera_, bm_controls, bmControls);
+UVC_ATTR(uvcg_default_camera_, bm_controls, bmControls);
 
 static struct configfs_attribute *uvcg_default_camera_attrs[] = {
 	&uvcg_default_camera_attr_b_terminal_id,
-- 
2.34.1

