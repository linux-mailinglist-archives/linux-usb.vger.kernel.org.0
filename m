Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4E768C307
	for <lists+linux-usb@lfdr.de>; Mon,  6 Feb 2023 17:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbjBFQUj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Feb 2023 11:20:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231438AbjBFQUb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Feb 2023 11:20:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 229A24EC9
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 08:20:14 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 744EAF85;
        Mon,  6 Feb 2023 17:18:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675700309;
        bh=U8Xi5FhMn2YUt2ihbAcHT1L+D1AStLM1WM7TDl56HC0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FGAsTpctm9hJHaHsyjP0zamtEcoxQHoxYU0ZUmNNUNuhx0tXRcytiwZ9gIk+jWvcf
         Hf1xUKrPZoe8G0GEZ+M6/b8/HXNaY0txyjYBr0nza9gqm9aMHxFEFlJNHNh/8dNTzB
         jt/bNakSSmHifLuGtOU6FYHvlQLuqzzoh8II8DiU=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com
Cc:     mgr@pengutronix.de, balbi@kernel.org,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        stern@rowland.harvard.edu,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v5 08/11] usb: gadget: uvc: Allow linking XUs to string descriptors
Date:   Mon,  6 Feb 2023 16:17:59 +0000
Message-Id: <20230206161802.892954-9-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230206161802.892954-1-dan.scally@ideasonboard.com>
References: <20230206161802.892954-1-dan.scally@ideasonboard.com>
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

Add .allow_link() and .drop_link() callbacks to allow users to link
an extension unit descriptor to a string descriptor.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v5:

	- None

Changes in v4:

	- None

Changes in v3:

	- Changed the target of the links to in <gadget root>/strings

Changes in v2:

	- New patch

 drivers/usb/gadget/function/uvc_configfs.c | 52 ++++++++++++++++++++++
 drivers/usb/gadget/function/uvc_configfs.h |  1 +
 2 files changed, 53 insertions(+)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index c365f323af45..3ac27838514c 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -1064,8 +1064,60 @@ static void uvcg_extension_release(struct config_item *item)
 	kfree(xu);
 }
 
+static int uvcg_extension_allow_link(struct config_item *src, struct config_item *tgt)
+{
+	struct mutex *su_mutex = &src->ci_group->cg_subsys->su_mutex;
+	struct uvcg_extension *xu = to_uvcg_extension(src);
+	struct config_item *gadget_item;
+	struct gadget_string *string;
+	struct config_item *strings;
+	int ret = 0;
+
+	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
+
+	/* Validate that the target of the link is an entry in strings/<langid> */
+	gadget_item = src->ci_parent->ci_parent->ci_parent->ci_parent->ci_parent;
+	strings = config_group_find_item(to_config_group(gadget_item), "strings");
+	if (!strings || tgt->ci_parent->ci_parent != strings) {
+		ret = -EINVAL;
+		goto put_strings;
+	}
+
+	string = to_gadget_string(tgt);
+	xu->string_descriptor_index = string->usb_string.id;
+
+put_strings:
+	config_item_put(strings);
+	mutex_unlock(su_mutex);
+
+	return ret;
+}
+
+static void uvcg_extension_drop_link(struct config_item *src, struct config_item *tgt)
+{
+	struct mutex *su_mutex = &src->ci_group->cg_subsys->su_mutex;
+	struct uvcg_extension *xu = to_uvcg_extension(src);
+	struct config_item *opts_item;
+	struct f_uvc_opts *opts;
+
+	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
+
+	opts_item = src->ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
+
+	xu->string_descriptor_index = 0;
+
+	mutex_unlock(&opts->lock);
+
+	mutex_unlock(su_mutex);
+}
+
 static struct configfs_item_operations uvcg_extension_item_ops = {
 	.release	= uvcg_extension_release,
+	.allow_link	= uvcg_extension_allow_link,
+	.drop_link	= uvcg_extension_drop_link,
 };
 
 static const struct config_item_type uvcg_extension_type = {
diff --git a/drivers/usb/gadget/function/uvc_configfs.h b/drivers/usb/gadget/function/uvc_configfs.h
index 5557813bcca9..c6a690158138 100644
--- a/drivers/usb/gadget/function/uvc_configfs.h
+++ b/drivers/usb/gadget/function/uvc_configfs.h
@@ -163,6 +163,7 @@ struct uvcg_extension_unit_descriptor {
 struct uvcg_extension {
 	struct config_item item;
 	struct list_head list;
+	u8 string_descriptor_index;
 	struct uvcg_extension_unit_descriptor desc;
 };
 
-- 
2.34.1

