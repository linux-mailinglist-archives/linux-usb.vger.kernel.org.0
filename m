Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7E2D13C590
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 15:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729547AbgAOOPa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 09:15:30 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55431 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729534AbgAOONG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 09:13:06 -0500
Received: by mail-wm1-f66.google.com with SMTP id q9so18066453wmj.5
        for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2020 06:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cHePWupVQYFq5WSWbtu+DKlrwjNbx0F5ut33i/8cvdQ=;
        b=mzkIC99uMrE8D+kV9g7rd5cCCZGYgKT5VpBXJDQ0G1q+23phdmwxkPcA+VESl2qhJz
         FpN7INhUhb+DXShOGDO3R1CL74ioRNYAo9S0IQFeh2KX7Orm43rcmVlGqU8v8Py44zmM
         V+pO7oHyIacanzt7xEAQd9qUBdK7YZsfIeH/h8HmO5k9OvbxUB8yn9VLYldri+FDnjYr
         V89uvYu34FiwrREL02179UYHzYFrNrVIlwh4a20XeNoaSCDfQIn/EHmdUSSj5sZj/jic
         bfaRCollMW5SE9+R+TeBp5Y/mtRpbSMD6R9m4Pp6zCIVxvglidN+w53gocyvsPjavXGh
         iGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cHePWupVQYFq5WSWbtu+DKlrwjNbx0F5ut33i/8cvdQ=;
        b=gTLPHPIq2C1ZjCILDoR8FtYv1iN/rQiqvXgK9JKPgHALYWAn6Kv3oaMWNku3OW/M+N
         W/I7gpTKN2t36lvAoB7dSKg+SZn5HCYl/ctwpcA8NYLaNuu3l6uJaY82ybbYAO1UhE1t
         0wFDtirkVM16CJrMiO/iSiGOnu4X9KUBl3SZOPk/n/Ld7uIm1EXWwwBgwUqhDU1xBMfQ
         YIGynh68Ir9k2G7bmjkRX1f4l7TtrkYDuNvYCeaNEhx3YLWI3O0vHLnY+E6wat8roEjx
         1o6wW6ciMdXefcXkPiY8OrfFg+/hBIELwa0M0ms+Bg7j3KflxVct0+LifTqMZlmWj+Km
         DGkQ==
X-Gm-Message-State: APjAAAVlTQXG/5m2PyB9+98pfsY/FzvS7NbrlNMLKWOD1tHtSmMO45Pk
        vIdPF+XpWFPgBUCMiz9NSL0IKQ==
X-Google-Smtp-Source: APXvYqwKHUXDyZcGEKgY13MLBEcZIskib4KUdCBNhiFOsRv5qz4Ex3QcojU2ezdoDk3F/QkW4zTgNA==
X-Received: by 2002:a1c:5444:: with SMTP id p4mr33323312wmi.33.1579097584872;
        Wed, 15 Jan 2020 06:13:04 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id m21sm23730720wmi.27.2020.01.15.06.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:13:03 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 00/19] Enable Qualcomm QCS 404 HS/SS USB
Date:   Wed, 15 Jan 2020 14:13:14 +0000
Message-Id: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series enables the Primary and Secondary USB controllers on the
QCS404, associated PHYs, role-switching and DTS descriptions.

The series takes in a number of patches worked on by a number of people
over the past few years from downstream, through to previous upstream
submissions for both of these interfaces. Additional work has been done to
enable USB role-switching.

1. USB SS
   - extcon has been dropped in favour of gpio-usb-conn as discussed and
     agreed previously by Jorge, Bjorn, Stephen Boyd and Jack Pham [1].

   - Regulator API has been updated following suggestions from Bjorn.
   
   - Sanitzation of the DT compatible name - dropped "snps" entirely
     from the name - it made almost no sense to me and doesn't appear
     consistent with similar naming conventions for Snopsys based IP.

2. USB HS
   - Regulator API changes here.
   - Dropped "snps" from the namespace for similar reasons as above.
   - Dropped "28nm" from the namespace, looked superflous.
   - Changed "High-Speed" to "Hi-Speed".
   - [2]

3. DWC3 Role switching
   - At the time usb-gpio-conn was discussed it was mentioned that
     role-switching was absent from the DWC3 driver.
   - John Stultz has some patches in-flight for that, that I've included in
     this series for completeness.

4. DWC3 usb-gpio-conn
   Needs to be a child node of the DWC3 driver so some code and DT binding
   is required for that.

5. QCOM-DWC3
   Since we are role-switching with an external PMIC supplying VBUS we want
   to skip past toggling VBUS from QCOM-DWC3 controlled registers, so a
   patch is added to the qcom-dwc3 driver to do that.

6. DWC3 USB Role Switching
   - Includes some patches in-flight from John Stultz.
   - Adds my SoB to relevant patches.
   - Drops gerrit ChangeId.

References:

1: USB SS PHY for Qualcomm's QCS404
https://lwn.net/ml/devicetree/20190207111734.24171-1-jorge.ramirez-ortiz@linaro.org/

2: Add Synopsys High-Speed USB PHY driver for Qualcomm SoCs
https://lore.kernel.org/linux-arm-msm/20181127100722.9993-3-shawn.guo@linaro.org/

Bjorn Andersson (1):
  arm64: dts: qcom: qcs404: Add USB devices and PHYs

Bryan O'Donoghue (10):
  dt-bindings: usb: dwc3: Add a gpio-usb-connector description
  usb: dwc3: qcom: Override VBUS when using gpio_usb_connector
  usb: dwc3: Add support for usb-conn-gpio connectors
  arm64: dts: qcom: qcs404-evb: Define VBUS detect pin
  arm64: dts: qcom: qcs404-evb: Define VBUS boost pin
  arm64: dts: qcom: qcs404-evb: Define USB ID pin
  arm64: dts: qcom: qcs404-evb: Describe external VBUS regulator
  arm64: dts: qcom: qcs404-evb: Raise vreg_l12_3p3 minimum voltage
  arm64: dts: qcom: qcs404-evb: Enable secondary USB controller
  arm64: dts: qcom: qcs404-evb: Enable primary USB controller

John Stultz (2):
  dt-bindings: usb: generic: Add role-switch-default-mode binding
  usb: dwc3: Add support for role-switch-default-mode binding

Jorge Ramirez-Ortiz (3):
  dt-bindings: phy: remove qcom-dwc3-usb-phy
  dt-bindings: Add Qualcomm USB SuperSpeed PHY bindings
  phy: qualcomm: usb: Add SuperSpeed PHY driver

Shawn Guo (1):
  phy: qualcomm: Add Synopsys Hi-Speed USB PHY driver

Sriharsha Allenki (1):
  dt-bindings: phy: Add Qualcomm Synopsys Hi-Speed USB PHY binding

Yu Chen (1):
  usb: dwc3: Registering a role switch in the DRD code.

 .../bindings/phy/qcom,qcs404-usb-hs.yaml      |  78 ++++
 .../bindings/phy/qcom-dwc3-usb-phy.txt        |  37 --
 .../devicetree/bindings/qcom,usb-ss.yaml      |  74 ++++
 .../devicetree/bindings/usb/dwc3.txt          |  11 +
 .../devicetree/bindings/usb/generic.txt       |   6 +
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi      |  90 +++-
 arch/arm64/boot/dts/qcom/qcs404.dtsi          | 100 +++++
 drivers/phy/qualcomm/Kconfig                  |  21 +
 drivers/phy/qualcomm/Makefile                 |   2 +
 drivers/phy/qualcomm/phy-qcom-qcs404-usb-hs.c | 415 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-usb-ss.c        | 246 +++++++++++
 drivers/usb/dwc3/core.h                       |   6 +
 drivers/usb/dwc3/drd.c                        | 123 +++++-
 drivers/usb/dwc3/dwc3-qcom.c                  |  17 +-
 14 files changed, 1184 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,qcs404-usb-hs.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom-dwc3-usb-phy.txt
 create mode 100644 Documentation/devicetree/bindings/qcom,usb-ss.yaml
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qcs404-usb-hs.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-usb-ss.c

-- 
2.24.0

