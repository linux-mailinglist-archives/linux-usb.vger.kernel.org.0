Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 656BE68C30B
	for <lists+linux-usb@lfdr.de>; Mon,  6 Feb 2023 17:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbjBFQU5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Feb 2023 11:20:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbjBFQUv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Feb 2023 11:20:51 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA9892D43
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 08:20:32 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94C59110E;
        Mon,  6 Feb 2023 17:18:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675700311;
        bh=0MscIBITetzX038WUDblMQjB58uIIniHyJME2YAZM94=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u/ENYfcSd5H+k1HuTbVg6dWmkod+qIPrXKbwRWkTF9Lj7ZXvK+3bv6iEhwGyoM0Ve
         IAEt8uJFsWCmjJchVgzMjaMhkhwKVo25QMVjGNTMyxwsEs8h+sdN+8LJ0Fepw7GiS+
         AW6tJ1ewoCRJPQBNq247oWQxEg6eqoQuoGq5FbWA=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com
Cc:     mgr@pengutronix.de, balbi@kernel.org,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        stern@rowland.harvard.edu,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v5 10/11] usb: gadget: uvc: Allow linking function to string descs
Date:   Mon,  6 Feb 2023 16:18:01 +0000
Message-Id: <20230206161802.892954-11-dan.scally@ideasonboard.com>
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

Currently the string descriptors for the IAD and VideoStreaming
Interfaces are hardcoded into f_uvc. Now that we can create arbitrary
string descriptors, add a mechanism to define string descriptors for
the IAD, VC and VS interfaces by linking to the appropriate directory
at function level.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v5:

	- None

Changes in v4:

	- None

Changes in v3:

	- Changed target of link to be within <gadget root>/strings
	- Dropped the VideoControl description since there's an attribute for
	that now

Changes in v2:

	- New patch

 drivers/usb/gadget/function/u_uvc.h        |  8 +++
 drivers/usb/gadget/function/uvc_configfs.c | 60 ++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/drivers/usb/gadget/function/u_uvc.h b/drivers/usb/gadget/function/u_uvc.h
index 0345b8fc36ff..1ce58f61253c 100644
--- a/drivers/usb/gadget/function/u_uvc.h
+++ b/drivers/usb/gadget/function/u_uvc.h
@@ -82,6 +82,14 @@ struct f_uvc_opts {
 	struct uvc_descriptor_header			**uvc_hs_streaming_cls;
 	struct uvc_descriptor_header			**uvc_ss_streaming_cls;
 
+	/*
+	 * Indexes into the function's string descriptors allowing users to set
+	 * custom descriptions rather than the hard-coded defaults.
+	 */
+	u8						iad_index;
+	u8						vs0_index;
+	u8						vs1_index;
+
 	/*
 	 * Read/write access to configfs attributes is handled by configfs.
 	 *
diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 3ac27838514c..18c6a1461b7e 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -3174,8 +3174,68 @@ static void uvc_func_item_release(struct config_item *item)
 	usb_put_function_instance(&opts->func_inst);
 }
 
+static int uvc_func_allow_link(struct config_item *src, struct config_item *tgt)
+{
+	struct mutex *su_mutex = &src->ci_group->cg_subsys->su_mutex;
+	struct gadget_string *string;
+	struct config_item *strings;
+	struct f_uvc_opts *opts;
+	int ret = 0;
+
+	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
+
+	/* Validate that the target is an entry in strings/<langid> */
+	strings = config_group_find_item(to_config_group(src->ci_parent->ci_parent),
+					 "strings");
+	if (!strings || tgt->ci_parent->ci_parent != strings) {
+		ret = -EINVAL;
+		goto put_strings;
+	}
+
+	string = to_gadget_string(tgt);
+
+	opts = to_f_uvc_opts(src);
+	mutex_lock(&opts->lock);
+
+	if (!strcmp(tgt->ci_name, "iad_desc"))
+		opts->iad_index = string->usb_string.id;
+	else if (!strcmp(tgt->ci_name, "vs0_desc"))
+		opts->vs0_index = string->usb_string.id;
+	else if (!strcmp(tgt->ci_name, "vs1_desc"))
+		opts->vs1_index = string->usb_string.id;
+	else
+		ret = -EINVAL;
+
+	mutex_unlock(&opts->lock);
+
+put_strings:
+	config_item_put(strings);
+	mutex_unlock(su_mutex);
+
+	return ret;
+}
+
+static void uvc_func_drop_link(struct config_item *src, struct config_item *tgt)
+{
+	struct f_uvc_opts *opts;
+
+	opts = to_f_uvc_opts(src);
+	mutex_lock(&opts->lock);
+
+	if (!strcmp(tgt->ci_name, "iad_desc"))
+		opts->iad_index = 0;
+	else if (!strcmp(tgt->ci_name, "vs0_desc"))
+		opts->vs0_index = 0;
+	else if (!strcmp(tgt->ci_name, "vs1_desc"))
+		opts->vs1_index = 0;
+
+	mutex_unlock(&opts->lock);
+}
+
 static struct configfs_item_operations uvc_func_item_ops = {
 	.release	= uvc_func_item_release,
+	.allow_link	= uvc_func_allow_link,
+	.drop_link	= uvc_func_drop_link,
 };
 
 #define UVCG_OPTS_ATTR(cname, aname, limit)				\
-- 
2.34.1

