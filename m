Return-Path: <linux-usb+bounces-29548-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D7448BFEFFF
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 05:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7E4A1352492
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 03:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D822877F2;
	Thu, 23 Oct 2025 03:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="mG6XS+nu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A232288C2C;
	Thu, 23 Oct 2025 03:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761190259; cv=none; b=niTDGOunfcnlX1aYNTL6O6Ala33/RrsA0aV/MPgsEDN6VFlLsp9YyGyXWX/09UTWJg6CO5Vitynj90xApEs1FHeOpDCp91c43I8gRISS6GZC5kATJHvWSzSHrIWd0GjUcNldGGmR669ctjDFr5AVV5GCRBvcRkjT/B0HaGRx+7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761190259; c=relaxed/simple;
	bh=HysgThJSB58INGyifNQGXbmX0lFauL5Bf5bQD741kwA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=MsyvD+vxF5Lp9klzlT6jyVvQGIw7CPJI96DCS8y9Dw6bJqyuY2aJp7t2tX78PWsb7hvsHLYsb7JAZLz++LXSHji3Txauhho0FDeLOCEzkc22hwH50nsY9tsiFMDZmdDxsRUK8OEXjZPSwN2NyNuAXqBFQ9wdZFn2fZOtN6GDhkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=mG6XS+nu; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1761190249;
	bh=AFQcoHE/dlPx/r75ImuKZ7C8fGQ0d+TgBuYEF1fP98Q=;
	h=From:To:Subject:Date:Message-Id;
	b=mG6XS+nuhh30sRdOPoLip25M4sVoEeZ33/xbKSTTH5oeqHr/3qw+xT3B23OjY+F+K
	 oGZJOsq67vs0mIkmu76TLlheYbzoa3giD1K4RtQYhmh+skGSkFqFR8tg9OW9AOfRBU
	 f1BUdmThZnzJTMTXEK7wDOxQ6ia6hmaFYhEd0zrc=
X-QQ-mid: esmtpsz16t1761190248tddc1db9c
X-QQ-Originating-IP: 79hG5RSiNIqAGUfWumvqMnoN1zJNDnasQCzDIp5dXnM=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Oct 2025 11:30:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1756416242830638748
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
Subject: [PATCH v7 5/9] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Date: Thu, 23 Oct 2025 11:30:05 +0800
Message-Id: <20251023033009.90-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251023033009.90-1-kernel@airkyi.com>
References: <20251023033009.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: N7pVCJF/rxxTW5+xfoQ//pzUFo0kkQP6MDpB6T48LOSv71ZMu2r30FoV
	Z8nrE+89FFf8j8xNyEp6t1tCGgwS50WcLbjQuyivVN/cZAZll2llnL1hplM0ZMNrFFeQ8py
	OvJh83lvxC+8d/T4xw+12Tf6a5ix0AK2RqAG4ds4rLVe75jfLLKtZ0GwRPgbaljyp1UvIjk
	RtLu0y/kvjLdAEv7txj39XkNRFSiIE8+I9gRATEnlgG47/qJKnnBAHNWk+lg/qPc3ZDCjpu
	KTDnRH3HnAjTSVktom1owqWPWOugxcwZhV6XCYugs2QmmHIzI9PxdVLQxT+JU/CQFHPrWy/
	qhu8TVpBuvXo0eeihQWCVvADjU48b8+g5vU4NAWjPHO6JShg+DF2oWEBezFzu4A4K8+3KKt
	RHJ+ohzgcrIIHlqRzbwek2eT/vHPP+baW3HRKWEk9QJK/wH+i2GvDiDfff+7vgpm6y19uOG
	1/3BSsKdCHJ6qq6A0PoxqW77AfqiHZGFLAyxp3lcqDcBch1FDPahjpgwqrugJdCT7m5h1FP
	fmErM5pa41MdPEz/sW8Ola6Nc7DpfN5vOua4JykC7xJfBkmqXcwQQ68NYwTC1Z78ihpv3Pj
	HpPJIuAS9ZmN/Tc3NSyWcLGR/+n8OjS69lutxHaJmjQ6uu4vFisSaE3GMgF814Ng3tdOjON
	TE7rTN6yqYq4h1xqoDxvjMokQS77jGxG9tiGL92pu8IJJHRA9+QsBBcZZiXr9LP1vZNS46o
	aPHkwkl5Rb8Bf1oBEllf9RetjsVpxEDtxuc8H3MJ/2kfgsJoSKM0hPauZWxY/l13CUSZe9G
	dHgr4taz+H+vHEZr8/CVKZIHFPuMZUEVk9bE0+tjCY20OTStM+mJ4oORDEVI46fgZfHOxJm
	q1zQOoRweq6mxP6BsAM8d+pX3TI9GVabJCyDfm+UQ4TMALOuvYhKCRR+gNc2UM8wMREHicA
	iHpodR5o8Fj7lbncBh9jQe19jkQPnJdq85AWm3TZikBrEhBFFlZ4EiVDi0zp5YCBPizX2Dt
	M7/8yHsNy+7aifRrI7oEMMemiBuseBOcTUBYHrVg==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
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


