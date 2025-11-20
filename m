Return-Path: <linux-usb+bounces-30765-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B44C71D6E
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 03:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 235E93519DB
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 02:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0772F0C6B;
	Thu, 20 Nov 2025 02:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="sy5Cjjgr"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FEA2EE262;
	Thu, 20 Nov 2025 02:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763605495; cv=none; b=aZvvHwYIuDqWapqAMZDsfsC+mtD9d+PUkmOmDz2i4r3fSUiEWjjjmnEC03bBrYvk+TOGZhU6209DBuCeo7sk5Jm0Rn9uOBVypkIuKwbZZMPWxyIs2jFv5rZJvk6tWIY6wnFk3pAvUg/muOcxRPBaKV1mwgFQXZ3Oc7X1P2ye3Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763605495; c=relaxed/simple;
	bh=ktQe0TBZJXNabRClR1zK2GRlgnwznm7iN6OWZIxNePg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=QZ9PFZS2ONV9npPEuna1TZ3Qke7ObIk0dKGdHgdKz3R6ZNLkHSXoL4WCJEu+BS7lmofCalgAoqnxhvXtRkvNMZ5rezvT2OwCTzvVQ0J+SMv3lACIGHexg0lCv1Fn5HanOVUzjjfMGFyg23VanSwoBc5F2v0xigfC9sswCjuYKMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=sy5Cjjgr; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1763605467;
	bh=sEWMlrnina66f1mkg7MgIF551DMwzRk8lseSsYVXv/E=;
	h=From:To:Subject:Date:Message-Id;
	b=sy5CjjgrRSNoz6JzGri3hB9unDsictcalzEIdNvBczLpmMV5G9YehsFi5a1/e6zwU
	 bW/a2r+n9WFMRgd1wZxqky/ZQaVEXITaGmLBfzVcgL8bmujUjSywG1SqxRWPXUHhba
	 btODpMfkP8+1xwf20yisWioL6R8GvHbMj5uHJB4Y=
X-QQ-mid: zesmtpsz5t1763605466t8c66b672
X-QQ-Originating-IP: S+B8JF/DgVa037R2Bl9AzL46KN0sWhmzCpkklai7gIY=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 20 Nov 2025 10:24:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7295887295416375369
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
Subject: [PATCH v10 08/11] drm/rockchip: cdn-dp: Support handle lane info without extcon
Date: Thu, 20 Nov 2025 10:23:40 +0800
Message-Id: <20251120022343.250-9-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251120022343.250-1-kernel@airkyi.com>
References: <20251120022343.250-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OeWvpHj3+EsSv9xKSW9oV9p5r8GBzeR9vIm5VImmWF6yGAt3LbCq426G
	ppUy96u931h3x2kVEMra0ALyE1vaNFyitlqb2fkHZ4Gkhk2kaJOhJxLA9+KhOAgiCEoPHZf
	QF39ScXWBpAjYvvE0o/zEX047OQNRRrlZrHzXyyR+4Vu/378MoHtAmkV1kbglHuURAhunp7
	KYMMN8T+WHQot8jlauhI0fP/kWS+UfLoEH7E2UtIiL/qCRy8/BAIim1G4q2bjSLkCUWwSPI
	6+BlUXcYm/W+C4eblRv/7St9HPfmZFe1ZPJFqvlR+A6hhFFlwJ76inmN514lZZdtK/aiN9A
	BG8zrdYBq7pafFY6bhvI7wZmsy4qkfCN9zZ3ruOaH3DhAQLnJcnXHOMm25Qqq0anPS+pCYI
	VyLNOO+bo5uHOcJlw2gqpTRUmTdEwoR+NeXHHZymCkSjNNT4F0rXCegRvvczkXjqh41wts0
	YSi2E6nkagkR2D3k6yLSFJ9f0dtNY+rRiQILy7VLL1kpXQL0UKSlgOEJb3Txr4bpgey/Af5
	h5hiRfZ6vE5WZLPL5L3gNbiciyIQPHQ0EQsaeMJyOcM3586XhJChOdGPgcq5bJDiqhfZTJT
	4uGEg/Evb8nJVqtdaY3Oe1ktC6kNTLjU11pPNU5p7NVqb1UMjX3X0PBDMNLABvE79kzWPQk
	vSUlrRB/XXgpdvw3czUeBLvJVdyIZl6R5aUNZX9549ES4JyuagN7JDdKx4zsH/vtDTQnlnf
	Ugz4z0wtaBfLIL7JzsO4hIwUst3EniUouYR/uyzHx/vBr6HMvksFfvVjUcd09dQ2N2inv4L
	QdjjRGF/2YzIx9skd/a5vqCrWAwjM47c/6MQnxuc+0hM0vQxHsV6laZBzF2kY9Px0820tHg
	IEDSXAwJMkZwPoZWRYGW8Pk5h+5bdMnJYy4Ar0YmIPKK3i8n0Pr0sY5EmF8Og/wkOjxNiyr
	dsN8eDzb0TPK8zwh+nFqC71Rt+dQlvAQUZ8q/4n2uwVV7vOQsn8vuUSCAbE6NVSv9E3/TPW
	f9RBCG4G2Rw2GGEcNDe9lV6YDNj+k=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
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


