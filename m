Return-Path: <linux-usb+bounces-31254-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E95BCCABC3F
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 02:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86956302EFC9
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 01:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846EC256C8D;
	Mon,  8 Dec 2025 01:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="m5OfjLA/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B3623D7FF;
	Mon,  8 Dec 2025 01:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765158945; cv=none; b=oQG2tgD3mWtUFlb+Zrgu2c/eeCdaeht1M0GLNq+hox0Gk9jiBMyvkRwFIlW6w/kM2dnyEqsCuU1kZBLFM+fJkLoc4KY2g6fIpZeZJp6Ys+bwJ2BKhD9jC56ABQnH2AVuDUm/KdY0qMc2MqO2Bb29yrN5RoBEVLy/+Jp/2xF5wW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765158945; c=relaxed/simple;
	bh=PZVWV9La4AVAK585StcPgOtfdN1ZVMCq4aFPpEmKQzo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=DKpWQoewtFJmGHDJsoYiVQk6dP5v8uOjrwD4jyIkBAqfaW4HdCvoWM4JF/40hynDsnoGuGlS6jxjsI9ma3RCJxzPIn5A1z/rc/phTWQis4eQv5QsWUcVtjwsRHY/WyZ/f6m0AYNrW4ZZ2shLsjY3B0YmsEh0cK5D+yz6ycqe/6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=m5OfjLA/; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1765158934;
	bh=26BNys9MtzTfRweLMQzeXqwDzhVXLyZIh9kJ9w6YpoA=;
	h=From:To:Subject:Date:Message-Id;
	b=m5OfjLA/w4B0AgiE+5kPJ+F7EcQ7/5Hpu3r+VrFtmG3K7mtbhNa5gIpKTxVU5H0km
	 L3MQbu5j12ZvoveBAefKlffdyoDbJDRizA0yVk8MpVNKTjXs4uR+jHT9layYD3MIPL
	 Pp/5f9psdNDlET0PXRC289Clh71rknZS/YSGfxX8=
X-QQ-mid: esmtpsz19t1765158932t5038dae8
X-QQ-Originating-IP: A0v0FaGYKIPVoze7Vm4qC1xZ0nc+XoFwr/1hG633FZU=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Dec 2025 09:55:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5449390531767649988
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
Subject: [PATCH v13 05/11] dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
Date: Mon,  8 Dec 2025 09:54:54 +0800
Message-Id: <20251208015500.94-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251208015500.94-1-kernel@airkyi.com>
References: <20251208015500.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OI6yGjxefbMXXkTMtD3zx1Sj4oI5QEq6y+G3d9voC+VOEcjgF38xCtot
	Zg28QG9UlPWuMumU9AD+8R04Htr184efaWYEr5zMeTZQq4tHFk6pH1OizaaIwM60EnY+k/P
	+WQznx0DiL7z716YbjpnXnfgpGRcUeV2hSHHUOv1FhJ3nSUWo9bVLd30CT/f8KeW+5A1t1m
	0H/5z/0uNXAyY1gvx0s7pCiP6hAXxUoeYapDE4TSscrFfksj4EcfBGBQBsZufrDqANFXJO9
	+iwvl8clS9u3uY4m7Hq0M4v4Pe7ZGLLXGxZXNX9Ij6WUUAx2D/OF8CsmoqB2jWUc1RHxocx
	MShqoOfcLhleUjh6wRucP0uoHITNjCs9/U71o6+eeUMJij7W+LqzAlHmIyUPCgkcHToiE7a
	B3Tul7UlVy+sxTypozisDU7azcB4aJczUNAqi+8KXLLJ8GGuRCfpOpro9r0UflaFzsO8+mk
	W4J04TnZpSbhgrrVDJ0oMC5b+Y5UuiaSi+uBYauUN1qpd/3O13WurySrIyMNG6i1wZSacn4
	x63hPs79RRWE3QxxKGPT+GPnvNuT/CLasrzKQHRSA+kjRVqgylAV7L+AH1J+tadrg7FDwYD
	WDjwMA6JofZgKD+bt4KxwqPjiKTwLYi6tQjXVIYKfBPaai+ktDcDfacKNE4/5wRvGUL/xv2
	cmcWeRyPLdD6ps9CmTpnnjtY7DvsamaznccKfib9HteLYFUpjd16bxDwAERLOET34iWykD4
	uH+6iU9LM1Ul1ILgZGDK59xg+EfaFe36H884yBjnF9bODrqd/HQinWog4xNCP2duDO7Z5Bd
	mByuJb+PEheiSC6Q4ByMpYPYvCd6j8i8uvPg+KCGXm6tcJpQjP/sa6gkoaAQIYCCFMNt0hU
	iRE0JE+/2IJ7bJL2zCmSGinKcy0Y5EQlrWPIhAjZzSsDBdbjdEvI9IbLlfiLfbRAaoGWD1h
	jJ5iQ8k5OJSYviLfQwlFeWKEwIid/DjcT3UOodWpBYsSQ34myUN/qcRZROLyANdaOBvMZbq
	vuM4f+7Q==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The RK3399 SoC integrates two USB/DP combo PHYs, each of which
supports software-configurable pin mapping and DisplayPort lane
assignment. These capabilities enable the PHY itself to handle both
mode switching and orientation switching, based on the Type-C plug
orientation and USB PD negotiation results.

While an external Type-C controller is still required to detect cable
attachment and report USB PD events, the actual mode and orientation
switching is performed internally by the PHY through software
configuration. This allows the PHY to act as a Type-C multiplexer for
both data role and DP altmode configuration.

To reflect this hardware design, this patch introduces a new
"mode-switch" property for the dp-port node in the device tree bindings.
This property indicates that the connected PHY is capable of handling
Type-C mode switching itself.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

(no changes since v5)

Changes in v4:
- Remove "|" in description.

Changes in v3:
- Add more descriptions to clarify the role of the PHY in switching.

Changes in v2:
- Reuse dp-port/usb3-port in rk3399-typec-phy binding.

 .../devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
index 91c011f68cd0..83ebcde096ea 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
@@ -51,6 +51,12 @@ properties:
       '#phy-cells':
         const: 0
 
+      mode-switch:
+        description:
+          Indicates the PHY can handle altmode switching. In this case,
+          requires an external USB Type-C controller to report USB PD message.
+        type: boolean
+
       port:
         $ref: /schemas/graph.yaml#/properties/port
         description: Connection to USB Type-C connector
-- 
2.51.1


