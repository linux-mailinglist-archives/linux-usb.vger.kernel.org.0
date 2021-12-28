Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 139BE48063B
	for <lists+linux-usb@lfdr.de>; Tue, 28 Dec 2021 06:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232432AbhL1FUS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Dec 2021 00:20:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbhL1FUR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Dec 2021 00:20:17 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A591C06173F
        for <linux-usb@vger.kernel.org>; Mon, 27 Dec 2021 21:20:17 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id i9so20194477oih.4
        for <linux-usb@vger.kernel.org>; Mon, 27 Dec 2021 21:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t9/Q42cL9IQzn8S0oUqtJHRIk8EihJrAdm7N2Ps38H4=;
        b=AgLNEqgK+8hwY6zV5kthAixDaxQj4eYqUwQrrSkVuXw8TExhoEo6j2FBT9fGKz4kf/
         YcZVzElmrof21IeGPBnzlEb6Ju9RYaIDgVJMhmQCNRtz+pFWvniBQ3vlWc6M+gH4xCcf
         tMuB2vKYz00kxgeN59yM5PK5XNKHi1+81VHVpLF1++FCO+X1cARMY/OxiAPYv3VMnMuc
         6ghjoDOFLyyiMhlxMvZ0xhErBpes+FZsEsVx4w1l3q97Po1wpHxffS+g9JmAWOVdXr5j
         2dSTFpurh/VPmvZlRDLAVR24CQIR2+Tch4UpZ4OrBYNeuCoHULZeISiytecCQcwm5MpX
         lJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t9/Q42cL9IQzn8S0oUqtJHRIk8EihJrAdm7N2Ps38H4=;
        b=OP/NP4dhFrynX3Pk7gI7ACoZwSEtQ0O4A9gXVqGTIXJvWDJu3Ced8LRGHtiIYN7Rhy
         s0heA9fIAMqwGoMCG7TPPDwGj9768ivvPRIT7z/RFcdPU7ZMe5jmJpiJHplNBqAVrHYk
         3t4CuYQaNTHVEAbEv2zLPKIXKSLJfxvbKRUv+wsXgKHgooZPwZhGrsZXv91DutXe0/rp
         a5UZC7joQmk3JDg8Dxb0U9iViqyTVzOVtofRWZE+/8LWgNW6SAwzbNDqAAYVWyiPgx92
         YYtocRpYo6Ug1QDmQI/flfTbsVJuh/iEjQC2n6pd7DLdgTaQ76uwwf43vZzYo0l8UWUO
         iQlw==
X-Gm-Message-State: AOAM530NZghJsS1NorxyXudsMjqYs+oljtAfW9dwdK3Nf0OcybpOU9XR
        B0HYLN2eE3qQwSG2kFFnsjZvjA==
X-Google-Smtp-Source: ABdhPJxc8vtB2u0AWKk85NxyiwmI3df7PshPc3CtR9aiP0B23rnjw6FNzRCYvNh1ARtl9vQea5v2ng==
X-Received: by 2002:aca:907:: with SMTP id 7mr15253139oij.128.1640668816508;
        Mon, 27 Dec 2021 21:20:16 -0800 (PST)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j5sm3002277oou.23.2021.12.27.21.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 21:20:16 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH 0/8] typec: mux: Introduce support for multiple TypeC muxes
Date:   Mon, 27 Dec 2021 21:21:08 -0800
Message-Id: <20211228052116.1748443-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series introduces a level of indirection between the controller's view of
a typec_mux/switch and the implementation and then expands that to support
multiple drivers.

This is needed in order to support devices such as the Qualcomm Snapdragon 888
HDK, which does muxing and orientation handling in the QMP (USB+DP) PHY and SBU
muxing in the external FSA4480 chip.

Additionally integration of typec mux and switch in the QMP PHY is included in
the series, as is the new FSA4480 driver. This is done to deal with the
renaming of the driver-side typec_mux -> typec_mux_dev.

Bjorn Andersson (8):
  dt-bindings: phy: qcom,qmp-usb3-dp: Add altmode/switch properties
  phy: qcom-qmp: Register typec mux and orientation switch
  device property: Helper to match multiple connections
  device property: Use multi-connection matchers for single case
  typec: mux: Introduce indirection
  typec: mux: Allow multiple mux_devs per mux
  dt-bindings: usb: Add binding for fcs,fsa4480
  usb: typec: mux: Add On Semi fsa4480 driver

 .../bindings/phy/qcom,qmp-usb3-dp-phy.yaml    |  14 +
 .../devicetree/bindings/usb/fcs,fsa4480.yaml  |  72 +++++
 drivers/base/property.c                       |  83 ++++--
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 176 ++++++++++--
 drivers/usb/typec/bus.c                       |   2 +-
 drivers/usb/typec/mux.c                       | 257 +++++++++++++-----
 drivers/usb/typec/mux.h                       |  12 +-
 drivers/usb/typec/mux/Kconfig                 |   9 +
 drivers/usb/typec/mux/Makefile                |   1 +
 drivers/usb/typec/mux/fsa4480.c               | 220 +++++++++++++++
 drivers/usb/typec/mux/intel_pmc_mux.c         |   8 +-
 drivers/usb/typec/mux/pi3usb30532.c           |   8 +-
 include/linux/property.h                      |   5 +
 include/linux/usb/typec_mux.h                 |  22 +-
 14 files changed, 762 insertions(+), 127 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
 create mode 100644 drivers/usb/typec/mux/fsa4480.c

-- 
2.33.1

