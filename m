Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56A133728A4
	for <lists+linux-usb@lfdr.de>; Tue,  4 May 2021 12:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbhEDKUi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 May 2021 06:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbhEDKUi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 May 2021 06:20:38 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B79AAC061574
        for <linux-usb@vger.kernel.org>; Tue,  4 May 2021 03:19:42 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id h4so8731861wrt.12
        for <linux-usb@vger.kernel.org>; Tue, 04 May 2021 03:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XAhUPxTxNcQbbIvKvfzw25Jj6dy++zHmChRguXFSuUE=;
        b=rK+wjiCAQ8EQXDgXeeWkYRSfftNjM4d2OAXFccuy/5p9LC6MWlxq5Ecq+KCW7dSEdn
         VOiYK7H+FErl/x/rfdS6gFaISR/gn8U9P6jxBkDHX4cIgCoSGn8rtBNfia9KdX/DAj1M
         uvHMhRSu5kD7w2OyZ4i+IHs8z7CpGWnkig69Of3+vqVAACtZKty3ScCO8Y7XaFAUtPvl
         kDrFzdouw3oPfsTD7CMbfNUDuzbUqGDEtB1WDCmgYz+tKfk8OiMi8J1Q0RxgYrWjDL+K
         kTZLyB2JXw2Qf2hcMxXWlxZGBj3VB36qNo/f1miUcjHkch/cpVSYZ0KoIyN5cGpFyHu4
         DWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XAhUPxTxNcQbbIvKvfzw25Jj6dy++zHmChRguXFSuUE=;
        b=imNnx/mApaQf1eUprweLWbGPryixKhjgLZhO+XRzy8MNKw1aH53VbBhoCGlJWIC61p
         lNRC6RcZN26/3Uv/CLYGJ2ZPyCYWzjUKwT/5e9Azfh6F6Y7Fq9HtBdaZKCgoBFolq4u2
         b/jeIBZsPeN6e69tHZTKQT5i2Y8m50k7d0dQkdDWkxrr97zX2EiOFhpSI2nlei67u4SO
         +MyTASO8PHAvDQxHZKpMMpVSx1saBt8fvMwoDjI6tsV9Kbo47UcRVxPrLXcMgtim/cCb
         3FJ1ozVnXtVgJGUN3WwLc7W4VQPQr5vBdWGd2K3Xz3UlRRq1hwyFcL7qOeCDyKsrnBd/
         t13Q==
X-Gm-Message-State: AOAM532juhrW1OFifBv478ZJ5G4WOZYG+vd8xr87MW0JnCFp6Vpx2YZC
        O01Lfb2iiBf7cO0Od1h8fRs96g==
X-Google-Smtp-Source: ABdhPJwGNrXvy7AGVBTJ8FBU6cEw0+UnnpWB0jQ3IL1g/6Tg6sUL6IByuYYGmwH2DXJDJVFBfFMGWQ==
X-Received: by 2002:a05:6000:1b06:: with SMTP id f6mr30280003wrz.339.1620123581323;
        Tue, 04 May 2021 03:19:41 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id d5sm16293789wrv.43.2021.05.04.03.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 03:19:40 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 0/7] usb: isp1760: extend support for isp1763
Date:   Tue,  4 May 2021 11:19:03 +0100
Message-Id: <20210504101910.18619-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Arm MPS3 FPGA prototyping board [0] have an isp1763 [1] as USB controller.
There is already support for the isp1760 and isp1761 in tree, this series extend
the support also for the isp1763.

Move register access using regmap, remove some platform data and code, refactor
the mempool, use dr_mode to align to existing bindings, then add the support for
isp1763 host mode, add bindings files that did not existed and at the end
add also support for peripheral mode for isp1763.

@Laurent and @Sebastian, I add both of you in the bindings files as maintainers
(it is a mandatory field)since you were the ones which contributed with the
initial code and peripheral code, let me know if you are ok with it.
If yes I may send a follow up to add also entries in MAINTAINERS file that it is
also missing.

Cheers,
   Rui

[0]: https://developer.arm.com/tools-and-software/development-boards/fpga-prototyping-boards/mps3
[1]: https://media.digikey.com/pdf/Data%20Sheets/ST%20Ericsson%20PDFs/ISP1763A.pdf

Rui Miguel Silva (7):
  usb: isp1760: move to regmap for register access
  usb: isp1760: remove platform data struct and code
  usb: isp1760: hcd: refactor mempool config and setup
  usb: isp1760: use dr_mode binding
  usb: isp1760: add support for isp1763
  dt-bindings: usb: nxp,isp1760: add bindings
  usb: isp1763: add peripheral mode

 .../devicetree/bindings/usb/nxp,isp1760.yaml  |  59 ++
 arch/arm/boot/dts/arm-realview-eb.dtsi        |   2 +-
 arch/arm/boot/dts/arm-realview-pb1176.dts     |   2 +-
 arch/arm/boot/dts/arm-realview-pb11mp.dts     |   2 +-
 arch/arm/boot/dts/arm-realview-pbx.dtsi       |   2 +-
 arch/arm/boot/dts/vexpress-v2m-rs1.dtsi       |   2 +-
 arch/arm/boot/dts/vexpress-v2m.dtsi           |   2 +-
 drivers/usb/isp1760/Kconfig                   |   4 +-
 drivers/usb/isp1760/isp1760-core.c            | 248 ++++-
 drivers/usb/isp1760/isp1760-core.h            |  44 +-
 drivers/usb/isp1760/isp1760-hcd.c             | 898 ++++++++++++------
 drivers/usb/isp1760/isp1760-hcd.h             |  57 +-
 drivers/usb/isp1760/isp1760-if.c              |  41 +-
 drivers/usb/isp1760/isp1760-regs.h            | 698 ++++++++++----
 drivers/usb/isp1760/isp1760-udc.c             | 240 +++--
 drivers/usb/isp1760/isp1760-udc.h             |  12 +-
 include/linux/usb/isp1760.h                   |  19 -
 17 files changed, 1672 insertions(+), 660 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
 delete mode 100644 include/linux/usb/isp1760.h

-- 
2.31.1

