Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12E336C3D78
	for <lists+linux-usb@lfdr.de>; Tue, 21 Mar 2023 23:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbjCUWMw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Mar 2023 18:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbjCUWMu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Mar 2023 18:12:50 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74AFC5709E
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 15:12:47 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id g17so21003086lfv.4
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 15:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679436765;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RvgpZDeCmRQsyPKurV6WYYQqLIwO3CdVYVB5sBeSl5c=;
        b=QcSQaMbNhDT1mLrpJm9bxHS/7BXEBP++byZH2NKc7axMSMmLsLwszqZlQ+a3Yp3uU3
         r/8rIbhvGlq5j6uhsaKKisQTTJON9wPWoQYv8CokKwlLkaFL2gLjzx/znmMRdurkv2vi
         Cld+RTTLK8jTVQhww44pZnRt/7KrNZbOg4OijUqsa3eFKibSHazQrAQ/xc7nfqHMjg0g
         L80RMzJa5TSx+9ZiF0JXuj+7V5PRPTilzK6JaQZJq+elZAxAYxPwTMAn/zJQA4annyhH
         Zflr3LFnFQyHGxvbOi7ZBx1jS+SiDQ27/5YZ0GIsmDIfFMdMPq8yopxNU/3pe5Np4KtM
         Ia9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679436765;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvgpZDeCmRQsyPKurV6WYYQqLIwO3CdVYVB5sBeSl5c=;
        b=8RvDiG4F+i9R1yxdJ4gmqfTbfS/ZT3IXGRCaAUdbVP82PFIl5DTUGQCildvPHmNuNL
         Yicc1KF74koqcm6af1QDy4ahVkwjLGqKI8SQNhVazEE4UWooHIMWZQVYfwA6854NXvIH
         ityrkGTYACOAWsM8mKQj1i41bMENsN++BfzlzdG+lKXzGXdDSqcGXQj5iDz/3YcCe7l2
         yayZHc1Ijr0Hrnl0zm6dYs9B5cmhDCJogaDnevbEsIf6/nf1qDzcAmPkQmge8EkMq9AF
         qadzaVgSz4yU7Vl4jCBBUhXarfU9UZShrPxHy5EHlrxEMHCUBwU+JO2gCwqgart1tgJB
         IqLw==
X-Gm-Message-State: AO0yUKUVA14W+GQCBTtqF+vbckrAWDgbnrq2HDnoBn3FJAsCxcAx+I47
        0+eu23d6qwrETkzLPqjpG2b1Gg==
X-Google-Smtp-Source: AK7set9DuFZ0/GVvujdTGrcvMkSVyDribzWT5knHKK3YffMpYfAaJ1vw/21+RelTRo89PykUk+7qMQ==
X-Received: by 2002:a19:a419:0:b0:4cb:d3:3b99 with SMTP id q25-20020a19a419000000b004cb00d33b99mr1205432lfc.36.1679436765642;
        Tue, 21 Mar 2023 15:12:45 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
        by smtp.gmail.com with ESMTPSA id o15-20020a056512050f00b004e9c983a007sm1220344lfb.289.2023.03.21.15.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 15:12:45 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/4] Enable DisplayPort over USB-C on SONY Sagami
Date:   Tue, 21 Mar 2023 23:12:27 +0100
Message-Id: <20230321-topic-sagami_dp-v1-0-340c8bce4276@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMsrGmQC/x2NywrCQAwAf6XkbGAfHlp/RUTS3bQN1O2yqSKU/
 rvB4wwMc4ByE1a4dQc0/ojKVgz8pYO0UJkZJRtDcCG6GDzuW5WESjO95Jkrej8NjmOfrzGBVSM
 p49iopMW68l5Xk7XxJN//5v44zx9ieccPdgAAAA==
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1679436764; l=1008;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Rts1LWN2BTe8l0VWILmKq9hnsPnZkTBxaeWIjKysvz8=;
 b=A67WQifCRYY1DBo13nrFzRAvZuuZQdhqFm4FNwvWeRzSyP/QQLlO356GImT1XYri8s37N05Bmgxn
 pJz/ouM6A/1BvM6JBAzNcAIcM0t4xCahvZ+zaz12PEZIjgytqu2t
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DisplayPort is there before DSI panel, kinda funny!

Depends on:

https://lore.kernel.org/linux-arm-msm/20230130-topic-sm8450-upstream-pmic-glink-v5-0-552f3b721f9e@linaro.org
https://lore.kernel.org/linux-arm-msm/20230206-topic-sm8450-upstream-dp-controller-v6-3-d78313cbc41d@linaro.org

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (4):
      dt-bindings: usb: gpio-sbu-mux: Add OnSemi NB7VPQ904M mux
      arm64: dts: qcom: sm8350-sagami: Add PMIC GLINK
      arm64: dts: qcom: sm8350-sagami: Hook up USB-C Display Port
      arm64: dts: qcom: sm8350-nagara: Unify status property placement

 .../devicetree/bindings/usb/gpio-sbu-mux.yaml      |   1 +
 .../boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi   | 162 ++++++++++++++++++---
 2 files changed, 146 insertions(+), 17 deletions(-)
---
base-commit: 52581937d6423c3bd15eb3894580ab87fe7308a1
change-id: 20230321-topic-sagami_dp-11f90e38d43c

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

