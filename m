Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 923391BDCCE
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 14:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgD2M55 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 08:57:57 -0400
Received: from asav21.altibox.net ([109.247.116.8]:58612 "EHLO
        asav21.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726968AbgD2M55 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Apr 2020 08:57:57 -0400
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav21.altibox.net (Postfix) with ESMTPSA id 32ABF8018B;
        Wed, 29 Apr 2020 14:48:50 +0200 (CEST)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org
Cc:     =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Martin Peres <martin.peres@linux.intel.com>,
        Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH 02/10] drm: Add backlight helper
Date:   Wed, 29 Apr 2020 14:48:22 +0200
Message-Id: <20200429124830.27475-3-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200429124830.27475-1-noralf@tronnes.org>
References: <20200429124830.27475-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=AvXAIt1P c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
        a=aiIX5UjjAAAA:8 a=nGqoV0jOAAAA:20 a=e5mUnYsNAAAA:8 a=Oh2cFVv5AAAA:8
        a=bhchkAzmAAAA:20 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=SJz97ENfAAAA:8
        a=UO0b44jCD_nsarDuR4EA:9 a=QEXdDO2ut3YA:10 a=oU43SoCdRycA:10
        a=AjGcO6oz07-iQ99wixmX:22 a=K4UmP72BP_XnEf30ZnvK:22
        a=Vxmtnl_E_bksehYqCbjh:22 a=7KeoIwV6GZqOttXkcoxL:22
        a=cvBusfyB2V15izCimMoJ:22 a=vFet0B0WnEQeilDPIY6i:22
        a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This adds a function that creates a backlight device for a connector.
It does not deal with the KMS backlight ABI proposition[1] to add a
connector property. It only takes the current best practise to standardise
the creation of a backlight device for DRM drivers while we wait for the
property.

The brightness value is set using a connector state variable and an atomic
commit.

I have looked through some of the backlight users and this is what I've found:

GNOME [2]
---------

Brightness range: 0-100
Scale: Assumes perceptual

Avoids setting the sysfs brightness value to zero if max_brightness >= 99.
Can connect connector and backlight using the sysfs device.

KDE [3]
-------

Brightness range: 0-100
Scale: Assumes perceptual

Weston [4]
----------

Brightness range: 0-255
Scale: Assumes perceptual

Chromium OS [5]
---------------

Brightness range: 0-100
Scale: Depends on the sysfs file 'scale' which is a recent addition (2019)

xserver [6]
-----------

Brightness range: 0-x (driver specific) (1 is minimum, 0 is OFF)
Scale: Assumes perceptual

The builtin modesetting driver[7] does not support Backlight, Intel[8] does.

[1] https://lore.kernel.org/dri-devel/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/
[2] https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/blob/master/plugins/power/gsd-backlight.c
[3] https://github.com/KDE/powerdevil/blob/master/daemon/backends/upower/backlighthelper.cpp
[4] https://gitlab.freedesktop.org/wayland/weston/-/blob/master/libweston/backend-drm/drm.c
[5] https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/master/power_manager/powerd/system/internal_backlight.cc
[6] https://github.com/freedesktop/xorg-randrproto/blob/master/randrproto.txt
[7] https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/hw/xfree86/drivers/modesetting/drmmode_display.c
[8] https://gitlab.freedesktop.org/xorg/driver/xf86-video-intel/-/blob/master/src/backlight.c

Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Martin Peres <martin.peres@linux.intel.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 Documentation/gpu/drm-kms-helpers.rst  |   6 +
 drivers/gpu/drm/Kconfig                |   7 ++
 drivers/gpu/drm/Makefile               |   1 +
 drivers/gpu/drm/drm_backlight_helper.c | 154 +++++++++++++++++++++++++
 include/drm/drm_backlight_helper.h     |   9 ++
 include/drm/drm_connector.h            |  10 ++
 6 files changed, 187 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_backlight_helper.c
 create mode 100644 include/drm/drm_backlight_helper.h

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 9668a7fe2408..29a2f4b49fd2 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -411,3 +411,9 @@ SHMEM GEM Helper Reference
 
 .. kernel-doc:: drivers/gpu/drm/drm_gem_shmem_helper.c
    :export:
+
+Backlight Helper Reference
+==========================
+
+.. kernel-doc:: drivers/gpu/drm/drm_backlight_helper.c
+   :export:
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index d0aa6cff2e02..f6e13e18c9ca 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -224,6 +224,13 @@ config DRM_GEM_SHMEM_HELPER
 	help
 	  Choose this if you need the GEM shmem helper functions
 
+config DRM_BACKLIGHT_HELPER
+	bool
+	depends on DRM
+	select BACKLIGHT_CLASS_DEVICE
+	help
+	  Choose this if you need the backlight device helper functions
+
 config DRM_VM
 	bool
 	depends on DRM && MMU
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 6493088a0fdd..0d17662dde0a 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -52,6 +52,7 @@ drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
 drm_kms_helper-$(CONFIG_DRM_KMS_CMA_HELPER) += drm_fb_cma_helper.o
 drm_kms_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
 drm_kms_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
+drm_kms_helper-$(CONFIG_DRM_BACKLIGHT_HELPER) += drm_backlight_helper.o
 
 obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
 obj-$(CONFIG_DRM_DEBUG_SELFTEST) += selftests/
diff --git a/drivers/gpu/drm/drm_backlight_helper.c b/drivers/gpu/drm/drm_backlight_helper.c
new file mode 100644
index 000000000000..06e6a75d1d0a
--- /dev/null
+++ b/drivers/gpu/drm/drm_backlight_helper.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright 2020 Noralf Trønnes
+ */
+
+#include <linux/backlight.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+
+static int drm_backlight_update_status(struct backlight_device *bd)
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
+	connector_state->backlight_brightness = bd->props.brightness;
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
+static int drm_backlight_get_brightness(struct backlight_device *bd)
+{
+	struct drm_connector *connector = bl_get_data(bd);
+	struct drm_device *dev = connector->dev;
+	int brightness;
+
+	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
+	brightness = connector->state->backlight_brightness;
+	drm_modeset_unlock(&dev->mode_config.connection_mutex);
+
+	return brightness;
+}
+
+static const struct backlight_ops drm_backlight_ops = {
+	.get_brightness = drm_backlight_get_brightness,
+	.update_status	= drm_backlight_update_status,
+};
+
+/* Can be exported for drivers carrying a legacy name */
+static int drm_backlight_register_with_name(struct drm_connector *connector, const char *name)
+{
+	struct backlight_device *bd;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.scale = BACKLIGHT_SCALE_NON_LINEAR,
+		.max_brightness = 100,
+	};
+
+	if (WARN_ON(!drm_core_check_feature(connector->dev, DRIVER_MODESET) ||
+		    !drm_drv_uses_atomic_modeset(connector->dev) ||
+		    !connector->kdev))
+		return -EINVAL;
+
+	bd = backlight_device_register(name, connector->kdev, connector,
+				       &drm_backlight_ops, &props);
+	if (IS_ERR(bd))
+		return PTR_ERR(bd);
+
+	connector->backlight = bd;
+
+	return 0;
+}
+
+/**
+ * drm_backlight_register() - Register a backlight device for a connector
+ * @connector: Connector
+ *
+ * This function registers a backlight device for @connector with the following
+ * characteristics:
+ *
+ * - The connector sysfs device is used as a parent device for the backlight device.
+ *   Userspace can use this to connect backlight device and connector.
+ * - Name will be on the form: **card0-HDMI-A-1-backlight**
+ * - Type is "raw"
+ * - Scale is "non-linear" (perceptual)
+ * - Max brightness is 100 giving a range of 0-100 inclusive
+ * - Reading sysfs **brightness** returns the backlight device property
+ * - Reading sysfs **actual_brightness** returns the connector state value
+ * - Writing sysfs **bl_power** is ignored, the DPMS connector property should
+ *   be used to control power.
+ * - Backlight device suspend/resume events are ignored.
+ *
+ * Note:
+ *
+ * Brightness zero should not turn off backlight it should be the minimum
+ * brightness, DPMS handles power.
+ *
+ * This function must be called from &drm_connector_funcs->late_register() since
+ * it depends on the sysfs device.
+ *
+ * Returns:
+ * Zero on success or negative error code on failure.
+ */
+int drm_backlight_register(struct drm_connector *connector)
+{
+	const char *name = NULL;
+	int ret;
+
+	name = kasprintf(GFP_KERNEL, "card%d-%s-backlight",
+			 connector->dev->primary->index, connector->name);
+	if (!name)
+		return -ENOMEM;
+
+	ret = drm_backlight_register_with_name(connector, name);
+	kfree(name);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_backlight_register);
+
+/**
+ * drm_backlight_unregister() - Unregister backlight device
+ * @connector: Connector
+ *
+ * Unregister a backlight device. This must be called from the
+ * &drm_connector_funcs->early_unregister() callback.
+ */
+void drm_backlight_unregister(struct drm_connector *connector)
+{
+	backlight_device_unregister(connector->backlight);
+}
+EXPORT_SYMBOL(drm_backlight_unregister);
diff --git a/include/drm/drm_backlight_helper.h b/include/drm/drm_backlight_helper.h
new file mode 100644
index 000000000000..4151b66eb0b4
--- /dev/null
+++ b/include/drm/drm_backlight_helper.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef _LINUX_DRM_BACKLIGHT_HELPER_H
+#define _LINUX_DRM_BACKLIGHT_HELPER_H
+
+int drm_backlight_register(struct drm_connector *connector);
+void drm_backlight_unregister(struct drm_connector *connector);
+
+#endif
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 221910948b37..ce678b694f45 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -32,6 +32,7 @@
 
 #include <uapi/drm/drm_mode.h>
 
+struct backlight_device;
 struct drm_connector_helper_funcs;
 struct drm_modeset_acquire_ctx;
 struct drm_device;
@@ -656,6 +657,12 @@ struct drm_connector_state {
 	 */
 	u8 max_bpc;
 
+	/**
+	 * @backlight_brightness: Brightness value of the connector backlight
+	 * device. See drm_backlight_register().
+	 */
+	u8 backlight_brightness;
+
 	/**
 	 * @hdr_output_metadata:
 	 * DRM blob property for HDR output metadata
@@ -1422,6 +1429,9 @@ struct drm_connector {
 
 	/** @hdr_sink_metadata: HDR Metadata Information read from sink */
 	struct hdr_sink_metadata hdr_sink_metadata;
+
+	/** @backlight: Backlight device. See drm_backlight_register() */
+	struct backlight_device *backlight;
 };
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)
-- 
2.23.0

