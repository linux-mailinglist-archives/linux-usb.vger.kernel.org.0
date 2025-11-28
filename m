Return-Path: <linux-usb+bounces-31026-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C6BC9093A
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 03:07:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE0623ABC51
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 02:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF202BEFE3;
	Fri, 28 Nov 2025 02:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="T0t9OvmM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE24B2BD033;
	Fri, 28 Nov 2025 02:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764295506; cv=none; b=BH6Bo2RT9q6vh08XlEsSgkrFT4oWUVEaOEkJJYnkLmdVJK3qqAPettgNRFVFUpBRhj4z4Ne6yCbBJWm+6G4H7JWZ4eGoW0rxdKhdBvnp0F1t2EVGPoVxdu1Xx1y3r7Coq03fnqbV8xRjOiOsBXjhuVuX3eJ5e84UAHMyevI2d0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764295506; c=relaxed/simple;
	bh=xQWi5hMui5VLl4tahRe1U8Mp6lrTVfX1Yy/sdF1ONzs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=DB+ACBDtqMVdmd8lKXpxaCmrcfhISfrWqMbra3e2xTS6urfZHJgVQQ5ADVCrXFUpeYve1f8B6jBVUmg3D5rXdyZFdepVq0yBuibZlN9P0LDFeykYzc2GVY5KfitEqyFLTYBE+t3Dhzh61S4CqQICZjmMYaqovlm1Zg1/GAEZ6Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=T0t9OvmM; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764295489;
	bh=BnSe20UyFWhCBwFpCZUGVdKqrQwY3y7cLZdXieRNPhI=;
	h=From:To:Subject:Date:Message-Id;
	b=T0t9OvmMUqBtEwAvvUhzYMLmfWvjQu/tzU3qKCeMUeNQqqQEH6UZh8A4wypyOmoZr
	 YFsI9RA+hcMix2onDbjy+Jqfu5imPFcUmw+pnYIKFAg8yFiMIDxQr7X0MNnoABrdMR
	 jMOCBbbgRLCzrNRu8255hzqKZgruUK1vAh45en9c=
X-QQ-mid: esmtpsz21t1764295487t4741a73c
X-QQ-Originating-IP: fhy5DRa5i3V80+bUs3WYZGySAtuFFVaE7fm+ADYYEpQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Nov 2025 10:04:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8450163399619758520
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
Subject: [PATCH v11 07/11] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Date: Fri, 28 Nov 2025 10:04:01 +0800
Message-Id: <20251128020405.90-8-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251128020405.90-1-kernel@airkyi.com>
References: <20251128020405.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OVAgSpUT8SOPmEhyO6J5+fThtJjN+nYzEnmNLyi7HEPRphkMBq3TRE1g
	NHqJmkmtzowc97G7nTuc1ZtrL8LLeFzcQRLqxv8hp+qBakY4MpDZH5h2jO401TX8TsKdwYC
	PjwcFq2Dw92yRiVkxxuql3rSiacXI7gxZ4vV3zVgh6H3EjWNoF8bTFJj5RHroKfoEyXAJk2
	o8vjVrChj8XyiSQZZCWEVpYMYvk/HfdOQunsONIWAxydUrbEoTZCw6H9UcD8ZlXB3wozKgm
	RIKYPl+y4cEXlN4MXZlqQSLT+At0Jfo6gq9nYvvqpVSR5KILRTkObMk5kFtxqPbOQiHVYNX
	PMVbAAncnrc7kpdRdopGCCsjT/wy1QF/p8fvP+cYIHuRbVkYxLl+D3aauEaiBK/W/A/PUf3
	uPsgxC8/kR17jbIFIubMZ5wDTrQuyLqBYafQl8WRaTg9esoKow/e6zwbDXb3VjYjAQFhGqu
	cG+Xi+ea3al+kFjuJjGYy979VWdL/ExPj+TZlJvdg31yDhDAXapHWboJ+TPROB4e5kdvCbe
	wXsi1YkIFoTnG5zjwbSJNzLVjXFNnr3uZQoneZv6L5dGIG0xf8u/mJFuqjTHqjfpDjZBIVw
	lkrheDru7IcUhIsH2V4H4GHciyetZ4XsbKcJ4qGhtEzxHJVu2CD9rvEcyQpXYe/+iNceSrE
	ALqDzml0MbxP2DUs7vtPCdGc82TGD0ulaXNvwzGy2JDVjVzIy1lb8Aq7E2r3ZFil9nEEV0c
	KWMaaayWL5SIqeJR6u2JfzsU64AeVRbeIlM25hn94d+PcgmAKB4BA91AQFmViKJzwvLGQo9
	JugsEhQSDb15soN5X1FSuIgFa0FZwyqOk3XhRMv0OOxjBehdROtxbl2Onzoea7pvRabPrYJ
	R1ovJ/RbYD/R8diL5OKXwC3HCt1H+Ng1XjR45DYbmJPBPon0U7vJYi8M4inhB2CbyL/qxdc
	DAS9K6QCoTTTDsIZsAKvoM4Z4JY/sciA1+OTjzbWTc9sToYXe3+zz3/g5DgXuXHwPAm1lhZ
	kqKRhdTvkOlz4xxt8MlwXxmLi/BTYIDkev7qu2qQ==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
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


