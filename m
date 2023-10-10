Return-Path: <linux-usb+bounces-1389-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 174F97C4546
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 01:10:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE981282029
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 23:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E9632C8C;
	Tue, 10 Oct 2023 23:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F63k6AyK"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10113550B
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 23:10:22 +0000 (UTC)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B9A592
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 16:10:21 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2bff776fe0bso80487641fa.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 16:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696979419; x=1697584219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1PVwEVZvfBSDD5d8UZhpkgKfPZQ+0l26q5U0eEBP3cM=;
        b=F63k6AyKjV1wRJAIPMzTD4AJPpC9PMlSQ4Xq6rqC3va6YweJ8p6MHWKf13JEXdkG3q
         ygoB7iM3E0BZfZ9bp16hc5dkp+wZzZxMyL23V0vnRZM6JktJQPU5/1q9H0r2GMn530RY
         sLjkVcJdIllfZ1g9739XeMP3DGin8ZhzVY1or0VjWJBjbWnkYfTfMAdiQ4luYGfJ4QYA
         e03wJaZkcnzGWNGQyllXj5TJJDv9FP+EjWQ/QOBtRI2VL3lMusQSVerCGOuU8f/DVPEk
         9lc6WWDRNvO/dsn1aj8qIGLjOAgVryrpbOmRKL5rBb1nXrbovBbjhRo1vbRAkOmmwJbn
         d89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696979419; x=1697584219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PVwEVZvfBSDD5d8UZhpkgKfPZQ+0l26q5U0eEBP3cM=;
        b=aTJNkrpX3afEDKSQNI1KPMjD+NcajwoBL1qoGOHVITOwDyBs8wqxmm93kIjkY5ZSQv
         8dA6Wkjr+M1K+h2eT6VdyW0viG1sg1gm2S+oE92FRwxHWyaIeCAH+eeXqLPwOKO3lrWm
         SRhYvtcV4C5aFFnP+ao8dBh5RpBz/HgyEl4en1Txk9wL8DdpbSCP2nnL/+dOYd9pWNy4
         lUbYi+Li/oz7eNY3eAdRFtyiYiPuDYmox0O8AAmC3Yd9haEpdXYLqy9L4GioGaSdgWeh
         lZYcve8X/TgRbr/W74WW5GaaeoZqF86IYz+votAMa4lzKkyyr833ijmHKffWbM6HjDOb
         ABuA==
X-Gm-Message-State: AOJu0YylXUIp0DQIN516ms+CzgqJbhbzmGUg0WcP20kL++Zmf0jjn7Wa
	sGXMR8jOTsdF3QpA8DU17hbzJg==
X-Google-Smtp-Source: AGHT+IHzC7VAJwHBIwZnsBz9+yJMjFzhwQb9W4iUEnN/3lFIYSrR0mUHG3GMEpkhU798pd11+uJUDw==
X-Received: by 2002:a2e:8816:0:b0:2bc:db99:1775 with SMTP id x22-20020a2e8816000000b002bcdb991775mr16410708ljh.26.1696979419245;
        Tue, 10 Oct 2023 16:10:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n8-20020a2e8788000000b002bcdbfe36b9sm2658033lji.111.2023.10.10.16.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 16:10:18 -0700 (PDT)
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
Subject: [PATCH v4 0/3 RESEND] drm: simplify support for transparent DRM bridges
Date: Wed, 11 Oct 2023 02:10:15 +0300
Message-Id: <20231010231018.77381-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

[Resending since the discussion with Laurent has died with no response
received for more than three weeks]

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

Changes since v3:
 - Moved bridge driver to gpu/drm/bridge (Neil Armstrong)
 - Renamed it to aux-bridge (since there is already a simple_bridge driver)
 - Made CONFIG_OF mandatory for this driver (Neil Armstrong)
 - Added missing kfree and ida_free (Dan Carpenter)

Changes since v2:
 - ifdef'ed bridge->of_node access (LKP)

Changes since v1:
 - Added EXPORT_SYMBOL_GPL / MODULE_LICENSE / etc. to drm_simple_bridge

Dmitry Baryshkov (3):
  drm/bridge: add transparent bridge helper
  phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
  usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE

 drivers/gpu/drm/bridge/Kconfig            |   9 ++
 drivers/gpu/drm/bridge/Makefile           |   1 +
 drivers/gpu/drm/bridge/aux-bridge.c       | 132 ++++++++++++++++++++++
 drivers/phy/qualcomm/Kconfig              |   2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c |  44 +-------
 drivers/usb/typec/mux/Kconfig             |   2 +-
 drivers/usb/typec/mux/nb7vpq904m.c        |  44 +-------
 include/drm/bridge/aux-bridge.h           |  19 ++++
 8 files changed, 167 insertions(+), 86 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-bridge.c
 create mode 100644 include/drm/bridge/aux-bridge.h

-- 
2.39.2


