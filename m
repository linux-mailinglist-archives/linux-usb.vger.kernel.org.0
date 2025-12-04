Return-Path: <linux-usb+bounces-31144-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E33BCA2855
	for <lists+linux-usb@lfdr.de>; Thu, 04 Dec 2025 07:31:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DAD0A300D70E
	for <lists+linux-usb@lfdr.de>; Thu,  4 Dec 2025 06:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5395C28642B;
	Thu,  4 Dec 2025 06:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="vpUePcV2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0164221773D;
	Thu,  4 Dec 2025 06:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764829906; cv=none; b=Uq/EX5zbbK7B4gZIuXacM57C0L9SeeP97F/MG2Q2tR+unOCDHgUxxR0fnBz5oBtlCtUnibti2lfTEvSmc2rPeRXcYEAm+Mafc/BA2Vz07oMOAMSDvmmIrc0CF32i8YNx2Ff0bO2NXcwfk8mbjbUIRVTyQ5gAmNmtT93mYxPH5FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764829906; c=relaxed/simple;
	bh=bJg08T33NGWV20SXfgd6+3sela7JX2j++2Y0e5Nh5IA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Hf3qf0lI1M0w7O4B/yr+7HW+/AJkRGhIyva2gznxhWeGF+9dT/crEpdPLcuoR4I5OQNye+4EclubBBSdpJ8dTy+8Mnpy0laCpraekjRkwBuE9YdH7JTSsCWEcK2IN0VRtjTro0HjE6g7wLqf04e8rQfC4ou7xw+guZcMSzkylrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=vpUePcV2; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764829894;
	bh=tnGvdgabwSIu+i1OtiOksigRJkfBAJHpGnwVCXS2P5o=;
	h=From:To:Subject:Date:Message-Id;
	b=vpUePcV2HEPtG/ff24vhoNL1F2urWJ3eN3FOyvRz3QstpqP/4LZmE+/pCloOEdXoq
	 i7Cd2RqQ9PjHOoooy44ox9g7Gvsv2/J1SzGBF4a9kjj6oHvZ6eq61SLq2USHJ8nIef
	 b2QiR3hLAAtTB67E0wcnnBfd8E9mIFOeq/3K9r5E=
X-QQ-mid: esmtpsz21t1764829893t62e7fee3
X-QQ-Originating-IP: 4q1w9+bgCS0LGdPqbRhxoDeHWokBVZZFuy5QX+5KrZI=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 04 Dec 2025 14:31:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9830896031001290684
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
Subject: [RESEND PATCH v11 03/11] drm/bridge: Implement generic USB Type-C DP HPD bridge
Date: Thu,  4 Dec 2025 14:31:01 +0800
Message-Id: <20251204063109.104-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251204063109.104-1-kernel@airkyi.com>
References: <20251204063109.104-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OCzxluqIaPHWaE3FMcAg8ojbsDmsMtBFoQudEX3P7mvMCeV8G7JBLpTa
	hGYydDbw9jkuKual2t8lXq9Gf8d3VUG+FSUNgxeoBTJGVncxKurmQ82M7FNnDQHmWv31/YO
	GgdxSuqf95lkGdT3sbhBfNWXm0ESIF1JTEMP18Lv/H2anX5r7yQUuavyDLHy4wS12zENdkq
	cewnBYwd1+VhgEAtzwVYcH+p7MyaCnHaybi/yGQX//RsutU4R6ETMC2E3hTNIdz4IJ6D1dx
	0+2QJWWzydR/8dI7zaCb/swF0s/D7ZySvw5sZj06wAXJcAHFzXFzvnQJK1uZKiB8TxL0P09
	W4cOb1fSKXr3AcWW1Bi6hbUgCHo5tBiy6sQ1FysSXY2y2WqrxrnrqponnSG5qnQFc1NTzgv
	Y1U6DWrFHOJIwZvT4rBokj56N2Ek5uYEC5Y345HceUbqttqM3HIM3q2eV8JGYvCfr7kIvjG
	/3HBd+Pv7+mYmDT6x31l9Yh/DIXNPynxhoNYLL/ydrzvit00hIdWK+wxlqKYskx1iaB6cIj
	LqCP/C9Wu9gGxIxpc/D++aJcDpaIy2l1uHra9nRcEn1PfclQSvoM6/vknVMUkuVd4qejfQ8
	7XU26BzNh9QqUnzsFiM+ZwbRu1WhM5N1C6HAD878ZVu+XExXaj0ZWzLHQSdRpCPElwsnusr
	5Ucn4uBln8ByvV+E4+IHDPeOmuFdkll2zK5+UMEbMAc7ixrAlrfSY+HsJA1n8fLpK2TEVrE
	HHWUDMDoIaeuAEGWgI3hvxn5e4n7+vd291osY/cOYM0ne2klID28J0Bt85nCi1PPCpFSjEk
	FlVaoQa9SkZpJCldxKG2//8XHpFbB0hPucmI7BheObRp0tccbd5md9OGnJUYpDeO4Lut6wi
	KRlDgmWA/pZIfaW856R88eBiZa/glVIJADQBJHYZCFgkDPnjU4HPNdLctHEnd8xXi3YcPZl
	O/DquZ4junyyan98LuWv4kMpYg/U34+6Mg15sBlvvA01D9jnnU1/6IBSMBXMfBwSJpbPEkn
	uN0A8L85AO5+ItuxYSxubFoMmvx68=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The HPD function of Type-C DP is implemented through
drm_connector_oob_hotplug_event(). For embedded DP, it is required
that the DRM connector fwnode corresponds to the Type-C port fwnode.

To describe the relationship between the DP controller and the Type-C
port device, we usually using drm_bridge to build a bridge chain.

Now several USB-C controller drivers have already implemented the DP
HPD bridge function provided by aux-hpd-bridge.c, it will build a DP
HPD bridge on USB-C connector port device.

But this requires the USB-C controller driver to manually register the
HPD bridge. If the driver does not implement this feature, the bridge
will not be create.

So this patch implements a generic DP HPD bridge based on
aux-hpd-bridge.c. It will monitor Type-C bus events, and when a
Type-C port device containing the DP svid is registered, it will
create an HPD bridge for it without the need for the USB-C controller
driver to implement it.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v11:
- Switch to using typec bus notifiers.

(no changes since v10)

Changes in v9:
- Remove the exposed DRM_AUX_HPD_BRIDGE option, and select
DRM_AUX_HPD_TYPEC_BRIDGE when it is available.
- Add more commit comment about problem background.

Changes in v8:
- Merge generic DP HPD bridge into one module.

 drivers/gpu/drm/bridge/Kconfig                | 10 ++++
 drivers/gpu/drm/bridge/Makefile               |  1 +
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  | 51 +++++++++++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index a250afd8d662..559487aa09a9 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -30,6 +30,16 @@ config DRM_AUX_HPD_BRIDGE
 	  Simple bridge that terminates the bridge chain and provides HPD
 	  support.
 
+if DRM_AUX_HPD_BRIDGE
+config DRM_AUX_HPD_TYPEC_BRIDGE
+	tristate
+	depends on TYPEC || !TYPEC
+	default TYPEC
+	help
+	  Simple bridge that terminates the bridge chain and provides HPD
+	  support. It build bridge on each USB-C connector device node.
+endif
+
 menu "Display Interface Bridges"
 	depends on DRM && DRM_BRIDGE
 
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index c7dc03182e59..a3a0393d2e72 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_DRM_AUX_BRIDGE) += aux-bridge.o
 obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += aux-hpd-bridge.o
+obj-$(CONFIG_DRM_AUX_HPD_TYPEC_BRIDGE) += aux-hpd-typec-dp-bridge.o
 obj-$(CONFIG_DRM_CHIPONE_ICN6211) += chipone-icn6211.o
 obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
diff --git a/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
new file mode 100644
index 000000000000..94be3d5f69e9
--- /dev/null
+++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0+
+#include <linux/of.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
+
+#include <drm/bridge/aux-bridge.h>
+
+static int drm_typec_bus_event(struct notifier_block *nb,
+			       unsigned long action, void *data)
+{
+	struct device *dev = (struct device *)data;
+	struct typec_altmode *alt = to_typec_altmode(dev);
+
+	if (action != BUS_NOTIFY_ADD_DEVICE)
+		goto done;
+
+	if (is_typec_partner_altmode(&alt->dev) || alt->svid != USB_TYPEC_DP_SID)
+		goto done;
+
+	/*
+	 * alt->dev.parent->parent : USB-C controller device
+	 * alt->dev.parent         : USB-C connector device
+	 */
+	drm_dp_hpd_bridge_register(alt->dev.parent->parent,
+				   to_of_node(alt->dev.parent->fwnode));
+
+done:
+	return NOTIFY_OK;
+}
+
+static struct notifier_block drm_typec_event_nb = {
+	.notifier_call = drm_typec_bus_event,
+};
+
+static void drm_aux_hpd_typec_dp_bridge_module_exit(void)
+{
+	bus_unregister_notifier(&typec_bus, &drm_typec_event_nb);
+}
+
+static int __init drm_aux_hpd_typec_dp_bridge_module_init(void)
+{
+	bus_register_notifier(&typec_bus, &drm_typec_event_nb);
+
+	return 0;
+}
+
+module_init(drm_aux_hpd_typec_dp_bridge_module_init);
+module_exit(drm_aux_hpd_typec_dp_bridge_module_exit);
+
+MODULE_DESCRIPTION("DRM TYPEC DP HPD BRIDGE");
+MODULE_LICENSE("GPL");
-- 
2.51.1


