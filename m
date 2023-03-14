Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56D106B9570
	for <lists+linux-usb@lfdr.de>; Tue, 14 Mar 2023 14:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbjCNNGo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Mar 2023 09:06:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231910AbjCNNGa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Mar 2023 09:06:30 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80FBE3A9C
        for <linux-usb@vger.kernel.org>; Tue, 14 Mar 2023 06:03:08 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id z5so15919240ljc.8
        for <linux-usb@vger.kernel.org>; Tue, 14 Mar 2023 06:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678798980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4u3Z3dy+BkRpYnwJeMmsX9DLvnoWFwoNz/SMy/Kse+s=;
        b=v0IzibFTEihlSJHKQ1CIdSgHmXLwPEcw3KrkT3GM6tIrrRT97OAstHx95J5Ipd5YF2
         OAJ22pn9ggm2ZYdwyyM8C/StnyKP3/Y1OmtnKecdKKG/r3N54ItaMrYYFYZj3cKHy6ac
         knTyRcog0Tz+DRtW3zQOkaGbW0VayMnBIerj5PgaqOgFxXLdKnytB7sJH4Aph/LYmFJB
         QHCr7mqIC/VGSL1IC0WulWCvlC4LmG4bL1aVULydoqPu9F+j0wMR3th/neaFzRqAd1pn
         IcqpuVF1zJmqpvIEjGwSBzV1NwX4hwhlsX58p/zjpRRHO8yz2S5qhRSZsmne8BKvTJ9x
         +Qaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678798980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4u3Z3dy+BkRpYnwJeMmsX9DLvnoWFwoNz/SMy/Kse+s=;
        b=10UdxnwmS7bqbP8aS8S+tBfrBartBNHKuq/JLU/U5IlIRmcNrYHGdaDmfzYmTtdS4W
         cBfyzrpJ4RLdSSp+ZFJTGIlPdFVhRdU5UZ14dLc2sxgZoq0HM8vf26oLCcSFd0eo7Nnx
         /9EZuImhpI7ebyDE+QHisdMuf1App+B4rKrTLRRXr3fILZrB+HSo45ZhXjwJvm6ZGe5t
         iPmHip6Q8a3Fw6goqA4XeB9MikmaKuuTjGoqneOWFN0ZtYpVYeU8pqIx1KfUTn57zOIV
         3tfZKHRoUEydqhpCELa/3ATogmekkZhKH/l0o/9fD+nyNrJ7IRm9V3Q0PBRakipw63Uz
         QFbw==
X-Gm-Message-State: AO0yUKX9kH1c1Mp/JFl0CfutW5NhMZbhumKD/x/EZUd9gc6W+Hp1+FlJ
        Sv3lKbLq015p/LByIia23NGK6q4pefMKopFimsg=
X-Google-Smtp-Source: AK7set/RixxVNKujsAXzNyntLdalHXNIeBxQK5g7qnTRfuTqqa5fNYgeB41cA485GhqwyPyUfX88XA==
X-Received: by 2002:a19:f613:0:b0:4dd:af74:fe1a with SMTP id x19-20020a19f613000000b004ddaf74fe1amr821319lfe.48.1678798395683;
        Tue, 14 Mar 2023 05:53:15 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id s9-20020a19ad49000000b004dda74eccafsm395374lfd.68.2023.03.14.05.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 05:53:15 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 14 Mar 2023 13:52:59 +0100
Subject: [PATCH 4/6] dt-bindings: mmc: sdhci-msm: Document QCM2290 SDHCI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230314-topic-2290_compats-v1-4-47e26c3c0365@linaro.org>
References: <20230314-topic-2290_compats-v1-0-47e26c3c0365@linaro.org>
In-Reply-To: <20230314-topic-2290_compats-v1-0-47e26c3c0365@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678798384; l=760;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=N4Xjte+JpBIPh/cB6jQob/nXlB7qFTxxjX08BpaMx4c=;
 b=cHqD/zIBdnuelq4KzPpe+lOLAwsvFvrsDfIS2+ESZPop3zz77xxi1NVoWRRX75v9bCykU+2lLpRf
 it1bWjpxDnXB4TIUAStq4P+tuYLYJi0SmeK0/c6UL3mtMdQbw89A
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Document the SDHCI on QCM2290.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 64df6919abaf..7d4c5ca25e0d 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -36,6 +36,7 @@ properties:
           - enum:
               - qcom,ipq5332-sdhci
               - qcom,ipq9574-sdhci
+              - qcom,qcm2290-sdhci
               - qcom,qcs404-sdhci
               - qcom,sc7180-sdhci
               - qcom,sc7280-sdhci

-- 
2.39.2

