Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29AB81604FC
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2020 18:27:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728527AbgBPR1H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Feb 2020 12:27:07 -0500
Received: from asav22.altibox.net ([109.247.116.9]:50690 "EHLO
        asav22.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728499AbgBPR1G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Feb 2020 12:27:06 -0500
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav22.altibox.net (Postfix) with ESMTPSA id 25A9D200F1;
        Sun, 16 Feb 2020 18:21:41 +0100 (CET)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     broonie@kernel.org, balbi@kernel.org, lee.jones@linaro.org
Cc:     linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [RFC 7/9] drm: Add Multifunction USB Device display driver
Date:   Sun, 16 Feb 2020 18:21:15 +0100
Message-Id: <20200216172117.49832-8-noralf@tronnes.org>
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
        a=SJz97ENfAAAA:8 a=9BuUX6pRhsC96qv7cPsA:9 a=7yrdoAaASxDrdOGF:21
        a=1pP-XCHQzciLwiWz:21 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Multifunction USB Device has optional support for displays.
LZ4 compression is used if the device supports it.

The driver is MIT licensed in the hope that parts of it can be used on
the BSD's.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/Kconfig       |    2 +
 drivers/gpu/drm/Makefile      |    1 +
 drivers/gpu/drm/mud/Kconfig   |   15 +
 drivers/gpu/drm/mud/Makefile  |    3 +
 drivers/gpu/drm/mud/mud_drm.c | 1198 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/mud/mud_drm.h |  137 ++++
 6 files changed, 1356 insertions(+)
 create mode 100644 drivers/gpu/drm/mud/Kconfig
 create mode 100644 drivers/gpu/drm/mud/Makefile
 create mode 100644 drivers/gpu/drm/mud/mud_drm.c
 create mode 100644 drivers/gpu/drm/mud/mud_drm.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index bfdadc3667e0..8ddc0d0e82cc 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -387,6 +387,8 @@ source "drivers/gpu/drm/aspeed/Kconfig"
 
 source "drivers/gpu/drm/mcde/Kconfig"
 
+source "drivers/gpu/drm/mud/Kconfig"
+
 # Keep legacy drivers last
 
 menuconfig DRM_LEGACY
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 9f1c7c486f88..5a5eab598d39 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -122,3 +122,4 @@ obj-$(CONFIG_DRM_LIMA)  += lima/
 obj-$(CONFIG_DRM_PANFROST) += panfrost/
 obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
 obj-$(CONFIG_DRM_MCDE) += mcde/
+obj-y			+= mud/
diff --git a/drivers/gpu/drm/mud/Kconfig b/drivers/gpu/drm/mud/Kconfig
new file mode 100644
index 000000000000..440e994ca0a2
--- /dev/null
+++ b/drivers/gpu/drm/mud/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+config DRM_MUD
+	tristate "Multifunction USB Device Display"
+	depends on DRM && USB && MFD_MUD
+	select LZ4_COMPRESS
+	select DRM_KMS_HELPER
+
+	select DRM_GEM_CMA_HELPER
+	select DRM_GEM_SHMEM_HELPER
+
+	select BACKLIGHT_CLASS_DEVICE
+	help
+	 This is a KMS driver for Multifunction USB Device displays or display
+	 adapters.
diff --git a/drivers/gpu/drm/mud/Makefile b/drivers/gpu/drm/mud/Makefile
new file mode 100644
index 000000000000..d5941d33bcd9
--- /dev/null
+++ b/drivers/gpu/drm/mud/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+obj-$(CONFIG_DRM_MUD)			+= mud_drm.o
diff --git a/drivers/gpu/drm/mud/mud_drm.c b/drivers/gpu/drm/mud/mud_drm.c
new file mode 100644
index 000000000000..51ba756940fd
--- /dev/null
+++ b/drivers/gpu/drm/mud/mud_drm.c
@@ -0,0 +1,1198 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2020 Noralf Trønnes
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/mfd/mud.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/usb.h>
+#include <linux/wait.h>
+#include <linux/workqueue.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_file.h>
+#include <drm/drm_format_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_cma_helper.h>
+//#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_rect.h>
+#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "mud_drm.h"
+
+/*
+ * freerun: Userspace is told that the flush happended immediately, before the worker has begun.
+ *          Useful if the rendering loop handles several displays one after the other.
+ * steady:  Notify userspace at a fixed interval (FPS).
+ * inline:  Do flushing before returning to userspace from the update function.
+ *
+ * Rationale:
+ * In a worst case scenario a full buffer update can take 1 second.
+ *
+ * I believe Wayland/Weston has one rendering loop per display/device and if so doesn't need any special treatment.
+ * For Xorg I got the impression that it runs everything in one loop and one slow device will slow everything down.
+ * For games on embedded I believe maybe a fixed rate is best.
+ *
+ * I'd appreciate any insight into how userspace operates in this regard.
+ */
+static int pageflip;
+module_param(pageflip, int, 0644);
+MODULE_PARM_DESC(pageflip, "pageflip strategy: 0=freerun, 1=steady, 2=inline [default=0]");
+
+#define MUD_DRM_PAGEFLIP_FREERUN    0
+#define MUD_DRM_PAGEFLIP_STEADY     1
+#define MUD_DRM_PAGEFLIP_INLINE     2
+
+struct mud_drm_damage {
+	struct list_head list;
+	struct drm_rect rect;
+	ktime_t time;
+};
+
+struct mud_drm_device {
+	struct drm_device drm;
+	struct drm_simple_display_pipe pipe;
+	struct usb_device *usb;
+	struct regmap *regmap;
+
+	void *buf;
+	size_t buf_len;
+
+	struct mutex lock;
+
+	bool run;
+	struct workqueue_struct	*workq;
+	struct work_struct work;
+	wait_queue_head_t waitq;
+	struct drm_framebuffer *fb;
+	struct list_head damagelist;
+	unsigned int average_pageflip_ms;
+};
+
+static inline struct mud_drm_device *to_mud_drm_device(struct drm_device *drm)
+{
+	return container_of(drm, struct mud_drm_device, drm);
+}
+
+/*----------------------------------------------------------------------------*/
+/* TODO: Move to drm_encoder.c */
+
+static void drm_encoder_dummy_cleanup(struct drm_encoder *encoder)
+{
+	drm_encoder_cleanup(encoder);
+	kfree(encoder);
+}
+
+static const struct drm_encoder_funcs drm_encoder_dummy_funcs = {
+	.destroy = drm_encoder_dummy_cleanup,
+};
+
+static struct drm_encoder *drm_encoder_create_dummy(struct drm_device *dev, int encoder_type)
+{
+	struct drm_encoder *encoder;
+	int ret;
+
+	encoder = kzalloc(sizeof(*encoder), GFP_KERNEL);
+	if (!encoder)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drm_encoder_init(dev, encoder, &drm_encoder_dummy_funcs,
+			       encoder_type, NULL);
+	if (ret) {
+		kfree(encoder);
+		return ERR_PTR(ret);
+	}
+
+	return encoder;
+}
+
+/*----------------------------------------------------------------------------*/
+/* TODO: Move to drm_simple_kms_helper.c */
+
+static void drm_simple_connector_cleanup(struct drm_connector *connector)
+{
+	drm_connector_cleanup(connector);
+	kfree(connector);
+}
+
+static const struct drm_connector_funcs drm_simple_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_simple_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static struct drm_connector *
+drm_simple_connector_create(struct drm_device *dev, const struct drm_connector_helper_funcs *funcs, int connector_type)
+{
+	struct drm_connector *connector;
+	int ret;
+
+	connector = kzalloc(sizeof(*connector), GFP_KERNEL);
+	if (!connector)
+		return ERR_PTR(-ENOMEM);
+
+	drm_connector_helper_add(connector, funcs);
+	ret = drm_connector_init(dev, connector, &drm_simple_connector_funcs, connector_type);
+	if (ret) {
+		kfree(connector);
+		return ERR_PTR(ret);
+	}
+
+	return connector;
+}
+
+/*----------------------------------------------------------------------------*/
+
+static int mud_drm_read(struct mud_drm_device *mdrm, unsigned int regnr,
+			u32 *vals, size_t val_count)
+{
+	size_t val_len = val_count * sizeof(u32);
+	u32 *val_buf;
+	int ret;
+
+	val_buf = kmalloc(val_len, GFP_KERNEL);
+	if (!val_buf)
+		return -ENOMEM;
+
+	ret = regmap_bulk_read(mdrm->regmap, regnr, val_buf, val_count);
+	if (!ret)
+		memcpy(vals, val_buf, val_len);
+	kfree(val_buf);
+
+	return ret;
+}
+
+static int mud_drm_write(struct mud_drm_device *mdrm, unsigned int regnr,
+			 const u32 *vals, size_t val_count)
+{
+	const u32 *val_buf;
+	int ret;
+
+	if (val_count == 1)
+		return regmap_write(mdrm->regmap, regnr, *vals);
+
+	val_buf = kmemdup(vals, val_count * sizeof(*val_buf), GFP_KERNEL);
+	if (!val_buf)
+		return -ENOMEM;
+
+	ret = regmap_bulk_write(mdrm->regmap, regnr, val_buf, val_count);
+	kfree(val_buf);
+
+	return ret;
+}
+
+static int mud_drm_connector_detect(struct drm_connector *connector,
+				    struct drm_modeset_acquire_ctx *ctx,
+				    bool force)
+{
+	struct mud_drm_device *mdrm = to_mud_drm_device(connector->dev);
+	unsigned int status, regnr;
+	int ret;
+
+	regnr = MUD_DRM_REG_CONNECTOR_STATUS + connector->index;
+	ret = regmap_read(mdrm->regmap, regnr, &status);
+	printk("%s: index=%u, status=%u, ret=%d\n", __func__, connector->index, status, ret);
+	if (ret || status > connector_status_unknown)
+		status = connector_status_disconnected;
+
+	return status;
+}
+
+static void *mud_drm_connector_get_edid(struct drm_connector *connector)
+{
+	struct mud_drm_device *mdrm = to_mud_drm_device(connector->dev);
+	unsigned int edid_len, regnr;
+	void *edid = NULL;
+	int ret;
+
+	regnr = MUD_DRM_REG_CONNECTOR_EDID_LEN + connector->index;
+	ret = regmap_read(mdrm->regmap, regnr, &edid_len);
+	printk("%s: index=%u, edid_len=%u, ret=%d\n", __func__,
+		connector->index, edid_len, ret);
+	if (ret || !edid_len)
+		return NULL;
+
+	edid = kmalloc(edid_len, GFP_KERNEL);
+	if (!edid)
+		return NULL;
+
+	regnr = MUD_DRM_REG_CONNECTOR_EDID + (connector->index * MUD_DRM_CONNECTOR_EDID_BLOCK_MAX);
+	ret = regmap_raw_read(mdrm->regmap, regnr, edid, edid_len);
+	if (ret) {
+		kfree(edid);
+		return NULL;
+	}
+
+	return edid;
+}
+
+static int mud_drm_connector_get_modes(struct drm_connector *connector)
+{
+	struct mud_drm_device *mdrm = to_mud_drm_device(connector->dev);
+	struct mud_drm_display_mode *modes = NULL;
+	struct regmap *regmap = mdrm->regmap;
+	unsigned int i, reg_num_modes, regnr;
+	int ret, num_modes = 0;
+	void *edid = NULL;
+
+	printk("%s: index=%u\n", __func__, connector->index);
+
+	// FIXME: gadget side has: mconn->capabilities |= MUD_DRM_CONNECTOR_CAP_EDID;
+	if (connector->connector_type != DRM_MODE_CONNECTOR_VIRTUAL) {
+		edid = mud_drm_connector_get_edid(connector);
+		drm_connector_update_edid_property(connector, edid);
+	}
+
+	regnr = MUD_DRM_REG_CONNECTOR_MODES_COUNT + connector->index;
+	ret = regmap_read(regmap, regnr, &reg_num_modes);
+	printk("    num_modes=%d, ret=%d\n", reg_num_modes, ret);
+	if (ret) {
+		if (edid)
+			num_modes = drm_add_edid_modes(connector, edid);
+	} else if (reg_num_modes) {
+		modes = kmalloc_array(reg_num_modes, sizeof(*modes), GFP_KERNEL);
+		if (!modes)
+			goto free;
+
+		regnr = MUD_DRM_REG_CONNECTOR_MODES + connector->index;
+		ret = regmap_bulk_read(regmap, regnr, modes,
+				       reg_num_modes * MUD_DRM_DISPLAY_MODE_FIELDS);
+		if (ret)
+			goto free;
+
+		for (i = 0; i < reg_num_modes; i++) {
+			struct drm_display_mode *mode;
+
+			mode = drm_mode_create(connector->dev);
+			if (!mode)
+				goto free;
+
+			mud_drm_to_display_mode(mode, &modes[i]);
+			drm_mode_probed_add(connector, mode);
+			printk("    Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
+			num_modes++;
+		}
+	}
+free:
+	kfree(edid);
+	kfree(modes);
+
+	/* Prevent drm_helper_probe_single_connector_modes() from adding modes */
+	if (!num_modes && connector->status == connector_status_connected)
+		connector->status = connector_status_unknown;
+
+	return num_modes;
+}
+
+static const struct drm_connector_helper_funcs mud_drm_connector_funcs = {
+	.detect_ctx = mud_drm_connector_detect,
+	.get_modes = mud_drm_connector_get_modes,
+};
+
+static int mud_drm_create_tv_properties(struct mud_drm_device *mdrm, struct drm_connector *connector)
+{
+	unsigned int i, num_modes, defval;
+	const char **modes;
+	size_t buf_len;
+	char *buf;
+	int ret;
+
+	ret = regmap_read(mdrm->regmap, MUD_DRM_REG_TV_MODES_COUNT, &num_modes);
+	printk("    MUD_DRM_REG_TV_MODES_COUNT=%u, ret=%d\n", num_modes, ret);
+	if (ret)
+		return ret;
+	if (!num_modes)
+		return -EINVAL;
+
+	buf_len = num_modes * DRM_PROP_NAME_LEN;
+	modes = kmalloc_array(num_modes, sizeof(*modes), GFP_KERNEL);
+	buf = kmalloc(buf_len, GFP_KERNEL);
+	if (!modes || !buf) {
+		ret = -ENOMEM;
+		goto free;
+	}
+
+	ret = regmap_raw_read(mdrm->regmap, MUD_DRM_REG_TV_MODES, buf, buf_len);
+	if (ret)
+		goto free;
+
+	for (i = 0; i < num_modes; i++) {
+		modes[i] = &buf[i * DRM_PROP_NAME_LEN];
+		printk("    names[%u]=%s\n", i, modes[i]);
+	}
+
+	ret = regmap_read(mdrm->regmap, MUD_DRM_REG_CONNECTOR_TV_MODE + connector->index, &defval);
+	printk("    MUD_DRM_REG_CONNECTOR_TV_MODE: %u\n", defval);
+
+	ret = drm_mode_create_tv_properties(connector->dev, num_modes, modes);
+	if (ret)
+		goto free;
+
+	drm_object_attach_property(&connector->base,
+				   connector->dev->mode_config.tv_mode_property,
+				   defval);
+free:
+	kfree(modes);
+	kfree(buf);
+
+	return ret;
+}
+
+static int mud_drm_connector_create(struct mud_drm_device *mdrm, int connector_type)
+{
+	struct drm_device *drm = &mdrm->drm;
+	struct drm_connector *connector;
+	struct drm_encoder *encoder;
+	unsigned int val;
+	int ret;
+
+	connector = drm_simple_connector_create(drm, &mud_drm_connector_funcs, connector_type);
+	if (IS_ERR(connector))
+		return PTR_ERR(connector);
+
+	connector->polled = (DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT);
+
+	printk("%s: index=%u\n", __func__, connector->index);
+
+	ret = regmap_read(mdrm->regmap, MUD_DRM_REG_CONNECTOR_CAPS + connector->index, &val);
+	printk("    MUD_DRM_REG_CONNECTOR_CAPS: %x\n", val);
+	if (ret)
+		return ret;
+
+	if (!(val & (MUD_DRM_CONNECTOR_CAP_MODE | MUD_DRM_CONNECTOR_CAP_EDID))) {
+		printk("\n\nNEED MODE or EDID\n");
+	}
+
+	if (val & MUD_DRM_CONNECTOR_CAP_TV) {
+		ret = mud_drm_create_tv_properties(mdrm, connector);
+		if (ret)
+			printk("FAILED to create tv props, ret=%d\n", ret);
+	}
+
+	/* The first connector is attached to the simple pipe encoder */
+	if (!connector->index) {
+		encoder = &mdrm->pipe.encoder;
+	} else {
+		encoder = drm_encoder_create_dummy(drm, DRM_MODE_ENCODER_NONE);
+		if (IS_ERR(encoder))
+			return PTR_ERR(encoder);
+
+		encoder->possible_crtcs = 1;
+	}
+
+	return drm_connector_attach_encoder(connector, encoder);
+}
+
+static long mud_drm_throughput(ktime_t end, ktime_t begin, size_t len)
+{
+	long throughput;
+
+	throughput = ktime_us_delta(end, begin);
+	throughput = throughput ? (len * 1000) / throughput : 0;
+	throughput = throughput * 1000 / 1024;
+
+	return throughput;
+}
+
+static int mud_drm_fb_copy(struct mud_drm_device *mdrm, struct drm_rect *rect, size_t *len)
+{
+	struct dma_buf_attachment *import_attach;
+	struct mud_drm_damage *damage = NULL;
+	struct drm_framebuffer *fb;
+	ktime_t start = 0;
+	int ret = 0;
+	void *vmap;
+	ktime_t t1, t2;
+
+	mutex_lock(&mdrm->lock);
+
+	if (pageflip == MUD_DRM_PAGEFLIP_STEADY)
+		start = ktime_get();
+
+	fb = mdrm->fb;
+	if (!fb) {
+		ret = -ENOENT;
+		goto unlock;
+	}
+
+	damage = list_first_entry_or_null(&mdrm->damagelist, struct mud_drm_damage, list);
+	if (!damage)
+		goto put_fb;
+
+	list_del(&damage->list);
+
+	*rect = damage->rect;
+
+	printk("Flushing [FB:%d] " DRM_RECT_FMT " dt=%lld ms\n", fb->base.id,
+		DRM_RECT_ARG(rect), ktime_ms_delta(ktime_get(), damage->time));
+
+	*len = drm_rect_width(rect) * drm_rect_height(rect) * fb->format->cpp[0];
+
+	/* Regmap restriction, the register value is 32-bit */
+	if (*len % sizeof(u32)) {
+		int adj_x = drm_rect_width(rect) % sizeof(u32);
+		int adj_y = drm_rect_height(rect) % sizeof(u32);
+		struct drm_rect adj_rect = *rect;
+
+		if (adj_x) {
+			adj_x = sizeof(u32) - adj_x;
+			if (adj_rect.x1 - adj_x >= 0)
+				adj_rect.x1 -= adj_x;
+			else if (adj_rect.x2 + adj_x <= fb->width)
+				adj_rect.x2 += adj_x;
+		}
+
+		if (adj_y) {
+			adj_y = sizeof(u32) - adj_y;
+			if (adj_rect.y1 - adj_y >= 0)
+				adj_rect.y1 -= adj_y;
+			else if (adj_rect.y2 + adj_y <= fb->height)
+				adj_rect.y2 += adj_y;
+		}
+
+		if (drm_rect_width(&adj_rect) % sizeof(u32) || drm_rect_height(&adj_rect) % sizeof(u32))
+			drm_rect_init(rect, 0, 0, fb->width, fb->height);
+		else
+			*rect = adj_rect;
+
+		*len = drm_rect_width(rect) * drm_rect_height(rect) * fb->format->cpp[0];
+		printk("    ADJUSTED " DRM_RECT_FMT "\n", DRM_RECT_ARG(rect));
+	}
+
+	if (*len > mdrm->buf_len) {
+		ret = -E2BIG;
+		goto put_fb;
+	}
+
+	t1 = ktime_get();
+	// FIXME: Kconfig: select DRM_KMS_CMA_HELPER
+	vmap = to_drm_gem_cma_obj(fb->obj[0])->vaddr;
+//	vmap = drm_gem_shmem_vmap(fb->obj[0]);
+	t2 = ktime_get();
+	if (IS_ERR(vmap)) {
+		ret = PTR_ERR(vmap);
+		goto put_fb;
+	}
+
+	printk("  vmap: %lld ms\n", ktime_ms_delta(t2, t1));
+
+	import_attach = fb->obj[0]->import_attach;
+
+	if (import_attach) {
+		ret = dma_buf_begin_cpu_access(import_attach->dmabuf, DMA_FROM_DEVICE);
+		if (ret)
+			goto unmap;
+	}
+
+	/*
+	 * Always copy since we can't pass the shmem buffer straight in since it
+	 * results in sloow uncached reads in the compressor. AND there's src buf stride to consider...
+	 *
+	 * Speed up copy if update is full and stride matches.
+	 */
+	// FIXME: Big endian host
+	if (*len == fb->height * fb->pitches[0])
+		memcpy(mdrm->buf, vmap, *len);
+	else
+		drm_fb_memcpy(mdrm->buf, vmap, fb, rect);
+
+	if (import_attach)
+		ret = dma_buf_end_cpu_access(import_attach->dmabuf, DMA_FROM_DEVICE);
+unmap:
+//	drm_gem_shmem_vunmap(fb->obj[0], vmap);
+
+	if (pageflip == MUD_DRM_PAGEFLIP_STEADY && !ret &&
+	    drm_rect_width(rect) == fb->width && drm_rect_height(rect) == fb->height) {
+		unsigned int duration = ktime_ms_delta(ktime_get(), start);
+		unsigned int old = mdrm->average_pageflip_ms;
+
+		if (!mdrm->average_pageflip_ms)
+			mdrm->average_pageflip_ms = duration;
+		else
+			mdrm->average_pageflip_ms = (duration * 3 / 10) + (mdrm->average_pageflip_ms * 7 / 10);
+		if (old != mdrm->average_pageflip_ms)
+			printk("average_pageflip_ms=%u (%u)\n", mdrm->average_pageflip_ms, old);
+	}
+
+put_fb:
+	if (list_empty(&mdrm->damagelist)) {
+		drm_framebuffer_put(fb);
+		mdrm->fb = NULL;
+	}
+unlock:
+	mutex_unlock(&mdrm->lock);
+
+	kfree(damage);
+
+	return ret;
+}
+
+static int mud_drm_write_rect(struct mud_drm_device *mdrm, struct drm_rect *rect)
+{
+	u32 drect[4];
+
+	drect[0] = rect->x1;
+	drect[1] = rect->y1;
+	drect[2] = drm_rect_width(rect);
+	drect[3] = drm_rect_height(rect);
+
+	return mud_drm_write(mdrm, MUD_DRM_REG_RECT_X, drect, 4);
+}
+
+static void mud_drm_fb_dirty(struct mud_drm_device *mdrm)
+{
+	struct drm_rect rect;
+	size_t len = 0;
+	int ret, idx;
+	bool debug = true;
+	ktime_t t1, t2, t3, t4;
+
+	if (!drm_dev_enter(&mdrm->drm, &idx))
+		return;
+
+	if (debug)
+		t1 = ktime_get();
+
+	ret = mud_drm_fb_copy(mdrm, &rect, &len);
+	if (ret)
+		goto out_exit;
+
+	if (debug)
+		t2 = ktime_get();
+
+	ret = mud_drm_write_rect(mdrm, &rect);
+	if (ret)
+		goto out_exit;
+
+	if (debug)
+		t3 = ktime_get();
+
+	ret = regmap_raw_write(mdrm->regmap, MUD_DRM_REG_BUFFER, mdrm->buf, len);
+
+	if (debug) {
+		t4 = ktime_get();
+
+		if (len >= SZ_64K)
+			printk("   SZ_64K: %lld ms len=%zu\n", ktime_ms_delta(t4, t3), len);
+
+		printk("   out, ret=%d: total %ld kB/s (%lld ms), memcpy %ld kB/s (%lld ms), transfer %ld kB/s (%lld ms)\n",
+			ret,
+			mud_drm_throughput(t4, t1, len),
+			ktime_ms_delta(t4, t1),
+			mud_drm_throughput(t2, t1, len),
+			ktime_ms_delta(t2, t1),
+			mud_drm_throughput(t4, t3, len),
+			ktime_ms_delta(t4, t3)
+			);
+	}
+out_exit:
+	drm_dev_exit(idx);
+}
+
+static void mud_drm_work(struct work_struct *work)
+{
+	struct mud_drm_device *mdrm = container_of(work, struct mud_drm_device, work);
+
+	printk("%s: IN\n", __func__);
+
+	while (mdrm->run) {
+		mud_drm_fb_dirty(mdrm);
+
+		wait_event(mdrm->waitq, !mdrm->run || mdrm->fb);
+
+		printk("%s: LOOP: mdrm->run=%u, mdrm->fb=%px\n", __func__, mdrm->run, mdrm->fb);
+	}
+	printk("%s: OUT\n", __func__);
+}
+
+static bool drm_rect_include(struct drm_rect *r1, const struct drm_rect *r2)
+{
+	return r1->x1 >= r2->x1 && r1->x2 <= r2->x2 && r1->y1 >= r2->y1 && r1->y2 <= r2->y2;
+}
+
+static void mud_drm_fb_mark_dirty(struct mud_drm_device *mdrm,
+				  struct drm_plane_state *old_state,
+				  struct drm_plane_state *state)
+{
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_framebuffer *old_fb = NULL;
+	struct mud_drm_damage *damage;
+	ktime_t time = ktime_get();
+	struct drm_rect rect;
+	bool wakeup = false;
+	bool debug = true;
+	unsigned int num = 0;
+
+	mutex_lock(&mdrm->lock);
+
+	if (debug) {
+		if (!list_empty(&mdrm->damagelist)) {
+			struct list_head *pos;
+
+			list_for_each(pos, &mdrm->damagelist)
+				num++;
+		}
+	}
+
+	wakeup = !mdrm->fb;
+
+	if (mdrm->fb != state->fb) {
+		old_fb = mdrm->fb;
+		drm_framebuffer_get(state->fb);
+		mdrm->fb = state->fb;
+	}
+
+	drm_atomic_helper_damage_iter_init(&iter, old_state, state);
+	drm_atomic_for_each_plane_damage(&iter, &rect) {
+		if (!list_empty(&mdrm->damagelist)) {
+			struct mud_drm_damage *tmp;
+			bool found;
+
+			/* Is the rectangle already covered? */
+			found = false;
+			list_for_each_entry(damage, &mdrm->damagelist, list) {
+				if (drm_rect_include(&rect, &damage->rect)) {
+					found = true;
+					break;
+				}
+			}
+			if (found)
+				continue;
+
+			/* Does the rectangle cover existing ones? */
+			found = false;
+			list_for_each_entry_safe(damage, tmp, &mdrm->damagelist, list) {
+				if (drm_rect_include(&damage->rect, &rect)) {
+					if (!found) {
+						damage->rect = rect;
+						found = true;
+					} else {
+						list_del(&damage->list);
+						kfree(damage);
+					}
+				}
+			}
+			if (found)
+				continue;
+
+			/* Is the rectangle adjacent to an existing one? */
+			found = false;
+			list_for_each_entry_safe(damage, tmp, &mdrm->damagelist, list) {
+				struct drm_rect box = {
+					.x1 = damage->rect.x1 - drm_rect_width(&rect),
+					.x2 = damage->rect.x2 + drm_rect_width(&rect),
+					.y1 = damage->rect.y1 - drm_rect_height(&rect),
+					.y2 = damage->rect.y2 + drm_rect_height(&rect),
+				};
+
+				if (rect.x1 >= box.x1 && rect.x2 <= box.x2 &&
+				    rect.y1 >= box.y1 && rect.y2 <= box.y2) {
+					damage->rect.x1 = min(damage->rect.x1, rect.x1);
+					damage->rect.x2 = max(damage->rect.x2, rect.x2);
+					damage->rect.y1 = min(damage->rect.y1, rect.y1);
+					damage->rect.y2 = max(damage->rect.y2, rect.y2);
+					found = true;
+					break;
+				}
+			}
+			if (found)
+				continue;
+		}
+
+		damage = kzalloc(sizeof(*damage), GFP_KERNEL);
+		if (!damage)
+			break;
+
+		damage->time = time;
+		damage->rect = rect;
+		list_add_tail(&damage->list, &mdrm->damagelist);
+	}
+
+	printk("%s: wakeup=%u, fb=[FB:%d], old_fb=[FB:%d]\n", __func__,
+		wakeup, state->fb->base.id, old_fb ? old_fb->base.id : -1);
+
+	if (debug) {
+		if (!list_empty(&mdrm->damagelist)) {
+			struct list_head *pos;
+			unsigned int num2 = 0;
+
+			list_for_each(pos, &mdrm->damagelist)
+				num2++;
+
+			if (num != num2) {
+				ktime_t t = ktime_get();
+
+				printk("    damagelist: num=%u num2=%u\n", num, num2);
+				list_for_each_entry(damage, &mdrm->damagelist, list)
+					printk("        " DRM_RECT_FMT " dt=%lld ms\n",
+						DRM_RECT_ARG(&damage->rect),
+						ktime_ms_delta(t, damage->time));
+			}
+		} else {
+			printk("    damagelist is empty: num=%u\n", num);
+		}
+	}
+
+	mutex_unlock(&mdrm->lock);
+
+	if (pageflip != MUD_DRM_PAGEFLIP_INLINE && wakeup)
+		wake_up(&mdrm->waitq);
+
+	if (old_fb)
+		drm_framebuffer_put(old_fb);
+}
+
+static int mud_drm_pipe_check(struct drm_simple_display_pipe *pipe,
+			      struct drm_plane_state *plane_state,
+			      struct drm_crtc_state *crtc_state)
+{
+	struct mud_drm_device *mdrm = to_mud_drm_device(pipe->crtc.dev);
+	struct drm_framebuffer *old_fb = pipe->plane.state->fb;
+	struct drm_framebuffer *fb = plane_state->fb;
+	bool check = false;
+	int ret;
+
+	printk("%s:\n", __func__);
+
+	/* FIXME: Should we be flexible and let the device decide this? */
+	/* Only one connector is supported */
+	if (hweight32(crtc_state->connector_mask) > 1)
+		return -EINVAL;
+
+	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
+		const struct drm_display_mode *mode = &crtc_state->mode;
+		int connector_idx = ffs(crtc_state->connector_mask) - 1;
+		struct mud_drm_display_mode dmode;
+
+		printk("    mode_changed=%u, active_changed=%u, connectors_changed=%u",
+			crtc_state->mode_changed, crtc_state->active_changed,
+			crtc_state->connectors_changed);
+		printk("    connector_idx=%d\n", connector_idx);
+
+		if (connector_idx < 0)
+			return -EINVAL;
+
+		/* Regmap restriction */
+		if (fb && (fb->width * fb->height * fb->format->cpp[0]) % sizeof(u32)) {
+			DRM_DEV_DEBUG_KMS(fb->dev->dev,
+				"[FB:%d] Unsupported width(%u)/height(%u)/format(0x%x) combo\n",
+				fb->base.id, fb->width, fb->height, fb->format->format);
+			return -EINVAL;
+		}
+
+		ret = regmap_write(mdrm->regmap, MUD_DRM_REG_SET_CONNECTOR, connector_idx);
+		if (ret) {
+			printk("    MUD_DRM_REG_SET_CONNECTOR: ret=%d\n", ret);
+			return ret;
+		}
+
+		printk("    Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
+
+		mud_drm_from_display_mode(&dmode, mode);
+		ret = mud_drm_write(mdrm, MUD_DRM_REG_SET_MODE, (u32 *)&dmode,
+				    MUD_DRM_DISPLAY_MODE_FIELDS);
+		if (ret) {
+			printk("    MUD_DRM_REG_SET_MODE: ret=%d\n", ret);
+			return ret;
+		}
+
+		check = true;
+	}
+
+	printk("    old_fb=[FB:%d], fb=[FB:%d]\n", old_fb ? old_fb->base.id : -1,
+		fb ? fb->base.id : -1);
+
+	if (fb) {
+		if (!old_fb || old_fb->width != fb->width || old_fb->height != fb->height ||
+		    old_fb->format->format != fb->format->format) {
+			printk("    CREATE FB\n");
+
+			ret = regmap_write(mdrm->regmap, MUD_DRM_REG_SET_FORMAT, fb->format->format);
+			if (ret) {
+				printk("    MUD_DRM_REG_SET_FORMAT: ret=%d\n", ret);
+				return ret;
+			}
+
+			check = true;
+		}
+	}
+
+	if (check) {
+		printk("    RUN CHECK\n");
+
+		ret = regmap_write(mdrm->regmap, MUD_DRM_REG_SET_COMMIT, MUD_DRM_COMMIT_CHECK);
+		if (ret) {
+			printk("    MUD_DRM_REG_SET_COMMIT CHECK: ret=%d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void mud_drm_pipe_update(struct drm_simple_display_pipe *pipe,
+				struct drm_plane_state *old_state)
+{
+	struct mud_drm_device *mdrm = to_mud_drm_device(pipe->crtc.dev);
+	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_framebuffer *fb = state->fb;
+	struct drm_crtc *crtc = &pipe->crtc;
+	ktime_t start = 0, end = 0;
+	int idx, ret = 0;
+
+	if (fb)
+		printk("%s: [FB:%d] flip=%s event=%s\n", __func__,
+			fb->base.id, old_state->fb && fb != old_state->fb ? "yes" : "no",
+			crtc->state->event ? "yes" : "no");
+	else
+		printk("%s: [NOFB] event=%s\n", __func__, crtc->state->event ? "yes" : "no");
+
+	if (!drm_dev_enter(crtc->dev, &idx))
+		goto send_event;
+
+	if (!old_state->fb) {
+		printk("    ENABLE CRTC\n");
+		ret = regmap_write(mdrm->regmap, MUD_DRM_REG_PIPE_ENABLE, 1);
+		if (ret)
+			printk("    MUD_DRM_REG_PIPE_ENABLE=1: ret=%d\n", ret);
+	}
+
+	if (pageflip == MUD_DRM_PAGEFLIP_STEADY)
+		start = ktime_get();
+
+	if (fb)
+		mud_drm_fb_mark_dirty(mdrm, old_state, state);
+
+	if (pageflip == MUD_DRM_PAGEFLIP_STEADY)
+		end = ktime_get();
+
+	if (pageflip == MUD_DRM_PAGEFLIP_INLINE)
+		mud_drm_fb_dirty(mdrm);
+
+	if (fb && drm_atomic_crtc_needs_modeset(crtc->state)) {
+		ret = regmap_write(mdrm->regmap, MUD_DRM_REG_SET_COMMIT, MUD_DRM_COMMIT_APPLY);
+		if (ret)
+			printk("    MUD_DRM_REG_SET_COMMIT: ret=%d\n", ret);
+	}
+
+	if (!fb) {
+		printk("    DISABLE CRTC\n");
+		ret = regmap_write(mdrm->regmap, MUD_DRM_REG_PIPE_ENABLE, 0);
+		if (ret)
+			printk("    MUD_DRM_REG_PIPE_ENABLE=0: ret=%d\n", ret);
+	}
+
+	drm_dev_exit(idx);
+
+send_event:
+	if (crtc->state->event) {
+		if (pageflip == MUD_DRM_PAGEFLIP_STEADY) {
+			unsigned int duration = ktime_ms_delta(end, start);
+
+			if (duration < mdrm->average_pageflip_ms) {
+				printk("pageflip wait %u ms\n", mdrm->average_pageflip_ms - duration);
+				msleep(mdrm->average_pageflip_ms - duration);
+			} else {
+				printk("pageflip nowait -%u ms\n", duration - mdrm->average_pageflip_ms);
+			}
+		}
+
+		spin_lock_irq(&crtc->dev->event_lock);
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+		spin_unlock_irq(&crtc->dev->event_lock);
+	}
+
+	if (ret)
+		printk("%s: Failed to UPDATE: %d\n", __func__, ret);
+}
+
+static void mud_drm_pipe_enable(struct drm_simple_display_pipe *pipe,
+				struct drm_crtc_state *crtc_state,
+				struct drm_plane_state *plane_state)
+{
+	struct mud_drm_device *mdrm = to_mud_drm_device(pipe->crtc.dev);
+
+	printk("%s:\n", __func__);
+
+	mutex_lock(&mdrm->lock);
+	mdrm->run = true;
+	mutex_unlock(&mdrm->lock);
+
+	queue_work(mdrm->workq, &mdrm->work);
+}
+
+static void mud_drm_pipe_disable(struct drm_simple_display_pipe *pipe)
+{
+	struct mud_drm_device *mdrm = to_mud_drm_device(pipe->crtc.dev);
+
+	printk("%s:\n", __func__);
+
+	mutex_lock(&mdrm->lock);
+	mdrm->run = false;
+	mutex_unlock(&mdrm->lock);
+
+	wake_up(&mdrm->waitq);
+	cancel_work_sync(&mdrm->work);
+
+	mutex_lock(&mdrm->lock);
+
+	if (mdrm->fb) {
+		drm_framebuffer_put(mdrm->fb);
+		mdrm->fb = NULL;
+	}
+
+	if (!list_empty(&mdrm->damagelist)) {
+		struct mud_drm_damage *damage, *tmp;
+
+		list_for_each_entry_safe(damage, tmp, &mdrm->damagelist, list) {
+			list_del(&damage->list);
+			kfree(damage);
+		}
+	}
+
+	mutex_unlock(&mdrm->lock);
+}
+
+static const struct drm_simple_display_pipe_funcs mud_drm_pipe_funcs = {
+	.check      = mud_drm_pipe_check,
+	.update	    = mud_drm_pipe_update,
+	.enable	    = mud_drm_pipe_enable,
+	.disable    = mud_drm_pipe_disable,
+	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
+};
+
+static const struct drm_mode_config_funcs mud_drm_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create_with_dirty,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static const uint64_t mud_drm_pipe_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
+static void mud_drm_driver_release(struct drm_device *drm)
+{
+	struct mud_drm_device *mdrm = to_mud_drm_device(drm);
+
+	printk("%s:\n", __func__);
+
+	drm_mode_config_cleanup(drm);
+	drm_dev_fini(drm);
+	vfree(mdrm->buf);
+
+	if (mdrm->workq)
+		destroy_workqueue(mdrm->workq);
+
+	mutex_destroy(&mdrm->lock);
+
+	kfree(mdrm);
+}
+
+DEFINE_DRM_GEM_CMA_FOPS(mud_drm_fops);
+//DEFINE_DRM_GEM_SHMEM_FOPS(mud_drm_fops);
+
+static struct drm_driver mud_drm_drm_driver = {
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
+
+	.name			= "mud_drm",
+	.desc			= "Multifunction USB Device Display",
+	.date			= "20190826",
+	.major			= 1,
+	.minor			= 0,
+
+	.release		= mud_drm_driver_release,
+	.fops			= &mud_drm_fops,
+	DRM_GEM_CMA_VMAP_DRIVER_OPS,
+//	DRM_GEM_SHMEM_DRIVER_OPS,
+};
+
+static int mud_drm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mud_cell_pdata *pdata = dev_get_platdata(dev);
+	unsigned int num_connectors, num_formats;
+	struct mud_drm_device *mdrm;
+	struct drm_device *drm;
+	struct regmap *regmap;
+	u32 vals[4], *formats;
+	int ret, i;
+	struct regmap_config mud_drm_regmap_config = {
+		.reg_bits = 32,
+		.val_bits = 32,
+		.cache_type = REGCACHE_NONE,
+	};
+
+	/* FIXME: Remove if CMA is not used */
+	if (!dev->coherent_dma_mask) {
+		ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
+		if (ret) {
+			dev_warn(dev, "Failed to set dma mask %d\n", ret);
+			return ret;
+		}
+	}
+
+	mdrm = kzalloc(sizeof(*mdrm), GFP_KERNEL);
+	if (!mdrm)
+		return -ENOMEM;
+
+	drm = &mdrm->drm;
+	ret = devm_drm_dev_init(dev, drm, &mud_drm_drm_driver);
+	if (ret) {
+		kfree(mdrm);
+		return ret;
+	}
+
+	drm_mode_config_init(drm);
+	drm->mode_config.funcs = &mud_drm_mode_config_funcs;
+
+	mdrm->usb = interface_to_usbdev(pdata->interface);
+
+	mutex_init(&mdrm->lock);
+
+	INIT_LIST_HEAD(&mdrm->damagelist);
+
+	INIT_WORK(&mdrm->work, mud_drm_work);
+	init_waitqueue_head(&mdrm->waitq);
+
+	mdrm->workq = alloc_workqueue("mud_drm", 0, 0);
+	if (!mdrm->workq)
+		return -ENOMEM;
+
+	regmap = devm_regmap_init_usb(dev, pdata->interface, pdata->index,
+				      &mud_drm_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	mdrm->regmap = regmap;
+
+	mdrm->buf_len = SZ_8M;
+	mdrm->buf = vmalloc(mdrm->buf_len);
+	if (!mdrm->buf)
+		return -ENOMEM;
+
+	ret = mud_drm_read(mdrm, MUD_DRM_REG_MIN_WIDTH, vals, 4);
+	if (ret)
+		return ret;
+
+	drm->mode_config.min_width = vals[0];
+	drm->mode_config.max_width = vals[1];
+	drm->mode_config.min_height = vals[2];
+	drm->mode_config.max_height = vals[3];
+
+	printk("min_width=%u, max_width=%u, min_height=%u, max_height=%u\n",
+		drm->mode_config.min_width, drm->mode_config.max_width,
+		drm->mode_config.min_height, drm->mode_config.max_height);
+
+	ret = regmap_read(regmap, MUD_DRM_REG_FORMATS_COUNT, &num_formats);
+	printk("    MUD_DRM_REG_FORMATS_COUNT=%u, ret=%d\n", num_formats, ret);
+	if (ret)
+		return ret;
+
+	if (!num_formats || num_formats > (MUD_DRM_REG_FORMATS_MAX - MUD_DRM_REG_FORMATS))
+		return -EINVAL;
+
+	formats = devm_kmalloc_array(dev, num_formats, sizeof(u32), GFP_KERNEL);
+	if (!formats)
+		return -ENOMEM;
+
+	ret = regmap_bulk_read(regmap, MUD_DRM_REG_FORMATS, formats, num_formats);
+	printk("    MUD_DRM_REG_FORMATS: ret=%d\n", ret);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < num_formats; i++)
+		printk("      0x%08x\n", formats[i]);
+
+	ret = drm_simple_display_pipe_init(drm, &mdrm->pipe, &mud_drm_pipe_funcs,
+					   formats, num_formats,
+					   mud_drm_pipe_modifiers, NULL);
+	if (ret)
+		return ret;
+
+	drm_plane_enable_fb_damage_clips(&mdrm->pipe.plane);
+
+	devm_kfree(dev, formats);
+
+	ret = regmap_read(regmap, MUD_DRM_REG_NUM_CONNECTORS, &num_connectors);
+	if (ret)
+		return ret;
+
+	printk("MUD_DRM_REG_NUM_CONNECTORS=%u\n", num_connectors);
+
+	if (!num_connectors || num_connectors > 16)
+		return -EINVAL;
+
+	for (i = 0; i < num_connectors; i++) {
+		unsigned int conn_type;
+
+		ret = regmap_read(regmap, MUD_DRM_REG_CONNECTOR_TYPE + i, &conn_type);
+		if (ret)
+			return ret;
+
+		/* REVISIT: This needs to be updated as new types are added */
+		if (conn_type > DRM_MODE_CONNECTOR_SPI)
+			return -EINVAL;
+
+		ret = mud_drm_connector_create(mdrm, conn_type);
+		if (ret)
+			return ret;
+	}
+
+	drm_mode_config_reset(drm);
+
+	drm_kms_helper_poll_init(drm);
+
+	platform_set_drvdata(pdev, drm);
+
+	ret = drm_dev_register(drm, 0);
+	if (ret)
+		return ret;
+
+//	drm_fbdev_generic_setup(drm, 16);
+
+	return 0;
+}
+
+static int mud_drm_remove(struct platform_device *pdev)
+{
+	struct drm_device *drm = platform_get_drvdata(pdev);
+
+	printk("%s:\n", __func__);
+
+	drm_kms_helper_poll_fini(drm);
+	drm_dev_unplug(drm);
+	drm_atomic_helper_shutdown(drm);
+
+	return 0;
+}
+
+static struct platform_driver mud_drm_driver = {
+	.driver.name	= "mud-drm",
+	.probe		= mud_drm_probe,
+	.remove		= mud_drm_remove,
+};
+
+module_platform_driver(mud_drm_driver);
+
+MODULE_ALIAS("platform:mud-drm");
+MODULE_AUTHOR("Noralf Trønnes");
+MODULE_LICENSE("Dual MIT/GPL");
diff --git a/drivers/gpu/drm/mud/mud_drm.h b/drivers/gpu/drm/mud/mud_drm.h
new file mode 100644
index 000000000000..8ace63ed2d42
--- /dev/null
+++ b/drivers/gpu/drm/mud/mud_drm.h
@@ -0,0 +1,137 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2020 Noralf Trønnes
+ */
+
+#ifndef __LINUX_MUD_DRM_H
+#define __LINUX_MUD_DRM_H
+
+#include <drm/drm_modes.h>
+
+#define MUD_DRM_DISPLAY_MODE_FIELDS	15
+
+struct mud_drm_display_mode {
+	u32 clock;
+	u32 hdisplay;
+	u32 hsync_start;
+	u32 hsync_end;
+	u32 htotal;
+	u32 hskew;
+	u32 vdisplay;
+	u32 vsync_start;
+	u32 vsync_end;
+	u32 vtotal;
+	u32 vscan;
+
+	u32 vrefresh;
+
+	u32 flags;
+	u32 type;
+
+	u32 picture_aspect_ratio;
+} __packed;
+
+static inline void mud_drm_from_display_mode(struct mud_drm_display_mode *dst,
+					     const struct drm_display_mode *src)
+{
+	dst->clock = src->clock;
+	dst->hdisplay = src->hdisplay;
+	dst->hsync_start = src->hsync_start;
+	dst->hsync_end = src->hsync_end;
+	dst->htotal = src->htotal;
+	dst->hskew = src->hskew;
+	dst->vdisplay = src->vdisplay;
+	dst->vsync_start = src->vsync_start;
+	dst->vsync_end = src->vsync_end;
+	dst->vtotal = src->vtotal;
+	dst->vscan = src->vscan;
+	dst->vrefresh = src->vrefresh;
+	dst->flags = src->flags;
+	dst->type = src->type;
+	dst->picture_aspect_ratio = src->picture_aspect_ratio;
+}
+
+static inline void mud_drm_to_display_mode(struct drm_display_mode *dst,
+					   const struct mud_drm_display_mode *src)
+{
+	dst->clock = src->clock;
+	dst->hdisplay = src->hdisplay;
+	dst->hsync_start = src->hsync_start;
+	dst->hsync_end = src->hsync_end;
+	dst->htotal = src->htotal;
+	dst->hskew = src->hskew;
+	dst->vdisplay = src->vdisplay;
+	dst->vsync_start = src->vsync_start;
+	dst->vsync_end = src->vsync_end;
+	dst->vtotal = src->vtotal;
+	dst->vscan = src->vscan;
+	dst->vrefresh = src->vrefresh;
+	dst->flags = src->flags;
+	dst->type = src->type;
+	dst->picture_aspect_ratio = src->picture_aspect_ratio;
+	drm_mode_set_name(dst);
+}
+
+#define MUD_DRM_REG_MIN_WIDTH			0x0001
+#define MUD_DRM_REG_MAX_WIDTH			0x0002
+#define MUD_DRM_REG_MIN_HEIGHT			0x0003
+#define MUD_DRM_REG_MAX_HEIGHT			0x0004
+
+#define MUD_DRM_REG_NUM_CONNECTORS		0x0005
+
+#define MUD_DRM_REG_TV_MODES_COUNT		0x0010
+#define MUD_DRM_REG_TV_MODES			0x0011
+
+#define MUD_DRM_REG_PIPE_ENABLE			0x0070
+
+#define MUD_DRM_REG_RECT_X			0x0071
+#define MUD_DRM_REG_RECT_Y			0x0072
+#define MUD_DRM_REG_RECT_WIDTH			0x0073
+#define MUD_DRM_REG_RECT_HEIGHT			0x0074
+
+#define MUD_DRM_REG_SET_CONNECTOR		0x0050
+#define MUD_DRM_REG_SET_MODE			0x0051
+#define MUD_DRM_REG_SET_MODE_MAX		0x005f
+#define MUD_DRM_REG_SET_FORMAT			0x0060
+#define MUD_DRM_REG_SET_COMMIT			0x0061
+  #define MUD_DRM_COMMIT_CHECK			1
+  #define MUD_DRM_COMMIT_APPLY			2
+
+#define MUD_DRM_REG_FORMATS_COUNT		0x0100
+#define MUD_DRM_REG_FORMATS			0x0101
+#define MUD_DRM_REG_FORMATS_MAX			0x01ff
+
+#define MUD_DRM_MAX_CONNECTORS			16
+
+#define MUD_DRM_REG_CONNECTOR_TYPE		0x1000
+#define MUD_DRM_REG_CONNECTOR_CAPS		0x1010
+  #define MUD_DRM_CONNECTOR_CAP_MODE		BIT(0)
+  #define MUD_DRM_CONNECTOR_CAP_EDID		BIT(1)
+  #define MUD_DRM_CONNECTOR_CAP_TV		BIT(2)
+#define MUD_DRM_REG_CONNECTOR_STATUS		0x1020
+#define MUD_DRM_REG_CONNECTOR_EDID_LEN		0x1030
+#define MUD_DRM_REG_CONNECTOR_MODES_COUNT	0x1050
+#define MUD_DRM_REG_CONNECTOR_TV_MODE		0x1070
+#define MUD_DRM_REG_CONNECTOR_EDID		0x2000
+  #define MUD_DRM_CONNECTOR_EDID_BLOCK_MAX	4096
+#define MUD_DRM_REG_CONNECTOR_EDID_MAX		0x5fff // 16 * 4096 / 4 = 16384 = 0x4000
+#define MUD_DRM_REG_CONNECTOR_MODES		0x6000
+  #define MUD_DRM_CONNECTOR_MODES_COUNT_MAX	64
+  #define MUD_DRM_CONNECTOR_MODES_BLOCK_MAX	(MUD_DRM_CONNECTOR_MODES_COUNT_MAX * MUD_DRM_DISPLAY_MODE_FIELDS)
+#define MUD_DRM_REG_CONNECTOR_MODES_MAX		0x14fff // 16 * 64 * (15 * 4) = 61440 = 0xf000
+#define MUD_DRM_REG_CONNECTOR_MAX		0x14fff
+
+#define MUD_DRM_REG_BUFFER			0x10000000
+
+struct mud_drm_gadget;
+
+int mud_drm_gadget_writereg(struct mud_drm_gadget *mdg, unsigned int regnr,
+			    const void *buf, size_t len, u8 compression);
+int mud_drm_gadget_readreg(struct mud_drm_gadget *mdg, unsigned int regnr,
+			   void *buf, size_t *len, u8 compression);
+void mud_drm_gadget_enable(struct mud_drm_gadget *mdg);
+void mud_drm_gadget_disable(struct mud_drm_gadget *mdg);
+struct mud_drm_gadget *mud_drm_gadget_init(unsigned int minor_id,
+					   size_t max_transfer_size);
+
+#endif
-- 
2.23.0

