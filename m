Return-Path: <linux-usb+bounces-33963-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNJJIM3+p2nUnAAAu9opvQ
	(envelope-from <linux-usb+bounces-33963-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 10:43:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C491FDC8D
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 10:43:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DEDDC304CA5C
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 09:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED923914F0;
	Wed,  4 Mar 2026 09:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="VbB6or+z"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E3139D6FD;
	Wed,  4 Mar 2026 09:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772617408; cv=none; b=I0rWrB3Rl3e+jYoSkBrV0Aj3BalzlI4EcGzWF4xZwZhCcjuXS0gXldo3eUFrn7vq4AWaEkHJU4OqIQ1c/2RzCk+BPRvdcd67aOxs3BKjEIPYc+pl47Ix/RvubA7ilGTaYaa9TScoSoY415KklC43P+JSHhAaFWIKJlskdyNvw2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772617408; c=relaxed/simple;
	bh=PFaJSo44CFzbK0ZXM4EX8zDefFrJAyK83Tu4AAPXASU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=JhvXUakTMMrkeK/aHMcpAj5fmxoe8GpfmAjQLHQmhmCo8XLX30pF0AnNrceJzE09wCOi9t79D/tTldBLZVpxsI8B5qeykuprn1YODHHmFlNULiretlJ1eUvJQdNJyZe0oj9fktHFszoetzfrCavjbul1TlE/RjvrWMLjN+ufBic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=VbB6or+z; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1772617376;
	bh=mTE8GiUrUtEaTT4O+e4/NPc8OEJgo20N+GCnBt48BNo=;
	h=From:To:Subject:Date:Message-Id;
	b=VbB6or+zkphasYQ6BWpM1Cr4CHmq6+3Uk4oEVC8wknPYovGmwimJohi55NYVwOvOZ
	 SBg+KY3lPSBW6a/gzFwV84oAgSJwkaR0o1XESvl2JNcylGKuHkD+iWAjUTKTxMOini
	 6BDpUMSnEBAUWXNKfbUuzJSe0g1jUyqbhxmC3Vtw=
X-QQ-mid: esmtpsz11t1772617367t6a485561
X-QQ-Originating-IP: wnFhN3y/CVaFd3oZl+UUZ+u/q8iXNTDJlcnj0ij4IvY=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Mar 2026 17:42:36 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16598838826590519856
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
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	Hugh Cole-Baker <sigmaris@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v15 5/9] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Date: Wed,  4 Mar 2026 17:41:48 +0800
Message-Id: <20260304094152.92-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260304094152.92-1-kernel@airkyi.com>
References: <20260304094152.92-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M/AyZGld0ICWcN8koWVVgm23LB65HfhCMIiKAVjX/zTNob1/Kg68EdM2
	ChC6+y/7/+AIfvZOBJ9MgJwSDlYDkY66LsR81BZ3/USd1gOzh0EG5ogw+inyxDUOgfZwH1D
	aureJYj9BvZXyV4JFzCydvC/vAzvN0e6cNfdts0idlheb/cJjmp77Pm7F20gxAXRDV7YaWl
	1mp0RmiA6XmYpM600LNuXW5ukxJ+2BSFwB0oLEyMBlp4y/rtGggukKzhVARdaUUxOXWPFoE
	MBF8l3biwFuYbbl4p88JtRy7HiwJTC6Fh0T5zehlgpbDJMAJXt2V2stDjMqrcwXvrV5F/j/
	99SEwgdW0msq13HYKwQ3mVODpHXW7C+2dsSVAoOHvRvw7EJNcXMb7h2/pgKJSiuL9EqE2Lv
	3PXDdFI+lE4xRAe50x/etae1MxQh1XJ0yM6ttZ3A3BJhMHba9fgkc694+16FriQdTwT/WJa
	2GoQ8FnHrA3sXT4k0c+s9uu4azGtDkjkSWbSynyF3cZYKB4ADtpr+VIVv5stU9CAkRaSQh0
	qPycjCUZ0Kwk+hcsDMn8fA1Fo4Sm2CmdE8Dso8rywcNqeENARas9RrP+9Y3Tj2PuOJ/Sbv/
	/uOwq5EtxUShQEOhOwcnmaVvsreWs65VRn1P76y29wVB/pLS2xQaXPwTXTc1OwC9aRzxK0+
	m6lzvT08XKIOTMul+A3H3iJJnMnXSyraaxqNRIERkWg82fxVlM4Dzgre8Vgz9jLxUAiVvUo
	yk7RU+rVovdcYytBuUgsWuVID6c8mJSK6EgQLjCnE5AfGjAUK//O2JLsBA2a6xSTsM12/k8
	sMv+82Cn+QTKeRkpc+ahVRazqRUf6VFA9Z3hZXYOH2CFm/QRQR9ArXMK0Min7TuqN2xlXMC
	6s3as8IEUWxIXd8Q+Z+McGi04SXbgrjqPhrIKCIsrdIA0sYf2ph/B16b3i/F8dGzoA9xPzr
	aVrXC3OrxiIWAdtxCsG7MAGb9EtOUYvJNVCMhHZylxmIXgowsYte/rg7BKlyIBrc00HlVBF
	Rf2fdrft2OWXMyxP9GvDzd1lG82+o=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 28C491FDC8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[airkyi.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[airkyi.com:s=altu2504];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33963-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[40];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,linuxfoundation.org,oss.qualcomm.com,gmail.com,bootlin.com,kernel.org,sntech.de,rock-chips.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,suse.de,ffwll.ch,google.com,manjaro.org,cknow.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[airkyi.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kernel@airkyi.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[airkyi.com:dkim,airkyi.com:mid,rock-chips.com:email,linaro.org:email]
X-Rspamd-Action: no action

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


