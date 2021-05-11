Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA8DB37B1C6
	for <lists+linux-usb@lfdr.de>; Wed, 12 May 2021 00:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhEKWxg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 18:53:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbhEKWxe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 May 2021 18:53:34 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB64C061574
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 15:52:27 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id gc22-20020a17090b3116b02901558435aec1so2229868pjb.4
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 15:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MoNMrqKHpNoIlrWmHHElwi2Zgk61Xn7OFK++3WUoOmc=;
        b=IO3+l5+HYPtRVdCZtd678/nzTEnB8gsZcFj/BpOZJF3dDCfBW0m9s3KfpSOP0c4vsN
         AKWL8yrs860HI/07jGm3jGQjxPOoF29ld0nhO0rA/LkBTpgJ5lGBGlquqeOpu32S2D1g
         MF602Xh8wuECIHCyJIhcxkt++RNYUSCz4Kaf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MoNMrqKHpNoIlrWmHHElwi2Zgk61Xn7OFK++3WUoOmc=;
        b=m/MNl/ipqzaTwi2TR3rbxyD8mA7hhYk0c1cVP0JJ7AWzocvTCY9Pwn+ACZ6TeLnZfi
         rlfyRKryaC6Sc84YjjX1aZbCtI/WSE45MFK/R+WyExQw6N1TOO7efnn5Du5dvWKz+b0W
         WfkUrwNeiihLtRdVS8V49fa/+mXEve4ch+tdVnh+Er9cJ9vbLRBEd1R4XsKaNcMW5Iy/
         YcEfkyM51pFk/egVBR6JcBePggS0H5+xrrW5O40K2MJyXQFMQNQxrWUVn4ru1BINivoF
         9Xx7KCxcIIyy9EYxNBrrZdH6sKJdC6C2qgpzC81MNP8+44yeVWdpCNYAub47ecI0RJyY
         VxfQ==
X-Gm-Message-State: AOAM533oUfNzj/0DWtMZJNMN4Ri/ox25R+w49CcCgKB/JxjJxwxi+BXc
        uJuSwhSIULBAmNUvPDbojW/dNw==
X-Google-Smtp-Source: ABdhPJyJkpvYFQl8dIjuffCEsX6wfwXKpmoPjao12wYgsRO0/c9PPHShcVturNVIs01FZwIuhkQ4vg==
X-Received: by 2002:a17:90b:3b4b:: with SMTP id ot11mr34824045pjb.189.1620773547184;
        Tue, 11 May 2021 15:52:27 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:f1d7:673a:456e:c653])
        by smtp.gmail.com with UTF8SMTPSA id v22sm14303739pff.105.2021.05.11.15.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 15:52:26 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-usb@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Matthias Kaehlcke <mka@chromium.org>,
        Al Cooper <alcooperx@gmail.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Christian Lamparter <chunkeey@googlemail.com>,
        Colin Ian King <colin.king@canonical.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: [PATCH v10 0/5] USB: misc: Add onboard_usb_hub driver
Date:   Tue, 11 May 2021 15:52:18 -0700
Message-Id: <20210511225223.550762-1-mka@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
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

Changes in v10:
- always use of_is_onboard_usb_hub() stub unless ONBOARD_USB_HUB=y/m
- keep 'regulator-boot-on' property for pp3300_hub

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
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  19 +-
 drivers/usb/host/Kconfig                      |   1 +
 drivers/usb/host/xhci-plat.c                  |  16 +
 drivers/usb/misc/Kconfig                      |  17 +
 drivers/usb/misc/Makefile                     |   1 +
 drivers/usb/misc/onboard_usb_hub.c            | 415 ++++++++++++++++++
 include/linux/of_platform.h                   |  22 +-
 include/linux/usb/hcd.h                       |   2 +
 include/linux/usb/onboard_hub.h               |  15 +
 15 files changed, 600 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub
 create mode 100644 Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
 create mode 100644 drivers/usb/misc/onboard_usb_hub.c
 create mode 100644 include/linux/usb/onboard_hub.h

-- 
2.31.1.607.g51e8a6a459-goog

