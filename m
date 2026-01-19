Return-Path: <linux-usb+bounces-32478-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A06D39FF2
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 08:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 04F5B300D2B5
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 07:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4633375CB;
	Mon, 19 Jan 2026 07:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="m0+VERdE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FA133033B;
	Mon, 19 Jan 2026 07:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768807961; cv=none; b=OLneiP6h41+ZFYTbGsW41yd4I+PPPht1R94YJPPeLTDFZ8vwkcPUwN4WmMy9Kb2UU2b4eBjGCNQK+sASBSKdwKEymOdKBvuBdtuFo5Eky1Tp4ArusLhEYi0ftMANgALYcOCkLY9hIdw2N6dRxFHyTJvfMBB1pVHz1WA0hSMPjxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768807961; c=relaxed/simple;
	bh=4YalIBUlKCSuqLKMYj8QW21cucOEQ0PxecICR8IYRKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=b1WPs5QVU0RSB9Nlu/ST+f0bquQRI+qR5VJPW9RY70JskzPA4xQky2BOlqWhFb94AsdYUoVoIh/3sGf1uxBIWsrZYJnPELtty97yESPa1ldM8+UGzcy9EBrTvo2ZVWkHob4137naFDqhnjqpPButjwT5NZ2ebcnQwkNntTsqkbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=m0+VERdE; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1768807941;
	bh=6RKYrl9uKKYeoPLwxT7m43ODsBqPn7Ulx0XyJQsA0lM=;
	h=From:To:Subject:Date:Message-Id;
	b=m0+VERdEZM6EZ4VXwKxHdkutXvYXh0i86jixhGzmeNofFppwD87p1h23h+92MhTu7
	 wmANYB4hSWh5PqdIBlvfl2kQ/jbcCKOObLU2dqHQzgW2eDnE1vO2accU0zQlb1O9+f
	 tLggGOtOLAtVPmk3/5BvnrL2TUhzaRhZpTJs9+lQ=
X-QQ-mid: esmtpsz17t1768807939t4e3bec3b
X-QQ-Originating-IP: A7VIZcKkSbUgehWQYkOQDZdSzfyBv0nlR5sBVFW6EVM=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jan 2026 15:32:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6769309788427873216
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
Subject: [PATCH v14 8/9] arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
Date: Mon, 19 Jan 2026 15:30:59 +0800
Message-Id: <20260119073100.143-9-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260119073100.143-1-kernel@airkyi.com>
References: <20260119073100.143-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NYz8c2bcbB9MwYPtkRmeV685CCQEbaHYbdVAlNW1i8mIqEI9wr5ymJFH
	i2U8PqeMY3EYrAvElS/FSB+OttyIva5bAt7/oIx8ueqifTFJWVOUFHZx2u3OAtEqpO7hXvV
	8FlmEbSFBcfKb3q7bX3+YEx3NQ537AickZKpqNtupsh+wqqKcLzZJLbEifq3PYRsYGGfTQg
	KDa6KG0JM1KSHTRKMgeeSH/Y3477gqk4k5EdijIJAbJ6UVq5PdaV3btHCFmVPJ9Hb3BnwI0
	iRD5cIgQ1UpwX4f7ZV04ahml3LNtc9vPv0EU9oI7S+zGYezsz25p34tOIf+0z9hZc2zggcT
	MHMSB3bFjqb5uwkCfGRY4enPNe2+iLynz53/Ap9TPBWfTZ/eI9V0jf/pPKHsAmRc/++5PYH
	gWMUQeHoLp/IswS5Mq39f3X4afvNUU4bUz88qd5oJHEKczDDJ1Kd4FRRo5GLiHN28RK46bA
	GZJrfUOdbkwwxJCBTPZm1gR30Ejiqh9kEk1hP+CWqro2YETCNGa/2nu4jstI+kCLrGSNkuf
	gunWRMMA+jN06+QmcONlJDYhuzlAG4yro/3tfTUR5XfFBMF08kJXtFJEfKJuv7PVHE20KPM
	aGpf4vvrYQnqulKLJrYLxxC4uy3dae0fXz+DY2ItOA2bICK4jDB5PBV69FORjyj5xkjPoKZ
	IkfNE8WYeak1CQ1ohfztehnoPdQtePTlGEVBV+y5ivBopzb0LuFfLI1h6OuZ8sE9JJ8Szht
	5K8uEaHPJuFMVK0sMPs+zSNRsdsRDaGlCY2Ha8imFFPPpKsAkTaj2/KbrAewMnVEuZJR2ug
	Ke+u3vY5v/L8gUQp6ySxzZLUezgePjqzKmJG46M3p61dKq1qHnxdx/xxxM0Lt9j+itA1H36
	3xgT9KHr+czixhXJ2N+TIoW0gxB3dBQDopUV4GaxGT0P6U4eOtycwmwvGEzMUkugr5L1DAv
	F06N6/uf91E/xy2wku5s1e7ylUERLWqsXooEc7LdV6FpSG6JOcoLB8CwON0v2sTCJ6BDnPy
	luj6GXIoX18vYJHyHsPFcchD8rZd5FCi8rXS6zxA==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Let's make the ports nodes of cdn_dp in the same style as the other
display interface, and match the style of ports's yaml.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

(no changes since v5)

Changes in v4:
- Remove unnecessary #address/#size-cells

(no changes since v1)
---

 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
index 4dcceb9136b7..93b42820998f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
@@ -618,7 +618,11 @@ cdn_dp: dp@fec00000 {
 		status = "disabled";
 
 		ports {
-			dp_in: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dp_in: port@0 {
+				reg = <0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -632,6 +636,10 @@ dp_in_vopl: endpoint@1 {
 					remote-endpoint = <&vopl_out_dp>;
 				};
 			};
+
+			dp_out: port@1 {
+				reg = <1>;
+			};
 		};
 	};
 
-- 
2.51.1


