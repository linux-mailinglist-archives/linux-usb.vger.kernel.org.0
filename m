Return-Path: <linux-usb+bounces-31253-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7691ECABC00
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 02:55:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C38883000B42
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 01:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE26D23F413;
	Mon,  8 Dec 2025 01:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="an/MTlNQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845DB1D5147;
	Mon,  8 Dec 2025 01:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765158945; cv=none; b=r+aMK9tKY5iHxVq7UzMrmd2TaPQU89agyFjokWTF93oFwmY9NDlqLpR5GENMyZiSoBbrwLiHo7daf+3V0e3aeqwhwuBxF7+YTIJjRWDMmjiQI4UnpGHhrom3DsXIFnAWTjVc7RgMS3Dv0SC47rR4JBhzVtXwQzuUBr8NvHDLmLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765158945; c=relaxed/simple;
	bh=oZxAKY069oSsoQIE/uXBSrlabu075v/j9Xbnbn4CQOw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=t00fHYoKAh9kr/nBRvEB70PvGIrOZL+ifBGXDNtmwqxFQgtoCzGAGQrMY3xqOTVsayNFmyi36pwPdFauIhQhB6av+T9hPU6DpXfRUDQ5unEHVC+e7/41ime1vOkjhPt9bByhlvKKJYIiwGi+Bvfe7C9c9CxIqPCbAbwnrGb5H7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=an/MTlNQ; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1765158925;
	bh=/ITohFNSR7lZRzb2jcZzCyseW4V9moYl6cPe0u/7eVQ=;
	h=From:To:Subject:Date:Message-Id;
	b=an/MTlNQtQs7hnsabvNn2iZxYiEQSpdGeYMNqu8huMHYHX4iHibOvJDfwLCAiOiks
	 5yeUAptyhV7OkXa6AHwI+cS4pMNDGyHYN7LDr4dmt1bOo0JsHdc8OmxoasnMXlw1Om
	 Q5pa0u0TND1y/WrPFkrHwMIOEvI0Z+s3UVPYYGA4=
X-QQ-mid: esmtpsz19t1765158924t760755d5
X-QQ-Originating-IP: 3roZbY8eqQltdEXFqjutnrbNDJ5RRJ4S3DkEoxdunYw=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Dec 2025 09:55:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10138295490961143045
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
Subject: [PATCH v13 03/11] drm/bridge: Implement generic USB Type-C DP HPD bridge
Date: Mon,  8 Dec 2025 09:54:52 +0800
Message-Id: <20251208015500.94-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251208015500.94-1-kernel@airkyi.com>
References: <20251208015500.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N4WhQbLQyIqSeMUvU2ikqO791RQnK4HKCJbvtZL2wTXWNNHCbSD1lMp5
	txuz6BJFxYzn94HxTd+zuGPGDgtVBNRqGvdDhTi0IA/rIKmqJ1dS61GUmCnIuru0Wc5JGhv
	qZakWYH+V9AhmhD2R7xtM8fcA9bFP/eRPFcb45rOS3e35Yg4/k7cae/Jgu4zfeHSuvwwuSf
	fTEhFWYBkk+x7E9nr8NhrTR0iL/ZFRZSS+60QLz0HK8WL+HRyRMbDPDJ+PGzKMRKep5Ju7A
	lRazjpSSIzVK+BRBGH1CRck+w0xLZA4JTXCUTHw887EGGQz1qmSGEYGnwceJFcjAEad1Gi3
	7y36dPOI1s0cicwcpwciVcex0mMUbmyJCLRQXsgNKfWkqO3GHccPx1BuGixzRTiMcWFIEuT
	iqe9eT4/lPNzjCxECoko2M4KLo/+YeoC0eWweZ+XsAU2wYnQrwdGMmm+Y/1SgXvTYOC0D48
	QTDRXYLVN9fY9UNgUbD/LyDjwLBFH+2dHUD5GE/tTcJl+ld//5yTmE8UGfo/uOImaxWg4hG
	+OiGsxMai4NL6d0GGj+RlIJINM/xCSDzjUfGNjotw93KWHePShd6rjCL1WwPDwNo1vlNEjg
	6NT+snu5e1SNO3965z1UcFADvSNZF7LMrfoRh62RSnVxB1LsQmeurpK3tMKr0sZD5ViDd5u
	syqxbqlryK4h5m0JDcw078IZtoqiVwbH32wfk+tvuuc2l+kOC/Wm62QycFmsy7Eda6eTwDE
	6P/WKUFsfNBbUoKm9sn/Fx3lQvFTNCBkocnE08a4nrG32Er4sfg8MvifHRel+wJae2qbp+Z
	ZHySk8TF+miJHUJB3ny66DECVfw+rwQcpcUJ3YTKf/9SUpXdyV9RARs2HqhoJy3kr63eM0Z
	5yPAdEGs2MsmvBtuVtINKUCG0hOFCIkZrhW1BrNLG7U/aI9fHrAQLNLBlu1uDdtQ+D4V9Tv
	TMTfMMVCeVaGFgH/01BP85+n4vmUtQ4XzPBxCH2iWv+8YmWjA5mAxMmiheGpWc1QVZGuKHY
	TAa6Ayjg==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
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
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---

Changes in v13:
- Only register drm dp hpd bridge for typec port altmode device.

(no changes since v12)

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
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  | 49 +++++++++++++++++++
 3 files changed, 60 insertions(+)
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
index 000000000000..d915e0fb0668
--- /dev/null
+++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
@@ -0,0 +1,49 @@
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
+	/*
+	 * alt->dev.parent->parent : USB-C controller device
+	 * alt->dev.parent         : USB-C connector device
+	 */
+	if (is_typec_port_altmode(&alt->dev) && alt->svid == USB_TYPEC_DP_SID)
+		drm_dp_hpd_bridge_register(alt->dev.parent->parent,
+					   to_of_node(alt->dev.parent->fwnode));
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


