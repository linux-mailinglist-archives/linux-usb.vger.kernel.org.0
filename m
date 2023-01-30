Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9E8D6809B6
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 10:38:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235349AbjA3Jih (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 04:38:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231455AbjA3Jif (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 04:38:35 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E6761164F
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 01:38:03 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB2E4192D;
        Mon, 30 Jan 2023 10:35:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675071307;
        bh=3VjcWjQDoupM5MTqgg81P+flMEsJDKLq1YR0103cqew=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=stGba8gCQevgbOh0hImDHbVadtyN+weR2y5UUc1eNm7IiNXNKmuzTDzniZSgzQnYr
         ERfZCMeJbKEA+kk9g9C+XcmO0f8OP4R017z67STiStpkCiNuHuSawbZ5g8c9KWnHT2
         edfXqWgC3CnJoampAo7EtqdwNnqPQ8ODDQyxvBBE=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com
Cc:     mgr@pengutronix.de, balbi@kernel.org,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        stern@rowland.harvard.edu,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v3 08/11] usb: gadget: uvc: Allow linking XUs to string descriptors
Date:   Mon, 30 Jan 2023 09:34:40 +0000
Message-Id: <20230130093443.25644-9-dan.scally@ideasonboard.com>
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

Add .allow_link() and .drop_link() callbacks to allow users to link
an extension unit descriptor to a string descriptor.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v3:

	- Changed the target of the links to in <gadget root>/strings

Changes in v2:

	- New patch

 drivers/usb/gadget/function/uvc_configfs.c | 52 ++++++++++++++++++++++
 drivers/usb/gadget/function/uvc_configfs.h |  1 +
 2 files changed, 53 insertions(+)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index a81613e9652d..9da3b784f954 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -1063,8 +1063,60 @@ static void uvcg_extension_release(struct config_item *item)
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
index c9a4182fb26f..bf188080034c 100644
--- a/drivers/usb/gadget/function/uvc_configfs.h
+++ b/drivers/usb/gadget/function/uvc_configfs.h
@@ -153,6 +153,7 @@ struct uvcg_extension_unit_descriptor {
 struct uvcg_extension {
 	struct config_item item;
 	struct list_head list;
+	u8 string_descriptor_index;
 	struct uvcg_extension_unit_descriptor desc;
 };
 
-- 
2.34.1

