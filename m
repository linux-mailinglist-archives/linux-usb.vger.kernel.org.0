Return-Path: <linux-usb+bounces-32473-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BE0D39FF7
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 08:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AE0D3043978
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 07:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F101E0B86;
	Mon, 19 Jan 2026 07:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="flSsfzdH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE4E3358D6;
	Mon, 19 Jan 2026 07:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768807920; cv=none; b=WkRrkdfsmaWogrmV7O4UfHQhkHUEbd+IIbuBqIXsIxYsvHJ+hCRhgqoQGFXIFK1ZVILW/BwLMdbQrqY+9wDm5mPWIAh9cVKOMf2ussyUca93OheG0BKni8X9w6xSC1yH+WZ2zLiANClPlKBL7wUREoVeVMHYRdzi9PDgtDDdlcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768807920; c=relaxed/simple;
	bh=yNNivodlTIieW/Vd3vihN5C8kuvtirtl4pr8GWh/M90=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=aA4IaKoog7tAXvPnmRa7MZSCP+GO7W4XFoduRRp+JkCL7j6nDjPck0qwn8dJvqoO7qAqQWr5RwKRL6117A0nOPLXbfIbLiPNZBSuTHxiKmPXbCJa5FY4A9165lKTskBhNdb5zOOw+7QPczl2NHxlXCMWEZH58MkDiaGfgcp0IBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=flSsfzdH; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1768807895;
	bh=Js8LohQ5FKnKhCP/1X+pjHvtWvmL3//jFEdtasdSj/c=;
	h=From:To:Subject:Date:Message-Id;
	b=flSsfzdHeKHEQi+hdnykBXqvGQvWZCYiA+N9dwoL5ql+3qL7KU8tcMTjuSSeOxSNq
	 lpa7Gjd20MQcVRgXamrimyJtz/uDxWrGmdzB/jNzNHQBfI44QAd4PleStl4fawGve5
	 n4+t3YjIZ0+vaUjRwbeG/H6fKXlWX7YM/kDinJBc=
X-QQ-mid: esmtpsz17t1768807894t2b9d6dd4
X-QQ-Originating-IP: AqKRKbAHcm84t5Ai8LOV/Z1hHzoNbpXZnvn4/yP/VCg=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jan 2026 15:31:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14299818678048633841
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
Subject: [PATCH v14 3/9] dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
Date: Mon, 19 Jan 2026 15:30:54 +0800
Message-Id: <20260119073100.143-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260119073100.143-1-kernel@airkyi.com>
References: <20260119073100.143-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OE2SNMSfMbmOirWZKivO9hs+BxhHJG6Jpwluo23f2loh3fKcTmX567pE
	CJk4kAWJlw2yKegl+zAUHAiMsVlKfb2flQnVYkbAWnTkL6/STzBa+OXsiEBGIxH4f6rMLk8
	5BgLfOUzy1mqECD7lVMUS0rf0TkBlz7EY/scXiMD740YwZdjriOFMvGrxPlX+wvsJHa16WC
	K0ZTwSdseJmiwTCFcaHAiirPY70J9Kry6j3K3zeZWZPuLebjbTeqUe1GpjuWo+OYh5AKtcu
	LDtoIOrmVolGOwUrpWCH6FLnx+Uun7e+BYDHNOjkHqlotLZURJdOEeRbXu/jOQ/jufPCdTF
	+/3LpX8VA9opmTcIZO0pIyMJTvGmb21uzT39IecRCtK3PEpWKDbg0CsghXJbz/NGkByCB4O
	E0Rl1g3W56j2BvlXoRN+YOTN1JEDTLmV+2Lwp8OUu0JyHaefaCDWKrAH0DI6t61dP+MdCi9
	efkboxy5WQqnTaddc5VK+Qm6UNfu5DkveknN6VFxOsRjOJ/1+GakYYHKuDDHqTWuLEv2OqR
	6aoAxO2Bzd1imEVlvYaEOJzOiYI7Wv2txF1q1gdC04f5unK+yv5NrEeTDFIwjdetNkR+eKa
	zazFJuv7gKRY3frSeMYTrR6P57gXzXAWcMqmEy18MokSQk9Ho2Qsi0ap0wxAHoZ+3rPpVFY
	egRDLTdYwSyrsODJIS1URgVfWQZtyThNVtB/BLENBXZsjHa4R89/lYhx6ZNQgG8tOmLoqtB
	+auVsrgNBWtSRV1dQet9qxko+wgQM+o51kfOOMooJWfSaq1rkFNAClNuGbKf9xz4/OWa2hS
	VZfWsv/Y2tIj4rCdhmUMeCUzjYpEHkvZ2CaHyl/oG9D92L3XxkooIG3qQ57Ux3og8MOq54l
	W9oCAaWNVE9V1xft9SNKKwDVZ1aK1pRytdjNmXYbba24TRri3xq1UsjNLHR5+JKGHK6A7Oc
	ByOKLy+Rzs0ocMz/Dk0OvX2og6Eytt1kLlbZVrKVShZnh+GhlvF64PhB6twfh6iveBzB6U0
	XnzY3H5AsaJnz3rNKEJQxaiXcWdjMp1b/4M5sTCg==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
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
---

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


