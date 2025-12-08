Return-Path: <linux-usb+bounces-31255-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BADECABC1B
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 02:56:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9AE01300BD88
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 01:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F059B25C802;
	Mon,  8 Dec 2025 01:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="lyRPzx08"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6C3242D98;
	Mon,  8 Dec 2025 01:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765158946; cv=none; b=O0nyMdHm1yADvXllCW9ZiMQrC1Btt4hJMwzgL06VQwcXoTvMikLfhtOcjNF5K+LWvfXJMTeEGaIfqxDBj/ktsnJFBTz4TrOVMe0YabmQlzzcTFQWe64dxmUTdckquGmCVU7FuKIP6N8tnmpyUUkzu3/uoPSaGCnJ9RbeNffC04g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765158946; c=relaxed/simple;
	bh=er8jqugAOtZH14+xsvNPaWFL5/vXyjQ3XZItkrwqyNA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=rD12Sz+MJKDU86m3IVoURFgjH9WQ46zvuwI7mWFO94cPRbG1U8YIyEtpl4gLCqRkgZnZCZKxZQxVDJCXvimapdRxUlwy/23wjVr37X7kVPrkM0/jXXCBeZfJirEMzDjapap4TluipDSyr4aKuqgWv6ttlKnFd373IKrubD8K7CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=lyRPzx08; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1765158930;
	bh=RCoApW58uwU2PDY/YzjUBVlUXFHY8idxqTE/wHC6S8g=;
	h=From:To:Subject:Date:Message-Id;
	b=lyRPzx08NxIJiY9L6U9EipOSloT79349AJAORhsq9lppMlqtzGAlwRvEnJh0+h6bY
	 Zf9yQQrFybvkSQ2+uC0ko1yF/l1DoTcABWqFPjWWgstcds052UNrsrQp+wlSTAuYOp
	 ZlTC3YtAu9CV2BUfk5azFNOfZI/Nblq3WXmoESy4=
X-QQ-mid: esmtpsz19t1765158928te5f51995
X-QQ-Originating-IP: kcxCGZPPcU96TfidxkPp4h6SAeMB0/ABmBp+GsBCCJo=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Dec 2025 09:55:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12888051069085088122
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
Subject: [PATCH v13 04/11] drm/bridge: aux: Add drm_aux_bridge_register_from_node()
Date: Mon,  8 Dec 2025 09:54:53 +0800
Message-Id: <20251208015500.94-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251208015500.94-1-kernel@airkyi.com>
References: <20251208015500.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NDRJhlKLIrRL+NIQ68Wi+BYoMjn8X7rPAg5zBmu4cK7UZrkbLdgeyAe6
	1cSFFlke0TsnJWHkIXk6iVOWxR5ZB2lv0Llhq7XD1xml2LABkqP0MFIjvh+wCxo009ubdTK
	gkCRPDfnjz2VKrlNje/lj/TSvNi+fY0kJ/YnPD06XmvWMsWF6bUNharJ59ZS14LH6U5eRbj
	zjf4AsrhyX6A02UQsHbU1OJiaGIHm0IBdLq0KAdM2/aTJhlXLGgbZgGAZpMOGH3qjIUJQGX
	1G0evQ+pqJBfhbajAlzftDNPIaywXADa9KLw3r8sW1ytRCd91BHzvdVTlcctxv4uN/HAypO
	sq/93fQNqlVQEXOYrZjo8D0EJUZ7y6rgZwQzqoAQ5IAervr7KIywCj+hgII9nYOnO0AVcJI
	nuXuZqKf80GOis8G2qmwxHLS3KYh0myRL23M4+HYCKSBxxzS+acj99r3gQCFYz2FBHimp8R
	nLdXbk54O1qcyoUvYXTTWqbMm7Eod3m98pnbXLcuc8kTBQc+zV2uBef8PgXRoFCV/CEsCIs
	kNGKJEi6ApdmKwCnA+0GyqllLsWtP4+8nQoHHQTq/JEHGp1fXdfoWRX1DOb83Eb+ooKlp0/
	z/N7baN2NUbT+zkisKxEkuTV+IsG5OQWoB7gfqxrLza6bNeY5AYdF8C2KBWHMcrIkNU+e8s
	sB2Gx7WwgvZrACUJ/U0slQdB/SEAHn1IDoe0kyURM1guJmNaaDXf/3n7WRnxcXAr67t5Vmy
	oR1cQ2xDCtkynJaXIVsVX3qUoKoIPU+QY/93s1SG5urixWtAMoaFRY7IigmI4G1hCQlU1B0
	Dwf3VZEDLZdZF67mSQvR7H42f5pF6hp45WaqrKcjA6hcOyx/7rEbDfocg3PwPHuqk3TX5g2
	gcBE/ZPLinP1d/lHGivnekGouRMFGIhKWtSoZwwtSmg60GCqYMF0W71FgR0SAfoZfvDhxuy
	w4ZQTx8RAY7A6TSuH6TjOiOXpdIlPtCJLrvRGre0ORrIMydnveK28tEiXKu+pDe9stOWV6d
	EdkCZvNyy174R5ZqYYAvM4JFWm/YA=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
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


