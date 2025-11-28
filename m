Return-Path: <linux-usb+bounces-31024-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BE180C90922
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 03:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 151703514BA
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 02:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E24F4288C22;
	Fri, 28 Nov 2025 02:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="DjYtqe7D"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4D0285058;
	Fri, 28 Nov 2025 02:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764295496; cv=none; b=qXFBPHCN4+eGNCJHnT6KBcLadm5NVxct5wQ3VlefmdLFq2F3o1iHaqtTgjbPJIyWhLR80kIc1ez3wbk6UGabRObaKJEKAWRZqBddho1HxaxN7+rX4XIZ3jYf6Sg2mlYDfMoJYLaIgoZfCPEqHf5ArzkmjTwL22D5qoJF3lMc1S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764295496; c=relaxed/simple;
	bh=PZVWV9La4AVAK585StcPgOtfdN1ZVMCq4aFPpEmKQzo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=rjSFnTL5+QqucNek3IZFVO76Rrba+9bdy6JhgQRnjqmCSoRmtYozCVx6K3GIkBIkZOEvIfHKyOkWQV8Wsxx6bVqBcaD3XrrmBndPQYCifSEXI4Gu43LWRycFA6hzz2jA0LElChbPbo8w2kcyhFntIj2h+xpzTqhcxyUNLSOJEEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=DjYtqe7D; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764295480;
	bh=26BNys9MtzTfRweLMQzeXqwDzhVXLyZIh9kJ9w6YpoA=;
	h=From:To:Subject:Date:Message-Id;
	b=DjYtqe7D0buzgYFw/xseIC1dvpLo1U7ghMeFaHYc+QcLASX4RwJ0xghtpvQH84wsq
	 x2UwaasNQPKE9sdL92yovkOcpZSaP3jX4/BZPS8tDN+PHv/NdS/IvhQ8371iXY2TIT
	 GOmQ+RT04vgU+sN0L35Q1i4BS+wlssOneZ+rJ8lY=
X-QQ-mid: esmtpsz21t1764295479tb524af5a
X-QQ-Originating-IP: oW3x0e+rLKqddHu0SO/doGFIJJO2dWUv1ai7nKLeCMM=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Nov 2025 10:04:36 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5493829236187501795
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
Subject: [PATCH v11 05/11] dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
Date: Fri, 28 Nov 2025 10:03:59 +0800
Message-Id: <20251128020405.90-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251128020405.90-1-kernel@airkyi.com>
References: <20251128020405.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NGbyafB8Lluu9jcwbxcdxRy4qRLqlDKdfHtmx1FfSmkyT5h78FxbpPv/
	6IkwGBqV4Q9UVFPUFBKbXxka6kMDKeouci1pNWZ6AK6p4LygtTa4YEgHwKMAtLGxlfKPLRP
	4pnaa0JxijAFJm0ApKQzHJR+pwUD/IWeKmW2SbJy7E5peRVqYTbOsP8mpYvq3MWOVGqPBOi
	67OnwW/zSKU1uL/M+nD+6Qz5Cn2Qqfew1lrd38h+Nf6DDo0bI8adZ4nDZHePsFgzoaB4wtW
	o3WWwiCcgdSoMtURPTkpYT/2EgSukTlmBjQK9kzJQhWLxofrfjdj0E5YQWCtByvVHUTryWx
	2pr/jdLCoigJ26JEAhUnkP0tDGLMJ4Cif3tsjEwwXZHTx+rr8G9s7EHJUQM3fgvU7itY3dZ
	FYC9kGULS5l5mDA9AgMZyrm6xEy1j4BjFFGhul8OFKin3NWWroXzPvgwst+39JYCh8Yg8jj
	RdiA37FAPY1JbjwGk4KfZkxjLpFoejBw0KycCpU8xeQ04aja1LE3xrKh7R7PYRgg+ukfTGs
	Z1SsmIO5XbCtzV/aX+A0K1PsGKalFxH3rXGu5CwBqAl48+xRnimdNPAEWMl7Fy9L+3qeRGq
	KRja8h/m0dyUrjSpbU6tXD8gYqOqTfNzRGrIOEjitsaBkuLLHE9Lo73clPVOZ58QhOnF0DU
	OJZzdDmfb4jcnlgipjrV/QnUrmHywMfUUJWOgKoKpPLyxqzd/r3FbfSYm88B9MNYqDNEVj0
	kME55kak70fB4O+dPKar59qrrFyBBemhcjuU6tDM3mDcMgzF5v0fSCdd36Z2CKuhXKnkp7Y
	f+cyMl9BtQ2u3mpjk4pXp705a0Q3I6fd/0tMavO8qqV8SNExUJ7x1oSJ70ALWKRTNMG32zI
	q2byO+SFwBDB7wKq859CV+wEOiYEbzATqtsnXBn+7D6WFlEhDg80RGhmkot+OguKto1PHyi
	qFhELjdRCRO+6G6Q+xP7QtTSqNcqShJVtASDl2pXlB/lirU+HXfqxbyHLwKFiUaqZcbr8uJ
	Upebxu2YS57EegmEMeQ/1CYvGJgALFlDb1vOelMA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
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


