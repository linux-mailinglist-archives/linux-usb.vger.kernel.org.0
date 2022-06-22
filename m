Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF27D5552C3
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jun 2022 19:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377428AbiFVRrY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jun 2022 13:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377423AbiFVRrU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jun 2022 13:47:20 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A2F35A89
        for <linux-usb@vger.kernel.org>; Wed, 22 Jun 2022 10:47:19 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id n12so9815546pfq.0
        for <linux-usb@vger.kernel.org>; Wed, 22 Jun 2022 10:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ozFhzYmR4E95kB5IvCCZ7Zhda6htukA9ft1DlgyNV/o=;
        b=CawAhneHC/p+xXOIC1j1y4DXWjBHk+xdf6T6b/IRcKfJO4W8BAHwZpeasTZ1klNF3/
         xT1GD6SgQ4uPMuEjxQ0Lo+dOzXTfddCoudLE/Ty7XjhN2tAQkL6oX2e1sDtRfIbGMTrI
         0iuXYklU8zG8BWpFmjtnIFTnAVshfx6NdPHB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ozFhzYmR4E95kB5IvCCZ7Zhda6htukA9ft1DlgyNV/o=;
        b=plFsnu7cLlXYiEHYvsVnehPUeiIPqI8uS4hF8WHLnvCMlA1G/EFaNEOGC6qDGtUS8e
         VEk7GB84orSv24f1SaE/GNyv4CJ5NEw0SmAdtwMKPMQ3BmraF4TbdH/6NUxYKddxOXZ7
         n8axyDES+3c9yAXNb71l7Sc1KAC/oMxaAYX9FMpKFi07x0oRKCFOiiPw2BEt4Cuvm4KH
         2dodswZAPfC/iB5ZVS623GoCTLTkUDvZZ5sATfrnm2hV5SoCllrIzl4BkXd3IOlZ7XaJ
         3WiNVudBhdaX5eyfn7MzkQi+LzRicC2Ef9JL7ZbkrUQkibgWo9anxHbf5LGrmvxTmy2q
         MXug==
X-Gm-Message-State: AJIora9Wip/nhEYzDSL+WjlfdJWgqmju3wBoyvM/BF0L9G7uwMBhj4t4
        39M3KBSPkyggFuMLVhS/hPfRIA==
X-Google-Smtp-Source: AGRyM1tBbILrL9IcBn2sx8C63vhIXgPha/EGUevChjROlBAs1HDcrrQphyTY41RUJ1/FuutnDCyUnA==
X-Received: by 2002:a63:8842:0:b0:40d:4365:907f with SMTP id l63-20020a638842000000b0040d4365907fmr1254341pgd.568.1655920039161;
        Wed, 22 Jun 2022 10:47:19 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id l17-20020a17090b079100b001ece55aec38sm35470pjz.30.2022.06.22.10.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 10:47:18 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     bleung@chromium.org, swboyd@chromium.org,
        heikki.krogerus@linux.intel.com,
        Pin-Yen Lin <treapking@chromium.org>,
        Prashant Malani <pmalani@chromium.org>,
        Allen Chen <allen.chen@ite.com.tw>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Neil Armstrong <narmstrong@baylibre.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>, Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v5 8/9] drm/bridge: it6505: Register Type-C mode switches
Date:   Wed, 22 Jun 2022 17:34:37 +0000
Message-Id: <20220622173605.1168416-9-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
In-Reply-To: <20220622173605.1168416-1-pmalani@chromium.org>
References: <20220622173605.1168416-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Pin-Yen Lin <treapking@chromium.org>

When the DT node has "switches" available, register a Type-C mode-switch
for each listed "switch". This allows the driver to receive state
information about what operating mode a Type-C port and its connected
peripherals are in, as well as status information (like VDOs) related to
that state.

The callback function is currently a stub, but subsequent patches will
implement the required functionality.

Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

v5 is the first version for this patch.

 drivers/gpu/drm/bridge/ite-it6505.c | 85 ++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index b259f9f367f6..cb1dd4cbd33b 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -17,6 +17,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/types.h>
+#include <linux/usb/typec_mux.h>
 #include <linux/wait.h>
 
 #include <crypto/hash.h>
@@ -402,6 +403,11 @@ struct debugfs_entries {
 	const struct file_operations *fops;
 };
 
+struct it6505_port_data {
+	struct typec_mux_dev *typec_mux;
+	struct it6505 *it6505;
+};
+
 struct it6505 {
 	struct drm_dp_aux aux;
 	struct drm_bridge bridge;
@@ -453,6 +459,7 @@ struct it6505 {
 	struct it6505_audio_data audio;
 	struct dentry *debugfs;
 	int num_typec_switches;
+	struct it6505_port_data *typec_ports;
 
 	/* it6505 driver hold option */
 	bool enable_drv_hold;
@@ -3230,9 +3237,59 @@ static void it6505_shutdown(struct i2c_client *client)
 		it6505_lane_off(it6505);
 }
 
+static int it6505_typec_mux_set(struct typec_mux_dev *mux,
+				struct typec_mux_state *state)
+{
+	return 0;
+}
+
+static int it6505_register_mode_switch(struct device *dev, struct device_node *node,
+					struct it6505 *it6505)
+{
+	struct it6505_port_data *port_data;
+	struct typec_mux_desc mux_desc = {};
+	char name[32];
+	u32 port_num;
+	int ret;
+
+	ret = of_property_read_u32(node, "reg", &port_num);
+	if (ret)
+		return ret;
+
+	if (port_num >= it6505->num_typec_switches) {
+		dev_err(dev, "Invalid port number specified: %d\n", port_num);
+		return -EINVAL;
+	}
+
+	port_data = &it6505->typec_ports[port_num];
+	port_data->it6505 = it6505;
+	mux_desc.fwnode = &node->fwnode;
+	mux_desc.drvdata = port_data;
+	snprintf(name, sizeof(name), "%s-%u", node->name, port_num);
+	mux_desc.name = name;
+	mux_desc.set = it6505_typec_mux_set;
+
+	port_data->typec_mux = typec_mux_register(dev, &mux_desc);
+	if (IS_ERR(port_data->typec_mux)) {
+		ret = PTR_ERR(port_data->typec_mux);
+		dev_err(dev, "Mode switch register for port %d failed: %d", port_num, ret);
+	}
+
+	return ret;
+}
+
+static void it6505_unregister_typec_switches(struct it6505 *it6505)
+{
+	int i;
+
+	for (i = 0; i < it6505->num_typec_switches; i++)
+		typec_mux_unregister(it6505->typec_ports[i].typec_mux);
+}
+
 static int it6505_register_typec_switches(struct device *device, struct it6505 *it6505)
 {
-	struct device_node *of;
+	struct device_node *of, *sw;
+	int ret = 0;
 
 	of = of_get_child_by_name(device->of_node, "switches");
 	if (!of)
@@ -3241,8 +3298,28 @@ static int it6505_register_typec_switches(struct device *device, struct it6505 *
 	it6505->num_typec_switches = of_get_child_count(of);
 	if (it6505->num_typec_switches <= 0)
 		return -ENODEV;
+	it6505->typec_ports = devm_kzalloc(device,
+					   it6505->num_typec_switches *
+					   sizeof(struct it6505_port_data),
+					   GFP_KERNEL);
+	if (!it6505->typec_ports)
+		return -ENOMEM;
 
-	return 0;
+	/* Register switches for each connector. */
+	for_each_available_child_of_node(of, sw) {
+		if (!of_property_read_bool(sw, "mode-switch"))
+			continue;
+		ret = it6505_register_mode_switch(device, sw, it6505);
+		if (ret) {
+			dev_err(device, "Failed to register mode switch: %d\n", ret);
+			break;
+		}
+	}
+
+	if (ret)
+		it6505_unregister_typec_switches(it6505);
+
+	return ret;
 }
 
 static int it6505_i2c_probe(struct i2c_client *client,
@@ -3280,7 +3357,8 @@ static int it6505_i2c_probe(struct i2c_client *client,
 
 	ret = it6505_register_typec_switches(dev, it6505);
 	if (ret) {
-		dev_dbg(dev, "Didn't register Type C switches, err: %d", ret);
+		if (ret != -ENODEV)
+			dev_warn(dev, "Didn't register Type C switches, err: %d", ret);
 		if (!it6505->extcon) {
 			dev_err(dev, "Both extcon and typec-switch are not registered.");
 			return -EINVAL;
@@ -3350,6 +3428,7 @@ static int it6505_i2c_remove(struct i2c_client *client)
 	drm_dp_aux_unregister(&it6505->aux);
 	it6505_debugfs_remove(it6505);
 	it6505_poweroff(it6505);
+	it6505_unregister_typec_switches(it6505);
 
 	return 0;
 }
-- 
2.37.0.rc0.104.g0611611a94-goog

