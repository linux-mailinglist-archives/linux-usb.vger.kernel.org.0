Return-Path: <linux-usb+bounces-31022-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E95C9090A
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 03:05:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 789894E14B9
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 02:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3FA27B324;
	Fri, 28 Nov 2025 02:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="Vku9a/5s"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDD726ED28;
	Fri, 28 Nov 2025 02:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764295485; cv=none; b=cT7XHnpEWIcg5c8XrcaMSqpAH1NJKtsQ+9dSKRo3EoKySFc0PlYd4MZzNhG9cjxdcbkKjl3Dl4avXgbFDt2qBwpr8Wu8P3QHUrNPT3pwnzOhEjABmh5lE1sN6tSfyTQF63XqQdWk1bblSAzrPyXI24GJyuIFsWyuFM4oPFmBv/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764295485; c=relaxed/simple;
	bh=8W+bkEdaEifQTgQC+LVUQ8X6EO4zWWCJiAAO5FA36Ro=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Z/aXDsr84bAL4arcgAEioFu3HzAwn4cUkj55Za2bD/NTBxfHPI7M441JwlyxnVgVov2a6S76sqHQzy7CfMttQ9rxpkWGsR8Rg9QcNUT1LBm2IahLveB5Lhye9rRoEkb2uaRXdkhGHYvjuChY++YmzZ3x22Wm0HV8EBmlgqMG6iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=Vku9a/5s; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764295458;
	bh=it53BCZJStH8fYbwTXji7TtB2zvtLMGxhs6oJ8nM3RY=;
	h=From:To:Subject:Date:Message-Id;
	b=Vku9a/5syH2BHH4JQKnRUt+vL/Vy1x06WqMn9ZUum6K2fqK+LnunAh968pRHoeWz4
	 18VQYzBb7aPMWSs5X68DZHJreWpk2PKEHA+vq//Uwv3S+jcy9bYyL4DGANk/0xgSc8
	 ATh6WNwvgCDFyM/i2tsDgiOfkdYKUHyzU6ZyYT2c=
X-QQ-mid: esmtpsz21t1764295456tbd58a625
X-QQ-Originating-IP: 2JXZHGea6NTvGbL6kbWjGDx2Cl6Ef9FHVo1De/6NYMM=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Nov 2025 10:04:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 371946445931273147
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
Subject: [PATCH v11 00/11] Add Type-C DP support for RK3399 EVB IND board
Date: Fri, 28 Nov 2025 10:03:54 +0800
Message-Id: <20251128020405.90-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NoCv3FF0KVIkVa1B3p/IaQHZ7x38YApl2g3CpzF+nLgqbl4OIMsA3Fah
	QpOtzF5p+Id9gMBvN+gScWOy4MyDNZJ3NU3azPlQaccslSWpTz2WJQsBFu7J3ugiXIeprXJ
	B6iHuj2Yq+CCdLeK+41CvLxWc0ePeCD+GGUXyy/bbIzO9cF5aWaEy9naZDWMUftM+y87nEg
	Y8o8bGEh/cQrIDJzKn3EUnKOkz6prq4AOIhZm3zeWyNekeF4XUFZ+NWNl1h7BvsIk6/Aib7
	7Y+XC6TwVWQihz/69ZdgrYk665YOVlF4c7n1mopmrNk+OsVNKPxKFYU5Flfqz2Tt9Vj3OPI
	9Z99W3+fTfLZHCL6t60YGcNNClWLYlyxU9CpCBRfLZszet7gUQzmAxrll9iijEU1pCoDgi9
	MeYIj3SDgx2O0wPEXzUnRZZOFCnQtvR8vokWz1wcUsSqE7S3Kd9PFA23xccJsyB2ki+Rc9l
	g2Kwud0scAAHDX0O/Q+30n3cGZgSiFBCM/gsSbkAd/p5gBDuci1L5QMIkN+3WFYM8kg5ON8
	9iX/nqtun7YNR+CHcLz1ZXu703qa2RRtLPIPPjaIt54vj1iJNAYE1gg4eXoNyaIk8Y+YnCg
	fYcQfW83D9lHPaoc4ELemhi/CH+Io2D009qgnmB+sLpeaEhY9U1Laa0/RT3eU31+47G/At/
	BGEzeo8AaiYLF774ct2O9z3S70rNxXUc435S36i2XkCtWQTfPZvFdClLGG7El9UU8G3LdkX
	NN8EOfu2rvNJfCV3sy/13equFOdTWRuED6SSVCBQDgA/cQAX+bZdBNxvGqJ/Mxhxlh8m9j5
	uwy0OARpTtsGiJdezEyTgJ3NmRkAJQMNPBzg9s8gexPWJng0jjd8/13nQ1eZ4OJiAiRz4kg
	amNfwG81KsTBdtU19tWgah3aSdtyekCdVmezIT1etJxJLzjWaydAc031r+IoPHDzq8b7SLl
	DgOtIz+itJWohqXT+U2T96sX4LaN+nfj6xp+/yxrT8CHF5VKgaNB3+DI2VQmxXfyY+To=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
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

During v7-v10, we added a new notifier in typec to notify the altmode
device register event. With the help of Greg and Heikki, we implemented
the reuse of notifiers for the type bus itself in patch1 of v11.

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
Patch1 set the bus also for the port and plug altmodes.
Patch2 export typec bus and typec altmode device types.
Patch3 add generic USB Type-C DP HPD bridge.
Patch4 add new API drm_aux_bridge_register_from_node().
Patch5 add new Type-C mode switch for RK3399 USBDP phy binding.
Patch6 add typec_mux and typec_switch for RK3399 USBDP PHY.
Patch7 add DRM AUX bridge support for RK3399 USBDP PHY.
Patch8 drops CDN-DP's extcon dependency when Type-C is present.
Patch9 add multiple bridges to support PHY port selection.
Patch10 add missing dp_out port for RK3399 CDN-DP.
Patch11 add Type-C DP support for RK3399 EVB IND board.

Changes in v11:
- Link to V10: https://lore.kernel.org/all/20251120022343.250-1-kernel@airkyi.com/
- Switch to using typec bus notifiers.

Changes in v10:
- Link to V9: https://lore.kernel.org/all/20251111105040.94-1-kernel@airkyi.com/
- Notify TYPEC_ALTMODE_UNREGISTERED when altmode removed. 
- Add drm_aux_bridge_register_from_node().
- Fix refcount usage of drm_bridge.

Changes in v9:
- Link to V8: https://lore.kernel.org/all/20251029071435.88-1-kernel@airkyi.com/
- Remove the exposed DRM_AUX_HPD_BRIDGE option, and select
DRM_AUX_HPD_TYPEC_BRIDGE when it is available.
- Add usb role switch for Type-C.
- Remove USB2 PHY in Type-C connection.
- ...

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
  usb: typec: Export typec bus and typec altmode device type
  drm/bridge: Implement generic USB Type-C DP HPD bridge
  drm/bridge: aux: Add drm_aux_bridge_register_from_node()
  dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
  phy: rockchip: phy-rockchip-typec: Add typec_mux/typec_switch support
  phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
  drm/rockchip: cdn-dp: Support handle lane info without extcon
  drm/rockchip: cdn-dp: Add multiple bridges to support PHY port
    selection
  arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
  arm64: dts: rockchip: rk3399-evb-ind: Add support for DisplayPort

Heikki Krogerus (1):
  usb: typec: Set the bus also for the port and plug altmodes

 .../phy/rockchip,rk3399-typec-phy.yaml        |   6 +
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  10 +-
 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 147 +++++++
 drivers/gpu/drm/bridge/Kconfig                |  10 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/aux-bridge.c           |  24 +-
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  |  51 +++
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 drivers/gpu/drm/rockchip/cdn-dp-core.c        | 350 +++++++++++++---
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  18 +-
 drivers/phy/rockchip/Kconfig                  |   3 +
 drivers/phy/rockchip/phy-rockchip-typec.c     | 373 +++++++++++++++++-
 drivers/usb/typec/bus.c                       |  25 +-
 drivers/usb/typec/bus.h                       |   6 -
 drivers/usb/typec/class.c                     |  36 +-
 include/drm/bridge/aux-bridge.h               |   6 +
 include/linux/usb/typec.h                     |   3 +
 include/linux/usb/typec_altmode.h             |   8 +
 18 files changed, 976 insertions(+), 102 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c

-- 
2.51.1


