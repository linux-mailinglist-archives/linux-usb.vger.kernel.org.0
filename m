Return-Path: <linux-usb+bounces-29547-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B02BFEFF3
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 05:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3DAB74EAFC5
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 03:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34614289E17;
	Thu, 23 Oct 2025 03:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="lyMJKUIv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FD5286897;
	Thu, 23 Oct 2025 03:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761190252; cv=none; b=hOrx6yyqxF2AVQT8rRarbqbW9F+RzhPbsZ8vMjvd9bYTqA5JXseiEIFN1+sHwVPqkbCAOyEGLlPdguqQWFUD1dsrRdDxUnGQF5YHr1RonqeZxE0NoSLbnxG1k2AuB29DkiwYfNDEIfac1P7G9ybZHESMAVlaZi1GaQ7XWjEJ6QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761190252; c=relaxed/simple;
	bh=JkC2n3cUcgwqX4mM3+Lhi39ig/OE1/fWWocxtgBRO8k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ZSO0l0We5mfqJWINNQfqYIPcdA28O72KlPfKDx77NlQVExHnblIDfJQXnZdccjNSr1gVuL4z8d6QZIiDUXeJXR5WvtgzyPpVbb0NpM61Fso10wv3+UvaHZVoSsMjyGrCFS6vOCvhka3aWUjZIBsxlWGU2ITJZ6BqYDOdGnq3t9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=lyMJKUIv; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1761190238;
	bh=YHT4Mxhe+zSodIVHd2qzlGnysBWHBxMufel41tGudBs=;
	h=From:To:Subject:Date:Message-Id;
	b=lyMJKUIv/Qx2CC50WnCYCHr/AsHK7/RoGhlq+rIz1XJpmNWGc847ct1N9ztq4AvP9
	 fKsCuD9JzTTPtaIStHF2gVRg72tXypDUwICeDzQBTeNsSyH+7KVBjFnzvFhqEerIrH
	 Vx8S1LvgxwQFwdJbhi27zaCnV3Nlk27UQGAX6lcE=
X-QQ-mid: esmtpsz16t1761190237tbfdb6da7
X-QQ-Originating-IP: mQbiV5TvA+6VNgwYEj2mZ26rSyqpwRzXYdmUfICKqpw=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Oct 2025 11:30:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8877655953729844497
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
Subject: [PATCH v7 3/9] dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
Date: Thu, 23 Oct 2025 11:30:03 +0800
Message-Id: <20251023033009.90-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251023033009.90-1-kernel@airkyi.com>
References: <20251023033009.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NOc1LUZ0GKQa3KhKs0ZBpKZ7NRxrNimcoGg1hWOw5ei5y4ODT0rNDeCU
	Xn5TBJMqwx3IQCaftxDjYynTz5rR6oIZ+i2g4gjlV1ZzuXKCROVLBVFoqGXO62k+wFzRhYY
	sK6Qgzcy8+x3lTz6ocNTfGUrAuDJwwn73NII5PaF25wcJoRd4GdTPgCIc49ER6Ok/DJwk9L
	Wy0twOTdRMz+0NGfiMNfRu+lEAPcKpX+6Qx1UWL8PjRJiXAibRGtHUTD1E1rYdUNKHy6su8
	e9SVYrUsV8uwL+GPgSP7q4D2ao0C4mCMnLZ3F9zwWLxE4a5C3qPz0o8VieU4pqcywr5p1NA
	VHB7rTaiIik0oYC+XHb//fuFv14X8Zf7ADQN/pas0EfFVCwCmLcLZizScqW1vG7VwaBYnPC
	wSqtT4EmbkQzxKdQx+Q3+Z8pzkYQTT5wTrsTyeU5HYRNeIHGzrghmTiy4cO1jZEAZfq3Vef
	Dy2ub8xBVqiARbnkHLByY9q3W0GLOgkTPgCRsLQHSqBNYix5jXwb3OaLhrV4D23HeykraSQ
	RlDoTptms1r8P8D/OBf9xQOSp4Eo6kB0GWgdEKkYsmWNCBLv6uhHDcea+FHdeiKk18fvGi2
	1+OdLfr5zlIvm+LJSK4NAykC2J4jgGaTNUfsp9GoA7VK/8HT0CVNIBETDqMXpcMs8Ale19V
	biFGbaAxELXtmqsd5QW3z2yoCnVj2hqMkWU04d2SuoLXO7/1lUvIZm0zicSnd3CY003Jkun
	6A/k0o2qQbxUVAsG098HvEXDg1j1TWnkoNUcakAOCmOIlFhy2pNvue0nOOzAK4X1xb3/EeW
	YBeD+OmHkhN1U3tLMXVhtBZI6ijakPeyxorzAkpxZE22HCrSrRktSzQdJWDlrrDMjwUS0m/
	bUB0CxXgM+2dLJGqwdpIDDkCXNhULGhoMKsynrKQyF6xfLn8UGIfq3DXpp0Gq3RFzEFa3fh
	cSOofJ9jZGEbQW2nU2c7JpR4697hA3eGv66W4nkzkpy0E/lJLbfHzwybpuX6mBl7fdDHEcN
	abqPL2cA==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
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
2.49.0


