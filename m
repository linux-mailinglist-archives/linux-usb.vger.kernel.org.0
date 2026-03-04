Return-Path: <linux-usb+bounces-33956-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLaBJvL+p2nUnAAAu9opvQ
	(envelope-from <linux-usb+bounces-33956-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 10:44:18 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 386591FDCC8
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 10:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF315305022E
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 09:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E08539A07D;
	Wed,  4 Mar 2026 09:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="LypiQ6y/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5FD391827;
	Wed,  4 Mar 2026 09:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772617362; cv=none; b=e8KdOomUryk5gvPCt0e0mgZ4CTFggnJ23Xm1eS7wMAS0tuM+IGpcEb5hkaiBt5uAJZMBpYo5HcA1uOARnh7lMEBNyIpt3PTJTXOrcY/QErmdpnd7k8Gc9+vGJeR21B+hk8WNRwiyPkWJiSnI3vjAfwtTZM8+x32XUBBbyO5WAvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772617362; c=relaxed/simple;
	bh=UEwcsMNAThYsEtWRY58rgMelsehertg/JKl1vHf4GJE=;
	h=From:To:Cc:Subject:Date:Message-Id; b=sLFa8CV6Gt0+z1OT97KI+CeFevGDK2Ea/h6x5lMsiR/utUI9hi+oHPBo20yswKp1BxGSNw0EOTkP8VcV9V6FbedINxq7KDQ6w3ah8gGDxqCEMPqgWtXHICcRG+XqNKo+Dqq2yA0CxXuYRFn/+jSuiWTMnuq0yE24y75AkoSrFTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=LypiQ6y/; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1772617328;
	bh=j4OO5LQjgQWJ6Ij+29Alv0i2FQ3hT0svegwm+PnfSjo=;
	h=From:To:Subject:Date:Message-Id;
	b=LypiQ6y/w0/equumGfLI/89YX/CPCWERNnJ9433ZAkupfcaAMHiypCCIrN/tUD4Af
	 NxitPGorqS8jT4VZ/9zfT0ZYQD9+t7/czewUHNdfl72yfkkH3loUFfYAFjRG67C2xW
	 ry6jc+Ojy2q2mlpxK7OWEsEpwmXCPkYj21Zu9sII=
X-QQ-mid: esmtpsz11t1772617321tff97d081
X-QQ-Originating-IP: R7C0JUdMb9pzS4EvwpZxl9x1A2bwu9dy7Pvnz9pi9C0=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Mar 2026 17:41:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6917927153062181562
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
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	Hugh Cole-Baker <sigmaris@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v15 0/9] Add Type-C DP support for RK3399 EVB IND board
Date: Wed,  4 Mar 2026 17:41:43 +0800
Message-Id: <20260304094152.92-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MxdW4jxL6NvXtbscdy2cNxrAJ+yOz3ok4YXRrovqcGEz4nKcpxcdqnm7
	RdX3oKbXkylBlpTlk+WBSW01qLo6neyYFkOk+GVf6o/f2Xml+5fjxP/C8moHZ2oXBAK6bz/
	9MqeZbOrMZwIht8TXx1jvkn/vq6xBJXttz1VKBqQOum9Ll/eEUuyQL44Y2BlYK+k4fWfZbm
	JlztdFTxB0lBMEu0+AM8x++MLAKT6TzO4zAlXn7lkDVnWUO53r76GrgLLSPpJEFjtUc0nf9
	CS2m7l1CnlT50t/x5eKhUvougwhEkvXFixUbNQO2H70LQeCDsCr2jT6ZRFw3WXGeuy7RbEa
	uwn1nAXvVtgGnH+GLlDSoAa5/7Alh4twoqXy48Y1fdyhkhUIbeySSrtjsg6ZUkg6bVg4/Hm
	XzaGdfUIalgRxeQwuQeVVrbiBIHyZeNjXTERzyOc8cIzn+YUeePuHVKNmbraOVT/NDxZgQ5
	+5wVrDWrBhC/+gjYinJJ/ho5bT4juX6z6HpFthrYv35jtXmprV8uvEqHDbW0UnPr3gsiWwp
	KqW8vRchNiKbqryghzLPvqefJM6tDZkod2wDaw0S/B4fqBmG3mmuM8YuO5PNlp69bIrPvyn
	e7qBbr7iSlpPZrfsQcCg38tfpmZMG/vr6YyPgbqMaWZUbvkO9I9pXq/GqWxnuUY6RoKyyFR
	0Pl5bLtIbDA5XjUEy+0915ZmGEv/4LN2+veMVmECtGTchdUBZ06dI9Hpn6kGVNLhkBTTQPk
	HtP0cgBpB2kJ5hH1MF50Z/dtY/MVQ8GSzSFSrIasrji69jOmI1vdqVxOKDDgjB3D8Zelv9z
	gKBLEjyFLnDnzL3dGnID7OmwjFI330+bfzd9aFyb7GYeTVVUNkVNJppE8ae8D72MwRH2NkC
	RuxdE3FsBkbwM8/7+SfQao10zpI2ke8jIVNI9gG7tc5OXgy8YRiHcI3ocJfE3T4tEwNCZCQ
	eKvKr2UuVO9Xk0WXdVG3hmnWjDbG2xl6kyIVILCVEHIEzK10g9isnOIxWtrH2VQmiGlyDp/
	+xPZXYy1WFwqkFUWt/cbVAPxpKEFQ=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 386591FDCC8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[airkyi.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[airkyi.com:s=altu2504];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33956-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[40];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,linuxfoundation.org,oss.qualcomm.com,gmail.com,bootlin.com,kernel.org,sntech.de,rock-chips.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,suse.de,ffwll.ch,google.com,manjaro.org,cknow.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[airkyi.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kernel@airkyi.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[airkyi.com:dkim,airkyi.com:mid,rock-chips.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

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
Patch2 add new API drm_aux_bridge_register_from_node() (Neil) .
Patch3 add new Type-C mode switch for RK3399 USBDP phy binding (Krzysztof).
Patch4 add typec_mux and typec_switch for RK3399 USBDP PHY.
Patch5 add DRM AUX bridge support for RK3399 USBDP PHY (Neil).
Patch6 drops CDN-DP's extcon dependency when Type-C is present (Dmitry).
Patch7 add multiple bridges to support PHY port selection (Dmitry, Luca).
Patch8 add missing dp_out port for RK3399 CDN-DP.
Patch9 add Type-C DP support for RK3399 EVB IND board (Diederik, Peter).

Changes in v15:
- Link to V14: https://lore.kernel.org/all/20260119073100.143-1-kernel@airkyi.com/
- Improve clarity by inlining drm_bridge_get() in assignment (Luca).

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
 drivers/gpu/drm/rockchip/cdn-dp-core.c        | 349 +++++++++++++---
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  18 +-
 drivers/phy/rockchip/Kconfig                  |   3 +
 drivers/phy/rockchip/phy-rockchip-typec.c     | 373 +++++++++++++++++-
 include/drm/bridge/aux-bridge.h               |   6 +
 13 files changed, 913 insertions(+), 84 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c

-- 
2.51.1


