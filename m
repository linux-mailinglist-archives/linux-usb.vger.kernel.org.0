Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2F234D9DA9
	for <lists+linux-usb@lfdr.de>; Tue, 15 Mar 2022 15:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349291AbiCOOf0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Mar 2022 10:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349180AbiCOOfV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Mar 2022 10:35:21 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57BA336326
        for <linux-usb@vger.kernel.org>; Tue, 15 Mar 2022 07:34:01 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nU8FL-0004wp-H3; Tue, 15 Mar 2022 15:33:59 +0100
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nU8FK-00GRp2-Ld; Tue, 15 Mar 2022 15:33:58 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: [PATCH v7 5/7] usb: gadget: uvc: track frames in format entries
Date:   Tue, 15 Mar 2022 15:33:54 +0100
Message-Id: <20220315143356.3919911-6-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315143356.3919911-1-m.grzeschik@pengutronix.de>
References: <20220315143356.3919911-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Just like the header is tracking the formats in a linked list, in this
patch we track the frames in a linked list of the formats. It
simplifies the parsing of the configfs structure.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v7: -

 drivers/usb/gadget/function/uvc_configfs.c | 25 +++++++++++++++++++++-
 drivers/usb/gadget/function/uvc_configfs.h |  6 ++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 05dc5764020006..41c1876921bb65 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -1262,6 +1262,7 @@ static struct config_item *uvcg_frame_make(struct config_group *group,
 	struct uvcg_format *fmt;
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
+	struct uvcg_frame_ptr *frame_ptr;
 
 	h = kzalloc(sizeof(*h), GFP_KERNEL);
 	if (!h)
@@ -1292,6 +1293,16 @@ static struct config_item *uvcg_frame_make(struct config_group *group,
 		kfree(h);
 		return ERR_PTR(-EINVAL);
 	}
+
+	frame_ptr = kzalloc(sizeof(*frame_ptr), GFP_KERNEL);
+	if (!frame_ptr) {
+		mutex_unlock(&opts->lock);
+		kfree(h);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	frame_ptr->frm = h;
+	list_add_tail(&frame_ptr->entry, &fmt->frames);
 	++fmt->num_frames;
 	mutex_unlock(&opts->lock);
 
@@ -1305,13 +1316,23 @@ static void uvcg_frame_drop(struct config_group *group, struct config_item *item
 	struct uvcg_format *fmt;
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
+	struct uvcg_frame *target_frm = NULL;
+	struct uvcg_frame_ptr *frame_ptr, *tmp;
 
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
 	mutex_lock(&opts->lock);
+	target_frm = container_of(item, struct uvcg_frame, item);
 	fmt = to_uvcg_format(&group->cg_item);
-	--fmt->num_frames;
+
+	list_for_each_entry_safe(frame_ptr, tmp, &fmt->frames, entry)
+		if (frame_ptr->frm == target_frm) {
+			list_del(&frame_ptr->entry);
+			kfree(frame_ptr);
+			--fmt->num_frames;
+			break;
+		}
 	mutex_unlock(&opts->lock);
 
 	config_item_put(item);
@@ -1556,6 +1577,7 @@ static struct config_group *uvcg_uncompressed_make(struct config_group *group,
 	h->desc.bmInterfaceFlags	= 0;
 	h->desc.bCopyProtect		= 0;
 
+	INIT_LIST_HEAD(&h->fmt.frames);
 	h->fmt.type = UVCG_UNCOMPRESSED;
 	config_group_init_type_name(&h->fmt.group, name,
 				    &uvcg_uncompressed_type);
@@ -1736,6 +1758,7 @@ static struct config_group *uvcg_mjpeg_make(struct config_group *group,
 	h->desc.bmInterfaceFlags	= 0;
 	h->desc.bCopyProtect		= 0;
 
+	INIT_LIST_HEAD(&h->fmt.frames);
 	h->fmt.type = UVCG_MJPEG;
 	config_group_init_type_name(&h->fmt.group, name,
 				    &uvcg_mjpeg_type);
diff --git a/drivers/usb/gadget/function/uvc_configfs.h b/drivers/usb/gadget/function/uvc_configfs.h
index 1ec8529ff1e4fe..ad2ec8c4c78c35 100644
--- a/drivers/usb/gadget/function/uvc_configfs.h
+++ b/drivers/usb/gadget/function/uvc_configfs.h
@@ -46,6 +46,7 @@ struct uvcg_format {
 	struct config_group	group;
 	enum uvcg_format_type	type;
 	unsigned		linked;
+	struct list_head	frames;
 	unsigned		num_frames;
 	__u8			bmaControls[UVCG_STREAMING_CONTROL_SIZE];
 };
@@ -73,6 +74,11 @@ static inline struct uvcg_streaming_header *to_uvcg_streaming_header(struct conf
 	return container_of(item, struct uvcg_streaming_header, item);
 }
 
+struct uvcg_frame_ptr {
+	struct uvcg_frame	*frm;
+	struct list_head	entry;
+};
+
 struct uvcg_frame {
 	struct config_item	item;
 	enum uvcg_format_type	fmt_type;
-- 
2.30.2

