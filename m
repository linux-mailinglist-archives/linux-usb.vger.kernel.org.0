Return-Path: <linux-usb+bounces-30759-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C25F4C71D36
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 03:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 436714E3A42
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 02:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29BC2DCF69;
	Thu, 20 Nov 2025 02:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="Hp0aa4k/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E972D949F;
	Thu, 20 Nov 2025 02:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763605461; cv=none; b=JdPphctilPKE7FNubZYJC9w/8VSF9Bmr32FHQ3WpOm+/v29CdKrUbmOXXJIfBvrbBOAqhuqJZ7aiLGsv2LY6l38SzYYM/fa85WFOUFCQazzLMvLa84fkpOKKNFp17G7O49WB+AyuuoI2AZNKI7f6iECiH6uIuIC7qCc1+/9/ggU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763605461; c=relaxed/simple;
	bh=vsDLDpzUdRvKLfqh5r53F2pJg80bDLMY9OUZw5pQizo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=KaNZu0i6gEuq+JtPGSdWkUan6y+jXF0aaN7GTfW8dfO7yEM3em3bwmySoiKennbNiZOspOh7HEPzJTqTrwVzbNbPGNQhIGXlhg7dil7/xkFkUSEbGDEvF6XrfeXCuh44a9qu8DVhY5QD6l+ssbDp0eR3/vDbegzHmQ6CEblGyew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=Hp0aa4k/; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1763605450;
	bh=1Rmi+Q4GF/407K6ZniEsrCCllkX24Iw13eXk+RLRPJY=;
	h=From:To:Subject:Date:Message-Id;
	b=Hp0aa4k/br6PbjS95vPQnZpgPyRggBKKdqEtBEhc4r2Bb9Wwr2BXumq+u3ofjnNmM
	 TeN/5fXWEYbtlsniyLesB+dZv0EsHFXsxLcJM+rS7EHlbgn9Wkii9MQBhgL1zdtaqH
	 pyWAugequtHLiJ9N7nIzxPJ94Ysqk6KgVwQxnsR8=
X-QQ-mid: zesmtpsz5t1763605449te09995bd
X-QQ-Originating-IP: SlP6sV3u7ks5xAuCRdbslt/D/tIaAhTCdFu9YZVAHsA=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 20 Nov 2025 10:24:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14872000006937239510
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
Subject: [PATCH v10 04/11] drm/bridge: aux: Add drm_aux_bridge_register_from_node()
Date: Thu, 20 Nov 2025 10:23:36 +0800
Message-Id: <20251120022343.250-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251120022343.250-1-kernel@airkyi.com>
References: <20251120022343.250-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Mmvzdtxf/rngUnDKibpYxs1ajCmCS4W9up5e5k67xYJ3fkI5d7aJP+RX
	aQwk0fwXb5t6WHhaBd2CcgFtLvcTmHqTIrdh3NSi0zYTXGasrFpcuzozan3dyPFhTobGQhS
	0y5P1aAtOEnV6LXUl5joY493IgumAzdWCxtxYhOfuj9OoX6g6dWmU5EiSuYhmLGMcfDOWVX
	O6FWlRCW0NUx0dQqoRxohAjknGvyRAnFvJ4XD46C/J9KFLVO7gmj9O0S0gzLvAkMtj/b9R4
	NhelZCp4D4pP2zFPsWplqFwTyWFDot/EPHbz9S4kq76PpQB23MBGHotGnPt4gRvPECmf/9A
	hastU7c4QgluD5BTjzDt078CDjrFR217s/ET2pYuHoBAjWcbEDsaLNwZWZt0QUBU7HV9T+Q
	PTwn/zHhaYtzdAQzZ347Jy7YUmxAlG6t8aZ45G94qfMIsZZDqN2W3j5Oa6fOWODF+T5M39h
	c88hlKoew9OViX99Psn7dZdXtPlhy+tMVRYuVVZm223Zbce/t4gbuZbBZ/HOeSyEciYkq6l
	ylOPzNJTF05/8+g1Bo47MsajYWopqrl63ED02fCob9vVCSzeIK4AtKaRFBNhQytc5W4J6KD
	F1Vo0UlNo/g12of5tqfZhIim8fI5QR81/lazdjZdNyEQw/KQskrhDiDMoS/anjn9uCcQZz6
	EP12BIUfMott3iIdF3yZxT42wZ+zOzLwl+8Pm+bAPv/3oW18jQ1oqb33y4tqLXSG29XxBMB
	cceZOzE2hq/VjPwb2wGGoQ+1ZNqWi9HcEyy6+G3gMKygaY9mutaeafgnLsInEBnjvtfafb1
	ebSUGsULNBim7Y+N7tbv9vUgehBeBJvecW0KL5s6eCuGytrpKwThu0FLvUsK6lQII9m2SzM
	G3rDiuDdVQh5BwWw5+/8oHumL+92aDb1Bcb33L8hPJojPg+LcA8H6Axhj636QZoVn54034c
	ckOGnhd0X8ORtPMvzM/RMkG8Dca2kU2vu3mbM/57cePxrJqk+EviKtthpJoTUvUO2ZcnKNZ
	bYBOCgh3oJfgGnc84A
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
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


