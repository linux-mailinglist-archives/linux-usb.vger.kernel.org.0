Return-Path: <linux-usb+bounces-29821-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D69C189C6
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 08:15:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACBF13BF43E
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 07:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264CB30CDA2;
	Wed, 29 Oct 2025 07:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="sTitdwx3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924402E62A4;
	Wed, 29 Oct 2025 07:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761722094; cv=none; b=CYwiDhPo+4e1DdPxBwxxTRt67QfBb+c0sJg+1sHzdd5Rdi9LbuaAzVz1oz9/GunnyduLwTy/0n73Qc0rdbzIab4FGP2Csq/bSx2pD/FT2E06W++nuUDdT/N8vTuf2ABRrKWjiKnL++lFnU2JFHPrv+1OHPfoKcc28afjzp0GT7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761722094; c=relaxed/simple;
	bh=GYIuLXqZf240u12ydTOg+OVzJwqUwtS9FXkBF5P/lQs=;
	h=From:To:Cc:Subject:Date:Message-Id; b=G6dk0LbIfk9sI3Zj2GbkMZuYj2ZFXOYtfnXWcWqDSLkpxZoqD6H/JyU2408Fib1XLok3nF9IadLN4JkIIFUsNScd38sw1XAvONPaOO0mDreaM/nuBJ7OpBgzfxJ1G94O4lOLOf/o8XTSG3TLWE52qUXO2LIbaWI37bxwkIQn8WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=sTitdwx3; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1761722086;
	bh=vUs9PR5MkDE2TnuVElj67uBgDlTWsKMlCHyA7Lz2m9s=;
	h=From:To:Subject:Date:Message-Id;
	b=sTitdwx3ApamWfnKuLQZl4+EDCcUZLRO383IoN8uT5ZyCNTIeXkyN0y5ezM5RU2BS
	 9qSjHP0haAFSy1eUm7g0RV9tMJjEKGaTDm30uI6GSH5XLki1UtU4ImacD0YAu9Aoru
	 ilh7dedR7kaWfgirchqU85BLpfGWe7zbUicdXMGk=
X-QQ-mid: zesmtpsz6t1761722083t694185fa
X-QQ-Originating-IP: 5iuWasjHrqOKTZt0yGG1gdnMzF9J085MTFN9CJrLEEA=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Oct 2025 15:14:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18349792753202563132
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
Subject: [PATCH v8 00/10] Add Type-C DP support for RK3399 EVB IND board
Date: Wed, 29 Oct 2025 15:14:25 +0800
Message-Id: <20251029071435.88-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MZ9X7MyfBLblIoi9hIZLojGLP7mu+oTAFV2E3CEfRx6b9tY5UIhil4Vp
	k73eQYSDOARF8HAwgZ3+b9+Ozq7eZ/8jQrGklXYhJtvRSzgiElivuVYNjfQg7H3Xy2bA6CD
	vPdOTgXzT6Q6X0kquRbmbHKAEX5MeDpjQ2q7ARJ1pRW6Dqg3aHz5dbUnBniV51bVZBijDou
	dGoAKdknhIeKfh14lksDv6UW+gDri0jQpT/WI9Iv4otsibH0NS46D65F9Jf1eRAj94lDlHa
	wW0W/s14ip1Dnzx+qdE6Il4Ban/NcofwKvKJpntp3eP1NLomOtMrA8K1/+hcaOHecYq5k8w
	Wu+7yuI8XWYu3ugAAbEz401UEtFO+5LPyKyGleDG0ImH0wAyZGasYkIV3B78Dln2/U52dly
	sMPloEFay4l8oOHCuuZiRB8UjH6c49H4rXEU1LlWuVoU/+oR6x4bA/BPXGTIKqpGzy0iD9G
	Un+cX3eAhEkL+nU0Ym59zvU9dbriSxGLvdmbDiLMXhV5SfyJ3AjFhjJUCtfN1nxKcrPErfT
	QM9KVfdsKSCe+X0KRcLFzYiovSSlE67Wf0p+Q57OSNNShPgoOpSo7rdLDVYkI1AUkhFSeoj
	VYazZzoz2pc6PoqTUWp+H+bBJvg5qG0v4DfOPzKv2HI0el2vJBFn9tP2sCpRxYA6qhiwgZ7
	0tE+LUFNJOwH3FQtPYzPwvI6vwS3DOsYLngtVZU5dnVum50EBbLDtPSnJQmUXmdWTiElS8E
	PmIVtSZpp6gnCOxTZxr/x/8YBlBz3r03EMP45HnMqJ544kbX5UJOIEtQaBC2qFawjQXoARd
	m85rwrrUd+oKo2ZJ1P+PsPIS3FNwS5gNJ6lHtAXTLNg25YtC8hi1mmaavffWm1J0ql42Ad6
	KHS2fMksfZRikLQbNbNzQOZYXl66BQMhu6x3AHAzcZFoZURQZIZRStkF25RsYzBerIolwyc
	XypBuQRJesPbSYsKXec0yCbWJgpAA5VpiPmfDAbK0ufLpuWph3TU446bP
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

This series focuses on adding Type-C DP support for USBDP PHY and DP
driver. The USBDP PHY and DP will perceive the changes in cable status
based on the USB PD and Type-C state machines provided by TCPM. Before
this, the USBDP PHY and DP controller of RK3399 sensed cable state
changes through extcon, and devices such as the RK3399 Gru-Chromebook
rely on them. This series should not break them.

====
1. DisplayPort HPD status notify

Before v7, I implemented a variety of DP HPD status notify. However,
they all had various problems and it was difficult to become a generic
solution.

Under the guidance of Heikki and Dmitry, a decoupled notification
method between the TypeC and DRM subsystems was introduced in v7.
First, a notification is sent when TypeC registers a new altmode.
Then, a generic DP AUX HPD bridge is implemented on the DRM side.

That makes it redundant for each Type-C controller driver to implement
a similar DP AUX HPD bridge in embedded scenarios.

====
2. Altmode switching and orientation switching for USBDP PHY

For USB Type-C interfaces, an external Type-C controller chip assists
by detecting cable attachment, determining plug orientation, and
reporting USB PD message. The USB/DP combo PHY supports software
configurable pin mapping and DisplayPort lane assignment. Based on
these message, the combo PHY can perform both altmode switching and
orientation switching via software.

The RK3399 EVB IND board has a Type-C interface DisplayPort. It use
fusb302 chip as Type-C controller. The connection diagram is shown below:

fusb302 chip +---> USB2.0 PHY ----> DWC3 USB controller
             |
             +---> USB/DP PHY0 +--> CDN-DP controller
                               |
                               +--> DWC3 USB controller

====
3. Multiple bridge model for RK3399 CDN-DP

The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
the CDN-DP can be switched to output to one of the PHYs.

USB/DP PHY0 ---+
               | <----> CDN-DP controller
USB/DP PHY1 ---+

In previous versions, if both PHY ports were connected to DP,
the CDN-DP driver would select the first PHY port for output.

On Dmitry's suggestion, we introduced a multi-bridge model to support
flexible selection of the output PHY port. For each PHY port, a
separate encoder and bridge are registered.

The change is based on the DRM AUX HPD bridge, rather than the
extcon approach. This requires the DT to correctly describe the
connections between the first bridge in bridge chain and DP
controller. And Once the first bridge is obtained, we can get the
last bridge corresponding to the USB-C connector, and then set the
DRM connector's fwnode to the corresponding one to enable HPD
notification.

====
Patch1 add notifier functions for Type-C core.
Patch2 export all Type-C device types for identification.
Patch3 add generic USB Type-C DP HPD bridge.
Patch4 add new Type-C mode switch for RK3399 USBDP phy binding.
Patch5 add typec_mux and typec_switch for RK3399 USBDP PHY.
Patch6 add DRM AUX bridge support for RK3399 USBDP PHY.
Patch7 drops CDN-DP's extcon dependency when Type-C is present.
Patch8 add multiple bridges to support PHY port selection.
Patch9 add missing dp_out port for RK3399 CDN-DP.
Patch10 add Type-C DP support for RK3399 EVB IND board.

Changes in v8:
- Link to V7: https://lore.kernel.org/all/20251023033009.90-1-kernel@airkyi.com/
- Export all typec device types for identification.
- Merge generic DP HPD bridge into one module.
- Fix coding style.

Changes in v7:
- Link to V6: https://lore.kernel.org/all/20251016022741.91-1-kernel@airkyi.com/
- Add notifier functions for Type-C core.
- Add generic USB Type-C DP HPD bridge.

Changes in v6:
- Link to V5: https://lore.kernel.org/all/20251011033233.97-1-kernel@airkyi.com/
- Fix depend in Kconfig.
- Check DP svid in tcphy_typec_mux_set().
- Remove mode setting in tcphy_orien_sw_set().
- Rename some variable names.
- Attach the DP bridge to the next bridge.

Changes in v5:
- Link to V4: https://lore.kernel.org/all/20250922012039.323-1-kernel@airkyi.com/
- Remove the calls related to `drm_aux_hpd_bridge_notify()`.
- Place the helper functions in the same compilation unit.
- Add more comments about parent device.
- Add DRM AUX bridge support for RK3399 USBDP PHY
- By parsing the HPD bridge chain, set the connector's of_node to the
of_node corresponding to the USB-C connector.
- Return EDID cache when other port is already enabled.

Changes in v4:
- Link to V3: https://lore.kernel.org/all/20250729090032.97-1-kernel@airkyi.com/
- Add default HPD device for DisplayPort altmode.
- Introduce multiple bridges for CDN-DP.
- ...

Changes in v3:
- Link to V2: https://lore.kernel.org/all/20250718062619.99-1-kernel@airkyi.com/
- Add more descriptions to clarify the role of the PHY in switching.
- Fix wrong vdo value.
- Fix port node in usb-c-connector.

Changes in v2:
- Link to V1: https://lore.kernel.org/all/20250715112456.101-1-kernel@airkyi.com/
- Reuse dp-port/usb3-port in rk3399-typec-phy binding.
- Fix compile error when CONFIG_TYPEC is not enabled.
- Notify DP HPD state by USB/DP PHY.
- Ignore duplicate HPD events.
- Add endpoint to link DP PHY and DP controller.
- Fix devicetree coding style.

Chaoyi Chen (10):
  usb: typec: Add notifier functions
  usb: typec: Export all typec device types
  drm/bridge: Implement generic USB Type-C DP HPD bridge
  dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
  phy: rockchip: phy-rockchip-typec: Add typec_mux/typec_switch support
  phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
  drm/rockchip: cdn-dp: Support handle lane info without extcon
  drm/rockchip: cdn-dp: Add multiple bridges to support PHY port
    selection
  arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
  arm64: dts: rockchip: rk3399-evb-ind: Add support for DisplayPort

 .../phy/rockchip,rk3399-typec-phy.yaml        |   6 +
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  10 +-
 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 146 ++++++
 drivers/gpu/drm/bridge/Kconfig                |   5 +-
 drivers/gpu/drm/bridge/Makefile               |   8 +-
 drivers/gpu/drm/bridge/aux-hpd-bridge.c       |  23 +-
 drivers/gpu/drm/bridge/aux-hpd-bridge.h       |  13 +
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  |  47 ++
 drivers/gpu/drm/rockchip/cdn-dp-core.c        | 354 ++++++++++++---
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  24 +-
 drivers/phy/rockchip/Kconfig                  |   3 +
 drivers/phy/rockchip/phy-rockchip-typec.c     | 420 +++++++++++++++++-
 drivers/usb/typec/Makefile                    |   2 +-
 drivers/usb/typec/bus.h                       |   2 +
 drivers/usb/typec/class.c                     |   7 +
 drivers/usb/typec/class.h                     |  10 -
 drivers/usb/typec/notify.c                    |  24 +
 include/linux/usb/typec.h                     |  10 +
 include/linux/usb/typec_notify.h              |  16 +
 19 files changed, 1034 insertions(+), 96 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-bridge.h
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
 create mode 100644 drivers/usb/typec/notify.c
 create mode 100644 include/linux/usb/typec_notify.h

-- 
2.49.0


