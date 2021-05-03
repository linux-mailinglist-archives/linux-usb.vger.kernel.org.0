Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F15E23720B3
	for <lists+linux-usb@lfdr.de>; Mon,  3 May 2021 21:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbhECTpj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 May 2021 15:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhECTph (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 May 2021 15:45:37 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B33C06174A
        for <linux-usb@vger.kernel.org>; Mon,  3 May 2021 12:44:44 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id h7so3452809plt.1
        for <linux-usb@vger.kernel.org>; Mon, 03 May 2021 12:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5n7PRrkxFyYY/DUpP4RV9Z9dMh8zqGU+uSvPh8xSPyk=;
        b=OUOflD4NStTCK/6H2DEIARGnIGZAmcL/Z72NN4loGh0CSVLyx/bMPq/3ahPBAL0JS+
         0GkyafMf6uMX382ZzdPCDy3i5tneU/8PkXEIChz5+kkKqziuu93p2NRxv+nQ7TVp0jOS
         JrSBoFHkgTPZJKCJqgf6uoXk15UL5v9xpHsy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5n7PRrkxFyYY/DUpP4RV9Z9dMh8zqGU+uSvPh8xSPyk=;
        b=uJQOMy7MCAbk+fiVauJsnVs3v6hxMn10/MQpegFYJY/PqgqXi7Ha61DRUTVZMLjR0C
         gx3V5d+XaTzFNfkz1KlLvfqpYlipgbFRk//GcmCOQuKCr67RisLwp9aivCfzXB8at4M6
         WSXYLz4lPUYhAU5gXYs6c/Z/aQ8SV1lUuEJdiMGhJMUfJHCZ/Y+DRxoHRpeblvwfjF1P
         23Ql6ZSbKUBFzEHzmguWIYOrdLLYRy9FKRGveHkB+Fyoh+EXSHI6tMKzzPc1x9jJBn85
         /i5v+TbcoVVImmeDgcAC9LIw7Kv7DLAymQ3ffX9qERmmukNe2NNtLforjIvCBdTxpT3A
         iUTA==
X-Gm-Message-State: AOAM531+pPcdciBFoARmxIW4lOzfsupHZF/3MZKwHLUYSVE2K7qZ8qC0
        k3XEgKrvEe5t+C7mjdEdETnHGA==
X-Google-Smtp-Source: ABdhPJySStTfI0medBoSVcDYbV74l0ZWhhmSx+mPrsDib5O667sC85u598aJHGyb0VWPBevldrq0Mg==
X-Received: by 2002:a17:902:b18c:b029:ed:631f:63ca with SMTP id s12-20020a170902b18cb02900ed631f63camr22320772plr.40.1620071083748;
        Mon, 03 May 2021 12:44:43 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:8584:3fd:2adf:a655])
        by smtp.gmail.com with UTF8SMTPSA id k15sm10309033pfi.0.2021.05.03.12.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 May 2021 12:44:43 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Peter Chen <peter.chen@kernel.org>,
        Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kernel@vger.kernel.org,
        Michal Simek <michal.simek@xilinx.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Al Cooper <alcooperx@gmail.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Christian Lamparter <chunkeey@googlemail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: [PATCH v9 0/5] USB: misc: Add onboard_usb_hub driver
Date:   Mon,  3 May 2021 12:44:34 -0700
Message-Id: <20210503194439.3289065-1-mka@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series adds:
- the onboard_usb_hub_driver
- glue in the xhci-plat driver to create the onboard_usb_hub
  platform device if needed
- a device tree binding for the Realtek RTS5411 USB hub controller
- device tree changes that add RTS5411 entries for the QCA SC7180
  based boards trogdor and lazor
- a couple of stubs for platform device functions to avoid
  unresolved symbols with certain kernel configs

The main issue the driver addresses is that a USB hub needs to be
powered before it can be discovered. For discrete onboard hubs (an
example for such a hub is the Realtek RTS5411) this is often solved
by supplying the hub with an 'always-on' regulator, which is kind
of a hack. Some onboard hubs may require further initialization
steps, like changing the state of a GPIO or enabling a clock, which
requires even more hacks. This driver creates a platform device
representing the hub which performs the necessary initialization.
Currently it only supports switching on a single regulator, support
for multiple regulators or other actions can be added as needed.
Different initialization sequences can be supported based on the
compatible string.

Besides performing the initialization the driver can be configured
to power the hub off during system suspend. This can help to extend
battery life on battery powered devices which have no requirements
to keep the hub powered during suspend. The driver can also be
configured to leave the hub powered when a wakeup capable USB device
is connected when suspending, and power it off otherwise.

Changes in v9:
- added dependency on ONBOARD_USB_HUB (or !!ONBOARD_USB_HUB) to
  USB_PLATFORM_XHCI

Changes in v7:
- updated DT binding
- series rebased on qcom/arm64-for-5.13

Changes in v6:
- updated summary

Changes in v5:
- cover letter added

Matthias Kaehlcke (5):
  dt-bindings: usb: Add binding for Realtek RTS5411 hub controller
  USB: misc: Add onboard_usb_hub driver
  of/platform: Add stubs for of_platform_device_create/destroy()
  usb: host: xhci-plat: Create platform device for onboard hubs in
    probe()
  arm64: dts: qcom: sc7180-trogdor: Add nodes for onboard USB hub

 .../sysfs-bus-platform-onboard-usb-hub        |   8 +
 .../bindings/usb/realtek,rts5411.yaml         |  62 +++
 MAINTAINERS                                   |   7 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts |  19 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts |  11 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |  19 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  21 +-
 drivers/usb/host/Kconfig                      |   1 +
 drivers/usb/host/xhci-plat.c                  |  16 +
 drivers/usb/misc/Kconfig                      |  17 +
 drivers/usb/misc/Makefile                     |   1 +
 drivers/usb/misc/onboard_usb_hub.c            | 415 ++++++++++++++++++
 include/linux/of_platform.h                   |  22 +-
 include/linux/usb/hcd.h                       |   2 +
 include/linux/usb/onboard_hub.h               |  15 +
 15 files changed, 600 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub
 create mode 100644 Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
 create mode 100644 drivers/usb/misc/onboard_usb_hub.c
 create mode 100644 include/linux/usb/onboard_hub.h

-- 
2.31.1.527.g47e6f16901-goog

