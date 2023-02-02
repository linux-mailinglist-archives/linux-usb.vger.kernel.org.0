Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DACC687F53
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 14:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbjBBNzf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 08:55:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbjBBNzd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 08:55:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6ADF7167E
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 05:55:29 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 054ADE2E;
        Thu,  2 Feb 2023 14:55:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675346122;
        bh=IbG5XVc05+APkK4syXS5/5TtnA9VTYYoQTQ7QybXQk8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k7epqLUfO1ug6AHbT73vNjQs3+a1QX94fT/WCwt2KrcBv+G4AqEZOrKeytdWqpOga
         HIJf+/pxzJhP/12vjfOmFCvaV7h3JWJduomZnJ9sw4UJmqbYLD5EqcZWjiKfyOJAZS
         fOTPbbGWvXA8m+dcsfejjpZgFIxV3AIberiJCKeU=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com
Cc:     mgr@pengutronix.de, balbi@kernel.org,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        stern@rowland.harvard.edu,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v4 03/11] usb: gadget: uvc: Allow definition of XUs in configfs
Date:   Thu,  2 Feb 2023 13:55:00 +0000
Message-Id: <20230202135508.447109-4-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202135508.447109-1-dan.scally@ideasonboard.com>
References: <20230202135508.447109-1-dan.scally@ideasonboard.com>
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

The UVC gadget at present has no support for extension units. Add the
infrastructure to uvc_configfs.c that allows users to create XUs via
configfs. These will be stored in a new child of uvcg_control_grp_type
with the name "extensions".

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v4:

	- None

Changes in v3 (Laurent):

	- Spelling
	- Passed __GFP_ZERO to krealloc_array() instead of memsetting the new
	entries to zero afterwards.
	- Switched to using the bLength calculation macro instead of open coding
	the same thing
	- Fixed a return without mutex_unlock()

Changes in v2:

	- Updated the ABI documentation with the new elements.
	- Locked the su_mutex when appropriate.

 .../ABI/testing/configfs-usb-gadget-uvc       |  28 +
 drivers/usb/gadget/function/f_uvc.c           |   9 +
 drivers/usb/gadget/function/u_uvc.h           |   7 +
 drivers/usb/gadget/function/uvc_configfs.c    | 480 ++++++++++++++++++
 drivers/usb/gadget/function/uvc_configfs.h    |  29 ++
 5 files changed, 553 insertions(+)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
index 80111c0618cd..07ca2af296c7 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
@@ -113,6 +113,34 @@ Description:	Default processing unit descriptors
 		bUnitID		a non-zero id of this unit
 		===============	========================================
 
+What:		/config/usb-gadget/gadget/functions/uvc.name/control/extensions
+Date:		Nov 2022
+KernelVersion:	6.1
+Description:	Extension unit descriptors
+
+What:		/config/usb-gadget/gadget/functions/uvc.name/control/extensions/name
+Date:		Nov 2022
+KernelVersion:	6.1
+Description:	Extension Unit (XU) Descriptor
+
+		bLength, bUnitID and iExtension are read-only. All others are
+		read-write.
+
+		===============		========================================
+		bLength			size of the descriptor in bytes
+		bUnitID			non-zero ID of this unit
+		guidExtensionCode	Vendor-specific code identifying the XU
+		bNumControls		number of controls in this XU
+		bNrInPins		number of input pins for this unit
+		baSourceID		list of the IDs of the units or terminals
+					to which this XU is connected
+		bControlSize		size of the bmControls field in bytes
+		bmControls		list of bitmaps detailing which vendor
+					specific controls are supported
+		iExtension		index of a string descriptor that describes
+					this extension unit
+		===============		========================================
+
 What:		/config/usb-gadget/gadget/functions/uvc.name/control/header
 Date:		Dec 2014
 KernelVersion:	4.0
diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 5250805153c7..4dc323f97942 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -866,6 +866,13 @@ static struct usb_function_instance *uvc_alloc_inst(void)
 	od->bSourceID			= 2;
 	od->iTerminal			= 0;
 
+	/*
+	 * With the ability to add XUs to the UVC function graph, we need to be
+	 * able to allocate unique unit IDs to them. The IDs are 1-based, with
+	 * the CT, PU and OT above consuming the first 3.
+	 */
+	opts->last_unit_id		= 3;
+
 	md = &opts->uvc_color_matching;
 	md->bLength			= UVC_DT_COLOR_MATCHING_SIZE;
 	md->bDescriptorType		= USB_DT_CS_INTERFACE;
@@ -894,6 +901,8 @@ static struct usb_function_instance *uvc_alloc_inst(void)
 	opts->ss_control =
 		(const struct uvc_descriptor_header * const *)ctl_cls;
 
+	INIT_LIST_HEAD(&opts->extension_units);
+
 	opts->streaming_interval = 1;
 	opts->streaming_maxpacket = 1024;
 	snprintf(opts->function_name, sizeof(opts->function_name), "UVC Camera");
diff --git a/drivers/usb/gadget/function/u_uvc.h b/drivers/usb/gadget/function/u_uvc.h
index 9d15bc2c7045..caf71c0ed092 100644
--- a/drivers/usb/gadget/function/u_uvc.h
+++ b/drivers/usb/gadget/function/u_uvc.h
@@ -28,6 +28,7 @@ struct f_uvc_opts {
 	unsigned int					control_interface;
 	unsigned int					streaming_interface;
 	char						function_name[32];
+	unsigned int					last_unit_id;
 
 	bool						enable_interrupt_ep;
 
@@ -66,6 +67,12 @@ struct f_uvc_opts {
 	struct uvc_descriptor_header			*uvc_fs_control_cls[5];
 	struct uvc_descriptor_header			*uvc_ss_control_cls[5];
 
+	/*
+	 * Control descriptors for extension units. There could be any number
+	 * of these, including none at all.
+	 */
+	struct list_head				extension_units;
+
 	/*
 	 * Streaming descriptors for full-speed, high-speed and super-speed.
 	 * Used by configfs only, must not be touched by legacy gadgets. The
diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 652e1985a1fb..84e36d6c7781 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -661,6 +661,485 @@ static const struct uvcg_config_group_type uvcg_terminal_grp_type = {
 	},
 };
 
+/* -----------------------------------------------------------------------------
+ * control/extensions
+ */
+
+#define UVCG_EXTENSION_ATTR(cname, aname, ro...)			\
+static ssize_t uvcg_extension_##cname##_show(struct config_item *item,	\
+					     char *page)		\
+{									\
+	struct config_group *group = to_config_group(item->ci_parent);	\
+	struct mutex *su_mutex = &group->cg_subsys->su_mutex;		\
+	struct uvcg_extension *xu = to_uvcg_extension(item);		\
+	struct config_item *opts_item;					\
+	struct f_uvc_opts *opts;					\
+	int ret;							\
+									\
+	mutex_lock(su_mutex);						\
+									\
+	opts_item = item->ci_parent->ci_parent->ci_parent;		\
+	opts = to_f_uvc_opts(opts_item);				\
+									\
+	mutex_lock(&opts->lock);					\
+	ret = sprintf(page, "%u\n", xu->desc.aname);			\
+	mutex_unlock(&opts->lock);					\
+									\
+	mutex_unlock(su_mutex);						\
+									\
+	return ret;							\
+}									\
+UVC_ATTR##ro(uvcg_extension_, cname, aname)
+
+UVCG_EXTENSION_ATTR(b_length, bLength, _RO);
+UVCG_EXTENSION_ATTR(b_unit_id, bUnitID, _RO);
+UVCG_EXTENSION_ATTR(i_extension, iExtension, _RO);
+
+static ssize_t uvcg_extension_b_num_controls_store(struct config_item *item,
+						   const char *page, size_t len)
+{
+	struct config_group *group = to_config_group(item->ci_parent);
+	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
+	struct uvcg_extension *xu = to_uvcg_extension(item);
+	struct config_item *opts_item;
+	struct f_uvc_opts *opts;
+	int ret;
+	u8 num;
+
+	mutex_lock(su_mutex);
+
+	opts_item = item->ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	ret = kstrtou8(page, 0, &num);
+	if (ret)
+		return ret;
+
+	mutex_lock(&opts->lock);
+	xu->desc.bNumControls = num;
+	mutex_unlock(&opts->lock);
+
+	mutex_unlock(su_mutex);
+
+	return len;
+}
+UVCG_EXTENSION_ATTR(b_num_controls, bNumControls);
+
+/*
+ * In addition to storing bNrInPins, this function needs to realloc the
+ * memory for the baSourceID array and additionally expand bLength.
+ */
+static ssize_t uvcg_extension_b_nr_in_pins_store(struct config_item *item,
+						 const char *page, size_t len)
+{
+	struct config_group *group = to_config_group(item->ci_parent);
+	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
+	struct uvcg_extension *xu = to_uvcg_extension(item);
+	struct config_item *opts_item;
+	struct f_uvc_opts *opts;
+	void *tmp_buf;
+	int ret;
+	u8 num;
+
+	mutex_lock(su_mutex);
+
+	opts_item = item->ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	ret = kstrtou8(page, 0, &num);
+	if (ret)
+		return ret;
+
+	mutex_lock(&opts->lock);
+
+	if (num == xu->desc.bNrInPins) {
+		ret = len;
+		goto unlock;
+	}
+
+	tmp_buf = krealloc_array(xu->desc.baSourceID, num, sizeof(u8),
+				 GFP_KERNEL | __GFP_ZERO);
+	if (!tmp_buf) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
+
+	xu->desc.baSourceID = tmp_buf;
+	xu->desc.bNrInPins = num;
+	xu->desc.bLength = UVC_DT_EXTENSION_UNIT_SIZE(xu->desc.bNrInPins,
+						      xu->desc.bControlSize);
+
+	ret = len;
+
+unlock:
+	mutex_unlock(&opts->lock);
+	mutex_unlock(su_mutex);
+	return ret;
+}
+UVCG_EXTENSION_ATTR(b_nr_in_pins, bNrInPins);
+
+/*
+ * In addition to storing bControlSize, this function needs to realloc the
+ * memory for the bmControls array and additionally expand bLength.
+ */
+static ssize_t uvcg_extension_b_control_size_store(struct config_item *item,
+						   const char *page, size_t len)
+{
+	struct config_group *group = to_config_group(item->ci_parent);
+	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
+	struct uvcg_extension *xu = to_uvcg_extension(item);
+	struct config_item *opts_item;
+	struct f_uvc_opts *opts;
+	void *tmp_buf;
+	int ret;
+	u8 num;
+
+	mutex_lock(su_mutex);
+
+	opts_item = item->ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	ret = kstrtou8(page, 0, &num);
+	if (ret)
+		return ret;
+
+	mutex_lock(&opts->lock);
+
+	if (num == xu->desc.bControlSize) {
+		ret = len;
+		goto unlock;
+	}
+
+	tmp_buf = krealloc_array(xu->desc.bmControls, num, sizeof(u8),
+				 GFP_KERNEL | __GFP_ZERO);
+	if (!tmp_buf) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
+
+	xu->desc.bmControls = tmp_buf;
+	xu->desc.bControlSize = num;
+	xu->desc.bLength = UVC_DT_EXTENSION_UNIT_SIZE(xu->desc.bNrInPins,
+						      xu->desc.bControlSize);
+
+	ret = len;
+
+unlock:
+	mutex_unlock(&opts->lock);
+	mutex_unlock(su_mutex);
+	return ret;
+}
+
+UVCG_EXTENSION_ATTR(b_control_size, bControlSize);
+
+static ssize_t uvcg_extension_guid_extension_code_show(struct config_item *item,
+						       char *page)
+{
+	struct config_group *group = to_config_group(item->ci_parent);
+	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
+	struct uvcg_extension *xu = to_uvcg_extension(item);
+	struct config_item *opts_item;
+	struct f_uvc_opts *opts;
+
+	mutex_lock(su_mutex);
+
+	opts_item = item->ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
+	memcpy(page, xu->desc.guidExtensionCode, sizeof(xu->desc.guidExtensionCode));
+	mutex_unlock(&opts->lock);
+
+	mutex_unlock(su_mutex);
+
+	return sizeof(xu->desc.guidExtensionCode);
+}
+
+static ssize_t uvcg_extension_guid_extension_code_store(struct config_item *item,
+							const char *page, size_t len)
+{
+	struct config_group *group = to_config_group(item->ci_parent);
+	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
+	struct uvcg_extension *xu = to_uvcg_extension(item);
+	struct config_item *opts_item;
+	struct f_uvc_opts *opts;
+	int ret;
+
+	mutex_lock(su_mutex);
+
+	opts_item = item->ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
+	memcpy(xu->desc.guidExtensionCode, page,
+	       min(sizeof(xu->desc.guidExtensionCode), len));
+	mutex_unlock(&opts->lock);
+
+	mutex_unlock(su_mutex);
+
+	ret = sizeof(xu->desc.guidExtensionCode);
+
+	return ret;
+}
+
+UVC_ATTR(uvcg_extension_, guid_extension_code, guidExtensionCode);
+
+static ssize_t uvcg_extension_ba_source_id_show(struct config_item *item,
+						char *page)
+{
+	struct config_group *group = to_config_group(item->ci_parent);
+	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
+	struct uvcg_extension *xu = to_uvcg_extension(item);
+	struct config_item *opts_item;
+	struct f_uvc_opts *opts;
+	char *pg = page;
+	int ret, i;
+
+	mutex_lock(su_mutex);
+
+	opts_item = item->ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
+	for (ret = 0, i = 0; i < xu->desc.bNrInPins; ++i) {
+		ret += sprintf(pg, "%u\n", xu->desc.baSourceID[i]);
+		pg = page + ret;
+	}
+	mutex_unlock(&opts->lock);
+
+	mutex_unlock(su_mutex);
+
+	return ret;
+}
+
+static ssize_t uvcg_extension_ba_source_id_store(struct config_item *item,
+						 const char *page, size_t len)
+{
+	struct config_group *group = to_config_group(item->ci_parent);
+	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
+	struct uvcg_extension *xu = to_uvcg_extension(item);
+	struct config_item *opts_item;
+	struct f_uvc_opts *opts;
+	u8 *source_ids, *iter;
+	int ret, n = 0;
+
+	mutex_lock(su_mutex);
+
+	opts_item = item->ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
+
+	ret = __uvcg_iter_item_entries(page, len, __uvcg_count_item_entries, &n,
+				       sizeof(u8));
+	if (ret)
+		goto unlock;
+
+	iter = source_ids = kcalloc(n, sizeof(u8), GFP_KERNEL);
+	if (!source_ids) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
+
+	ret = __uvcg_iter_item_entries(page, len, __uvcg_fill_item_entries, &iter,
+				       sizeof(u8));
+	if (ret) {
+		kfree(source_ids);
+		goto unlock;
+	}
+
+	kfree(xu->desc.baSourceID);
+	xu->desc.baSourceID = source_ids;
+	xu->desc.bNrInPins = n;
+	xu->desc.bLength = UVC_DT_EXTENSION_UNIT_SIZE(xu->desc.bNrInPins,
+						      xu->desc.bControlSize);
+
+	ret = len;
+
+unlock:
+	mutex_unlock(&opts->lock);
+	mutex_unlock(su_mutex);
+	return ret;
+}
+UVC_ATTR(uvcg_extension_, ba_source_id, baSourceID);
+
+static ssize_t uvcg_extension_bm_controls_show(struct config_item *item,
+					       char *page)
+{
+	struct config_group *group = to_config_group(item->ci_parent);
+	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
+	struct uvcg_extension *xu = to_uvcg_extension(item);
+	struct config_item *opts_item;
+	struct f_uvc_opts *opts;
+	char *pg = page;
+	int ret, i;
+
+	mutex_lock(su_mutex);
+
+	opts_item = item->ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
+	for (ret = 0, i = 0; i < xu->desc.bControlSize; ++i) {
+		ret += sprintf(pg, "0x%02x\n", xu->desc.bmControls[i]);
+		pg = page + ret;
+	}
+	mutex_unlock(&opts->lock);
+
+	mutex_unlock(su_mutex);
+
+	return ret;
+}
+
+static ssize_t uvcg_extension_bm_controls_store(struct config_item *item,
+						const char *page, size_t len)
+{
+	struct config_group *group = to_config_group(item->ci_parent);
+	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
+	struct uvcg_extension *xu = to_uvcg_extension(item);
+	struct config_item *opts_item;
+	struct f_uvc_opts *opts;
+	u8 *bm_controls, *tmp;
+	int ret, n = 0;
+
+	mutex_lock(su_mutex);
+
+	opts_item = item->ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
+
+	ret = __uvcg_iter_item_entries(page, len, __uvcg_count_item_entries, &n,
+				       sizeof(u8));
+	if (ret)
+		goto unlock;
+
+	tmp = bm_controls = kcalloc(n, sizeof(u8), GFP_KERNEL);
+	if (!bm_controls) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
+
+	ret = __uvcg_iter_item_entries(page, len, __uvcg_fill_item_entries, &tmp,
+				       sizeof(u8));
+	if (ret) {
+		kfree(bm_controls);
+		goto unlock;
+	}
+
+	kfree(xu->desc.bmControls);
+	xu->desc.bmControls = bm_controls;
+	xu->desc.bControlSize = n;
+	xu->desc.bLength = UVC_DT_EXTENSION_UNIT_SIZE(xu->desc.bNrInPins,
+						      xu->desc.bControlSize);
+
+	ret = len;
+
+unlock:
+	mutex_unlock(&opts->lock);
+	mutex_unlock(su_mutex);
+	return ret;
+}
+
+UVC_ATTR(uvcg_extension_, bm_controls, bmControls);
+
+static struct configfs_attribute *uvcg_extension_attrs[] = {
+	&uvcg_extension_attr_b_length,
+	&uvcg_extension_attr_b_unit_id,
+	&uvcg_extension_attr_b_num_controls,
+	&uvcg_extension_attr_b_nr_in_pins,
+	&uvcg_extension_attr_b_control_size,
+	&uvcg_extension_attr_guid_extension_code,
+	&uvcg_extension_attr_ba_source_id,
+	&uvcg_extension_attr_bm_controls,
+	&uvcg_extension_attr_i_extension,
+	NULL,
+};
+
+static void uvcg_extension_release(struct config_item *item)
+{
+	struct uvcg_extension *xu = container_of(item, struct uvcg_extension, item);
+
+	kfree(xu);
+}
+
+static struct configfs_item_operations uvcg_extension_item_ops = {
+	.release	= uvcg_extension_release,
+};
+
+static const struct config_item_type uvcg_extension_type = {
+	.ct_item_ops	= &uvcg_extension_item_ops,
+	.ct_attrs	= uvcg_extension_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static void uvcg_extension_drop(struct config_group *group, struct config_item *item)
+{
+	struct uvcg_extension *xu = container_of(item, struct uvcg_extension, item);
+	struct config_item *opts_item;
+	struct f_uvc_opts *opts;
+
+	opts_item = group->cg_item.ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
+
+	config_item_put(item);
+	list_del(&xu->list);
+	kfree(xu->desc.baSourceID);
+	kfree(xu->desc.bmControls);
+
+	mutex_unlock(&opts->lock);
+}
+
+static struct config_item *uvcg_extension_make(struct config_group *group, const char *name)
+{
+	struct config_item *opts_item;
+	struct uvcg_extension *xu;
+	struct f_uvc_opts *opts;
+
+	opts_item = group->cg_item.ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	xu = kzalloc(sizeof(*xu), GFP_KERNEL);
+	if (!xu)
+		return ERR_PTR(-ENOMEM);
+
+	xu->desc.bLength = UVC_DT_EXTENSION_UNIT_SIZE(0, 0);
+	xu->desc.bDescriptorType = USB_DT_CS_INTERFACE;
+	xu->desc.bDescriptorSubType = UVC_VC_EXTENSION_UNIT;
+	xu->desc.bNumControls = 0;
+	xu->desc.bNrInPins = 0;
+	xu->desc.baSourceID = NULL;
+	xu->desc.bControlSize = 0;
+	xu->desc.bmControls = NULL;
+
+	mutex_lock(&opts->lock);
+
+	xu->desc.bUnitID = ++opts->last_unit_id;
+
+	config_item_init_type_name(&xu->item, name, &uvcg_extension_type);
+	list_add_tail(&xu->list, &opts->extension_units);
+
+	mutex_unlock(&opts->lock);
+
+	return &xu->item;
+}
+
+static struct configfs_group_operations uvcg_extensions_grp_ops = {
+	.make_item	= uvcg_extension_make,
+	.drop_item	= uvcg_extension_drop,
+};
+
+static const struct uvcg_config_group_type uvcg_extensions_grp_type = {
+	.type = {
+		.ct_item_ops	= &uvcg_config_item_ops,
+		.ct_group_ops	= &uvcg_extensions_grp_ops,
+		.ct_owner	= THIS_MODULE,
+	},
+	.name = "extensions",
+};
+
 /* -----------------------------------------------------------------------------
  * control/class/{fs|ss}
  */
@@ -908,6 +1387,7 @@ static const struct uvcg_config_group_type uvcg_control_grp_type = {
 		&uvcg_processing_grp_type,
 		&uvcg_terminal_grp_type,
 		&uvcg_control_class_grp_type,
+		&uvcg_extensions_grp_type,
 		NULL,
 	},
 };
diff --git a/drivers/usb/gadget/function/uvc_configfs.h b/drivers/usb/gadget/function/uvc_configfs.h
index ad2ec8c4c78c..c9a4182fb26f 100644
--- a/drivers/usb/gadget/function/uvc_configfs.h
+++ b/drivers/usb/gadget/function/uvc_configfs.h
@@ -132,6 +132,35 @@ static inline struct uvcg_mjpeg *to_uvcg_mjpeg(struct config_item *item)
 	return container_of(to_uvcg_format(item), struct uvcg_mjpeg, fmt);
 }
 
+/* -----------------------------------------------------------------------------
+ * control/extensions/<NAME>
+ */
+
+struct uvcg_extension_unit_descriptor {
+	u8 bLength;
+	u8 bDescriptorType;
+	u8 bDescriptorSubType;
+	u8 bUnitID;
+	u8 guidExtensionCode[16];
+	u8 bNumControls;
+	u8 bNrInPins;
+	u8 *baSourceID;
+	u8 bControlSize;
+	u8 *bmControls;
+	u8 iExtension;
+} __packed;
+
+struct uvcg_extension {
+	struct config_item item;
+	struct list_head list;
+	struct uvcg_extension_unit_descriptor desc;
+};
+
+static inline struct uvcg_extension *to_uvcg_extension(struct config_item *item)
+{
+	return container_of(item, struct uvcg_extension, item);
+}
+
 int uvcg_attach_configfs(struct f_uvc_opts *opts);
 
 #endif /* UVC_CONFIGFS_H */
-- 
2.34.1

