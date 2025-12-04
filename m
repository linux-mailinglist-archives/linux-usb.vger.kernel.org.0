Return-Path: <linux-usb+bounces-31152-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1B4CA288E
	for <lists+linux-usb@lfdr.de>; Thu, 04 Dec 2025 07:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B28B3300C2A1
	for <lists+linux-usb@lfdr.de>; Thu,  4 Dec 2025 06:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8FD30C348;
	Thu,  4 Dec 2025 06:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="nN3VzhIG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AE22D8DD6;
	Thu,  4 Dec 2025 06:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764829936; cv=none; b=ZWJ85RFfu4d/dLqx/3t4hYI3v7pdyepGgfnBKyjt9/qVtBgciJtG4Ca1Rbett4xcjAxwJWq0TtI9v9/CG0ruZTodbP4ayBSQf5fXUO1x/dHILlZdTOEO52vJeuqYWvmF3c3vPutQTqDnL6ngyLZL68/YjvWbPKRZPYd0lkSTEEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764829936; c=relaxed/simple;
	bh=ktQe0TBZJXNabRClR1zK2GRlgnwznm7iN6OWZIxNePg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=CUv1rUJMkR8gZoBWpHfEFFtOQdben7yrswi32VZllexa2GFSTsM/DlALYjFmFgTBB0GBcvANP10LfpeaxJvntcZqt/iUgRqs98YLUDrgoYli+P09fK7RV55CioOdWIlXmDtYQ8BRNhrlMx7nOjuTT8r4IPNB1ropepr9Z7yaQMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=nN3VzhIG; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764829915;
	bh=sEWMlrnina66f1mkg7MgIF551DMwzRk8lseSsYVXv/E=;
	h=From:To:Subject:Date:Message-Id;
	b=nN3VzhIGVmYkV5tLDcZFdUOH7d56l08xncofUow694LQk4fk8a7s7Po4KnaC9P7LP
	 mw5rGvxXeRjqjKk4hDOhAuzR2M0gLVCvw91HIzhYZlxSXg9z2LPRqqkkwbE70jEaPt
	 BpGAzVtHPKC3N3xAkMVIftyTHqhRJFKFx2P65rBo=
X-QQ-mid: esmtpsz21t1764829914t2fd6b4c4
X-QQ-Originating-IP: hZcaALHRrEsVfm0KjmfXoYxrbuS+HXMQE8GZuYKKMRs=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 04 Dec 2025 14:31:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15523287474002060111
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
Subject: [RESEND PATCH v11 08/11] drm/rockchip: cdn-dp: Support handle lane info without extcon
Date: Thu,  4 Dec 2025 14:31:06 +0800
Message-Id: <20251204063109.104-9-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251204063109.104-1-kernel@airkyi.com>
References: <20251204063109.104-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MuF+DMKUphDyaOkPxQeIp8/8UjaViT3n43xA+S4WusRthosWFEHKlpRC
	FXm29aXiZRSuZ8q18rHgIRPLk9viJrry4P6ZSO/OrjP3KnDM3/z+LRcK7A+kmlErHhe/bsw
	ABFNKd43Ml74bmnLbCZy/0SOUMZs8LI/fehlRZGI4nH9Qq717CTYHBnrMYlyOs/nuIjZ8u/
	juLvbMLEsIfIAQwNo4dOMCTWZ4kvSaS5HA5LzQsfAWUlVGiHY4GcwZe59dY5q7Ab+8vBk4M
	6TlkrZqBa8LceG+DztW8U40pswM/jnzN7DKuu37D/uLuUdYmvIIaVXiIexJxQYO+GQapp8R
	++ryJW32vrjfh1/wPuUExn+7X6ewacE0QMP/ZEmwVdCKBhvg5hPbGB10OomE0wtr0jpiC8b
	ICPhikPzcd6ac96us9v9zqVeiJCahE7R26Dz+ztRC1TXV1htzDqzc3WxT5DMuEp8Z0iSs5Q
	jRoe7fMb78jGAoYTZy9KZKmsdJlmkgfcvqFviTHDVrFeCatWw30bHHZZ8gJK1kQVS49seZ4
	W15ZeqIxSX1c/Z/WPQRe0mBOz9cKqs2VsCwGIiQnTdMaYr51X0qNNibP4Yb9S5srrTdx2bE
	Q+JAE2I65qqSBJXxwJ2vaGh0uWpBjFcJplKMfwucP41j0CupEpfUPMljs3oftsoEPOOuHd1
	Ba6S/nTUXAU8lJd0T/kwzG5886q9Cg+vDjePQmpq9zEXByNbPMziKA8YXxyrld92x5a/zid
	MBjKEyblUhXf1XNvVpTBp4AbDVoWMhrH1FmcG/cIEhRoqJwgzKnw05oGVWSrsYaaWKl4Nae
	ydcSU4zJdAEDZBrZWDYDUyaMKhBoEJlEuu6MbtafpzMCwa+xKn7K9a2EL0kK/xtnipweNaV
	rRb4fACoIB0/RXGBqjB4CyHfjjPSfo5DAX+3JtVnyppI0s5FDcYyeLQeblQY12LgJ3gMr4H
	v0YfZyPZ4Dq+YW9Qltf7EtvFxmPbjTJFG6UqrXSKhi1gDabbuhNE2ud01ARAG67ox16c0a1
	paa/eNtz2fDOhNVrScERGC6UFQgEN7Pr9rP83GAQ==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

This patch add support for get PHY lane info without help of extcon.

There is no extcon needed if the Type-C controller is present. In this
case, the lane info can be get from PHY instead of extcon.

The extcon device should still be supported if Type-C controller is
not present.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

(no changes since v5)

Changes in v4:
- Remove cdn_dp_hpd_notify().

(no changes since v3)

Changes in v2:
- Ignore duplicate HPD events.

 drivers/gpu/drm/rockchip/cdn-dp-core.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index b7e3f5dcf8d5..1e27301584a4 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -156,6 +156,9 @@ static int cdn_dp_get_port_lanes(struct cdn_dp_port *port)
 	int dptx;
 	u8 lanes;
 
+	if (!edev)
+		return phy_get_bus_width(port->phy);
+
 	dptx = extcon_get_state(edev, EXTCON_DISP_DP);
 	if (dptx > 0) {
 		extcon_get_property(edev, EXTCON_DISP_DP,
@@ -219,7 +222,7 @@ static bool cdn_dp_check_sink_connection(struct cdn_dp_device *dp)
 	 * some docks need more time to power up.
 	 */
 	while (time_before(jiffies, timeout)) {
-		if (!extcon_get_state(port->extcon, EXTCON_DISP_DP))
+		if (port->extcon && !extcon_get_state(port->extcon, EXTCON_DISP_DP))
 			return false;
 
 		if (!cdn_dp_get_sink_count(dp, &sink_count))
@@ -385,11 +388,14 @@ static int cdn_dp_enable_phy(struct cdn_dp_device *dp, struct cdn_dp_port *port)
 		goto err_power_on;
 	}
 
-	ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
-				  EXTCON_PROP_USB_TYPEC_POLARITY, &property);
-	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "get property failed\n");
-		goto err_power_on;
+	property.intval = 0;
+	if (port->extcon) {
+		ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
+					  EXTCON_PROP_USB_TYPEC_POLARITY, &property);
+		if (ret) {
+			DRM_DEV_ERROR(dp->dev, "get property failed\n");
+			goto err_power_on;
+		}
 	}
 
 	port->lanes = cdn_dp_get_port_lanes(port);
@@ -1028,6 +1034,9 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 	for (i = 0; i < dp->ports; i++) {
 		port = dp->port[i];
 
+		if (!port->extcon)
+			continue;
+
 		port->event_nb.notifier_call = cdn_dp_pd_event;
 		ret = devm_extcon_register_notifier(dp->dev, port->extcon,
 						    EXTCON_DISP_DP,
@@ -1120,14 +1129,14 @@ static int cdn_dp_probe(struct platform_device *pdev)
 		    PTR_ERR(phy) == -EPROBE_DEFER)
 			return -EPROBE_DEFER;
 
-		if (IS_ERR(extcon) || IS_ERR(phy))
+		if (IS_ERR(phy) || PTR_ERR(extcon) != -ENODEV)
 			continue;
 
 		port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
 		if (!port)
 			return -ENOMEM;
 
-		port->extcon = extcon;
+		port->extcon = IS_ERR(extcon) ? NULL : extcon;
 		port->phy = phy;
 		port->dp = dp;
 		port->id = i;
-- 
2.51.1


