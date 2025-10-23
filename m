Return-Path: <linux-usb+bounces-29550-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7D7BFF00E
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 05:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A2885352674
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 03:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0AD4293B75;
	Thu, 23 Oct 2025 03:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="qeyCkaWX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99EA286D40;
	Thu, 23 Oct 2025 03:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761190262; cv=none; b=X0DkkI+ANDqEUHSQ3kj6jAlNBqYvc/h778WukvqsYQvApRJwIP+TdBfI55lntN1F1DryvMymjPIQXvg+TNCjusOpyas4Ws5O2b+46WaUXzpDZuL+VY9k3c2FpNDX6RNNyNmo96ifvLRPdWR3lwRyDYLRs7JJnPaCw5BgQvR6oNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761190262; c=relaxed/simple;
	bh=M4nUEX7h4FeSk6XVEQszUpUpBE3mjUtZPXnyDXgdiFI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=DmoR3JHJoZy/zOo20Gt8qmWp6Dv/tObCwpe9V5EflFbfxp7iDaDlSIPd27t2V8Ee0rWE9q7UG5kzsWx58VFizJ7mPb3IEn6CMsvu+8tg8f4/4rfc//9pu7PQtLP1lf3ShRznCNY53rUQJwMYXQA8wsOLXX+VFVS8zsmmxGo2Dgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=qeyCkaWX; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1761190255;
	bh=nQG0w7dhU7Aew5bKV30plkPn0nBnVdgTnfwSbxYLntU=;
	h=From:To:Subject:Date:Message-Id;
	b=qeyCkaWX2FzPIRJ/0vJ54tc9bPyelpv0+C+Tus2WQBaJuUJiSHjbYMjI6RrHOnMYL
	 7j0fHZrXqbcMz6xRF+u0jHYmbSa5S0lKRnp46HJ27zQWXa9GLJiCNaxcCVrzxGmKKq
	 Gd/V8hyY7W7G3uhqQm+jbI4SUaQrb5nZncyNiXb4=
X-QQ-mid: esmtpsz16t1761190254t76ee6809
X-QQ-Originating-IP: ry/u4/8KR4C2zosHm3ALD9iejKzqUxaT+ZTDF/OGwF0=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Oct 2025 11:30:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13604929082984056362
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
Subject: [PATCH v7 6/9] drm/rockchip: cdn-dp: Support handle lane info without extcon
Date: Thu, 23 Oct 2025 11:30:06 +0800
Message-Id: <20251023033009.90-7-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251023033009.90-1-kernel@airkyi.com>
References: <20251023033009.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NoBhuER81KU6Pl+4SpwWqKgHGo7JJoYDzqUtX6/xaRHDFUX5thFWF91F
	hm9rGv7AXvFg5xTPtdL2sm+AOCpcPUHuOqSSFNqXe/v8D4pmAF+7Kwqzv7ss8fdZpjCG16d
	qAYSi4tuSWr6qW8dgQEZvOllD2+JowwU6p+Qy9UqQQAzyX5JNzrFslfULlucJi9GylyjNmE
	xJuWU4rnk8leAuyTAizUlNodJy+RPPu2eF/bjOTaeyPUeSrnQa0GPQaIBj2aEGL7vMp/gut
	+QEyN4Fjqs5f0HEqCHnBrNQD6KYQlnvyPisIaO1AmjI1v53mkzpm0kb31DKHaxO9lcA2sh8
	kS/Sq8+XthjC3ofeRsTASDgQFDpJAgSHyT06ZWH81MqHqesb4Q0QcieRmAcen05tW3MQLxm
	L/ksucG0yEA3pzSwSd2RMZN2ht152ifXFZuhdDQRW9VWybigOJN1LveO5x11cnBxVnKjaHT
	YdrBZhRaTG6A7iY+yaboiWf35ssKAVBv0zwy0zg2VDFxWJn1ON2oOR692PlGO8k41HWzR/r
	xmOrBgE7OjbZanu5Izrfu37Magh5sbYeAcaSDFoolU//JiJnWKyXFjlMkqGzycZtVlA7ueD
	cNst7PVCKp2dYSDJ6dg6FGG8o4IFdJdjzwNTZoR+CEuq2UpN/kNNi1kAUOoAy7k5euymRxr
	QX7kz/flF9bjiT6HCz2wvw4+E1N52KxyiRpqkBXiBwfpSBmAGWHBXABmFXvQjO6uH0wf/lt
	J8fwUYrRyIHr35NXyNotmKaefZTCrP9uVI3Y5X8oLVatUdU2qMMVNyWitMrF2uwlZ2VuIsj
	P9mzIItbJOq+GNPHccRjjXisMoOgQIHLA4IdzDrajGJkpQEfxat+jWj+WEtBVlZvhAaTJKE
	SA/TeBwsBCOpUQn1+m+hyP6s1QThpTHb/9L8lTXxIajTuoZYHKOgra8/1oUaTfE6Zpfxhim
	++0FVu85vPQflAMqeVkkHAFjwSj7LyNnRWNJOg6mo8GjdGygYCy6dg/rhfYpG1uU/7/lhgD
	R0UMsKblfRv0uHqaYmimiJt/dj4XGWFf2ppeqQgw==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
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
2.49.0


