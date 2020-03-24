Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABD4F190A90
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2020 11:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727275AbgCXKUl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Mar 2020 06:20:41 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39669 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727120AbgCXKUl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Mar 2020 06:20:41 -0400
Received: by mail-wr1-f66.google.com with SMTP id p10so8274397wrt.6
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2020 03:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RHjJI7aShrh91OoV00QHF3f8tRyA7jklYuLyoaLdZpU=;
        b=VJDW48n7k0ddcp7+Y1+gejwqC9PsCLrSpTZ/9jdmEwACaw5iwrnqY806ZRC+0OlwO9
         3oC8uo/6CWdGg+WAI7bBQjVzQPiPbD1gJXoVYQzvIWBqoKIC7qs0YkR5FtIlMd4ZH2b9
         hMdrR/e2DLI3EPdIi7aTE21K50ivfVFcRs/B2/NcPsJAr8QRdAS0h6PIQ3X9RpKu54/c
         YFCeYN464ihgX9YzRe/YLyMSIIdXkA667q6ZD40Yh7ra5keHqkPffOV7DjDwW9Uiw2kb
         6ExvPUJv7i4DwgeoJGoKN88gGVoxBWoJtTRDlwDFJ3etJaGoP0zemtbE81+TExeKzoQS
         wSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RHjJI7aShrh91OoV00QHF3f8tRyA7jklYuLyoaLdZpU=;
        b=U7n2tXAr8cPEIUr8rwiehy2HsIlviFJgcEKU3WDhiQduR8PSFSmIlEXnNMazKll3Uz
         KvYpHOJfW9Gdk8+eCKRytEv970AgmgWBLn1fpdKQzkDgKjymfw2OeVB6H8i6aFnEc53B
         68UQ+MsebC86/24azQWez/t3mccqJHA62wiO5ENInNcbTfc34y4yXvaDyRdxrVRvY8CT
         dbxJNSHGWAGsfnFOM8msdTHjNqL/kPudAhKoX0O8g9GaLt4QMx8UwZEQMoQz4le6XB6H
         v+8R4W661XLQb3ydWUdw5a8L7lWWT0HYYt+sSYjhuAhegcBS/f1Gdsfkj+FYx3ctlYI7
         fGig==
X-Gm-Message-State: ANhLgQ03yt4KXhEGeHekdVndKwagaYJTI24zD9xehT1O0FB34i3+i6Nw
        kwT9mI1uFyWcE0Sz9SC8Vpmz7g==
X-Google-Smtp-Source: ADFU+vumN7anU9Np/hM8X3RBvL+hlj4hyYLEch8wVFiIMu+fM9wkQYbSGMWshJXNe6Txlxu/iEWbQg==
X-Received: by 2002:adf:efc9:: with SMTP id i9mr15183022wrp.23.1585045238251;
        Tue, 24 Mar 2020 03:20:38 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id h5sm2879527wro.83.2020.03.24.03.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 03:20:37 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 00/13] usb: dwc3: meson: add OTG support for GXL/GXM
Date:   Tue, 24 Mar 2020 11:20:17 +0100
Message-Id: <20200324102030.31000-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB support was initialy done with a set of PHYs and dwc3-of-simple
because the architecture of the USB complex was not understood correctly
at the time (and proper documentation was missing...).

But with the G12A family, the USB complex was correctly understood and
implemented correctly.
But seems the G12A architecture was derived for the GXL USB architecture,
with minor differences and looks we can share most of the USB DWC3 glue
driver.

This patchset refactors and adds callbacks to handle the architecture
difference while keeping the main code shared.

The main difference is that on GXL/GXM the USB2 PHY control registers
are mixed with the PHY registers (we already handle correctly), and
the GLUE registers are allmost (99%) the same as G12A.

But, the GXL/GXM HW is buggy, here are the quirks :
- for the DWC2 controller to reset correctly, the GLUE mux must be switched
  to peripheral when the DWC2 controlle probes. For now it's handled by simply
  switching to device when probing the subnodes, but it may be not enough
- when manually switching from Host to Device when the USB port is not
  populated (should not happen with proper Micro-USB/USB-C OTG switch), it
  makes the DWC3 to crash. The only way to avoid that is to use the Host
  Disconnect bit to disconnect the DWC3 controller from the port, but we can't
  recover the Host functionnality unless resetting the DWC3 controller.
  This bit is set when only manual switch is done, and a warning is printed
  on manual switching.

The patches 1-8 should be applied first, then either waiting the next release
or if the usb maintainer can provide us a stable tag, we can use it to merge
the DT and bindings.

Martin Blumenstingl (4):
  arm64: dts: amlogic: use the new USB control driver for GXL and GXM
  phy: amlogic: meson-gxl-usb3: remove code for non-existing PHY
  usb: dwc3: of-simple: remove Amlogic GXL and AXG compatibles
  dt-bindings: usb: dwc3: remove old DWC3 wrapper

Neil Armstrong (9):
  dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add the Amlogic GXL and
    GXM Families USB Glue Bindings
  usb: dwc3: meson-g12a: specify phy names in soc data
  usb: dwc3: meson-g12a: handle the phy and glue registers separately
  usb: dwc3: meson-g12a: get the reset as shared
  usb: dwc3: meson-g12a: refactor usb2 phy init
  usb: dwc3: meson-g12a: refactor usb init
  usb: dwc3: meson-g12a: support the GXL/GXM DWC3 host phy disconnect
  usb: dwc3: meson-g12a: add support for GXL and GXM SoCs
  doc: dt: bindings: usb: dwc3: remove amlogic compatible entries

 .../bindings/phy/meson-gxl-usb3-phy.txt       |  31 --
 .../devicetree/bindings/usb/amlogic,dwc3.txt  |  42 --
 .../usb/amlogic,meson-g12a-usb-ctrl.yaml      |  21 +
 .../devicetree/bindings/usb/dwc3.txt          |   2 -
 .../dts/amlogic/meson-gx-libretech-pc.dtsi    |   2 +-
 .../boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  |   2 +-
 .../amlogic/meson-gxl-s805x-libretech-ac.dts  |   3 +-
 .../boot/dts/amlogic/meson-gxl-s805x-p241.dts |   3 +-
 .../amlogic/meson-gxl-s905d-phicomm-n1.dts    |   4 +
 .../boot/dts/amlogic/meson-gxl-s905w-p281.dts |   4 +
 .../dts/amlogic/meson-gxl-s905w-tx3-mini.dts  |   4 +
 .../amlogic/meson-gxl-s905x-khadas-vim.dts    |   4 +
 .../amlogic/meson-gxl-s905x-libretech-cc.dts  |   7 +-
 .../amlogic/meson-gxl-s905x-nexbox-a95x.dts   |   3 +-
 .../dts/amlogic/meson-gxl-s905x-p212.dtsi     |   7 +-
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |  45 +-
 .../dts/amlogic/meson-gxm-khadas-vim2.dts     |   3 +-
 .../boot/dts/amlogic/meson-gxm-nexbox-a1.dts  |   3 +-
 .../boot/dts/amlogic/meson-gxm-vega-s96.dts   |   4 +
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi    |   7 +-
 drivers/phy/amlogic/Kconfig                   |  12 -
 drivers/phy/amlogic/Makefile                  |   1 -
 drivers/phy/amlogic/phy-meson-gxl-usb3.c      | 283 ------------
 drivers/usb/dwc3/dwc3-meson-g12a.c            | 407 ++++++++++++++----
 drivers/usb/dwc3/dwc3-of-simple.c             |  30 +-
 25 files changed, 421 insertions(+), 513 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt
 delete mode 100644 Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
 delete mode 100644 drivers/phy/amlogic/phy-meson-gxl-usb3.c

-- 
2.22.0

