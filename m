Return-Path: <linux-usb+bounces-28431-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A51B8EAE9
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 03:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EE183BE9D1
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 01:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A43117A306;
	Mon, 22 Sep 2025 01:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="IAtuk+Fh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CE716FF37;
	Mon, 22 Sep 2025 01:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758504108; cv=none; b=JhZdKVtqX9M/0xWaLm4gIp0E3sti0lBpgX99vevTBorVtvRYWE1wap71gLXp5haJ1bqRE5JbsuVuU0ZfGrQ8e9Zjzmr9QEboHRbS6NHylO5xkwikQa3zXIGc3uikC5wfcMuhBW9ayjSG4oAWUgiRTDkrjIa4rmumAKWG48NIeNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758504108; c=relaxed/simple;
	bh=2J7LCXGi7hmOODLgiUSwoCS9dK7aX0PuXTASbi58KUk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=sYynlsXEIqv2srUSe00k9K2O7e16K53i2FS6ywnEq2tozLnCs5ZolFwOAEGMR8tUQEKupy/Nd41EJU4VCdhSTmuA2Dp2yQqe4fdXL7q+waFQyIqCC0UYr4g7UFGdENihH3hb0t6edMJs1dXYXu4ItD8I/bQ9fry2kXOIU0gYs6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=IAtuk+Fh; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1758504068;
	bh=luM6lBNu5ZO4eNeOMMICfFk3qQPUgvjzbZ7GZBNmaHc=;
	h=From:To:Subject:Date:Message-Id;
	b=IAtuk+FhLKxfis8lYqUtY7k6JNtgVfMoy6MGrLeARZwDBH7I9As38/hoTOcn+WAXe
	 8AavmMPKPEUJzP7X6OxEiebzqwhXIcaGE8CFXxzih5BED0zSmN/ZOmXOT6InGMeZoh
	 dPjS9VktCske//fYGIxKbOSJ7ckTTEozk07uDP/E=
X-QQ-mid: zesmtpgz1t1758504067t09a019ba
X-QQ-Originating-IP: uWrsAC1547ktHVw/jlIhRv4jzPxTE/lpkp2cBqqMum8=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 22 Sep 2025 09:21:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15475593906797426768
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 5/7] drm/rockchip: cdn-dp: Add multiple bridges to support PHY port selection
Date: Mon, 22 Sep 2025 09:20:37 +0800
Message-Id: <20250922012039.323-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250922012039.323-1-kernel@airkyi.com>
References: <20250922012039.323-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MyirvGjpKb1jFfeLshlYyh/zRpjC2fSJOSxa7UG8t7Ir4Dtm+qLL9Ihl
	RhQ6n8uSHV7Tg8PeIjkoTtnsudFCipgT8DWefwW4OiQIhg8O3z7gEH49qwp7m2+JVEsHqGP
	eje+02D5sSb0Uxpel4QPEi2Uxzuugk1NER0BiSQPiadAJm6oobVewHk5hmK72CW7dDm2Qgr
	yE+CQDS/W9p4qzA15nJO9XCh+NBZh8qN8t2INPoUdPsaUbLicj0Tat8uPYq1Tgg73jejess
	a5LonZz0Yayt8IXDkhFPrCXLxsmDWqBm+my152Qhl513WDuGA/HjuN7rYrKdqfopp/THzwS
	R23Hx7XVGdod9KSmPmpzzos1emgSXG5IBgJ+7bYA2HRlSa2s+EFIfhnGbfVaIkqnVuTFbN3
	t3wiTX7SXe1CjHfzUOvbcw2KP15XJFST2v6N8ESjHXrsfXjk6otatai/7XN5/zjdvKPbD8y
	C1TjRho5yVW6utHyyTX0Q1kdMbRfX0ToNdVFaE+Eryf9w6FKnnUFR3aqka9836F4WqiLNQi
	6PG+Dt5f6pxuFp00ip/8sMxdSQV/1ZwfYL8kuxu8l7IdjbP3qZW12hhVRRq5jkN4T/RyO3S
	K1bHLtVa2oCb/PuWPH67Q5si8H7WyAQIhQkvuOhvSgxD8qRHdBP7zabjr0IDY5bwiQIo913
	dWPJXxxygEYGn+ChILT7Jrwssra/c3uM3mIFE/5szgkZHWWzUhf5FNB21dVj6mEkS6mJDT2
	3wnq8q1KwWLrmJEUs1Wy5uJ0NVxngLQNbsuVmZ5tcvlCgsZ8P8EoBEkpA5ZK46ZaitM/LL1
	A6WR8uzBSZcal0LEjh/J+h+14ByL7K5d9Gi36cOYH8fJyZ9zr22tfQEqcSVMuVbrk9vCxlp
	H5/UnEOTyAdJJEzYzMnetgtq0CgvkvDxhVT3eiWI/99yWFW+c48QEABjZ/8FOziqm7mVO2k
	8XRSunsu2EsDRNjtvLafBtMfNPe8Q6PF0zhRM9rQ1OnAPMss7QJPggkS/YRkpuDYvNWW6Uw
	AZM9uOqg==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
the CDN-DP can be switched to output to one of the PHYs. If both ports
are plugged into DP, DP will select the first port for output.

This patch adds support for multiple bridges, enabling users to flexibly
select the output port. For each PHY port, a separate encoder and bridge
are registered.

The change is based on the DRM AUX HPD bridge, rather than the
extcon approach. This requires the DT to correctly describe the
connections between the PHY, USB connector, and DP controller.
And cdn_dp_parse_hpd_bridge_dt() will parses it and determines
whether to register one or two bridges.

Since there is only one DP controller, only one of the PHY ports can
output at a time. The key is how to switch between different PHYs,
which is handled by cdn_dp_switch_port() and cdn_dp_enable().

There are two cases:

1. Neither bridge is enabled. In this case, both bridges can
independently read the EDID, and the PHY port may switch before
reading the EDID.

2. One bridge is already enabled. In this case, other bridges are not
allowed to read the EDID.

Since the scenario of two ports plug in at the same time is rare,
I don't have a board which support two TypeC connector to test this.
Therefore, I tested forced switching on a single PHY port, as well as
output using a fake PHY port alongside a real PHY port.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/gpu/drm/rockchip/Kconfig       |   1 +
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 398 +++++++++++++++++++++----
 drivers/gpu/drm/rockchip/cdn-dp-core.h |  23 +-
 3 files changed, 366 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index faf50d872be3..3a6266279323 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -55,6 +55,7 @@ config ROCKCHIP_CDN_DP
 	select DRM_DISPLAY_HELPER
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_AUX_HPD_BRIDGE
 	help
 	  This selects support for Rockchip SoC specific extensions
 	  for the cdn DP driver. If you want to enable Dp on
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 1e27301584a4..784f5656fcc4 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -27,16 +27,17 @@
 #include "cdn-dp-core.h"
 #include "cdn-dp-reg.h"
 
-static inline struct cdn_dp_device *bridge_to_dp(struct drm_bridge *bridge)
+static int cdn_dp_switch_port(struct cdn_dp_device *dp, struct cdn_dp_port *prev_port,
+			      struct cdn_dp_port *port);
+
+static inline struct cdn_dp_bridge *bridge_to_dp_bridge(struct drm_bridge *bridge)
 {
-	return container_of(bridge, struct cdn_dp_device, bridge);
+	return container_of(bridge, struct cdn_dp_bridge, bridge);
 }
 
-static inline struct cdn_dp_device *encoder_to_dp(struct drm_encoder *encoder)
+static inline struct cdn_dp_device *bridge_to_dp(struct drm_bridge *bridge)
 {
-	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
-
-	return container_of(rkencoder, struct cdn_dp_device, encoder);
+	return bridge_to_dp_bridge(bridge)->parent;
 }
 
 #define GRF_SOC_CON9		0x6224
@@ -191,14 +192,27 @@ static int cdn_dp_get_sink_count(struct cdn_dp_device *dp, u8 *sink_count)
 static struct cdn_dp_port *cdn_dp_connected_port(struct cdn_dp_device *dp)
 {
 	struct cdn_dp_port *port;
-	int i, lanes;
+	int i, lanes[MAX_PHY];
 
 	for (i = 0; i < dp->ports; i++) {
 		port = dp->port[i];
-		lanes = cdn_dp_get_port_lanes(port);
-		if (lanes)
+		lanes[i] = cdn_dp_get_port_lanes(port);
+		if (!dp->hpd_bridge_valid)
 			return port;
 	}
+
+	if (dp->hpd_bridge_valid) {
+		/* If more than one port is available, pick the last active port */
+		if (dp->active_port > 0 && lanes[dp->active_port])
+			return dp->port[dp->active_port];
+
+		/* If the last active port is not available, pick an available port in order */
+		for (i = 0; i < dp->bridge_count; i++) {
+			if (lanes[i])
+				return dp->port[i];
+		}
+	}
+
 	return NULL;
 }
 
@@ -239,10 +253,11 @@ static enum drm_connector_status
 cdn_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct cdn_dp_device *dp = bridge_to_dp(bridge);
+	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
 	enum drm_connector_status status = connector_status_disconnected;
 
 	mutex_lock(&dp->lock);
-	if (dp->connected)
+	if (dp_bridge->connected && dp->connected)
 		status = connector_status_connected;
 	mutex_unlock(&dp->lock);
 
@@ -253,10 +268,36 @@ static const struct drm_edid *
 cdn_dp_bridge_edid_read(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct cdn_dp_device *dp = bridge_to_dp(bridge);
-	const struct drm_edid *drm_edid;
+	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
+	struct cdn_dp_port *port = dp->port[dp_bridge->id];
+	struct cdn_dp_port *prev_port;
+	const struct drm_edid *drm_edid = NULL;
+	int i, ret;
 
 	mutex_lock(&dp->lock);
+
+	/* More than one port is available */
+	if (dp->bridge_count > 1 && !port->phy_enabled) {
+		for (i = 0; i < dp->bridge_count; i++) {
+			/* Another port already enable */
+			if (dp->bridge_list[i] != dp_bridge && dp->bridge_list[i]->enabled)
+				goto unlock;
+			/* Find already enabled port */
+			if (dp->port[i]->phy_enabled)
+				prev_port = dp->port[i];
+		}
+
+		/* Switch to current port */
+		if (prev_port) {
+			ret = cdn_dp_switch_port(dp, prev_port, port);
+			if (ret)
+				goto unlock;
+		}
+	}
+
 	drm_edid = drm_edid_read_custom(connector, cdn_dp_get_edid_block, dp);
+
+unlock:
 	mutex_unlock(&dp->lock);
 
 	return drm_edid;
@@ -267,12 +308,13 @@ cdn_dp_bridge_mode_valid(struct drm_bridge *bridge,
 			 const struct drm_display_info *display_info,
 			 const struct drm_display_mode *mode)
 {
+	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
 	struct cdn_dp_device *dp = bridge_to_dp(bridge);
 	u32 requested, actual, rate, sink_max, source_max = 0;
 	u8 lanes, bpc;
 
 	/* If DP is disconnected, every mode is invalid */
-	if (!dp->connected)
+	if (!dp_bridge->connected || !dp->connected)
 		return MODE_BAD;
 
 	switch (display_info->bpc) {
@@ -571,6 +613,7 @@ static void cdn_dp_display_info_update(struct cdn_dp_device *dp,
 static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_atomic_state *state)
 {
 	struct cdn_dp_device *dp = bridge_to_dp(bridge);
+	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
 	struct drm_connector *connector;
 	int ret, val;
 
@@ -580,7 +623,7 @@ static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_at
 
 	cdn_dp_display_info_update(dp, &connector->display_info);
 
-	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, &dp->encoder.encoder);
+	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, &dp_bridge->encoder.encoder);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dp->dev, "Could not get vop id, %d", ret);
 		return;
@@ -599,6 +642,9 @@ static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_at
 
 	mutex_lock(&dp->lock);
 
+	if (dp->hpd_bridge_valid)
+		dp->active_port = dp_bridge->id;
+
 	ret = cdn_dp_enable(dp);
 	if (ret) {
 		DRM_DEV_ERROR(dp->dev, "Failed to enable bridge %d\n",
@@ -631,6 +677,7 @@ static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_at
 		goto out;
 	}
 
+	dp_bridge->enabled = true;
 out:
 	mutex_unlock(&dp->lock);
 }
@@ -638,9 +685,11 @@ static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_at
 static void cdn_dp_bridge_atomic_disable(struct drm_bridge *bridge, struct drm_atomic_state *state)
 {
 	struct cdn_dp_device *dp = bridge_to_dp(bridge);
+	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
 	int ret;
 
 	mutex_lock(&dp->lock);
+	dp_bridge->enabled = false;
 
 	if (dp->active) {
 		ret = cdn_dp_disable(dp);
@@ -885,7 +934,8 @@ static void cdn_dp_pd_event_work(struct work_struct *work)
 {
 	struct cdn_dp_device *dp = container_of(work, struct cdn_dp_device,
 						event_work);
-	int ret;
+	bool connected;
+	int i, ret;
 
 	mutex_lock(&dp->lock);
 
@@ -944,9 +994,12 @@ static void cdn_dp_pd_event_work(struct work_struct *work)
 
 out:
 	mutex_unlock(&dp->lock);
-	drm_bridge_hpd_notify(&dp->bridge,
-			      dp->connected ? connector_status_connected
-					    : connector_status_disconnected);
+	for (i = 0; i < dp->bridge_count; i++) {
+		connected = dp->connected && dp->bridge_list[i]->connected;
+		drm_bridge_hpd_notify(&dp->bridge_list[i]->bridge,
+				      connected ? connector_status_connected
+						: connector_status_disconnected);
+	}
 }
 
 static int cdn_dp_pd_event(struct notifier_block *nb,
@@ -966,28 +1019,99 @@ static int cdn_dp_pd_event(struct notifier_block *nb,
 	return NOTIFY_DONE;
 }
 
-static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
+static void cdn_dp_typec_hpd_cb(void *data, enum drm_connector_status status)
 {
-	struct cdn_dp_device *dp = dev_get_drvdata(dev);
-	struct drm_encoder *encoder;
-	struct drm_connector *connector;
-	struct cdn_dp_port *port;
-	struct drm_device *drm_dev = data;
-	int ret, i;
+	struct cdn_dp_hpd_bridge *hpd_bridge = data;
+	struct cdn_dp_device *dp = hpd_bridge->parent;
 
-	ret = cdn_dp_parse_dt(dp);
-	if (ret < 0)
-		return ret;
+	dp->bridge_list[hpd_bridge->id]->connected = status == connector_status_connected;
+	schedule_work(&dp->event_work);
+}
 
-	dp->drm_dev = drm_dev;
-	dp->connected = false;
-	dp->active = false;
-	dp->active_port = -1;
-	dp->fw_loaded = false;
+static void cdn_dp_bridge_hpd_enable(struct cdn_dp_device *dp)
+{
+	int i;
 
-	INIT_WORK(&dp->event_work, cdn_dp_pd_event_work);
+	if (!dp->hpd_bridge_valid)
+		return;
+
+	for (i = 0; i < dp->bridge_count; i++) {
+		drm_bridge_hpd_enable(dp->hpd_bridge_list[i].bridge, cdn_dp_typec_hpd_cb,
+				      &dp->hpd_bridge_list[i]);
+	}
+}
+
+static void cdn_dp_bridge_hpd_disable(struct cdn_dp_device *dp)
+{
+	int i;
+
+	if (!dp->hpd_bridge_valid)
+		return;
+
+	for (i = 0; i < dp->bridge_count; i++) {
+		drm_bridge_hpd_disable(dp->hpd_bridge_list[i].bridge);
+	}
+}
+
+static int cdn_dp_switch_port(struct cdn_dp_device *dp, struct cdn_dp_port *prev_port,
+			      struct cdn_dp_port *port)
+{
+	int ret;
+
+	if (dp->active)
+		return 0;
+
+	cdn_dp_bridge_hpd_disable(dp);
+
+	ret = cdn_dp_disable_phy(dp, prev_port);
+	if (ret)
+		goto out;
+	ret = cdn_dp_enable_phy(dp, port);
+	if (ret)
+		goto out;
+
+	ret = cdn_dp_get_sink_capability(dp);
+	if (ret) {
+		cdn_dp_disable_phy(dp, port);
+		goto out;
+	}
+
+	dp->active = true;
+	dp->lanes = port->lanes;
+
+	if (!cdn_dp_check_link_status(dp)) {
+		dev_info(dp->dev, "Connected with sink; re-train link\n");
+
+		ret = cdn_dp_train_link(dp);
+		if (ret) {
+			dev_err(dp->dev, "Training link failed: %d\n", ret);
+			goto out;
+		}
+
+		ret = cdn_dp_set_video_status(dp, CONTROL_VIDEO_IDLE);
+		if (ret) {
+			dev_err(dp->dev, "Failed to idle video %d\n", ret);
+			goto out;
+		}
+
+		ret = cdn_dp_config_video(dp);
+		if (ret)
+			dev_err(dp->dev, "Failed to configure video: %d\n", ret);
+	}
 
-	encoder = &dp->encoder.encoder;
+out:
+	cdn_dp_bridge_hpd_enable(dp);
+	return ret;
+}
+
+static int cdn_bridge_add(struct device *dev,
+			  struct drm_bridge *bridge,
+			  struct drm_encoder *encoder)
+{
+	struct cdn_dp_device *dp = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = dp->drm_dev;
+	struct drm_connector *connector;
+	int ret;
 
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,
 							     dev->of_node);
@@ -1002,23 +1126,23 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 
 	drm_encoder_helper_add(encoder, &cdn_dp_encoder_helper_funcs);
 
-	dp->bridge.ops =
-			DRM_BRIDGE_OP_DETECT |
-			DRM_BRIDGE_OP_EDID |
-			DRM_BRIDGE_OP_HPD |
-			DRM_BRIDGE_OP_DP_AUDIO;
-	dp->bridge.of_node = dp->dev->of_node;
-	dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
-	dp->bridge.hdmi_audio_dev = dp->dev;
-	dp->bridge.hdmi_audio_max_i2s_playback_channels = 8;
-	dp->bridge.hdmi_audio_spdif_playback = 1;
-	dp->bridge.hdmi_audio_dai_port = -1;
-
-	ret = devm_drm_bridge_add(dev, &dp->bridge);
+	bridge->ops =
+		DRM_BRIDGE_OP_DETECT |
+		DRM_BRIDGE_OP_EDID |
+		DRM_BRIDGE_OP_HPD |
+		DRM_BRIDGE_OP_DP_AUDIO;
+	bridge->of_node = dp->dev->of_node;
+	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
+	bridge->hdmi_audio_dev = dp->dev;
+	bridge->hdmi_audio_max_i2s_playback_channels = 8;
+	bridge->hdmi_audio_spdif_playback = 1;
+	bridge->hdmi_audio_dai_port = -1;
+
+	ret = devm_drm_bridge_add(dev, bridge);
 	if (ret)
 		return ret;
 
-	ret = drm_bridge_attach(encoder, &dp->bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return ret;
 
@@ -1031,6 +1155,167 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 
 	drm_connector_attach_encoder(connector, encoder);
 
+	return 0;
+}
+
+static int cdn_dp_parse_hpd_bridge_dt(struct cdn_dp_device *dp)
+{
+	struct device_node *np = dp->dev->of_node;
+	struct device_node *port __free(device_node) = of_graph_get_port_by_id(np, 1);
+	struct drm_bridge *bridge;
+	int count = 0;
+	int ret = 0;
+	int i;
+
+	/* If device use extcon, do not use hpd bridge */
+	for (i = 0; i < dp->ports; i++) {
+		if (dp->port[i]->extcon) {
+			dp->bridge_count = 1;
+			return 0;
+		}
+	}
+
+	/*
+	 *
+	 * &dp_out {
+	 *	dp_controller_output0: endpoint@0 {
+	 * 		remote-endpoint = <&dp_phy0_in>
+	 * 	};
+	 *
+	 * 	dp_controller_output1: endpoint@1 {
+	 * 		remote-endpoint = <&dp_phy1_in>
+	 * 	};
+	 * };
+	 *
+	 * &tcphy0_dp {
+	 * 	port {
+	 * 		tcphy0_typec_dp: endpoint@0 {
+	 * 			reg = <0>;
+	 * 			remote-endpoint = <&usbc0_dp>;
+	 * 		};
+	 *
+	 * 		dp_phy0_in: endpoint@1 {
+	 * 			reg = <1>;
+	 * 			remote-endpoint = <&dp_controller_output0>;
+	 * 		};
+	 * 	};
+	 * };
+	 *
+	 * &tcphy1_dp {
+	 * 	...
+	 * };
+	 *
+	 * usbcon0: connector {
+	 * 	...
+	 * 	ports {
+	 * 		...
+	 * 		port@2 {
+	 * 			reg = <2>;
+	 *
+	 * 			usbc0_dp: endpoint {
+	 * 				remote-endpoint = <&tcphy0_typec_dp>;
+	 * 			};
+	 * 		};
+	 * 	};
+	 * };
+	 *
+	 * usbcon1: connector {
+	 * 	...
+	 * };
+	 *
+	 */
+
+	/* One endpoint may correspond to one HPD bridge. */
+	for_each_of_graph_port_endpoint(port, dp_ep) {
+		/* Try to get "port" node of correspond PHY device */
+		struct device_node *phy_ep __free(device_node) =
+			of_graph_get_remote_endpoint(dp_ep);
+		struct device_node *phy_port __free(device_node) =
+			of_get_parent(phy_ep);
+
+		if (!phy_port) {
+			continue;
+		}
+
+		/*
+		 * A PHY port may contain two endpoints: USB connector port or CDN-DP port.
+		 * Try to find the node of USB connector.
+		 */
+		for_each_of_graph_port_endpoint(phy_port, typec_ep) {
+			struct device_node *connector_port __free(device_node) =
+				of_graph_get_remote_port_parent(typec_ep);
+			struct device_node *hpd_bridge_np __free(device_node) =
+				of_get_parent(connector_port);
+
+			if (typec_ep == phy_ep)
+				continue;
+
+			bridge = of_drm_find_bridge(hpd_bridge_np);
+			if (!bridge) {
+				ret = -EPROBE_DEFER;
+				goto out;
+			}
+
+			dp->hpd_bridge_valid = true;
+			dp->hpd_bridge_list[count].bridge = bridge;
+			dp->hpd_bridge_list[count].parent = dp;
+			dp->hpd_bridge_list[count].id = count;
+			count++;
+			break;
+		}
+	}
+
+out:
+	dp->bridge_count = count ? count : 1;
+	return ret;
+}
+
+static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
+{
+	struct cdn_dp_device *dp = dev_get_drvdata(dev);
+	struct drm_bridge *bridge;
+	struct drm_encoder *encoder;
+	struct cdn_dp_port *port;
+	struct drm_device *drm_dev = data;
+	struct cdn_dp_bridge *bridge_list;
+	int ret, i;
+
+	ret = cdn_dp_parse_dt(dp);
+	if (ret < 0)
+		return ret;
+
+	ret = cdn_dp_parse_hpd_bridge_dt(dp);
+	if (ret)
+		return ret;
+
+	dp->drm_dev = drm_dev;
+	dp->connected = false;
+	dp->active = false;
+	dp->active_port = -1;
+	dp->fw_loaded = false;
+
+	for (i = 0; i < dp->bridge_count; i++) {
+		bridge_list = devm_drm_bridge_alloc(dev, struct cdn_dp_bridge, bridge,
+						    &cdn_dp_bridge_funcs);
+		if (IS_ERR(bridge_list))
+			return PTR_ERR(bridge_list);
+		bridge_list->id = i;
+		bridge_list->parent = dp;
+		if (!dp->hpd_bridge_valid)
+			bridge_list->connected = true;
+		dp->bridge_list[i] = bridge_list;
+	}
+
+	for (i = 0; i < dp->bridge_count; i++) {
+		encoder = &dp->bridge_list[i]->encoder.encoder;
+		bridge = &dp->bridge_list[i]->bridge;
+		ret = cdn_bridge_add(dev, bridge, encoder);
+		if (ret)
+			return ret;
+	}
+
+	INIT_WORK(&dp->event_work, cdn_dp_pd_event_work);
+
 	for (i = 0; i < dp->ports; i++) {
 		port = dp->port[i];
 
@@ -1050,6 +1335,7 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 
 	pm_runtime_enable(dev);
 
+	cdn_dp_bridge_hpd_enable(dp);
 	schedule_work(&dp->event_work);
 
 	return 0;
@@ -1058,10 +1344,14 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 static void cdn_dp_unbind(struct device *dev, struct device *master, void *data)
 {
 	struct cdn_dp_device *dp = dev_get_drvdata(dev);
-	struct drm_encoder *encoder = &dp->encoder.encoder;
+	struct drm_encoder *encoder;
+	int i;
 
 	cancel_work_sync(&dp->event_work);
-	encoder->funcs->destroy(encoder);
+	for (i = 0; i < dp->bridge_count; i++) {
+		encoder = &dp->bridge_list[i]->encoder.encoder;
+		encoder->funcs->destroy(encoder);
+	}
 
 	pm_runtime_disable(dev);
 	if (dp->fw_loaded)
@@ -1112,10 +1402,10 @@ static int cdn_dp_probe(struct platform_device *pdev)
 	int ret;
 	int i;
 
-	dp = devm_drm_bridge_alloc(dev, struct cdn_dp_device, bridge,
-				   &cdn_dp_bridge_funcs);
-	if (IS_ERR(dp))
-		return PTR_ERR(dp);
+	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
+	if (!dp)
+		return -ENOMEM;
+
 	dp->dev = dev;
 
 	match = of_match_node(cdn_dp_dt_ids, pdev->dev.of_node);
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.h b/drivers/gpu/drm/rockchip/cdn-dp-core.h
index e9c30b9fd543..215f3da61af2 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.h
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.h
@@ -38,6 +38,8 @@ enum vic_pxl_encoding_format {
 	Y_ONLY = 0x10,
 };
 
+struct cdn_dp_device;
+
 struct video_info {
 	bool h_sync_polarity;
 	bool v_sync_polarity;
@@ -63,16 +65,33 @@ struct cdn_dp_port {
 	u8 id;
 };
 
+struct cdn_dp_bridge {
+	struct cdn_dp_device *parent;
+	struct drm_bridge bridge;
+	struct rockchip_encoder encoder;
+	bool connected;
+	bool enabled;
+	int id;
+};
+
+struct cdn_dp_hpd_bridge {
+	struct cdn_dp_device *parent;
+	struct drm_bridge *bridge;
+	int id;
+};
+
 struct cdn_dp_device {
 	struct device *dev;
 	struct drm_device *drm_dev;
-	struct drm_bridge bridge;
-	struct rockchip_encoder encoder;
+	int bridge_count;
+	struct cdn_dp_bridge *bridge_list[MAX_PHY];
+	struct cdn_dp_hpd_bridge hpd_bridge_list[MAX_PHY];
 	struct drm_display_mode mode;
 	struct platform_device *audio_pdev;
 	struct work_struct event_work;
 
 	struct mutex lock;
+	bool hpd_bridge_valid;
 	bool connected;
 	bool active;
 	bool suspended;
-- 
2.49.0


