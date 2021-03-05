Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB9232F018
	for <lists+linux-usb@lfdr.de>; Fri,  5 Mar 2021 17:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbhCEQbl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Mar 2021 11:31:41 -0500
Received: from asav21.altibox.net ([109.247.116.8]:37760 "EHLO
        asav21.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231270AbhCEQbZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Mar 2021 11:31:25 -0500
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav21.altibox.net (Postfix) with ESMTPSA id 23437801AE;
        Fri,  5 Mar 2021 17:31:17 +0100 (CET)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-usb@vger.kernel.org, sam@ravnborg.org, peter@stuge.se,
        lkundrak@v3.sk, markus@raatikainen.cc, pontus.fuchs@gmail.com,
        hudson@trmm.net, th020394@gmail.com,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v7 3/3] drm: Add GUD USB Display driver
Date:   Fri,  5 Mar 2021 17:31:04 +0100
Message-Id: <20210305163104.30756-4-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210305163104.30756-1-noralf@tronnes.org>
References: <20210305163104.30756-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=PJ4hB8iC c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8 a=gAmX6pxEAAAA:20
        a=e5mUnYsNAAAA:8 a=20KFwNOVAAAA:8 a=XQfUo3buxsil4UYIs80A:9
        a=MtIykYbnxLeOWnGZ:21 a=G_GndQivcDoq_av6:21 a=QEXdDO2ut3YA:10
        a=vFet0B0WnEQeilDPIY6i:22 a=Vxmtnl_E_bksehYqCbjh:22
        a=BPzZvq435JnGatEyYwdK:22 a=pHzHmUro8NiASowvMSCR:22
        a=nt3jZW36AmriUCFCBwmW:22
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This adds a USB display driver with the intention that it can be
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

v4:
- Drop the status req polling which was a workaround for something that
  turned out to be a dwc2 udc driver problem
- Add a flag for the Linux gadget to require a status request on
  SET operations. Other devices will only get status req on STALL errors
- Use protocol specific error codes (Peter)
- Add a flag for devices that want to receive the entire framebuffer on
  each flush (Lubomir)
- Retry a failed framebuffer flush
- If mode has changed wait for worker and clear pending damage before
  queuing up new damage, fb width/height might have changed
- Increase error counter on bulk transfer failures
- Use DRM_MODE_CONNECTOR_USB
- Handle R1 kmalloc error (Peter)
- Don't try and replicate the USB get descriptor request standard for the
  display descriptor (Peter)
- Make max_buffer_size optional (Peter), drop the pow2 requirement since
  it's not necessary anymore.
- Don't pre-alloc a control request buffer, it was only 4k
- Let gud.h describe the whole protocol explicitly and don't let DRM
  leak into it (Peter)
- Drop display mode .hskew and .vscan from the protocol
- Shorten names: s/GUD_DRM_/GUD_/ s/gud_drm_/gud_/ (Peter)
- Fix gud_pipe_check() connector picking when switching connector
- Drop gud_drm_driver_gem_create_object() cached is default now
- Retrieve USB device from struct drm_device.dev instead of keeping a
  pointer
- Honour fb->offsets[0]
- Fix mode fetching when connector status is forced
- Check EDID length reported by the device
- Use drm_do_get_edid() so userspace can overrride EDID
- Set epoch counter to signal connector status change
- gud_drm_driver can be const now

v5:
- GUD_DRM_FORMAT_R1: Use non-human ascii values (Daniel)
- Change name to: GUD USB Display (Thomas, Simon)
- Change one __u32 -> __le32 in protocol header
- Always log fb flush errors, unless the previous one failed
- Run backlight update in a worker to avoid upsetting lockdep (Daniel)
- Drop backlight_ops.get_brightness, there's no readback from the device
  so it doesn't really add anything.
- Set dma mask, needed by dma-buf importers

v6:
- Use obj-y in Makefile (Peter)
- Fix missing le32_to_cpu() when using GUD_DISPLAY_MAGIC (Peter)
- Set initial brightness on backlight device

v7:
- LZ4_compress_default() can return zero, check for that
- Fix memory leak in gud_pipe_check() error path (Peter)
- Improve debug and error messages (Peter)
- Don't pass length in protocol structs (Peter)
- Pass USB interface to gud_usb_control_msg() et al. (Peter)
- Improve gud_connector_fill_properties() (Peter)
- Add GUD_PIXEL_FORMAT_RGB111 (Peter)
- Remove GUD_REQ_SET_VERSION (Peter)
- Fix DRM_IOCTL_MODE_OBJ_SETPROPERTY and the rotation property
- Fix dma-buf import (Thomas)

Cc: Peter Stuge <peter@stuge.se>
Cc: Lubomir Rintel <lkundrak@v3.sk>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 MAINTAINERS                         |   8 +
 drivers/gpu/drm/Kconfig             |   2 +
 drivers/gpu/drm/Makefile            |   1 +
 drivers/gpu/drm/gud/Kconfig         |  14 +
 drivers/gpu/drm/gud/Makefile        |   4 +
 drivers/gpu/drm/gud/gud_connector.c | 729 ++++++++++++++++++++++++++++
 drivers/gpu/drm/gud/gud_drv.c       | 659 +++++++++++++++++++++++++
 drivers/gpu/drm/gud/gud_internal.h  | 154 ++++++
 drivers/gpu/drm/gud/gud_pipe.c      | 535 ++++++++++++++++++++
 include/drm/gud.h                   | 333 +++++++++++++
 10 files changed, 2439 insertions(+)
 create mode 100644 drivers/gpu/drm/gud/Kconfig
 create mode 100644 drivers/gpu/drm/gud/Makefile
 create mode 100644 drivers/gpu/drm/gud/gud_connector.c
 create mode 100644 drivers/gpu/drm/gud/gud_drv.c
 create mode 100644 drivers/gpu/drm/gud/gud_internal.h
 create mode 100644 drivers/gpu/drm/gud/gud_pipe.c
 create mode 100644 include/drm/gud.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 00112c044608..e7f71ac55f08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5525,6 +5525,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
 F:	drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
 
+DRM DRIVER FOR GENERIC USB DISPLAY
+M:	Noralf Trønnes <noralf@tronnes.org>
+S:	Maintained
+W:	https://github.com/notro/gud/wiki
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	drivers/gpu/drm/gud/
+F:	include/drm/gud.h
+
 DRM DRIVER FOR GRAIN MEDIA GM12U320 PROJECTORS
 M:	Hans de Goede <hdegoede@redhat.com>
 S:	Maintained
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 147d61b9674e..6d3f47933e51 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -388,6 +388,8 @@ source "drivers/gpu/drm/tidss/Kconfig"
 
 source "drivers/gpu/drm/xlnx/Kconfig"
 
+source "drivers/gpu/drm/gud/Kconfig"
+
 # Keep legacy drivers last
 
 menuconfig DRM_LEGACY
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 81569009f884..78dd8e12525d 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -124,3 +124,4 @@ obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
 obj-$(CONFIG_DRM_MCDE) += mcde/
 obj-$(CONFIG_DRM_TIDSS) += tidss/
 obj-y			+= xlnx/
+obj-y			+= gud/
diff --git a/drivers/gpu/drm/gud/Kconfig b/drivers/gpu/drm/gud/Kconfig
new file mode 100644
index 000000000000..1c8601bf4d91
--- /dev/null
+++ b/drivers/gpu/drm/gud/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config DRM_GUD
+	tristate "GUD USB Display"
+	depends on DRM && USB
+	select LZ4_COMPRESS
+	select DRM_KMS_HELPER
+	select DRM_GEM_SHMEM_HELPER
+	select BACKLIGHT_CLASS_DEVICE
+	help
+	  This is a DRM display driver for GUD USB Displays or display
+	  adapters.
+
+	  If M is selected the module will be called gud.
diff --git a/drivers/gpu/drm/gud/Makefile b/drivers/gpu/drm/gud/Makefile
new file mode 100644
index 000000000000..68a1c622cf33
--- /dev/null
+++ b/drivers/gpu/drm/gud/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+gud-y				:= gud_drv.o gud_pipe.o gud_connector.o
+obj-$(CONFIG_DRM_GUD)		+= gud.o
diff --git a/drivers/gpu/drm/gud/gud_connector.c b/drivers/gpu/drm/gud/gud_connector.c
new file mode 100644
index 000000000000..ec495dcd6122
--- /dev/null
+++ b/drivers/gpu/drm/gud/gud_connector.c
@@ -0,0 +1,729 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2020 Noralf Trønnes
+ */
+
+#include <linux/backlight.h>
+#include <linux/workqueue.h>
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
+#include <drm/gud.h>
+
+#include "gud_internal.h"
+
+struct gud_connector {
+	struct drm_connector connector;
+	struct drm_encoder encoder;
+	struct backlight_device *backlight;
+	struct work_struct backlight_work;
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
+	 * The value -ENODEV is used to signal no backlight.
+	 */
+	int initial_brightness;
+};
+
+static inline struct gud_connector *to_gud_connector(struct drm_connector *connector)
+{
+	return container_of(connector, struct gud_connector, connector);
+}
+
+static void gud_conn_err(struct drm_connector *connector, const char *msg, int ret)
+{
+	dev_err(connector->dev->dev, "%s: %s (ret=%d)\n", connector->name, msg, ret);
+}
+
+/*
+ * Use a worker to avoid taking kms locks inside the backlight lock.
+ * Other display drivers use backlight within their kms locks.
+ * This avoids inconsistent locking rules, which would upset lockdep.
+ */
+static void gud_connector_backlight_update_status_work(struct work_struct *work)
+{
+	struct gud_connector *gconn = container_of(work, struct gud_connector, backlight_work);
+	struct drm_connector *connector = &gconn->connector;
+	struct drm_connector_state *connector_state;
+	struct drm_device *drm = connector->dev;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_atomic_state *state;
+	int idx, ret;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	state = drm_atomic_state_alloc(drm);
+	if (!state) {
+		ret = -ENOMEM;
+		goto exit;
+	}
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
+	connector_state->tv.brightness = gconn->backlight->props.brightness;
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
+exit:
+	drm_dev_exit(idx);
+
+	if (ret)
+		dev_err(drm->dev, "Failed to update backlight, err=%d\n", ret);
+}
+
+static int gud_connector_backlight_update_status(struct backlight_device *bd)
+{
+	struct drm_connector *connector = bl_get_data(bd);
+	struct gud_connector *gconn = to_gud_connector(connector);
+
+	/* The USB timeout is 5 seconds so use system_long_wq for worst case scenario */
+	queue_work(system_long_wq, &gconn->backlight_work);
+
+	return 0;
+}
+
+static const struct backlight_ops gud_connector_backlight_ops = {
+	.update_status	= gud_connector_backlight_update_status,
+};
+
+static int gud_connector_backlight_register(struct gud_connector *gconn)
+{
+	struct drm_connector *connector = &gconn->connector;
+	struct backlight_device *bd;
+	const char *name;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.scale = BACKLIGHT_SCALE_NON_LINEAR,
+		.max_brightness = 100,
+		.brightness = gconn->initial_brightness,
+	};
+
+	name = kasprintf(GFP_KERNEL, "card%d-%s-backlight",
+			 connector->dev->primary->index, connector->name);
+	if (!name)
+		return -ENOMEM;
+
+	bd = backlight_device_register(name, connector->kdev, connector,
+				       &gud_connector_backlight_ops, &props);
+	kfree(name);
+	if (IS_ERR(bd))
+		return PTR_ERR(bd);
+
+	gconn->backlight = bd;
+
+	return 0;
+}
+
+static int gud_connector_detect(struct drm_connector *connector,
+				struct drm_modeset_acquire_ctx *ctx, bool force)
+{
+	struct gud_device *gdrm = to_gud_device(connector->dev);
+	int idx, ret;
+	u8 status;
+
+	if (!drm_dev_enter(connector->dev, &idx))
+		return connector_status_disconnected;
+
+	if (force) {
+		ret = gud_usb_set(gdrm, GUD_REQ_SET_CONNECTOR_FORCE_DETECT,
+				  connector->index, NULL, 0);
+		if (ret) {
+			ret = connector_status_unknown;
+			goto exit;
+		}
+	}
+
+	ret = gud_usb_get_u8(gdrm, GUD_REQ_GET_CONNECTOR_STATUS, connector->index, &status);
+	if (ret) {
+		ret = connector_status_unknown;
+		goto exit;
+	}
+
+	switch (status & GUD_CONNECTOR_STATUS_CONNECTED_MASK) {
+	case GUD_CONNECTOR_STATUS_DISCONNECTED:
+		ret = connector_status_disconnected;
+		break;
+	case GUD_CONNECTOR_STATUS_CONNECTED:
+		ret = connector_status_connected;
+		break;
+	default:
+		ret = connector_status_unknown;
+		break;
+	};
+
+	if (status & GUD_CONNECTOR_STATUS_CHANGED)
+		connector->epoch_counter += 1;
+exit:
+	drm_dev_exit(idx);
+
+	return ret;
+}
+
+struct gud_connector_get_edid_ctx {
+	void *buf;
+	size_t len;
+	bool edid_override;
+};
+
+static int gud_connector_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
+{
+	struct gud_connector_get_edid_ctx *ctx = data;
+	size_t start = block * EDID_LENGTH;
+
+	ctx->edid_override = false;
+
+	if (start + len > ctx->len)
+		return -1;
+
+	memcpy(buf, ctx->buf + start, len);
+
+	return 0;
+}
+
+static int gud_connector_get_modes(struct drm_connector *connector)
+{
+	struct gud_device *gdrm = to_gud_device(connector->dev);
+	struct gud_display_mode_req *reqmodes = NULL;
+	struct gud_connector_get_edid_ctx edid_ctx;
+	unsigned int i, num_modes = 0;
+	struct edid *edid = NULL;
+	int idx, ret;
+
+	if (!drm_dev_enter(connector->dev, &idx))
+		return 0;
+
+	edid_ctx.edid_override = true;
+	edid_ctx.buf = kmalloc(GUD_CONNECTOR_MAX_EDID_LEN, GFP_KERNEL);
+	if (!edid_ctx.buf)
+		goto out;
+
+	ret = gud_usb_get(gdrm, GUD_REQ_GET_CONNECTOR_EDID, connector->index,
+			  edid_ctx.buf, GUD_CONNECTOR_MAX_EDID_LEN);
+	if (ret > 0 && ret % EDID_LENGTH) {
+		gud_conn_err(connector, "Invalid EDID size", ret);
+	} else if (ret > 0) {
+		edid_ctx.len = ret;
+		edid = drm_do_get_edid(connector, gud_connector_get_edid_block, &edid_ctx);
+	}
+
+	kfree(edid_ctx.buf);
+	drm_connector_update_edid_property(connector, edid);
+
+	if (edid && edid_ctx.edid_override)
+		goto out;
+
+	reqmodes = kmalloc_array(GUD_CONNECTOR_MAX_NUM_MODES, sizeof(*reqmodes), GFP_KERNEL);
+	if (!reqmodes)
+		goto out;
+
+	ret = gud_usb_get(gdrm, GUD_REQ_GET_CONNECTOR_MODES, connector->index,
+			  reqmodes, GUD_CONNECTOR_MAX_NUM_MODES * sizeof(*reqmodes));
+	if (ret <= 0)
+		goto out;
+	if (ret % sizeof(*reqmodes)) {
+		gud_conn_err(connector, "Invalid display mode array size", ret);
+		goto out;
+	}
+
+	num_modes = ret / sizeof(*reqmodes);
+
+	for (i = 0; i < num_modes; i++) {
+		struct drm_display_mode *mode;
+
+		mode = drm_mode_create(connector->dev);
+		if (!mode) {
+			num_modes = i;
+			goto out;
+		}
+
+		gud_to_display_mode(mode, &reqmodes[i]);
+		drm_mode_probed_add(connector, mode);
+	}
+out:
+	if (!num_modes)
+		num_modes = drm_add_edid_modes(connector, edid);
+
+	kfree(reqmodes);
+	kfree(edid);
+	drm_dev_exit(idx);
+
+	return num_modes;
+}
+
+static int gud_connector_atomic_check(struct drm_connector *connector,
+				      struct drm_atomic_state *state)
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
+	if (old_state->tv.margins.left != new_state->tv.margins.left ||
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
+static const struct drm_connector_helper_funcs gud_connector_helper_funcs = {
+	.detect_ctx = gud_connector_detect,
+	.get_modes = gud_connector_get_modes,
+	.atomic_check = gud_connector_atomic_check,
+};
+
+static int gud_connector_late_register(struct drm_connector *connector)
+{
+	struct gud_connector *gconn = to_gud_connector(connector);
+
+	if (gconn->initial_brightness < 0)
+		return 0;
+
+	return gud_connector_backlight_register(gconn);
+}
+
+static void gud_connector_early_unregister(struct drm_connector *connector)
+{
+	struct gud_connector *gconn = to_gud_connector(connector);
+
+	backlight_device_unregister(gconn->backlight);
+	cancel_work_sync(&gconn->backlight_work);
+}
+
+static void gud_connector_destroy(struct drm_connector *connector)
+{
+	struct gud_connector *gconn = to_gud_connector(connector);
+
+	drm_connector_cleanup(connector);
+	kfree(gconn->properties);
+	kfree(gconn);
+}
+
+static void gud_connector_reset(struct drm_connector *connector)
+{
+	struct gud_connector *gconn = to_gud_connector(connector);
+
+	drm_atomic_helper_connector_reset(connector);
+	connector->state->tv = gconn->initial_tv_state;
+	/* Set margins from command line */
+	drm_atomic_helper_connector_tv_reset(connector);
+	if (gconn->initial_brightness >= 0)
+		connector->state->tv.brightness = gconn->initial_brightness;
+}
+
+static const struct drm_connector_funcs gud_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.late_register = gud_connector_late_register,
+	.early_unregister = gud_connector_early_unregister,
+	.destroy = gud_connector_destroy,
+	.reset = gud_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+/*
+ * The tv.mode property is shared among the connectors and its enum names are
+ * driver specific. This means that if more than one connector uses tv.mode,
+ * the enum names has to be the same.
+ */
+static int gud_connector_add_tv_mode(struct gud_device *gdrm, struct drm_connector *connector)
+{
+	size_t buf_len = GUD_CONNECTOR_TV_MODE_MAX_NUM * GUD_CONNECTOR_TV_MODE_NAME_LEN;
+	const char *modes[GUD_CONNECTOR_TV_MODE_MAX_NUM];
+	unsigned int i, num_modes;
+	char *buf;
+	int ret;
+
+	buf = kmalloc(buf_len, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = gud_usb_get(gdrm, GUD_REQ_GET_CONNECTOR_TV_MODE_VALUES,
+			  connector->index, buf, buf_len);
+	if (ret < 0)
+		goto free;
+	if (!ret || ret % GUD_CONNECTOR_TV_MODE_NAME_LEN) {
+		ret = -EIO;
+		goto free;
+	}
+
+	num_modes = ret / GUD_CONNECTOR_TV_MODE_NAME_LEN;
+	for (i = 0; i < num_modes; i++)
+		modes[i] = &buf[i * GUD_CONNECTOR_TV_MODE_NAME_LEN];
+
+	ret = drm_mode_create_tv_properties(connector->dev, num_modes, modes);
+free:
+	kfree(buf);
+	if (ret < 0)
+		gud_conn_err(connector, "Failed to add TV modes", ret);
+
+	return ret;
+}
+
+static struct drm_property *
+gud_connector_property_lookup(struct drm_connector *connector, u16 prop)
+{
+	struct drm_mode_config *config = &connector->dev->mode_config;
+
+	switch (prop) {
+	case GUD_PROPERTY_TV_LEFT_MARGIN:
+		return config->tv_left_margin_property;
+	case GUD_PROPERTY_TV_RIGHT_MARGIN:
+		return config->tv_right_margin_property;
+	case GUD_PROPERTY_TV_TOP_MARGIN:
+		return config->tv_top_margin_property;
+	case GUD_PROPERTY_TV_BOTTOM_MARGIN:
+		return config->tv_bottom_margin_property;
+	case GUD_PROPERTY_TV_MODE:
+		return config->tv_mode_property;
+	case GUD_PROPERTY_TV_BRIGHTNESS:
+		return config->tv_brightness_property;
+	case GUD_PROPERTY_TV_CONTRAST:
+		return config->tv_contrast_property;
+	case GUD_PROPERTY_TV_FLICKER_REDUCTION:
+		return config->tv_flicker_reduction_property;
+	case GUD_PROPERTY_TV_OVERSCAN:
+		return config->tv_overscan_property;
+	case GUD_PROPERTY_TV_SATURATION:
+		return config->tv_saturation_property;
+	case GUD_PROPERTY_TV_HUE:
+		return config->tv_hue_property;
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+}
+
+static unsigned int *gud_connector_tv_state_val(u16 prop, struct drm_tv_connector_state *state)
+{
+	switch (prop) {
+	case GUD_PROPERTY_TV_LEFT_MARGIN:
+		return &state->margins.left;
+	case GUD_PROPERTY_TV_RIGHT_MARGIN:
+		return &state->margins.right;
+	case GUD_PROPERTY_TV_TOP_MARGIN:
+		return &state->margins.top;
+	case GUD_PROPERTY_TV_BOTTOM_MARGIN:
+		return &state->margins.bottom;
+	case GUD_PROPERTY_TV_MODE:
+		return &state->mode;
+	case GUD_PROPERTY_TV_BRIGHTNESS:
+		return &state->brightness;
+	case GUD_PROPERTY_TV_CONTRAST:
+		return &state->contrast;
+	case GUD_PROPERTY_TV_FLICKER_REDUCTION:
+		return &state->flicker_reduction;
+	case GUD_PROPERTY_TV_OVERSCAN:
+		return &state->overscan;
+	case GUD_PROPERTY_TV_SATURATION:
+		return &state->saturation;
+	case GUD_PROPERTY_TV_HUE:
+		return &state->hue;
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+}
+
+static int gud_connector_add_properties(struct gud_device *gdrm, struct gud_connector *gconn)
+{
+	struct drm_connector *connector = &gconn->connector;
+	struct drm_device *drm = &gdrm->drm;
+	struct gud_property_req *properties;
+	unsigned int i, num_properties;
+	int ret;
+
+	properties = kcalloc(GUD_CONNECTOR_PROPERTIES_MAX_NUM, sizeof(*properties), GFP_KERNEL);
+	if (!properties)
+		return -ENOMEM;
+
+	ret = gud_usb_get(gdrm, GUD_REQ_GET_CONNECTOR_PROPERTIES, connector->index,
+			  properties, GUD_CONNECTOR_PROPERTIES_MAX_NUM * sizeof(*properties));
+	if (ret <= 0)
+		goto out;
+	if (ret % sizeof(*properties)) {
+		ret = -EIO;
+		goto out;
+	}
+
+	num_properties = ret / sizeof(*properties);
+	ret = 0;
+
+	gconn->properties = kcalloc(num_properties, sizeof(*gconn->properties), GFP_KERNEL);
+	if (!gconn->properties) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	for (i = 0; i < num_properties; i++) {
+		u16 prop = le16_to_cpu(properties[i].prop);
+		u64 val = le64_to_cpu(properties[i].val);
+		struct drm_property *property;
+		unsigned int *state_val;
+
+		drm_dbg(drm, "property: %u = %llu(0x%llx)\n", prop, val, val);
+
+		switch (prop) {
+		case GUD_PROPERTY_TV_LEFT_MARGIN:
+			fallthrough;
+		case GUD_PROPERTY_TV_RIGHT_MARGIN:
+			fallthrough;
+		case GUD_PROPERTY_TV_TOP_MARGIN:
+			fallthrough;
+		case GUD_PROPERTY_TV_BOTTOM_MARGIN:
+			ret = drm_mode_create_tv_margin_properties(drm);
+			if (ret)
+				goto out;
+			break;
+		case GUD_PROPERTY_TV_MODE:
+			ret = gud_connector_add_tv_mode(gdrm, connector);
+			if (ret)
+				goto out;
+			break;
+		case GUD_PROPERTY_TV_BRIGHTNESS:
+			fallthrough;
+		case GUD_PROPERTY_TV_CONTRAST:
+			fallthrough;
+		case GUD_PROPERTY_TV_FLICKER_REDUCTION:
+			fallthrough;
+		case GUD_PROPERTY_TV_OVERSCAN:
+			fallthrough;
+		case GUD_PROPERTY_TV_SATURATION:
+			fallthrough;
+		case GUD_PROPERTY_TV_HUE:
+			/* This is a no-op if already added. */
+			ret = drm_mode_create_tv_properties(drm, 0, NULL);
+			if (ret)
+				goto out;
+			break;
+		case GUD_PROPERTY_BACKLIGHT_BRIGHTNESS:
+			if (val > 100) {
+				ret = -EINVAL;
+				goto out;
+			}
+			gconn->initial_brightness = val;
+			break;
+		default:
+			/* New ones might show up in future devices, skip those we don't know. */
+			drm_dbg(drm, "Ignoring unknown property: %u\n", prop);
+			continue;
+		}
+
+		gconn->properties[gconn->num_properties++] = prop;
+
+		if (prop == GUD_PROPERTY_BACKLIGHT_BRIGHTNESS)
+			continue; /* not a DRM property */
+
+		property = gud_connector_property_lookup(connector, prop);
+		if (WARN_ON(IS_ERR(property)))
+			continue;
+
+		state_val = gud_connector_tv_state_val(prop, &gconn->initial_tv_state);
+		if (WARN_ON(IS_ERR(state_val)))
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
+int gud_connector_fill_properties(struct drm_connector_state *connector_state,
+				  struct gud_property_req *properties)
+{
+	struct gud_connector *gconn = to_gud_connector(connector_state->connector);
+	unsigned int i;
+
+	for (i = 0; i < gconn->num_properties; i++) {
+		u16 prop = gconn->properties[i];
+		u64 val;
+
+		if (prop == GUD_PROPERTY_BACKLIGHT_BRIGHTNESS) {
+			val = connector_state->tv.brightness;
+		} else {
+			unsigned int *state_val;
+
+			state_val = gud_connector_tv_state_val(prop, &connector_state->tv);
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
+static int gud_connector_create(struct gud_device *gdrm, unsigned int index,
+				struct gud_connector_descriptor_req *desc)
+{
+	struct drm_device *drm = &gdrm->drm;
+	struct gud_connector *gconn;
+	struct drm_connector *connector;
+	struct drm_encoder *encoder;
+	int ret, connector_type;
+	u32 flags;
+
+	gconn = kzalloc(sizeof(*gconn), GFP_KERNEL);
+	if (!gconn)
+		return -ENOMEM;
+
+	INIT_WORK(&gconn->backlight_work, gud_connector_backlight_update_status_work);
+	gconn->initial_brightness = -ENODEV;
+	flags = le32_to_cpu(desc->flags);
+	connector = &gconn->connector;
+
+	drm_dbg(drm, "Connector: index=%u type=%u flags=0x%x\n", index, desc->connector_type, flags);
+
+	switch (desc->connector_type) {
+	case GUD_CONNECTOR_TYPE_PANEL:
+		connector_type = DRM_MODE_CONNECTOR_USB;
+		break;
+	case GUD_CONNECTOR_TYPE_VGA:
+		connector_type = DRM_MODE_CONNECTOR_VGA;
+		break;
+	case GUD_CONNECTOR_TYPE_DVI:
+		connector_type = DRM_MODE_CONNECTOR_DVID;
+		break;
+	case GUD_CONNECTOR_TYPE_COMPOSITE:
+		connector_type = DRM_MODE_CONNECTOR_Composite;
+		break;
+	case GUD_CONNECTOR_TYPE_SVIDEO:
+		connector_type = DRM_MODE_CONNECTOR_SVIDEO;
+		break;
+	case GUD_CONNECTOR_TYPE_COMPONENT:
+		connector_type = DRM_MODE_CONNECTOR_Component;
+		break;
+	case GUD_CONNECTOR_TYPE_DISPLAYPORT:
+		connector_type = DRM_MODE_CONNECTOR_DisplayPort;
+		break;
+	case GUD_CONNECTOR_TYPE_HDMI:
+		connector_type = DRM_MODE_CONNECTOR_HDMIA;
+		break;
+	default: /* future types */
+		connector_type = DRM_MODE_CONNECTOR_USB;
+		break;
+	};
+
+	drm_connector_helper_add(connector, &gud_connector_helper_funcs);
+	ret = drm_connector_init(drm, connector, &gud_connector_funcs, connector_type);
+	if (ret) {
+		kfree(connector);
+		return ret;
+	}
+
+	if (WARN_ON(connector->index != index))
+		return -EINVAL;
+
+	if (flags & GUD_CONNECTOR_FLAGS_POLL_STATUS)
+		connector->polled = (DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT);
+	if (flags & GUD_CONNECTOR_FLAGS_INTERLACE)
+		connector->interlace_allowed = true;
+	if (flags & GUD_CONNECTOR_FLAGS_DOUBLESCAN)
+		connector->doublescan_allowed = true;
+
+	ret = gud_connector_add_properties(gdrm, gconn);
+	if (ret) {
+		gud_conn_err(connector, "Failed to add properties", ret);
+		return ret;
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
+
+int gud_get_connectors(struct gud_device *gdrm)
+{
+	struct gud_connector_descriptor_req *descs;
+	unsigned int i, num_connectors;
+	int ret;
+
+	descs = kmalloc_array(GUD_CONNECTORS_MAX_NUM, sizeof(*descs), GFP_KERNEL);
+	if (!descs)
+		return -ENOMEM;
+
+	ret = gud_usb_get(gdrm, GUD_REQ_GET_CONNECTORS, 0,
+			  descs, GUD_CONNECTORS_MAX_NUM * sizeof(descs));
+	if (ret < 0)
+		goto free;
+	if (!ret || ret % sizeof(*descs)) {
+		ret = -EIO;
+		goto free;
+	}
+
+	num_connectors = ret / sizeof(*descs);
+
+	for (i = 0; i < num_connectors; i++) {
+		ret = gud_connector_create(gdrm, i, &descs[i]);
+		if (ret)
+			goto free;
+	}
+free:
+	kfree(descs);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
new file mode 100644
index 000000000000..2e3056e4d271
--- /dev/null
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -0,0 +1,659 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2020 Noralf Trønnes
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/dma-mapping.h>
+#include <linux/lz4.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/string_helpers.h>
+#include <linux/usb.h>
+#include <linux/vmalloc.h>
+#include <linux/workqueue.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_debugfs.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+#include <drm/gud.h>
+
+#include "gud_internal.h"
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
+static const struct drm_format_info gud_drm_format_rgb111 = {
+	.format = GUD_DRM_FORMAT_RGB111,
+	.num_planes = 1,
+	.char_per_block = { 1, 0, 0 },
+	.block_w = { 2, 0, 0 },
+	.block_h = { 1, 0, 0 },
+	.hsub = 1,
+	.vsub = 1,
+};
+
+static int gud_usb_control_msg(struct usb_interface *intf, bool in,
+			       u8 request, u16 value, void *buf, size_t len)
+{
+	u8 requesttype = USB_TYPE_VENDOR | USB_RECIP_INTERFACE;
+	u8 ifnum = intf->cur_altsetting->desc.bInterfaceNumber;
+	struct usb_device *usb = interface_to_usbdev(intf);
+	unsigned int pipe;
+
+	if (len && !buf)
+		return -EINVAL;
+
+	if (in) {
+		pipe = usb_rcvctrlpipe(usb, 0);
+		requesttype |= USB_DIR_IN;
+	} else {
+		pipe = usb_sndctrlpipe(usb, 0);
+		requesttype |= USB_DIR_OUT;
+	}
+
+	return usb_control_msg(usb, pipe, request, requesttype, value,
+			       ifnum, buf, len, USB_CTRL_GET_TIMEOUT);
+}
+
+static int gud_get_display_descriptor(struct usb_interface *intf,
+				      struct gud_display_descriptor_req *desc)
+{
+	void *buf;
+	int ret;
+
+	buf = kmalloc(sizeof(*desc), GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = gud_usb_control_msg(intf, true, GUD_REQ_GET_DESCRIPTOR, 0, buf, sizeof(*desc));
+	memcpy(desc, buf, sizeof(*desc));
+	kfree(buf);
+	if (ret < 0)
+		return ret;
+	if (ret != sizeof(*desc))
+		return -EIO;
+
+	if (desc->magic != le32_to_cpu(GUD_DISPLAY_MAGIC))
+		return -ENODATA;
+
+	DRM_DEV_DEBUG_DRIVER(&intf->dev,
+			     "version=%u flags=0x%x compression=0x%x max_buffer_size=%u\n",
+			     desc->version, le32_to_cpu(desc->flags), desc->compression,
+			     le32_to_cpu(desc->max_buffer_size));
+
+	if (!desc->version || !desc->max_width || !desc->max_height ||
+	    le32_to_cpu(desc->min_width) > le32_to_cpu(desc->max_width) ||
+	    le32_to_cpu(desc->min_height) > le32_to_cpu(desc->max_height))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int gud_status_to_errno(u8 status)
+{
+	switch (status) {
+	case GUD_STATUS_OK:
+		return 0;
+	case GUD_STATUS_BUSY:
+		return -EBUSY;
+	case GUD_STATUS_REQUEST_NOT_SUPPORTED:
+		return -EOPNOTSUPP;
+	case GUD_STATUS_PROTOCOL_ERROR:
+		return -EPROTO;
+	case GUD_STATUS_INVALID_PARAMETER:
+		return -EINVAL;
+	case GUD_STATUS_ERROR:
+		return -EREMOTEIO;
+	default:
+		return -EREMOTEIO;
+	}
+}
+
+static int gud_usb_get_status(struct usb_interface *intf)
+{
+	int ret, status = -EIO;
+	u8 *buf;
+
+	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = gud_usb_control_msg(intf, true, GUD_REQ_GET_STATUS, 0, buf, sizeof(*buf));
+	if (ret == sizeof(*buf))
+		status = gud_status_to_errno(*buf);
+	kfree(buf);
+
+	if (ret < 0)
+		return ret;
+
+	return status;
+}
+
+static int gud_usb_transfer(struct gud_device *gdrm, bool in, u8 request, u16 index,
+			    void *buf, size_t len)
+{
+	struct usb_interface *intf = to_usb_interface(gdrm->drm.dev);
+	int idx, ret;
+
+	drm_dbg(&gdrm->drm, "%s: request=0x%x index=%u len=%zu\n",
+		in ? "get" : "set", request, index, len);
+
+	if (!drm_dev_enter(&gdrm->drm, &idx))
+		return -ENODEV;
+
+	mutex_lock(&gdrm->ctrl_lock);
+
+	ret = gud_usb_control_msg(intf, in, request, index, buf, len);
+	if (ret == -EPIPE || ((gdrm->flags & GUD_DISPLAY_FLAG_STATUS_ON_SET) && !in && ret >= 0)) {
+		int status;
+
+		status = gud_usb_get_status(intf);
+		if (status < 0) {
+			ret = status;
+		} else if (ret < 0) {
+			dev_err_once(gdrm->drm.dev,
+				     "Unexpected status OK for failed transfer\n");
+			ret = -EPIPE;
+		}
+	}
+
+	if (ret < 0) {
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
+/*
+ * @buf cannot be allocated on the stack.
+ * Returns number of bytes received or negative error code on failure.
+ */
+int gud_usb_get(struct gud_device *gdrm, u8 request, u16 index, void *buf, size_t max_len)
+{
+	return gud_usb_transfer(gdrm, true, request, index, buf, max_len);
+}
+
+/*
+ * @buf can be allocated on the stack or NULL.
+ * Returns zero on success or negative error code on failure.
+ */
+int gud_usb_set(struct gud_device *gdrm, u8 request, u16 index, void *buf, size_t len)
+{
+	void *trbuf = NULL;
+	int ret;
+
+	if (buf && len) {
+		trbuf = kmemdup(buf, len, GFP_KERNEL);
+		if (!trbuf)
+			return -ENOMEM;
+	}
+
+	ret = gud_usb_transfer(gdrm, false, request, index, trbuf, len);
+	kfree(trbuf);
+	if (ret < 0)
+		return ret;
+
+	return ret != len ? -EIO : 0;
+}
+
+/*
+ * @val can be allocated on the stack.
+ * Returns zero on success or negative error code on failure.
+ */
+int gud_usb_get_u8(struct gud_device *gdrm, u8 request, u16 index, u8 *val)
+{
+	u8 *buf;
+	int ret;
+
+	buf = kmalloc(sizeof(*val), GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = gud_usb_get(gdrm, request, index, buf, sizeof(*val));
+	*val = *buf;
+	kfree(buf);
+	if (ret < 0)
+		return ret;
+
+	return ret != sizeof(*val) ? -EIO : 0;
+}
+
+/* Returns zero on success or negative error code on failure. */
+int gud_usb_set_u8(struct gud_device *gdrm, u8 request, u8 val)
+{
+	return gud_usb_set(gdrm, request, 0, &val, sizeof(val));
+}
+
+static int gud_get_properties(struct gud_device *gdrm)
+{
+	struct gud_property_req *properties;
+	unsigned int i, num_properties;
+	int ret;
+
+	properties = kcalloc(GUD_PROPERTIES_MAX_NUM, sizeof(*properties), GFP_KERNEL);
+	if (!properties)
+		return -ENOMEM;
+
+	ret = gud_usb_get(gdrm, GUD_REQ_GET_PROPERTIES, 0,
+			  properties, GUD_PROPERTIES_MAX_NUM * sizeof(*properties));
+	if (ret <= 0)
+		goto out;
+	if (ret % sizeof(*properties)) {
+		ret = -EIO;
+		goto out;
+	}
+
+	num_properties = ret / sizeof(*properties);
+
+	gdrm->properties = drmm_kcalloc(&gdrm->drm, num_properties, sizeof(*gdrm->properties),
+					GFP_KERNEL);
+	if (!gdrm->properties) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	for (i = 0; i < num_properties; i++) {
+		u16 prop = le16_to_cpu(properties[i].prop);
+		u64 val = le64_to_cpu(properties[i].val);
+
+		switch (prop) {
+		case GUD_PROPERTY_ROTATION:
+			/*
+			 * DRM UAPI matches the protocol so use the value directly,
+			 * but mask out any additions on future devices.
+			 */
+			val &= GUD_ROTATION_MASK;
+			ret = drm_plane_create_rotation_property(&gdrm->pipe.plane,
+								 DRM_MODE_ROTATE_0, val);
+			break;
+		default:
+			/* New ones might show up in future devices, skip those we don't know. */
+			drm_dbg(&gdrm->drm, "Ignoring unknown property: %u\n", prop);
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
+/*
+ * FIXME: Dma-buf sharing requires DMA support by the importing device.
+ *        This function is a workaround to make USB devices work as well.
+ *        See todo.rst for how to fix the issue in the dma-buf framework.
+ */
+static struct drm_gem_object *gud_gem_prime_import(struct drm_device *drm, struct dma_buf *dma_buf)
+{
+	struct gud_device *gdrm = to_gud_device(drm);
+
+	if (!gdrm->dmadev)
+		return ERR_PTR(-ENODEV);
+
+	return drm_gem_prime_import_dev(drm, dma_buf, gdrm->dmadev);
+}
+
+static int gud_stats_debugfs(struct seq_file *m, void *data)
+{
+	struct drm_info_node *node = m->private;
+	struct gud_device *gdrm = to_gud_device(node->minor->dev);
+	char buf[10];
+
+	string_get_size(gdrm->bulk_len, 1, STRING_UNITS_2, buf, sizeof(buf));
+	seq_printf(m, "Max buffer size: %s\n", buf);
+	seq_printf(m, "Number of errors:  %u\n", gdrm->stats_num_errors);
+
+	seq_puts(m, "Compression:      ");
+	if (gdrm->compression & GUD_COMPRESSION_LZ4)
+		seq_puts(m, " lz4");
+	if (!gdrm->compression)
+		seq_puts(m, " none");
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
+static const struct drm_info_list gud_debugfs_list[] = {
+	{ "stats", gud_stats_debugfs, 0, NULL },
+};
+
+static void gud_debugfs_init(struct drm_minor *minor)
+{
+	drm_debugfs_create_files(gud_debugfs_list, ARRAY_SIZE(gud_debugfs_list),
+				 minor->debugfs_root, minor);
+}
+
+static const struct drm_simple_display_pipe_funcs gud_pipe_funcs = {
+	.check      = gud_pipe_check,
+	.update	    = gud_pipe_update,
+	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
+};
+
+static const struct drm_mode_config_funcs gud_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create_with_dirty,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static const u64 gud_pipe_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
+DEFINE_DRM_GEM_FOPS(gud_fops);
+
+static const struct drm_driver gud_drm_driver = {
+	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
+	.fops			= &gud_fops,
+	DRM_GEM_SHMEM_DRIVER_OPS,
+	.gem_prime_import	= gud_gem_prime_import,
+	.debugfs_init		= gud_debugfs_init,
+
+	.name			= "gud",
+	.desc			= "Generic USB Display",
+	.date			= "20200422",
+	.major			= 1,
+	.minor			= 0,
+};
+
+static void gud_free_buffers_and_mutex(struct drm_device *drm, void *unused)
+{
+	struct gud_device *gdrm = to_gud_device(drm);
+
+	vfree(gdrm->compress_buf);
+	kfree(gdrm->bulk_buf);
+	mutex_destroy(&gdrm->ctrl_lock);
+	mutex_destroy(&gdrm->damage_lock);
+}
+
+static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
+{
+	const struct drm_format_info *xrgb8888_emulation_format = NULL;
+	bool rgb565_supported = false, xrgb8888_supported = false;
+	unsigned int num_formats_dev, num_formats = 0;
+	struct usb_endpoint_descriptor *bulk_out;
+	struct gud_display_descriptor_req desc;
+	struct device *dev = &intf->dev;
+	size_t max_buffer_size = 0;
+	struct gud_device *gdrm;
+	struct drm_device *drm;
+	u8 *formats_dev;
+	u32 *formats;
+	int ret, i;
+
+	ret = usb_find_bulk_out_endpoint(intf->cur_altsetting, &bulk_out);
+	if (ret)
+		return ret;
+
+	ret = gud_get_display_descriptor(intf, &desc);
+	if (ret) {
+		DRM_DEV_DEBUG_DRIVER(dev, "Not a display interface: ret=%d\n", ret);
+		return -ENODEV;
+	}
+
+	if (desc.version > 1) {
+		dev_err(dev, "Protocol version %u is not supported\n", desc.version);
+		return -ENODEV;
+	}
+
+	gdrm = devm_drm_dev_alloc(dev, &gud_drm_driver, struct gud_device, drm);
+	if (IS_ERR(gdrm))
+		return PTR_ERR(gdrm);
+
+	drm = &gdrm->drm;
+	drm->mode_config.funcs = &gud_mode_config_funcs;
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
+
+	gdrm->flags = le32_to_cpu(desc.flags);
+	gdrm->compression = desc.compression & GUD_COMPRESSION_LZ4;
+
+	if (gdrm->flags & GUD_DISPLAY_FLAG_FULL_UPDATE && gdrm->compression)
+		return -EINVAL;
+
+	mutex_init(&gdrm->ctrl_lock);
+	mutex_init(&gdrm->damage_lock);
+	INIT_WORK(&gdrm->work, gud_flush_work);
+	gud_clear_damage(gdrm);
+
+	ret = drmm_add_action_or_reset(drm, gud_free_buffers_and_mutex, NULL);
+	if (ret)
+		return ret;
+
+	drm->mode_config.min_width = le32_to_cpu(desc.min_width);
+	drm->mode_config.max_width = le32_to_cpu(desc.max_width);
+	drm->mode_config.min_height = le32_to_cpu(desc.min_height);
+	drm->mode_config.max_height = le32_to_cpu(desc.max_height);
+
+	formats_dev = devm_kmalloc(dev, GUD_FORMATS_MAX_NUM, GFP_KERNEL);
+	/* Add room for emulated XRGB8888 */
+	formats = devm_kmalloc_array(dev, GUD_FORMATS_MAX_NUM + 1, sizeof(*formats), GFP_KERNEL);
+	if (!formats_dev || !formats)
+		return -ENOMEM;
+
+	ret = gud_usb_get(gdrm, GUD_REQ_GET_FORMATS, 0, formats_dev, GUD_FORMATS_MAX_NUM);
+	if (ret < 0)
+		return ret;
+
+	num_formats_dev = ret;
+	for (i = 0; i < num_formats_dev; i++) {
+		const struct drm_format_info *info;
+		size_t fmt_buf_size;
+		u32 format;
+
+		format = gud_to_fourcc(formats_dev[i]);
+		if (!format) {
+			drm_dbg(drm, "Unsupported format: 0x%02x\n", formats_dev[i]);
+			continue;
+		}
+
+		if (format == GUD_DRM_FORMAT_R1)
+			info = &gud_drm_format_r1;
+		else if (format == GUD_DRM_FORMAT_RGB111)
+			info = &gud_drm_format_rgb111;
+		else
+			info = drm_format_info(format);
+
+		switch (format) {
+		case GUD_DRM_FORMAT_R1:
+			fallthrough;
+		case GUD_DRM_FORMAT_RGB111:
+			xrgb8888_emulation_format = info;
+			break;
+		case DRM_FORMAT_RGB565:
+			rgb565_supported = true;
+			if (!xrgb8888_emulation_format)
+				xrgb8888_emulation_format = info;
+			break;
+		case DRM_FORMAT_XRGB8888:
+			xrgb8888_supported = true;
+			break;
+		};
+
+		fmt_buf_size = drm_format_info_min_pitch(info, 0, drm->mode_config.max_width) *
+			       drm->mode_config.max_height;
+		max_buffer_size = max(max_buffer_size, fmt_buf_size);
+
+		if (format == GUD_DRM_FORMAT_R1)
+			continue; /* Internal not for userspace */
+
+		formats[num_formats++] = format;
+	}
+
+	if (!num_formats && !xrgb8888_emulation_format) {
+		dev_err(dev, "No supported pixel formats found\n");
+		return -EINVAL;
+	}
+
+	/* Prefer speed over color depth */
+	if (rgb565_supported)
+		drm->mode_config.preferred_depth = 16;
+
+	if (!xrgb8888_supported && xrgb8888_emulation_format) {
+		gdrm->xrgb8888_emulation_format = xrgb8888_emulation_format;
+		formats[num_formats++] = DRM_FORMAT_XRGB8888;
+	}
+
+	if (desc.max_buffer_size)
+		max_buffer_size = le32_to_cpu(desc.max_buffer_size);
+retry:
+	/*
+	 * Use plain kmalloc here since devm_kmalloc() places struct devres at the beginning
+	 * of the buffer it allocates. This wastes a lot of memory when allocating big buffers.
+	 * Asking for 2M would actually allocate 4M. This would also prevent getting the biggest
+	 * possible buffer potentially leading to split transfers.
+	 */
+	gdrm->bulk_buf = kmalloc(max_buffer_size, GFP_KERNEL | __GFP_NOWARN);
+	if (!gdrm->bulk_buf) {
+		max_buffer_size = roundup_pow_of_two(max_buffer_size) / 2;
+		if (max_buffer_size < SZ_512K)
+			return -ENOMEM;
+		goto retry;
+	}
+
+	gdrm->bulk_pipe = usb_sndbulkpipe(interface_to_usbdev(intf), usb_endpoint_num(bulk_out));
+	gdrm->bulk_len = max_buffer_size;
+
+	if (gdrm->compression & GUD_COMPRESSION_LZ4) {
+		gdrm->lz4_comp_mem = devm_kmalloc(dev, LZ4_MEM_COMPRESS, GFP_KERNEL);
+		if (!gdrm->lz4_comp_mem)
+			return -ENOMEM;
+
+		gdrm->compress_buf = vmalloc(gdrm->bulk_len);
+		if (!gdrm->compress_buf)
+			return -ENOMEM;
+	}
+
+	ret = drm_simple_display_pipe_init(drm, &gdrm->pipe, &gud_pipe_funcs,
+					   formats, num_formats,
+					   gud_pipe_modifiers, NULL);
+	if (ret)
+		return ret;
+
+	devm_kfree(dev, formats);
+	devm_kfree(dev, formats_dev);
+
+	ret = gud_get_properties(gdrm);
+	if (ret) {
+		dev_err(dev, "Failed to get properties (error=%d)\n", ret);
+		return ret;
+	}
+
+	drm_plane_enable_fb_damage_clips(&gdrm->pipe.plane);
+
+	ret = gud_get_connectors(gdrm);
+	if (ret) {
+		dev_err(dev, "Failed to get connectors (error=%d)\n", ret);
+		return ret;
+	}
+
+	drm_mode_config_reset(drm);
+
+	usb_set_intfdata(intf, gdrm);
+
+	gdrm->dmadev = usb_intf_get_dma_device(intf);
+	if (!gdrm->dmadev)
+		dev_warn(dev, "buffer sharing not supported");
+
+	ret = drm_dev_register(drm, 0);
+	if (ret) {
+		put_device(gdrm->dmadev);
+		return ret;
+	}
+
+	drm_kms_helper_poll_init(drm);
+
+	drm_fbdev_generic_setup(drm, 0);
+
+	return 0;
+}
+
+static void gud_disconnect(struct usb_interface *interface)
+{
+	struct gud_device *gdrm = usb_get_intfdata(interface);
+	struct drm_device *drm = &gdrm->drm;
+
+	drm_dbg(drm, "%s:\n", __func__);
+
+	drm_kms_helper_poll_fini(drm);
+	drm_dev_unplug(drm);
+	drm_atomic_helper_shutdown(drm);
+	put_device(gdrm->dmadev);
+	gdrm->dmadev = NULL;
+}
+
+static int gud_suspend(struct usb_interface *intf, pm_message_t message)
+{
+	struct gud_device *gdrm = usb_get_intfdata(intf);
+
+	return drm_mode_config_helper_suspend(&gdrm->drm);
+}
+
+static int gud_resume(struct usb_interface *intf)
+{
+	struct gud_device *gdrm = usb_get_intfdata(intf);
+
+	drm_mode_config_helper_resume(&gdrm->drm);
+
+	return 0;
+}
+
+static const struct usb_device_id gud_id_table[] = {
+	{ USB_DEVICE_INTERFACE_CLASS(0x1d50, 0x614d, USB_CLASS_VENDOR_SPEC) },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(usb, gud_id_table);
+
+static struct usb_driver gud_usb_driver = {
+	.name		= "gud",
+	.probe		= gud_probe,
+	.disconnect	= gud_disconnect,
+	.id_table	= gud_id_table,
+	.suspend	= gud_suspend,
+	.resume		= gud_resume,
+	.reset_resume	= gud_resume,
+};
+
+module_usb_driver(gud_usb_driver);
+
+MODULE_AUTHOR("Noralf Trønnes");
+MODULE_LICENSE("Dual MIT/GPL");
diff --git a/drivers/gpu/drm/gud/gud_internal.h b/drivers/gpu/drm/gud/gud_internal.h
new file mode 100644
index 000000000000..b3fd2bdd4901
--- /dev/null
+++ b/drivers/gpu/drm/gud/gud_internal.h
@@ -0,0 +1,154 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef __LINUX_GUD_INTERNAL_H
+#define __LINUX_GUD_INTERNAL_H
+
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/usb.h>
+#include <linux/workqueue.h>
+#include <uapi/drm/drm_fourcc.h>
+
+#include <drm/drm_modes.h>
+#include <drm/drm_simple_kms_helper.h>
+
+struct gud_device {
+	struct drm_device drm;
+	struct drm_simple_display_pipe pipe;
+	struct device *dmadev;
+	struct work_struct work;
+	u32 flags;
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
+	struct mutex ctrl_lock; /* Serialize get/set and status transfers */
+
+	struct mutex damage_lock; /* Protects the following members: */
+	struct drm_framebuffer *fb;
+	struct drm_rect damage;
+	bool prev_flush_failed;
+};
+
+static inline struct gud_device *to_gud_device(struct drm_device *drm)
+{
+	return container_of(drm, struct gud_device, drm);
+}
+
+static inline struct usb_device *gud_to_usb_device(struct gud_device *gdrm)
+{
+	return interface_to_usbdev(to_usb_interface(gdrm->drm.dev));
+}
+
+int gud_usb_get(struct gud_device *gdrm, u8 request, u16 index, void *buf, size_t len);
+int gud_usb_set(struct gud_device *gdrm, u8 request, u16 index, void *buf, size_t len);
+int gud_usb_get_u8(struct gud_device *gdrm, u8 request, u16 index, u8 *val);
+int gud_usb_set_u8(struct gud_device *gdrm, u8 request, u8 val);
+
+void gud_clear_damage(struct gud_device *gdrm);
+void gud_flush_work(struct work_struct *work);
+int gud_pipe_check(struct drm_simple_display_pipe *pipe,
+		   struct drm_plane_state *new_plane_state,
+		   struct drm_crtc_state *new_crtc_state);
+void gud_pipe_update(struct drm_simple_display_pipe *pipe,
+		     struct drm_plane_state *old_state);
+int gud_connector_fill_properties(struct drm_connector_state *connector_state,
+				  struct gud_property_req *properties);
+int gud_get_connectors(struct gud_device *gdrm);
+
+/* Driver internal fourcc transfer formats */
+#define GUD_DRM_FORMAT_R1	0x00000122
+#define GUD_DRM_FORMAT_RGB111	0x03121722
+
+static inline u8 gud_from_fourcc(u32 fourcc)
+{
+	switch (fourcc) {
+	case GUD_DRM_FORMAT_R1:
+		return GUD_PIXEL_FORMAT_R1;
+	case GUD_DRM_FORMAT_RGB111:
+		return GUD_PIXEL_FORMAT_RGB111;
+	case DRM_FORMAT_RGB565:
+		return GUD_PIXEL_FORMAT_RGB565;
+	case DRM_FORMAT_XRGB8888:
+		return GUD_PIXEL_FORMAT_XRGB8888;
+	case DRM_FORMAT_ARGB8888:
+		return GUD_PIXEL_FORMAT_ARGB8888;
+	};
+
+	return 0;
+}
+
+static inline u32 gud_to_fourcc(u8 format)
+{
+	switch (format) {
+	case GUD_PIXEL_FORMAT_R1:
+		return GUD_DRM_FORMAT_R1;
+	case GUD_PIXEL_FORMAT_RGB111:
+		return GUD_DRM_FORMAT_RGB111;
+	case GUD_PIXEL_FORMAT_RGB565:
+		return DRM_FORMAT_RGB565;
+	case GUD_PIXEL_FORMAT_XRGB8888:
+		return DRM_FORMAT_XRGB8888;
+	case GUD_PIXEL_FORMAT_ARGB8888:
+		return DRM_FORMAT_ARGB8888;
+	};
+
+	return 0;
+}
+
+static inline void gud_from_display_mode(struct gud_display_mode_req *dst,
+					 const struct drm_display_mode *src)
+{
+	u32 flags = src->flags & GUD_DISPLAY_MODE_FLAG_USER_MASK;
+
+	if (src->type & DRM_MODE_TYPE_PREFERRED)
+		flags |= GUD_DISPLAY_MODE_FLAG_PREFERRED;
+
+	dst->clock = cpu_to_le32(src->clock);
+	dst->hdisplay = cpu_to_le16(src->hdisplay);
+	dst->hsync_start = cpu_to_le16(src->hsync_start);
+	dst->hsync_end = cpu_to_le16(src->hsync_end);
+	dst->htotal = cpu_to_le16(src->htotal);
+	dst->vdisplay = cpu_to_le16(src->vdisplay);
+	dst->vsync_start = cpu_to_le16(src->vsync_start);
+	dst->vsync_end = cpu_to_le16(src->vsync_end);
+	dst->vtotal = cpu_to_le16(src->vtotal);
+	dst->flags = cpu_to_le32(flags);
+}
+
+static inline void gud_to_display_mode(struct drm_display_mode *dst,
+				       const struct gud_display_mode_req *src)
+{
+	u32 flags = le32_to_cpu(src->flags);
+
+	memset(dst, 0, sizeof(*dst));
+	dst->clock = le32_to_cpu(src->clock);
+	dst->hdisplay = le16_to_cpu(src->hdisplay);
+	dst->hsync_start = le16_to_cpu(src->hsync_start);
+	dst->hsync_end = le16_to_cpu(src->hsync_end);
+	dst->htotal = le16_to_cpu(src->htotal);
+	dst->vdisplay = le16_to_cpu(src->vdisplay);
+	dst->vsync_start = le16_to_cpu(src->vsync_start);
+	dst->vsync_end = le16_to_cpu(src->vsync_end);
+	dst->vtotal = le16_to_cpu(src->vtotal);
+	dst->flags = flags & GUD_DISPLAY_MODE_FLAG_USER_MASK;
+	dst->type = DRM_MODE_TYPE_DRIVER;
+	if (flags & GUD_DISPLAY_MODE_FLAG_PREFERRED)
+		dst->type |= DRM_MODE_TYPE_PREFERRED;
+	drm_mode_set_name(dst);
+}
+
+#endif
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
new file mode 100644
index 000000000000..1b036c7d781e
--- /dev/null
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -0,0 +1,535 @@
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
+#include <drm/gud.h>
+
+#include "gud_internal.h"
+
+static bool gud_is_big_endian(void)
+{
+#if defined(__BIG_ENDIAN)
+	return true;
+#else
+	return false;
+#endif
+}
+
+static size_t gud_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format,
+				   void *src, struct drm_framebuffer *fb,
+				   struct drm_rect *rect)
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
+		return 0;
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
+static size_t gud_xrgb8888_to_color(u8 *dst, const struct drm_format_info *format,
+				    u32 *src, struct drm_framebuffer *fb,
+				    struct drm_rect *rect)
+{
+	unsigned int block_width = drm_format_info_block_width(format, 0);
+	unsigned int x, y, width, height;
+	u8 r, g, b, *block = dst; /* Assign to silence compiler warning */
+	size_t len;
+
+	/* Start on a byte boundary */
+	rect->x1 = ALIGN_DOWN(rect->x1, block_width);
+	width = drm_rect_width(rect);
+	height = drm_rect_height(rect);
+	len = drm_format_info_min_pitch(format, 0, width) * height;
+
+	for (y = 0; y < height; y++) {
+		for (x = 0; x < width; x++) {
+			if (!(x % block_width)) {
+				block = dst++;
+				*block = 0;
+			}
+
+			r = *src >> 16;
+			g = *src >> 8;
+			b = *src++;
+
+			switch (format->format) {
+			case GUD_DRM_FORMAT_RGB111:
+				*block <<= 4;
+				*block |= ((r >> 7) << 2) | ((g >> 7) << 1) | (b >> 7);
+				break;
+			default:
+				WARN_ON_ONCE(1);
+				return len;
+			};
+		}
+	}
+
+	return len;
+}
+
+static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
+			  const struct drm_format_info *format, struct drm_rect *rect,
+			  struct gud_set_buffer_req *req)
+{
+	struct dma_buf_attachment *import_attach = fb->obj[0]->import_attach;
+	u8 compression = gdrm->compression;
+	struct dma_buf_map map;
+	void *vaddr, *buf;
+	size_t pitch, len;
+	int ret = 0;
+
+	pitch = drm_format_info_min_pitch(format, 0, drm_rect_width(rect));
+	len = pitch * drm_rect_height(rect);
+	if (len > gdrm->bulk_len)
+		return -E2BIG;
+
+	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
+	if (ret)
+		return ret;
+
+	vaddr = map.vaddr + fb->offsets[0];
+
+	if (import_attach) {
+		ret = dma_buf_begin_cpu_access(import_attach->dmabuf, DMA_FROM_DEVICE);
+		if (ret)
+			goto vunmap;
+	}
+retry:
+	if (compression)
+		buf = gdrm->compress_buf;
+	else
+		buf = gdrm->bulk_buf;
+
+	/*
+	 * Imported buffers are assumed to be write-combined and thus uncached
+	 * with slow reads (at least on ARM).
+	 */
+	if (format != fb->format) {
+		if (format->format == GUD_DRM_FORMAT_R1) {
+			len = gud_xrgb8888_to_r124(buf, format, vaddr, fb, rect);
+			if (!len) {
+				ret = -ENOMEM;
+				goto end_cpu_access;
+			}
+		} else if (format->format == DRM_FORMAT_RGB565) {
+			drm_fb_xrgb8888_to_rgb565(buf, vaddr, fb, rect, gud_is_big_endian());
+		} else {
+			len = gud_xrgb8888_to_color(buf, format, vaddr, fb, rect);
+		}
+	} else if (gud_is_big_endian() && format->cpp[0] > 1) {
+		drm_fb_swab(buf, vaddr, fb, rect, !import_attach);
+	} else if (compression && !import_attach && pitch == fb->pitches[0]) {
+		/* can compress directly from the framebuffer */
+		buf = vaddr + rect->y1 * pitch;
+	} else {
+		drm_fb_memcpy(buf, vaddr, fb, rect);
+	}
+
+	memset(req, 0, sizeof(*req));
+	req->x = cpu_to_le32(rect->x1);
+	req->y = cpu_to_le32(rect->y1);
+	req->width = cpu_to_le32(drm_rect_width(rect));
+	req->height = cpu_to_le32(drm_rect_height(rect));
+	req->length = cpu_to_le32(len);
+
+	if (compression & GUD_COMPRESSION_LZ4) {
+		int complen;
+
+		complen = LZ4_compress_default(buf, gdrm->bulk_buf, len, len, gdrm->lz4_comp_mem);
+		if (complen <= 0) {
+			compression = 0;
+			goto retry;
+		}
+
+		req->compression = GUD_COMPRESSION_LZ4;
+		req->compressed_length = cpu_to_le32(complen);
+	}
+
+end_cpu_access:
+	if (import_attach)
+		dma_buf_end_cpu_access(import_attach->dmabuf, DMA_FROM_DEVICE);
+vunmap:
+	drm_gem_shmem_vunmap(fb->obj[0], &map);
+
+	return ret;
+}
+
+static int gud_flush_rect(struct gud_device *gdrm, struct drm_framebuffer *fb,
+			  const struct drm_format_info *format, struct drm_rect *rect)
+{
+	struct usb_device *usb = gud_to_usb_device(gdrm);
+	struct gud_set_buffer_req req;
+	int ret, actual_length;
+	size_t len, trlen;
+
+	drm_dbg(&gdrm->drm, "Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->base.id, DRM_RECT_ARG(rect));
+
+	ret = gud_prep_flush(gdrm, fb, format, rect, &req);
+	if (ret)
+		return ret;
+
+	len = le32_to_cpu(req.length);
+
+	if (req.compression)
+		trlen = le32_to_cpu(req.compressed_length);
+	else
+		trlen = len;
+
+	gdrm->stats_length += len;
+	/* Did it wrap around? */
+	if (gdrm->stats_length <= len && gdrm->stats_actual_length) {
+		gdrm->stats_length = len;
+		gdrm->stats_actual_length = 0;
+	}
+	gdrm->stats_actual_length += trlen;
+
+	if (!(gdrm->flags & GUD_DISPLAY_FLAG_FULL_UPDATE) || gdrm->prev_flush_failed) {
+		ret = gud_usb_set(gdrm, GUD_REQ_SET_BUFFER, 0, &req, sizeof(req));
+		if (ret)
+			return ret;
+	}
+
+	ret = usb_bulk_msg(usb, gdrm->bulk_pipe, gdrm->bulk_buf, trlen,
+			   &actual_length, msecs_to_jiffies(3000));
+	if (!ret && trlen != actual_length)
+		ret = -EIO;
+	if (ret)
+		gdrm->stats_num_errors++;
+
+	return ret;
+}
+
+void gud_clear_damage(struct gud_device *gdrm)
+{
+	gdrm->damage.x1 = INT_MAX;
+	gdrm->damage.y1 = INT_MAX;
+	gdrm->damage.x2 = 0;
+	gdrm->damage.y2 = 0;
+}
+
+static void gud_add_damage(struct gud_device *gdrm, struct drm_rect *damage)
+{
+	gdrm->damage.x1 = min(gdrm->damage.x1, damage->x1);
+	gdrm->damage.y1 = min(gdrm->damage.y1, damage->y1);
+	gdrm->damage.x2 = max(gdrm->damage.x2, damage->x2);
+	gdrm->damage.y2 = max(gdrm->damage.y2, damage->y2);
+}
+
+static void gud_retry_failed_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
+				   struct drm_rect *damage)
+{
+	/*
+	 * pipe_update waits for the worker when the display mode is going to change.
+	 * This ensures that the width and height is still the same making it safe to
+	 * add back the damage.
+	 */
+
+	mutex_lock(&gdrm->damage_lock);
+	if (!gdrm->fb) {
+		drm_framebuffer_get(fb);
+		gdrm->fb = fb;
+	}
+	gud_add_damage(gdrm, damage);
+	mutex_unlock(&gdrm->damage_lock);
+
+	/* Retry only once to avoid a possible storm in case of continues errors. */
+	if (!gdrm->prev_flush_failed)
+		queue_work(system_long_wq, &gdrm->work);
+	gdrm->prev_flush_failed = true;
+}
+
+void gud_flush_work(struct work_struct *work)
+{
+	struct gud_device *gdrm = container_of(work, struct gud_device, work);
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
+	gud_clear_damage(gdrm);
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
+		ret = gud_flush_rect(gdrm, fb, format, &rect);
+		if (ret) {
+			if (ret != -ENODEV && ret != -ECONNRESET &&
+			    ret != -ESHUTDOWN && ret != -EPROTO) {
+				bool prev_flush_failed = gdrm->prev_flush_failed;
+
+				gud_retry_failed_flush(gdrm, fb, &damage);
+				if (!prev_flush_failed)
+					dev_err_ratelimited(fb->dev->dev,
+							    "Failed to flush framebuffer: error=%d\n", ret);
+			}
+			break;
+		}
+
+		gdrm->prev_flush_failed = false;
+	}
+
+	drm_framebuffer_put(fb);
+out:
+	drm_dev_exit(idx);
+}
+
+static void gud_fb_queue_damage(struct gud_device *gdrm, struct drm_framebuffer *fb,
+				struct drm_rect *damage)
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
+	gud_add_damage(gdrm, damage);
+
+	mutex_unlock(&gdrm->damage_lock);
+
+	queue_work(system_long_wq, &gdrm->work);
+
+	if (old_fb)
+		drm_framebuffer_put(old_fb);
+}
+
+int gud_pipe_check(struct drm_simple_display_pipe *pipe,
+		   struct drm_plane_state *new_plane_state,
+		   struct drm_crtc_state *new_crtc_state)
+{
+	struct gud_device *gdrm = to_gud_device(pipe->crtc.dev);
+	struct drm_plane_state *old_plane_state = pipe->plane.state;
+	const struct drm_display_mode *mode = &new_crtc_state->mode;
+	struct drm_atomic_state *state = new_plane_state->state;
+	struct drm_framebuffer *old_fb = old_plane_state->fb;
+	struct drm_connector_state *connector_state = NULL;
+	struct drm_framebuffer *fb = new_plane_state->fb;
+	const struct drm_format_info *format = fb->format;
+	struct drm_connector *connector;
+	unsigned int i, num_properties;
+	struct gud_state_req *req;
+	int idx, ret;
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
+	for_each_new_connector_in_state(state, connector, connector_state, i) {
+		if (connector_state->crtc)
+			break;
+	}
+
+	/*
+	 * DRM_IOCTL_MODE_OBJ_SETPROPERTY on the rotation property will not have
+	 * the connector included in the state.
+	 */
+	if (!connector_state) {
+		struct drm_connector_list_iter conn_iter;
+
+		drm_connector_list_iter_begin(pipe->crtc.dev, &conn_iter);
+		drm_for_each_connector_iter(connector, &conn_iter) {
+			if (connector->state->crtc) {
+				connector_state = connector->state;
+				break;
+			}
+		}
+		drm_connector_list_iter_end(&conn_iter);
+	}
+
+	if (WARN_ON_ONCE(!connector_state))
+		return -ENOENT;
+
+	len = struct_size(req, properties,
+			  GUD_PROPERTIES_MAX_NUM + GUD_CONNECTOR_PROPERTIES_MAX_NUM);
+	req = kzalloc(len, GFP_KERNEL);
+	if (!req)
+		return -ENOMEM;
+
+	gud_from_display_mode(&req->mode, mode);
+
+	req->format = gud_from_fourcc(format->format);
+	if (WARN_ON_ONCE(!req->format)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	req->connector = drm_connector_index(connector_state->connector);
+
+	ret = gud_connector_fill_properties(connector_state, req->properties);
+	if (ret < 0)
+		goto out;
+
+	num_properties = ret;
+	for (i = 0; i < gdrm->num_properties; i++) {
+		u16 prop = gdrm->properties[i];
+		u64 val;
+
+		switch (prop) {
+		case GUD_PROPERTY_ROTATION:
+			/* DRM UAPI matches the protocol so use value directly */
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
+		num_properties++;
+	}
+
+	if (drm_dev_enter(fb->dev, &idx)) {
+		len = struct_size(req, properties, num_properties);
+		ret = gud_usb_set(gdrm, GUD_REQ_SET_STATE_CHECK, 0, req, len);
+		drm_dev_exit(idx);
+	}  else {
+		ret = -ENODEV;
+	}
+out:
+	kfree(req);
+
+	return ret;
+}
+
+void gud_pipe_update(struct drm_simple_display_pipe *pipe,
+		     struct drm_plane_state *old_state)
+{
+	struct drm_device *drm = pipe->crtc.dev;
+	struct gud_device *gdrm = to_gud_device(drm);
+	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_framebuffer *fb = state->fb;
+	struct drm_crtc *crtc = &pipe->crtc;
+	struct drm_rect damage;
+	int idx;
+
+	if (crtc->state->mode_changed || !crtc->state->enable) {
+		cancel_work_sync(&gdrm->work);
+		mutex_lock(&gdrm->damage_lock);
+		if (gdrm->fb) {
+			drm_framebuffer_put(gdrm->fb);
+			gdrm->fb = NULL;
+		}
+		gud_clear_damage(gdrm);
+		mutex_unlock(&gdrm->damage_lock);
+	}
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	if (!old_state->fb)
+		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 1);
+
+	if (fb && (crtc->state->mode_changed || crtc->state->connectors_changed))
+		gud_usb_set(gdrm, GUD_REQ_SET_STATE_COMMIT, 0, NULL, 0);
+
+	if (crtc->state->active_changed)
+		gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, crtc->state->active);
+
+	if (drm_atomic_helper_damage_merged(old_state, state, &damage)) {
+		if (gdrm->flags & GUD_DISPLAY_FLAG_FULL_UPDATE)
+			drm_rect_init(&damage, 0, 0, fb->width, fb->height);
+		gud_fb_queue_damage(gdrm, fb, &damage);
+	}
+
+	if (!crtc->state->enable)
+		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 0);
+
+	drm_dev_exit(idx);
+}
diff --git a/include/drm/gud.h b/include/drm/gud.h
new file mode 100644
index 000000000000..a078aad63a31
--- /dev/null
+++ b/include/drm/gud.h
@@ -0,0 +1,333 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2020 Noralf Trønnes
+ */
+
+#ifndef __LINUX_GUD_H
+#define __LINUX_GUD_H
+
+#include <linux/types.h>
+
+/*
+ * struct gud_display_descriptor_req - Display descriptor
+ * @magic: Magic value GUD_DISPLAY_MAGIC
+ * @version: Protocol version
+ * @flags: Flags
+ *         - STATUS_ON_SET: Always do a status request after a SET request.
+ *                          This is used by the Linux gadget driver since it has
+ *                          no way to control the status stage of a control OUT
+ *                          request that has a payload.
+ *         - FULL_UPDATE:   Always send the entire framebuffer when flushing changes.
+ *                          The GUD_REQ_SET_BUFFER request will not be sent
+ *                          before each bulk transfer, it will only be sent if the
+ *                          previous bulk transfer had failed. This gives the device
+ *                          a chance to reset its state machine if needed.
+ *                          This flag can not be used in combination with compression.
+ * @compression: Supported compression types
+ *               - GUD_COMPRESSION_LZ4: LZ4 lossless compression.
+ * @max_buffer_size: Maximum buffer size the device can handle (optional).
+ *                   This is useful for devices that don't have a big enough
+ *                   buffer to decompress the entire framebuffer in one go.
+ * @min_width: Minimum pixel width the controller can handle
+ * @max_width: Maximum width
+ * @min_height: Minimum height
+ * @max_height: Maximum height
+ *
+ * Devices that have only one display mode will have min_width == max_width
+ * and min_height == max_height.
+ */
+struct gud_display_descriptor_req {
+	__le32 magic;
+#define GUD_DISPLAY_MAGIC			0x1d50614d
+	__u8 version;
+	__le32 flags;
+#define GUD_DISPLAY_FLAG_STATUS_ON_SET		BIT(0)
+#define GUD_DISPLAY_FLAG_FULL_UPDATE		BIT(1)
+	__u8 compression;
+#define GUD_COMPRESSION_LZ4			BIT(0)
+	__le32 max_buffer_size;
+	__le32 min_width;
+	__le32 max_width;
+	__le32 min_height;
+	__le32 max_height;
+} __packed;
+
+/*
+ * struct gud_property_req - Property
+ * @prop: Property
+ * @val: Value
+ */
+struct gud_property_req {
+	__le16 prop;
+	__le64 val;
+} __packed;
+
+/*
+ * struct gud_display_mode_req - Display mode
+ * @clock: Pixel clock in kHz
+ * @hdisplay: Horizontal display size
+ * @hsync_start: Horizontal sync start
+ * @hsync_end: Horizontal sync end
+ * @htotal: Horizontal total size
+ * @vdisplay: Vertical display size
+ * @vsync_start: Vertical sync start
+ * @vsync_end: Vertical sync end
+ * @vtotal: Vertical total size
+ * @flags: Bits 0-13 are the same as in the RandR protocol and also what DRM uses.
+ *         The deprecated bits are reused for internal protocol flags leaving us
+ *         free to follow DRM for the other bits in the future.
+ *         - FLAG_PREFERRED: Set on the preferred display mode.
+ */
+struct gud_display_mode_req {
+	__le32 clock;
+	__le16 hdisplay;
+	__le16 hsync_start;
+	__le16 hsync_end;
+	__le16 htotal;
+	__le16 vdisplay;
+	__le16 vsync_start;
+	__le16 vsync_end;
+	__le16 vtotal;
+	__le32 flags;
+#define GUD_DISPLAY_MODE_FLAG_PHSYNC		BIT(0)
+#define GUD_DISPLAY_MODE_FLAG_NHSYNC		BIT(1)
+#define GUD_DISPLAY_MODE_FLAG_PVSYNC		BIT(2)
+#define GUD_DISPLAY_MODE_FLAG_NVSYNC		BIT(3)
+#define GUD_DISPLAY_MODE_FLAG_INTERLACE		BIT(4)
+#define GUD_DISPLAY_MODE_FLAG_DBLSCAN		BIT(5)
+#define GUD_DISPLAY_MODE_FLAG_CSYNC		BIT(6)
+#define GUD_DISPLAY_MODE_FLAG_PCSYNC		BIT(7)
+#define GUD_DISPLAY_MODE_FLAG_NCSYNC		BIT(8)
+#define GUD_DISPLAY_MODE_FLAG_HSKEW		BIT(9)
+/* BCast and PixelMultiplex are deprecated */
+#define GUD_DISPLAY_MODE_FLAG_DBLCLK		BIT(12)
+#define GUD_DISPLAY_MODE_FLAG_CLKDIV2		BIT(13)
+#define GUD_DISPLAY_MODE_FLAG_USER_MASK		\
+		(GUD_DISPLAY_MODE_FLAG_PHSYNC | GUD_DISPLAY_MODE_FLAG_NHSYNC | \
+		GUD_DISPLAY_MODE_FLAG_PVSYNC | GUD_DISPLAY_MODE_FLAG_NVSYNC | \
+		GUD_DISPLAY_MODE_FLAG_INTERLACE | GUD_DISPLAY_MODE_FLAG_DBLSCAN | \
+		GUD_DISPLAY_MODE_FLAG_CSYNC | GUD_DISPLAY_MODE_FLAG_PCSYNC | \
+		GUD_DISPLAY_MODE_FLAG_NCSYNC | GUD_DISPLAY_MODE_FLAG_HSKEW | \
+		GUD_DISPLAY_MODE_FLAG_DBLCLK | GUD_DISPLAY_MODE_FLAG_CLKDIV2)
+/* Internal protocol flags */
+#define GUD_DISPLAY_MODE_FLAG_PREFERRED		BIT(10)
+} __packed;
+
+/*
+ * struct gud_connector_descriptor_req - Connector descriptor
+ * @connector_type: Connector type (GUD_CONNECTOR_TYPE_*).
+ *                  If the host doesn't support the type it should fall back to PANEL.
+ * @flags: Flags
+ *         - POLL_STATUS: Connector status can change (polled every 10 seconds)
+ *         - INTERLACE: Interlaced modes are supported
+ *         - DOUBLESCAN: Doublescan modes are supported
+ */
+struct gud_connector_descriptor_req {
+	__u8 connector_type;
+#define GUD_CONNECTOR_TYPE_PANEL		0
+#define GUD_CONNECTOR_TYPE_VGA			1
+#define GUD_CONNECTOR_TYPE_COMPOSITE		2
+#define GUD_CONNECTOR_TYPE_SVIDEO		3
+#define GUD_CONNECTOR_TYPE_COMPONENT		4
+#define GUD_CONNECTOR_TYPE_DVI			5
+#define GUD_CONNECTOR_TYPE_DISPLAYPORT		6
+#define GUD_CONNECTOR_TYPE_HDMI			7
+	__le32 flags;
+#define GUD_CONNECTOR_FLAGS_POLL_STATUS		BIT(0)
+#define GUD_CONNECTOR_FLAGS_INTERLACE		BIT(1)
+#define GUD_CONNECTOR_FLAGS_DOUBLESCAN		BIT(2)
+} __packed;
+
+/*
+ * struct gud_set_buffer_req - Set buffer transfer info
+ * @x: X position of rectangle
+ * @y: Y position
+ * @width: Pixel width of rectangle
+ * @height: Pixel height
+ * @length: Buffer length in bytes
+ * @compression: Transfer compression
+ * @compressed_length: Compressed buffer length
+ *
+ * This request is issued right before the bulk transfer.
+ * @x, @y, @width and @height specifies the rectangle where the buffer should be
+ * placed inside the framebuffer.
+ */
+struct gud_set_buffer_req {
+	__le32 x;
+	__le32 y;
+	__le32 width;
+	__le32 height;
+	__le32 length;
+	__u8 compression;
+	__le32 compressed_length;
+} __packed;
+
+/*
+ * struct gud_state_req - Display state
+ * @mode: Display mode
+ * @format: Pixel format GUD_PIXEL_FORMAT_*
+ * @connector: Connector index
+ * @properties: Array of properties
+ *
+ * The entire state is transferred each time there's a change.
+ */
+struct gud_state_req {
+	struct gud_display_mode_req mode;
+	__u8 format;
+	__u8 connector;
+	struct gud_property_req properties[];
+} __packed;
+
+/* List of supported connector properties: */
+
+/* Margins in pixels to deal with overscan, range 0-100 */
+#define GUD_PROPERTY_TV_LEFT_MARGIN			1
+#define GUD_PROPERTY_TV_RIGHT_MARGIN			2
+#define GUD_PROPERTY_TV_TOP_MARGIN			3
+#define GUD_PROPERTY_TV_BOTTOM_MARGIN			4
+#define GUD_PROPERTY_TV_MODE				5
+/* Brightness in percent, range 0-100 */
+#define GUD_PROPERTY_TV_BRIGHTNESS			6
+/* Contrast in percent, range 0-100 */
+#define GUD_PROPERTY_TV_CONTRAST			7
+/* Flicker reduction in percent, range 0-100 */
+#define GUD_PROPERTY_TV_FLICKER_REDUCTION		8
+/* Overscan in percent, range 0-100 */
+#define GUD_PROPERTY_TV_OVERSCAN			9
+/* Saturation in percent, range 0-100 */
+#define GUD_PROPERTY_TV_SATURATION			10
+/* Hue in percent, range 0-100 */
+#define GUD_PROPERTY_TV_HUE				11
+
+/*
+ * Backlight brightness is in the range 0-100 inclusive. The value represents the human perceptual
+ * brightness and not a linear PWM value. 0 is minimum brightness which should not turn the
+ * backlight completely off. The DPMS connector property should be used to control power which will
+ * trigger a GUD_REQ_SET_DISPLAY_ENABLE request.
+ *
+ * This does not map to a DRM property, it is used with the backlight device.
+ */
+#define GUD_PROPERTY_BACKLIGHT_BRIGHTNESS		12
+
+/* List of supported properties that are not connector propeties: */
+
+/*
+ * Plane rotation. Should return the supported bitmask on
+ * GUD_REQ_GET_PROPERTIES. GUD_ROTATION_0 is mandatory.
+ *
+ * Note: This is not display rotation so 90/270 will need scaling to make it fit (unless squared).
+ */
+#define GUD_PROPERTY_ROTATION				50
+  #define GUD_ROTATION_0			BIT(0)
+  #define GUD_ROTATION_90			BIT(1)
+  #define GUD_ROTATION_180			BIT(2)
+  #define GUD_ROTATION_270			BIT(3)
+  #define GUD_ROTATION_REFLECT_X		BIT(4)
+  #define GUD_ROTATION_REFLECT_Y		BIT(5)
+  #define GUD_ROTATION_MASK			(GUD_ROTATION_0 | GUD_ROTATION_90 | \
+						GUD_ROTATION_180 | GUD_ROTATION_270 | \
+						GUD_ROTATION_REFLECT_X | GUD_ROTATION_REFLECT_Y)
+
+/* USB Control requests: */
+
+/* Get status from the last GET/SET control request. Value is u8. */
+#define GUD_REQ_GET_STATUS				0x00
+  /* Status values: */
+  #define GUD_STATUS_OK				0x00
+  #define GUD_STATUS_BUSY			0x01
+  #define GUD_STATUS_REQUEST_NOT_SUPPORTED	0x02
+  #define GUD_STATUS_PROTOCOL_ERROR		0x03
+  #define GUD_STATUS_INVALID_PARAMETER		0x04
+  #define GUD_STATUS_ERROR			0x05
+
+/* Get display descriptor as a &gud_display_descriptor_req */
+#define GUD_REQ_GET_DESCRIPTOR				0x01
+
+/* Get supported pixel formats as a byte array of GUD_PIXEL_FORMAT_* */
+#define GUD_REQ_GET_FORMATS				0x40
+  #define GUD_FORMATS_MAX_NUM			32
+  /* R1 is a 1-bit monochrome transfer format presented to userspace as XRGB8888 */
+  #define GUD_PIXEL_FORMAT_R1			0x01
+  #define GUD_PIXEL_FORMAT_RGB111		0x20
+  #define GUD_PIXEL_FORMAT_RGB565		0x40
+  #define GUD_PIXEL_FORMAT_XRGB8888		0x80
+  #define GUD_PIXEL_FORMAT_ARGB8888		0x81
+
+/*
+ * Get supported properties that are not connector propeties as a &gud_property_req array.
+ * gud_property_req.val often contains the initial value for the property.
+ */
+#define GUD_REQ_GET_PROPERTIES				0x41
+  #define GUD_PROPERTIES_MAX_NUM		32
+
+/* Connector requests have the connector index passed in the wValue field */
+
+/* Get connector descriptors as an array of &gud_connector_descriptor_req */
+#define GUD_REQ_GET_CONNECTORS				0x50
+  #define GUD_CONNECTORS_MAX_NUM		32
+
+/*
+ * Get properties supported by the connector as a &gud_property_req array.
+ * gud_property_req.val often contains the initial value for the property.
+ */
+#define GUD_REQ_GET_CONNECTOR_PROPERTIES		0x51
+  #define GUD_CONNECTOR_PROPERTIES_MAX_NUM	32
+
+/*
+ * Issued when there's a TV_MODE property present.
+ * Gets an array of the supported TV_MODE names each entry of length
+ * GUD_CONNECTOR_TV_MODE_NAME_LEN. Names must be NUL-terminated.
+ */
+#define GUD_REQ_GET_CONNECTOR_TV_MODE_VALUES		0x52
+  #define GUD_CONNECTOR_TV_MODE_NAME_LEN	16
+  #define GUD_CONNECTOR_TV_MODE_MAX_NUM		16
+
+/* When userspace checks connector status, this is issued first, not used for poll requests. */
+#define GUD_REQ_SET_CONNECTOR_FORCE_DETECT		0x53
+
+/*
+ * Get connector status. Value is u8.
+ *
+ * Userspace will get a HOTPLUG uevent if one of the following is true:
+ * - Connection status has changed since last
+ * - CHANGED is set
+ */
+#define GUD_REQ_GET_CONNECTOR_STATUS			0x54
+  #define GUD_CONNECTOR_STATUS_DISCONNECTED	0x00
+  #define GUD_CONNECTOR_STATUS_CONNECTED	0x01
+  #define GUD_CONNECTOR_STATUS_UNKNOWN		0x02
+  #define GUD_CONNECTOR_STATUS_CONNECTED_MASK	0x03
+  #define GUD_CONNECTOR_STATUS_CHANGED		BIT(7)
+
+/*
+ * Display modes can be fetched as either EDID data or an array of &gud_display_mode_req.
+ *
+ * If GUD_REQ_GET_CONNECTOR_MODES returns zero, EDID is used to create display modes.
+ * If both display modes and EDID are returned, EDID is just passed on to userspace
+ * in the EDID connector property.
+ */
+
+/* Get &gud_display_mode_req array of supported display modes */
+#define GUD_REQ_GET_CONNECTOR_MODES			0x55
+  #define GUD_CONNECTOR_MAX_NUM_MODES		128
+
+/* Get Extended Display Identification Data */
+#define GUD_REQ_GET_CONNECTOR_EDID			0x56
+  #define GUD_CONNECTOR_MAX_EDID_LEN		2048
+
+/* Set buffer properties before bulk transfer as &gud_set_buffer_req */
+#define GUD_REQ_SET_BUFFER				0x60
+
+/* Check display configuration as &gud_state_req */
+#define GUD_REQ_SET_STATE_CHECK				0x61
+
+/* Apply the previous STATE_CHECK configuration */
+#define GUD_REQ_SET_STATE_COMMIT			0x62
+
+/* Enable/disable the display controller, value is u8: 0/1 */
+#define GUD_REQ_SET_CONTROLLER_ENABLE			0x63
+
+/* Enable/disable display/output (DPMS), value is u8: 0/1 */
+#define GUD_REQ_SET_DISPLAY_ENABLE			0x64
+
+#endif
-- 
2.23.0

