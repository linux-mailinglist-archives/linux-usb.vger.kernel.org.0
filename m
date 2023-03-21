Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44C146C3291
	for <lists+linux-usb@lfdr.de>; Tue, 21 Mar 2023 14:22:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbjCUNWR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Mar 2023 09:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbjCUNWM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Mar 2023 09:22:12 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6C9228E44
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 06:21:50 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id m2so13664837wrh.6
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 06:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679404908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHtc9L9Ht2rX502qI85oDcXvz/j5G9+6+WvzQUk1Sso=;
        b=aGEviax9cButx4OYxXzArxr0BP0GiAp5FrXFrOwEXmPPXDaQspsbfNerOBnCbEY+UN
         SCmlE6m/mxEzmxE4jjYbeJaERSrPj5epZjLeoL5j+QrgPTgOzr2K4J4JX6tBy1DrrfWD
         WB8iaVdOPydBW6YZfuFAkOwuhGOM39Vyuzg7rJHmYi1xPJ6nYXvsOkZtG2PK0I5nR8im
         0JNeYHKtGpCLka5quReP3a4KPfkx+2f8U6+mCViJiAj6rBh2dcgM4XfQbY4FrZvxN89B
         VlPwpYCC1UrOOI7xF5SfPbFVsV/iIW++/HA45TBSYp0AGIHHRl79Xn8M2itgecnOSsF2
         3oFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679404908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EHtc9L9Ht2rX502qI85oDcXvz/j5G9+6+WvzQUk1Sso=;
        b=JfGCeTBsc85WllgccjlgayN9bdAtunv2FTx9j+xQjcSuBDL09htuEfOCjqjff86WAq
         11ijNo5lBoB7CiGDcCsTTfE6uFV86Rpi7E9bn6ho2oM78bmyX4UaftGp9+Lkv9S33RbZ
         UmQpEhtFqZJQrMKMe0lo2s/i5RyriPI5kt7uFJ8eHsMTvYY8X7+024NzkmvVyTeVTP9w
         6ilaTddX9kxpVVbrPg2s1oEDrCbsi3KtRlvyoBWITFZ3we++ewfZII4ho1sgqzxpcR42
         pdDnqJ/KR2AcGdHQVoOW9Ul//fI2PcE9lxBB5GYE6Luhj1yxnRP0n7zeM2Aqw45vZezD
         BEeA==
X-Gm-Message-State: AO0yUKVx3UWYP5X2P1Sw3J16K0/cDRZQVYVDmUicGqi4+ZzidKEQpPcN
        OUpzC1yg4JywXRH6w9XXnF807A==
X-Google-Smtp-Source: AK7set/eRqsiH1IbdiN9YGqBgiclFTx3cG/w3JYeWlO9StPblmSjprbDvhNblDc1SFgt8Ko9RPv3CA==
X-Received: by 2002:a05:6000:124a:b0:2bf:f4f7:be9c with SMTP id j10-20020a056000124a00b002bff4f7be9cmr2244375wrx.14.1679404908193;
        Tue, 21 Mar 2023 06:21:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v26-20020a05600c215a00b003eafc47eb09sm13393016wml.43.2023.03.21.06.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 06:21:47 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 21 Mar 2023 14:21:46 +0100
Subject: [PATCH v5 06/12] arm64: dts: qcom: sm8350: add port subnodes in
 dwc3 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v5-6-552f3b721f9e@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v5-0-552f3b721f9e@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v5-0-552f3b721f9e@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add ports subnodes in dwc3 node to avoid repeating the
same description in each board DT.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 1afc4311796e..6c3a82c63585 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2270,6 +2270,25 @@ usb_1_dwc3: usb@a600000 {
 				snps,dis_enblslpm_quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
 				phy-names = "usb2-phy", "usb3-phy";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_dwc3_ss: endpoint {
+						};
+					};
+				};
 			};
 		};
 

-- 
2.34.1

