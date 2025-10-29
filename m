Return-Path: <linux-usb+bounces-29827-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B40C18A02
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 08:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58CA7400EFA
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 07:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C407830F929;
	Wed, 29 Oct 2025 07:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="Gr8HAweY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1852D2494;
	Wed, 29 Oct 2025 07:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761722122; cv=none; b=fIkD0RqsVc3hJAdUXBBGDOqajEp5iKy6puwMq9UHDJPP0L1yJrol7cN7VXg1CA8VTZzrNOeT25dMJDmTAms8JDb4glCFKPvBlUn9FvVg65zk6k7Hl+9n7bMeX4yU2SQX/62pHtrst0aUxdi6J0Mc4Fp23lcYOXVyJ018k2MwENY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761722122; c=relaxed/simple;
	bh=HysgThJSB58INGyifNQGXbmX0lFauL5Bf5bQD741kwA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=XLEZao4KubU1W3rEQhk2G8nbsX0n5EcBc6JU0wEkfIkhLRCbt/3+VTuAL8Ztq9ledn8dclwh5+yIJJqfIXHae9nu0HSw/a83afMRvCEEbXJGCE4o7hl9BoUhCAjS0k04yVnLU8gSZL3gV2v2+VYNKIRsZJSs0OqiwQFDQBs2+Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=Gr8HAweY; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1761722114;
	bh=AFQcoHE/dlPx/r75ImuKZ7C8fGQ0d+TgBuYEF1fP98Q=;
	h=From:To:Subject:Date:Message-Id;
	b=Gr8HAweYSh+7YYl+B/CP+gHINHBZ5w7tjx2VK81UgqhPmkjsmmsNBUUwgdeOU34eg
	 J10lNUyPlCbarh2EL9dsz4dKAYrTT5JIbeXTP80CkjqwdKhV37YCcYPcdReMRt0sB4
	 0cJTQRF1K2/uc+qZdPpkrhd4seSnNdK84mfsSlCc=
X-QQ-mid: zesmtpsz6t1761722113t4c4a24c5
X-QQ-Originating-IP: WMfK1js/UW7s6StnIpjDkyDreu4Jf2mWtPcMyatS3g4=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Oct 2025 15:15:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14311052351362136618
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
Subject: [PATCH v8 06/10] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Date: Wed, 29 Oct 2025 15:14:31 +0800
Message-Id: <20251029071435.88-7-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251029071435.88-1-kernel@airkyi.com>
References: <20251029071435.88-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: M7n9VusxZAlPpcFABy826l+dX5bFLJ2tIZv7iVoCvBAJ1p3Fgwi3uIxx
	im4SByYEFRLLPluWSL/QlOMIgXT/5ljbYud9zrvxMMTd1rpAdk4Wm8IOricFdz5rEfLcZa8
	U6LcFsCcG/Xp+6D+AKMP0Gst6rDyWTs96zYRpSjrX4mkJ+v9RV5kR4hdm5BZwv/6MQZ+1TW
	RtLxuSMT3LK1up6jVBK6on+QYHTiD9zchZoV+F+VlFuqDDQA8/c3I8Lp3Fn1pP95UJN92nL
	FpCFGsJkR2NwW/TpP2Woz8fg+CToYOLkTYVBep6M3ncbwRKAJGbhieuCGOITRbOTmV1woXi
	78YqCUNcsz20uF2dS+Sk9NEgOb7eNjBfhMBtKr1jCURGlwZw6KykhZLzjuTUe6aseG0HrsY
	mg5zEZWxjA+0yx+GDEvJtikncFq0T1lPh7P7bdOvEwhDWxkLlaOJaUlS6N5/X2LdP93icO8
	87fBqu3xhVVRkR6ez0gvix14X9um4OJhSaR5xaqMKIdu0vJ8ty5EYyikCVK69G5DaOEOZNb
	/9bWI7rHosOhW/PHa38AJoPyL2MHy3UP8yxP3MgGwmSFBpi6cvHZdXx0FpDogOGaDzwc+wS
	4K4WlxSdWIEjAJ6N3uM/+zQ+kv8K88OgjE4+gGZrEZt+DZaC4NFi2FcUJOinVQORRwSe09v
	RM+G5Yr0Bv5jA1k4dYhJ8g9yjQxFhYIiNVifFlc6lEt9lb2OPPegk5QS/RLbpboSV/Gd0HA
	jwMb5USDMXPmg9J4iMV8daZVsayS1zBgUvOqAc0/pNpy5/8SS49LACmJHOyCwqdOO0ZFsZO
	PqHsX6teCPcRK1yg3vaIQeotTTO8o4GDPq2Gt4bEz6BaZgYwGrGYf729ndr9bYU/pBTyDsn
	AI+pLzQkJmuoHqNwvgT2VPna+WOAxxwlsY/YOmm5jvQF2XWkx2bc2xaJbQwzKnxfPlUQMUp
	E6xbajQPIcYM7g0ThTM2DdrM2oToCXBT/SfNgkNRRZlTZ8Ak/ITfhWx1yOtISf61fsIDVQq
	7KkafDJkG0WJwyOGc3n0HrwJf7iG795ZOZpecQpQ==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Using the DRM_AUX_BRIDGE helper to create the transparent DRM bridge
device.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

(no changes since v7)

Changes in v6:
- Fix depend in Kconfig. 

 drivers/phy/rockchip/Kconfig              |  2 +
 drivers/phy/rockchip/phy-rockchip-typec.c | 52 +++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
index db4adc7c53da..bcb5476222fc 100644
--- a/drivers/phy/rockchip/Kconfig
+++ b/drivers/phy/rockchip/Kconfig
@@ -120,6 +120,8 @@ config PHY_ROCKCHIP_TYPEC
 	tristate "Rockchip TYPEC PHY Driver"
 	depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
 	depends on TYPEC || TYPEC=n
+	depends on DRM || DRM=n
+	select DRM_AUX_BRIDGE if DRM_BRIDGE
 	select EXTCON
 	select GENERIC_PHY
 	select RESET_CONTROLLER
diff --git a/drivers/phy/rockchip/phy-rockchip-typec.c b/drivers/phy/rockchip/phy-rockchip-typec.c
index 1f5b4142cbe4..748a6eb8ad95 100644
--- a/drivers/phy/rockchip/phy-rockchip-typec.c
+++ b/drivers/phy/rockchip/phy-rockchip-typec.c
@@ -36,6 +36,7 @@
  * orientation, false is normal orientation.
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
@@ -56,6 +57,7 @@
 #include <linux/phy/phy.h>
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
+#include <drm/bridge/aux-bridge.h>
 
 #define CMN_SSM_BANDGAP			(0x21 << 2)
 #define CMN_SSM_BIAS			(0x22 << 2)
@@ -415,6 +417,7 @@ struct rockchip_usb3phy_port_cfg {
 
 struct rockchip_typec_phy {
 	struct device *dev;
+	struct auxiliary_device dp_port_dev;
 	void __iomem *base;
 	struct extcon_dev *extcon;
 	struct typec_mux_dev *mux;
@@ -1299,6 +1302,51 @@ static void tcphy_typec_mux_unregister(void *data)
 	typec_mux_unregister(tcphy->mux);
 }
 
+static void tcphy_dp_port_dev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	of_node_put(adev->dev.of_node);
+}
+
+static void tcphy_dp_port_unregister_adev(void *_adev)
+{
+	struct auxiliary_device *adev = _adev;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static int tcphy_aux_bridge_register(struct rockchip_typec_phy *tcphy, struct device_node *np)
+{
+	struct auxiliary_device *adev = &tcphy->dp_port_dev;
+	int ret;
+
+	adev->name = "dp_port";
+	adev->dev.parent = tcphy->dev;
+	adev->dev.of_node = of_node_get(np);
+	adev->dev.release = tcphy_dp_port_dev_release;
+
+	ret = auxiliary_device_init(adev);
+
+	if (ret) {
+		of_node_put(adev->dev.of_node);
+		return ret;
+	}
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	devm_add_action_or_reset(tcphy->dev, tcphy_dp_port_unregister_adev, adev);
+
+	ret = drm_aux_bridge_register(&adev->dev);
+
+	return 0;
+}
+
 static int tcphy_setup_typec_mux(struct rockchip_typec_phy *tcphy)
 {
 	struct typec_mux_desc mux_desc = {};
@@ -1312,6 +1360,10 @@ static int tcphy_setup_typec_mux(struct rockchip_typec_phy *tcphy)
 	if (!of_property_read_bool(np, "mode-switch"))
 		goto put_np;
 
+	ret = tcphy_aux_bridge_register(tcphy, np);
+	if (ret)
+		goto put_np;
+
 	mux_desc.drvdata = tcphy;
 	mux_desc.fwnode = device_get_named_child_node(tcphy->dev, "dp-port");
 	mux_desc.set = tcphy_typec_mux_set;
-- 
2.49.0


