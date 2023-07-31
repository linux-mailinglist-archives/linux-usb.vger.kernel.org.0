Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B349768E96
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jul 2023 09:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbjGaHXt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jul 2023 03:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231447AbjGaHWe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jul 2023 03:22:34 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8D1C1BD2
        for <linux-usb@vger.kernel.org>; Mon, 31 Jul 2023 00:19:33 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fe2503e3easo3423144e87.2
        for <linux-usb@vger.kernel.org>; Mon, 31 Jul 2023 00:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690787972; x=1691392772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HDhfU2FoK8aIJGXr0hUVQrh/P1Qtr8xU+ls50+YP7vQ=;
        b=pKUFzvIbDXE4qehMCnW185ujZVoxzM64vjsTHYaa8ZifxCwJAiCOV4K51poAf0woPb
         muInJ8nf1Af/KfLwxvGlbcAUyoJOZ0qV8NBPaysp7o5K37pth4xxejw2Pg0iBvQYW4JE
         mZzqjyezpf6KybQarU40lVrLbZwaPufKxzExD2aL3F+CsesXxcNMl05REvmtpK25WGrG
         TpdhGXnGeN2HSZR+t8j5Trb59cIfT8YhhM1LT41WTyvF+1QwUcNWCsxOKLZ2MKbSy4Yg
         zdsTSFzD5Xp5hRP3u5GdBIPYiUtm+oUlJptM/AqhbnMiqCNFoAZ/G8n4mCJ9Jhgr4qIw
         CHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690787972; x=1691392772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDhfU2FoK8aIJGXr0hUVQrh/P1Qtr8xU+ls50+YP7vQ=;
        b=aPPj2KvyzAf1d66DYej61IfA4/VquIRXX+4z5WkIGmkddOS4n6QHgkIeQKTkwVjhPI
         K7xZM4YeEGBmxiLTLv4XxuCmPC7+8lG9t+ghZLerizvpMqXyv4Dq3fPfAjbyepHosXBg
         Q84WkJLF9vGsLycbkn9zAwvFsy++QtpyQhGTAm1D3aknquXQMNh3P/2llgTcUjuKw11B
         6HlHfC288WgMYFqohSIuutkEn16L8BjMKR6MDX/LJr1HGAPI4fwUhGyPktY1lgNOOEf9
         xpB4l9bso8POAZ8zP8qIJkbvipfkLPox0M4/d3ME0GJ6lfs9cUnntBsm8/ee9znkU5eE
         0Fdw==
X-Gm-Message-State: ABy/qLY094er3qAf3ZC+oamlR7tbbvowj2Dt6zyloBhQQVmxV+oQOLnF
        UISH95AJBZinG/sD4g8bDkRdWg==
X-Google-Smtp-Source: APBJJlEFmmxgVpsb4VKdX/OmDgm7CzXZk2Cy1ts84q1OxjZfrnZW6wz1kgkFsMhlbMY/DhcQwIQTHA==
X-Received: by 2002:a2e:8ed0:0:b0:2b9:4b2e:5420 with SMTP id e16-20020a2e8ed0000000b002b94b2e5420mr5467379ljl.52.1690787971721;
        Mon, 31 Jul 2023 00:19:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c4-20020a2ea1c4000000b002b71c128ea0sm2413267ljm.117.2023.07.31.00.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 00:19:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/display: simplify support for transparent DRM bridges
Date:   Mon, 31 Jul 2023 10:19:27 +0300
Message-Id: <20230731071930.3928150-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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

Changes since v1:
 - Added EXPORT_SYMBOL_GPL / MODULE_LICENSE / etc. to drm_simple_bridge

Dmitry Baryshkov (3):
  drm/display: add transparent bridge helper
  phy: qcom: qmp-combo: switch to DRM_SIMPLE_BRIDGE
  usb: typec: nb7vpq904m: switch to DRM_SIMPLE_BRIDGE

 drivers/gpu/drm/display/Kconfig             |   9 ++
 drivers/gpu/drm/display/Makefile            |   2 +
 drivers/gpu/drm/display/drm_simple_bridge.c | 125 ++++++++++++++++++++
 drivers/phy/qualcomm/Kconfig                |   2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c   |  44 +------
 drivers/usb/typec/mux/Kconfig               |   2 +-
 drivers/usb/typec/mux/nb7vpq904m.c          |  44 +------
 include/drm/display/drm_simple_bridge.h     |  19 +++
 8 files changed, 161 insertions(+), 86 deletions(-)
 create mode 100644 drivers/gpu/drm/display/drm_simple_bridge.c
 create mode 100644 include/drm/display/drm_simple_bridge.h

-- 
2.39.2

