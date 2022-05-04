Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57C5551A0B8
	for <lists+linux-usb@lfdr.de>; Wed,  4 May 2022 15:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350732AbiEDNYY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 May 2022 09:24:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350502AbiEDNXg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 May 2022 09:23:36 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9D740A0B
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 06:19:39 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id l18so2834396ejc.7
        for <linux-usb@vger.kernel.org>; Wed, 04 May 2022 06:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EHKSy8u2AYcSiYwpKMBhG78dGQ0CWmrQswGZWwNmBSE=;
        b=AII7DZs1qL3ytQ0tKTDDsyRtxKmN7Vo5x4CZZkN5bfopoIpwxt4ZBX8ZdS8qicRwr5
         dl38rxdZ2WrTVq2Fn32nD7DNHY1pz+0yzJ0lADSWpQQJk+T0R/XgIDyASA6pNhx4FtRN
         56bMwDlYZf8YkIzocvlX5A14yQX3kYHlMI7zJGpgzx4RU7IJX8UfOnfZjNMwKlolphMz
         ikLzjP8utgr8hR6rkDXick46xNEXnvNLrkE2p6lCeldmp45ahO7+5VLu1UvMckqQpMeh
         GmyLPKZ4ST+aaM8t4uBYc6KMkJZrorPI5QTCIsg6P1RhMkv7TR06OTlN++DuKr+b3siK
         RhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EHKSy8u2AYcSiYwpKMBhG78dGQ0CWmrQswGZWwNmBSE=;
        b=5YEDHFR4ZpJJXsuz0yeEtqOurcPa1tgIPTYlrTTGZB7lysRd28ApmsxvAna1fcfzE0
         i0Nt3l/mDo42uZ87bb9vELZkFqUpP6VrVsNy9skEl0dkaaWU9JcqHV0BmvBXf9/0h6QQ
         A4ojmZFlz2eiN0b5gSPUMIBBGw0TmJwTqbRfmSvkoEA1wIUzojbeyXvtf6VsqcSex1p9
         rFuiwAUKw9dRbzc9+IhloELsX0X9xmX1zgb3HxKBDAg5ehgdZjkN457VCZT3v0x2PJ1c
         53d8cfCZFHn4/yzIf4Aaj22SsDaFOF4erf2/gLvG2NnWzn80/lFHgRDOzOMJrZg1dw7w
         533g==
X-Gm-Message-State: AOAM5337amqMQH/E9sv56F4vEOGzpFlTQXLALAqTyFpUWHIoKLyA05cq
        S/R3A59gAl9f1yi5L/YxTr+09A==
X-Google-Smtp-Source: ABdhPJwpnIZFtYA5xNncFRACp4CyShNQZR9ctDuVvi8Lr3eLD0PfhzP7p/JpHNg8QjkqPiUTvEwUhQ==
X-Received: by 2002:a17:907:7b92:b0:6db:71f1:fc20 with SMTP id ne18-20020a1709077b9200b006db71f1fc20mr19139977ejc.343.1651670378673;
        Wed, 04 May 2022 06:19:38 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gx3-20020a1709068a4300b006f3ef214dc4sm5660924ejc.42.2022.05.04.06.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 06:19:38 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 10/13] arm64: dts: qcom: qcs404: add dedicated qcom,qcs404-dwc3 compatible
Date:   Wed,  4 May 2022 15:19:20 +0200
Message-Id: <20220504131923.214367-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504131923.214367-1-krzysztof.kozlowski@linaro.org>
References: <20220504131923.214367-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add dedicated compatible for DWC3 USB node name to allow more accurate
DT schema matching.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 568821259f11..d912166b7552 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -529,7 +529,7 @@ glink-edge {
 		};
 
 		usb3: usb@7678800 {
-			compatible = "qcom,dwc3";
+			compatible = "qcom,qcs404-dwc3", "qcom,dwc3";
 			reg = <0x07678800 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -558,7 +558,7 @@ usb3_dwc3: usb@7580000 {
 		};
 
 		usb2: usb@79b8800 {
-			compatible = "qcom,dwc3";
+			compatible = "qcom,qcs404-dwc3", "qcom,dwc3";
 			reg = <0x079b8800 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.32.0

