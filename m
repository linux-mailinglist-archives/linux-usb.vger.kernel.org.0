Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 290E2160502
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2020 18:27:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728495AbgBPR1P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Feb 2020 12:27:15 -0500
Received: from asav22.altibox.net ([109.247.116.9]:50818 "EHLO
        asav22.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728523AbgBPR1O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Feb 2020 12:27:14 -0500
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav22.altibox.net (Postfix) with ESMTPSA id D801E200F7;
        Sun, 16 Feb 2020 18:21:41 +0100 (CET)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     broonie@kernel.org, balbi@kernel.org, lee.jones@linaro.org
Cc:     linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [RFC 9/9] usb: gadget: function: mud: Add display support
Date:   Sun, 16 Feb 2020 18:21:17 +0100
Message-Id: <20200216172117.49832-10-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200216172117.49832-1-noralf@tronnes.org>
References: <20200216172117.49832-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ZvHD1ezG c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10
        a=SJz97ENfAAAA:8 a=pRkQhgFihsD0AXEq5_EA:9 a=a1pVt0SKTu3krwcm:21
        a=wySlcR8iXnGGWabC:21 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add optional display functionality to the Multifunction USB Device.
The bulk of the code is placed in the drm subsystem since it's reaching
into the drm internals.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/mud/Kconfig             |   3 +
 drivers/gpu/drm/mud/Makefile            |   1 +
 drivers/gpu/drm/mud/mud_drm_gadget.c    | 889 ++++++++++++++++++++++++
 drivers/usb/gadget/Kconfig              |  12 +
 drivers/usb/gadget/function/Makefile    |   2 +
 drivers/usb/gadget/function/f_mud_drm.c | 181 +++++
 6 files changed, 1088 insertions(+)
 create mode 100644 drivers/gpu/drm/mud/mud_drm_gadget.c
 create mode 100644 drivers/usb/gadget/function/f_mud_drm.c

diff --git a/drivers/gpu/drm/mud/Kconfig b/drivers/gpu/drm/mud/Kconfig
index 440e994ca0a2..b3c6d073cc9c 100644
--- a/drivers/gpu/drm/mud/Kconfig
+++ b/drivers/gpu/drm/mud/Kconfig
@@ -13,3 +13,6 @@ config DRM_MUD
 	help
 	 This is a KMS driver for Multifunction USB Device displays or display
 	 adapters.
+
+config DRM_MUD_GADGET
+	tristate
diff --git a/drivers/gpu/drm/mud/Makefile b/drivers/gpu/drm/mud/Makefile
index d5941d33bcd9..56d2c39ac0eb 100644
--- a/drivers/gpu/drm/mud/Makefile
+++ b/drivers/gpu/drm/mud/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 
 obj-$(CONFIG_DRM_MUD)			+= mud_drm.o
+obj-$(CONFIG_DRM_MUD_GADGET)		+= mud_drm_gadget.o
diff --git a/drivers/gpu/drm/mud/mud_drm_gadget.c b/drivers/gpu/drm/mud/mud_drm_gadget.c
new file mode 100644
index 000000000000..9395d8b7cefe
--- /dev/null
+++ b/drivers/gpu/drm/mud/mud_drm_gadget.c
@@ -0,0 +1,889 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2020 Noralf Trønnes
+ */
+
+#include <linux/lz4.h>
+#include <linux/module.h>
+#include <linux/regmap_usb.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include <drm/drm_client.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_mode_object.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_rect.h>
+
+#include "mud_drm.h"
+
+/* Temporary debugging aid */
+static unsigned int debug = 8;
+
+#define pdebug(level, fmt, ...)				\
+	if (level <= debug)				\
+		printk(KERN_DEBUG fmt, ##__VA_ARGS__)
+
+struct mud_drm_gadget_connector {
+	struct drm_connector *connector;
+	u32 capabilities;
+	enum drm_connector_status status;
+	unsigned int width_mm;
+	unsigned int height_mm;
+	void *edid;
+	size_t edid_len;
+	struct mud_drm_display_mode *modes;
+	unsigned int num_modes;
+};
+
+struct mud_drm_gadget {
+	struct drm_client_dev client;
+
+	struct mud_drm_gadget_connector *connectors;
+	unsigned int connector_count;
+
+	const u32 *formats;
+	unsigned int format_count;
+
+	struct drm_connector *current_connector;
+	struct mud_drm_display_mode current_mode;
+	u32 current_format;
+
+	unsigned int rect_x;
+	unsigned int rect_y;
+	unsigned int rect_width;
+	unsigned int rect_height;
+
+	struct drm_client_buffer *buffer;
+	struct drm_client_buffer *buffer_check;
+	bool check_ok;
+
+	size_t max_transfer_size;
+	void *work_buf;
+};
+
+static int mud_drm_gadget_probe_connector(struct mud_drm_gadget_connector *mconn)
+{
+	struct drm_connector *connector = mconn->connector;
+	struct drm_device *dev = connector->dev;
+	struct drm_display_mode *mode;
+	unsigned int i = 0;
+	int ret = 0;
+	void *edid;
+
+	pdebug(2, "%s:\n", __func__);
+
+	mutex_lock(&dev->mode_config.mutex);
+
+	connector->funcs->fill_modes(connector,
+				     dev->mode_config.max_width,
+				     dev->mode_config.max_height);
+
+	mconn->width_mm = connector->display_info.width_mm;
+	mconn->height_mm = connector->display_info.height_mm;
+	mconn->status = connector->status;
+
+	mconn->num_modes = 0;
+	list_for_each_entry(mode, &connector->modes, head)
+		mconn->num_modes++;
+
+	pdebug(2, "    num_modes=%u\n", mconn->num_modes);
+
+	if (!mconn->num_modes)
+		goto unlock;
+
+	// FIXME: Checkpatch complains: Reusing the krealloc arg is almost always a bug
+	mconn->modes = krealloc(mconn->modes, mconn->num_modes * sizeof(*mconn->modes), GFP_KERNEL);
+	if (!mconn->modes) {
+		ret = -ENOMEM;
+		mconn->num_modes = 0;
+		goto unlock;
+	}
+
+	list_for_each_entry(mode, &connector->modes, head) {
+		pdebug(2, "    Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
+		mud_drm_from_display_mode(&mconn->modes[i++], mode);
+	}
+
+	if (!connector->edid_blob_ptr)
+		goto unlock;
+
+	edid = connector->edid_blob_ptr->data;
+	mconn->edid_len = connector->edid_blob_ptr->length;
+	pdebug(2, "    edid_len=%zu\n", mconn->edid_len);
+	if (!mconn->edid_len || !edid) {
+		mconn->edid_len = 0;
+		goto unlock;
+	}
+
+	kfree(mconn->edid);
+	mconn->edid = kmemdup(edid, mconn->edid_len, GFP_KERNEL);
+	if (!mconn->edid) {
+		ret = -ENOMEM;
+		mconn->edid_len = 0;
+		goto unlock;
+	}
+
+unlock:
+	mutex_unlock(&dev->mode_config.mutex);
+
+	return ret;
+}
+
+static void mud_drm_gadget_probe_connectors(struct mud_drm_gadget *mdg)
+{
+	unsigned int i;
+
+	for (i = 0; i < mdg->connector_count; i++)
+		mud_drm_gadget_probe_connector(&mdg->connectors[i]);
+}
+
+static int mud_drm_gadget_read_connector(struct mud_drm_gadget *mdg, unsigned int regnr,
+					 void *buf, size_t len)
+{
+	struct mud_drm_gadget_connector *mconn;
+	size_t count = len / sizeof(u32);
+	struct drm_connector *connector;
+	unsigned int index, basereg, i;
+	__le32 *buf32 = buf;
+	size_t offset;
+	u32 val;
+
+	if (regnr < MUD_DRM_REG_CONNECTOR_EDID) {
+		index = (regnr - MUD_DRM_REG_CONNECTOR_TYPE) % MUD_DRM_MAX_CONNECTORS;
+		basereg = regnr - index;
+	} else if (regnr <= MUD_DRM_REG_CONNECTOR_EDID_MAX) {
+		index = (regnr - MUD_DRM_REG_CONNECTOR_EDID) % MUD_DRM_CONNECTOR_EDID_BLOCK_MAX;
+		basereg = MUD_DRM_REG_CONNECTOR_EDID;
+	} else if (regnr <= MUD_DRM_REG_CONNECTOR_MODES_MAX) {
+		index = (regnr - MUD_DRM_REG_CONNECTOR_MODES) % MUD_DRM_CONNECTOR_MODES_BLOCK_MAX;
+		basereg = MUD_DRM_REG_CONNECTOR_MODES;
+	} else {
+		return -EINVAL;
+	}
+
+	pdebug(3, "%s: connector index=%u\n", __func__, index);
+
+	if (index >= mdg->connector_count)
+		return -EINVAL;
+
+	mconn = &mdg->connectors[index];
+	connector = mconn->connector;
+
+	switch (basereg) {
+	case MUD_DRM_REG_CONNECTOR_TV_MODE:
+		// drm_atomic_connector_get_property()
+		drm_modeset_lock(&connector->dev->mode_config.connection_mutex, NULL);
+		val = connector->state ? connector->state->tv.mode : 0;
+		if (!connector->state)
+			pr_err("No Connector state!!!\n");
+		pdebug(4, "    MUD_DRM_REG_CONNECTOR_TV_MODE=%u\n", connector->state->tv.mode);
+		drm_modeset_unlock(&connector->dev->mode_config.connection_mutex);
+		break;
+	case MUD_DRM_REG_CONNECTOR_MODES_COUNT:
+		val = mconn->num_modes;
+		break;
+	case MUD_DRM_REG_CONNECTOR_EDID_LEN:
+		val = mconn->edid_len;
+		break;
+	case MUD_DRM_REG_CONNECTOR_STATUS:
+		val = mconn->status;
+		break;
+	case MUD_DRM_REG_CONNECTOR_CAPS:
+		val = mconn->capabilities;
+		break;
+	case MUD_DRM_REG_CONNECTOR_TYPE:
+		val = mconn->connector->connector_type;
+		break;
+
+	case MUD_DRM_REG_CONNECTOR_EDID:
+		offset = regnr - MUD_DRM_REG_CONNECTOR_EDID - (index * MUD_DRM_CONNECTOR_EDID_BLOCK_MAX);
+
+		pdebug(4, "    MUD_DRM_REG_CONNECTOR_EDID: offset=%zu\n", offset);
+
+		if ((offset + len) > mconn->edid_len)
+			return -EINVAL;
+		memcpy(buf, mconn->edid + offset, len);
+		return 0;
+
+	case MUD_DRM_REG_CONNECTOR_MODES:
+		offset = regnr - MUD_DRM_REG_CONNECTOR_MODES - (index * MUD_DRM_CONNECTOR_MODES_BLOCK_MAX);
+
+		pdebug(4, "    MUD_DRM_REG_CONNECTOR_MODES: offset=%zu, count=%zu\n", offset, count);
+
+		if (offset + count > mconn->num_modes * MUD_DRM_DISPLAY_MODE_FIELDS)
+			return -EINVAL;
+
+		for (i = 0; i < count; i++)
+			buf32[i] = cpu_to_le32(((u32 *)mconn->modes)[i]);
+		return 0;
+
+	default:
+		return -EINVAL;
+	}
+
+	if (count != 1)
+		return -EINVAL;
+
+	*buf32 = cpu_to_le32(val);
+
+	return 0;
+}
+
+static int drm_mud_gadget_tv_mode_property(struct drm_device *drm, u32 *num_modes,
+					   const char **names)
+{
+	struct drm_property *property = drm->mode_config.tv_mode_property;
+	struct drm_property_enum *prop_enum;
+	char *buf;
+
+	if (!property)
+		return -EINVAL;
+
+	*num_modes = 0;
+	list_for_each_entry(prop_enum, &property->enum_list, head)
+		(*num_modes)++;
+
+	pdebug(3, "%s: *num_modes=%u\n", __func__, *num_modes);
+
+	if (!names)
+		return 0;
+
+	buf = kcalloc(*num_modes, DRM_PROP_NAME_LEN, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	*names = buf;
+
+	list_for_each_entry(prop_enum, &property->enum_list, head) {
+		strncpy(buf, prop_enum->name, DRM_PROP_NAME_LEN);
+		buf += 32;
+	}
+
+	return 0;
+}
+
+static bool mud_drm_gadget_check_buffer(struct mud_drm_gadget *mdg,
+					struct drm_client_buffer *buffer,
+					struct drm_display_mode *mode)
+{
+	struct drm_framebuffer *fb;
+
+	if (!buffer)
+		return false;
+
+	fb = buffer->fb;
+
+	return fb->format->format == mdg->current_format &&
+	       fb->width == mode->hdisplay && fb->height == mode->vdisplay;
+}
+
+static int mud_drm_gadget_check(struct mud_drm_gadget *mdg)
+{
+	struct drm_format_name_buf format_name;
+	struct drm_client_buffer *buffer;
+	struct drm_display_mode mode;
+	void *vaddr;
+	int ret;
+
+	memset(&mode, 0, sizeof(mode));
+	mud_drm_to_display_mode(&mode, &mdg->current_mode);
+
+	pdebug(3, "%s:\n", __func__);
+	pdebug(3, "        Format %s\n", drm_get_format_name(mdg->current_format, &format_name));
+	pdebug(3, "        Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(&mode));
+
+	mdg->check_ok = false;
+
+	if (!mode.hdisplay || !mdg->current_format)
+		return -EINVAL;
+
+	if (mdg->buffer_check) {
+		drm_client_framebuffer_delete(mdg->buffer_check);
+		mdg->buffer_check = NULL;
+	}
+
+	if (!mud_drm_gadget_check_buffer(mdg, mdg->buffer, &mode)) {
+		buffer = drm_client_framebuffer_create(&mdg->client, mode.hdisplay, mode.vdisplay,
+						       mdg->current_format);
+		if (IS_ERR(buffer))
+			return PTR_ERR(buffer);
+
+		vaddr = drm_client_buffer_vmap(buffer);
+		if (IS_ERR(vaddr)) {
+			drm_client_framebuffer_delete(buffer);
+			return PTR_ERR(vaddr);
+		}
+
+		mdg->buffer_check = buffer;
+	} else {
+		buffer = mdg->buffer;
+	}
+
+	ret = drm_client_modeset_set(&mdg->client, mdg->current_connector, &mode, buffer->fb);
+	if (ret)
+		return ret;
+
+	//ret = drm_client_modeset_check(&mdg->client);
+
+	mdg->check_ok = true;
+
+	return 0;
+}
+
+static int mud_drm_gadget_commit(struct mud_drm_gadget *mdg)
+{
+	int ret;
+
+	pdebug(3, "%s: check_ok=%s\n", __func__, mdg->check_ok ? "true" : "false");
+
+	if (!mdg->check_ok)
+		return -EINVAL;
+
+	ret = drm_client_modeset_commit(&mdg->client);
+	if (ret)
+		return ret;
+
+	if (mdg->buffer_check) {
+		drm_client_framebuffer_delete(mdg->buffer);
+		mdg->buffer = mdg->buffer_check;
+		mdg->buffer_check = NULL;
+	}
+
+	return 0;
+}
+
+static size_t mud_drm_gadget_write_buffer_rgb565_to_xrgb8888(struct drm_client_buffer *buffer,
+							     const u16 *src16, size_t len,
+							     unsigned int x1, unsigned int x2,
+							     unsigned int y1, unsigned int y2)
+{
+	unsigned int dst_width = buffer->fb->width;
+	unsigned int src_width = x2 - x1;
+	unsigned int x, y;
+	u32 *dst32;
+	u16 val16;
+
+	pdebug(4, "%s: %ux%u+%u+%u\n", __func__, x2 - x1, y2 - y1, x1, y1);
+
+	/* Get the address, it's already mapped */
+	dst32 = drm_client_buffer_vmap(buffer);
+
+	for (y = y1; y < y2; y++) {
+		for (x = x1; x < x2; x++) {
+			val16 = src16[x + (y * src_width)];
+			dst32[x + (y * dst_width)] = ((val16 & 0xf800) << 8) |
+						     ((val16 & 0x07e0) << 5) |
+						     ((val16 & 0x001f) << 3);
+			len -= 2;
+			if (!len)
+				return 0;
+		}
+	}
+
+	return len;
+}
+
+static size_t mud_drm_gadget_write_buffer_memcpy(struct drm_client_buffer *buffer,
+						 const void *src, size_t len,
+						 unsigned int x1, unsigned int x2,
+						 unsigned int y1, unsigned int y2)
+{
+	unsigned int cpp = buffer->fb->format->cpp[0];
+	size_t dst_pitch = buffer->fb->pitches[0];
+	size_t src_pitch = (x2 - x1) * cpp;
+	void *dst;
+
+	pdebug(5, "%s: %ux%u+%u+%u\n", __func__, x2 - x1, y2 - y1, x1, y1);
+
+	/* Get the address, it's already mapped */
+	dst = drm_client_buffer_vmap(buffer);
+	dst += y1 * dst_pitch;
+	dst += x1 * cpp;
+
+	for (; y1 < y2 && len; y1++) {
+		src_pitch = min(src_pitch, len);
+		memcpy(dst, src, src_pitch);
+		src += src_pitch;
+		dst += dst_pitch;
+		len -= src_pitch;
+	}
+
+	return len;
+}
+
+static int mud_drm_gadget_write_buffer(struct mud_drm_gadget *mdg, const void *buf,
+				       size_t offset, size_t len, u8 compression)
+{
+	struct drm_client_buffer *buffer = mdg->buffer ? mdg->buffer : mdg->buffer_check;
+	unsigned int x1 = mdg->rect_x;
+	unsigned int x2 = x1 + mdg->rect_width;
+	unsigned int y1 = mdg->rect_y;
+	unsigned int y2 = y1 + mdg->rect_height;
+	struct drm_framebuffer *fb;
+	int ret;
+
+	if (!buffer)
+		return -ENOMEM;
+
+	fb = buffer->fb;
+
+	pdebug(2, "%s: [FB:%d] %ux%u+%u+%u\n", __func__, fb->base.id,
+	       mdg->rect_width, mdg->rect_height, mdg->rect_x, mdg->rect_y);
+
+	if (!x2 || !y2 || x2 > fb->width || y2 > fb->height)
+		return -EINVAL;
+
+	if (compression & REGMAP_USB_COMPRESSION_LZ4) {
+		bool direct = !x1 && !y1 && x2 == fb->width && y2 == fb->height &&
+			      (x2 * fb->format->cpp[0]) == fb->pitches[0];
+		void *dest = mdg->work_buf;
+
+		/* if src buffer fits dst buffer, decompress directly into dst */
+		if (direct)
+			dest = drm_client_buffer_vmap(buffer);
+
+		ret = LZ4_decompress_safe(buf, dest, len, mdg->max_transfer_size);
+		pdebug(4, "  decompress len=%zu, ret=%d\n", len, ret);
+		if (ret < 0)
+			return -EIO;
+
+		if (direct)
+			return 0;
+
+		buf = mdg->work_buf;
+		len = ret;
+	}
+
+	if (offset + len > (mdg->rect_width * mdg->rect_height * fb->format->cpp[0])) {
+		pr_err("%s: Buffer doesn't fit rectangle\n", __func__);
+		return -EINVAL;
+	}
+
+	/* offset and len are 32-bit aligned */
+
+	if (offset) {
+		unsigned int buf_cpp = fb->format->cpp[0];
+		unsigned int pix_offset = offset / buf_cpp;
+		unsigned int off_x1 = x1 + (pix_offset % buf_cpp);
+		size_t remain;
+
+		y1 += pix_offset / (x2 - x1);
+		pdebug(6, "    buf_cpp=%u, pix_offset=%u, off_x1=%u, x1=%u, y1=%u\n",
+		       buf_cpp, pix_offset, off_x1, x1, y1);
+		if (y1 >= y2)
+			return -EINVAL;
+
+		if (off_x1 != x1) {
+			remain = mud_drm_gadget_write_buffer_memcpy(buffer, buf, len,
+								    off_x1, x2, y1, y1 + 1);
+			if (!remain)
+				return 0;
+
+			buf += len - remain;
+			len = remain;
+			if (++y1 >= y2)
+				return -EINVAL;
+		}
+	}
+
+	len = mud_drm_gadget_write_buffer_memcpy(buffer, buf, len, x1, x2, y1, y2);
+	if (len)
+		pr_err("%s: Failed to write it all: %zu\n", __func__, len);
+
+	return len ? -EIO : 0;
+}
+
+static int mud_drm_gadget_disable_pipe(struct mud_drm_gadget *mdg)
+{
+	int ret;
+
+	pdebug(2, "%s: buffer=%px buffer_check=%px\n",
+	       __func__, mdg->buffer, mdg->buffer_check);
+
+	drm_client_modeset_set(&mdg->client, NULL, NULL, NULL);
+	ret = drm_client_modeset_commit(&mdg->client);
+	if (ret)
+		return ret;
+
+	drm_client_framebuffer_delete(mdg->buffer_check);
+	drm_client_framebuffer_delete(mdg->buffer);
+	mdg->buffer_check = NULL;
+	mdg->buffer = NULL;
+
+	return 0;
+}
+
+int mud_drm_gadget_writereg(struct mud_drm_gadget *mdg, unsigned int regnr,
+			    const void *buf, size_t len, u8 compression)
+{
+	const __le32 *buf32;
+	size_t count;
+	u32 val;
+	int ret;
+
+	pdebug(2, "%s: regnr=0x%02x, len=%zu\n", __func__, regnr, len);
+
+	if (regnr >= MUD_DRM_REG_BUFFER) {
+		size_t offset = (regnr - MUD_DRM_REG_BUFFER) * sizeof(u32);
+
+		pdebug(3, "    MUD_DRM_REG_BUFFER\n");
+		return mud_drm_gadget_write_buffer(mdg, buf, offset, len, compression);
+	}
+
+	if (compression & REGMAP_USB_COMPRESSION_LZ4) {
+		ret = LZ4_decompress_safe(buf, mdg->work_buf, len, mdg->max_transfer_size);
+		pdebug(4, "  decompress len=%zu, ret=%d\n", len, ret);
+		if (ret < 0)
+			return -EIO;
+
+		buf = mdg->work_buf;
+		len = ret;
+	}
+
+	count = len / sizeof(u32);
+	buf32 = buf;
+
+	while (count--) {
+		val = le32_to_cpup(buf32++);
+
+		if (regnr >= MUD_DRM_REG_SET_MODE && regnr <= MUD_DRM_REG_SET_MODE_MAX) {
+			((u32 *)&mdg->current_mode)[regnr - MUD_DRM_REG_SET_MODE] = val;
+		} else {
+			switch (regnr) {
+			case MUD_DRM_REG_PIPE_ENABLE:
+				pdebug(3, "    MUD_DRM_REG_PIPE_ENABLE: %u\n", val);
+				if (val == 0) {
+					ret = mud_drm_gadget_disable_pipe(mdg);
+					if (ret)
+						return ret;
+				}
+				break;
+
+			case MUD_DRM_REG_RECT_X:
+				mdg->rect_x = val;
+				break;
+			case MUD_DRM_REG_RECT_Y:
+				mdg->rect_y = val;
+				break;
+			case MUD_DRM_REG_RECT_WIDTH:
+				mdg->rect_width = val;
+				break;
+			case MUD_DRM_REG_RECT_HEIGHT:
+				mdg->rect_height = val;
+				break;
+
+			case MUD_DRM_REG_SET_CONNECTOR:
+				if (val >= mdg->connector_count)
+					return -EINVAL;
+
+				pdebug(3, "    MUD_DRM_REG_SET_CONNECTOR: %u\n", val);
+				mdg->current_connector = mdg->connectors[val].connector;
+				break;
+
+			case MUD_DRM_REG_SET_FORMAT:
+				pdebug(3, "    MUD_DRM_REG_SET_FORMAT: %u\n", val);
+				mdg->current_format = val;
+				break;
+
+			case MUD_DRM_REG_SET_COMMIT:
+				pdebug(3, "    MUD_DRM_REG_SET_COMMIT: %u\n", val);
+
+				if (val == MUD_DRM_COMMIT_APPLY)
+					ret = mud_drm_gadget_commit(mdg);
+				else
+					ret = mud_drm_gadget_check(mdg);
+				pdebug(3, "        ret=%d\n", ret);
+				if (ret)
+					return ret;
+				break;
+
+			default:
+				pr_err("%s: unknown register: 0x%x\n", __func__, regnr);
+				return -EINVAL;
+			}
+		}
+
+		regnr++;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(mud_drm_gadget_writereg);
+
+int mud_drm_gadget_readreg(struct mud_drm_gadget *mdg, unsigned int regnr,
+			   void *buf, size_t *len, u8 compression)
+{
+	struct drm_device *drm = mdg->client.dev;
+	size_t count = *len / sizeof(u32);
+	__le32 *buf32 = buf;
+	u32 val;
+	int ret;
+
+	/*
+	 * FIXME:
+	 * Should we bother with compression? The host honours our choice.
+	 * EDID and modes are the big ones, only on connector probing.
+	 */
+
+	pdebug(2, "%s: regnr=0x%02x, count=%zu\n", __func__, regnr, count);
+
+	if (regnr >= MUD_DRM_REG_CONNECTOR_TYPE && regnr < MUD_DRM_REG_CONNECTOR_MAX)
+		return mud_drm_gadget_read_connector(mdg, regnr, buf, *len);
+
+	if (regnr == MUD_DRM_REG_TV_MODES) {
+		const char *names;
+
+		ret = drm_mud_gadget_tv_mode_property(drm, &val, &names);
+		if (ret)
+			return ret;
+		if (*len != val * DRM_PROP_NAME_LEN)
+			ret = -EINVAL;
+		else
+			memcpy(buf, names, *len);
+		kfree(names);
+		return ret;
+	}
+
+	while (count--) {
+		if (regnr >= MUD_DRM_REG_FORMATS && regnr <= MUD_DRM_REG_FORMATS_MAX &&
+		    regnr < (MUD_DRM_REG_FORMATS + mdg->format_count)) {
+			val = mdg->formats[regnr - MUD_DRM_REG_FORMATS];
+		} else {
+			switch (regnr) {
+			case MUD_DRM_REG_MIN_WIDTH:
+				val = drm->mode_config.min_width;
+				break;
+			case MUD_DRM_REG_MAX_WIDTH:
+				val = drm->mode_config.max_width;
+				break;
+			case MUD_DRM_REG_MIN_HEIGHT:
+				val = drm->mode_config.min_height;
+				break;
+			case MUD_DRM_REG_MAX_HEIGHT:
+				val = drm->mode_config.max_height;
+				break;
+
+			case MUD_DRM_REG_NUM_CONNECTORS:
+				val = mdg->connector_count;
+				break;
+
+			case MUD_DRM_REG_FORMATS_COUNT:
+				val = mdg->format_count;
+				break;
+
+			case MUD_DRM_REG_TV_MODES_COUNT:
+				ret = drm_mud_gadget_tv_mode_property(drm, &val, NULL);
+				if (ret)
+					return ret;
+				break;
+			default:
+				pr_err("%s: unknown register: 0x%x\n", __func__, regnr);
+				return -EINVAL;
+			}
+		}
+
+		*(buf32++) = cpu_to_le32(val);
+		regnr++;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(mud_drm_gadget_readreg);
+
+void mud_drm_gadget_enable(struct mud_drm_gadget *mdg)
+{
+	pdebug(1, "%s:\n", __func__);
+}
+EXPORT_SYMBOL(mud_drm_gadget_enable);
+
+void mud_drm_gadget_disable(struct mud_drm_gadget *mdg)
+{
+	pdebug(1, "%s:\n", __func__);
+	mud_drm_gadget_disable_pipe(mdg);
+}
+EXPORT_SYMBOL(mud_drm_gadget_disable);
+
+static int drm_mud_gadget_get_formats(struct mud_drm_gadget *mdg)
+{
+	struct drm_device *drm = mdg->client.dev;
+	struct drm_plane *plane;
+	//struct drm_crtc *crtc;
+	unsigned int i;
+	u32 *formats;
+
+	pdebug(1, "%s:\n", __func__);
+	//crtc = drm_crtc_from_index(drm, 0);
+	//plane = crtc->primary;
+
+	drm_for_each_plane(plane, drm) {
+		pdebug(1, "  plane=%px\n", plane);
+		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
+			break;
+	}
+
+	formats = kcalloc(plane->format_count, sizeof(u32), GFP_KERNEL);
+	if (!formats)
+		return -ENOMEM;
+
+	for (i = 0; i < plane->format_count; i++) {
+		struct drm_format_name_buf format_name;
+		const struct drm_format_info *fmt;
+
+		fmt = drm_format_info(plane->format_types[i]);
+		if (fmt->num_planes != 1)
+			continue;
+
+		formats[mdg->format_count++] = plane->format_types[i];
+		pdebug(1, "    %s\n", drm_get_format_name(plane->format_types[i], &format_name));
+	}
+
+	if (mdg->format_count > (MUD_DRM_REG_FORMATS_MAX - MUD_DRM_REG_FORMATS)) {
+		kfree(formats);
+		return -ENOSPC;
+	}
+
+	mdg->formats = formats;
+
+	return 0;
+}
+
+static bool object_has_property(struct drm_mode_object *obj, struct drm_property *property)
+{
+	unsigned int i;
+
+	for (i = 0; i < obj->properties->count; i++)
+		if (obj->properties->properties[i] == property)
+			return true;
+
+	return false;
+}
+
+static void mud_drm_gadget_get_connectors(struct mud_drm_gadget *mdg)
+{
+	struct mud_drm_gadget_connector *connectors = NULL;
+	struct drm_connector_list_iter conn_iter;
+	unsigned int connector_count = 0;
+	struct drm_connector *connector;
+	struct drm_device *drm = mdg->client.dev;
+
+	pdebug(1, "%s:\n", __func__);
+
+	drm_connector_list_iter_begin(drm, &conn_iter);
+	drm_client_for_each_connector_iter(connector, &conn_iter) {
+		struct mud_drm_gadget_connector *tmp, *mconn;
+
+		tmp = krealloc(connectors, (connector_count + 1) * sizeof(*connectors),
+			       GFP_KERNEL | __GFP_ZERO);
+		if (!tmp)
+			break;
+
+		connectors = tmp;
+		drm_connector_get(connector);
+		mconn = &connectors[connector_count++];
+		mconn->connector = connector;
+
+		mconn->capabilities = MUD_DRM_CONNECTOR_CAP_MODE;
+		if (connector->connector_type != DRM_MODE_CONNECTOR_VIRTUAL)
+			mconn->capabilities |= MUD_DRM_CONNECTOR_CAP_EDID;
+		if (object_has_property(&connector->base, drm->mode_config.tv_mode_property))
+			mconn->capabilities |= MUD_DRM_CONNECTOR_CAP_TV;
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	mdg->connectors = connectors;
+	mdg->connector_count = connector_count;
+}
+
+static void mud_drm_gadget_client_unregister(struct drm_client_dev *client)
+{
+	struct mud_drm_gadget *mdg = container_of(client, struct mud_drm_gadget, client);
+	unsigned int i;
+
+	pdebug(1, "%s:\n", __func__);
+
+	vfree(mdg->work_buf);
+	kfree(mdg->formats);
+
+	for (i = 0; i < mdg->connector_count; i++) {
+		struct mud_drm_gadget_connector *mconn = &mdg->connectors[i];
+
+		drm_connector_put(mconn->connector);
+		kfree(mconn->modes);
+		kfree(mconn->edid);
+	}
+	kfree(mdg->connectors);
+
+	drm_client_framebuffer_delete(mdg->buffer_check);
+	drm_client_framebuffer_delete(mdg->buffer);
+	drm_client_release(client);
+	kfree(mdg);
+}
+
+static int mud_drm_gadget_client_hotplug(struct drm_client_dev *client)
+{
+	struct mud_drm_gadget *mdg = container_of(client, struct mud_drm_gadget, client);
+
+	pdebug(1, "%s:\n", __func__);
+
+	mud_drm_gadget_probe_connectors(mdg);
+
+	return 0;
+}
+
+static const struct drm_client_funcs mdg_client_funcs = {
+	.owner		= THIS_MODULE,
+	.unregister	= mud_drm_gadget_client_unregister,
+	.hotplug	= mud_drm_gadget_client_hotplug,
+};
+
+struct mud_drm_gadget *mud_drm_gadget_init(unsigned int minor_id,
+					   size_t max_transfer_size)
+{
+	struct mud_drm_gadget *mdg;
+	void *work_buf;
+	int ret;
+
+	pdebug(1, "%s:\n", __func__);
+
+	mdg = kzalloc(sizeof(*mdg), GFP_KERNEL);
+	work_buf = vmalloc(max_transfer_size);
+	if (!mdg || !work_buf) {
+		ret = -ENOMEM;
+		goto error_free;
+	}
+
+	mdg->max_transfer_size = max_transfer_size;
+	mdg->work_buf = work_buf;
+
+	ret = drm_client_init_from_id(minor_id, &mdg->client, "mud-drm-gadget", &mdg_client_funcs);
+	if (0 && ret)
+		goto error_free;
+
+	/* From this point on we can't fail since only a drm_dev_unregister() can unload us */
+
+	if (!ret) {
+		ret = drm_mud_gadget_get_formats(mdg);
+		if (ret)
+			pr_err("ERROR: drm_mud_gadget_get_formats=%d\n", ret);
+
+		mud_drm_gadget_get_connectors(mdg);
+		mud_drm_gadget_probe_connectors(mdg);
+	}
+
+	pdebug(1, "%s: connector_count=%u\n", __func__, mdg->connector_count);
+
+	return mdg;
+
+error_free:
+	vfree(work_buf);
+	kfree(mdg);
+
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(mud_drm_gadget_init);
+
+MODULE_AUTHOR("Noralf Trønnes");
+MODULE_LICENSE("GPL");
diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
index d6285146ec76..e30cb039f35d 100644
--- a/drivers/usb/gadget/Kconfig
+++ b/drivers/usb/gadget/Kconfig
@@ -219,6 +219,9 @@ config USB_F_TCM
 config USB_F_MUD
 	tristate
 
+config USB_F_MUD_DRM
+	tristate
+
 config USB_F_MUD_PINS
 	tristate
 
@@ -498,6 +501,15 @@ menuconfig USB_CONFIGFS_F_MUD
 
 if USB_F_MUD
 
+config USB_CONFIGFS_F_MUD_DRM
+	bool "Multifunction USB Device Display"
+	depends on DRM
+	select DRM_MUD_GADGET
+	select USB_F_MUD_DRM
+	select LZ4_DECOMPRESS
+	help
+	  Display support for the Multifunction USB Device.
+
 config USB_CONFIGFS_F_MUD_PINS
 	bool "Multifunction USB Device GPIO"
 	depends on PINCTRL
diff --git a/drivers/usb/gadget/function/Makefile b/drivers/usb/gadget/function/Makefile
index 2e24227fcc12..d0f93ce6bbe9 100644
--- a/drivers/usb/gadget/function/Makefile
+++ b/drivers/usb/gadget/function/Makefile
@@ -52,5 +52,7 @@ usb_f_tcm-y			:= f_tcm.o
 obj-$(CONFIG_USB_F_TCM)		+= usb_f_tcm.o
 usb_f_mud-y			:= f_mud.o mud_regmap.o
 obj-$(CONFIG_USB_F_MUD)		+= usb_f_mud.o
+usb_f_mud_drm-y			:= f_mud_drm.o
+obj-$(CONFIG_USB_F_MUD_DRM)	+= usb_f_mud_drm.o
 usb_f_mud_pins-y		:= f_mud_pins.o
 obj-$(CONFIG_USB_F_MUD_PINS)	+= usb_f_mud_pins.o
diff --git a/drivers/usb/gadget/function/f_mud_drm.c b/drivers/usb/gadget/function/f_mud_drm.c
new file mode 100644
index 000000000000..5e7ba71f3389
--- /dev/null
+++ b/drivers/usb/gadget/function/f_mud_drm.c
@@ -0,0 +1,181 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2020 Noralf Trønnes
+ */
+
+#include <linux/configfs.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/device.h>
+#include <linux/regmap_usb.h>
+#include <linux/slab.h>
+
+#include "f_mud.h"
+#include "../../../gpu/drm/mud/mud_drm.h"
+
+struct f_mud_drm_cell {
+	struct f_mud_cell cell;
+
+	struct mutex lock;
+	int refcnt;
+
+	int drm_dev;
+	const char *backlight_dev;
+
+	struct mud_drm_gadget *mdg;
+};
+
+static inline struct f_mud_drm_cell *ci_to_f_mud_drm_cell(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct f_mud_drm_cell, cell.group);
+}
+
+static inline struct f_mud_drm_cell *cell_to_f_mud_drm_cell(struct f_mud_cell *cell)
+{
+	return container_of(cell, struct f_mud_drm_cell, cell);
+}
+
+static void f_mud_drm_enable(struct f_mud_cell *cell)
+{
+	struct f_mud_drm_cell *pcell = cell_to_f_mud_drm_cell(cell);
+
+	mud_drm_gadget_enable(pcell->mdg);
+}
+
+static void f_mud_drm_disable(struct f_mud_cell *cell)
+{
+	struct f_mud_drm_cell *pcell = cell_to_f_mud_drm_cell(cell);
+
+	mud_drm_gadget_disable(pcell->mdg);
+}
+
+static int f_mud_drm_writereg(struct f_mud_cell *cell, unsigned int regnr,
+			      const void *buf, size_t len, u8 compression)
+{
+	struct f_mud_drm_cell *pcell = cell_to_f_mud_drm_cell(cell);
+
+	return mud_drm_gadget_writereg(pcell->mdg, regnr, buf, len, compression);
+}
+
+static int f_mud_drm_readreg(struct f_mud_cell *cell, unsigned int regnr,
+			     void *buf, size_t *len, u8 compression)
+{
+	struct f_mud_drm_cell *pcell = cell_to_f_mud_drm_cell(cell);
+
+	return mud_drm_gadget_readreg(pcell->mdg, regnr, buf, len, compression);
+}
+
+static int f_mud_drm_bind(struct f_mud_cell *cell)
+{
+	struct f_mud_drm_cell *pcell = cell_to_f_mud_drm_cell(cell);
+	struct mud_drm_gadget *mdg;
+	int drm_dev, ret = 0;
+
+	printk("%s:\n", __func__);
+
+	mutex_lock(&pcell->lock);
+	drm_dev = pcell->drm_dev;
+	printk("    drm_dev=%d\n", pcell->drm_dev);
+	printk("    backlight_dev='%s'\n", pcell->backlight_dev ? pcell->backlight_dev : "");
+
+	mdg = mud_drm_gadget_init(drm_dev, cell->ops->max_transfer_size);
+	if (IS_ERR(mdg)) {
+		ret = PTR_ERR(mdg);
+		goto out;
+	}
+
+	pcell->mdg = mdg;
+	pcell->refcnt++;
+out:
+	mutex_unlock(&pcell->lock);
+
+	return ret;
+}
+
+static void f_mud_drm_unbind(struct f_mud_cell *cell)
+{
+	struct f_mud_drm_cell *pcell = cell_to_f_mud_drm_cell(cell);
+
+	printk("%s:\n", __func__);
+
+	mutex_lock(&pcell->lock);
+	pcell->refcnt--;
+	mutex_unlock(&pcell->lock);
+}
+
+F_MUD_OPT_INT(f_mud_drm_cell, drm_dev, 0, 63);
+F_MUD_OPT_STR(f_mud_drm_cell, backlight_dev);
+
+static struct configfs_attribute *f_mud_drm_attrs[] = {
+	&f_mud_drm_cell_attr_drm_dev,
+	&f_mud_drm_cell_attr_backlight_dev,
+	NULL,
+};
+
+static struct configfs_item_operations f_mud_drm_item_ops = {
+	.release = f_mud_cell_item_release,
+};
+
+static const struct config_item_type f_mud_drm_func_type = {
+	.ct_item_ops	= &f_mud_drm_item_ops,
+	.ct_attrs	= f_mud_drm_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static void f_mud_drm_free(struct f_mud_cell *cell)
+{
+	struct f_mud_drm_cell *pcell = container_of(cell, struct f_mud_drm_cell, cell);
+
+	printk("%s:\n", __func__);
+
+	mutex_destroy(&pcell->lock);
+	kfree(pcell->backlight_dev);
+	kfree(pcell);
+}
+
+static struct f_mud_cell *f_mud_drm_alloc(void)
+{
+	struct f_mud_drm_cell *pcell;
+
+	printk("%s:\n", __func__);
+
+	pcell = kzalloc(sizeof(*pcell), GFP_KERNEL);
+	if (!pcell)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_init(&pcell->lock);
+	config_group_init_type_name(&pcell->cell.group, "", &f_mud_drm_func_type);
+
+	return &pcell->cell;
+}
+
+static const struct f_mud_cell_ops f_mud_drm_ops = {
+	.name = "mud-drm",
+	.owner = THIS_MODULE,
+
+	/*
+	 * FIXME: Support interrupt for connector hotplug event
+	 * Polling should be a fallback.
+	.interrupt_interval_ms = 1000,
+	 */
+
+	.alloc = f_mud_drm_alloc,
+	.free = f_mud_drm_free,
+	.bind = f_mud_drm_bind,
+	.unbind = f_mud_drm_unbind,
+
+	.regval_bytes = 4,
+	.max_transfer_size = KMALLOC_MAX_SIZE,
+	.compression = REGMAP_USB_COMPRESSION_LZ4,
+
+	.enable = f_mud_drm_enable,
+	.disable = f_mud_drm_disable,
+	.readreg = f_mud_drm_readreg,
+	.writereg = f_mud_drm_writereg,
+};
+
+DECLARE_F_MUD_CELL_INIT(f_mud_drm_ops);
+
+MODULE_AUTHOR("Noralf Trønnes");
+MODULE_LICENSE("GPL");
-- 
2.23.0

