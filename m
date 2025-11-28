Return-Path: <linux-usb+bounces-31023-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF311C90913
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 03:06:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46DC03AB41B
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 02:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3B428468B;
	Fri, 28 Nov 2025 02:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="IiAcSoL+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3931EF092;
	Fri, 28 Nov 2025 02:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764295491; cv=none; b=OxOr172B2JE4zTkc8PH8SM/P/zlI2OQTLVPhdMqYoYYco6KCZAc1p/Wd2pDG1snLXxVtk8yDFt/6kTgazTR73Xb9k6MV8A0xmBfQcl9MNK+MpvjBGuzVylC3WxkGcUEDhTgOSy4YL71wj2s27Y5jentq0iiEQoOZqhm8Yx72fuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764295491; c=relaxed/simple;
	bh=er8jqugAOtZH14+xsvNPaWFL5/vXyjQ3XZItkrwqyNA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Ss7cHH6/pBNqvWEg/xQxfbHX6xo+5EcOBBptApfEoNyVpN/KtVq+9ywN4VIqkyuW6jDMDnl0uU+UEo+/x8kZOREJSxsnIN1hyMu9ZkkDEMJLiY8IaCrZjG3DYTQn5shFgya856r8EF+6eWKN5/wXdV0wDg4nTJxjtOtygh5IomI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=IiAcSoL+; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764295476;
	bh=RCoApW58uwU2PDY/YzjUBVlUXFHY8idxqTE/wHC6S8g=;
	h=From:To:Subject:Date:Message-Id;
	b=IiAcSoL+ECKV6G43frznHLzzPn75lrL5f+CSmPRun6ruQ5bbeCy36dgfqWJGJWS9J
	 RL2Fr/MnGpuSYTct7pYh+OvvI2r5pALq2ptcbA7TtS411KFC++ZoaH6m5Qad8OFfuI
	 a6Py5Fcxw0SMMx8/oJ+38ehiw7spKcuASEYacfCw=
X-QQ-mid: esmtpsz21t1764295474t610ed2eb
X-QQ-Originating-IP: a0Nr6+ZqhJCmPQSe6ZFRf7bn96AF2PAOgvJ0/UNngjg=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Nov 2025 10:04:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13829267849716627158
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
Subject: [PATCH v11 04/11] drm/bridge: aux: Add drm_aux_bridge_register_from_node()
Date: Fri, 28 Nov 2025 10:03:58 +0800
Message-Id: <20251128020405.90-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251128020405.90-1-kernel@airkyi.com>
References: <20251128020405.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Md8NwmqZYy3fR9xImrRIMtgsOkw+04XVhEO/WC1DmMAvyHPj18ls2KBm
	LWWKXe0PB+w2+jhpiwHL+Mv8DTAMacaS9zpFFycnRrAcMDONP6f7A1kAR0JT7AhOiF317Pn
	Sy5FPc4by6FkC4UoWCgA7wLfZ45U/v+UgP/sw3tLk3piCe58CIPPrUJaYNQUKgRmDrjIbSz
	AZjilmDbvJo+Xr+axZb/XKwBCg7w6k3yG1wUNQtvmljlOtiHnTARG0/Jteq2NHbsFuIRNe6
	V4Fhh/Ga8yHZTC8tF7n+Ul3ll5o4T4ActEjBTmuoay0RA0kFYIjhxHk/CqeeIBi8aQS0iLf
	lB7DZmTm66YDYg/+/ADlRKXVm8AlQd7rgKhrEKGSqC+UZizcRK+JKTgElaN2d22eNyi6SN7
	EDiAJ+6/f7HULOwaYq7FPuQm3uaihj2cuNYw3ZCiLxt20YhD31aqclT32DgklJrw1dxPm5s
	4tsVv0QrdCVm7Td/XdHNRiroXq91DdkA3n3GmiBMoEh5iEVEPwxKbrcz2I+iu/h2JIxmzj+
	uj9Zmc9EWT+vI6DlPHarEJcwvLrRCon51qhIegY+/vJBbchNOcqfcmJ8IGdNqDlCY/JzSiF
	4DuxsVuE458jUxYzlYZyADI9SHHkx/QItJAG9ZnvrjzX0F5aSYT5em25Vv0Xdcv5KbxulDH
	in+f2j5LNgBMt4To6ol2/wSxUpx6uz1AfyQcFhsObq867LaU5ZaYdVzEboatGZtZDaNtgTn
	eS/kg3NTVJVy12UmWUtGERSavncdoCJP4Dhm0wkMENSr7vTI1/eQb89aEfT8vT3ZisSYjyx
	M26mc9PKXP44UvfEW3hfjw6Y6Bv/d55JoU1+fut9Q7RQDsTY4Iq/w7tlLmj1PsfRXjciZN7
	osixjvpujixevygq1MjQFNWf8esid5nsKsfZSHLwNXC8U+xhAmEaUHuFPF2eWW/Mb9IkXGd
	w4BL8OIcCer/BnF4RtjeGpWTYpjsBDyo1BQHzdC5cIVu85GBBvpvmXO/jxLXK2Lv3OUg94a
	9IVQEJuw==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
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


