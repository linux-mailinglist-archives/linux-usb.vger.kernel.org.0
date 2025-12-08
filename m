Return-Path: <linux-usb+bounces-31256-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 475E4CABC66
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 02:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67A88301A1BF
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 01:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74B12417D9;
	Mon,  8 Dec 2025 01:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="AABAJCHo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214A821CC7B;
	Mon,  8 Dec 2025 01:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765158968; cv=none; b=FM1ua4Z8WOiL/CQ2QOzaG9rXhzLHy8WWoudmLAjO99/0Z6lZCjW5uJymVKlMIOg56u4Ov8eFwhuSeksdd7CpRJNphsGDmctmhNIzaqvLGcKbpIh3cyL/4ZmC1kMKNmnGMI2Oi3VaZV6DGECxUFqZGey9nzxn+kNfu/uqMw0S76Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765158968; c=relaxed/simple;
	bh=ktQe0TBZJXNabRClR1zK2GRlgnwznm7iN6OWZIxNePg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=SejHaIo6AOVhs2XbBeJnVDWjZ40a7QBITMhZK7CWd90hvXQgJhoHWNR4s5+68JzMLEIEck/nsneAPbvcHxDPlrOwvp5ixO/9TVpmYwjQkaL6qwwkaVofVAnwUzaB+5x3630/yRv1y2MPVlCKx3zxIDlopvSmpL90slB398TswOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=AABAJCHo; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1765158947;
	bh=sEWMlrnina66f1mkg7MgIF551DMwzRk8lseSsYVXv/E=;
	h=From:To:Subject:Date:Message-Id;
	b=AABAJCHoAT9gtWhnuzzQBfRlUkHiuGZ9ex2JhRAOmn6KKlFOh5CVNQ7Es6ARLzc7C
	 jGnp4Juhi9EwxtiXJMueMmQl+SLng2gHK2fg3QzRMZ4L0VNiBqef3HDOfteHxzWMkj
	 rDouv7H8K9Pl/xTGKBuW+65Xo+oYKQweIV7t6dkM=
X-QQ-mid: esmtpsz19t1765158945t702c369c
X-QQ-Originating-IP: YhWIQ0V3ycG7CDzXdW5g+odsXgIz2Zc7DYufLSVOhgU=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Dec 2025 09:55:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3081592596976670402
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
Subject: [PATCH v13 08/11] drm/rockchip: cdn-dp: Support handle lane info without extcon
Date: Mon,  8 Dec 2025 09:54:57 +0800
Message-Id: <20251208015500.94-9-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251208015500.94-1-kernel@airkyi.com>
References: <20251208015500.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N9DIJtFs/avns4hvy0i9PlTO1llTc6+s5Akmp3sFsxKLt3Bxl13jQioL
	e5tuEpL+kjb3vgFom0lP+QI4HOK6fS+eS7txmoRx7kO1ZeKy9c4uFQkIvuTxIKPuV6pmQuB
	aRwiuLyqgaK6OSrCWZom9fy/fOFFA50SyU47GAvOpsr6XgscYbgHytExEuxd07EB1uk90uZ
	ij7P0t7vgqT7jPUemHLQKM95gZwNBx7HpVxL+1EhUQZSgUEchLDprZIu8GDqxH9ewm/fDZX
	2KUzW36QnG1fw9bEDmNGF9OuAMlY+6be5wC7LrOhcZ28mb3fo3eDP5byS+DeiqnpPCs0kvo
	FPQHYQq/fDgzvV5UaOYO/bpLt+NBgjz9mnHkFQmfAwCdGDOUs+5H13roVnMy5petBV6MFYf
	UB1g1IG/xWPypYcDV6/+x8hLxEj220Ro+dwGGL6VnPeIkVgXMocxlUYXXWK4zEDkrDRTl1Y
	tU3U9qSYWxpYfCBaQUJnKieCO27NiblSyCVtZ2zUnCiJGxFg65drftjaFdrlzS5b67u2vzj
	6tnbRVPBZHjyjK6JPlT2KC6wS+jj76GqD/o5uywiwoQqnuxtnPCrHTs8XDkD5CfJM7frjHs
	uqKK4pFIQ4SgayCpsdfwCGRPCk9ck+zAe+VGbLn2mJ13oO1EjFIVAmEerJUZXWncrO/O0ju
	nkdkR9v78i5Fsvn0RQhUWl3l+O2FfQJAhWCH52jmH5onJGHDfUs0NOB2tIIm5RRU1aiSvho
	IfGmgXRYwkF55u5e9AcwJY3TMHEwLmnuboeWsFUWaJ9tURRFEqCWMCr4i/HJS6xadu0IrKk
	Gz4oqpRQ+9zxrgEZj7YyMy4HeUNdB0Wr/ZmFzUf4GPRO2UX+WjCRVSoBv8sQGcWG2+za/lJ
	hqeIuONZpFDDMZpsojbr+EaGRgNpnMyJmU3JEmprahijiOTWqqrbmtTBJRTi6Q73l6ymKPi
	tMEYK89MnBRUKaLPgW1t7STLlAb8XYGMjSqLxtP229V9AXLo6RXeOxnTZJqlaf0SKAvANXx
	QcU42cax2cP97XEo31lB4nRnfYbm8=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
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


