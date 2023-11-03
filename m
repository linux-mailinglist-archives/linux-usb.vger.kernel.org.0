Return-Path: <linux-usb+bounces-2523-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 038D37E0BC6
	for <lists+linux-usb@lfdr.de>; Sat,  4 Nov 2023 00:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1CDE282014
	for <lists+linux-usb@lfdr.de>; Fri,  3 Nov 2023 23:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A267F250E9;
	Fri,  3 Nov 2023 23:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FKQY3QeQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71192374F
	for <linux-usb@vger.kernel.org>; Fri,  3 Nov 2023 23:04:19 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC4F7D61
	for <linux-usb@vger.kernel.org>; Fri,  3 Nov 2023 16:04:16 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50930f126b1so3186700e87.3
        for <linux-usb@vger.kernel.org>; Fri, 03 Nov 2023 16:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699052655; x=1699657455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GXIeW4GsOHRxaU3fctULVZJpGwQnd0E/lSvL3ZRRAIk=;
        b=FKQY3QeQlyhlQ8Up88JWsIj7+PtH4DbqXMHTGglOkyrL+DoF+ChahkYvOPdZwN8/fy
         zpjZIT/zZ+Cix+QdC93ThU7WJZLuNsOJCxOZJA/FJAwCecgOa7y8BeGz2Dj7SpKJedfc
         wCgHGkZvz5uiiknvDECx3gG+MKiAhRgcjzeIvtn2Rf1ENk2TlS/6F9wssFxM7JT70WVy
         XsMoAtPRPDNhP+Ws7z+pFzuwsogqwWV7bZRN18swrBvEHiXr5q8Svndi15df6Oh7uaaP
         4PRAdWhaOz9jb28KnhRNXbAmjmghfAFyWi8NYZ+KAFCwOwxj1SXT93YC1h+0ZZohOCMI
         aegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699052655; x=1699657455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GXIeW4GsOHRxaU3fctULVZJpGwQnd0E/lSvL3ZRRAIk=;
        b=ficILI7+89FK55iLWFVfalsrNNBpqAAFgFXr/gX6nDb7Cl52S67W46pCrTK+ir2slF
         1GHyZb8T9/D61fLnG+63V/HQ4ddwSOvWSO7kwFQziz4BGuAvShIan9b+W/vf5AQSXx5N
         loXVC7/TjrsLXwBGs10Kzas9DCiqtgYLzUFnGCH4zKcD1+vnPX8CN/hkVMADDq6mWD0f
         GTyyFuTSnER9ozYI8ju3R39oVTLDVOAMZ+HMVaNE1E8p2aG20UQZwT7L0KHyL/Qrb+vD
         5eqxyWWU4aR6iebBAI6BygqElb2C32YemO5DG1zyQBahn3zXyhqGeC3uTLMullVcuGdk
         Sf2w==
X-Gm-Message-State: AOJu0YxDwL9e64ezGDFE8TavMbDH62h17tbaBZfAuqn2TcbfjMEYaA6+
	jsTSJWdUV+pLksDcenBWlrIehA==
X-Google-Smtp-Source: AGHT+IFoXzOXhXBxDzb1hTvIAcYEh+H5qZuHfzgUAzlorrDsdIJFHrrZhJIyqpoiknvP1IZYHUsBww==
X-Received: by 2002:a05:6512:688:b0:507:9a13:27bd with SMTP id t8-20020a056512068800b005079a1327bdmr22258057lfe.7.1699052655045;
        Fri, 03 Nov 2023 16:04:15 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id s16-20020ac24650000000b00504211d2a7bsm329919lfo.297.2023.11.03.16.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 16:04:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v6 0/6] drm: simplify support for transparent DRM bridges
Date: Sat,  4 Nov 2023 01:03:03 +0200
Message-ID: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Supporting DP/USB-C can result in a chain of several transparent
bridges (PHY, redrivers, mux, etc). All attempts to implement DP support
in a different way resulted either in series of hacks or in device tree
not reflecting the actual hardware design. This results in drivers
having similar boilerplate code for such bridges.

Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
bridge can either be probed from the bridge->attach callback, when it is
too late to return -EPROBE_DEFER, or from the probe() callback, when the
next bridge might not yet be available, because it depends on the
resources provided by the probing device. Device links can not fully
solve this problem since there are mutual dependencies between adjancent
devices.

Last, but not least, this results in the the internal knowledge of DRM
subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.

To solve all these issues, define a separate DRM helper, which creates
separate aux device just for the bridge. During probe such aux device
doesn't result in the EPROBE_DEFER loops. Instead it allows the device
drivers to probe properly, according to the actual resource
dependencies. The bridge auxdevs are then probed when the next bridge
becomes available, sparing drivers from drm_bridge_attach() returning
-EPROBE_DEFER.

Changes since v5:
 - Removed extra semicolon in !DRM_AUX_HPD_BRIDGE stubs definition.

Changes since v4:
 - Added documentation for new API (Sima)
 - Added generic code to handle "last mile" DP bridges implementing just
   the HPD functionality.
 - Rebased on top of linux-next to be able to drop #ifdef's around
   drm_bridge->of_node

Changes since v3:
 - Moved bridge driver to gpu/drm/bridge (Neil Armstrong)
 - Renamed it to aux-bridge (since there is already a simple_bridge driver)
 - Made CONFIG_OF mandatory for this driver (Neil Armstrong)
 - Added missing kfree and ida_free (Dan Carpenter)

Changes since v2:
 - ifdef'ed bridge->of_node access (LKP)

Changes since v1:
 - Added EXPORT_SYMBOL_GPL / MODULE_LICENSE / etc. to drm_simple_bridge

Dmitry Baryshkov (6):
  drm/bridge: add transparent bridge helper
  phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
  usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE
  drm/bridge: implement generic DP HPD bridge
  soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE
  usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE

 drivers/gpu/drm/bridge/Kconfig                |  17 ++
 drivers/gpu/drm/bridge/Makefile               |   2 +
 drivers/gpu/drm/bridge/aux-bridge.c           | 140 +++++++++++++++
 drivers/gpu/drm/bridge/aux-hpd-bridge.c       | 164 ++++++++++++++++++
 drivers/phy/qualcomm/Kconfig                  |   2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     |  44 +----
 drivers/soc/qcom/Kconfig                      |   1 +
 drivers/soc/qcom/pmic_glink_altmode.c         |  33 +---
 drivers/usb/typec/mux/Kconfig                 |   2 +-
 drivers/usb/typec/mux/nb7vpq904m.c            |  44 +----
 drivers/usb/typec/tcpm/Kconfig                |   1 +
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c |  41 +----
 include/drm/bridge/aux-bridge.h               |  37 ++++
 13 files changed, 383 insertions(+), 145 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-bridge.c
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-bridge.c
 create mode 100644 include/drm/bridge/aux-bridge.h

-- 
2.42.0


