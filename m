Return-Path: <linux-usb+bounces-30761-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D859DC71D54
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 03:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 392CC3517D5
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 02:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24BC2D0C9F;
	Thu, 20 Nov 2025 02:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="mzLDUlMH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB79C2E1C65;
	Thu, 20 Nov 2025 02:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763605467; cv=none; b=gYd09DVUOqqqNtIQx73I84o/7pqHT8dci4us+utGij+3Ov8OSejgNVS7+IuQzeiCGCnXL+s89wzo98qP0on+01YaU+GZP3IbodVtzj0/0CneeWv7rLGH5ws70WkKlJ8jL7gmRxS7RQelxnQHql7lVvOCzvek0TifUIw6BtyuKXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763605467; c=relaxed/simple;
	bh=PZVWV9La4AVAK585StcPgOtfdN1ZVMCq4aFPpEmKQzo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=b59DrPAtho9JQx5rIxIrYzvkObyxONUCHauSRUYw3Glj0cGlyjOzMedjEbSV5DR//pPljZzNFsikm/fQsZ4kf2168+RPR6RHHwDY6IhA8kcvc5jr5y9TuGifMYHBjrdYq8vIgk8HUPwqZWPADSltLsu1HLE67dT02jjnUxDlWqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=mzLDUlMH; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1763605455;
	bh=26BNys9MtzTfRweLMQzeXqwDzhVXLyZIh9kJ9w6YpoA=;
	h=From:To:Subject:Date:Message-Id;
	b=mzLDUlMHkH2XQbNViN5w9YUFUehKIex60zmI+ubNGAViFScnQU66WCaHL1GqWdeN8
	 Cczfx4GwwVHPg7GMQBx3ZijP3vinqzneAh0+dqrKuJQHv5ZTpwhBF3UBaBK2VXBXGc
	 y2DzIW4JlMglqObexfbysUlvZ5CzSrVaS8Yq7h5Q=
X-QQ-mid: zesmtpsz5t1763605453t2f8b4143
X-QQ-Originating-IP: gN54Olypo3pIwlMUyr2ea9GcV0PMJO+w5anSEboDf2s=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 20 Nov 2025 10:24:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15843998276639765348
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
Subject: [PATCH v10 05/11] dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
Date: Thu, 20 Nov 2025 10:23:37 +0800
Message-Id: <20251120022343.250-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251120022343.250-1-kernel@airkyi.com>
References: <20251120022343.250-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NYz8c2bcbB9MQnNn3zMpWCw2p695Ot7QFwH/flvWex9RbogN4LmQMMi3
	bC06sfaBKt7eyPTixuyKW8Tc/QMs8UghDlkgaMJzgUX4KvNGRg871hGT/4BsbRsDmUE4JgL
	W0evNhLD8GAFZ0CBvwVNv3736bcEI4p5r0eFnxlDjfQK/h9wpY7A5Vzv+Jm0ZAngtSuDmoY
	07wJxkjI/LjMQgVVSblu0Mn0m6V2TG3KQJhf15TGgt3dhFUGOxehkmiSaVHbQASIuTsD2hN
	n6Uq1e2m6lHC8a3mugOA4MnFekc/Jb10IwLaEcowKKM8PFuwSPvYN3i9IAETdoUMUhLVNwq
	QbklMA8myybjkL0KMvoz7rw3sax8H6VpD6bAkCkFXNabpjzxiG97pOleU7bmp7VEA5Fhw/t
	1HDPr6CXgM4lkrlIgF5cgnmRsjXRGNRnOhRX6F5sdEmxQMV7M/J57Wz/XTtQTQSOd07JF6D
	Db3hozY8MjSO45jtclWrx39ln8Ivd+4MBu8/6Tj7JmIUOeOiFNxZ5LiK8szj+Fe4SDZf+NR
	dQg/VzAcA/jY2jOMqMS4tQ9AF86LLkaKFJSFm3wx/5oCDw3Ra9iMME5Cq0n029W6jew+H3a
	C344GmZ8cMuyvUOI2B1wW+GbO1+W3PEpfaB+QcHua6vHOGRHI2L0g4FBZCrrBWUBg+/dYSw
	lnuZzSMP6EEOrmgeFK9xL0K4WiPt27fhZbtzOM1IsyZRAcpKj4xPf9GeAa53W5oIYxPWKel
	bT1s6Gpa6jyUuTijv0PUm0X0ZoE8EKzUH9dWkYFXFJXmg/liX1EXzhabCgVp0lrpk4q877v
	YrjofvAxE7q2tiAqnerHFe8cpxxmcEu7+bE7JRP+Bh2p31pi80OvKSEu+b48xt1RhgCM+xG
	gHzGXaKKGOqTYb0RFGi0PUZ1+5DZbp/ldr62ZreiWinCFJQKCEcqxH1a57Z58zgOWYIFR/B
	6KjbpvUU82tCOnP9sWHyUOgh6fkN9yc/8TOe1MF20Yj742b9DwKedWmiaz+e3hg6M7USbIe
	9GFd2oVnYDruKUUvj+K2woRgNCsf8lDo55yLG9zA==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
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


