Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39E9E680B4E
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 11:51:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235715AbjA3KvE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 05:51:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235573AbjA3KvA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 05:51:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AD002FCF9
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 02:50:59 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36EBFD5F;
        Mon, 30 Jan 2023 11:50:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675075855;
        bh=Hp0S2pG9c9eSnY9vaqtKYShPannZEA6BH1mkGSLf5uU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sj3DLUpcAAytpN1XIPZTt6MeqkP5U44GaISY1n4ypbwh+Rw/Rln5ZaQxmfSJJcmhK
         lV9MSEIzur6aiTkEhRk213mgrJJNwFzg5/h9P0mg3nKImeRwwCmTLRVhDgDS6UKbXr
         9p0b+IVzidMFetAn1H9WhDIbHV5L41aB7+lM3Dyc=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        mgr@pengutronix.de, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v2 2/3] usb: gadget: uvc: Add new enable_interrupt_ep attribute
Date:   Mon, 30 Jan 2023 10:50:44 +0000
Message-Id: <20230130105045.120886-3-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130105045.120886-1-dan.scally@ideasonboard.com>
References: <20230130105045.120886-1-dan.scally@ideasonboard.com>
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

Add a new attribute to the default control config group that allows
users to specify whether they want to enable the optional interrupt
endpoint for the VideoControl interface.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v2 (Laurent):

	- Added the new attribute to confifs Documentation
	- Renamed from "disable_interrupt_ep" to "enable_interrupt_ep" to reflect
	the intention to change the default behaviour

 .../ABI/testing/configfs-usb-gadget-uvc       |  4 +-
 drivers/usb/gadget/function/u_uvc.h           |  2 +
 drivers/usb/gadget/function/uvc_configfs.c    | 53 +++++++++++++++++++
 3 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
index f00cff6d8c5c..eb13cc5d363a 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
@@ -15,11 +15,13 @@ Date:		Dec 2014
 KernelVersion:	4.0
 Description:	Control descriptors
 
-		All attributes read only:
+		All attributes read only except enable_interrupt_ep:
 
 		================	=============================
 		bInterfaceNumber	USB interface number for this
 					streaming interface
+		enable_interrupt_ep	flag to enable the interrupt
+					endpoint for the VC interface
 		================	=============================
 
 What:		/config/usb-gadget/gadget/functions/uvc.name/control/class
diff --git a/drivers/usb/gadget/function/u_uvc.h b/drivers/usb/gadget/function/u_uvc.h
index 24b8681b0d6f..9d15bc2c7045 100644
--- a/drivers/usb/gadget/function/u_uvc.h
+++ b/drivers/usb/gadget/function/u_uvc.h
@@ -29,6 +29,8 @@ struct f_uvc_opts {
 	unsigned int					streaming_interface;
 	char						function_name[32];
 
+	bool						enable_interrupt_ep;
+
 	/*
 	 * Control descriptors array pointers for full-/high-speed and
 	 * super-speed. They point by default to the uvc_fs_control_cls and
diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 76cb60d13049..83ecb047aa85 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -716,8 +716,61 @@ static ssize_t uvcg_default_control_b_interface_number_show(
 
 UVC_ATTR_RO(uvcg_default_control_, b_interface_number, bInterfaceNumber);
 
+static ssize_t uvcg_default_control_enable_interrupt_ep_show(
+	struct config_item *item, char *page)
+{
+	struct config_group *group = to_config_group(item);
+	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
+	struct config_item *opts_item;
+	struct f_uvc_opts *opts;
+	int result = 0;
+
+	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
+
+	opts_item = item->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
+	result += sprintf(page, "%u\n", opts->enable_interrupt_ep);
+	mutex_unlock(&opts->lock);
+
+	mutex_unlock(su_mutex);
+
+	return result;
+}
+
+static ssize_t uvcg_default_control_enable_interrupt_ep_store(
+	struct config_item *item, const char *page, size_t len)
+{
+	struct config_group *group = to_config_group(item);
+	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
+	struct config_item *opts_item;
+	struct f_uvc_opts *opts;
+	ssize_t ret;
+	u8 num;
+
+	ret = kstrtou8(page, 0, &num);
+	if (ret)
+		return ret;
+
+	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
+
+	opts_item = item->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
+	opts->enable_interrupt_ep = num;
+	mutex_unlock(&opts->lock);
+
+	mutex_unlock(su_mutex);
+
+	return len;
+}
+UVC_ATTR(uvcg_default_control_, enable_interrupt_ep, enable_interrupt_ep);
+
 static struct configfs_attribute *uvcg_default_control_attrs[] = {
 	&uvcg_default_control_attr_b_interface_number,
+	&uvcg_default_control_attr_enable_interrupt_ep,
 	NULL,
 };
 
-- 
2.34.1

