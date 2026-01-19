Return-Path: <linux-usb+bounces-32476-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D65D39FEE
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 08:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A356D3009D72
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 07:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14211335BCD;
	Mon, 19 Jan 2026 07:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="hxw4nfDa"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A85E26FA77;
	Mon, 19 Jan 2026 07:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768807947; cv=none; b=bUw4OzZ9+7XB5MFah97tzDAaNHghnM6XFO7rLmvZVKxTfesHqv3T4+F/gzAMj4DgT785rlJjUAYOq5BSoAFpPsXAKv5rnG12sd7h5LdsIcVsMYlc+BRqd4hLY04A8PzFfmiUnCcThGo56bj7gVp2PzZIFFHUCwb+GD7eA76tJH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768807947; c=relaxed/simple;
	bh=PFaJSo44CFzbK0ZXM4EX8zDefFrJAyK83Tu4AAPXASU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=sCJv2uvy0Da10v9shlZ5ESDcnSERA+gw07ClfxANw2DTKUyGDNgdVmwmbpoYpsyNuWbANqRJkzGLGItxK56Kuh6mdHsKEBdFtQhZVLH1524QZzmAAAte/2RxrrtTUdIrH1z6KoIEMzbhKfqe/4dcxeCHJG6yApFJMWCI/xS4zM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=hxw4nfDa; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1768807910;
	bh=mTE8GiUrUtEaTT4O+e4/NPc8OEJgo20N+GCnBt48BNo=;
	h=From:To:Subject:Date:Message-Id;
	b=hxw4nfDaEYrB85e3OtJB1IYMjZgEU+nbkGafIRuiHf0aOvBlyE1wdxwXipNLAmvj/
	 iIC0exSX+TOm6yLHCPvfGwiBLbOYLZ0K7kwrf1WiOM1hrRokDT+KVJeiL7pVW2DqB3
	 4jw6/XJvtq/cJHRUoqQanwr4Ze4wD9BK8hAa9a6Q=
X-QQ-mid: esmtpsz17t1768807909t6177b3cf
X-QQ-Originating-IP: 7rQc2nr+44BlSU0iP8JPeW5epauJLxNX/QDEkb7wpC8=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jan 2026 15:31:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12188449118939079178
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
Subject: [PATCH v14 5/9] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Date: Mon, 19 Jan 2026 15:30:56 +0800
Message-Id: <20260119073100.143-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260119073100.143-1-kernel@airkyi.com>
References: <20260119073100.143-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MJWNsjxQgzaEIlLTbUYZXFYq8VoSA5MQ6BuOIF7d2ppZCjebNBlVT0AC
	SJWA4ZnKBl3kqfir5pP1tly7unDb8qMTUqf4eCbPyeHKB1PdV4nKR3Fk4mVrZdlRyebs19Y
	JjL5CF21Pjd19yRAAFHjc8qpqfaI6BcXdA5dktV/jQt/E2crjekVtacAHvpfHktcL3IjQhc
	FEQ8AYJcY7DID0Vnh3zxgOLfl/853dsW2fILKskOXk6Rb297AZQD/qITNv9iIznBMm7Or2O
	3vWhyDSbjH2NQheG5pNoPD8A1Co6zl7dv0tyGeCnmhkqNAdH1gF5ZM9OmNqtIThi3ycOY2F
	1PGIkStl6lI2GSpikGiZ15cZiqS2zPRrxClqsQbJjL4C6FZyowkkZJ2uVKzm7Kg4ccECpaV
	N1t9cYOAFW/9WdD1FXfRYKKM/O6hxTpH6V5Bur400n4Jd2uvbDEi+48CgjQjaF7gB5G2X2w
	EyJO/JOT75xhRwzFGUUbYjls3EbvXAhsJgJ6aga+1QYAGZC1sjm1H4xi+rX/6/v9avrJyqP
	LDDdIGHRibgWWObUlySG44dwWeowAKLXVb/0c8cOmDkpaMGf9zuXWFWaiYC7ZONiysI8aRZ
	tYxGw5q08X0ZaKBhY/KJipQ6t4geh7WwzPw1z7SGkHMrEu7JTF+CRu7ogYaJgBl1/t7YnC7
	awWt01M2VfgBJSxpyyXv+dKXJE3HofF3hxkCxle9IeXanhafF+H7S4rur9dZJQvF2YLiJRi
	MboYHLA/NCIDT5CTpWsu1ErtCH2x8VXjqRmcx+qDJhyzUd1+REaGc2RXyIXIBz+H0MEwTV/
	CJumdcWhTu0hUpExvybxbkN6RoTAJUt5XnjJgOUKPgonyO9BajyPaT9zvne/zavEUPZG09S
	Z+umtNmao12z8TzrlNyvjvYs4Qjg7X2dUEeT3vuXtJ/U1VR6rP6qidKJMMchjbG3XR6wO6F
	R/coSq/2wlg7dKxf5q0/y5mcPQabhOyq7ez4NTlQLv5m2SdLM7U+O59r07mbxvWFAV0A9Nn
	dCVVjS2M2dUFaERvLSPb8ZvYOHFYE=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
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
---

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


