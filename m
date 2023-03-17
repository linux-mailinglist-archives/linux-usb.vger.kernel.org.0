Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 266416BEC34
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 16:05:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbjCQPFE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 11:05:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231432AbjCQPEr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 11:04:47 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D1E010EAB6
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:04:32 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id h17so4714442wrt.8
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679065470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHtc9L9Ht2rX502qI85oDcXvz/j5G9+6+WvzQUk1Sso=;
        b=CDwoO0qB3bjkF66PEHA1sg85Vlta9s/YKzUt0NQaEY5/Yi8aQgFLzDzvC1MkZiiQOx
         IrNaVxILPzGK21s9sq/JINuqeEYpTorxjUwh/zXtd8whBJJskF8WhfjoT1z36pZgEnTI
         7/ocwgpSJMyopdhLZbC5sTgkSreubqeMuNDdsMo8HEtOI4KWEvZIwtGTIbu0upzZ6wxz
         upx/Am/6TRqpTt0C+RS5FWuQbU3PR+nLc96KhnGFKgTxSeLTlvvhTDqmHd7BIKNGFcR2
         kkC4KMlrkSrzyNMRXOYBbwVlZDgewbGcpUJxQgpQgPVYac9521BVMnkToGmnCM2wbRrv
         nGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679065470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EHtc9L9Ht2rX502qI85oDcXvz/j5G9+6+WvzQUk1Sso=;
        b=y5YJkM28WuBRHIvmQSaB7SI48On4Hd+0Lk1S9uZkbK5i6l0IxT1IIpHQBa/fBJJvKp
         7D6KaMx56kdZALNKr/6+wz8mXTnUC1JES87dz8CJqCjUp45Rdh33WnGgXt+PAhG4K55k
         90DVnbABMxP5h8gpve01RVPtV6h5qLqxGHd6T1iCCMgFZue+Yfe6nui6F+rjlu26etrO
         0FrjFxngspvhondhNAUCwQQLkB7DXip+rIbNv6iUYF0T1VEFPE11qaOdUp4BiyBedi2r
         SvSYeDS4r5jm3UIbvVcsjiQX5R6KR43XP+vrhql4mr3ZpcSRbUVDwx3VB2amyowLzlWu
         m0JA==
X-Gm-Message-State: AO0yUKXldY5dN7QaevAafdUDMZXnFrdp61C4GZ2j/owfDhACQg9ADkjn
        vkxlQOiEpwlWNudPwQ0ZpAOemA==
X-Google-Smtp-Source: AK7set9x3pQqArlPUl4575aC+iX1zNfYJbfFBLXeWLeKdSj9sirZvpHAMEMFYgufgbtb4PGpw5CS1Q==
X-Received: by 2002:a5d:428f:0:b0:2cf:eb5d:70b5 with SMTP id k15-20020a5d428f000000b002cfeb5d70b5mr7187114wrq.15.1679065470397;
        Fri, 17 Mar 2023 08:04:30 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600000ce00b002be505ab59asm2133773wrx.97.2023.03.17.08.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 08:04:30 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 17 Mar 2023 16:04:22 +0100
Subject: [PATCH v4 06/12] arm64: dts: qcom: sm8350: add port subnodes in
 dwc3 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v4-6-38bf0f5d07bd@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v4-0-38bf0f5d07bd@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v4-0-38bf0f5d07bd@linaro.org>
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

