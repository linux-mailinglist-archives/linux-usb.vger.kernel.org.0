Return-Path: <linux-usb+bounces-30767-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DD900C71D87
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 03:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9E7CD4E4566
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 02:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F322F2900;
	Thu, 20 Nov 2025 02:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="tfGrBUuO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD231898F8;
	Thu, 20 Nov 2025 02:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763605529; cv=none; b=gH1X83YpjtThjfC7AME6RP8M+v6cRVVZaxxolLTLB93Ov5D+Atc6zujRsEfOpDzqUpPcpSxQLOGRHHQhObetYZNIO+D8sEszsvWd9u/6r41C82ri10Hna8LlX0bKVE4NPbat5KDX4KwypY8GElqBNy9YyAJn/iALuil/08kwMTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763605529; c=relaxed/simple;
	bh=UYBXRUGpsPucbSnyCek2T6kQGAmNcIEArFxOg+A85iE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Nn6NI0TKrJJ7D3/9YAxD/mWjaC9tHEeMtBy2YCM+TCPOMjS3rFVTjMCUnLqxyASGCz738cJA2dGzhvRp4pWNzjCw9FMJKd73FbW+gyCqljRP5MJeq50Xdl0yU/pi0PE4GWogCPS676xo8Db7BMPx6Ws6CCQzi6xy1hxERADDdyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=tfGrBUuO; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1763605510;
	bh=pFI7M+6j2JewnD4BwkGRc0QPG+RPFm6rGXiCORxPrVE=;
	h=From:To:Subject:Date:Message-Id;
	b=tfGrBUuOPJUpco1zu8sRceRMdZYvazPZBusbEgRCReSDyRXj8OgVXIzCSc8AZxZyM
	 2JFiu2PZYV1+vxiFmrl+bB4SwukwZDOz6bZEH0o0X0D6Gp6+WbgBmtqiaJUx2YlIYr
	 xl1fR9h8A8RjjLfrkAkEXp7YouT6ezH9wj0UEsBw=
X-QQ-mid: zesmtpsz5t1763605475t5758b803
X-QQ-Originating-IP: pDz7EWZhJzQQujm3af9e2JLj4n12gmSAhoVFGhYNXPk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 20 Nov 2025 10:24:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15460230959253220818
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
Subject: [PATCH v10 10/11] arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
Date: Thu, 20 Nov 2025 10:23:42 +0800
Message-Id: <20251120022343.250-11-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251120022343.250-1-kernel@airkyi.com>
References: <20251120022343.250-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MqN/FiDJuNHiNw/y4jqC1wkFSVC+iexlgRuQzGNsdwHXRvigQHUiqJ6z
	siW+grUV+gBOojILOLb4eb0YIH4IoJhymUG1ZO/rMZ9K/HUWq0RK6l0qF9WTq+weccZRUo5
	DkdgnInz16HephMQ/cwRW4zIyuCYoSUiTZZNTaJEaoV9Zk2OLADZjST/3X5lwrNWmHf92QY
	P2pHHqhAqoebst7TRqLtUOrFvxduKS7Z9qs/+dnJpvQVzmhy+CAk8xhYgTpSUIZXJ3N6QIy
	Z7VzzGO1T/MJkgb9dz8XqVC4CwFINhQtnusm/l33inzZDwGYG0fzfd3DaM+JaZiXLCh3bHA
	7jW7iHagprJrlJiKFGt4ByyfsLWAC6JBwsVqkn4dXJEoECeMnL2zjQtKcQOHnD8xD05SBXp
	LE5jjNn2qbStAR57G2L7SEbusjXgMrJcAY/nLf6hLUMTbgELlfGGU/Ekox4/o1cpp96IkEz
	ORkC+zWMc9c+8ucXtfiWRVvt78VUnakqS+H8pM7NoymBONn6WcR2QPf4/B4NnRY4jL7dpkz
	SuJoBd6Xig6Dj4ePgSPsPGypPKE0z7nPcIku/ecouZbkry1XlFtEeFVlZr7YkKyk0yTdCJD
	yQsM1xpOlMHstytibVt75C8Zhtw4N2V0XlXNZm9lkdXHE0q0Qkml3CBVXllN3NR1N8PyBnB
	K2qyDAL7rIvY/KAB4BG45AdontOs6Ezgp+l6JYvthAGDPOI8vXo/uM7U0VV9+j+HlhmNyCJ
	I4kHuRv2TV1hkHcwFPXzJ9y7Vc7Zesibkyd5hiS50Wd120K1pJsOTLNriD8tiigAq+8itKK
	vXeJyU8lZx39Zofg12WjZOxeF825SGACRapHSbfw+uaJ0w5zrovO7yyaqRMp7bBeG8AdFL4
	aZvnjEOZ0KsH8dYZxNJ97tDI9cqCOXOPQXw0e/jmB3bOpgIrBlm4Zg7BagDvcFIVJFF0V8/
	1RaQMZQqpdDyzteBwiKGWP8cwctPb56yAPYU0KE2TKxtNXHk2WknLjYMWyQjzHPe08lBlu2
	r4KoXiDkGItH5uspkJ
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
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


