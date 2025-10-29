Return-Path: <linux-usb+bounces-29825-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A10C189ED
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 08:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AAE0400624
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 07:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D55430DEC6;
	Wed, 29 Oct 2025 07:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="bah4llcF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E161225413;
	Wed, 29 Oct 2025 07:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761722113; cv=none; b=K8QZSNDm4hM8aQkBKulY4Rram5pcwijWF1NdxlQVV9hyCYCg6Dbn67poFGZu5rjj4gTym31FdW85a1MGqJg4oV6r/OTC/cjjq+4gFXrEpiHm6ZRxaoIf5xuo0GZeAA1f65lbH9VTw69Kcb6x93s1KIW3M5BEv/PnWNzg40Kxsvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761722113; c=relaxed/simple;
	bh=4CCYR8EmTCLjnjMKWXRVpb3kDaoWjn7pZFM/jfqBMF0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=bLRDPZ7rrP31hp0FcTsOUAzOAPOS29lHCUCiUUavycfox2qrbnozExU0b7apdpZBQRxnK30y6m9outwXiGt+bsTObqR2xFr75F9C6zPSGoqtPWQ0kqjethbuWP+Egtj10gCovxhmgIPedj9lHMRbk/MmQl0XHO8g0GWseKKRy1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=bah4llcF; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1761722100;
	bh=FJMoyZ1t1YeDBw7c8GChVfEptGd+0NATOX776m3g0j4=;
	h=From:To:Subject:Date:Message-Id;
	b=bah4llcFChlSUUdXP/Ga2H/8AFlP6q1YJ3wDUepsnm1Uqph/rHidCXayzZOChBpiw
	 +/FjN8eCFFRugFU2QoxK/221FV9kd2pwW91/Vup3NvWPLfE/DXlz6goGwds8+Y62zg
	 ezrDZ6qB3NfBBkRb7WFm8t7VLsLuNDg8c9bCBzNQ=
X-QQ-mid: zesmtpsz6t1761722098t70ec4185
X-QQ-Originating-IP: nrXTS2MjCDfq0/Rdag/r96GHT70yO64qGAp8vt7JiO8=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Oct 2025 15:14:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 238686505024682894
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
Subject: [PATCH v8 03/10] drm/bridge: Implement generic USB Type-C DP HPD bridge
Date: Wed, 29 Oct 2025 15:14:28 +0800
Message-Id: <20251029071435.88-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251029071435.88-1-kernel@airkyi.com>
References: <20251029071435.88-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MP6adJLF6rB8BWB4wABoWFxHttfUP4mQ7Gpz7X18eb9z7nSh8zRzW+OS
	XvRCJ9uaQRYRpRrYw6N6GrKRWsJKsh3VnC1CL8Q/sOcS9jmCEjg0EQv/4ssMwLuHu50X1da
	MQTMeJwGmDRsL7flc4TPbrlZfEgiWAHvf6197imuRbV4hM3UYGFnzBHERIXGZwyJzBgvZ/w
	MUcGcxotvH0DBB9KY44pqG6ryhDKCY1O6i4KE2uPzY5HpyZWeXDA/4Vvsr5PNcYUa0IAB3E
	YJHYXqQbO1iYLCKOXp1gaX+L2AA/PN7aZNO4J771GfKQSWZ9S5noddqipqfQquzNrdd+4E9
	MhQ2sNFyNaBRpn8XdW01LlYwzMbv8yj37PnTzATUnytlvkhi+JzYYTkdH5detlAaC5U4mRl
	BjSZ3q2OuPaUALrurfUxqPPuuQkeudgfPPx1hXZ/vrtP++sUsGqsPdrilV00ME8+WxXkEvd
	CXntq9PTZF8vm1Ql/yvx/CaYjXEHZW94JKFHcua7I62lHj3kAu6ARIpbSXTQTrPpm6v1cST
	VmlRFpG9ROAPe/DXjhGTdfnOyttclWfo5CaMwZTdYvurOoMJJbFKpk8Toez7pC+NtG5YOd1
	3prg1pk4X1utg9Q7jJd1Tus19iIH2qVK2OXIg3MLvKA2MTHLcvnjwgNLgx+G8Vk/336ec1d
	unZeWYSA69rnbC+75jqhClTdeHk6SaGotrL8diacqgI4tqJ5Ofv4eYoO4u5Tfra5bJPXji5
	cSOC58rFXKbQu5tvRMUXwmoIlM3QW7yIo0oSIfLEPj/YGjUcvjZnwLPu0mQUsWZyHRIAJTx
	Kdgo9csK0qOZeTpPHVRqflMOMeN1de9xrhlhS7Fk6KQvPWx2M3OODHksNd8yoO4w1qIPJPZ
	Mo/qAC7QmxJP/rqtxeURKbwEigynOy2M5ZtBlYIyQ2JLOVKp/ap9sZ5jdNEatJNslXfkRxk
	0R7vY4CR2tKGVYZrwJL8VxUOVr/SfgkFrUtspazDI8m5sARO4DrPUrj0Q7wv18xgSZrJTF9
	VrgVPYDylcBgxxwmaGO+UIDjWYWTeYoelWUJp3RQ==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
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

Changes in v8:
- Merge generic DP HPD bridge into one module.

 drivers/gpu/drm/bridge/Kconfig                |  5 +-
 drivers/gpu/drm/bridge/Makefile               |  8 +++-
 drivers/gpu/drm/bridge/aux-hpd-bridge.c       | 23 ++++++++-
 drivers/gpu/drm/bridge/aux-hpd-bridge.h       | 13 +++++
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  | 47 +++++++++++++++++++
 5 files changed, 93 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-bridge.h
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index a250afd8d662..17257b223a28 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -23,13 +23,16 @@ config DRM_AUX_BRIDGE
 	  build bridges chain.
 
 config DRM_AUX_HPD_BRIDGE
-	tristate
+	tristate "AUX HPD bridge support"
 	depends on DRM_BRIDGE && OF
 	select AUXILIARY_BUS
 	help
 	  Simple bridge that terminates the bridge chain and provides HPD
 	  support.
 
+	  Specifically, if you want a default Type-C DisplayPort HPD bridge for
+	  each port of the Type-C controller, say Y here.
+
 menu "Display Interface Bridges"
 	depends on DRM && DRM_BRIDGE
 
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index c7dc03182e59..2998937444bc 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -1,6 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_DRM_AUX_BRIDGE) += aux-bridge.o
-obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += aux-hpd-bridge.o
+
+hpd-bridge-y := aux-hpd-bridge.o
+ifneq ($(CONFIG_TYPEC),)
+hpd-bridge-y += aux-hpd-typec-dp-bridge.o
+endif
+obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += hpd-bridge.o
+
 obj-$(CONFIG_DRM_CHIPONE_ICN6211) += chipone-icn6211.o
 obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index 2e9c702c7087..11ad6dc776c7 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -12,6 +12,8 @@
 #include <drm/drm_bridge.h>
 #include <drm/bridge/aux-bridge.h>
 
+#include "aux-hpd-bridge.h"
+
 static DEFINE_IDA(drm_aux_hpd_bridge_ida);
 
 struct drm_aux_hpd_bridge_data {
@@ -204,7 +206,26 @@ static struct auxiliary_driver drm_aux_hpd_bridge_drv = {
 	.id_table = drm_aux_hpd_bridge_table,
 	.probe = drm_aux_hpd_bridge_probe,
 };
-module_auxiliary_driver(drm_aux_hpd_bridge_drv);
+
+static int drm_aux_hpd_bridge_mod_init(void)
+{
+	int ret;
+
+	ret = auxiliary_driver_register(&drm_aux_hpd_bridge_drv);
+	if (ret)
+		return ret;
+
+	return drm_aux_hpd_typec_dp_bridge_init();
+}
+
+static void drm_aux_hpd_bridge_mod_exit(void)
+{
+	drm_aux_hpd_typec_dp_bridge_exit();
+	auxiliary_driver_unregister(&drm_aux_hpd_bridge_drv);
+}
+
+module_init(drm_aux_hpd_bridge_mod_init);
+module_exit(drm_aux_hpd_bridge_mod_exit);
 
 MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
 MODULE_DESCRIPTION("DRM HPD bridge");
diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.h b/drivers/gpu/drm/bridge/aux-hpd-bridge.h
new file mode 100644
index 000000000000..69364731c2f1
--- /dev/null
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef AUX_HPD_BRIDGE_H
+#define AUX_HPD_BRIDGE_H
+
+#if IS_REACHABLE(CONFIG_TYPEC)
+int drm_aux_hpd_typec_dp_bridge_init(void);
+void drm_aux_hpd_typec_dp_bridge_exit(void);
+#else
+static inline int drm_aux_hpd_typec_dp_bridge_init(void) { return 0; }
+static inline void drm_aux_hpd_typec_dp_bridge_exit(void) { }
+#endif /* IS_REACHABLE(CONFIG_TYPEC) */
+
+#endif /* AUX_HPD_BRIDGE_H */
diff --git a/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
new file mode 100644
index 000000000000..6f2a1fca0fc5
--- /dev/null
+++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0+
+#include <linux/of.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_notify.h>
+
+#include <drm/bridge/aux-bridge.h>
+
+#include "aux-hpd-bridge.h"
+
+#if IS_REACHABLE(CONFIG_TYPEC)
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
+int drm_aux_hpd_typec_dp_bridge_init(void)
+{
+	return typec_altmode_register_notify(&drm_typec_event_nb);
+}
+
+void drm_aux_hpd_typec_dp_bridge_exit(void)
+{
+	typec_altmode_unregister_notify(&drm_typec_event_nb);
+}
+#endif
-- 
2.49.0


