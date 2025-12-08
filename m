Return-Path: <linux-usb+bounces-31261-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA16CABC57
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 02:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C89D3005AA0
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 01:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5395E265CA6;
	Mon,  8 Dec 2025 01:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="L9GVwrdm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C0023F413;
	Mon,  8 Dec 2025 01:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765159075; cv=none; b=gUB7ba5ggYzrAU9f8jJeNYVD+Hscb7g4tMhp11U9Ps1EIuCQIUgE04CiRGgyVW8xC4yxJtCQYvxvVclQIX9DRCpbjcoZ6dG5LPW7d+LHX2hr9SrCc/w0CMSW8JDgr++TlR+tNvOGRG6nzsuOjgYP124xr4XxUKPpKgmMdd+6BjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765159075; c=relaxed/simple;
	bh=xQWi5hMui5VLl4tahRe1U8Mp6lrTVfX1Yy/sdF1ONzs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=nfdATkOlq7K+igjSbZDLMIC8LS+VDx5Gf/4G75jCa3qUx52I37f9xWzDgfPnJ2ETSj9rwo+GGDv3oCZiYl82KYD74IeIYYAj/CJWagnE9GuQiZAbQFAj4f0KQR2sCqXEse/6Av0cSoCyGS2aqIbdFj8jCLn8GkXax1ZI7fKxBJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=L9GVwrdm; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1765159051;
	bh=BnSe20UyFWhCBwFpCZUGVdKqrQwY3y7cLZdXieRNPhI=;
	h=From:To:Subject:Date:Message-Id;
	b=L9GVwrdm49GhRYhMB7cDtSxS6hAxNj5AADXWnc4uFd9cJqm7jTW6RvvwT43SqhfKj
	 1Mbx9OZNWPygCVP+UegddpEP9ZOKhi2ocpDmrdrgm0ltKHcpmDpuXKwSM+gognWA5z
	 UmyrykVQ1z1SDgVnv4FTU0GfvBTLkoIYVfcjb5rg=
X-QQ-mid: esmtpsz19t1765158940t25fd4027
X-QQ-Originating-IP: Z7MP6ExgaN3mQHGany79bTHA+lgk9L8tcXkCb4brfTU=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Dec 2025 09:55:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3174573280846271733
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
Subject: [PATCH v13 07/11] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Date: Mon,  8 Dec 2025 09:54:56 +0800
Message-Id: <20251208015500.94-8-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251208015500.94-1-kernel@airkyi.com>
References: <20251208015500.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M1POTEwfcn6kFgN8V7aS8nScAjuH+uDeIrR9wB10V7Rj27Y0G8Ftbe5Q
	A9ZLryqSH39vrOfZY4hC199/PWALrC59SJ+Fg9a+yL6uBhPB0ue4muGtmld+NOnUvBJLrv+
	+jQbJlnDYqbbe/bPd2CKrS8nsXQKalJpYgm+vjaZfcTKkKH3jH3DPwsTM7UlAO7Q6i3mjmh
	1GrDsMIuCBLTdy4bk7irdV8vJpr59EevHa3X7ks9JitQ+tI7/Rxc7dGfBmD/M9i4reDJns7
	mHMvgc4nW6LysSTTpjQkKePLIVAAK9uljwpcOq/jlXhPs1U3Pc6cjD/V1dYaQBSf75lDhza
	wbYT9OSoVQbjwvJTPVO2KMqe2NQMFa5G6iYXhNjkp79PWs3sGjVpbAJLwffTNV9bU/1R2sQ
	bQ2AUs0BAtj7sBcdwseD6mCi4bI0mp/yZppZjkDYDuZ6cY9hamo20/twpig+3y9iFN1t4pn
	oc3cP6nmye3jeI6SpbbXWdNePQfn8AVLgtfnXf2b6pkz0kQxSrwmJCEvoxbNT2EXbqcpvIz
	cj5RAm0XhkUoe62kV77RMi6I+8vdHCx+bMlbFhXi1fsJa+aa27PjQAcz93814XeWh12xant
	HkE3reMQJ19+C/XOfSGjltwXEX0zMPAlMD9QTdXBMFV34q0RNxFp75kDIBhzAPoDRinPekZ
	Az0MXQxxOybO48Cl4VuVdxnxkSKHzu8vBe2gNTloIayLHCOLcPY0UJOmkY4aTCqNI/wNrQ2
	DFmbgEhQKmZqU6G3RV6HcCJAlc+AWwWP+jMhXXH3UbEEVe34qgSga5FGhvSyJ7pmSV0tB0b
	pDj0metwcRzgMTfbg+DcH87H0WMOxuXsBPEbJEL5+XPs8G2w3vmIQpsoaC7YzeAbkBGbg+Z
	Zgl1N9qqGETSOVjDogp6FKGHtNXOwh77ZhMEnrLoVIQIR0CRfg4Fyc0nS9++nDR3aM1lLvj
	8uIkQC1T1m7KuTdAevmjcqU/JOIL5dLKHlBuCjjicSTFZ40I28zewoG3WoC4yXbjpsopJn8
	Yv+u7JRqCKh8qnuOP3DoYLISTykWw=
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---

(no changes since v11)

Changes in v10:
- Use drm_aux_bridge_register_from_node() instead.

(no changes since v7)

Changes in v6:
- Fix depend in Kconfig.

 drivers/phy/rockchip/Kconfig              | 2 ++
 drivers/phy/rockchip/phy-rockchip-typec.c | 5 +++++
 2 files changed, 7 insertions(+)

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
index 1f5b4142cbe4..e31b778c3537 100644
--- a/drivers/phy/rockchip/phy-rockchip-typec.c
+++ b/drivers/phy/rockchip/phy-rockchip-typec.c
@@ -56,6 +56,7 @@
 #include <linux/phy/phy.h>
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
+#include <drm/bridge/aux-bridge.h>
 
 #define CMN_SSM_BANDGAP			(0x21 << 2)
 #define CMN_SSM_BIAS			(0x22 << 2)
@@ -1312,6 +1313,10 @@ static int tcphy_setup_typec_mux(struct rockchip_typec_phy *tcphy)
 	if (!of_property_read_bool(np, "mode-switch"))
 		goto put_np;
 
+	ret = drm_aux_bridge_register_from_node(tcphy->dev, np);
+	if (ret)
+		goto put_np;
+
 	mux_desc.drvdata = tcphy;
 	mux_desc.fwnode = device_get_named_child_node(tcphy->dev, "dp-port");
 	mux_desc.set = tcphy_typec_mux_set;
-- 
2.51.1


