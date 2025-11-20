Return-Path: <linux-usb+bounces-30760-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 07548C71D42
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 03:25:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0B32E348BDC
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 02:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10BFA2DFF04;
	Thu, 20 Nov 2025 02:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="KGrp+SJI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857922D97A1;
	Thu, 20 Nov 2025 02:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763605462; cv=none; b=uoRw2hxkXMwrWN35XmgWQvi7ZG3uHRJQ+sIXQIppbXJqoBJ7FzPCAkFABNqXE2mS3irVZt3NjYT3ryZY3GKyQs2AzZv2uMbXRL9+HRlzyCKnwCd4FXrVP3Jhc1FASl+DwVy8QeQYSuKF9lL4J20fvOJr+st8F8i2ldclKOf8qaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763605462; c=relaxed/simple;
	bh=w4wTrcR9PdM/fwgDqYtYC2AR8/Tuu4WqkLc2PahVwYM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=e6zlMGb2Q6OTU3scgLOaOz1yWa0AuEZoSzDr1ip6ZCZ/yHrYndxsn8HYjAa2xwT9ZGM0dJ1W8wkeED9JAiIEEys0SXdFS6DeRLwF/iLHi3LzwZJF68pSUL4SWSoa30hb9h+kQScabq7cakthJn/6vOCma1RovBuEx10/R1T7WM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=KGrp+SJI; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1763605446;
	bh=6190OwFbT9PTsW3kKLd3ukON7IhuHFcLiMCVWlPFG/w=;
	h=From:To:Subject:Date:Message-Id;
	b=KGrp+SJIX/GgOlZrN8zuK0TbkgZR00QZtBgblFcsBobHlvzL0TPTZwvpTDxriu2NS
	 8SkuRkd56JWYl5deN92jlH9ihbr5zpTXOP4I7w6DAQZvp+3Im8qLRXmPVkDh3gQEPy
	 Vl4gx+8lKPRMRlOR+D5bFhj1zVjCTSndXltlhGCU=
X-QQ-mid: zesmtpsz5t1763605445t5e65da5a
X-QQ-Originating-IP: yMXVAgeYNGkbnDLlHmM3QvLOvK3cAkWMNfw32dJmod4=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 20 Nov 2025 10:24:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11576405309476374289
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
Subject: [PATCH v10 03/11] drm/bridge: Implement generic USB Type-C DP HPD bridge
Date: Thu, 20 Nov 2025 10:23:35 +0800
Message-Id: <20251120022343.250-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251120022343.250-1-kernel@airkyi.com>
References: <20251120022343.250-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M+eyQDNJUfG3XFyaHo9S/Bx1EZAd/b3cfc5vSrVm9q8eCzLP+9A2RJB+
	NGhM4lpqYMQfoDjJzcy6COmNA/AsQafet0tmxxX/ZrTbXP6EsFukNRRrd6R4tjeCUzhzUxs
	+o26USEwYnCnsIur0kNJAgw1tb3D1WZYpD5Kt26GlonEnN9l/DyVBHWlwEPAvOBTUmKXvM7
	eVXHo5P7IM3B52AhANWSk+7IGSwYJzfl2xqbdTSwtyun1DdMWIRn0Gh18B4ahwzrmhWQOLp
	JecJ4Z1WuC26CX5I6a7LbYKLRvoS1kFfyxC3oSLtY7aO0rcUbS1GD6qQgJkXxaTJq3p5m8L
	64imKm5tWZSOO/LKFbbfZ3leZX0/K0vUS6aXzFei7Cdh1tnyzjIaevbdUMqN5uUGEJheTjQ
	pFZm9BlGvJP7UgUyChZLiATAItzjHlNUwt4EsL69Gb5qsiAaASobPrqN7yQWj1bDhHQ+qOn
	AtDoxopQz0s18TxxJADIJAmXWf+ioJJxxKv9FVCFWn1LwH919X3q6P8OtI+aoUYfvRytZmJ
	plzxAHU4iDaeAKvxm3Ws/JDW8h2VNlOiZ9IEvv1C6ZmygvGpoJLkRZFg/LIcjkLovVeFNaH
	YIrsWN6WgDKmT1CZ1p3NFqzOKru8qvqdj2SxCqWVJ+JBoDA2J5SjxRsnI+kDySZIgDU9Zxb
	l1JVmvCXzN3nnYMMEue41lUmMfSjNe0FYEp1xbllimecmOOMkS5rH/Wyuo/Q8hntbfBS+K+
	KnMdwIfco0XkHVO1mY8eWQ7gmjWricoQquIJ8QLgQwZwlv69n6CCGghoBbKW46JEXG3sdKE
	HWWzxNp8AJE0pJuJ3CD2BISDRNcgSkj/CDxzNsycQyEb1D+s5/lfQcOOJEfLd/XSisLw4eD
	HciMxojztNXnjAik9M6fCwTU4heLWaxTHQx+Mw+yrdo/9cgMZkAU71saL956y6ipXScl8jX
	yvE2HHSzZFwRs9i3K8biV/U4UFWDuTmRqsqGazPHeAo5gc6s9gs1LD2/o2TQvFp48EwXTRe
	9rTCrBoaBvGif/sQvdoC0UG6T85LI0S7ixig2EeGmPkUj8m1DOkkceTFCCuYJS+QXJZ5Dz5
	qqg77vR72yX
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
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

(no changes since v10)

Changes in v9:
- Remove the exposed DRM_AUX_HPD_BRIDGE option, and select
DRM_AUX_HPD_TYPEC_BRIDGE when it is available.
- Add more commit comment about problem background.

Changes in v8:
- Merge generic DP HPD bridge into one module.

 drivers/gpu/drm/bridge/Kconfig                | 10 ++++
 drivers/gpu/drm/bridge/Makefile               |  1 +
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  | 50 +++++++++++++++++++
 3 files changed, 61 insertions(+)
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
index 000000000000..9cb6a0cb0f0a
--- /dev/null
+++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
@@ -0,0 +1,50 @@
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
+	struct typec_altmode *alt = (struct typec_altmode *)data;
+
+	if (action != TYPEC_ALTMODE_REGISTERED)
+		goto done;
+
+	if (is_typec_partner(&alt->dev) || alt->svid != USB_TYPEC_DP_SID)
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
+	typec_altmode_unregister_notify(&drm_typec_event_nb);
+}
+
+static int __init drm_aux_hpd_typec_dp_bridge_module_init(void)
+{
+	typec_altmode_register_notify(&drm_typec_event_nb);
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


