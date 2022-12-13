Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4E9D64B147
	for <lists+linux-usb@lfdr.de>; Tue, 13 Dec 2022 09:38:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234678AbiLMIiA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Dec 2022 03:38:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234296AbiLMIh4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Dec 2022 03:37:56 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D959618387
        for <linux-usb@vger.kernel.org>; Tue, 13 Dec 2022 00:37:54 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DCAB1288;
        Tue, 13 Dec 2022 09:37:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670920669;
        bh=Dk7cI4hhRmLxR9XyLrUBp49odXuJRf7tYCuzJUiJc7w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MyMInpJ1Y1cmboKho92eHyh+k+o6UnTnq2b4NWF9Ou4T+btFfbfp3WUYtcEwKaL04
         t8k+cH66Ukl3QqQ5G7Px0GdpZnYKACKQDHXzB8oNHf+xj7U9nT0C/BZXqUCGW9kyar
         S9XsRjz4ZO0hq0G/MiDFx3VVteyd3+5XxCVSXBAk=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 5/6] usb: gadget: uvc: Make color matching attributes read/write
Date:   Tue, 13 Dec 2022 08:37:35 +0000
Message-Id: <20221213083736.2284536-6-dan.scally@ideasonboard.com>
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

In preparation for allowing more than the default color matching
descriptor, make the color matching attributes writeable.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../ABI/testing/configfs-usb-gadget-uvc       |  2 +-
 drivers/usb/gadget/function/uvc_configfs.c    | 32 ++++++++++++++++++-
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
index 611b23e6488d..3512f4899fe3 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
@@ -165,7 +165,7 @@ Date:		Dec 2014
 KernelVersion:	4.0
 Description:	Default color matching descriptors
 
-		All attributes read only:
+		All attributes read/write:
 
 		========================  ======================================
 		bMatrixCoefficients	  matrix used to compute luma and
diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 6f5932c9f09c..4fbc42d738a4 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -1845,7 +1845,37 @@ static ssize_t uvcg_color_matching_##cname##_show(			\
 	return result;							\
 }									\
 									\
-UVC_ATTR_RO(uvcg_color_matching_, cname, aname)
+static ssize_t uvcg_color_matching_##cname##_store(			\
+	struct config_item *item, const char *page, size_t len)		\
+{									\
+	struct config_group *group = to_config_group(item);		\
+	struct mutex *su_mutex = &group->cg_subsys->su_mutex;		\
+	struct uvcg_cmd *cmd = to_uvcg_cmd(group);			\
+	struct f_uvc_opts *opts;					\
+	struct config_item *opts_item;					\
+	int ret;							\
+	u##bits num;							\
+									\
+	ret = kstrtou##bits(page, 0, &num);				\
+	if (ret)							\
+		return ret;						\
+									\
+	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
+									\
+	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;	\
+	opts = to_f_uvc_opts(opts_item);				\
+									\
+	mutex_lock(&opts->lock);					\
+									\
+	cmd->desc.aname = num;						\
+	ret = len;							\
+									\
+	mutex_unlock(&opts->lock);					\
+	mutex_unlock(su_mutex);						\
+									\
+	return ret;							\
+}									\
+UVC_ATTR(uvcg_color_matching_, cname, aname)
 
 UVCG_COLOR_MATCHING_ATTR(b_color_primaries, bColorPrimaries, 8);
 UVCG_COLOR_MATCHING_ATTR(b_transfer_characteristics, bTransferCharacteristics, 8);
-- 
2.34.1

