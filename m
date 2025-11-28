Return-Path: <linux-usb+bounces-31028-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 786A2C90952
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 03:08:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60CA43AB9BC
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 02:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A15A2D23A5;
	Fri, 28 Nov 2025 02:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="gdit/o07"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084E02C11F7;
	Fri, 28 Nov 2025 02:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764295513; cv=none; b=bKYtBtHWWNWFnIyIDPd9N9dOQEYZu1kfRBjbjdSR48yeQ8Ph3VUebRGOdMFHXd5/OVflOx1OPv2iMRyCdbm3l8wb71xSwUl8++WWYKJtRxkYhXFm/A63T/EwZHE1i0IGCZmJC5w3S2xU/hUKXBSjD73kwzGdwgvgVzFe3OLhnnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764295513; c=relaxed/simple;
	bh=ktQe0TBZJXNabRClR1zK2GRlgnwznm7iN6OWZIxNePg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=UElnw0yAJhUuzIGZCMABcpA9jJ5SUkcfLatfJWYPaS+n4lzDYLr9s8qPAH9zKBJOwCjF08Hjhr1Amr+uTvyGcl+83oEifo/KXApcNzBLrT1Ioq0D7/ndtMlAY+Hs5GaOejCgzSro2Y2Dz4IXlYv3yaaG2S85IBigxKxkRwQas+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=gdit/o07; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764295493;
	bh=sEWMlrnina66f1mkg7MgIF551DMwzRk8lseSsYVXv/E=;
	h=From:To:Subject:Date:Message-Id;
	b=gdit/o070EBoAyWli+7QQCItqwMQ2Up1hFAVsO0ay7+AJQmxBmm+8UrZuWBBSthv1
	 8o8/f/DxahSlUGUU/UFayVwPk41V6VVrl19MYtm8JLs1e6pmGMgOHoN7bxtcHBarzx
	 Jti0U7QtiGyaT8pr/aX8R4BBeLbXXsp9ITaAbLWw=
X-QQ-mid: esmtpsz21t1764295492t39aeb65b
X-QQ-Originating-IP: HkeozkZkjMzhIQB9uVBGumvb7YNkx7zQ7Dq6hE3efOI=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Nov 2025 10:04:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15549458326781898726
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
Subject: [PATCH v11 08/11] drm/rockchip: cdn-dp: Support handle lane info without extcon
Date: Fri, 28 Nov 2025 10:04:02 +0800
Message-Id: <20251128020405.90-9-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251128020405.90-1-kernel@airkyi.com>
References: <20251128020405.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MB4pI20wLd1DJNwAsx5KrYYZapI/67dVL7o/z5nq8vcwHuUMZuCZlf1N
	GfqTuw+QzJZnNVb+Y7Dg0VCFkWcXpTVCFBoCAMFzyo6Pzqz5wIicH3lQC5MPTC2mRTzsck6
	JpFnCKCyRMECON+ZuY0Sg7p5s1M970EJFMBah0CC01N5XHZq6fWPT42QfyJwFJtihnjtgnI
	s0DCT0V6kWbioMB724Sinvsofw1di+e5c2swmHR+g1We8ffr5t8c8lbmlJItVle7WGENzYw
	R2W1ohSeRpIY/FbLPLVrjFdBMehIzHedaFwXjXbHxGDiIef+ULI9Qhnvn3HnTy9rAsNptF4
	mfgMHHgGIQuLPNUL3YRJ7PwaHAxRkkx3notTXqfqkrHrwzV4hmy1XsMxIHNrM5leRuUN3qZ
	VbRpfHHVO/xD1IDsqNElaYLKe3ZM+VNzUCs4lcvBTY5WwLI+68dPN9djpGeJcvhV0uA6q3a
	iYqMgrJP2hplgVIV+HgfbEaco5jcOMEZnKvDHifzo1zb9Di0lN+mTcdSa1yI9U7j5BR2irS
	Y5sciWl5ga3kRoLrENj81LRjte9QRdtbDuYo614uPt4xqQegvDaqdTHoxCcxYKlgQeNtanP
	z9SqAreKaoxAOhWwhH1qD5adhxubzpgOWulIvIxIhlQ+xwsK3i4F7e/XvCOw2yZNJWHe0ox
	3uD+ML3D/bycYtvcUh8AZTKfp0GIS7ch6R91Bgr/qcr//4ciL4td0D5vfrp68wDKAApQ8YA
	1ys2Uvwa+47eCUPE0a25FnnUKkFlp8itgQf+lmlVWB9D++59gKgqVlOV1OxLsQG4af5wjJE
	D9cr/nSHyi4yJghOg7WO4Z0e6m2Qo50BBsdUlOPvlQta61hTFwjNY/XfhUJzbCgMrZpUIHV
	bKoMZgUKcJNiMq9x+GDFiTS92VIE/fC5UqDOTZuvhJlM7R8trBg6Utk2aDHVFv/mt7Kd/N1
	EwIH0mxMYUZmL9U9HiJhVpSiPLGXFcATmCZ5j+C+fuPqLKIw2IIyI2MudlbXiXx9GBPMN7+
	wkQFu7cthPDU5aJZGzY2j2YTGaSV0At4QsOp0mFw==
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


