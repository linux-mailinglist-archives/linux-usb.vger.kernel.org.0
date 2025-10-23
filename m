Return-Path: <linux-usb+bounces-29546-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7E4BFEFED
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 05:31:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3B89E3524B0
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 03:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E93027453;
	Thu, 23 Oct 2025 03:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="MwLUmf+3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38512285068;
	Thu, 23 Oct 2025 03:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761190249; cv=none; b=lHq1037uL9W21yaM6+276PDQ7rbAF/OOhg+eYOQxT7kwvGFjYwpbv5bTJU62zYDpZfyPKJH2ok/ahImkniCwthgd9fVj18Qbtv76LBj+kXJOSkDCE66bhTugtlao47PXx084Ea6RAETUvWfug8Yy4VK3fHl1/eiYkIkWRlOg5T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761190249; c=relaxed/simple;
	bh=VHSKA2HFsM9+jjFn1th+KI+Eh4o3xbpE+Vm5UfGT46M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=XCb6JHGmjROeopiXYi8zhUowrfYkaAXD2QI3U2ihxlSZeHL7pvrDqYhV6IsxCCOQgvO1Ny+9esxkKEAJHgj/XWYU1N6/0O9EEaR5UfZ9IbUXUHdr5cf9sNWtD9jSrb8LXkFqFR3PvSC3ukfShfHm0DAwYdyUQVK+Ov9hsr5KaxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=MwLUmf+3; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1761190233;
	bh=umNcsJfQXn20u9b8R1M4KUZg1ShG0gK3GbHIbkBThtI=;
	h=From:To:Subject:Date:Message-Id;
	b=MwLUmf+3pzxQlqz4BrDaSHKcO9RAwqTN37VcC0aXAKuCMe0V7SdYi/cFW1sRZDSq5
	 70HRPNkKQximP0blccbtS5DXJYq8ZvMGcJBAILr558//gjN5Jpx4grspWewYzqmniA
	 NYjiPC0RnffTQDDAa2EeF3l/IawPGuG0Fs2lv7ms=
X-QQ-mid: esmtpsz16t1761190231tebd0ea05
X-QQ-Originating-IP: lmB1WZeKvtf5VM4hJL0jYLeppT9A2VeZOLIbFh5pRJk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Oct 2025 11:30:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18264625426006429648
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
Subject: [PATCH v7 2/9] drm/bridge: Implement generic USB Type-C DP HPD bridge
Date: Thu, 23 Oct 2025 11:30:02 +0800
Message-Id: <20251023033009.90-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251023033009.90-1-kernel@airkyi.com>
References: <20251023033009.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NnBlO8MsmACrRff/5IWYDaIQTK4DFXaQ5BnoS49ejtsHa/YxDQozcHtW
	SO63juFZzQNTY+0VDQW80JJ/wYCk3WZV0pLO9DVDvsuNz/H1lRtyjHW949kdIM4Bx99jK2I
	0cnEU7rPenJAGexVSF4tOtwoVo0NNFR/xhRNUoflCEcGf2AjeJUtGaz4zsiTccYbrbTsfv0
	mxl+khhMnER0kSZuqkK9tnQLvB3Uoi1apZ7wLkC/Y9rOBehhYRkT/32veUeM2zOGa6hYUll
	57AvRaGwDOEZ+PypjUZsZQ/rLRyCjXDBJJkfJjijOjELAuasfwCFbf1tfmhKQB0sOpWyrgR
	45ZXwEk53lWEIlxaPf8972lZOwJIUKf8OO3ox/6VOVNaCs2XFWXU9q0TDm6Zs2X+X+ZJ8Yk
	14L/q+Ppu6UTe7mbDGH9knJ/4DOZC48jlvKYaIMvs+JoWxz6oHTemc3869P3VZO+bCrWB7Q
	WGPC2oXdcFrHy9ojI/jhIDHbDUbCzvpWBDgtW+GADRZSaz1+yxH5R3hw8/JuTpypEiydm9i
	Or9role98SeDxq370CtAZ5lqmRLcGWLvTlBWdgJT45X4KnSRaui+y4CUZO1KVTbbbJPYo7W
	pL2pMfzPSr9JtsyvsNADIEXEkzWby9HWfJWrIEZ8SzCDqlzLFyvvWt1/SLkim+LOcvjzmPz
	/GTBg/Bu29z/GEkD+blRdLPg3t3wZW9X+6r9+aeKIU1wVbbwJ1GOun/5HZvzav4MzTbrAPW
	86FjAvndathwdB8K4oX+sTseiSuwJzFmiEqgy02syrNeujp44ARPwZmzlcA8owJpGiomfpf
	3iPEanbf7lDUOctgLDxS/hF1E74AFC5GVyNufw4mwclolyIL6VEU0L1FNGI0Du/QGDHy5Tp
	QN0xETc4FPXz68UbmqJ3MaWk3S7jYhmdSFdUGjL1dQZcTFm69OWOaQskCPo9xWYDiJnpW7H
	FqyTlCQ2V6QetgCgUb8YUym1gZTkdiYrgIQKMF7CquF1PQ1yp/Y9gliKIVKTqN13NroPDId
	x7OlIU/DWl4fSHRJBBBBnlkNMvO5E=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Several USB-C controller drivers have already implemented the DP HPD
bridge function provided by aux-hpd-bridge.c, but there are still
some USB-C controller driver that have not yet implemented it.

This patch implements a generic DP HPD bridge based on aux-hpd-bridge.c,
so that other USB-C controller drivers don't need to implement it again.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/gpu/drm/bridge/Kconfig                | 11 ++++
 drivers/gpu/drm/bridge/Makefile               |  1 +
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  | 51 +++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index b9e0ca85226a..9f31540d3ad8 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -33,6 +33,17 @@ config DRM_AUX_HPD_BRIDGE
 menu "Display Interface Bridges"
 	depends on DRM && DRM_BRIDGE
 
+config DRM_AUX_TYPEC_DP_HPD_BRIDGE
+	tristate "TypeC DP HPD bridge"
+	depends on DRM_BRIDGE && OF && TYPEC
+	select DRM_AUX_HPD_BRIDGE
+	help
+	  Simple USB Type-C DP bridge that terminates the bridge chain and
+	  provides HPD support.
+
+	  If the USB-C controller driver has not implemented this and you need
+	  the DP HPD support, say "Y" or "m" here.
+
 config DRM_CHIPONE_ICN6211
 	tristate "Chipone ICN6211 MIPI-DSI/RGB Converter bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 245e8a27e3fc..e91736829167 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_DRM_AUX_BRIDGE) += aux-bridge.o
 obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += aux-hpd-bridge.o
+obj-$(CONFIG_DRM_AUX_TYPEC_DP_HPD_BRIDGE) += aux-hpd-typec-dp-bridge.o
 obj-$(CONFIG_DRM_CHIPONE_ICN6211) += chipone-icn6211.o
 obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
diff --git a/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
new file mode 100644
index 000000000000..2235b7438fe9
--- /dev/null
+++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0+
+#include <linux/of.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_notify.h>
+
+#include <drm/bridge/aux-bridge.h>
+
+static int drm_typec_bus_event(struct notifier_block *nb,
+			       unsigned long action, void *data)
+{
+	struct typec_altmode *alt = (struct typec_altmode *)data;
+
+	if (action != TYPEC_ALTMODE_REGISTERED)
+		goto done;
+
+	if (alt->svid != USB_TYPEC_DP_SID)
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
+	typec_unregister_notify(&drm_typec_event_nb);
+}
+
+static int __init drm_aux_hpd_typec_dp_bridge_module_init(void)
+{
+	typec_register_notify(&drm_typec_event_nb);
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
2.49.0


