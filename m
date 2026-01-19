Return-Path: <linux-usb+bounces-32471-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 31272D39FD8
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 08:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4471430060C5
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 07:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D36B335BC6;
	Mon, 19 Jan 2026 07:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="D+elyjcK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818C52F6590;
	Mon, 19 Jan 2026 07:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768807904; cv=none; b=YbVyBbbY6kIBmax9JZkcVU+XNkI16Dk4lLiMbaEho3oULaoOs5rdI3aAirOWmAukJwUTerOIcTn5s9a+MHwnhA6u7+7Rd+5eltsVOc3OB4/jUJeGDkYcTG6TWRue75xGWjJHjbVwOvSCYEpEr+4R20E1C3grvN5hZ+kuKbdTGFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768807904; c=relaxed/simple;
	bh=vPsyzj6/MSOc6sqNmDWLDGrmzZ/tzKyolgK8GVFnH9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=CunjBZV5sw4Vk9rD1yEh9KdufR2lQpGxUcH3iVrIt6vG3dqbj37K7NUdVCZ+llBMqBBB1QjZZw1Hi9+KVQ1yZ+SRDGMnQZnpra55ZkvQ8veTCh0lJtILxaO9aeDBGVSB/AB76itWilbEiQ9rBLK1KhiDZmBkIatR9KnNshDrIwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=D+elyjcK; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1768807889;
	bh=5ZqODQ5igOoBvPuYVh0rP+EhPppD6n2yhjb+6z4KnfU=;
	h=From:To:Subject:Date:Message-Id;
	b=D+elyjcKTTFVbtpb3ndAthNniClbtm0vXyqxJHMTp4WT3S99mLAJr9cBQc2BMPVnL
	 rCYmYSTR/9bfuYVk9CP0lA/vfoPbHWjEVdojQjxr+/VTvhPyBbi8YzMiUi2R0LrOMv
	 ZPeNiLixk7h8/QLayo/CaHSLpLc2Vr0mxOS/ZYhw=
X-QQ-mid: esmtpsz17t1768807887tc6c1cd7e
X-QQ-Originating-IP: Y9Cfzzlo6OYydIEHXqhCNUVPKhYgnaX7YPgZi2JRbME=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jan 2026 15:31:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14245727192888249367
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Chen <hzpeterchen@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v14 2/9] drm/bridge: aux: Add drm_aux_bridge_register_from_node()
Date: Mon, 19 Jan 2026 15:30:53 +0800
Message-Id: <20260119073100.143-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260119073100.143-1-kernel@airkyi.com>
References: <20260119073100.143-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MgOcfNUnrri+sqbCh2B7bRF7YnOvRybRTkLsFlF0iVOUCyAXF4ZU9JNC
	Npq/5bKYRsboTYSvj5t28zBYZKy5ZYc3t3qupUeg52J0apd6CbhYlLHhgbT4R77VxP0D0di
	AJ73iJ2oixavKTjRsvyxLWiaH6B3+KI5hKzw8lz9/YfI8ONSCUl2DXUFYsAotuAXjc/j1Wk
	Nq14q8h8LpOKau42zH1ryczN2TkFAAUdEKow+9Wet89dqzb6h7dpaSzFZlEBO9FlpL804/f
	Nb9h/Wywn3/FOgRt2FP/vOfkxus6eBUah2irq9bYNXbfrIQUYfdQ9BtWWDHob0rMo0Szh/S
	pxGmzvezZhmPHFucBepr2jIAc9WM4Mhjk+UaQLz5RQk9GAF0D3Ba54ibUacf+H0EfQiF8qr
	t9NYgOhap01tMR7n2bFSPwwbyGrGSUcMHdpYZtnTDosZXbglMpL61zOfERvw3/5OADvoGLb
	nx2/I1eQgu1QxXWUxxM0oy8I2pcxgaDR9FGeVVmhhN+sIq1I/yj5ZEZ9D25pissIxSBtUL6
	kMBPkHgYvI8lt687U3LzEipvmU0YY4h4kcsps08a2M4XiFZ0GT34gQ9PrMQ+bORBuXx/VRS
	+eap6hmXCFsy5d+uQRFybF9QxLdoY/REWKZyWjEYRmc/dC8K/MW24eRdVt0xYEagX7J1rDJ
	J4Y0Hah0CwMePL8i3MEZMa8nO5fTnAXhMXVwGhJDEf9H8K/d1PQcNFGibPRf+RbADQudVZw
	6cV/RqL+StNxQN0sx1KFJwvjetzpX9bgKIy0lnw8T+9Y9y5XIKtwr4Fj95poXKD0raHUkVS
	N9FoQI9SBQZKXcjn28qpVjtclkgbGBhX8NNd0NHzoBOfk6UjtDqIjmKRvB2kLegDCRzSx6/
	d9YszO6nVjZMn+eoM6zgT3XrvJyS8GupHQ7kpJp4xUF4Qp9DRCwV9PCviJzrD2m6mhVGfJy
	O+a4y5U5TTDSdxionRsc8HIOFYqL9+/6/bFmvVSfizDLEJt0xvEsKEnpZ2Z55sMEmupbTco
	FY8JL5/hdh4eYYL3h8kQZQGUc52Gqg4qaJD+1VvQ==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The drm_aux_bridge_register() uses the device->of_node as the
bridge->of_node.

This patch adds drm_aux_bridge_register_from_node() to allow
specifying the of_node corresponding to the bridge.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---

(no changes since v11)
---

 drivers/gpu/drm/bridge/aux-bridge.c | 24 ++++++++++++++++++++++--
 include/drm/bridge/aux-bridge.h     |  6 ++++++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
index b3e4cdff61d6..52dff4601c2d 100644
--- a/drivers/gpu/drm/bridge/aux-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-bridge.c
@@ -35,6 +35,7 @@ static void drm_aux_bridge_unregister_adev(void *_adev)
 /**
  * drm_aux_bridge_register - Create a simple bridge device to link the chain
  * @parent: device instance providing this bridge
+ * @np: device node pointer corresponding to this bridge instance
  *
  * Creates a simple DRM bridge that doesn't implement any drm_bridge
  * operations. Such bridges merely fill a place in the bridge chain linking
@@ -42,7 +43,7 @@ static void drm_aux_bridge_unregister_adev(void *_adev)
  *
  * Return: zero on success, negative error code on failure
  */
-int drm_aux_bridge_register(struct device *parent)
+int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np)
 {
 	struct auxiliary_device *adev;
 	int ret;
@@ -62,7 +63,10 @@ int drm_aux_bridge_register(struct device *parent)
 	adev->dev.parent = parent;
 	adev->dev.release = drm_aux_bridge_release;
 
-	device_set_of_node_from_dev(&adev->dev, parent);
+	if (np)
+		device_set_node(&adev->dev, of_fwnode_handle(np));
+	else
+		device_set_of_node_from_dev(&adev->dev, parent);
 
 	ret = auxiliary_device_init(adev);
 	if (ret) {
@@ -80,6 +84,22 @@ int drm_aux_bridge_register(struct device *parent)
 
 	return devm_add_action_or_reset(parent, drm_aux_bridge_unregister_adev, adev);
 }
+EXPORT_SYMBOL_GPL(drm_aux_bridge_register_from_node);
+
+/**
+ * drm_aux_bridge_register - Create a simple bridge device to link the chain
+ * @parent: device instance providing this bridge
+ *
+ * Creates a simple DRM bridge that doesn't implement any drm_bridge
+ * operations. Such bridges merely fill a place in the bridge chain linking
+ * surrounding DRM bridges.
+ *
+ * Return: zero on success, negative error code on failure
+ */
+int drm_aux_bridge_register(struct device *parent)
+{
+	return drm_aux_bridge_register_from_node(parent, NULL);
+}
 EXPORT_SYMBOL_GPL(drm_aux_bridge_register);
 
 struct drm_aux_bridge_data {
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index c2f5a855512f..7dd1f17a1354 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -13,11 +13,17 @@ struct auxiliary_device;
 
 #if IS_ENABLED(CONFIG_DRM_AUX_BRIDGE)
 int drm_aux_bridge_register(struct device *parent);
+int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np);
 #else
 static inline int drm_aux_bridge_register(struct device *parent)
 {
 	return 0;
 }
+
+static inline int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np)
+{
+	return 0;
+}
 #endif
 
 #if IS_ENABLED(CONFIG_DRM_AUX_HPD_BRIDGE)
-- 
2.51.1


