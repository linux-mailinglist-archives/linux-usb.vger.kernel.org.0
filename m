Return-Path: <linux-usb+bounces-32470-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD87D39FE8
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 08:32:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E0D53060A7F
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 07:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A3C336EE0;
	Mon, 19 Jan 2026 07:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="qjepRFFK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D54335098;
	Mon, 19 Jan 2026 07:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768807891; cv=none; b=NOtN65BVA6/8XcG4IB32McPjEUuQtTgk062eGumBqScozO2hp0AspeSqw0bdDhkNjwrQ5gQsZ53sSCMNsbFYuZIyOEBcT6dWSg+6MfU6Cm1Z7hRvHGOraxnzvXkGZriCmI8yf6fL4ZL3n5byc3sS5wM8s3pyK+SWudV0/BG+cjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768807891; c=relaxed/simple;
	bh=ea+9lbUvfWLJ1/jsWjC0Rr4PQwCPgC6yfsUX0XWL9i0=;
	h=From:To:Cc:Subject:Date:Message-Id; b=AM6FWjQFU9vmMHJiA4owBw9Pwk46OXAnds8rGAm0IzuuBTzGv71SJlU/RMGKnEF8mawfag44D3tyRVNVUdJbfGDylPoR2v4Z7gjdgK0sxEXRL4CgCA3Bk+8r0ogfsxt7b13LnAEoD4LLGc3PZFyXkmIjJYR31NAQ18jZvURk3wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=qjepRFFK; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1768807871;
	bh=U2TFSPcQ4D5osA7spvoZ7LvXzYBPJmabhzFUGQTzcjw=;
	h=From:To:Subject:Date:Message-Id;
	b=qjepRFFKqh/BtbvWfDm5i1NzlubraY/aLIADsuIO0qV6zxgP8IAlYF1HZtL6Je6r1
	 H17t9tBY0tq4OojVre7SRoWgiLgLEy+ymrnWSykoqJRMeQ5sm6m5yfGO5iJTkRvrWa
	 lMidBu5obWpzTT87fUdPlM4q9BYnWv2xn6OyLHsY=
X-QQ-mid: esmtpsz17t1768807868t02ae8551
X-QQ-Originating-IP: RvQWtRJpgNlgEzXUx3Nd3SyLZyitafvRDavPpc6zxaQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jan 2026 15:31:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18243268186221231282
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
Subject: [PATCH v14 0/9] Add Type-C DP support for RK3399 EVB IND board
Date: Mon, 19 Jan 2026 15:30:51 +0800
Message-Id: <20260119073100.143-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Mutteg8H72qDqFgKABeTk2XFbFRILPLmQcnLEAjS+RIKMUk/DOJ4CWLD
	9a7NshYm+89+epGQEMXKJTHgPIggDPl0aYjjXRbzLoT7MeQdDy7JWLl+awZxSlUogwf8og5
	zPy3BbvHZn9hdOz9GmlUFFGKcKemazyp5+zjN7a+2pw2VLT4DXirAVGawwr7f/bm+pINiLl
	+yhgkEFdd2IJ0CwDJPxwuMzpXA7Z60VrOpfLK8JJMjon8Ft8aDBnPKnxPBq57HqWLY/BvI2
	bGH8zLItXNBNFe2c/9pVzuTpkLzAG+hbBvYH5aqdCoe8SFgOHaZrxgRNxgTBWcLwQdGo/qf
	6Lr6s/fiOmWhhMx6TgUuGDq12t/NLDDnFM//cKjDffIKdCNFEaBTNRnvc19pW3KtnJhkBxQ
	Es2kiqKjy+1BzPOPjQqJ83AAuRDsmrFbVGEfzmv3iLHbvovroAA8f9CrnLQlFTHPHTYtTgr
	2vpHC60YyOe1aRodaObFRw4EeI4pM1O/0vfdJP/d3Dutgh4W5He1JeOKM/HidkZq4HFs+lk
	SeC7sQBDwFj7jWc+sQw1hDqxrYGWcOOWaxyWU+zgRwduPXpXfNSk5qXEBR3k+hVvAnYsmzy
	3f9TyJiUBoS4F52Ebv8pNV9VwegdW80MK/RqYtjfZ+qU8pkrWz3rPbT0rZPovl+1hhQxgnb
	HWnXjN64cPISmjsL//gdrryIgwniDtxamsk4pTMpqsd/z4wl3bCgavvH9qLw2wQb7Hs489f
	Salg3vMulsbIh4On3CZ2GwHXQ+cHBrUbOVfHLszmVSoXgAvb328FhXrAiAWH+h2cflwlMbz
	7WGBhfZUi/TUvUKeEAxxdcr0XVyd5gtMu2j0zOkVtqlQqwvON8IYaFjpmlfmgB7iVmf+A+R
	7TtYZZCNk9AqIL6hD2gC9NlfZKeNJSrpQ4DN6HJMhx/IFiTTRTZiv/5iGXnHnzTzJLRPPMx
	kl3wZ66exDtKT47MoJRCSfPqiWbHWYnRPLpG+UDALGIRHMKzmxHphBV4jE/nF+HhWbhQFBa
	aCo30iQ82WoZzOpbDKzZY/dUwdwig=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
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

The USB subsystem related parts have already been merged into the
usb-next branch in v13 [0][1]. Therefore, this series no longer includes
these patches starting from v14. Thanks to Greg and Heikki!

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=67ab45426215c7fdccb65aecd4cac15bbe4dfcbb
[1]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=4dee13db29de6dd869af9b3827e1ff569644e838

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
Patch1 add generic USB Type-C DP HPD bridge (Dmitry, Heikki).
Patch2 add new API drm_aux_bridge_register_from_node() (Neil).
Patch3 add new Type-C mode switch for RK3399 USBDP phy binding (Krzysztof).
Patch4 add typec_mux and typec_switch for RK3399 USBDP PHY.
Patch5 add DRM AUX bridge support for RK3399 USBDP PHY (Neil).
Patch6 drops CDN-DP's extcon dependency when Type-C is present (Dmitry).
Patch7 add multiple bridges to support PHY port selection (Dmitry, Luca).
Patch8 add missing dp_out port for RK3399 CDN-DP.
Patch9 add Type-C DP support for RK3399 EVB IND board (Diederik, Peter).

Changes in v14:
- Link to V13: https://lore.kernel.org/all/20251208015500.94-1-kernel@airkyi.com/
- Drop the patches for the USB Type-C subsusytem part, as they have
  already been merged into usb-next.

Changes in v13:
- Link to V12: https://lore.kernel.org/all/20251204063109.104-1-kernel@airkyi.com/
- Only register drm dp hpd bridge for typec port altmode device.

Changes in v12:
- Link to V11: https://lore.kernel.org/all/20251128020405.90-1-kernel@airkyi.com/
- Add missing Signed-off-by line.

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

Chaoyi Chen (9):
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

 .../phy/rockchip,rk3399-typec-phy.yaml        |   6 +
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  10 +-
 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 147 +++++++
 drivers/gpu/drm/bridge/Kconfig                |  10 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/aux-bridge.c           |  24 +-
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  |  49 +++
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 drivers/gpu/drm/rockchip/cdn-dp-core.c        | 350 +++++++++++++---
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  18 +-
 drivers/phy/rockchip/Kconfig                  |   3 +
 drivers/phy/rockchip/phy-rockchip-typec.c     | 373 +++++++++++++++++-
 include/drm/bridge/aux-bridge.h               |   6 +
 13 files changed, 914 insertions(+), 84 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c

-- 
2.51.1


