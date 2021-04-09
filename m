Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE5B635A2E2
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 18:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232796AbhDIQUQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 12:20:16 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38766 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhDIQUP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Apr 2021 12:20:15 -0400
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:19b8:b5db:beab:c68c])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2FA351F46989;
        Fri,  9 Apr 2021 17:20:01 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     megous@megous.com, linux-usb@vger.kernel.org, a.hajda@samsung.com,
        narmstrong@baylibre.com, Laurent.pinchart@ideasonboard.com,
        jonas@kwiboo.se, jernej.skrabec@siol.net, airlied@linux.ie,
        daniel@ffwll.ch, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
        enric.balletbo@collabora.com, drinkcat@chromium.org,
        hsinyi@chromium.org, kernel@collabora.com, dafna3@gmail.com,
        dafna.hirschfeld@collabora.com, robh+dt@kernel.org
Subject: [PATCH v6 2/2] drm/bridge: Add ChromeOS EC ANX7688 bridge driver support
Date:   Fri,  9 Apr 2021 18:19:51 +0200
Message-Id: <20210409161951.12365-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210409161951.12365-1-dafna.hirschfeld@collabora.com>
References: <20210409161951.12365-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Enric Balletbo i Serra <enric.balletbo@collabora.com>

This driver adds support for the ChromeOS EC ANX7688 HDMI to DP converter

For our use case, the only reason the Linux kernel driver is necessary is
to reject resolutions that require more bandwidth than what is available
on the DP side. DP bandwidth and lane count are reported by the bridge via
2 registers and, as far as we know, only chips that have a firmware
version greater than 0.85 support these two registers.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
[The driver is OF only so should depends on CONFIG_OF]
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
[convert to i2c driver, rename to cros_ec_anx7688, add err checks]
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/bridge/Kconfig           |  12 ++
 drivers/gpu/drm/bridge/Makefile          |   1 +
 drivers/gpu/drm/bridge/cros-ec-anx7688.c | 191 +++++++++++++++++++++++
 3 files changed, 204 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/cros-ec-anx7688.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 998dcda44f70..9f991f0551ce 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -37,6 +37,18 @@ config DRM_CHRONTEL_CH7033
 
 	  If in doubt, say "N".
 
+config DRM_CROS_EC_ANX7688
+	tristate "ChromeOS EC ANX7688 bridge"
+	depends on OF
+	select DRM_KMS_HELPER
+	select REGMAP_I2C
+	help
+	  ChromeOS EC ANX7688 is an ultra-low power
+	  4K Ultra-HD (4096x2160p60) mobile HD transmitter
+	  designed for ChromeOS devices. It converts HDMI
+	  2.0 to DisplayPort 1.3 Ultra-HD. It is connected
+	  to the ChromeOS Embedded Controller.
+
 config DRM_DISPLAY_CONNECTOR
 	tristate "Display connector support"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 0fc37a8e38d0..a6261b89087c 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
 obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
+obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
 obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
 obj-$(CONFIG_DRM_LONTIUM_LT9611) += lontium-lt9611.o
 obj-$(CONFIG_DRM_LONTIUM_LT9611UXC) += lontium-lt9611uxc.o
diff --git a/drivers/gpu/drm/bridge/cros-ec-anx7688.c b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
new file mode 100644
index 000000000000..0f6d907432e3
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * CrOS EC ANX7688 HDMI->DP bridge driver
+ *
+ * Copyright 2020 Google LLC
+ */
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_print.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+/* Register addresses */
+#define ANX7688_VENDOR_ID_REG		0x00
+#define ANX7688_DEVICE_ID_REG		0x02
+
+#define ANX7688_FW_VERSION_REG		0x80
+
+#define ANX7688_DP_BANDWIDTH_REG	0x85
+#define ANX7688_DP_LANE_COUNT_REG	0x86
+
+#define ANX7688_VENDOR_ID		0x1f29
+#define ANX7688_DEVICE_ID		0x7688
+
+/* First supported firmware version (0.85) */
+#define ANX7688_MINIMUM_FW_VERSION	0x0085
+
+static const struct regmap_config cros_ec_anx7688_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+struct cros_ec_anx7688 {
+	struct i2c_client *client;
+	struct regmap *regmap;
+	struct drm_bridge bridge;
+	bool filter;
+};
+
+static inline struct cros_ec_anx7688 *
+bridge_to_cros_ec_anx7688(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct cros_ec_anx7688, bridge);
+}
+
+static bool cros_ec_anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
+					      const struct drm_display_mode *mode,
+					      struct drm_display_mode *adjusted_mode)
+{
+	struct cros_ec_anx7688 *anx = bridge_to_cros_ec_anx7688(bridge);
+	int totalbw, requiredbw;
+	u8 dpbw, lanecount;
+	u8 regs[2];
+	int ret;
+
+	if (!anx->filter)
+		return true;
+
+	/* Read both regs 0x85 (bandwidth) and 0x86 (lane count). */
+	ret = regmap_bulk_read(anx->regmap, ANX7688_DP_BANDWIDTH_REG, regs, 2);
+	if (ret < 0) {
+		DRM_ERROR("Failed to read bandwidth/lane count\n");
+		return false;
+	}
+	dpbw = regs[0];
+	lanecount = regs[1];
+
+	/* Maximum 0x19 bandwidth (6.75 Gbps Turbo mode), 2 lanes */
+	if (dpbw > 0x19 || lanecount > 2) {
+		DRM_ERROR("Invalid bandwidth/lane count (%02x/%d)\n", dpbw,
+			  lanecount);
+		return false;
+	}
+
+	/* Compute available bandwidth (kHz) */
+	totalbw = dpbw * lanecount * 270000 * 8 / 10;
+
+	/* Required bandwidth (8 bpc, kHz) */
+	requiredbw = mode->clock * 8 * 3;
+
+	DRM_DEBUG_KMS("DP bandwidth: %d kHz (%02x/%d); mode requires %d Khz\n",
+		      totalbw, dpbw, lanecount, requiredbw);
+
+	if (totalbw == 0) {
+		DRM_ERROR("Bandwidth/lane count are 0, not rejecting modes\n");
+		return true;
+	}
+
+	return totalbw >= requiredbw;
+}
+
+static const struct drm_bridge_funcs cros_ec_anx7688_bridge_funcs = {
+	.mode_fixup = cros_ec_anx7688_bridge_mode_fixup,
+};
+
+static int cros_ec_anx7688_bridge_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct cros_ec_anx7688 *anx7688;
+	u16 vendor, device, fw_version;
+	u8 buffer[4];
+	int ret;
+
+	anx7688 = devm_kzalloc(dev, sizeof(*anx7688), GFP_KERNEL);
+	if (!anx7688)
+		return -ENOMEM;
+
+	anx7688->client = client;
+	i2c_set_clientdata(client, anx7688);
+
+	anx7688->regmap = devm_regmap_init_i2c(client, &cros_ec_anx7688_regmap_config);
+	if (IS_ERR(anx7688->regmap)) {
+		ret = PTR_ERR(anx7688->regmap);
+		dev_err(dev, "regmap i2c init failed: %d\n", ret);
+		return ret;
+	}
+
+	/* Read both vendor and device id (4 bytes). */
+	ret = regmap_bulk_read(anx7688->regmap, ANX7688_VENDOR_ID_REG,
+			       buffer, 4);
+	if (ret) {
+		dev_err(dev, "Failed to read chip vendor/device id\n");
+		return ret;
+	}
+
+	vendor = (u16)buffer[1] << 8 | buffer[0];
+	device = (u16)buffer[3] << 8 | buffer[2];
+	if (vendor != ANX7688_VENDOR_ID || device != ANX7688_DEVICE_ID) {
+		dev_err(dev, "Invalid vendor/device id %04x/%04x\n",
+			vendor, device);
+		return -ENODEV;
+	}
+
+	ret = regmap_bulk_read(anx7688->regmap, ANX7688_FW_VERSION_REG,
+			       buffer, 2);
+	if (ret) {
+		dev_err(dev, "Failed to read firmware version\n");
+		return ret;
+	}
+
+	fw_version = (u16)buffer[0] << 8 | buffer[1];
+	dev_info(dev, "ANX7688 firmware version 0x%04x\n", fw_version);
+
+	anx7688->bridge.of_node = dev->of_node;
+
+	/* FW version >= 0.85 supports bandwidth/lane count registers */
+	if (fw_version >= ANX7688_MINIMUM_FW_VERSION)
+		anx7688->filter = true;
+	else
+		/* Warn, but not fail, for backwards compatibility */
+		DRM_WARN("Old ANX7688 FW version (0x%04x), not filtering\n",
+			 fw_version);
+
+	anx7688->bridge.funcs = &cros_ec_anx7688_bridge_funcs;
+	drm_bridge_add(&anx7688->bridge);
+
+	return 0;
+}
+
+static int cros_ec_anx7688_bridge_remove(struct i2c_client *client)
+{
+	struct cros_ec_anx7688 *anx7688 = i2c_get_clientdata(client);
+
+	drm_bridge_remove(&anx7688->bridge);
+
+	return 0;
+}
+
+static const struct of_device_id cros_ec_anx7688_bridge_match_table[] = {
+	{ .compatible = "google,cros-ec-anx7688" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cros_ec_anx7688_bridge_match_table);
+
+static struct i2c_driver cros_ec_anx7688_bridge_driver = {
+	.probe_new = cros_ec_anx7688_bridge_probe,
+	.remove = cros_ec_anx7688_bridge_remove,
+	.driver = {
+		.name = "cros-ec-anx7688-bridge",
+		.of_match_table = cros_ec_anx7688_bridge_match_table,
+	},
+};
+
+module_i2c_driver(cros_ec_anx7688_bridge_driver);
+
+MODULE_DESCRIPTION("ChromeOS EC ANX7688 HDMI->DP bridge driver");
+MODULE_AUTHOR("Nicolas Boichat <drinkcat@chromium.org>");
+MODULE_AUTHOR("Enric Balletbo i Serra <enric.balletbo@collabora.com>");
+MODULE_LICENSE("GPL");
-- 
2.17.1

