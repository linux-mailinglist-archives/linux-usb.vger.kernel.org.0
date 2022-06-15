Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4010454CFE8
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jun 2022 19:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240583AbiFORag (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jun 2022 13:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357633AbiFORaS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jun 2022 13:30:18 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69E9F50E15
        for <linux-usb@vger.kernel.org>; Wed, 15 Jun 2022 10:30:11 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id q140so11991195pgq.6
        for <linux-usb@vger.kernel.org>; Wed, 15 Jun 2022 10:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6culLu8Dk3rzyJWu55f+Mr5Uwb5J3lBiEPJ8LAzaeEU=;
        b=efkj7DkT5itHUuSWTimca6V8Dl8BYgPcpa2YZNDQrmu3cIf6RC9eQVwsvgiC5s/Cj+
         Voz2aMekulQK0r89/sXT5fB8sfP+nMa4Kh56MgJ9o0kJTn9ch85lyVVTTDucSKFZ47pW
         oN75nop1FrxRtYmRt7+0gL5ZqE3X1kSpab7rA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6culLu8Dk3rzyJWu55f+Mr5Uwb5J3lBiEPJ8LAzaeEU=;
        b=yfoLc3cBP76mqemROI9Gy/6EQg3ZEHgZDEX7QBI58x9ppt317zWPOcqLs4IKmQ/m0a
         MysqhSIOKzePeKCgruRPkH96a/HVNHa+a2lRU4T0fiS6WdBH2YssJkTV++kppFzXmst0
         WbANg7yvjeIsZ3B+wtmfaKM5vfH71wWXnX23NITkFHZ/mUHp9XCguYpNHo/+kmEPrkZh
         6XN3QJa82/QZD3hgUjxv1wEdHXT2iXmBnX1CftpiZ8cViTbp2OPWqoEo2VG1JVdcLvfh
         +MVeYbPHYS1FqEWbq8XCkTiHjeID7GCYEhk7Hvs+FMKccBqhIPKyB/Lej8ca2uU0wJmv
         AVKg==
X-Gm-Message-State: AJIora8eUODwZTg8U3JUuK7YJefEauN4FIqSXV2ULCP6LznRRTkBfihu
        lmYV5WV03Wi8xi9ZrWNk+DScWg==
X-Google-Smtp-Source: AGRyM1uyYuXv/zNVaSknswcFjiqrPpyY+9txa301mMTCpJQJ2mWo3Mt58qohGEwgUKir1yneBQXd+w==
X-Received: by 2002:a63:234f:0:b0:405:3981:be7 with SMTP id u15-20020a63234f000000b0040539810be7mr744099pgm.15.1655314210872;
        Wed, 15 Jun 2022 10:30:10 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id d10-20020aa7814a000000b005103abd2fdbsm10147433pfn.206.2022.06.15.10.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 10:30:10 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     bleung@chromium.org, swboyd@chromium.org,
        heikki.krogerus@linux.intel.com,
        Prashant Malani <pmalani@chromium.org>,
        =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= 
        <nfraprado@collabora.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Pin-Yen Lin <treapking@chromium.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v4 6/7] drm/bridge: anx7625: Register Type-C mode switches
Date:   Wed, 15 Jun 2022 17:20:22 +0000
Message-Id: <20220615172129.1314056-7-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220615172129.1314056-1-pmalani@chromium.org>
References: <20220615172129.1314056-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the DT node has "switches" available, register a Type-C mode-switch
for each listed "switch". This allows the driver to receive state
information about what operating mode a Type-C port and its connected
peripherals are in, as well as status information (like VDOs) related to
that state.

The callback function is currently a stub, but subsequent patches will
implement the required functionality.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v3:
- No changes.

Changes since v2:
- Updated dev_info() to dev_warn() print, but added a check to ensure it
  only triggers on non -ENODEV errors.
- Made conflict resolutions resulting from changes introduced in
  Patch v3 5/7 (add ret variable here instead of in Patch v3 5/7).
- Added Reviewed-by and Tested-by tags.

Changes since v1:
- No changes.

 drivers/gpu/drm/bridge/analogix/anx7625.c | 82 +++++++++++++++++++++--
 drivers/gpu/drm/bridge/analogix/anx7625.h |  6 ++
 2 files changed, 84 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index e3d4c2738b8c..bd21f159b973 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -15,6 +15,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/usb/typec_mux.h>
 #include <linux/workqueue.h>
 
 #include <linux/of_gpio.h>
@@ -2581,10 +2582,61 @@ static void anx7625_runtime_disable(void *data)
 	pm_runtime_disable(data);
 }
 
+static int anx7625_typec_mux_set(struct typec_mux_dev *mux,
+				 struct typec_mux_state *state)
+{
+	return 0;
+}
+
+static int anx7625_register_mode_switch(struct device *dev, struct device_node *node,
+					struct anx7625_data *ctx)
+{
+	struct anx7625_port_data *port_data;
+	struct typec_mux_desc mux_desc = {};
+	char name[32];
+	u32 port_num;
+	int ret;
+
+	ret = of_property_read_u32(node, "reg", &port_num);
+	if (ret)
+		return ret;
+
+	if (port_num >= ctx->num_typec_switches) {
+		dev_err(dev, "Invalid port number specified: %d\n", port_num);
+		return -EINVAL;
+	}
+
+	port_data = &ctx->typec_ports[port_num];
+	port_data->ctx = ctx;
+	mux_desc.fwnode = &node->fwnode;
+	mux_desc.drvdata = port_data;
+	snprintf(name, sizeof(name), "%s-%u", node->name, port_num);
+	mux_desc.name = name;
+	mux_desc.set = anx7625_typec_mux_set;
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
+static void anx7625_unregister_typec_switches(struct anx7625_data *ctx)
+{
+	int i;
+
+	for (i = 0; i < ctx->num_typec_switches; i++)
+		typec_mux_unregister(ctx->typec_ports[i].typec_mux);
+}
+
 static int anx7625_register_typec_switches(struct device *device, struct anx7625_data *ctx)
 {
-	struct device_node *of = of_get_child_by_name(device->of_node, "switches");
+	struct device_node *of, *sw;
+	int ret = 0;
 
+	of = of_get_child_by_name(device->of_node, "switches");
 	if (!of)
 		return -ENODEV;
 
@@ -2592,7 +2644,27 @@ static int anx7625_register_typec_switches(struct device *device, struct anx7625
 	if (ctx->num_typec_switches <= 0)
 		return -ENODEV;
 
-	return 0;
+	ctx->typec_ports = devm_kzalloc(device,
+					ctx->num_typec_switches * sizeof(struct anx7625_port_data),
+					GFP_KERNEL);
+	if (!ctx->typec_ports)
+		return -ENOMEM;
+
+	/* Register switches for each connector. */
+	for_each_available_child_of_node(of, sw) {
+		if (!of_property_read_bool(sw, "mode-switch"))
+			continue;
+		ret = anx7625_register_mode_switch(device, sw, ctx);
+		if (ret) {
+			dev_err(device, "Failed to register mode switch: %d\n", ret);
+			break;
+		}
+	}
+
+	if (ret)
+		anx7625_unregister_typec_switches(ctx);
+
+	return ret;
 }
 
 static int anx7625_i2c_probe(struct i2c_client *client,
@@ -2701,8 +2773,8 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 		queue_work(platform->workqueue, &platform->work);
 
 	ret = anx7625_register_typec_switches(dev, platform);
-	if (ret)
-		dev_dbg(dev, "Didn't register Type C switches, err: %d\n", ret);
+	if (ret && ret != -ENODEV)
+		dev_warn(dev, "Didn't register Type C switches, err: %d\n", ret);
 
 	platform->bridge.funcs = &anx7625_bridge_funcs;
 	platform->bridge.of_node = client->dev.of_node;
@@ -2757,6 +2829,8 @@ static int anx7625_i2c_remove(struct i2c_client *client)
 
 	drm_bridge_remove(&platform->bridge);
 
+	anx7625_unregister_typec_switches(platform);
+
 	if (platform->pdata.intp_irq)
 		destroy_workqueue(platform->workqueue);
 
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index d5cbca708842..76cfc64f7574 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -443,6 +443,11 @@ struct anx7625_i2c_client {
 	struct i2c_client *tcpc_client;
 };
 
+struct anx7625_port_data {
+	struct typec_mux_dev *typec_mux;
+	struct anx7625_data *ctx;
+};
+
 struct anx7625_data {
 	struct anx7625_platform_data pdata;
 	struct platform_device *audio_pdev;
@@ -474,6 +479,7 @@ struct anx7625_data {
 	struct mipi_dsi_device *dsi;
 	struct drm_dp_aux aux;
 	int num_typec_switches;
+	struct anx7625_port_data *typec_ports;
 };
 
 #endif  /* __ANX7625_H__ */
-- 
2.36.1.476.g0c4daa206d-goog

