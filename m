Return-Path: <linux-usb+bounces-30763-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3FBC71D60
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 03:26:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EA718348F6E
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 02:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16ED22EBDC0;
	Thu, 20 Nov 2025 02:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="tjdJQSsV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14F22D593C;
	Thu, 20 Nov 2025 02:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763605484; cv=none; b=OTH2atc3zDLlqn25ng6Ymqb781964h3JEHiTSYkPiB4PCP+0MATpDOjgkTPXYJOU5moAxa/40q/kLgD1/MVAiEnfk6EiU7WNC2lbBioTAIX76EtfGa/DwQz1sHXZCj4JhW3SXMz13pK6SsQq6wOljeo0TN9zRqKFtNY77GDp2uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763605484; c=relaxed/simple;
	bh=RM5N9mCZiGaQbUvi/9J59FQGOpPt3UlmZ3fpa5o8zec=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=dDNZkUH1DTj8FxXsGo9xRdxHCBdaZ7RT+CqwFiJyM66S6Llvu5OT4LOZ237SAF/r1dlmLSHCy8fGFkhmICLJoDp7Pfw/vmn5lHhFMG9l/05Zn3dzx3Vq48dQTNDlDj8Uh0iXtnJPpN9Pqc+ryvebvJRcvC+XNccn+b0qLA3FcP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=tjdJQSsV; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1763605463;
	bh=/IF23AwLHF2BuDE85+w1cIAuWmxkHGHVECAwuwTVkE4=;
	h=From:To:Subject:Date:Message-Id;
	b=tjdJQSsVXPgZ5EI5VAD8lTGE/zU6HKgryYWdbL1r5TOAmyEaiNjH5fTowzZMop8Bd
	 Xjpz5eAAzt7VXEs+9LdOaB1cQmUaA0zKV47F4cTphYmZrInRShFHOJ9GqUgEX/wqp4
	 hLfYBj5FlAp04TsWfj804dLJlBgeHOOtj1ZDw2qE=
X-QQ-mid: zesmtpsz5t1763605462t762960bb
X-QQ-Originating-IP: hdCmop6+IrM/3+WRb+UwDEmL6vY6WlZjSA0i5Kppr3M=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 20 Nov 2025 10:24:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6704151892834101465
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
Subject: [PATCH v10 07/11] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Date: Thu, 20 Nov 2025 10:23:39 +0800
Message-Id: <20251120022343.250-8-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251120022343.250-1-kernel@airkyi.com>
References: <20251120022343.250-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MqN/FiDJuNHiNw/y4jqC1wkbajwvJbSZugfFzpxL1HvCY2waR3xFcXe4
	9D9gGS8TD6AHxUDwfPe2QnX0uykpBe7jHW+xvjHO1e/sthgtHCMli4nC45zMmjm+abjm0bP
	kNpKZtAr8KvdVEwGUJRl87vEiweO7MhYpQ9DY+BejuDOEBnb/Bij7c7r30dlYfIBqo5FdV7
	wKiCdACFSYnkIQjbf17RrkVhNIAc31pOK5wl+dq4xeFWkQm+XKThir4xI6a/vsErVvWlixJ
	gHH8bceHnlcyO17vg/iPNEGJy7HOZFMc45uhOAFkfT6vsmyknUd6wrCgMSzXTHF4bBnTBu4
	TiCbgMHgMUMsxpiD9+6a78nKHWsyFuqTztF40d2i242YVajpV2wVk3Tyxu1HbwtmmYC2Hrq
	GEDBrqDHX0NyUZVvSZG0h2jn7JeMohclaiBNs4XiAvtsAaEZNiTwGdLxTt1crFhbdJx1P9O
	l8BtcjuqvMed/ZHFZQHiXJ86CtW/3YIRVnrX2sAuUE2JNvqVph1jgg13OEgG3slXAt4aNw6
	uOyQAbK2lj0d1nwpmf6pc+4GRD9VMVTr9GroQUw9wWTUlst4uLxl9/X2uk3MnmnbMGMrOf0
	IwcQYsios/JxBd/M53lfbFf3aFLx8A6GeGS1xf7ysuZwD8Mwd1pqqT1vXVac0qwgc4/cU6t
	gM9O17C31ImZmuOt4oK5YugS9BmooJvHu7vcTnVP6/9FP8lC344oi9VFA3/rP1tQEExPErl
	leFlnsnD1VFCdS6bLbWk68aS+DPPOviqYAP81T0n4/VobrrHO6ZdhidsNVbZhN3+WOsYt0V
	T8eu7kMlsdQGjWRjGP0kQ32i6dj7+00TrzvnpKyndvrw7mHCinev6vj+vIktc6a3QPl45rA
	XuQ7MGQZHVphATtGASjZYMOn+3MCS1jAihUqcpJOVa2msdR1FHfVOyBNG/DbxCVNzTF6idR
	pfviUA8NJwyrP37RdiyHhWCINiVMuRD3ZVps6wqSLmnbUg1U0g5UiGoL2c5ZunwQ6Y/A3co
	XzsSsjI8TgRARPoEx9+LeWf5VmaNM/n5+EWIOfZ+DT0FgSh7jP
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
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


