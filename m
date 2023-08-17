Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 958BC77F9CC
	for <lists+linux-usb@lfdr.de>; Thu, 17 Aug 2023 16:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352383AbjHQOz1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Aug 2023 10:55:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352449AbjHQOzV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Aug 2023 10:55:21 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86BAF10E
        for <linux-usb@vger.kernel.org>; Thu, 17 Aug 2023 07:55:19 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2bb99fbaebdso28042091fa.0
        for <linux-usb@vger.kernel.org>; Thu, 17 Aug 2023 07:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692284118; x=1692888918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BwS7c2t308T/mB+oMp8XQ357rYg2jjetSc6BP2FuXMU=;
        b=LwRMgFxz/A+6jxA1IpxcXgWOjwS+76IV2NlINn1g0YPEW2gsO3/T2YOvrD+p1qZSpw
         xgJMjRFlpVDUYfnmHDWnwOOMtPIG56TORlI4goFuuIaVCVXhdAhMC9/iMqqv9s1x+nza
         XCd0UX7+b0MXbkRgKNN3c/7Iu1z6W1siAQo//AhW+zugdFZDOWb1WsGNex5fM5AxgbrF
         MftE7yGGI4iA7C70tFy4VVtC9QVa1Rx3D8zTwFQae6S2QxJvc/LuxzNfWumEgBuXS4pt
         dNJ+dwt5msOtbSExu142PdY6yzt8h+xi1f9fkBySzK0izu6eHbRboyw9r41N+obcAJ1G
         OMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692284118; x=1692888918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BwS7c2t308T/mB+oMp8XQ357rYg2jjetSc6BP2FuXMU=;
        b=k2+hnT3dddQe73flwo6+ZD/hSRNzM0gPfJW5vqT3Un4Xam8BiamPfpWQYwOG4x3PYr
         Nw15ghSrxZMHr0pFKPFkZaRO0QBIjEjYrjuNb6BlO4em6ygbFWRN/3Z9KwxSNjMMKpHs
         +f0/5q/eSuobPcnWkpSGGjokEw+8mRGA6j2xJPmDquH4O0y5LDbs/JopxyzqqZ5hKLRx
         dUcUa8FZT0AW/nfDfd7olswTa0vY4C10JVUC6Ug2M/tlH+W3NSep5Mh62MQbt6MYRkBz
         JyRi+ggRPrhhKD6ZPRJakD9aAWIImf9541HE7BXcqeZycQAakalTTwQww4sHlxJW10Dh
         w3bw==
X-Gm-Message-State: AOJu0Ywej+XzqS+A15J1mFsQwEv2LaMi9gsgFG9Nh6m37Ds6BOrxmUTi
        eRKUdR2IdWdtl9G5/j/2MC8EXg==
X-Google-Smtp-Source: AGHT+IF8Yc9ETcCdt32wD1L0l4ewnINI9W+GmF5yUKQKysZlH5cmDAmbNTeLCZHofcqbQxIN8Gksqg==
X-Received: by 2002:a2e:9450:0:b0:2b6:a804:4cc with SMTP id o16-20020a2e9450000000b002b6a80404ccmr3885203ljh.53.1692284117772;
        Thu, 17 Aug 2023 07:55:17 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z13-20020a2e350d000000b002b9e5fe86dasm4082728ljz.81.2023.08.17.07.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 07:55:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
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
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 0/3] drm: simplify support for transparent DRM bridges
Date:   Thu, 17 Aug 2023 17:55:13 +0300
Message-Id: <20230817145516.5924-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Supporting DP/USB-C can result in a chain of several transparent
bridges (PHY, redrivers, mux, etc). This results in drivers having
similar boilerplate code for such bridges.

Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
bridge can either be probed from the bridge->attach callback, when it is
too late to return -EPROBE_DEFER, or from the probe() callback, when the
next bridge might not yet be available, because it depends on the
resources provided by the probing device.

Last, but not least, this results in the the internal knowledge of DRM
subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.

To solve all these issues, define a separate DRM helper, which creates
separate aux device just for the bridge. During probe such aux device
doesn't result in the EPROBE_DEFER loops. Instead it allows the device
drivers to probe properly, according to the actual resource
dependencies. The bridge auxdevs are then probed when the next bridge
becomes available, sparing drivers from drm_bridge_attach() returning
-EPROBE_DEFER.

Proposed merge strategy: immutable branch with the drm commit, which is
then merged into PHY and USB subsystems together with the corresponding
patch.

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

