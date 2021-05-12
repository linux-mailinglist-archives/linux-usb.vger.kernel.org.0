Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E71737B8CC
	for <lists+linux-usb@lfdr.de>; Wed, 12 May 2021 11:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230328AbhELJGp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 May 2021 05:06:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbhELJGo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 May 2021 05:06:44 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71527C06174A
        for <linux-usb@vger.kernel.org>; Wed, 12 May 2021 02:05:36 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id o26-20020a1c4d1a0000b0290146e1feccdaso913406wmh.0
        for <linux-usb@vger.kernel.org>; Wed, 12 May 2021 02:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gO8AvgLl9HFwqndaKVktinmxN0+f5bMhA1/IrCpeuLw=;
        b=gweUI3Z2x56LzGv1EiyZDz1pOcoKiLp+yk0pZUBekX7/Ph8skI6t9mdUQzIfKljBPG
         5sO4UffjhQNkqVu8CRfqTF4FEjy4mHIY5xc6WhmmQRY1ETeKuuHalaG6ZBqcF2sm1Ck1
         t2SBbIT7PGZU+f5A/OmV8E/neWXFbtrUM2dVYRtztS7R0oIJkcvkTpnu/nvKw9Z7jOlO
         gJ3J3cxqfbEQlTpAOmH2awIRlmZ54Tb2cuWJ65kDZ3LrQ6J+cDjwxI4Ub13C+A+xvAEg
         2WPYvASGem8WfgZb85o3MfckQyfXFgmHRh9sMtFMB9ge97z3aMSz6twlhXNVRS0Z8VZ+
         PrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gO8AvgLl9HFwqndaKVktinmxN0+f5bMhA1/IrCpeuLw=;
        b=ZmO+38dW+5ckOn6zeCsBehIAnAcFHZ89r3k+1fmRNLaEt8VCcVU/LZjsskdPBRaEIA
         EJyEZdpZZg/kUOL5VW5ZLoPUKp9W05QqIkkSgCrXGi578jYNUYzH26U43MdRUKXNGohK
         3lo4/tHOTKUJYSkakE/afqFEmhFDrbTGmkSwvsdypgOr34NRNJ24W+nh1+SKOYyaGWH0
         lRSaTAFFmwRmI2B4W+0B5ppJsUAkrGoG5PJ/PDhyuQ3F21/R98YMu5BEVLsfOE9AiVaX
         wmoXavhLGoamKvPu41X76wuINxiDgjmyyuSiS14BGiIONh68zVEoE63CwK8tbcVCP4dZ
         MMEg==
X-Gm-Message-State: AOAM530DswAbcZD8fk0gz6GiFpl+PQQVVdZ3UAi1PtfRz610Stq/AI+T
        srrC8YSa0K7x/pSAIrGdczvwhw==
X-Google-Smtp-Source: ABdhPJzHQuhFKWa14c7exMsNKVRS7mqH1vtZ1y2BqjqBQQcMjuP0/1Lgcs+jSL1/QNer7tKSMcB5uw==
X-Received: by 2002:a7b:c94b:: with SMTP id i11mr26255290wml.120.1620810335099;
        Wed, 12 May 2021 02:05:35 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id v20sm26679451wmj.15.2021.05.12.02.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 02:05:34 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v3 0/9] usb: isp1760: extend support for isp1763
Date:   Wed, 12 May 2021 10:05:20 +0100
Message-Id: <20210512090529.2283637-1-rui.silva@linaro.org>
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

v2 [3] -> v3:
kernel test bot:
- add select REGMAP_MMIO

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
[3]: https://lore.kernel.org/linux-usb/20210511085101.2081399-1-rui.silva@linaro.org/

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
 drivers/usb/isp1760/Kconfig                   |    5 +-
 drivers/usb/isp1760/isp1760-core.c            |  513 ++++++++-
 drivers/usb/isp1760/isp1760-core.h            |   44 +-
 drivers/usb/isp1760/isp1760-hcd.c             | 1021 ++++++++++++-----
 drivers/usb/isp1760/isp1760-hcd.h             |   57 +-
 drivers/usb/isp1760/isp1760-if.c              |   41 +-
 drivers/usb/isp1760/isp1760-regs.h            |  435 ++++---
 drivers/usb/isp1760/isp1760-udc.c             |  250 ++--
 drivers/usb/isp1760/isp1760-udc.h             |   13 +-
 include/linux/usb/isp1760.h                   |   19 -
 17 files changed, 1759 insertions(+), 710 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
 delete mode 100644 include/linux/usb/isp1760.h

-- 
2.31.1

