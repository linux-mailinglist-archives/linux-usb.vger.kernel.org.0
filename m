Return-Path: <linux-usb+bounces-29824-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2A2C189F9
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 08:16:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1BE11AA460E
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 07:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A169830F556;
	Wed, 29 Oct 2025 07:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="ZP0potWU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2905329E10C;
	Wed, 29 Oct 2025 07:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761722111; cv=none; b=g66uJf0aLAjvY00Ph6rZuOiL8U2nF2yFIz/fw2dWw7SMfViblLygEIsNKOhOIvy0cMVREJZbJ3AsbzqXFJKAGHw1DIgEaCkSce8tXSB5865OpuLzKS3w0Y3BR/8C3YZTA6DleeIVEy7WXnt2e/iAKpS7sAap3OvjPtZZQp3JF+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761722111; c=relaxed/simple;
	bh=JkC2n3cUcgwqX4mM3+Lhi39ig/OE1/fWWocxtgBRO8k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=VAyDChnk+RiUINdD9UVWg7acTS6/xTF2WXNmZjfyXDM7UTkWqNLsyVTZQTXN1Mp4dkzUzYe3VbFFQTWqnESJnZnAkysiXmx0eLFqYIkr9g0rXOeaMxqnDNIq2GXVIdcf5nDNnj+iwxXd0cVlybXhXIsOnAXobAufUp6MQr05J9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=ZP0potWU; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1761722105;
	bh=YHT4Mxhe+zSodIVHd2qzlGnysBWHBxMufel41tGudBs=;
	h=From:To:Subject:Date:Message-Id;
	b=ZP0potWUGEJJnJlGR0dpTvyFnp+9HW5m8eBLSzghIm1BMioCwhr99HXC/coVmaCMa
	 HtxkBOqqvDRRNkXj5VRArWuZhbBD+Jo1Ueb0oNmyEFWCq952svOf6Aj4RSiDA+p4up
	 R3Lk3O7boUzjw4hYgDYBWUnWT7qvtPl0A06J1Adg=
X-QQ-mid: zesmtpsz6t1761722103tee7fa66f
X-QQ-Originating-IP: Ik7AVVI+4BnZaf1rl0zVbH4aG4jaNbSh2N+2iERqELk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Oct 2025 15:15:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6689497526499472264
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
Subject: [PATCH v8 04/10] dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
Date: Wed, 29 Oct 2025 15:14:29 +0800
Message-Id: <20251029071435.88-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251029071435.88-1-kernel@airkyi.com>
References: <20251029071435.88-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MfPMy1ku+mnZBddHcFI414y5/iImlOmf3soke2mSFLtgsK0SrNeXWgkS
	bkx91z9dsgwbJKJScmHQelUCnd6oAHZ8Ib8QWscnGdPzhBDGsNfzcMBXst4/MF4t7VuB2Jy
	ErVmfLOUoJYQfDBSIa3E8EiCiqxRMy5h6MdhMeilIqNa0n83NJrZEvRcxwLJ7Ahtc0aVoqH
	CA5VHKYuANWKvn6ltCDtQ42X9rDRdmSe0VpUwFWfw+xlromCi/jSfeV3csUP5w0iw9Nxg0a
	KsxHYJOre6Qq0telrfsGo4scLrcKV9uui8xAsq1Q9MHFm8Xm6JYf/m3KLI1ry3iVhRhSA7L
	fH2sXmFP6ULIGt3+zH+sTqh+BwYAujlAKQbKTmTirWowbwNMOEkRDU70/6KnZ1edU2HSPE2
	9nMP9DAi4fx+Qv+Xo/PegZ9c+6+JvwCKoJNDn0lq6AhzzY76OFVxS8p/3nW2DT3+w4xCyWD
	1sonRDcC/+XfFQYcdZHc6o1MSkEPMtuaB8M1pCELYy8SETYnLeV8ryKWmlKPBPFeG9uVu3P
	vmzJo2sxk+HOqVzyPVplgw2VnOr5iYdjnwnkQAFzBAr25NDNyu+rSatJyx6VzYnfLnPiC3R
	TIr5BPNF2LgAEYkJOKt2DdFRHtTNnShK7HH/Q2qzF9w1hiiIfKpqA/Wq3RHch4Wt5TrnyDi
	DvAcB9in4eElt7c3AOsNkfpEMYSSt7ySKWfmptvFr0zp8/MRBLa7HI4frDI2spun8K1Ylj+
	FCSD95sd/Z8OzneSHLdM0DsPM9JcOPVCoOvm+rMfVh3BAmGgWkTXoWPwpDS9KYqcdDI1sl0
	n0iPcT4NfKzVX3+qXuR3/jqK290Q7X+AJxiIyi4Cy/P8Z5zHPKCE+i+1x/JEraw+J4CoNFt
	J48wrbNumNj+RZxUsLIWYRWoK28od1ZVMKtQKwONxGGljPIiULY5Fcg3N8FQ2wZg8jXagXG
	usG5epOxxYgTrZ5+CqPdFXZmY8UmHKKTLzebQsfuto9YKp6vyDGJf983YfpUZCoAxNGzXje
	0WWS18LQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
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


