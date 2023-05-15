Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2389C702E3F
	for <lists+linux-usb@lfdr.de>; Mon, 15 May 2023 15:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242161AbjEONgt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 May 2023 09:36:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241655AbjEONgs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 May 2023 09:36:48 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02D7AE6
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 06:36:47 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3062b101ae1so8317618f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 06:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684157805; x=1686749805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2xgyQVWHt/6tApzbX0nWPINQCiJrrfNOvPZU3dO2Lw=;
        b=e/OqZuy/AcxkiFeBLLxBQpZTAPCSI7zGUvTgyy9jCLXqMz7dYJLF64RktUBPzKLsSM
         Pim3lbXWHGzcdukwAAFdnf/Xu6rKINCIygtC/xwgL5lQniHVgN3sHUwJsRD8LezAc1W2
         CjOxyLU2TjvNPsfRWXHeiV5XHPp41p3nFyE+2fDJtpz40rsBLoAD3k4hYKvM35KS6Qw4
         kNIFE4uMrW24vCYjtsdFFmLDk5lTbVylsouB0aoJPwLYiXYxOdWnpDRcDY5hgMyHRxQ5
         eondmeQunJd4RBr3rWwyrh/LH8ec0fbh3JMYxTWuztps1DqDY62iDlb5pgebiDwDBC8c
         QgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684157805; x=1686749805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2xgyQVWHt/6tApzbX0nWPINQCiJrrfNOvPZU3dO2Lw=;
        b=J13T0YaoKvGm5z73l7dUo+wrJYQYbloEJPlIOpXWkIIHoUDO0qhHnieM2xXlzP/yOE
         6hw1xsVVNEVUSoc/uYFlyspHrV+SzpjqZv/CWGGWKAKIaAHkyTrE5yE0uTSSbOsGqI0R
         Rw0KL4/0l8N4Yp/+zDUM13SMWEPHzlpaRQDDpDgYWP5E/ZZ3WELEshrkTPcaao13RfxU
         eJAM+/inVJGC9W+/MgIcH7Kd/wESinbJZLLKLiUfnccnwnQpHhJZ00XWj4WOExdevpIZ
         pO1v5UAFiAdTtLsiQ0jJFPO1bZFRes3Rx/lRMnj0fzXjVJutzkjqM+ta3BS0zj8JECu/
         AiDg==
X-Gm-Message-State: AC+VfDytq/hr8vszxCmgqtbwYZ8R7Gvc6vfOLoVZZG5h1NuDkK/ANQsP
        lAyBTJl6SbP421ysffCSjt6VkA==
X-Google-Smtp-Source: ACHHUZ7ombrmXYdqB3tsVKXUSjUAWvC6CUbZnEg7OKxG/YuPpOkswlpgvjwzRJHIixwi3bA7LSFElw==
X-Received: by 2002:a5d:68c1:0:b0:306:28fa:16a7 with SMTP id p1-20020a5d68c1000000b0030628fa16a7mr26764807wrw.43.1684157805476;
        Mon, 15 May 2023 06:36:45 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d4091000000b003078a3f3a24sm28856634wrp.114.2023.05.15.06.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 06:36:44 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, lujianhua000@gmail.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     konrad.dybcio@linaro.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, subbaram@quicinc.com,
        jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: [PATCH v8 00/11] Add Qualcomm PMIC TPCM support 
Date:   Mon, 15 May 2023 14:36:32 +0100
Message-Id: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Bootable tree
Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/usb-next-23-05-14-qcom-wrapper-typec-mux-bjorn

V8:
- Makes pm8150b_typec::status = disabled by default - bod
- Greg merged the TCPM description and driver to usb-next so two patches less now.
  I've rebased this series on to usb-next using "--base=auto"
  All of the kernel robot dts/yaml checks should now pass against usb-next / a4422ff221429c600c3dc5d0394fb3738b89d040

V7:
- Adds R/B to "dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add input and output ports" - Krzysztof
- Fixes indicated, adds R/B to "dt-bindings: usb: Add Qualcomm PMIC Type-C" - Krzysztof
- Fixes indicated, adds R/B to "usb: typec: qcom: Add Qualcomm PMIC Type-C driver" - Guenter
- Fixes indicated, adds R/B to "usb: typec: qcom: Add Qualcomm PMIC Type-C driver" - Caleb
- Adds R/B to "arm64: dts: qcom: sm8250: Define ports for qmpphy orientation-switching" - Konrad
- Adds R/B to "arm64: dts: qcom: qrb5165-rb5: Switch on Type-C VBUS boost" - Konrad
- Fixes indicated, adds R/B to "arm64: dts: qcom: qrb5165-rb5: Switch on basic TCPM" - Jianhua, Konrad
- Connector ports/endpoints left inside of connector
  Documentation/devicetree/bindings/connector/usb-connector.yaml - Jianhua
- dwc3_role_switch_in -> usb_1_dwc3_role_switch_in
  qmpphy_typec_mux_in -> usb_1_qmpphy_typec_mux_in
  Both ports/endpoints defined inside of pm8150b dtsi - Konrad

  I modified the name of both so that the port/endpoint would be directly
  adjacent to the containing node in the dtsi file for code locality/readbility - bod

- Fixes newline indicated "arm64: dts: qcom: qrb5165-rb5: Switch on TCPM usb-role-switching for usb_1" - Jianhua, Konrad
- Fixes newline indicated "arm64: dts: qcom: qrb5165-rb5: Switch on TCPM orientation-switch for usb_1_qmpphy" - Jianhua, Konrad

- connector
  I have left the connector defintion and its ports/endpoints in the platform dts

  The reason for this
  a) Prior art e.g. arch/arm64/boot/dts/qcom/sc8280xp*
  b) The connector is really a non-SoC/PMIC component its something that is defined
     for your platform.

  I'm open to further debate on this topic:
  Link: https://imgflip.com/i/7kw6ck

- port@1 -> port@1 "arm64: dts: qcom: qrb5165-rb5: Switch on TCPM orientation-switch for usb_1_qmpphy" - Jianhua

- OF: graph: no port node found in /soc@0/spmi@c440000/pmic@2/typec@1500

  I left this as-is since the DT model we want is to connect the connector directly to
  the PHY for orientation or controller for data-role switching

  I similarly didn't put this hack in place to remove the warning but "it would work"

V6:
 - I'm dropping the previous V1-V6 log because the text is getting too long
   here's a link to the previous cover letter instead
   Link: https://lore.kernel.org/linux-arm-msm/20230501121111.1058190-1-bryan.odonoghue@linaro.org/


Bryan O'Donoghue (11):
  dt-bindings: regulator: qcom,usb-vbus-regulator: Mark reg as required
  dt-bindings: regulator: qcom,usb-vbus-regulator: Mark
    regulator-*-microamp required
  dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add orientation-switch
    as optional
  dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add input and output
    ports
  dt-bindings: mfd: qcom,spmi-pmic: Add typec to SPMI device types
  arm64: dts: qcom: sm8250: Define ports for qmpphy
    orientation-switching
  arm64: dts: qcom: pm8150b: Add a TCPM description
  arm64: dts: qcom: qrb5165-rb5: Switch on Type-C VBUS boost
  arm64: dts: qcom: qrb5165-rb5: Switch on basic TCPM
  arm64: dts: qcom: qrb5165-rb5: Switch on TCPM usb-role-switching for
    usb_1
  arm64: dts: qcom: qrb5165-rb5: Switch on TCPM orientation-switch for
    usb_1_qmpphy

 .../bindings/mfd/qcom,spmi-pmic.yaml          |  4 ++
 .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      | 44 +++++++++++++++
 .../regulator/qcom,usb-vbus-regulator.yaml    | 10 +++-
 arch/arm64/boot/dts/qcom/pm8150b.dtsi         | 40 +++++++++++++
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      | 56 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 18 ++++++
 6 files changed, 170 insertions(+), 2 deletions(-)


base-commit: a4422ff221429c600c3dc5d0394fb3738b89d040
-- 
2.39.2

