Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9C837400DD
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jun 2023 18:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231996AbjF0QYq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jun 2023 12:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231794AbjF0QYm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jun 2023 12:24:42 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58A1530D6
        for <linux-usb@vger.kernel.org>; Tue, 27 Jun 2023 09:24:39 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f95bf5c493so6339299e87.3
        for <linux-usb@vger.kernel.org>; Tue, 27 Jun 2023 09:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687883077; x=1690475077;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ac2fuZLDI+VOF7E3/wybHllWXsSf0j6UFdnadbBE/Po=;
        b=RagTrNyfCbqKFmL5/COzlmp2OV4BoDQDduoZOX9okcl5Q6cBhBFfBfNVCnU9gvf6k0
         aum35/GWH4ip3QzYIXcbfZ3zXtbTybIVjeUFlvZFhYbKh71CkvQV9yCddFb3pULnWhGL
         aUgETYo8Li6iXCbvP2a8uxrReTvKq/Le1NCwaY36Gut3lFl8aIYdm1gjhiomOl982HpR
         zk9mFb+a7eRawfBAycN3XpIKhCaMvOfSy3yxRueqVIkXq4p45pcmp1qijgi/0D8AG74e
         x45eXaLbjS9mXuz/b//aVUuh0epuXyffqQSl4RMMNyz1lEsRJRiPvjJ6Zc+V+laEMnYQ
         vYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687883077; x=1690475077;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ac2fuZLDI+VOF7E3/wybHllWXsSf0j6UFdnadbBE/Po=;
        b=l3OlsA2P9cGSf+x20G2UIR33ymReV58Wn4hEUY3JsIN5QRLAAQRC+860jLhIY9ewtC
         JdOI0vGaq+kvfpxl3AswohgZKCXbvD0TcXTg/1luGKJQq7sGkLv3e2kmGnerRrUHLR32
         CP7/1I9g3izPFfy4s3V7oVKN3LiW6K4X09OxkyUYor9wY2PP214NLqy+wX1M1UWV4Urx
         V+9+li0IwnwCXAZEPMj1IEjdF9dsRyXpzRpRBb/SA6I4mZpI6eeIbcYIxI+nzin5TORi
         MkTp0Ym193UvWGGxXs04AsXPsq95ORcP81r4eHdXTgBsNuHTJu3frb+HObrCoe70dn7+
         RI+w==
X-Gm-Message-State: AC+VfDzsC+gNXuEnLlsSwyShDsEIq3DTeDr32KHm4IMO0vZXzqVXWvIX
        P8yX5V0TjMeYBYRgENNtMdJ3Vi4wjb0dQiDwsiM=
X-Google-Smtp-Source: ACHHUZ5baiFsfppjJDY53hll/tc+5IzTD3GkXavKN4mNfeJ57OBwbIYN7GBvUlJAhzE4yJ5U8QW4Ng==
X-Received: by 2002:a19:6547:0:b0:4f8:7807:a612 with SMTP id c7-20020a196547000000b004f87807a612mr13687312lfj.61.1687883077539;
        Tue, 27 Jun 2023 09:24:37 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id g7-20020a19ac07000000b004fb259a5589sm1190508lfc.104.2023.06.27.09.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:24:36 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 00/11] Even more msm bindings fixes
Date:   Tue, 27 Jun 2023 18:24:16 +0200
Message-Id: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADENm2QC/x2N0QrCMAwAf2Xk2cBsdUN/RUTaLtsCMx2JijD27
 wYf7+C4DYyUyeDabKD0YeMqDsdDA2VOMhHy4AyhDbHtQo+vunLBZ1V6ZJaBZTKM4Zy68ZQvMfX
 gZU5GmDVJmb2V97K4XJVG/v5Xt/u+/wA/heKHegAAAA==
To:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Benjamin Li <benl@squareup.com>,
        James Willcox <jwillcox@squareup.com>,
        Joseph Gates <jgates@squareup.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Zac Crosby <zac@squareup.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Jun Nie <jun.nie@linaro.org>, Max Chen <mchen@squareup.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        alsa-devel@alsa-project.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Leo Yan <leo.yan@linaro.org>, Rob Herring <robh@kernel.org>,
        Andy Gross <andy.gross@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687883074; l=2019;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=XgjesLWlgNJr8TJLOwUfxTcLo95CipHAWt2i0JYkBTw=;
 b=JgfdI6xjrD2WKNtw/etlo3/STHiMGyItJWlD9PYkIxilS+OIFCuH5x4i+sgN1GaISA5RuuyLR
 6/YSU2UHL2kBNk+1Vcu7Tb9gKf1yw31fLLm+tyXqKOc/tyAK5iYQtZz
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series contains couple more random dt schema warning fixes, centered
around linux-msm.

All of the patches (except) the last two are pretty much independent.
Patch 1 is not only a bindings fix, but also a functional one.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (11):
      arm64: dts: qcom: sc7180: Fix DSI0_PHY reg-names
      arm64: dts: qcom: msm8939: Drop "qcom,idle-state-spc" compatible
      arm64: dts: qcom: msm8939: Add missing 'cache-unified' to L2
      arm64: dts: qcom: apq8039-t2: Drop inexistent property
      dt-bindings: sound: Convert pm8916-wcd-analog-codec to YAML
      dt-bindings: mfd: qcom,spmi-pmic: Reference pm8916 wcd analog codec schema
      dt-bindings: iommu: qcom_iommu: Allow 'tbu' clock
      dt-bindings: usb: ci-hdrc-usb2: Fix handling pinctrl properties
      dt-bindings: arm: msm: kpss-acc: Make the optional reg truly optional
      dt-bindings: usb: dwc3: Allow just 1 interrupt for MSM8996
      arm64: dts: qcom: msm8996: Add missing interrupt to the USB2 controller

 .../devicetree/bindings/arm/msm/qcom,kpss-acc.yaml |   1 +
 .../devicetree/bindings/iommu/qcom,iommu.yaml      |   4 +
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   2 +-
 .../bindings/sound/qcom,msm8916-wcd-analog.txt     | 101 -------------
 .../sound/qcom,pm8916-wcd-analog-codec.yaml        | 160 +++++++++++++++++++++
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      |  27 +---
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |   2 +-
 arch/arm64/boot/dts/qcom/apq8039-t2.dts            |   1 -
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |   4 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   3 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   4 +-
 11 files changed, 182 insertions(+), 127 deletions(-)
---
base-commit: 3eedd211ad93c322fb360b83a3d76a2c6cd622dc
change-id: 20230627-topic-more_bindings-325a6f4b93a7

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

