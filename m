Return-Path: <linux-usb+bounces-31150-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D243CA28A0
	for <lists+linux-usb@lfdr.de>; Thu, 04 Dec 2025 07:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F28D930AE14C
	for <lists+linux-usb@lfdr.de>; Thu,  4 Dec 2025 06:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B172FFFAB;
	Thu,  4 Dec 2025 06:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="Jiwrht1g"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EE82DEA9B;
	Thu,  4 Dec 2025 06:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764829928; cv=none; b=FrVt66gHYTel/bT5/vriZOgdfrc1yCRyPA0whBBye/bym2kmVi0y3dcK1qdKgCG3IC1Jl84zgSlVcQzx+UCvzbnBHuJY2BpYdeSSHmBCRJ18ZZwZYSX8lNTQw72cmP+NuhaXBJvKuSiBBGY8Vjr+E7kjmpJj/QxiSXyXvGgBxgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764829928; c=relaxed/simple;
	bh=xQWi5hMui5VLl4tahRe1U8Mp6lrTVfX1Yy/sdF1ONzs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=VZardyGu+SI7MJnyNIZjf6/UtEDBVD+NUkcsO7vVmElCqJGBK2Huu8r/Hfjk7MpJtgHuBFdmjblH8dUf/QcQhhQh842a28fCU8nrhXXD3lMBE1gkwVchPKvYSUj5PbYlquPOq/RWicrCy3cqeU7/PIfAY2FEe8WHp0ixciQVkdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=Jiwrht1g; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764829911;
	bh=BnSe20UyFWhCBwFpCZUGVdKqrQwY3y7cLZdXieRNPhI=;
	h=From:To:Subject:Date:Message-Id;
	b=Jiwrht1gbOU9UUMYYKAydlzJSi03cZUmpqTNrH7TREoajNExRSmHl0tq62xyEG2ll
	 w01s7R4/swFkl8p9t0AEPFJFXatdaP56UWW+uf1B/khh3uYXZxfCgIVyJWg4tn+U58
	 iTk9v7zWKF4xv/lLJIRgEdiFhdYllu6umWdPDQ7k=
X-QQ-mid: esmtpsz21t1764829909tf9c29147
X-QQ-Originating-IP: ri8pxnHeVrvX5Aweq2BV2L+rsyB/OuhYBi1DnKi64pY=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 04 Dec 2025 14:31:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15495658624198146204
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
Subject: [RESEND PATCH v11 07/11] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Date: Thu,  4 Dec 2025 14:31:05 +0800
Message-Id: <20251204063109.104-8-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251204063109.104-1-kernel@airkyi.com>
References: <20251204063109.104-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OW8nL0XA5Gqlj/HFG8aEONmr+A+bVf7CPps6aOCco25xv76XKZu0c9U8
	SC0R5Eq79HNBOaVhHXV+Zob3ynF+cAlRqZOyRFmMjjgVnX3a/ZkwC5W1ZIebC/CY9c50Bye
	WebTMID3EIGl4yxVZYSF3kKL2A93BnI0Usb7Pq8f53x4lgQM84vtD0p+KX78U7XP2WkjZr7
	H5oN5HouSVNX3Rpm8bsBH++um7XTbeKZZx3ilOnCPyFX+OL/HjGjUgEPPdhxvRKf4+2u2WL
	RC3qdA+XVu5gvwuA49yiaZqpH7rmGP9ID4hE4xWkZd1PnKBJvC0B9mduBp3sQ4Whqpqzcqg
	PgzkmWE75YuxpYcNYZRfYfwoIRasU6ff4hqGK1kN4MnhsaQTJNz0sW7zcZZSrBsdzK7Ocl9
	1ig5j81AfLizAAEznq9plePgEvxAgaDmM0gI4PLwtArbqSf/gdztMb6OX2t/7HNnCk6Ve1i
	rCQtVqETv9NiKCoEbit5xzRNnG3qbrxP3jclDSHRNTIGvlfRAWwGySFFH93KTJs1Q2DK17Q
	MM2cwQOX7auBgo11h0r9nO4SJHWxLT4fCiTQIOZtykCoP19/gsBPZOUw35UspmKt9HA/eXI
	9cogyjsWqqpAwMF6dx1Pv4PhkTxkCt5n0omBJ123TdNzid/uHqJXrDQVDh751StwZqdVUlp
	mI30qnLebs4/qaHI1MIgOb/O3RTdAYdbprnoRLhkatn0SDT8eDVLehCHxUQM2RIhBltVuZD
	GsQN7cwGZPVTLE7hWSnRHo0RXjYRVDHrulx+LQHi139LCWfglPPIDGa5yLdoxjvkjKTkoxo
	/yDS8NspTQBDGDVnw3zj7fifCzw36ZVSle9hOiSApOhoBfdoQ7o1sBcpRpA9g+EqvGPaHEd
	tc/ieH2mAyuA4hQ74WZiTlDVmyOeAIa8WQcpMWUeXf6U6DArwGkFdpm4gI28re8B0veQJ21
	oV/C99OlvcKNx0Vrf45mS+O0i4yUnOrq/8pLvticLlpyzVZgxwK5Q8q8WuhCDAMi+LHXf9t
	raQXIuKbY9BxzJ/ARSjjTSLUKwlH0=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
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


