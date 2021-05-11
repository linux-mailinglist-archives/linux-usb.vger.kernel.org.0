Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA96437A28B
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 10:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbhEKIwP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 04:52:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230370AbhEKIwN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 May 2021 04:52:13 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46D97C06175F
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 01:51:07 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id y124-20020a1c32820000b029010c93864955so742780wmy.5
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 01:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QF3gKv7VTtDVAFANjakXh9njdRISNpRUS3Lr86kJVaY=;
        b=okWZdckEqGZUXxO3Zjpwgy3oHKs5yLJFHVgqgQY+OITUgoGjavCiCBgizlvL21Tlq/
         xfu8EdJWz4GZ4rKFkbbjrAukgz3gMZiNs52UxS4PKXG/G5b4AkL4N5ruDcRO35ykUkKW
         qKCV8M06TMNJ4l860Mi8zjMC8AML3nGgzuE8PnU48rhmFYWKmeQmRRoAwFqpygGyQ1kA
         QVfxeXJBVB2x98WTh/9U98c8+4JOGuCgi4qoEFsz0MPPW/NgJrIHsleiWbtoQxgc7Xcn
         aFPxfLozWrqfiXDQUSPE+qcws/5x6Upc+mfQng4oT7h0qZVszE7dswxrUEfL1ASv4V88
         N+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QF3gKv7VTtDVAFANjakXh9njdRISNpRUS3Lr86kJVaY=;
        b=NNA4lY2a1ZDRc6Rjw2PehPBwm+2H/TeXbKOyrV+f/s+TtyI2Jtu/bSV19QlZ1p/isv
         rZKiC5isbndqQGrnXNuzKelwzcH4hs+rUGta2VKE9mvioZJP8X+jn/qv/fMpTgoenjBq
         +k6BtO5oV/V50FH7zDxHLdboY/+7n2MwDKekE5qCH8F19B0Ysx3gN2jKZyYaSdk/H3IK
         2VipwbCbGAZaFOdE5XFcn0ZuiFqeUeMFstjjCZ3Euu4Hy7OsJY/1DOZdlWlYiTK+UdD7
         iOK1qjmuLmjFhmupbrQT8MEJln/TtkeGF0WqJ2SiVKJJdfWaqJBAi4HFEbsHPrBlydVy
         l43Q==
X-Gm-Message-State: AOAM530zJl9YqQo6CRe05vvZrWCPE7XxBJ1YMgcrjKGKOk57dkvToWvg
        xcKPhzTtG2pftF2Qwrk+khfuNA==
X-Google-Smtp-Source: ABdhPJyaMx5QLAIag6J1ENl4JC/bE4/GzFR/uT4VfoGaI2CeMRe1M+ktjHPKotLWzxB2FlwM5wiqQg==
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr4159209wmb.142.1620723065986;
        Tue, 11 May 2021 01:51:05 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id j7sm23042980wmi.21.2021.05.11.01.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 01:51:05 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v2 0/9] usb: isp1760: extend support for isp1763
Date:   Tue, 11 May 2021 09:50:52 +0100
Message-Id: <20210511085101.2081399-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Arm MPS3 FPGA prototyping board [0] have an isp1763 [1] as USB
controller.  There is already support for the isp1760 and isp1761 in
tree, this series extend the support also for the isp1763.

Move register access using regmap, remove some platform data and code,
refactor the mempool, use dr_mode to align to existing bindings, then
add the support for isp1763 host mode, add bindings files that did not
existed and at the end add also support for peripheral mode for
isp1763.

@Laurent and @Sebastian, I add both of you in the bindings files as
maintainers (it is a mandatory field)since you were the ones which
contributed with the initial code and peripheral code, let me know if
you are ok with it.  If yes I may send a follow up to add also entries
in MAINTAINERS file that it is also missing.

v1 [2] -> v2:

kernel test robot:
- add two patches (1/9 and 3/9) to fix dozens of pre-existing sparse
  warnings so that this series does not introduce new ones.
  No sparse warning left.
- fix duplication of regmap fields

Laurent:
- move initializers from .h to .c
- change interrupt registers setup from field to one shot register
  setting (did not change hcd hw mode init because I think it did not
  make the difference and even avoid artifact around setting twice the
  register)

Rob test bot:
- fix suffix at compatible string to clean up warning in bindings

Cheers,
   Rui

[0]: https://developer.arm.com/tools-and-software/development-boards/fpga-prototyping-boards/mps3
[1]: https://media.digikey.com/pdf/Data%20Sheets/ST%20Ericsson%20PDFs/ISP1763A.pdf
[2]: https://lore.kernel.org/linux-devicetree/20210504101910.18619-1-rui.silva@linaro.org/

Rui Miguel Silva (9):
  usb: isp1760: fix strict typechecking
  usb: isp1760: move to regmap for register access
  usb: isp1760: use relaxed primitives
  usb: isp1760: remove platform data struct and code
  usb: isp1760: hcd: refactor mempool config and setup
  usb: isp1760: use dr_mode binding
  usb: isp1760: add support for isp1763
  dt-bindings: usb: nxp,isp1760: add bindings
  usb: isp1763: add peripheral mode

 .../devicetree/bindings/usb/nxp,isp1760.yaml  |   59 +
 arch/arm/boot/dts/arm-realview-eb.dtsi        |    2 +-
 arch/arm/boot/dts/arm-realview-pb1176.dts     |    2 +-
 arch/arm/boot/dts/arm-realview-pb11mp.dts     |    2 +-
 arch/arm/boot/dts/arm-realview-pbx.dtsi       |    2 +-
 arch/arm/boot/dts/vexpress-v2m-rs1.dtsi       |    2 +-
 arch/arm/boot/dts/vexpress-v2m.dtsi           |    2 +-
 drivers/usb/isp1760/Kconfig                   |    4 +-
 drivers/usb/isp1760/isp1760-core.c            |  513 ++++++++-
 drivers/usb/isp1760/isp1760-core.h            |   44 +-
 drivers/usb/isp1760/isp1760-hcd.c             | 1021 ++++++++++++-----
 drivers/usb/isp1760/isp1760-hcd.h             |   57 +-
 drivers/usb/isp1760/isp1760-if.c              |   41 +-
 drivers/usb/isp1760/isp1760-regs.h            |  435 ++++---
 drivers/usb/isp1760/isp1760-udc.c             |  250 ++--
 drivers/usb/isp1760/isp1760-udc.h             |   13 +-
 include/linux/usb/isp1760.h                   |   19 -
 17 files changed, 1758 insertions(+), 710 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
 delete mode 100644 include/linux/usb/isp1760.h

-- 
2.31.1

