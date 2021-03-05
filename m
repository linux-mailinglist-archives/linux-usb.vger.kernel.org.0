Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0DF532F411
	for <lists+linux-usb@lfdr.de>; Fri,  5 Mar 2021 20:39:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbhCETjJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Mar 2021 14:39:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbhCETjA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Mar 2021 14:39:00 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F04BC061762
        for <linux-usb@vger.kernel.org>; Fri,  5 Mar 2021 11:39:00 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id i14so2465038pjz.4
        for <linux-usb@vger.kernel.org>; Fri, 05 Mar 2021 11:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LG9oyAMtJgx3MZnF1cjNx0Z73nyJ3bl+UDBONgUWEek=;
        b=ggOIM+SG40FpYO7nKWVXfsxUahWUDooTMRZxn5l7gTA+HO/Oshx+xFI2gJm8FjGFWd
         yMO+6a4sKQ33MZPPDgF876Qspmsq41SzfPC/U+EkXbRZT8Zkft54CY+9UkImiYl134kk
         OFr4e0tyCp9zZaaDPh2DcKIA2ZE1YKPtxO9Ao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LG9oyAMtJgx3MZnF1cjNx0Z73nyJ3bl+UDBONgUWEek=;
        b=kxGAfxCkcEHlPL7AK/UVAfkJCnYL48y8T5FipbLT9mGuZtqCQg4xW/xH3IWY7SrJjw
         26L1jwH68Ki+LJH4o22PAypceGmAwtJxGcaTHjshBnoEzDfZoEOKnOjHgHklRVOcQYAX
         RxoRvMjdVqNqGplTs8WZbkHu2Mg/eyGnCef3NEljWHo8QgRiDTXNwBbVA26x7925CHfR
         WyJTnNurPPz4KNnA4eQKRy0Gs4Z7zZZROZF87lQpTQQ7r0K2HAerpdJddKFtV6OavF0/
         PEArmmQAfdf0Qk0IlmKvhtp4ZyazHIOXtvXKeXtemL8p6jtzLf89ZDxGvuOqEnCg87sJ
         HKBQ==
X-Gm-Message-State: AOAM531E7FM67l93G7BuSJ5xafRcOmT9kpL5b9QUNrmk8a8JViW+HU64
        950EkmOvaWn3a9VTJ6JKVOTuYA==
X-Google-Smtp-Source: ABdhPJwEqqVsUn2z3JJUJIjh06VPSNzyrfBYQ53qJrtc/OUW5yoK9NJOztaUq6/kipxliMh2j0bnsg==
X-Received: by 2002:a17:90a:7d05:: with SMTP id g5mr11477597pjl.173.1614973139627;
        Fri, 05 Mar 2021 11:38:59 -0800 (PST)
Received: from localhost ([2620:15c:202:1:2878:25d1:94cb:a547])
        by smtp.gmail.com with UTF8SMTPSA id o13sm3355640pfp.26.2021.03.05.11.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 11:38:59 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Peter Chen <peter.chen@nxp.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org, Bastien Nocera <hadess@hadess.net>,
        linux-usb@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Al Cooper <alcooperx@gmail.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v6 0/5] USB: misc: Add onboard_usb_hub driver
Date:   Fri,  5 Mar 2021 11:38:48 -0800
Message-Id: <20210305193853.2040456-1-mka@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
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
 .../bindings/usb/realtek,rts5411.yaml         |  58 +++
 MAINTAINERS                                   |   7 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts |  19 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts |  11 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |  15 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  21 +-
 drivers/usb/host/xhci-plat.c                  |  16 +
 drivers/usb/misc/Kconfig                      |  17 +
 drivers/usb/misc/Makefile                     |   1 +
 drivers/usb/misc/onboard_usb_hub.c            | 415 ++++++++++++++++++
 include/linux/of_platform.h                   |  22 +-
 include/linux/usb/hcd.h                       |   2 +
 include/linux/usb/onboard_hub.h               |  15 +
 14 files changed, 593 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub
 create mode 100644 Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
 create mode 100644 drivers/usb/misc/onboard_usb_hub.c
 create mode 100644 include/linux/usb/onboard_hub.h

-- 
2.30.1.766.gb4fecdf3b7-goog

