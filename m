Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39533631CCD
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 10:25:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbiKUJZs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Nov 2022 04:25:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbiKUJZq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 04:25:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44EB427DE4
        for <linux-usb@vger.kernel.org>; Mon, 21 Nov 2022 01:25:45 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BFADD1905;
        Mon, 21 Nov 2022 10:25:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669022739;
        bh=28K8LD+f0JZGAxJz0Tf5aEHpV0AcAjYiab70NsIvnbY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cB3ph/tjBIrTRmuqZpxGQ55HWxVSVGKefYwgJkia6Gqa5ZxB+D9JdnIM0IQxduf5v
         5LLZ4oEKaL1eNtxEQCp37+WMeJMsLQjq4oSFNh3/vFmMJS+SPiyNG5MAsJIRdzet0r
         p00VZeu5tRShNq/CZKojhgDgt5Dls3ppvoPKiss0=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, mgr@pengutronix.de,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v2 6/9] usb: gadget: uvc: Allow linking XUs to string descriptors
Date:   Mon, 21 Nov 2022 09:25:14 +0000
Message-Id: <20221121092517.225242-7-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221121092517.225242-1-dan.scally@ideasonboard.com>
References: <20221121092517.225242-1-dan.scally@ideasonboard.com>
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
Changes in v2:

	- New patch

 drivers/usb/gadget/function/uvc_configfs.c | 60 ++++++++++++++++++++++
 drivers/usb/gadget/function/uvc_configfs.h |  1 +
 2 files changed, 61 insertions(+)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index da2f70036993..5c51862150c4 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -1053,8 +1053,68 @@ static void uvcg_extension_release(struct config_item *item)
 	kfree(xu);
 }
 
+static int uvcg_extension_allow_link(struct config_item *src, struct config_item *tgt)
+{
+	struct mutex *su_mutex = &src->ci_group->cg_subsys->su_mutex;
+	struct uvcg_extension *xu = to_uvcg_extension(src);
+	struct config_item *strings;
+	struct uvcg_string *string;
+	struct config_item *opts_item;
+	struct f_uvc_opts *opts;
+	int ret = 0;
+
+	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
+
+	/* Validate that the target of the link is an entry in strings/<langid> */
+	opts_item = src->ci_parent->ci_parent->ci_parent;
+
+	strings = config_group_find_item(to_config_group(opts_item), "strings");
+	if (!strings || tgt->ci_parent->ci_parent != strings) {
+		ret = -EINVAL;
+		goto put_strings;
+	}
+
+	string = to_uvcg_string(tgt);
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
+
+	xu->string_descriptor_index = string->usb_string.id;
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
index a714426a174a..e1308026aed6 100644
--- a/drivers/usb/gadget/function/uvc_configfs.h
+++ b/drivers/usb/gadget/function/uvc_configfs.h
@@ -183,6 +183,7 @@ struct uvcg_extension_unit_descriptor {
 struct uvcg_extension {
 	struct config_item item;
 	struct list_head list;
+	u8 string_descriptor_index;
 	struct uvcg_extension_unit_descriptor desc;
 };
 
-- 
2.34.1

