Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3011468DCC
	for <lists+linux-usb@lfdr.de>; Sun,  5 Dec 2021 23:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240467AbhLEXBj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Dec 2021 18:01:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239795AbhLEXBi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 5 Dec 2021 18:01:38 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E56D9C061359
        for <linux-usb@vger.kernel.org>; Sun,  5 Dec 2021 14:58:10 -0800 (PST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mu0SP-0006eM-2R; Sun, 05 Dec 2021 23:58:09 +0100
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1mu0SO-00182Q-A1; Sun, 05 Dec 2021 23:58:08 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de
Subject: [PATCH v4 4/7] usb: gadget: uvc: move structs to common header
Date:   Sun,  5 Dec 2021 23:58:00 +0100
Message-Id: <20211205225803.268492-5-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211205225803.268492-1-m.grzeschik@pengutronix.de>
References: <20211205225803.268492-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The functions and structs of the configfs interface should also be used
by the uvc gadget driver. This patch prepares the stack by moving the
common structs and functions to the common header file.

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2:
   - moved uvcg_attach_configfs declaration to end of header file
   - moved header uvc_configfs to beginning of uvc_configfs.c
   - simplified call of to_uvcg_uncompressed
   - simplified call of to_uvcg_mjpeg
   - moved uvc_configfs.h to the beginning to show that the header is self-contained
v2 -> v3:
   - fixed include of uvcg_format_names back to uvc_configfs.c
v3 -> v4: -

 drivers/usb/gadget/function/f_uvc.c        |   1 -
 drivers/usb/gadget/function/uvc_configfs.c | 111 +-------------------
 drivers/usb/gadget/function/uvc_configfs.h | 114 ++++++++++++++++++++-
 3 files changed, 115 insertions(+), 111 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 71bb5e477dbad7..37fdf8b3495a48 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -24,7 +24,6 @@
 #include <media/v4l2-dev.h>
 #include <media/v4l2-event.h>
 
-#include "u_uvc.h"
 #include "uvc.h"
 #include "uvc_configfs.h"
 #include "uvc_v4l2.h"
diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index b6bb5706299951..05dc5764020006 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -10,17 +10,14 @@
  * Author: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
  */
 
-#include <linux/sort.h>
-
-#include "u_uvc.h"
 #include "uvc_configfs.h"
 
+#include <linux/sort.h>
+
 /* -----------------------------------------------------------------------------
  * Global Utility Structures and Macros
  */
 
-#define UVCG_STREAMING_CONTROL_SIZE	1
-
 #define UVC_ATTR(prefix, cname, aname) \
 static struct configfs_attribute prefix##attr_##cname = { \
 	.ca_name	= __stringify(aname),				\
@@ -49,12 +46,6 @@ static int uvcg_config_compare_u32(const void *l, const void *r)
 	return li < ri ? -1 : li == ri ? 0 : 1;
 }
 
-static inline struct f_uvc_opts *to_f_uvc_opts(struct config_item *item)
-{
-	return container_of(to_config_group(item), struct f_uvc_opts,
-			    func_inst.group);
-}
-
 struct uvcg_config_group_type {
 	struct config_item_type type;
 	const char *name;
@@ -125,19 +116,6 @@ static void uvcg_config_remove_children(struct config_group *group)
  * control/header
  */
 
-DECLARE_UVC_HEADER_DESCRIPTOR(1);
-
-struct uvcg_control_header {
-	struct config_item		item;
-	struct UVC_HEADER_DESCRIPTOR(1)	desc;
-	unsigned			linked;
-};
-
-static struct uvcg_control_header *to_uvcg_control_header(struct config_item *item)
-{
-	return container_of(item, struct uvcg_control_header, item);
-}
-
 #define UVCG_CTRL_HDR_ATTR(cname, aname, bits, limit)			\
 static ssize_t uvcg_control_header_##cname##_show(			\
 	struct config_item *item, char *page)				\
@@ -769,24 +747,6 @@ static const char * const uvcg_format_names[] = {
 	"mjpeg",
 };
 
-enum uvcg_format_type {
-	UVCG_UNCOMPRESSED = 0,
-	UVCG_MJPEG,
-};
-
-struct uvcg_format {
-	struct config_group	group;
-	enum uvcg_format_type	type;
-	unsigned		linked;
-	unsigned		num_frames;
-	__u8			bmaControls[UVCG_STREAMING_CONTROL_SIZE];
-};
-
-static struct uvcg_format *to_uvcg_format(struct config_item *item)
-{
-	return container_of(to_config_group(item), struct uvcg_format, group);
-}
-
 static ssize_t uvcg_format_bma_controls_show(struct uvcg_format *f, char *page)
 {
 	struct f_uvc_opts *opts;
@@ -845,29 +805,11 @@ static ssize_t uvcg_format_bma_controls_store(struct uvcg_format *ch,
 	return ret;
 }
 
-struct uvcg_format_ptr {
-	struct uvcg_format	*fmt;
-	struct list_head	entry;
-};
-
 /* -----------------------------------------------------------------------------
  * streaming/header/<NAME>
  * streaming/header
  */
 
-struct uvcg_streaming_header {
-	struct config_item				item;
-	struct uvc_input_header_descriptor		desc;
-	unsigned					linked;
-	struct list_head				formats;
-	unsigned					num_fmt;
-};
-
-static struct uvcg_streaming_header *to_uvcg_streaming_header(struct config_item *item)
-{
-	return container_of(item, struct uvcg_streaming_header, item);
-}
-
 static void uvcg_format_set_indices(struct config_group *fmt);
 
 static int uvcg_streaming_header_allow_link(struct config_item *src,
@@ -1059,31 +1001,6 @@ static const struct uvcg_config_group_type uvcg_streaming_header_grp_type = {
  * streaming/<mode>/<format>/<NAME>
  */
 
-struct uvcg_frame {
-	struct config_item	item;
-	enum uvcg_format_type	fmt_type;
-	struct {
-		u8	b_length;
-		u8	b_descriptor_type;
-		u8	b_descriptor_subtype;
-		u8	b_frame_index;
-		u8	bm_capabilities;
-		u16	w_width;
-		u16	w_height;
-		u32	dw_min_bit_rate;
-		u32	dw_max_bit_rate;
-		u32	dw_max_video_frame_buffer_size;
-		u32	dw_default_frame_interval;
-		u8	b_frame_interval_type;
-	} __attribute__((packed)) frame;
-	u32 *dw_frame_interval;
-};
-
-static struct uvcg_frame *to_uvcg_frame(struct config_item *item)
-{
-	return container_of(item, struct uvcg_frame, item);
-}
-
 #define UVCG_FRAME_ATTR(cname, aname, bits) \
 static ssize_t uvcg_frame_##cname##_show(struct config_item *item, char *page)\
 {									\
@@ -1420,18 +1337,6 @@ static void uvcg_format_set_indices(struct config_group *fmt)
  * streaming/uncompressed/<NAME>
  */
 
-struct uvcg_uncompressed {
-	struct uvcg_format		fmt;
-	struct uvc_format_uncompressed	desc;
-};
-
-static struct uvcg_uncompressed *to_uvcg_uncompressed(struct config_item *item)
-{
-	return container_of(
-		container_of(to_config_group(item), struct uvcg_format, group),
-		struct uvcg_uncompressed, fmt);
-}
-
 static struct configfs_group_operations uvcg_uncompressed_group_ops = {
 	.make_item		= uvcg_frame_make,
 	.drop_item		= uvcg_frame_drop,
@@ -1675,18 +1580,6 @@ static const struct uvcg_config_group_type uvcg_uncompressed_grp_type = {
  * streaming/mjpeg/<NAME>
  */
 
-struct uvcg_mjpeg {
-	struct uvcg_format		fmt;
-	struct uvc_format_mjpeg		desc;
-};
-
-static struct uvcg_mjpeg *to_uvcg_mjpeg(struct config_item *item)
-{
-	return container_of(
-		container_of(to_config_group(item), struct uvcg_format, group),
-		struct uvcg_mjpeg, fmt);
-}
-
 static struct configfs_group_operations uvcg_mjpeg_group_ops = {
 	.make_item		= uvcg_frame_make,
 	.drop_item		= uvcg_frame_drop,
diff --git a/drivers/usb/gadget/function/uvc_configfs.h b/drivers/usb/gadget/function/uvc_configfs.h
index 7e1d7ca29bf210..1ec8529ff1e4fe 100644
--- a/drivers/usb/gadget/function/uvc_configfs.h
+++ b/drivers/usb/gadget/function/uvc_configfs.h
@@ -12,7 +12,119 @@
 #ifndef UVC_CONFIGFS_H
 #define UVC_CONFIGFS_H
 
-struct f_uvc_opts;
+#include <linux/configfs.h>
+
+#include "u_uvc.h"
+
+static inline struct f_uvc_opts *to_f_uvc_opts(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct f_uvc_opts,
+			    func_inst.group);
+}
+
+#define UVCG_STREAMING_CONTROL_SIZE	1
+
+DECLARE_UVC_HEADER_DESCRIPTOR(1);
+
+struct uvcg_control_header {
+	struct config_item		item;
+	struct UVC_HEADER_DESCRIPTOR(1)	desc;
+	unsigned			linked;
+};
+
+static inline struct uvcg_control_header *to_uvcg_control_header(struct config_item *item)
+{
+	return container_of(item, struct uvcg_control_header, item);
+}
+
+enum uvcg_format_type {
+	UVCG_UNCOMPRESSED = 0,
+	UVCG_MJPEG,
+};
+
+struct uvcg_format {
+	struct config_group	group;
+	enum uvcg_format_type	type;
+	unsigned		linked;
+	unsigned		num_frames;
+	__u8			bmaControls[UVCG_STREAMING_CONTROL_SIZE];
+};
+
+struct uvcg_format_ptr {
+	struct uvcg_format	*fmt;
+	struct list_head	entry;
+};
+
+static inline struct uvcg_format *to_uvcg_format(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct uvcg_format, group);
+}
+
+struct uvcg_streaming_header {
+	struct config_item				item;
+	struct uvc_input_header_descriptor		desc;
+	unsigned					linked;
+	struct list_head				formats;
+	unsigned					num_fmt;
+};
+
+static inline struct uvcg_streaming_header *to_uvcg_streaming_header(struct config_item *item)
+{
+	return container_of(item, struct uvcg_streaming_header, item);
+}
+
+struct uvcg_frame {
+	struct config_item	item;
+	enum uvcg_format_type	fmt_type;
+	struct {
+		u8	b_length;
+		u8	b_descriptor_type;
+		u8	b_descriptor_subtype;
+		u8	b_frame_index;
+		u8	bm_capabilities;
+		u16	w_width;
+		u16	w_height;
+		u32	dw_min_bit_rate;
+		u32	dw_max_bit_rate;
+		u32	dw_max_video_frame_buffer_size;
+		u32	dw_default_frame_interval;
+		u8	b_frame_interval_type;
+	} __attribute__((packed)) frame;
+	u32 *dw_frame_interval;
+};
+
+static inline struct uvcg_frame *to_uvcg_frame(struct config_item *item)
+{
+	return container_of(item, struct uvcg_frame, item);
+}
+
+/* -----------------------------------------------------------------------------
+ * streaming/uncompressed/<NAME>
+ */
+
+struct uvcg_uncompressed {
+	struct uvcg_format		fmt;
+	struct uvc_format_uncompressed	desc;
+};
+
+static inline struct uvcg_uncompressed *to_uvcg_uncompressed(struct config_item *item)
+{
+	return container_of(to_uvcg_format(item), struct uvcg_uncompressed, fmt);
+}
+
+/* -----------------------------------------------------------------------------
+ * streaming/mjpeg/<NAME>
+ */
+
+struct uvcg_mjpeg {
+	struct uvcg_format		fmt;
+	struct uvc_format_mjpeg		desc;
+};
+
+static inline struct uvcg_mjpeg *to_uvcg_mjpeg(struct config_item *item)
+{
+	return container_of(to_uvcg_format(item), struct uvcg_mjpeg, fmt);
+}
 
 int uvcg_attach_configfs(struct f_uvc_opts *opts);
 
-- 
2.30.2

