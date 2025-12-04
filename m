Return-Path: <linux-usb+bounces-31146-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D6DCA2888
	for <lists+linux-usb@lfdr.de>; Thu, 04 Dec 2025 07:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E435530A6600
	for <lists+linux-usb@lfdr.de>; Thu,  4 Dec 2025 06:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7D128D8FD;
	Thu,  4 Dec 2025 06:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="qNccVOBW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A7828B7EA;
	Thu,  4 Dec 2025 06:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764829911; cv=none; b=pL9a9aph6/N1tggOlXOH+B/x+mhHMVbfjPumfJ32CHsG3lJHVC6XhpB8xaANgLrhw7KV/Zg0dceUtHrmYyl41P+aAiBrjU8u8+rh8CYDAFBHyBpE/Ru1n8llx9WLE10udAR8azo7uzbz4FVCKrqH/M/EEnK2AD+0YhyUVrdkM9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764829911; c=relaxed/simple;
	bh=er8jqugAOtZH14+xsvNPaWFL5/vXyjQ3XZItkrwqyNA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ceelNs8aN+nORBdn8dsqZzZju1vpOgGO/9OyhlFevnAJU44pMzdpL5GPisK3zMLO0Tf3eYYPxdzrJQtGMFkNgdPkQrkZ5ULzz9evxgFHBQBLtCBQfzsMS9wYIvorqnsc7uNy8gcd2jRb5LApL2aZXM1PieZClC8huYJuPyHBu0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=qNccVOBW; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764829899;
	bh=RCoApW58uwU2PDY/YzjUBVlUXFHY8idxqTE/wHC6S8g=;
	h=From:To:Subject:Date:Message-Id;
	b=qNccVOBWQol9V0edeDUVs3mW4awCJD66okSBs7bqqfk5ToVoDZJ+iUwmmQIfTbG6v
	 y6qVynSsDhTkJI3wwvvtDVm7BE0Ufvxt9da+PEO6s2jNqhvZZH6ZgSjAtoq/f0C+cy
	 4xMDE2sovdIN5fvcIHnNeOg1YzXT9lNfpTB1Lq7E=
X-QQ-mid: esmtpsz21t1764829897t315fc6bd
X-QQ-Originating-IP: 8xj2EBC2OrSdr2vMc6zndzxvKdFt5qIneZrq+PewvGw=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 04 Dec 2025 14:31:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17481815092374181840
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
Subject: [RESEND PATCH v11 04/11] drm/bridge: aux: Add drm_aux_bridge_register_from_node()
Date: Thu,  4 Dec 2025 14:31:02 +0800
Message-Id: <20251204063109.104-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251204063109.104-1-kernel@airkyi.com>
References: <20251204063109.104-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MsL7hwqo9bYs6xFPPVQf+22XkcID6WWuVysNNAL64xdmMRdhdcWscNap
	8yJ2bAyPjYsPxoUrfzD2vEKjmho6koPmp+2UQWhXlNcGwRMiFzYN8HbmcIpFWivwo80N3wB
	9njmXL1HYSUJQHRh3ZqTde2+1Q6YML8JGaIrVEyoPM2QbIWsLwjdQiMTnlLF6g4XnBwGXVd
	5wj1W4/NwNE9gcyThi1NZySkxMdwH6Ux3EjnNmaSRtkCBKEdK0ETAxKIQAVXgytln4pINn8
	WTsKLWh+BPDsySLN1nTTgUK1xgVtWlt3b+NVXQk/akz7qMcZPa0zXMnoEdvQBBBwNfd8R+F
	lACBEA3nFU0IjxBkz8zayizVsaRB+NVwOexXpFncY/6/F0Thq1zCcfmBlTMgiGT2paSAMxc
	yfCNuk/AxZnDlhOXDyGHiE9Xjl72rsH5CblSu3IXK2/9JhOEXoxv0Ral1Tk4AglY7/ILYMs
	r8By0j4J3EtPy8xO+tsVDKrs8COL8uWesFClH5L+fCeeDknZ0Gik/YTl34I9ZcYIbgdYOrv
	nMY3PY2g2IqSuZwCuJm3tDW6S2i9NtC72XLQa3p7392AXUaKIenWL9jlXyF+IzjqygxgABa
	4SKuAl9UZOA4qkMAtSFJ/iCU1KW1utGPnQ2MGsMZbTW1bYyvKzxgXMsIPTuKifUvsz5tET7
	bMyzQVWNyC8lONBZfYPdUdrFwhGX3rUwQWNPG9EdKHC0DoUBRkE+LloKa7ZyeRA0MaqJ6Z+
	Ok00xGYaB7mi3E1CtKbGUwfcycvAjkfT5h5MYmt/jKMy/6J1bLSQGZkvmdo9vUbfGIZ2EN1
	q7gpGqRKxrJR4Sw68OpCDp0mmMI3yGngMTzhCMjvkTrgml4PiHzLI39+VDmyx3xkFZXTUel
	sl2MraddoNeitpfMT0Bbwh99WIO89DS2kXI/MR2qOfQYyaNJva3TQVfJUsOp/29g7WCFeth
	ubb0SdYQKk4zJu52dZ4hi90w8gIP6Bv2O3Vs/lN5zoXOxqnSVKwg0JhRFHGW378xxowyiki
	YuzfXEfw==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
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


