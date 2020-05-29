Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 060AC1E8606
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 19:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728077AbgE2R5V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 13:57:21 -0400
Received: from asav22.altibox.net ([109.247.116.9]:39070 "EHLO
        asav22.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728179AbgE2R5U (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 13:57:20 -0400
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav22.altibox.net (Postfix) with ESMTPSA id D631B200D4;
        Fri, 29 May 2020 19:57:03 +0200 (CEST)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     dri-devel@lists.freedesktop.org, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, sam@ravnborg.org,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v3 4/6] drm: Add Generic USB Display driver
Date:   Fri, 29 May 2020 19:56:41 +0200
Message-Id: <20200529175643.46094-5-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200529175643.46094-1-noralf@tronnes.org>
References: <20200529175643.46094-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=LvK8NEVc c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8 a=gAmX6pxEAAAA:20
        a=e5mUnYsNAAAA:8 a=20KFwNOVAAAA:8 a=JeAX4I3GZd6e_pumDaIA:9
        a=mAfO6kjWG7zrlY3v:21 a=YBBMqVWGHLrF0QmA:21 a=QEXdDO2ut3YA:10
        a=vFet0B0WnEQeilDPIY6i:22 a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This adds a generic USB display driver with the intention that it can be
used with future USB interfaced low end displays/adapters. The Linux
gadget device driver will serve as the canonical device implementation.

The following DRM properties are supported:
- Plane rotation
- Connector TV properties

There is also support for backlight brightness exposed as a backlight
device.

Display modes can be made available to the host driver either as DRM
display modes or through EDID. If both are present, EDID is just passed
on to userspace.

Performance is preferred over color depth, so if the device supports
RGB565, DRM_CAP_DUMB_PREFERRED_DEPTH will return 16.

If the device transfer buffer can't fit an uncompressed framebuffer
update, the update is split up into parts that do fit.

Optimal user experience is achieved by providing damage reports either by
setting FB_DAMAGE_CLIPS on pageflips or calling DRM_IOCTL_MODE_DIRTYFB.

LZ4 compression is used if the device supports it.

The driver supports a one bit monochrome transfer format: R1. This is not
implemented in the gadget driver. It is added in preparation for future
monochrome e-ink displays.

The driver is MIT licensed to smooth the path for any BSD port of the
driver.

v2:
- Use devm_drm_dev_alloc() and drmm_mode_config_init()
- drm_fbdev_generic_setup: Use preferred_bpp=0, 16 was a copy paste error
- The drm_backlight_helper is dropped, copy in the code
- Support protocol version backwards compatibility for device

v3:
- Use donated Openmoko USB pid
- Use direct compression from framebuffer when pitch matches, not only on
  full frames, so split updates can benefit
- Use __le16 in struct gud_drm_req_get_connector_status
- Set edid property when the device only provides edid
- Clear compression fields in struct gud_drm_req_set_buffer
- Fix protocol version negotiation
- Remove mode->vrefresh, it's calculated

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 MAINTAINERS                             |   8 +
 drivers/gpu/drm/Kconfig                 |   2 +
 drivers/gpu/drm/Makefile                |   1 +
 drivers/gpu/drm/gud/Kconfig             |  14 +
 drivers/gpu/drm/gud/Makefile            |   4 +
 drivers/gpu/drm/gud/gud_drm_connector.c | 726 ++++++++++++++++++++++++
 drivers/gpu/drm/gud/gud_drm_drv.c       | 648 +++++++++++++++++++++
 drivers/gpu/drm/gud/gud_drm_internal.h  |  65 +++
 drivers/gpu/drm/gud/gud_drm_pipe.c      | 426 ++++++++++++++
 include/drm/gud_drm.h                   | 361 ++++++++++++
 10 files changed, 2255 insertions(+)
 create mode 100644 drivers/gpu/drm/gud/Kconfig
 create mode 100644 drivers/gpu/drm/gud/Makefile
 create mode 100644 drivers/gpu/drm/gud/gud_drm_connector.c
 create mode 100644 drivers/gpu/drm/gud/gud_drm_drv.c
 create mode 100644 drivers/gpu/drm/gud/gud_drm_internal.h
 create mode 100644 drivers/gpu/drm/gud/gud_drm_pipe.c
 create mode 100644 include/drm/gud_drm.h

diff --git a/MAINTAINERS b/MAINTAINERS
index caeeac9f6b46..b15bf9b2229b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5291,6 +5291,14 @@ S:	Maintained
 F:	drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
 F:	Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
 
+DRM DRIVER FOR GENERIC USB DISPLAY
+M:	Noralf Trønnes <noralf@tronnes.org>
+S:	Maintained
+W:	https://github.com/notro/gud/wiki
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	drivers/gpu/drm/gud/
+F:	include/drm/gud_drm.h
+
 DRM DRIVER FOR GRAIN MEDIA GM12U320 PROJECTORS
 M:	Hans de Goede <hdegoede@redhat.com>
 S:	Maintained
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 4bffa08f610a..33e63b68a82d 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -391,6 +391,8 @@ source "drivers/gpu/drm/mcde/Kconfig"
 
 source "drivers/gpu/drm/tidss/Kconfig"
 
+source "drivers/gpu/drm/gud/Kconfig"
+
 # Keep legacy drivers last
 
 menuconfig DRM_LEGACY
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 53d8fa170143..41a87763f0e5 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -124,3 +124,4 @@ obj-$(CONFIG_DRM_PANFROST) += panfrost/
 obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
 obj-$(CONFIG_DRM_MCDE) += mcde/
 obj-$(CONFIG_DRM_TIDSS) += tidss/
+obj-y			+= gud/
diff --git a/drivers/gpu/drm/gud/Kconfig b/drivers/gpu/drm/gud/Kconfig
new file mode 100644
index 000000000000..767f1c067ed9
--- /dev/null
+++ b/drivers/gpu/drm/gud/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config DRM_GUD
+	tristate "Generic USB Display"
+	depends on DRM && USB
+	select LZ4_COMPRESS
+	select DRM_KMS_HELPER
+	select DRM_GEM_SHMEM_HELPER
+	select BACKLIGHT_CLASS_DEVICE
+	help
+	  This is a DRM display driver for Generic USB Displays or display
+	  adapters.
+
+	  If M is selected the module will be called gud_drm.
diff --git a/drivers/gpu/drm/gud/Makefile b/drivers/gpu/drm/gud/Makefile
new file mode 100644
index 000000000000..73ed7ef3da94
--- /dev/null
+++ b/drivers/gpu/drm/gud/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+gud_drm-objs			:= gud_drm_drv.o gud_drm_pipe.o gud_drm_connector.o
+obj-$(CONFIG_DRM_GUD)		+= gud_drm.o
diff --git a/drivers/gpu/drm/gud/gud_drm_connector.c b/drivers/gpu/drm/gud/gud_drm_connector.c
new file mode 100644
index 000000000000..33cc4e13ffcc
--- /dev/null
+++ b/drivers/gpu/drm/gud/gud_drm_connector.c
@@ -0,0 +1,726 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2020 Noralf Trønnes
+ */
+
+#include <linux/backlight.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_file.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+#include <drm/gud_drm.h>
+
+#include "gud_drm_internal.h"
+
+struct gud_drm_connector {
+	struct drm_connector connector;
+	struct drm_encoder encoder;
+	struct backlight_device *backlight;
+
+	u32 flags;
+
+	/* Supported properties */
+	u16 *properties;
+	unsigned int num_properties;
+
+	/* Initial gadget tv state if applicable, applied on state reset */
+	struct drm_tv_connector_state initial_tv_state;
+
+	/*
+	 * Initial gadget backlight brightness if applicable, applied on state reset.
+	 * The value -ENODEV is used internally to signal no backlight.
+	 */
+	int initial_brightness;
+
+	/* Supported display modes in transfer format */
+	struct gud_drm_display_mode *modes;
+	unsigned int num_modes;
+
+	/* EDID */
+	void *edid;
+	size_t edid_len;
+};
+
+static inline struct gud_drm_connector *to_gud_drm_connector(struct drm_connector *connector)
+{
+	return container_of(connector, struct gud_drm_connector, connector);
+}
+
+static int gud_drm_connector_backlight_update_status(struct backlight_device *bd)
+{
+	struct drm_connector *connector = bl_get_data(bd);
+	struct drm_connector_state *connector_state;
+	struct drm_device *dev = connector->dev;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_atomic_state *state;
+	int ret;
+
+	state = drm_atomic_state_alloc(dev);
+	if (!state)
+		return -ENOMEM;
+
+	drm_modeset_acquire_init(&ctx, 0);
+	state->acquire_ctx = &ctx;
+retry:
+	connector_state = drm_atomic_get_connector_state(state, connector);
+	if (IS_ERR(connector_state)) {
+		ret = PTR_ERR(connector_state);
+		goto out;
+	}
+
+	/* Reuse tv.brightness to avoid having to subclass */
+	connector_state->tv.brightness = bd->props.brightness;
+
+	ret = drm_atomic_commit(state);
+out:
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		drm_modeset_backoff(&ctx);
+		goto retry;
+	}
+
+	drm_atomic_state_put(state);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+
+	return ret;
+}
+
+static int gud_drm_connector_backlight_get_brightness(struct backlight_device *bd)
+{
+	struct drm_connector *connector = bl_get_data(bd);
+	struct drm_device *dev = connector->dev;
+	int brightness;
+
+	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
+	brightness = connector->state->tv.brightness;
+	drm_modeset_unlock(&dev->mode_config.connection_mutex);
+
+	return brightness;
+}
+
+static const struct backlight_ops gud_drm_connector_backlight_ops = {
+	.get_brightness = gud_drm_connector_backlight_get_brightness,
+	.update_status	= gud_drm_connector_backlight_update_status,
+};
+
+static int gud_drm_connector_backlight_register(struct gud_drm_connector *gconn)
+{
+	struct drm_connector *connector = &gconn->connector;
+	struct backlight_device *bd;
+	const char *name;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.scale = BACKLIGHT_SCALE_NON_LINEAR,
+		.max_brightness = 100,
+	};
+
+	name = kasprintf(GFP_KERNEL, "card%d-%s-backlight",
+			 connector->dev->primary->index, connector->name);
+	if (!name)
+		return -ENOMEM;
+
+	bd = backlight_device_register(name, connector->kdev, connector,
+				       &gud_drm_connector_backlight_ops, &props);
+	kfree(name);
+	if (IS_ERR(bd))
+		return PTR_ERR(bd);
+
+	gconn->backlight = bd;
+
+	return 0;
+}
+
+static void gud_drm_connector_modes_clear(struct gud_drm_connector *gconn)
+{
+	kfree(gconn->modes);
+	gconn->modes = NULL;
+	gconn->num_modes = 0;
+}
+
+static int gud_drm_connector_modes_get(struct gud_drm_connector *gconn, unsigned int num_modes)
+{
+	struct gud_drm_device *gdrm = to_gud_drm_device(gconn->connector.dev);
+	unsigned int index = gconn->connector.index;
+	int ret = 0;
+
+	if (!num_modes)
+		goto clear;
+
+	gud_drm_connector_modes_clear(gconn);
+
+	gconn->modes = kmalloc_array(num_modes, sizeof(*gconn->modes), GFP_KERNEL);
+	if (!gconn->modes)
+		return -ENOMEM;
+
+	gconn->num_modes = num_modes;
+
+	ret = gud_drm_usb_get(gdrm, GUD_DRM_USB_REQ_GET_CONNECTOR_MODES, index,
+			      gconn->modes, num_modes * sizeof(*gconn->modes));
+	if (ret)
+		goto clear;
+
+	return 0;
+clear:
+	gud_drm_connector_modes_clear(gconn);
+
+	return ret;
+}
+
+static void gud_drm_connector_edid_clear(struct gud_drm_connector *gconn)
+{
+	kfree(gconn->edid);
+	gconn->edid = NULL;
+	gconn->edid_len = 0;
+}
+
+static int gud_drm_connector_edid_get(struct gud_drm_connector *gconn, size_t len)
+{
+	struct gud_drm_device *gdrm = to_gud_drm_device(gconn->connector.dev);
+	unsigned int index = gconn->connector.index;
+	int ret = 0;
+
+	if (!len)
+		goto clear;
+
+	gud_drm_connector_edid_clear(gconn);
+
+	gconn->edid = kmalloc(len, GFP_KERNEL);
+	if (!gconn->edid)
+		return -ENOMEM;
+
+	gconn->edid_len = len;
+
+	ret = gud_drm_usb_get(gdrm, GUD_DRM_USB_REQ_GET_CONNECTOR_EDID, index, gconn->edid, len);
+	if (ret)
+		goto clear;
+
+	return 0;
+clear:
+	gud_drm_connector_edid_clear(gconn);
+
+	return ret;
+}
+
+static int gud_drm_connector_detect_safe(struct drm_connector *connector, bool force)
+{
+	struct gud_drm_connector *gconn = to_gud_drm_connector(connector);
+	struct gud_drm_device *gdrm = to_gud_drm_device(connector->dev);
+	struct gud_drm_req_get_connector_status req;
+	u16 num_modes, edid_len;
+	int status, ret;
+	bool changed;
+
+	if (force) {
+		ret = gud_drm_usb_set(gdrm, GUD_DRM_USB_REQ_SET_CONNECTOR_FORCE_DETECT,
+				      connector->index, NULL, 0);
+		if (ret)
+			goto free;
+	}
+
+	ret = gud_drm_usb_get(gdrm, GUD_DRM_USB_REQ_GET_CONNECTOR_STATUS,
+			      connector->index, &req, sizeof(req));
+	if (ret)
+		goto free;
+
+	changed = req.status & GUD_DRM_CONNECTOR_STATUS_CHANGED;
+	status = req.status & GUD_DRM_CONNECTOR_STATUS_MASK;
+	if (status > connector_status_unknown)
+		status = connector_status_unknown;
+	num_modes = le16_to_cpu(req.num_modes);
+	edid_len = le16_to_cpu(req.edid_len);
+
+	if (!num_modes && !edid_len) {
+		ret = connector_status_disconnected;
+		goto free;
+	}
+
+	if (!changed && connector->status == status &&
+	    gconn->num_modes == num_modes && gconn->edid_len == edid_len)
+		return status;
+
+	ret = gud_drm_connector_modes_get(gconn, num_modes);
+	if (ret)
+		goto free;
+
+	ret = gud_drm_connector_edid_get(gconn, edid_len);
+	if (ret)
+		goto free;
+
+	return status;
+free:
+	gud_drm_connector_modes_clear(gconn);
+	gud_drm_connector_edid_clear(gconn);
+
+	return ret < 0 ? connector_status_unknown : ret;
+}
+
+static int gud_drm_connector_detect(struct drm_connector *connector,
+				    struct drm_modeset_acquire_ctx *ctx, bool force)
+{
+	int idx, ret;
+
+	if (!drm_dev_enter(connector->dev, &idx))
+		return -ENODEV;
+
+	ret = gud_drm_connector_detect_safe(connector, force);
+
+	drm_dev_exit(idx);
+
+	return ret;
+}
+
+static int gud_drm_connector_get_modes(struct drm_connector *connector)
+{
+	struct gud_drm_connector *gconn = to_gud_drm_connector(connector);
+	unsigned int i, num_modes = 0;
+
+	if (!gconn->num_modes) {
+		num_modes = drm_add_edid_modes(connector, gconn->edid);
+		goto out;
+	}
+
+	for (i = 0; i < gconn->num_modes; i++) {
+		struct drm_display_mode *mode;
+
+		mode = drm_mode_create(connector->dev);
+		if (!mode)
+			goto out;
+
+		gud_drm_to_display_mode(mode, &gconn->modes[i]);
+
+		drm_mode_probed_add(connector, mode);
+		num_modes++;
+	}
+out:
+	if (gconn->edid_len)
+		drm_connector_update_edid_property(connector, gconn->edid);
+
+	return num_modes;
+}
+
+static int gud_drm_connector_atomic_check(struct drm_connector *connector,
+					  struct drm_atomic_state *state)
+{
+	struct drm_connector_state *new_state;
+	struct drm_crtc_state *new_crtc_state;
+	struct drm_connector_state *old_state;
+
+	new_state = drm_atomic_get_new_connector_state(state, connector);
+	if (!new_state->crtc)
+		return 0;
+
+	old_state = drm_atomic_get_old_connector_state(state, connector);
+	new_crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
+
+	if (old_state->tv.subconnector != new_state->tv.subconnector ||
+	    old_state->tv.margins.left != new_state->tv.margins.left ||
+	    old_state->tv.margins.right != new_state->tv.margins.right ||
+	    old_state->tv.margins.top != new_state->tv.margins.top ||
+	    old_state->tv.margins.bottom != new_state->tv.margins.bottom ||
+	    old_state->tv.mode != new_state->tv.mode ||
+	    old_state->tv.brightness != new_state->tv.brightness ||
+	    old_state->tv.contrast != new_state->tv.contrast ||
+	    old_state->tv.flicker_reduction != new_state->tv.flicker_reduction ||
+	    old_state->tv.overscan != new_state->tv.overscan ||
+	    old_state->tv.saturation != new_state->tv.saturation ||
+	    old_state->tv.hue != new_state->tv.hue)
+		new_crtc_state->connectors_changed = true;
+
+	return 0;
+}
+
+static const struct drm_connector_helper_funcs gud_drm_connector_helper_funcs = {
+	.detect_ctx = gud_drm_connector_detect,
+	.get_modes = gud_drm_connector_get_modes,
+	.atomic_check = gud_drm_connector_atomic_check,
+};
+
+static int gud_drm_connector_late_register(struct drm_connector *connector)
+{
+	struct gud_drm_connector *gconn = to_gud_drm_connector(connector);
+
+	if (gconn->initial_brightness < 0)
+		return 0;
+
+	return gud_drm_connector_backlight_register(gconn);
+}
+
+static void gud_drm_connector_early_unregister(struct drm_connector *connector)
+{
+	struct gud_drm_connector *gconn = to_gud_drm_connector(connector);
+
+	backlight_device_unregister(gconn->backlight);
+}
+
+static void gud_drm_connector_destroy(struct drm_connector *connector)
+{
+	struct gud_drm_connector *gconn = to_gud_drm_connector(connector);
+
+	drm_connector_cleanup(connector);
+	gud_drm_connector_modes_clear(gconn);
+	gud_drm_connector_edid_clear(gconn);
+	kfree(gconn->properties);
+	kfree(gconn);
+}
+
+static void gud_drm_connector_reset(struct drm_connector *connector)
+{
+	struct gud_drm_connector *gconn = to_gud_drm_connector(connector);
+
+	drm_atomic_helper_connector_reset(connector);
+	connector->state->tv = gconn->initial_tv_state;
+	/* Set margins from command line */
+	drm_atomic_helper_connector_tv_reset(connector);
+	if (gconn->initial_brightness >= 0)
+		connector->state->tv.brightness = gconn->initial_brightness;
+}
+
+static const struct drm_connector_funcs gud_drm_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.late_register = gud_drm_connector_late_register,
+	.early_unregister = gud_drm_connector_early_unregister,
+	.destroy = gud_drm_connector_destroy,
+	.reset = gud_drm_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+/*
+ * The tv.mode property is shared among the connectors and its enum names are
+ * driver specific. This means that if more than one connector uses tv.mode,
+ * the enum names has to be the same.
+ */
+static int gud_drm_connector_add_tv_mode(struct gud_drm_device *gdrm,
+					 struct drm_connector *connector, u64 val)
+{
+	unsigned int i, num_modes;
+	const char **modes;
+	size_t buf_len;
+	char *buf;
+	int ret;
+
+	num_modes = val >> GUD_DRM_USB_CONNECTOR_TV_MODE_NUM_SHIFT;
+
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
+	ret = gud_drm_usb_get(gdrm, GUD_DRM_USB_REQ_GET_CONNECTOR_TV_MODE_VALUES,
+			      connector->index, buf, buf_len);
+	if (ret)
+		goto free;
+
+	for (i = 0; i < num_modes; i++)
+		modes[i] = &buf[i * DRM_PROP_NAME_LEN];
+
+	ret = drm_mode_create_tv_properties(connector->dev, num_modes, modes);
+free:
+	kfree(modes);
+	kfree(buf);
+
+	return ret;
+}
+
+static struct drm_property *
+gud_drm_connector_property_lookup(struct drm_connector *connector, u16 prop)
+{
+	struct drm_mode_config *config = &connector->dev->mode_config;
+
+	switch (prop) {
+	case GUD_DRM_PROPERTY_TV_SELECT_SUBCONNECTOR:
+		return config->tv_select_subconnector_property;
+	case GUD_DRM_PROPERTY_TV_LEFT_MARGIN:
+		return config->tv_left_margin_property;
+	case GUD_DRM_PROPERTY_TV_RIGHT_MARGIN:
+		return config->tv_right_margin_property;
+	case GUD_DRM_PROPERTY_TV_TOP_MARGIN:
+		return config->tv_top_margin_property;
+	case GUD_DRM_PROPERTY_TV_BOTTOM_MARGIN:
+		return config->tv_bottom_margin_property;
+	case GUD_DRM_PROPERTY_TV_MODE:
+		return config->tv_mode_property;
+	case GUD_DRM_PROPERTY_TV_BRIGHTNESS:
+		return config->tv_brightness_property;
+	case GUD_DRM_PROPERTY_TV_CONTRAST:
+		return config->tv_contrast_property;
+	case GUD_DRM_PROPERTY_TV_FLICKER_REDUCTION:
+		return config->tv_flicker_reduction_property;
+	case GUD_DRM_PROPERTY_TV_OVERSCAN:
+		return config->tv_overscan_property;
+	case GUD_DRM_PROPERTY_TV_SATURATION:
+		return config->tv_saturation_property;
+	case GUD_DRM_PROPERTY_TV_HUE:
+		return config->tv_hue_property;
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+}
+
+static unsigned int *gud_drm_connector_tv_state_val(u16 prop, struct drm_tv_connector_state *state)
+{
+	switch (prop) {
+	case GUD_DRM_PROPERTY_TV_SELECT_SUBCONNECTOR:
+		return &state->subconnector;
+	case GUD_DRM_PROPERTY_TV_LEFT_MARGIN:
+		return &state->margins.left;
+	case GUD_DRM_PROPERTY_TV_RIGHT_MARGIN:
+		return &state->margins.right;
+	case GUD_DRM_PROPERTY_TV_TOP_MARGIN:
+		return &state->margins.top;
+	case GUD_DRM_PROPERTY_TV_BOTTOM_MARGIN:
+		return &state->margins.bottom;
+	case GUD_DRM_PROPERTY_TV_MODE:
+		return &state->mode;
+	case GUD_DRM_PROPERTY_TV_BRIGHTNESS:
+		return &state->brightness;
+	case GUD_DRM_PROPERTY_TV_CONTRAST:
+		return &state->contrast;
+	case GUD_DRM_PROPERTY_TV_FLICKER_REDUCTION:
+		return &state->flicker_reduction;
+	case GUD_DRM_PROPERTY_TV_OVERSCAN:
+		return &state->overscan;
+	case GUD_DRM_PROPERTY_TV_SATURATION:
+		return &state->saturation;
+	case GUD_DRM_PROPERTY_TV_HUE:
+		return &state->hue;
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+}
+
+static int gud_drm_connector_add_properties(struct gud_drm_device *gdrm,
+					    struct gud_drm_connector *gconn,
+					    unsigned int num_properties)
+{
+	struct drm_device *drm = &gdrm->drm;
+	struct drm_connector *connector = &gconn->connector;
+	struct gud_drm_property *properties;
+	bool need_tv_props = false;
+	unsigned int i;
+	int ret;
+
+	gconn->properties = kcalloc(num_properties, sizeof(*gconn->properties), GFP_KERNEL);
+	if (!gconn->properties)
+		return -ENOMEM;
+
+	properties = kcalloc(num_properties, sizeof(*properties), GFP_KERNEL);
+	if (!properties)
+		return -ENOMEM;
+
+	ret = gud_drm_usb_get(gdrm, GUD_DRM_USB_REQ_GET_CONNECTOR_PROPERTIES, connector->index,
+			      properties, num_properties * sizeof(*properties));
+	if (ret)
+		goto out;
+
+	for (i = 0; i < num_properties; i++) {
+		u16 prop = le16_to_cpu(properties[i].prop);
+		u64 val = le64_to_cpu(properties[i].val);
+
+		drm_dbg(drm, "property: %u = %llu(0x%llx)\n", prop, val, val);
+
+		switch (prop) {
+		case GUD_DRM_PROPERTY_TV_LEFT_MARGIN:
+			fallthrough;
+		case GUD_DRM_PROPERTY_TV_RIGHT_MARGIN:
+			fallthrough;
+		case GUD_DRM_PROPERTY_TV_TOP_MARGIN:
+			fallthrough;
+		case GUD_DRM_PROPERTY_TV_BOTTOM_MARGIN:
+			ret = drm_mode_create_tv_margin_properties(drm);
+			if (ret)
+				goto out;
+			break;
+		case GUD_DRM_PROPERTY_TV_MODE:
+			ret = gud_drm_connector_add_tv_mode(gdrm, connector, val);
+			if (ret)
+				goto out;
+			break;
+		case GUD_DRM_PROPERTY_TV_SELECT_SUBCONNECTOR:
+			fallthrough;
+		case GUD_DRM_PROPERTY_TV_BRIGHTNESS:
+			fallthrough;
+		case GUD_DRM_PROPERTY_TV_CONTRAST:
+			fallthrough;
+		case GUD_DRM_PROPERTY_TV_FLICKER_REDUCTION:
+			fallthrough;
+		case GUD_DRM_PROPERTY_TV_OVERSCAN:
+			fallthrough;
+		case GUD_DRM_PROPERTY_TV_SATURATION:
+			fallthrough;
+		case GUD_DRM_PROPERTY_TV_HUE:
+			need_tv_props = true;
+			break;
+		case GUD_DRM_PROPERTY_BACKLIGHT_BRIGHTNESS:
+			if (val > 100) {
+				ret = -EINVAL;
+				goto out;
+			}
+			gconn->initial_brightness = val;
+			break;
+		default:
+			/* New ones might show up in future devices, skip those we don't know. */
+			drm_dbg(drm, "Unknown property: %u\n", prop);
+			continue;
+		}
+
+		gconn->properties[gconn->num_properties++] = prop;
+	}
+
+	if (!gconn->num_properties)
+		goto out;
+
+	if (need_tv_props) {
+		/* This is a no-op if already added. */
+		ret = drm_mode_create_tv_properties(drm, 0, NULL);
+		if (ret)
+			goto out;
+	}
+
+	for (i = 0; i < num_properties; i++) {
+		u16 prop = le16_to_cpu(properties[i].prop);
+		u64 val = le64_to_cpu(properties[i].val);
+		struct drm_property *property;
+		unsigned int *state_val;
+
+		switch (prop) {
+		case GUD_DRM_PROPERTY_BACKLIGHT_BRIGHTNESS:
+			/* not a DRM property */
+			continue;
+		case GUD_DRM_PROPERTY_TV_MODE:
+			val = val & (BIT(GUD_DRM_USB_CONNECTOR_TV_MODE_NUM_SHIFT) - 1);
+			break;
+		}
+
+		property = gud_drm_connector_property_lookup(connector, prop);
+		if (IS_ERR(property))
+			continue;
+
+		state_val = gud_drm_connector_tv_state_val(prop, &gconn->initial_tv_state);
+		if (IS_ERR(state_val))
+			continue;
+
+		*state_val = val;
+		drm_object_attach_property(&connector->base, property, 0);
+	}
+out:
+	kfree(properties);
+
+	return ret;
+}
+
+int gud_drm_connector_fill_properties(struct drm_connector *connector,
+				      struct drm_connector_state *connector_state,
+				      struct gud_drm_property *properties)
+{
+	struct gud_drm_connector *gconn;
+	unsigned int i;
+
+	gconn = to_gud_drm_connector(connector);
+
+	/* Only interested in the count? */
+	if (!connector_state)
+		return gconn->num_properties;
+
+	for (i = 0; i < gconn->num_properties; i++) {
+		u16 prop = gconn->properties[i];
+		u64 val;
+
+		if (prop == GUD_DRM_PROPERTY_BACKLIGHT_BRIGHTNESS) {
+			val = connector_state->tv.brightness;
+		} else {
+			unsigned int *state_val;
+
+			state_val = gud_drm_connector_tv_state_val(prop, &connector_state->tv);
+			if (WARN_ON_ONCE(IS_ERR(state_val)))
+				return PTR_ERR(state_val);
+
+			val = *state_val;
+		}
+
+		properties[i].prop = cpu_to_le16(prop);
+		properties[i].val = cpu_to_le64(val);
+	}
+
+	return gconn->num_properties;
+}
+
+int gud_drm_connector_create(struct gud_drm_device *gdrm, unsigned int index)
+{
+	struct gud_drm_req_get_connector desc;
+	struct drm_device *drm = &gdrm->drm;
+	struct gud_drm_connector *gconn;
+	struct drm_connector *connector;
+	struct drm_encoder *encoder;
+	int ret;
+
+	ret = gud_drm_usb_get(gdrm, GUD_DRM_USB_REQ_GET_CONNECTOR, index, &desc, sizeof(desc));
+	if (ret)
+		return ret;
+
+	drm_dbg(drm, "index=%u type=%u flags=0x%x num_properties=%u\n", index,
+		desc.connector_type, le32_to_cpu(desc.flags), desc.num_properties);
+
+	/* REVISIT: This needs to be updated as new types are added */
+	if (desc.connector_type > DRM_MODE_CONNECTOR_SPI)
+		return -EINVAL;
+
+	gconn = kzalloc(sizeof(*gconn), GFP_KERNEL);
+	if (!gconn)
+		return -ENOMEM;
+
+	gconn->initial_brightness = -ENODEV;
+	gconn->flags = le32_to_cpu(desc.flags);
+	connector = &gconn->connector;
+
+	drm_connector_helper_add(connector, &gud_drm_connector_helper_funcs);
+	ret = drm_connector_init(drm, connector, &gud_drm_connector_funcs, desc.connector_type);
+	if (ret) {
+		kfree(connector);
+		return ret;
+	}
+
+	if (WARN_ON(connector->index != index))
+		return -EINVAL;
+
+	if (gconn->flags & GUD_DRM_CONNECTOR_FLAGS_POLL)
+		connector->polled = (DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT);
+
+	if (desc.num_properties) {
+		ret = gud_drm_connector_add_properties(gdrm, gconn, desc.num_properties);
+		if (ret) {
+			dev_err(drm->dev, "Failed to add connector/%u properties\n", index);
+			return ret;
+		}
+	}
+
+	/* The first connector is attached to the existing simple pipe encoder */
+	if (!connector->index) {
+		encoder = &gdrm->pipe.encoder;
+	} else {
+		encoder = &gconn->encoder;
+
+		ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
+		if (ret)
+			return ret;
+
+		encoder->possible_crtcs = 1;
+	}
+
+	return drm_connector_attach_encoder(connector, encoder);
+}
diff --git a/drivers/gpu/drm/gud/gud_drm_drv.c b/drivers/gpu/drm/gud/gud_drm_drv.c
new file mode 100644
index 000000000000..e2d72e2ec219
--- /dev/null
+++ b/drivers/gpu/drm/gud/gud_drm_drv.c
@@ -0,0 +1,648 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2020 Noralf Trønnes
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/lz4.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/string_helpers.h>
+#include <linux/usb.h>
+#include <linux/workqueue.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_debugfs.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+#include <drm/gud_drm.h>
+
+#include "gud_drm_internal.h"
+
+/* Only used internally */
+static const struct drm_format_info gud_drm_format_r1 = {
+	.format = GUD_DRM_FORMAT_R1,
+	.num_planes = 1,
+	.char_per_block = { 1, 0, 0 },
+	.block_w = { 8, 0, 0 },
+	.block_h = { 1, 0, 0 },
+	.hsub = 1,
+	.vsub = 1,
+};
+
+static int gud_drm_usb_control_msg(struct usb_device *usb, u8 ifnum, bool in,
+				   u8 request, u16 value, void *buf, size_t len,
+				   bool check_len)
+{
+	u8 requesttype = USB_TYPE_VENDOR | USB_RECIP_INTERFACE;
+	unsigned int pipe;
+	int ret;
+
+	if (in) {
+		pipe = usb_rcvctrlpipe(usb, 0);
+		requesttype |= USB_DIR_IN;
+	} else {
+		pipe = usb_sndctrlpipe(usb, 0);
+		requesttype |= USB_DIR_OUT;
+	}
+
+	ret = usb_control_msg(usb, pipe, request, requesttype, value,
+			      ifnum, buf, len, USB_CTRL_GET_TIMEOUT);
+
+	if (check_len && ret >= 0) {
+		if (ret != len)
+			ret = -EIO;
+		else
+			ret = 0;
+	}
+
+	return ret;
+}
+
+static int gud_get_vendor_descriptor(struct usb_interface *interface,
+				     struct gud_drm_display_descriptor *desc)
+{
+	u8 ifnum = interface->cur_altsetting->desc.bInterfaceNumber;
+	struct usb_device *usb = interface_to_usbdev(interface);
+	void *buf;
+	int ret;
+
+	buf = kmalloc(sizeof(*desc), GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = gud_drm_usb_control_msg(usb, ifnum, true, USB_REQ_GET_DESCRIPTOR,
+				      GUD_DRM_USB_DT_DISPLAY << 8, buf, sizeof(*desc), false);
+
+	memcpy(desc, buf, sizeof(*desc));
+	kfree(buf);
+
+	if (ret < 0)
+		return ret;
+
+	if (ret != sizeof(*desc) || desc->bLength != sizeof(*desc) ||
+	    desc->bDescriptorType != GUD_DRM_USB_DT_DISPLAY)
+		return -ENODATA;
+
+	DRM_DEV_DEBUG_DRIVER(&interface->dev,
+			     "Version=%u Compression=0x%x NumFormats=%u NumConnectors=%u MaxBufferSizeOrder=%u\n",
+			     desc->bVersion, desc->bCompression, desc->bNumFormats,
+			     desc->bNumConnectors, desc->bMaxBufferSizeOrder);
+
+	if (!desc->bVersion || !desc->bNumFormats || !desc->bNumConnectors ||
+	    !desc->bMaxBufferSizeOrder || !desc->dwMaxWidth || !desc->dwMaxHeight ||
+	    le32_to_cpu(desc->dwMinWidth) > le32_to_cpu(desc->dwMaxWidth) ||
+	    le32_to_cpu(desc->dwMinHeight) > le32_to_cpu(desc->dwMaxHeight))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int gud_usb_get_status(struct usb_device *usb, u8 ifnum)
+{
+	struct gud_drm_req_get_status *status;
+	int ret, status_retries = 2000 / 5; /* maximum wait ~2 seconds */
+	unsigned long delay = 500;
+
+	status = kmalloc(sizeof(*status), GFP_KERNEL);
+	if (!status)
+		return -ENOMEM;
+
+	/*
+	 * Poll due to lack of data/status stage control on the gadget side.
+	 *
+	 * If we did not use polling and gave up here after waiting 2 seconds,
+	 * the worker in the gadget would finally get to queuing up the status
+	 * respons, but by that time the host has moved on. The gadget side
+	 * (at least dwc2) would now be left in a non-recoverable state.
+	 *
+	 * Worst case commit timeout in DRM can be tens of seconds (wait for
+	 * various _done completions).
+	 */
+	while (status_retries--) {
+		ret = gud_drm_usb_control_msg(usb, ifnum, true, USB_REQ_GET_STATUS, 0,
+					      status, sizeof(*status), true);
+		if (ret)
+			goto out;
+
+		if (!(status->flags & GUD_DRM_STATUS_PENDING)) {
+			ret = -status->errno;
+			goto out;
+		}
+
+		usleep_range(delay, delay + 1000);
+
+		if (delay < 4500)
+			delay += 1000;
+	}
+
+	ret = -ETIMEDOUT;
+out:
+	kfree(status);
+
+	return ret;
+}
+
+static int gud_usb_transfer(struct gud_drm_device *gdrm, bool in, u8 request,
+			    u16 index, void *buf, size_t len)
+{
+	int idx, ret;
+
+	drm_dbg(&gdrm->drm, "%s: request=0x%x index=%u len=%zu\n",
+		in ? "get" : "set", request, index, len);
+
+	if (len > GUD_DRM_MAX_TRANSFER_SIZE)
+		return -ENOMEM;
+
+	if (!drm_dev_enter(&gdrm->drm, &idx))
+		return -ENODEV;
+
+	mutex_lock(&gdrm->ctrl_lock);
+
+	if (!in && buf)
+		memcpy(gdrm->ctrl_msg_buf, buf, len);
+
+	ret = gud_drm_usb_control_msg(gdrm->usb, gdrm->ifnum, in, request, index,
+				      gdrm->ctrl_msg_buf, len, true);
+
+	/*
+	 * OUT transfers are processed in a worker on the gadget side after
+	 * reception so we always need to check status. IN transfers are
+	 * processed in the interrupt handler and will halt on error letting us
+	 * know something went wrong.
+	 */
+	if (ret || !in) {
+		ret = gud_usb_get_status(gdrm->usb, gdrm->ifnum);
+		if (ret)
+			goto error;
+	}
+
+	if (in && buf)
+		memcpy(buf, gdrm->ctrl_msg_buf, len);
+error:
+	if (ret) {
+		drm_dbg(&gdrm->drm, "ret=%d\n", ret);
+		gdrm->stats_num_errors++;
+	}
+
+	mutex_unlock(&gdrm->ctrl_lock);
+	drm_dev_exit(idx);
+
+	return ret;
+}
+
+int gud_drm_usb_get(struct gud_drm_device *gdrm, u8 request, u16 index, void *buf, size_t len)
+{
+	return gud_usb_transfer(gdrm, true, request, index, buf, len);
+}
+
+int gud_drm_usb_set(struct gud_drm_device *gdrm, u8 request, u16 index, void *buf, size_t len)
+{
+	return gud_usb_transfer(gdrm, false, request, index, buf, len);
+}
+
+int gud_drm_usb_write8(struct gud_drm_device *gdrm, u8 request, u8 val)
+{
+	return gud_drm_usb_set(gdrm, request, 0, &val, sizeof(val));
+}
+
+static int gud_drm_usb_read32(struct gud_drm_device *gdrm, u8 request,
+			      u32 *vals, unsigned int num_vals)
+{
+	unsigned int i;
+	int ret;
+
+	ret = gud_drm_usb_get(gdrm, request, 0, vals, num_vals * sizeof(*vals));
+	if (ret)
+		return ret;
+
+	for (i = 0; i < num_vals; i++)
+		vals[i] = le32_to_cpu((__le32)vals[i]);
+
+	return 0;
+}
+
+static int gud_drm_get_properties(struct gud_drm_device *gdrm, unsigned int num_properties)
+{
+	struct gud_drm_property *properties;
+	unsigned int i;
+	int ret;
+
+	if (!num_properties)
+		return 0;
+
+	gdrm->properties = kcalloc(num_properties, sizeof(*gdrm->properties), GFP_KERNEL);
+	if (!gdrm->properties)
+		return -ENOMEM;
+
+	properties = kcalloc(num_properties, sizeof(*properties), GFP_KERNEL);
+	if (!properties)
+		return -ENOMEM;
+
+	ret = gud_drm_usb_get(gdrm, GUD_DRM_USB_REQ_GET_PROPERTIES, 0,
+			      properties, num_properties * sizeof(*properties));
+	if (ret)
+		goto out;
+
+	for (i = 0; i < num_properties; i++) {
+		u16 prop = le16_to_cpu(properties[i].prop);
+		u64 val = le64_to_cpu(properties[i].val);
+
+		switch (prop) {
+		case GUD_DRM_PROPERTY_ROTATION:
+			ret = drm_plane_create_rotation_property(&gdrm->pipe.plane,
+								 DRM_MODE_ROTATE_0, val);
+			break;
+		default:
+			/* New ones might show up in future devices, skip those we don't know. */
+			drm_dbg(&gdrm->drm, "Unknown property: %u\n", prop);
+			continue;
+		}
+
+		if (ret)
+			goto out;
+
+		gdrm->properties[gdrm->num_properties++] = prop;
+	}
+out:
+	kfree(properties);
+
+	return ret;
+}
+
+static struct drm_gem_object *
+gud_drm_driver_gem_create_object(struct drm_device *dev, size_t size)
+{
+	struct drm_gem_shmem_object *shmem;
+
+	shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
+	if (!shmem)
+		return NULL;
+
+	/*
+	 * This doesn't make a difference on x86, but on ARM (pi4) it was
+	 * necessary to avoid black lines all over and it made it possible to
+	 * compress directly from the framebuffer without performance drop.
+	 */
+	shmem->map_cached = true;
+
+	return &shmem->base;
+}
+
+static int gud_drm_stats_debugfs(struct seq_file *m, void *data)
+{
+	struct drm_info_node *node = m->private;
+	struct gud_drm_device *gdrm = to_gud_drm_device(node->minor->dev);
+	char buf[10];
+
+	string_get_size(gdrm->bulk_len, 1, STRING_UNITS_2, buf, sizeof(buf));
+	seq_printf(m, "Max buffer size: %s\n", buf);
+	seq_printf(m, "Number of errors:  %u\n", gdrm->stats_num_errors);
+
+	seq_puts(m, "Compression:      ");
+	if (gdrm->compression & GUD_DRM_COMPRESSION_LZ4)
+		seq_puts(m, " lz4");
+	seq_puts(m, "\n");
+
+	if (gdrm->compression) {
+		u64 remainder;
+		u64 ratio = div64_u64_rem(gdrm->stats_length, gdrm->stats_actual_length,
+					  &remainder);
+		u64 ratio_frac = div64_u64(remainder * 10, gdrm->stats_actual_length);
+
+		seq_printf(m, "Compression ratio: %llu.%llu\n", ratio, ratio_frac);
+	}
+
+	return 0;
+}
+
+static const struct drm_info_list gud_drm_debugfs_list[] = {
+	{ "stats", gud_drm_stats_debugfs, 0, NULL },
+};
+
+static void gud_drm_driver_debugfs_init(struct drm_minor *minor)
+{
+	drm_debugfs_create_files(gud_drm_debugfs_list, ARRAY_SIZE(gud_drm_debugfs_list),
+				 minor->debugfs_root, minor);
+}
+
+static const struct drm_simple_display_pipe_funcs gud_drm_pipe_funcs = {
+	.check      = gud_drm_pipe_check,
+	.update	    = gud_drm_pipe_update,
+	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
+};
+
+static const struct drm_mode_config_funcs gud_drm_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create_with_dirty,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static const uint64_t gud_drm_pipe_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
+DEFINE_DRM_GEM_FOPS(gud_drm_fops);
+
+static struct drm_driver gud_drm_driver = {
+	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
+	.fops			= &gud_drm_fops,
+	.gem_create_object	= gud_drm_driver_gem_create_object,
+	DRM_GEM_SHMEM_DRIVER_OPS,
+	.debugfs_init		= gud_drm_driver_debugfs_init,
+
+	.name			= "gud_drm",
+	.desc			= "Generic USB Display",
+	.date			= "20200422",
+	.major			= 1,
+	.minor			= 0,
+};
+
+static void gud_drm_free_buffers_and_mutex(void *data)
+{
+	struct gud_drm_device *gdrm = data;
+
+	/* Access to these are protected by drm_dev_enter/exit */
+
+	kfree(gdrm->properties);
+	vfree(gdrm->compress_buf);
+	kfree(gdrm->bulk_buf);
+	kfree(gdrm->ctrl_msg_buf);
+	gdrm->properties = NULL;
+	gdrm->compress_buf = NULL;
+	gdrm->bulk_buf = NULL;
+	gdrm->ctrl_msg_buf = NULL;
+
+	mutex_destroy(&gdrm->ctrl_lock);
+	mutex_destroy(&gdrm->damage_lock);
+}
+
+static int gud_drm_probe(struct usb_interface *interface,
+			 const struct usb_device_id *id)
+{
+	u8 ifnum = interface->cur_altsetting->desc.bInterfaceNumber;
+	struct usb_device *usb = interface_to_usbdev(interface);
+	struct device *dev = &interface->dev;
+	const struct drm_format_info *xrgb8888_emulation_format = NULL;
+	u32 *formats, *formats_dev, num_connectors, num_formats = 0;
+	bool rgb565_supported = false, rgb8888_supported = false;
+	struct usb_endpoint_descriptor *bulk_out;
+	struct gud_drm_display_descriptor desc;
+	struct gud_drm_device *gdrm;
+	struct drm_device *drm;
+	size_t max_buffer_size;
+	int ret, i;
+
+	ret = usb_find_bulk_out_endpoint(interface->cur_altsetting, &bulk_out);
+	if (ret)
+		return ret;
+
+	ret = gud_get_vendor_descriptor(interface, &desc);
+	if (ret) {
+		DRM_DEV_DEBUG_DRIVER(dev, "Not a display interface: ret=%d\n", ret);
+		return -ENODEV;
+	}
+
+	if (desc.bVersion > 1) {
+		u8 *version = kmalloc(sizeof(*version), GFP_KERNEL);
+
+		if (!version)
+			return -ENOMEM;
+
+		/* Check if the device can support us */
+		*version = 1;
+		ret = gud_drm_usb_control_msg(usb, ifnum, false, GUD_DRM_USB_REQ_SET_VERSION,
+					      0, version, sizeof(*version), true);
+		if (!ret)
+			ret = gud_usb_get_status(usb, ifnum);
+		kfree(version);
+		if (ret) {
+			dev_err(dev, "Protocol version %u is not supported\n", desc.bVersion);
+			return -EPROTONOSUPPORT;
+		}
+
+		desc.bVersion = 1;
+	}
+
+	num_connectors = desc.bNumConnectors;
+	max_buffer_size = 1 << desc.bMaxBufferSizeOrder;
+
+	gdrm = devm_drm_dev_alloc(dev, &gud_drm_driver, struct gud_drm_device, drm);
+	if (IS_ERR(gdrm))
+		return PTR_ERR(gdrm);
+
+	drm = &gdrm->drm;
+	drm->mode_config.funcs = &gud_drm_mode_config_funcs;
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
+
+	gdrm->usb = usb;
+	gdrm->ifnum = ifnum;
+	gdrm->compression = desc.bCompression & GUD_DRM_COMPRESSION_LZ4;
+
+	mutex_init(&gdrm->ctrl_lock);
+	mutex_init(&gdrm->damage_lock);
+	INIT_WORK(&gdrm->work, gud_drm_work);
+	gud_drm_clear_damage(gdrm);
+
+	/*
+	 * devm_kmalloc() places struct devres at the beginning of the buffer it
+	 * allocates. This can waste a lot of memory when allocating
+	 * power-of-two sized buffers. Asking for 4k would actually allocate 8k.
+	 */
+
+	ret = devm_add_action_or_reset(dev, gud_drm_free_buffers_and_mutex, gdrm);
+	if (ret)
+		return ret;
+
+	gdrm->ctrl_msg_buf = kmalloc(GUD_DRM_MAX_TRANSFER_SIZE, GFP_KERNEL);
+	if (!gdrm->ctrl_msg_buf)
+		return -ENOMEM;
+retry:
+	gdrm->bulk_buf = kmalloc(max_buffer_size, GFP_KERNEL);
+	if (!gdrm->bulk_buf) {
+		max_buffer_size /= 2;
+		if (max_buffer_size < SZ_2M) { /* Give up if we can't do 1024x768 RGB565 */
+			return -ENOMEM;
+		}
+		goto retry;
+	}
+
+	gdrm->bulk_pipe = usb_sndbulkpipe(gdrm->usb, usb_endpoint_num(bulk_out));
+	gdrm->bulk_len = max_buffer_size;
+
+	if (gdrm->compression & GUD_DRM_COMPRESSION_LZ4) {
+		gdrm->lz4_comp_mem = devm_kmalloc(dev, LZ4_MEM_COMPRESS, GFP_KERNEL);
+		if (!gdrm->lz4_comp_mem)
+			return -ENOMEM;
+
+		gdrm->compress_buf = vmalloc(gdrm->bulk_len);
+		if (!gdrm->compress_buf)
+			return -ENOMEM;
+	}
+
+	drm->mode_config.min_width = le32_to_cpu(desc.dwMinWidth);
+	drm->mode_config.max_width = le32_to_cpu(desc.dwMaxWidth);
+	drm->mode_config.min_height = le32_to_cpu(desc.dwMinHeight);
+	drm->mode_config.max_height = le32_to_cpu(desc.dwMaxHeight);
+
+	formats_dev = devm_kmalloc_array(dev, desc.bNumFormats, sizeof(u32), GFP_KERNEL);
+	/* Add room for emulated XRGB8888 */
+	formats = devm_kmalloc_array(dev, desc.bNumFormats + 1, sizeof(u32), GFP_KERNEL);
+	if (!formats_dev || !formats)
+		return -ENOMEM;
+
+	ret = gud_drm_usb_read32(gdrm, GUD_DRM_USB_REQ_GET_FORMATS, formats_dev, desc.bNumFormats);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < desc.bNumFormats; i++) {
+		const struct drm_format_info *fmt_info;
+		u32 format = formats_dev[i];
+
+		if (format == GUD_DRM_FORMAT_R1) {
+			fmt_info = &gud_drm_format_r1;
+		} else {
+			/* This will trigger a WARN for unknown formats... */
+			fmt_info = drm_format_info(format);
+			if (!fmt_info) {
+				drm_dbg(drm, "Unknown format: 0x%x\n", format);
+				continue;
+			}
+		}
+
+		switch (format) {
+		case DRM_FORMAT_XRGB8888:
+			fallthrough;
+		case DRM_FORMAT_ARGB8888:
+			rgb8888_supported = true;
+			break;
+		case DRM_FORMAT_RGB888:
+			fallthrough;
+		case DRM_FORMAT_BGR888:
+			drm_dbg(drm, "24-bit formats are not supported.\n");
+			continue;
+		case DRM_FORMAT_RGB565:
+			rgb565_supported = true;
+			if (!xrgb8888_emulation_format)
+				xrgb8888_emulation_format = fmt_info;
+			break;
+		case GUD_DRM_FORMAT_R1:
+			if (!xrgb8888_emulation_format)
+				xrgb8888_emulation_format = fmt_info;
+			/* Internal, not for userspace */
+			continue;
+		}
+
+		formats[num_formats++] = format;
+	}
+
+	if (!num_formats && !xrgb8888_emulation_format) {
+		dev_err(dev, "No supported formats found\n");
+		return -ENOENT;
+	}
+
+	/* Prefer speed over color depth */
+	if (rgb565_supported)
+		drm->mode_config.preferred_depth = 16;
+
+	if (!rgb8888_supported && xrgb8888_emulation_format) {
+		gdrm->xrgb8888_emulation_format = xrgb8888_emulation_format;
+		formats[num_formats++] = DRM_FORMAT_XRGB8888;
+	}
+
+	ret = drm_simple_display_pipe_init(drm, &gdrm->pipe, &gud_drm_pipe_funcs,
+					   formats, num_formats,
+					   gud_drm_pipe_modifiers, NULL);
+	if (ret)
+		return ret;
+
+	devm_kfree(dev, formats);
+	devm_kfree(dev, formats_dev);
+
+	ret = gud_drm_get_properties(gdrm, desc.bNumProperties);
+	if (ret)
+		return ret;
+
+	drm_plane_enable_fb_damage_clips(&gdrm->pipe.plane);
+
+	for (i = 0; i < num_connectors; i++) {
+		ret = gud_drm_connector_create(gdrm, i);
+		if (ret)
+			return ret;
+	}
+
+	drm_mode_config_reset(drm);
+
+	usb_set_intfdata(interface, gdrm);
+
+	ret = drm_dev_register(drm, 0);
+	if (ret)
+		return ret;
+
+	drm_kms_helper_poll_init(drm);
+
+	drm_fbdev_generic_setup(drm, 0);
+
+	return 0;
+}
+
+static void gud_drm_disconnect(struct usb_interface *interface)
+{
+	struct gud_drm_device *gdrm = usb_get_intfdata(interface);
+	struct drm_device *drm = &gdrm->drm;
+
+	drm_dbg(drm, "%s:\n", __func__);
+
+	drm_kms_helper_poll_fini(drm);
+	drm_dev_unplug(drm);
+	drm_atomic_helper_shutdown(drm);
+}
+
+static int gud_drm_suspend(struct usb_interface *interface, pm_message_t message)
+{
+	struct gud_drm_device *gdrm = usb_get_intfdata(interface);
+
+	return drm_mode_config_helper_suspend(&gdrm->drm);
+}
+
+static int gud_drm_resume(struct usb_interface *interface)
+{
+	struct gud_drm_device *gdrm = usb_get_intfdata(interface);
+
+	drm_mode_config_helper_resume(&gdrm->drm);
+
+	return 0;
+}
+
+static const struct usb_device_id gud_drm_table[] = {
+	{ USB_DEVICE_INTERFACE_CLASS(0x1d50, 0x614d, USB_CLASS_VENDOR_SPEC) },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(usb, gud_drm_table);
+
+static struct usb_driver gud_drm_usb_driver = {
+	.name		= "gud_drm",
+	.probe		= gud_drm_probe,
+	.disconnect	= gud_drm_disconnect,
+	.id_table	= gud_drm_table,
+	.suspend	= gud_drm_suspend,
+	.resume		= gud_drm_resume,
+	.reset_resume	= gud_drm_resume,
+};
+
+module_usb_driver(gud_drm_usb_driver);
+
+MODULE_AUTHOR("Noralf Trønnes");
+MODULE_LICENSE("Dual MIT/GPL");
diff --git a/drivers/gpu/drm/gud/gud_drm_internal.h b/drivers/gpu/drm/gud/gud_drm_internal.h
new file mode 100644
index 000000000000..2cca502d444e
--- /dev/null
+++ b/drivers/gpu/drm/gud/gud_drm_internal.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef __LINUX_GUD_DRM_INTERNAL_H
+#define __LINUX_GUD_DRM_INTERNAL_H
+
+#include <linux/workqueue.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+
+#include <drm/drm_simple_kms_helper.h>
+
+struct gud_drm_device {
+	struct drm_device drm;
+	struct drm_simple_display_pipe pipe;
+	struct work_struct work;
+	struct usb_device *usb;
+	u8 ifnum;
+	const struct drm_format_info *xrgb8888_emulation_format;
+
+	u16 *properties;
+	unsigned int num_properties;
+
+	unsigned int bulk_pipe;
+	void *bulk_buf;
+	size_t bulk_len;
+
+	u8 compression;
+	void *lz4_comp_mem;
+	void *compress_buf;
+
+	u64 stats_length;
+	u64 stats_actual_length;
+	unsigned int stats_num_errors;
+
+	struct mutex ctrl_lock; /* Serialize req and status transfers */
+	void *ctrl_msg_buf;
+
+	struct mutex damage_lock; /* Protects the following members: */
+	struct drm_framebuffer *fb;
+	struct drm_rect damage;
+};
+
+static inline struct gud_drm_device *to_gud_drm_device(struct drm_device *drm)
+{
+	return container_of(drm, struct gud_drm_device, drm);
+}
+
+int gud_drm_usb_get(struct gud_drm_device *gdrm, u8 request, u16 index, void *buf, size_t len);
+int gud_drm_usb_set(struct gud_drm_device *gdrm, u8 request, u16 index, void *buf, size_t len);
+int gud_drm_usb_write8(struct gud_drm_device *gdrm, u8 request, u8 val);
+
+void gud_drm_clear_damage(struct gud_drm_device *gdrm);
+void gud_drm_work(struct work_struct *work);
+int gud_drm_pipe_check(struct drm_simple_display_pipe *pipe,
+		       struct drm_plane_state *new_plane_state,
+		       struct drm_crtc_state *new_crtc_state);
+void gud_drm_pipe_update(struct drm_simple_display_pipe *pipe,
+			 struct drm_plane_state *old_state);
+
+int gud_drm_connector_fill_properties(struct drm_connector *connector,
+				      struct drm_connector_state *connector_state,
+				      struct gud_drm_property *properties);
+int gud_drm_connector_create(struct gud_drm_device *gdrm, unsigned int index);
+
+#endif
diff --git a/drivers/gpu/drm/gud/gud_drm_pipe.c b/drivers/gpu/drm/gud/gud_drm_pipe.c
new file mode 100644
index 000000000000..d8a3e0ba38fd
--- /dev/null
+++ b/drivers/gpu/drm/gud/gud_drm_pipe.c
@@ -0,0 +1,426 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2020 Noralf Trønnes
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/lz4.h>
+#include <linux/usb.h>
+#include <linux/workqueue.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_format_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_print.h>
+#include <drm/drm_rect.h>
+#include <drm/drm_simple_kms_helper.h>
+#include <drm/gud_drm.h>
+
+#include "gud_drm_internal.h"
+
+static bool gud_drm_is_big_endian(void)
+{
+#if defined(__BIG_ENDIAN)
+	return true;
+#else
+	return false;
+#endif
+}
+
+static size_t gud_drm_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format,
+				       void *src, struct drm_framebuffer *fb,
+				       struct drm_rect *rect)
+{
+	unsigned int block_width = drm_format_info_block_width(format, 0);
+	unsigned int bits_per_pixel = 8 / block_width;
+	unsigned int x, y, width, height;
+	u8 *p, *block = dst; /* Assign to silence compiler warning */
+	size_t len;
+	void *buf;
+
+	WARN_ON_ONCE(format->char_per_block[0] != 1);
+
+	/* Start on a byte boundary */
+	rect->x1 = ALIGN_DOWN(rect->x1, block_width);
+	width = drm_rect_width(rect);
+	height = drm_rect_height(rect);
+	len = drm_format_info_min_pitch(format, 0, width) * height;
+
+	buf = kmalloc(width * height, GFP_KERNEL);
+	if (!buf)
+		return len; /* To keep logic simple, just transmit garbage */
+
+	drm_fb_xrgb8888_to_gray8(buf, src, fb, rect);
+
+	p = buf;
+	for (y = 0; y < drm_rect_height(rect); y++) {
+		for (x = 0; x < drm_rect_width(rect); x++) {
+			if (!(x % block_width)) {
+				block = dst++;
+				*block = 0;
+			}
+
+			*block <<= bits_per_pixel;
+			*block |= (*p++) >> (8 - bits_per_pixel);
+		}
+	}
+
+	kfree(buf);
+
+	return len;
+}
+
+static int gud_drm_fb_flush(struct gud_drm_device *gdrm, struct drm_framebuffer *fb,
+			    const struct drm_format_info *format, struct drm_rect *rect)
+{
+	struct dma_buf_attachment *import_attach = fb->obj[0]->import_attach;
+	struct gud_drm_req_set_buffer req;
+	size_t pitch, len, trlen;
+	int actual_length;
+	void *vaddr, *buf;
+	int ret = 0;
+
+	drm_dbg(&gdrm->drm, "Flushing [FB:%d] " DRM_RECT_FMT " imported=%s\n",
+		fb->base.id, DRM_RECT_ARG(rect), import_attach ? "yes" : "no");
+
+	pitch = drm_format_info_min_pitch(format, 0, drm_rect_width(rect));
+	len = pitch * drm_rect_height(rect);
+	if (len > gdrm->bulk_len)
+		return -E2BIG;
+
+	vaddr = drm_gem_shmem_vmap(fb->obj[0]);
+	if (!vaddr)
+		return -ENOMEM;
+
+	if (import_attach) {
+		ret = dma_buf_begin_cpu_access(import_attach->dmabuf, DMA_FROM_DEVICE);
+		if (ret)
+			goto vunmap;
+	}
+
+	if (gdrm->compression & GUD_DRM_COMPRESSION_LZ4)
+		buf = gdrm->compress_buf;
+	else
+		buf = gdrm->bulk_buf;
+
+	/*
+	 * Imported buffers are assumed to be write-combined and thus uncached
+	 * with slow reads (at least on ARM).
+	 */
+	if (format != fb->format) {
+		if (format->format == GUD_DRM_FORMAT_R1)
+			len = gud_drm_xrgb8888_to_r124(buf, format, vaddr, fb, rect);
+		else if (format->format == DRM_FORMAT_RGB565)
+			drm_fb_xrgb8888_to_rgb565(buf, vaddr, fb, rect, gud_drm_is_big_endian());
+	} else if (gud_drm_is_big_endian() && format->cpp[0] > 1) {
+		drm_fb_swab(buf, vaddr, fb, rect, !import_attach);
+	} else if (gdrm->compression && !import_attach && pitch == fb->pitches[0]) {
+		/* can compress directly from the framebuffer */
+		buf = vaddr + rect->y1 * pitch;
+	} else {
+		drm_fb_memcpy(buf, vaddr, fb, rect);
+	}
+
+	req.x = cpu_to_le32(rect->x1);
+	req.y = cpu_to_le32(rect->y1);
+	req.width = cpu_to_le32(drm_rect_width(rect));
+	req.height = cpu_to_le32(drm_rect_height(rect));
+	req.length = cpu_to_le32(len);
+	req.compression = 0;
+	req.compressed_length = 0;
+
+	if (gdrm->compression & GUD_DRM_COMPRESSION_LZ4) {
+		ret = LZ4_compress_default(buf, gdrm->bulk_buf, len, len, gdrm->lz4_comp_mem);
+		if (ret > 0)
+			req.compression = GUD_DRM_COMPRESSION_LZ4;
+	}
+
+	trlen = len;
+
+	if (ret > 0) {
+		req.compressed_length = cpu_to_le32(ret);
+		trlen = ret;
+	} else if (buf == gdrm->compress_buf) {
+		/*
+		 * Compression failed (buffer didn't compress well).
+		 * compress_buf is vmalloc'ed so we need to copy.
+		 */
+		memcpy(gdrm->bulk_buf, gdrm->compress_buf, len);
+	}
+
+	if (import_attach)
+		dma_buf_end_cpu_access(import_attach->dmabuf, DMA_FROM_DEVICE);
+
+	gdrm->stats_length += len;
+	/* Did it wrap around? */
+	if (gdrm->stats_length <= len && gdrm->stats_actual_length) {
+		gdrm->stats_length = len;
+		gdrm->stats_actual_length = 0;
+	}
+	gdrm->stats_actual_length += trlen;
+
+	/*
+	 * This will wait if decompress/copy from the previous flush is still in
+	 * process on the gadget side.
+	 */
+	ret = gud_drm_usb_set(gdrm, GUD_DRM_USB_REQ_SET_BUFFER, 0, &req, sizeof(req));
+	if (ret)
+		goto vunmap;
+
+	ret = usb_bulk_msg(gdrm->usb, gdrm->bulk_pipe, gdrm->bulk_buf, trlen,
+			   &actual_length, msecs_to_jiffies(3000));
+	if (!ret && trlen != actual_length)
+		ret = -EIO;
+	if (ret)
+		gdrm->stats_num_errors++;
+vunmap:
+	drm_gem_shmem_vunmap(fb->obj[0], vaddr);
+
+	return ret;
+}
+
+void gud_drm_clear_damage(struct gud_drm_device *gdrm)
+{
+	gdrm->damage.x1 = INT_MAX;
+	gdrm->damage.y1 = INT_MAX;
+	gdrm->damage.x2 = 0;
+	gdrm->damage.y2 = 0;
+}
+
+void gud_drm_work(struct work_struct *work)
+{
+	struct gud_drm_device *gdrm = container_of(work, struct gud_drm_device, work);
+	const struct drm_format_info *format;
+	struct drm_framebuffer *fb;
+	struct drm_rect damage;
+	unsigned int i, lines;
+	int idx, ret = 0;
+	size_t pitch;
+
+	if (!drm_dev_enter(&gdrm->drm, &idx))
+		return;
+
+	mutex_lock(&gdrm->damage_lock);
+	fb = gdrm->fb;
+	gdrm->fb = NULL;
+	damage = gdrm->damage;
+	gud_drm_clear_damage(gdrm);
+	mutex_unlock(&gdrm->damage_lock);
+
+	if (!fb)
+		goto out;
+
+	format = fb->format;
+	if (format->format == DRM_FORMAT_XRGB8888 && gdrm->xrgb8888_emulation_format)
+		format = gdrm->xrgb8888_emulation_format;
+
+	/* Split update if it's too big */
+	pitch = drm_format_info_min_pitch(format, 0, drm_rect_width(&damage));
+	lines = drm_rect_height(&damage);
+
+	if (gdrm->bulk_len < lines * pitch)
+		lines = gdrm->bulk_len / pitch;
+
+	for (i = 0; i < DIV_ROUND_UP(drm_rect_height(&damage), lines); i++) {
+		struct drm_rect rect = damage;
+
+		rect.y1 += i * lines;
+		rect.y2 = min_t(u32, rect.y1 + lines, damage.y2);
+
+		ret = gud_drm_fb_flush(gdrm, fb, format, &rect);
+		if (ret &&
+		    (ret != -ENODEV && ret != -ECONNRESET && ret != -ESHUTDOWN && ret != -EPROTO))
+			dev_err_once(fb->dev->dev, "Failed to flush framebuffer: error=%d\n", ret);
+	}
+
+	drm_framebuffer_put(fb);
+out:
+	drm_dev_exit(idx);
+}
+
+static void gud_drm_fb_queue_damage(struct gud_drm_device *gdrm,
+				    struct drm_framebuffer *fb,
+				    struct drm_rect *damage)
+{
+	struct drm_framebuffer *old_fb = NULL;
+
+	mutex_lock(&gdrm->damage_lock);
+
+	if (fb != gdrm->fb) {
+		old_fb = gdrm->fb;
+		drm_framebuffer_get(fb);
+		gdrm->fb = fb;
+	}
+
+	gdrm->damage.x1 = min(gdrm->damage.x1, damage->x1);
+	gdrm->damage.y1 = min(gdrm->damage.y1, damage->y1);
+	gdrm->damage.x2 = max(gdrm->damage.x2, damage->x2);
+	gdrm->damage.y2 = max(gdrm->damage.y2, damage->y2);
+
+	mutex_unlock(&gdrm->damage_lock);
+
+	queue_work(system_long_wq, &gdrm->work);
+
+	if (old_fb)
+		drm_framebuffer_put(old_fb);
+}
+
+int gud_drm_pipe_check(struct drm_simple_display_pipe *pipe,
+		       struct drm_plane_state *new_plane_state,
+		       struct drm_crtc_state *new_crtc_state)
+{
+	struct gud_drm_device *gdrm = to_gud_drm_device(pipe->crtc.dev);
+	struct drm_plane_state *old_plane_state = pipe->plane.state;
+	const struct drm_display_mode *mode = &new_crtc_state->mode;
+	struct drm_atomic_state *state = new_plane_state->state;
+	struct drm_framebuffer *old_fb = old_plane_state->fb;
+	struct drm_connector_state *connector_state = NULL;
+	struct drm_framebuffer *fb = new_plane_state->fb;
+	const struct drm_format_info *format = fb->format;
+	struct gud_drm_req_set_state *req;
+	struct drm_connector *connector;
+	int idx, ret, num_properties;
+	unsigned int i;
+	size_t len;
+
+	if (WARN_ON_ONCE(!fb))
+		return -EINVAL;
+
+	if (old_plane_state->rotation != new_plane_state->rotation)
+		new_crtc_state->mode_changed = true;
+
+	if (old_fb && old_fb->format != format)
+		new_crtc_state->mode_changed = true;
+
+	if (!new_crtc_state->mode_changed && !new_crtc_state->connectors_changed)
+		return 0;
+
+	/* Only one connector is supported */
+	if (hweight32(new_crtc_state->connector_mask) != 1)
+		return -EINVAL;
+
+	if (format->format == DRM_FORMAT_XRGB8888 && gdrm->xrgb8888_emulation_format)
+		format = gdrm->xrgb8888_emulation_format;
+
+	for_each_new_connector_in_state(state, connector, connector_state, i)
+		break;
+
+	if (!connector_state) {
+		struct drm_connector_list_iter conn_iter;
+
+		/* We always send the full state to the device, so get the connector state */
+
+		drm_connector_list_iter_begin(pipe->crtc.dev, &conn_iter);
+		drm_for_each_connector_iter(connector, &conn_iter) {
+			if (new_crtc_state->connector_mask & drm_connector_mask(connector))
+				break;
+		}
+		drm_connector_list_iter_end(&conn_iter);
+
+		if (WARN_ON_ONCE(!connector))
+			return -ENOENT;
+
+		connector_state = drm_atomic_get_connector_state(state, connector);
+		if (IS_ERR(connector_state))
+			return PTR_ERR(connector_state);
+	}
+
+	num_properties = gud_drm_connector_fill_properties(connector, NULL, NULL);
+	if (num_properties < 0)
+		return num_properties;
+
+	num_properties += gdrm->num_properties;
+
+	len = struct_size(req, properties, num_properties);
+	req = kzalloc(len, GFP_KERNEL);
+	if (!req)
+		return -ENOMEM;
+
+	gud_drm_from_display_mode(&req->mode, mode);
+
+	req->format = cpu_to_le32(format->format);
+	req->connector = drm_connector_index(connector);
+	req->num_properties = num_properties;
+
+	num_properties = gud_drm_connector_fill_properties(connector, connector_state,
+							   req->properties);
+
+	for (i = 0; i < gdrm->num_properties; i++) {
+		u16 prop = gdrm->properties[i];
+		u64 val;
+
+		switch (prop) {
+		case GUD_DRM_PROPERTY_ROTATION:
+			val = new_plane_state->rotation;
+			break;
+		default:
+			WARN_ON_ONCE(1);
+			ret = -EINVAL;
+			goto out;
+		}
+
+		req->properties[num_properties + i].prop = cpu_to_le16(prop);
+		req->properties[num_properties + i].val = cpu_to_le64(val);
+	}
+
+	if (!drm_dev_enter(fb->dev, &idx)) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	ret = gud_drm_usb_set(gdrm, GUD_DRM_USB_REQ_SET_STATE_CHECK, 0, req, len);
+
+	drm_dev_exit(idx);
+out:
+	kfree(req);
+
+	return ret;
+}
+
+void gud_drm_pipe_update(struct drm_simple_display_pipe *pipe,
+			 struct drm_plane_state *old_state)
+{
+	struct drm_device *drm = pipe->crtc.dev;
+	struct gud_drm_device *gdrm = to_gud_drm_device(drm);
+	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_framebuffer *fb = state->fb;
+	struct drm_crtc *crtc = &pipe->crtc;
+	struct drm_rect damage;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	if (!old_state->fb)
+		gud_drm_usb_write8(gdrm, GUD_DRM_USB_REQ_SET_CONTROLLER_ENABLE, 1);
+
+	if (fb && (crtc->state->mode_changed || crtc->state->connectors_changed))
+		gud_drm_usb_set(gdrm, GUD_DRM_USB_REQ_SET_STATE_COMMIT, 0, NULL, 0);
+
+	if (crtc->state->active_changed)
+		gud_drm_usb_write8(gdrm, GUD_DRM_USB_REQ_SET_DISPLAY_ENABLE, crtc->state->active);
+
+	if (drm_atomic_helper_damage_merged(old_state, state, &damage))
+		gud_drm_fb_queue_damage(gdrm, fb, &damage);
+
+	if (!fb) {
+		cancel_work_sync(&gdrm->work);
+
+		mutex_lock(&gdrm->damage_lock);
+		if (gdrm->fb) {
+			drm_framebuffer_put(gdrm->fb);
+			gdrm->fb = NULL;
+		}
+		gud_drm_clear_damage(gdrm);
+		mutex_unlock(&gdrm->damage_lock);
+
+		gud_drm_usb_write8(gdrm, GUD_DRM_USB_REQ_SET_CONTROLLER_ENABLE, 0);
+	}
+
+	drm_dev_exit(idx);
+}
diff --git a/include/drm/gud_drm.h b/include/drm/gud_drm.h
new file mode 100644
index 000000000000..7876d2e3cbcf
--- /dev/null
+++ b/include/drm/gud_drm.h
@@ -0,0 +1,361 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2020 Noralf Trønnes
+ */
+
+#ifndef __LINUX_GUD_DRM_H
+#define __LINUX_GUD_DRM_H
+
+#include <drm/drm_modes.h>
+#include <linux/types.h>
+#include <uapi/drm/drm_fourcc.h>
+#include <uapi/linux/usb/ch9.h>
+
+/*
+ * Maximum size of a control message, fits 120 display modes.
+ * If this needs to increase, the IN side in f_gud_drm_setup()
+ * needs fixing.
+ */
+#define GUD_DRM_MAX_TRANSFER_SIZE	SZ_4K
+
+#define GUD_DRM_USB_DT_DISPLAY		(USB_TYPE_VENDOR | 0x4)
+
+/*
+ * struct gud_drm_display_descriptor - Display descriptor
+ * @bLength: Size of descriptor in bytes
+ * @bDescriptorType: DescriptorType (GUD_DRM_USB_DT_DISPLAY)
+ * @bVersion: Protocol version
+ * @bMaxBufferSizeOrder: Maximum buffer size the device can handle as log2
+ * @bmFlags: Currently unused, should be set to zero
+ * @bCompression: Supported compression types
+ * @dwMinWidth: Minimum pixel width the controller can handle
+ * @dwMaxWidth: Maximum width
+ * @dwMinHeight: Minimum height
+ * @dwMaxHeight: Maximum height
+ * @bNumFormats: Number of supported pixel formats
+ * @bNumProperties: Number of properties that are not connector porperties
+ * @bNumConnectors: Number of connectors
+ *
+ * Devices that have only one display mode will have dwMinWidth == dwMaxWidth
+ * and dwMinHeight == dwMaxHeight.
+ *
+ */
+struct gud_drm_display_descriptor {
+	__u8 bLength;
+	__u8 bDescriptorType;
+
+	__u8 bVersion;
+	__u8 bMaxBufferSizeOrder;
+	__le32 bmFlags;
+
+	__u8 bCompression;
+#define GUD_DRM_COMPRESSION_LZ4		BIT(0)
+
+	__le32 dwMinWidth;
+	__le32 dwMaxWidth;
+	__le32 dwMinHeight;
+	__le32 dwMaxHeight;
+
+	__u8 bNumFormats;
+	__u8 bNumProperties;
+	__u8 bNumConnectors;
+} __packed;
+
+/*
+ * struct gud_drm_req_get_status - Status request
+ * @flags: Flags
+ * @errno: Linux errno value
+ *
+ * The host keeps polling for status as long as the GUD_DRM_STATUS_PENDING flag
+ * is set (or until timeout). Requested using: USB_REQ_GET_STATUS.
+ */
+struct gud_drm_req_get_status {
+	__u8 flags;
+#define GUD_DRM_STATUS_PENDING	BIT(0)
+	__u8 errno;
+} __packed;
+
+/*
+ * struct gud_drm_property - Property
+ * @prop: Property
+ * @val: Value
+ */
+struct gud_drm_property {
+	__le16 prop;
+	__le64 val;
+} __packed;
+
+/* See &drm_display_mode for the meaning of these fields */
+struct gud_drm_display_mode {
+	__le32 clock;
+	__le16 hdisplay;
+	__le16 hsync_start;
+	__le16 hsync_end;
+	__le16 htotal;
+	__le16 hskew;
+	__le16 vdisplay;
+	__le16 vsync_start;
+	__le16 vsync_end;
+	__le16 vtotal;
+	__le16 vscan;
+	__le32 flags;
+	__u8 type;
+} __packed;
+
+/*
+ * struct gud_drm_req_get_connector - Connector descriptor
+ * @connector_type: Connector type (DRM_MODE_CONNECTOR_*)
+ * @flags: Flags
+ * @num_properties: Number of supported properties
+ */
+struct gud_drm_req_get_connector {
+	__u8 connector_type;
+
+	__le32 flags;
+#define GUD_DRM_CONNECTOR_FLAGS_POLL	BIT(0)
+
+	__u8 num_properties;
+} __packed;
+
+/*
+ * struct gud_drm_req_get_connector_status - Connector status
+ * @status: Status, see &drm_connector_status
+ * @num_modes: Number of available display modes
+ * @modes_array_checksum: CRC-CCITT checksum of the display mode array in little endian format
+ * @edid_len: Length of EDID data
+ * @edid_checksum: CRC-CCITT checksum of EDID data
+ *
+ * If both @num_modes and @edid_len are zero, connector status is set to
+ * disconnected. If @num_modes is zero, edid is used to create display modes.
+ * If both are set, edid is just passed on to userspace in the EDID connector
+ * property.
+ *
+ * Display modes and EDID are only requested if number/length or crc differs.
+ */
+struct gud_drm_req_get_connector_status {
+	__u8 status;
+#define GUD_DRM_CONNECTOR_STATUS_MASK		0xf /* Only 2 bits are currently used for status */
+#define GUD_DRM_CONNECTOR_STATUS_CHANGED	BIT(7)
+	__le16 num_modes;
+	__le16 edid_len;
+} __packed;
+
+/*
+ * struct gud_drm_req_set_buffer - Set buffer transfer info
+ * @x: X position of rectangle
+ * @y: Y position
+ * @width: Pixel width of rectangle
+ * @height: Pixel height
+ * @length: Buffer length in bytes
+ * @compression: Transfer compression
+ * @compressed_length: Compressed buffer length
+ *
+ * @x, @y, @width and @height specifies the rectangle where the buffer should be
+ * placed inside the framebuffer.
+ */
+struct gud_drm_req_set_buffer {
+	__le32 x;
+	__le32 y;
+	__le32 width;
+	__le32 height;
+
+	__le32 length;
+	__u8 compression;
+	__le32 compressed_length;
+} __packed;
+
+/*
+ * struct gud_drm_req_set_state - Set display state
+ * @mode: Display mode
+ * @format: Pixel format
+ * @connector: Connector index
+ * @num_properties: Number of properties in the state
+ * @properties: Array of properties
+ *
+ * The entire state is transferred each time there's a change.
+ */
+struct gud_drm_req_set_state {
+	struct gud_drm_display_mode mode;
+	__le32 format;
+	__u8 connector;
+	__u8 num_properties;
+	struct gud_drm_property properties[];
+} __packed;
+
+/*
+ * Internal monochrome transfer format presented to userspace as XRGB8888.
+ * Pixel lines are byte aligned.
+ */
+#define GUD_DRM_FORMAT_R1	fourcc_code('R', '1', ' ', ' ')
+
+/* List of supported connector properties: */
+
+/* TV related properties, see &drm_connector and &drm_tv_connector_state */
+#define GUD_DRM_PROPERTY_TV_SELECT_SUBCONNECTOR		1
+#define GUD_DRM_PROPERTY_TV_LEFT_MARGIN			2
+#define GUD_DRM_PROPERTY_TV_RIGHT_MARGIN		3
+#define GUD_DRM_PROPERTY_TV_TOP_MARGIN			4
+#define GUD_DRM_PROPERTY_TV_BOTTOM_MARGIN		5
+/* Number of modes are placed at _SHIFT in val on retrieval */
+#define GUD_DRM_PROPERTY_TV_MODE			6
+  #define GUD_DRM_USB_CONNECTOR_TV_MODE_NUM_SHIFT   16
+#define GUD_DRM_PROPERTY_TV_BRIGHTNESS			7
+#define GUD_DRM_PROPERTY_TV_CONTRAST			8
+#define GUD_DRM_PROPERTY_TV_FLICKER_REDUCTION		9
+#define GUD_DRM_PROPERTY_TV_OVERSCAN			10
+#define GUD_DRM_PROPERTY_TV_SATURATION			11
+#define GUD_DRM_PROPERTY_TV_HUE				12
+
+/*
+ * Backlight brightness is in the range 0-100 inclusive. The value represents
+ * the human perceptual brightness and not a linear PWM value. 0 is minimum
+ * brightness which should not turn the backlight completely off. The DPMS
+ * connector property should be used to control power which will trigger a
+ * GUD_DRM_USB_REQ_SET_DISPLAY_ENABLE request.
+ *
+ * This is not a real DRM property, but rather a fake one used for the backlight
+ * device. See drm_backlight_register() for more details.
+ */
+#define GUD_DRM_PROPERTY_BACKLIGHT_BRIGHTNESS		13
+
+/* List of supported properties that are not connector propeties: */
+
+/*
+ * Plane rotation. Should return the supported bitmask on
+ * GUD_DRM_USB_REQ_GET_PROPERTIES, see drm_plane_create_rotation_property().
+ */
+#define GUD_DRM_PROPERTY_ROTATION			50
+
+/* USB Control requests: */
+
+/*
+ * If the host driver doesn't support the device protocol version it will send
+ * the versions it supports starting with the latest. If the device isn't
+ * backwards compatible or doesn't support the version the host suggests, it
+ * shall return EPROTONOSUPPORT.
+ */
+#define GUD_DRM_USB_REQ_SET_VERSION			0x30
+
+/* Get supported pixel formats as an array of fourcc codes. See include/uapi/drm/drm_fourcc.h */
+#define GUD_DRM_USB_REQ_GET_FORMATS			0x40
+
+/* Get supported properties that are not connector propeties as a &gud_drm_property array */
+#define GUD_DRM_USB_REQ_GET_PROPERTIES			0x41
+
+/* Get connector descriptor */
+#define GUD_DRM_USB_REQ_GET_CONNECTOR			0x50
+
+/* Get properties supported by the connector as a &gud_drm_property array */
+#define GUD_DRM_USB_REQ_GET_CONNECTOR_PROPERTIES	0x51
+
+/*
+ * Issued when there's a tv.mode property present.
+ * Gets an array of tv.mode enum names each entry of length DRM_PROP_NAME_LEN.
+ */
+#define GUD_DRM_USB_REQ_GET_CONNECTOR_TV_MODE_VALUES	0x52
+
+/* When userspace checks status, this is issued first, not used for poll requests. */
+#define GUD_DRM_USB_REQ_SET_CONNECTOR_FORCE_DETECT	0x53
+
+/* Get connector status as &gud_drm_req_get_connector_status. */
+#define GUD_DRM_USB_REQ_GET_CONNECTOR_STATUS		0x54
+
+/* Get &gud_drm_display_mode array of supported display modes */
+#define GUD_DRM_USB_REQ_GET_CONNECTOR_MODES		0x55
+
+#define GUD_DRM_USB_REQ_GET_CONNECTOR_EDID		0x56
+
+/* Set buffer properties before bulk transfer as &gud_drm_req_set_buffer */
+#define GUD_DRM_USB_REQ_SET_BUFFER			0x60
+
+/* Check display configuration as &gud_drm_req_set_state */
+#define GUD_DRM_USB_REQ_SET_STATE_CHECK			0x61
+
+/* Apply the prevoius _STATE_CHECK configuration */
+#define GUD_DRM_USB_REQ_SET_STATE_COMMIT		0x62
+
+ /* Enable/disable the display controller, value is u8 0/1 */
+#define GUD_DRM_USB_REQ_SET_CONTROLLER_ENABLE		0x63
+
+/* Enable/disable display/output (DPMS), value is u8 0/1 */
+#define GUD_DRM_USB_REQ_SET_DISPLAY_ENABLE		0x64
+
+static inline void gud_drm_from_display_mode(struct gud_drm_display_mode *dst,
+					     const struct drm_display_mode *src)
+{
+	u32 flags = src->flags;
+
+	switch (src->picture_aspect_ratio) {
+	case HDMI_PICTURE_ASPECT_4_3:
+		flags |= DRM_MODE_FLAG_PIC_AR_4_3;
+		break;
+	case HDMI_PICTURE_ASPECT_16_9:
+		flags |= DRM_MODE_FLAG_PIC_AR_16_9;
+		break;
+	case HDMI_PICTURE_ASPECT_64_27:
+		flags |= DRM_MODE_FLAG_PIC_AR_64_27;
+		break;
+	case HDMI_PICTURE_ASPECT_256_135:
+		flags |= DRM_MODE_FLAG_PIC_AR_256_135;
+		break;
+	default:
+		flags |= DRM_MODE_FLAG_PIC_AR_NONE;
+		break;
+	}
+
+	dst->clock = cpu_to_le32(src->clock);
+	dst->hdisplay = cpu_to_le16(src->hdisplay);
+	dst->hsync_start = cpu_to_le16(src->hsync_start);
+	dst->hsync_end = cpu_to_le16(src->hsync_end);
+	dst->htotal = cpu_to_le16(src->htotal);
+	dst->hskew = cpu_to_le16(src->hskew);
+	dst->vdisplay = cpu_to_le16(src->vdisplay);
+	dst->vsync_start = cpu_to_le16(src->vsync_start);
+	dst->vsync_end = cpu_to_le16(src->vsync_end);
+	dst->vtotal = cpu_to_le16(src->vtotal);
+	dst->vscan = cpu_to_le16(src->vscan);
+	dst->flags = cpu_to_le32(flags);
+	dst->type = src->type;
+}
+
+static inline void gud_drm_to_display_mode(struct drm_display_mode *dst,
+					   const struct gud_drm_display_mode *src)
+{
+	u32 flags = le32_to_cpu(src->flags);
+
+	dst->clock = le32_to_cpu(src->clock);
+	dst->hdisplay = le16_to_cpu(src->hdisplay);
+	dst->hsync_start = le16_to_cpu(src->hsync_start);
+	dst->hsync_end = le16_to_cpu(src->hsync_end);
+	dst->htotal = le16_to_cpu(src->htotal);
+	dst->hskew = le16_to_cpu(src->hskew);
+	dst->vdisplay = le16_to_cpu(src->vdisplay);
+	dst->vsync_start = le16_to_cpu(src->vsync_start);
+	dst->vsync_end = le16_to_cpu(src->vsync_end);
+	dst->vtotal = le16_to_cpu(src->vtotal);
+	dst->vscan = le16_to_cpu(src->vscan);
+	dst->flags = flags & ~DRM_MODE_FLAG_PIC_AR_MASK;
+	dst->type = src->type;
+
+	switch (flags & DRM_MODE_FLAG_PIC_AR_MASK) {
+	case DRM_MODE_FLAG_PIC_AR_4_3:
+		dst->picture_aspect_ratio = HDMI_PICTURE_ASPECT_4_3;
+		break;
+	case DRM_MODE_FLAG_PIC_AR_16_9:
+		dst->picture_aspect_ratio = HDMI_PICTURE_ASPECT_16_9;
+		break;
+	case DRM_MODE_FLAG_PIC_AR_64_27:
+		dst->picture_aspect_ratio = HDMI_PICTURE_ASPECT_64_27;
+		break;
+	case DRM_MODE_FLAG_PIC_AR_256_135:
+		dst->picture_aspect_ratio = HDMI_PICTURE_ASPECT_256_135;
+		break;
+	default:
+		dst->picture_aspect_ratio = HDMI_PICTURE_ASPECT_NONE;
+		break;
+	}
+
+	drm_mode_set_name(dst);
+}
+
+#endif
-- 
2.23.0

