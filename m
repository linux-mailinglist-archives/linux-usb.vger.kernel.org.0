Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9076D76C209
	for <lists+linux-usb@lfdr.de>; Wed,  2 Aug 2023 03:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbjHBBSx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Aug 2023 21:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjHBBSu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Aug 2023 21:18:50 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEEA3269A
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 18:18:48 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b9a828c920so97724021fa.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Aug 2023 18:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690939127; x=1691543927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V+gWA/tO3az5qnPtCpr5Q7+4MvP6fpYV/Vi7gO7EqLw=;
        b=WkuenX1ZTdY/VOYXWxbQJV8Vc00bZbCUdBzSDngguxOoG6ibp25OywDJSSx75jNId8
         jEp4UwttDm1pFZfJzhWp2WIC26nRfduG+Xj1bwckcg87vt1Rv5z+dyqKqMtVMWv/fk1r
         8eCoraLT1t5H4p7VcZUH7mNNXZi5x3qcTSK7qeTzNSBlEae8I15/yGpZW1cKnJQxdXRt
         Cf54hC/ZeMUw2oCwHMmhkZapJFk8YDQr0HSpMrvpR9Uua+ODp+fWyy69iFkIXzWmDZE6
         bqzMpzt1MyzIfu8TXYeFCny+buMiUmGpa+ZU2Ws+bfzwyo0Yvq+KRWYBlzB4F9nuXUXo
         /1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690939127; x=1691543927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+gWA/tO3az5qnPtCpr5Q7+4MvP6fpYV/Vi7gO7EqLw=;
        b=QgherFhUX/pJ2a/fsPjTEZdBDfbvHSaYGCvMZlaewQsOClkubC/YKeZV5nb6xpjBpR
         sT+AX9PKxz7NSP6eFxFyYiIRO+rRiM3Y5mxOpsaISIsCuQNJQ3A4gaxTvtitlu5IRDaI
         yaXoz268/7WK0lO3al4jGUjL6jUpqm43Cq3Pu3yHB6phXwtc7NNN/quz86mieGSap5U3
         iWl4my75S6C2lM4n8VMdbIMFg9x3yHuDThNTsX6BWrYULZJzgOi5EHPcQZvk+FIeZS7M
         21y9Th3hKnK3aPK+Cbyj7jdqTObr6h6lSJj8QtY8bUdyxCMcTKt4nwRnViDXabrtr2SS
         JudA==
X-Gm-Message-State: ABy/qLZTjNx7B6Tgr5B8OqIPBm/CJ9PMbK6VtuOitl5qrytFpCxSs+ln
        /Z5RD2uHFsf3U0vUzFsCqTW7WA==
X-Google-Smtp-Source: APBJJlGTXU+qU/iB+Qs91qxaj6dsnClWjqfDO9bvss9c5WHdTTrVKMq8s3kynB6XVZ1Gf6nY1uUfuw==
X-Received: by 2002:a19:2d4b:0:b0:4fb:89e3:5ac6 with SMTP id t11-20020a192d4b000000b004fb89e35ac6mr3626211lft.62.1690939126825;
        Tue, 01 Aug 2023 18:18:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n14-20020a056512388e00b004faeedbb29dsm2775842lft.64.2023.08.01.18.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 18:18:46 -0700 (PDT)
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
Subject: [PATCH v3 0/3] drm/display: simplify support for transparent DRM bridges
Date:   Wed,  2 Aug 2023 04:18:42 +0300
Message-Id: <20230802011845.4176631-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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

Changes since v2:
 - ifdef'ed bridge->of_node access (LKP)

Changes since v1:
 - Added EXPORT_SYMBOL_GPL / MODULE_LICENSE / etc. to drm_simple_bridge

Dmitry Baryshkov (3):
  drm/display: add transparent bridge helper
  phy: qcom: qmp-combo: switch to DRM_SIMPLE_BRIDGE
  usb: typec: nb7vpq904m: switch to DRM_SIMPLE_BRIDGE

 drivers/gpu/drm/display/Kconfig             |   9 ++
 drivers/gpu/drm/display/Makefile            |   2 +
 drivers/gpu/drm/display/drm_simple_bridge.c | 127 ++++++++++++++++++++
 drivers/phy/qualcomm/Kconfig                |   2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c   |  44 +------
 drivers/usb/typec/mux/Kconfig               |   2 +-
 drivers/usb/typec/mux/nb7vpq904m.c          |  44 +------
 include/drm/display/drm_simple_bridge.h     |  19 +++
 8 files changed, 163 insertions(+), 86 deletions(-)
 create mode 100644 drivers/gpu/drm/display/drm_simple_bridge.c
 create mode 100644 include/drm/display/drm_simple_bridge.h

-- 
2.39.2

