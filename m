Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34E1968132F
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 15:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235123AbjA3O24 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 09:28:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237627AbjA3O2e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 09:28:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48CC642BE6
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 06:27:07 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D842DFEF;
        Mon, 30 Jan 2023 15:26:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675088816;
        bh=hgFIeB/Y5tfSGUjAgImGfVhd8vXiDZgvbj/xTJDdCDk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J+r7ha1/QFl9AvPU+qp/Dm4fAfP+a5y+rD7x2fF5grtu+aYjfEC2DW7PNYME2H9Vk
         rSInNXjB6utE0MfWvV0Rl58kUYI3QjevCRLdRpq9Ee2qYot4jasNNhLHq+qkIH8rec
         AskktpL4NJlyfISSUZkRe4ZD0pEJm4PzJHL2/FoQ=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v3 4/7] usb: gadget: uvc: Copy color matching descriptor for each frame
Date:   Mon, 30 Jan 2023 14:26:36 +0000
Message-Id: <20230130142639.217885-5-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130142639.217885-1-dan.scally@ideasonboard.com>
References: <20230130142639.217885-1-dan.scally@ideasonboard.com>
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

As currently implemented the default color matching descriptor is
appended after _all_ the formats and frames that the gadget is
configured with. According to the UVC specifications however this
is supposed to be on a per-format basis (section 3.9.2.6):

"Only one instance is allowed for a given format and if present,
the Color Matching descriptor shall be placed following the Video
and Still Image Frame descriptors for that format."

Associate the default color matching descriptor with struct
uvcg_format and copy it once-per-format instead of once only.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v3 (Laurent):

	- Renamed UVCG_CMD to UVCG_COLOR_MATCHING

Changes in v2:

	- Renamed uvcg_cmd and associated variables.
	- Formatting
	- Increased the refcnt variable for the color matching struct in
	the format make() functions

 drivers/usb/gadget/function/uvc_configfs.c | 65 +++++++++++++++++++++-
 drivers/usb/gadget/function/uvc_configfs.h | 14 +++--
 2 files changed, 70 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index a2321ee039a0..41f4ce7e8a9a 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -748,6 +748,29 @@ static const char * const uvcg_format_names[] = {
 	"mjpeg",
 };
 
+static struct uvcg_color_matching *
+uvcg_format_get_default_color_match(struct config_item *streaming)
+{
+	struct config_item *color_matching_item, *cm_default;
+	struct uvcg_color_matching *color_match;
+
+	color_matching_item = config_group_find_item(to_config_group(streaming),
+						     "color_matching");
+	if (!color_matching_item)
+		return NULL;
+
+	cm_default = config_group_find_item(to_config_group(color_matching_item),
+					    "default");
+	config_item_put(color_matching_item);
+	if (!cm_default)
+		return NULL;
+
+	color_match = to_uvcg_color_matching(to_config_group(cm_default));
+	config_item_put(cm_default);
+
+	return color_match;
+}
+
 static ssize_t uvcg_format_bma_controls_show(struct uvcg_format *f, char *page)
 {
 	struct f_uvc_opts *opts;
@@ -1561,8 +1584,15 @@ static struct config_group *uvcg_uncompressed_make(struct config_group *group,
 		'Y',  'U',  'Y',  '2', 0x00, 0x00, 0x10, 0x00,
 		 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71
 	};
+	struct uvcg_color_matching *color_match;
+	struct config_item *streaming;
 	struct uvcg_uncompressed *h;
 
+	streaming = group->cg_item.ci_parent;
+	color_match = uvcg_format_get_default_color_match(streaming);
+	if (!color_match)
+		return ERR_PTR(-EINVAL);
+
 	h = kzalloc(sizeof(*h), GFP_KERNEL);
 	if (!h)
 		return ERR_PTR(-ENOMEM);
@@ -1580,6 +1610,8 @@ static struct config_group *uvcg_uncompressed_make(struct config_group *group,
 
 	INIT_LIST_HEAD(&h->fmt.frames);
 	h->fmt.type = UVCG_UNCOMPRESSED;
+	h->fmt.color_matching = color_match;
+	color_match->refcnt++;
 	config_group_init_type_name(&h->fmt.group, name,
 				    &uvcg_uncompressed_type);
 
@@ -1744,8 +1776,15 @@ static const struct config_item_type uvcg_mjpeg_type = {
 static struct config_group *uvcg_mjpeg_make(struct config_group *group,
 						   const char *name)
 {
+	struct uvcg_color_matching *color_match;
+	struct config_item *streaming;
 	struct uvcg_mjpeg *h;
 
+	streaming = group->cg_item.ci_parent;
+	color_match = uvcg_format_get_default_color_match(streaming);
+	if (!color_match)
+		return ERR_PTR(-EINVAL);
+
 	h = kzalloc(sizeof(*h), GFP_KERNEL);
 	if (!h)
 		return ERR_PTR(-ENOMEM);
@@ -1761,6 +1800,8 @@ static struct config_group *uvcg_mjpeg_make(struct config_group *group,
 
 	INIT_LIST_HEAD(&h->fmt.frames);
 	h->fmt.type = UVCG_MJPEG;
+	h->fmt.color_matching = color_match;
+	color_match->refcnt++;
 	config_group_init_type_name(&h->fmt.group, name,
 				    &uvcg_mjpeg_type);
 
@@ -1909,7 +1950,8 @@ static inline struct uvc_descriptor_header
 enum uvcg_strm_type {
 	UVCG_HEADER = 0,
 	UVCG_FORMAT,
-	UVCG_FRAME
+	UVCG_FRAME,
+	UVCG_COLOR_MATCHING,
 };
 
 /*
@@ -1959,6 +2001,11 @@ static int __uvcg_iter_strm_cls(struct uvcg_streaming_header *h,
 			if (ret)
 				return ret;
 		}
+
+		ret = fun(f->fmt->color_matching, priv2, priv3, 0,
+			  UVCG_COLOR_MATCHING);
+		if (ret)
+			return ret;
 	}
 
 	return ret;
@@ -2014,6 +2061,12 @@ static int __uvcg_cnt_strm(void *priv1, void *priv2, void *priv3, int n,
 		*size += frm->frame.b_frame_interval_type * sz;
 	}
 	break;
+	case UVCG_COLOR_MATCHING: {
+		struct uvcg_color_matching *color_match = priv1;
+
+		*size += sizeof(color_match->desc);
+	}
+	break;
 	}
 
 	++*count;
@@ -2099,6 +2152,13 @@ static int __uvcg_fill_strm(void *priv1, void *priv2, void *priv3, int n,
 				frm->frame.b_frame_interval_type);
 	}
 	break;
+	case UVCG_COLOR_MATCHING: {
+		struct uvcg_color_matching *color_match = priv1;
+
+		memcpy(*dest, &color_match->desc, sizeof(color_match->desc));
+		*dest += sizeof(color_match->desc);
+	}
+	break;
 	}
 
 	return 0;
@@ -2138,7 +2198,7 @@ static int uvcg_streaming_class_allow_link(struct config_item *src,
 	if (ret)
 		goto unlock;
 
-	count += 2; /* color_matching, NULL */
+	count += 1; /* NULL */
 	*class_array = kcalloc(count, sizeof(void *), GFP_KERNEL);
 	if (!*class_array) {
 		ret = -ENOMEM;
@@ -2165,7 +2225,6 @@ static int uvcg_streaming_class_allow_link(struct config_item *src,
 		kfree(data_save);
 		goto unlock;
 	}
-	*cl_arr = (struct uvc_descriptor_header *)&opts->uvc_color_matching;
 
 	++target_hdr->linked;
 	ret = 0;
diff --git a/drivers/usb/gadget/function/uvc_configfs.h b/drivers/usb/gadget/function/uvc_configfs.h
index 18b9931c85b1..174ee691302b 100644
--- a/drivers/usb/gadget/function/uvc_configfs.h
+++ b/drivers/usb/gadget/function/uvc_configfs.h
@@ -40,6 +40,7 @@ static inline struct uvcg_control_header *to_uvcg_control_header(struct config_i
 struct uvcg_color_matching {
 	struct config_group group;
 	struct uvc_color_matching_descriptor desc;
+	unsigned int refcnt;
 };
 
 #define to_uvcg_color_matching(group_ptr) \
@@ -51,12 +52,13 @@ enum uvcg_format_type {
 };
 
 struct uvcg_format {
-	struct config_group	group;
-	enum uvcg_format_type	type;
-	unsigned		linked;
-	struct list_head	frames;
-	unsigned		num_frames;
-	__u8			bmaControls[UVCG_STREAMING_CONTROL_SIZE];
+	struct config_group		group;
+	enum uvcg_format_type		type;
+	unsigned			linked;
+	struct list_head		frames;
+	unsigned			num_frames;
+	__u8				bmaControls[UVCG_STREAMING_CONTROL_SIZE];
+	struct uvcg_color_matching	*color_matching;
 };
 
 struct uvcg_format_ptr {
-- 
2.34.1

