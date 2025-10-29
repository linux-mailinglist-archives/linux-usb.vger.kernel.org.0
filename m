Return-Path: <linux-usb+bounces-29829-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C49E4C18A23
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 08:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41B511C84AED
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 07:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA9830F93A;
	Wed, 29 Oct 2025 07:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="kL5uI8/l"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1347E2EAB6E;
	Wed, 29 Oct 2025 07:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761722135; cv=none; b=ZPt8dlKfGv6iejj/BishYv/cjdJ6gxeB1Y2ooYIizONW6jtyVsgKwbQeHbC3Hzoiu6iGKPuu1+XGzD89RhALYPo6TDGWyShaM0ueQyItpZluAyg/PeyPFng8fNtRKjSaKXmAJaiPlIsxhU0Dem/kYSmP08ZXZJAUd0ZvIES6FaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761722135; c=relaxed/simple;
	bh=M4nUEX7h4FeSk6XVEQszUpUpBE3mjUtZPXnyDXgdiFI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=nbubsgVEQHYejV/MfeFaYNYntErOmVYTXwHv3/SIAzszDLyR5htLSQgKzZeHQqVbvdcSj4iznhqOA5l1JHF9bloxLMIGdzCKc8+l6VS+8/5fUrk9tbvmSCL014mMdXUfD0VRAa9SpH3OMziTANl36hC9GMhvHFi7+d3/9y6Rg3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=kL5uI8/l; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1761722121;
	bh=nQG0w7dhU7Aew5bKV30plkPn0nBnVdgTnfwSbxYLntU=;
	h=From:To:Subject:Date:Message-Id;
	b=kL5uI8/lTx+iL+xyOPTtiqHtxM49QpNMQckdTaCCK2C9jKcCHMclMf272p7XIrKTT
	 Rb4Ny5vaxEqj85biYC8Cw1P1okZVg//3e14Q7E79Z5iMbflK8AdGJt4AgS1HJKp1x+
	 0VOWxV5DwUR6FBbhDKTg0Lhg1sxLkOyZrkixxBbc=
X-QQ-mid: zesmtpsz6t1761722120tb092f96d
X-QQ-Originating-IP: IvyddLy9KbD2cvJM24xB9IzAVzZki3T5MpHuel05bj4=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Oct 2025 15:15:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2981954368563909056
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
Subject: [PATCH v8 07/10] drm/rockchip: cdn-dp: Support handle lane info without extcon
Date: Wed, 29 Oct 2025 15:14:32 +0800
Message-Id: <20251029071435.88-8-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251029071435.88-1-kernel@airkyi.com>
References: <20251029071435.88-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NnBlO8MsmACrRff/5IWYDaL08j8BdvDsD8GUTjmSJNz82004yPmrNhUj
	9muvxY2750j1jDPyIFh2G0v+ixWm3vON2+3hofwfMCdPcVuZZlk+jPIL2VI2rMbPScZwGW4
	z28E4qt4pzo4cBkSl7fUes53mll7mhyPIkg2MmGXINpfmEw8Y24D70IsDgIzWBETizloA0L
	pDSJA0BaEJE/zYeD4kTqaJY0Y3qzXOV8YIZp228a9a0g+5+5r5kCwdZ2IihKs58X+oFskvy
	EmFVlsPdN6KPWgwM0lG9N5lOdiP+sHngu1QmrRy8yEyfH6u/O5tAIOUxNDAEzrTxWInU2EI
	ituO4EnLbXSP1p1cbQ8IZ1tUSiHgJMfEN6kDljSKS+EWYzKLKJo/5usOvD0XNUHgVkA1Z7C
	BTP0Xu7OjbU28p8TUKn1Sl5qzDmc5erUEjJ+aguGdrFdrdnPVwJcZ7RJLsqmjiPmptpcyK7
	UAxnbGxFtpMdXrWqJpzh3l6AFVspqGdbweGy2mkNX5ZrAwNtsz1QFfqw/lcDOkIBMphFjTF
	rv2Y5oUpzK6R+9O8kJlGYox3lnSb/oVLQwsFSWv4s4vRUcOOpnCjxCGkCkK/4O/AZdtQRUN
	0Wj3iAGsp5UgL+TYUO04eQ8aVJuVIYqd9+GO62GYElYEb7wR65gqEaXv589ydIh0E5CLFim
	FhAlZyA0gGInN+4bfgAtKAK8UC8NiGqEo9yoittUwTnegz+eTa63Sz8KU3CpYyCxs4/dSA4
	AoEKkpsGBsbuYHqTsI192ZDHJIjWXlZp/o0KX1DMcdCTiufQdVym4GnwolIAg2HBZaEwWCx
	rVV99I5mxiPrrc9BZwqPNZ2vXsKXxzYJdBOLgUqeENbNAExuaRkB8Q3cFTG94DFXwb7Wxiy
	pLb2t3jD6PfzR2cAkbsyL+Xh1QOBJN+hbLFPpnAfNxVa66T+VXW62Odh6FFqHzovg+fLyOG
	y9520tCvH0a0x/On+UM4pqBYYJ8qJPqbUHkhpNc9zpNV/TTlug8ScvPAlvoc08MW9k/3KtJ
	TGPrGFpDY1fbibQdPvG/IlLrDq1kmYmSs6RZrhuw==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
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


