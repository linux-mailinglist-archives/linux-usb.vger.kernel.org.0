Return-Path: <linux-usb+bounces-31029-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCDEC9095B
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 03:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6FC07351709
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 02:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C003C1F239B;
	Fri, 28 Nov 2025 02:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="VLuZD4jY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41431E9919;
	Fri, 28 Nov 2025 02:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764295598; cv=none; b=izDHsNfXRFF9aQMYzcEAg7T3hLq1hhaPt06XBqM7HCAvhgKf8t6ud2W5TiMt6/PkMSJWkLOTrWpLa/C9EiJdYd5Hl+AvMAaOyAnlzLFFlqprfsBzvNKNSOWWHWHkgy9NXj5R5hXoJjrp2F0rwkUsXVfvvj5hyp5N9YonfJqvMbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764295598; c=relaxed/simple;
	bh=UYBXRUGpsPucbSnyCek2T6kQGAmNcIEArFxOg+A85iE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=EsT45WlbyuIwDaqf5aQ9uYFsZsF+rnT+gj6qRtYCaj7oycWX8Q2daTYi/4TadPB9U+kKAkAqigDooe3hfIDDd/u26h98vMcUqRm7oQ4BUdJ/KNItLQxCx7Va8RW+OJr8gts9DXHWGIHfsnrTv5f1XDltCaEpbpHwXJdhXobbD/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=VLuZD4jY; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764295586;
	bh=pFI7M+6j2JewnD4BwkGRc0QPG+RPFm6rGXiCORxPrVE=;
	h=From:To:Subject:Date:Message-Id;
	b=VLuZD4jYQ94cUbqZU4R6/FSzj96jJ3tOpjPrzV3j51Goy5r7hMj5JOQzVDo3vhSUc
	 MN+U9G9N37eMSsLMFkUipJgpEN4ZSJu+rwzJEDVnBcKZVEe1HSf85Y8gff3aT8MXaW
	 1kHkLyhZ9dNP2C0pczT22SevXsq8f4C7bqDc2yDM=
X-QQ-mid: esmtpsz21t1764295500te85580f9
X-QQ-Originating-IP: mJI2PEDtqc428+UDr15mULFM3tVFMG2XEZtF0eDz1FM=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Nov 2025 10:04:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17121756573935767410
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
Subject: [PATCH v11 10/11] arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
Date: Fri, 28 Nov 2025 10:04:04 +0800
Message-Id: <20251128020405.90-11-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251128020405.90-1-kernel@airkyi.com>
References: <20251128020405.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: No4GWyI4cWt60uvdy4BnzznIuSs/tjiJfmQiyb4dP5sUhU5D6up4huJl
	oVbeQz6Tbx2kA2CtJeO1ZbL0iE/ZHy+NCpmfmBiJtuF1Wa3CsCb3h48FvyWuZhw/A4KESNJ
	Qsox2ppkR6bzGE1p5G/iv7J2QJ+cXnMS0oqKBDc2jtf878ovaTwin9ZH8+GqyxE5p9QSOfN
	ghseIhEwfyiIkMwN9FCq1fu8J4kBzhHr/eSMY2pAGww7NZD/vzs0y+BjWa8lPMGjriiogLO
	vegrxVQsHgcST5bPfTrtz1o5TFDOyGN7IHMeSU0NHIWJSA6uD2UvBahLuOosPeLTrs9NhWs
	8xc5yS5UIQzAGoxjdJqaW0FwALA2ybi0QjnpHPuScmiw4TI8D0/Q6hz8IV7M/bUuONmDpau
	MVWVtpwwFw9TAGhYHIfMKFoRfyM4v+aU0JoMhv/AGXWTWcMGakQ27TCLu1b02XFHiDy7UyJ
	oDaOmb7ntGfeL7BSq6fig78SSkFs8D7tT2L83vYDFuB6SpQ2z05WpZqiVwlgzC94K4nfh3i
	hiYm9BwCJ1kiQu+X/FmxoEbE0cqaUvHSw3SiBqhwndXf1SxgS/+lpshFwKEwq9Z9nXfX4UH
	IzZOWhkwxiKN6GOb7rHM0KGmH9oN7fZ+bl+3F8umR49wqTinhKy20NW4YBvLbIgAOlY3GIC
	b5rzu6xxScKE7x0hic44IfA0fV9XasGb0kebWLRLM2xzP/KrQk8NVS0uwmXB3jcklr/tgdJ
	HQCQCxUIRTZcxrLCYziyVS3BTNSsqLDo2P11tHNF9FFuIB6250AT71qbpxrn193pB4hP4fY
	nszXVFmkOl8mPiO9S/jgQO2QsoRMKQsb4FmDvLqRpiD27/Tb0Es6PfXJO5zg/l5ecRRCdFY
	ubx3HM5caFjzvUYujjA+Zn+K9S3ZuUM3QlInNepDBtaT56bVk3ThrQ8QMcOtt3eRlWaveLr
	g8DU6rGvy1JjMAoki8wX9yvdb66hrczmOemUG8YE68CspUj7sFvEKGrA9bxdSprStVrMJ7r
	ReSnTtE/ql8QMrPeTB
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
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


