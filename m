Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEA1351A0B0
	for <lists+linux-usb@lfdr.de>; Wed,  4 May 2022 15:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350470AbiEDNXn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 May 2022 09:23:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350455AbiEDNXf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 May 2022 09:23:35 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D45253EAAF
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 06:19:35 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id i19so2819452eja.11
        for <linux-usb@vger.kernel.org>; Wed, 04 May 2022 06:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ue5nidJ0FgSOkV9A6XE/AQJiuFI1b/NbMI7w4KTkEUw=;
        b=xlHE0HflYpbwH/CC2Z4rwyij2uBPYX8NZsx4+Xkh2JeOj0Q00D6Aod+YnHwBQnT1Gf
         Jg2+KilCulGD46SEoAM2IsR/K7aq/XDyNN3tfkfjXALqpd91/Xo94BTMZjSsmUQXZ8YB
         a+PC9BrY9ZK3b63NfjPPx5tStXjxpG2ntk9k/xeYz/uEewMRlOcDnk17DyRcAnIfaIJ2
         80wVdb8D38q0Hxe55TIZ3o/0W1x9MDSCNG0LFR92hiUUc1D/b2LxBK1BVF73lQGByRPe
         MjXK+LEBaP+jjqw0nufQ4IYJx8JHS2up+LaBMM7HtGmk7Au2JwbWKkfTORkeVwgovqne
         JmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ue5nidJ0FgSOkV9A6XE/AQJiuFI1b/NbMI7w4KTkEUw=;
        b=w+Z4RP9f16jGBUv+Jj2DkxXZgaAGl3lYcoB+rCuSNKiKd2rUJZSuw5aaiibpG+oN4g
         0Yfu7jhaE70YL1CsRETomdiWlgwtmiWf+E0fq1JToyQFXlAsWRJ2BdFVxRQRyR1LfNvQ
         oDbcsiLgDhYcKXXTGihy6KPgk3EjTGtmk08y3Ynjyzs/u3NtsxxFO96n53GFcDPcJhUW
         At8WhjxnoyLR8IFrmaEqIjoqVVcSRWUG1kJGeBAM72Xi5hJn2IOSjPL4Hm2faq8qMFeX
         PtqX9PASlRkyoea422ShiL19pg1rjiCVCidkQ0nFtnKFESsjSQGFoGfnisWHxA4MrjXM
         TzzA==
X-Gm-Message-State: AOAM531A30P6PZpciEXSLTXRb+tbn0jqACfM/q5yqy2jimWHJNi0jJMu
        eBfwitawVrT5xxyc38u7uo0vMg==
X-Google-Smtp-Source: ABdhPJyRzd6XWfJNIx8KQsKnEd2wI67m1Lls1/7tvhUchH1Je2bYYorRP1P/zV0RLHlb5bT01tSECg==
X-Received: by 2002:a17:907:969f:b0:6f3:dede:f2d2 with SMTP id hd31-20020a170907969f00b006f3dedef2d2mr19927779ejc.511.1651670375416;
        Wed, 04 May 2022 06:19:35 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gx3-20020a1709068a4300b006f3ef214dc4sm5660924ejc.42.2022.05.04.06.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 06:19:35 -0700 (PDT)
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
Subject: [PATCH 07/13] arm64: dts: qcom: ipq8074: add dedicated qcom,ipq8074-dwc3 compatible
Date:   Wed,  4 May 2022 15:19:17 +0200
Message-Id: <20220504131923.214367-8-krzysztof.kozlowski@linaro.org>
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
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 519938530c35..253fde08db44 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -553,7 +553,7 @@ qpic_nand: nand@79b0000 {
 		};
 
 		usb_0: usb@8af8800 {
-			compatible = "qcom,dwc3";
+			compatible = "qcom,ipq8074-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -593,7 +593,7 @@ dwc_0: usb@8a00000 {
 		};
 
 		usb_1: usb@8cf8800 {
-			compatible = "qcom,dwc3";
+			compatible = "qcom,ipq8074-dwc3", "qcom,dwc3";
 			reg = <0x08cf8800 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.32.0

