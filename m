Return-Path: <linux-usb+bounces-14427-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0474967490
	for <lists+linux-usb@lfdr.de>; Sun,  1 Sep 2024 06:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54A881F21AB9
	for <lists+linux-usb@lfdr.de>; Sun,  1 Sep 2024 04:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B506739879;
	Sun,  1 Sep 2024 04:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i+j9rz5B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD51A26AE8
	for <linux-usb@vger.kernel.org>; Sun,  1 Sep 2024 04:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725163625; cv=none; b=HjSAdW6SOMrnCgWhgzjj5pa6gdWs7cea+4qXlqjD2pHGDy8uZKqxQ0tZT8cCSdyl+gzyf0FLWU4e03BAIBiCXR/FFjzKLX7KtDf5pldsxhWw5ohVRD98p9nuWvtyywo/6EN9J6Dd0z+5AIX9kvdPuENo2ZVhuXsRWLnKhq0Zp+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725163625; c=relaxed/simple;
	bh=60xCXeXzxeUrktoR9R5NiMkSZWaLOywMB76XxDKQj8o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nD7Ido5lcLucg/YxnMTFBv4e7SvEQiIwSaSMDxW5uhf5baNWceHj8WnXEyI9Ok6D7HMwg1iEphiriQhAaBbaS+H5MdMTDJSwT4kVjM42lI3e+z/9senWAmSLA3ho+UGHfbXsmiZcVfSJGy8Tp8rbxy6Um4B2LnpvLKSg6ugV6C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i+j9rz5B; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2053a0bd0a6so12966305ad.3
        for <linux-usb@vger.kernel.org>; Sat, 31 Aug 2024 21:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725163622; x=1725768422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nuBr4jHV5S80VE6wt73LlMepnLPoYFInOo7nmnbq2q0=;
        b=i+j9rz5BEEfAqmSGCqLEYple7/48FvIONvR6cXbP2Bqha0Skh67rLG4INcKMF7SFL9
         pWeUiwyNGBKw1k1T8jmNvGJjBEStGgpoNovRzGbGSfIziaKmMyxBUXpXAAhVIvFydrP4
         3Jvr/83GTV7FKGYcz8wbauEAvZ6NoZ0Q1sb6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725163622; x=1725768422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nuBr4jHV5S80VE6wt73LlMepnLPoYFInOo7nmnbq2q0=;
        b=cqnxHCG2piNdC2HAta9/AVWugoRRpU9Y8QB3xqTPS1znDwuN5acDkQULsVVse2xmz9
         U2gUAM79XoqItRqegEWDY6vK1MzS5Lh0nnMHPXfqz3E8xHtqKnUJaGUxCkwSfCaw/+Di
         s3BuhVTOenwa63URPaRXOtwGHbmeJ/drW+9vNBh3xAORu1hwgRDjNrnlGNgrVaXq4I7n
         xzPcNOVfGqxorQn18ULLSrmZqSQerfQRwzKoxZ2k7p0A0utfNebPwBhyFvLK/U25aeGN
         svbWJctRHID2sQCCJ0SmJZ/ZgtTaNl71QwP/FArpnDGglZ4yiLHrODniVpJ1GISHT1Ax
         aXlg==
X-Forwarded-Encrypted: i=1; AJvYcCU1ZSCJ0F4MLZQiUtrMN7tRZ4GyR7RM47B8OpBl062pUgV3oSWE/u/XM+qMl4Ho2/PKRAiJoTWrasw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMWHJOKAOPMC5aNpd5M9NkOeVTgroPe8wmhPL+rrQNni4jujUD
	XOfLMllIp9wvm/uhUgCkTTrjI1TeHB/NgsTYsoc3YmCAfRqTy+luE5TEwS3FnQ==
X-Google-Smtp-Source: AGHT+IFdVKVrHGgclkl0cGkMwkBlcXVzyf0ZspkV2XMx+5RcpUZYEjzMjlqXOut5r9vzgEcJ72vHDg==
X-Received: by 2002:a17:902:ecc7:b0:1fc:2b3b:1482 with SMTP id d9443c01a7336-2050c2159fcmr112626595ad.12.1725163621781;
        Sat, 31 Aug 2024 21:07:01 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-20543b7c7e2sm19180565ad.3.2024.08.31.21.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Aug 2024 21:07:01 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Benson Leung <bleung@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	Guenter Roeck <groeck@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Lee Jones <lee@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Prashant Malani <pmalani@chromium.org>,
	Robert Foss <rfoss@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	linux-acpi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v4 00/18] platform/chrome: Add DT USB/DP muxing/topology support
Date: Sat, 31 Aug 2024 21:06:38 -0700
Message-ID: <20240901040658.157425-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for fully describing the USB/DP topology on
ChromeOS Trogdor devices in DT. Trogdor devices have a single DP phy in
the AP that is muxed to one of two usb type-c connectors depending on
which port asserts HPD first to the EC. We'd like to know which port is
connected to an external monitor to provide a better experience to the
user about things like which type-c port is displaying DP or which
type-c hub is acting up, etc. Describing the connection all the way from
the source to the connector will allow us to do this.

DRM core patches: These are used to implement lane assignment for DP
altmode configurations through the drm_bridge code. The typec code will
use this to tell the DP phy how many lanes of DP to drive and which
lanes to drive out to the USB type-c connector. Adding support for lane
assignment allows us to implement DP muxing as well, physically
splitting the DP lanes on the DP phy so that hardware doesn't have to
use an analog mux to steer two DP lanes to one or the other type-c port.

Type-c core patches: These add some devm helpers so that the next
patches in the series can skip open-coding devres helpers for
unregistering typec switches and muxes.

DRM aux hpd patches: These implement an auxiliary device for USB type-c
DP alternate mode. I took Dmitry's suggestion and moved the code that
does the remapping into this driver. The existing hpd bridge is wrapped
so as to avoid changing the current users. It also registers a typec mux
and switch (if applicable) so that the DP altmode pin assignment and
port orientation can be passed to the switch callbacks. We'll still need
to implement logic in the phy layer to handle configuration.

Cros EC typec patches: This ties together everything that comes before it in
this series. The EC typec driver registers the drm_dp_typec_bridge that
can signal HPD from the type-c connector through the bridge chain, mux
the DP phy in software so that we don't have to use an analog mux, and
implement orientation control for boards like Kukui that directly
connect the DP phy to the type-c port, necessitating lane assignment to
flip the lanes to match the cable orientation.

Changes from v3: https://lore.kernel.org/r/20240819223834.2049862-1-swboyd@chromium.org
 * Use devm_add_action_or_reset() for typec patches
 * Fix kernel-doc
 * Document devcon_match_fn_t before extending it
 * Include err.h in typec header
 * Document devm_typec_switch_register()
 * Remove struct cros_typec_dp_bridge and fold it into parent
 * Drop unevaluatedProperties in some places
 * Change name of registered typec switches to include dev_name of
   parent to avoid collisions

Changes from v2: https://lore.kernel.org/r/20240815003417.1175506-1-swboyd@chromium.org
 * Move most of the binding bits to usb-switch.yaml
 * Move google,cros-ec-typec binding to usb/
 * Implement mode-switch and orientation-switch typec controls in
   drm_dp_typec_bridge driver
 * Get rid of public APIs that would be used to assign pins or
   orientation of the port
 * Add devm helpers for typec mux and switch registration
 * Add a way to match fwnodes while walking the graph based on the
   endpoint

Changes from v1: https://lore.kernel.org/r/20240210070934.2549994-1-swboyd@chromium.org
 * Too many to count!
 * Split out the DRM bits into this series
 * Moved the logic into dp-aux-hpd bridge driver
 * Drive the bridge from cros_ec_typec driver instead of globbing onto
   the ACPI centric cros-typec-switch driver
 * During that process drop a lot of patches that aren't needed anymore
 * Move the DT graph and other properties to the cros-ec-typec binding
 * Skip mode-switch/orientation-switch properties because we're not
   registering typec structs anymore

Stephen Boyd (18):
  drm/atomic-helper: Introduce lane remapping support to bridges
  drm/bridge: Verify lane assignment is going to work during
    atomic_check
  usb: typec: Stub out typec_switch APIs when CONFIG_TYPEC=n
  usb: typec: Add device managed typec_mux_register()
  usb: typec: Add device managed typec_switch_register()
  drm/bridge: aux-hpd: Support USB Type-C DP altmodes via DRM lane
    assignment
  drm/bridge: dp_typec: Support USB Type-C orientation
  drm/bridge: dp_typec: Add "no-hpd" support
  drm/bridge: dp_typec: Allow users to hook hpd notify path
  devcon property: Document devcon_match_fn_t
  device property: Add remote endpoint to devcon matcher
  dt-bindings: usb-switch: Extract endpoints to defs
  dt-bindings: usb-switch: Extend for DisplayPort altmode
  dt-bindings: Move google,cros-ec-typec binding to usb
  dt-bindings: usb: Add ports to google,cros-ec-typec for DP altmode
  platform/chrome: cros_ec_typec: Add support for signaling DP HPD via
    drm_bridge
  platform/chrome: cros_ec_typec: Support DP muxing
  platform/chrome: cros_ec_typec: Handle lack of HPD information

 .../bindings/chrome/google,cros-ec-typec.yaml |  66 --
 .../bindings/mfd/google,cros-ec.yaml          |   7 +-
 .../bindings/usb/google,cros-ec-typec.yaml    | 295 +++++++++
 .../devicetree/bindings/usb/usb-switch.yaml   | 163 ++++-
 drivers/base/property.c                       |   7 +-
 drivers/gpu/drm/bridge/aux-hpd-bridge.c       | 575 +++++++++++++++++-
 drivers/gpu/drm/drm_atomic_state_helper.c     |   2 +
 drivers/gpu/drm/drm_bridge.c                  |  51 ++
 drivers/platform/chrome/Kconfig               |   1 +
 drivers/platform/chrome/cros_ec_typec.c       | 136 ++++-
 drivers/platform/chrome/cros_ec_typec.h       |   4 +
 drivers/usb/roles/class.c                     |   4 +-
 drivers/usb/typec/mux.c                       |  79 +++
 drivers/usb/typec/retimer.c                   |   7 +-
 include/drm/bridge/aux-bridge.h               |  26 +
 include/drm/drm_atomic.h                      |  31 +
 include/drm/drm_bridge.h                      |   4 +
 include/linux/property.h                      |  24 +-
 include/linux/usb/typec_mux.h                 |  59 +-
 19 files changed, 1433 insertions(+), 108 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml


base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
-- 
https://chromeos.dev


