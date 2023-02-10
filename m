Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D432692170
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 16:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232576AbjBJPCj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 10:02:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232357AbjBJPC2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 10:02:28 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFF5573946
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 07:02:18 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso4261705wms.3
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 07:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qp39G98qFTlqqNIRqsFI0UI1JqnIi0IL6h7u1BnaLPk=;
        b=Apsp5Cf9JmBj2IbGvcAhKextZc5qP+SiGFXRxTWbX08ieAyHiuScItIwt1s/jpIiQj
         tajAkzH+u9NCLNxDJIZxv8H0J+VS1geovdAnDAwcKwBOf28gpE80/qJ1QAONXp5fQv70
         8Jt4yfLB+x136iSBH+xGs2pkr+ULKIWIvIr8WxoFXborysU/2cK6ev5aRVdC47vZOEpD
         IxSL8AsMpzWbAAxfrSweRTkZKeEyp8CXJcACAJs1AEoxIsTZs3VT/B0rAo9AgMsZpnfA
         ekPtDYlMg0wcQwimVPFPOIzlo4gu/EuM1FF1Kqg7nOlSXGD83rjvpZFNAmrERkzu2dRb
         FmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qp39G98qFTlqqNIRqsFI0UI1JqnIi0IL6h7u1BnaLPk=;
        b=QCtm7CG68l83pOExSgR3R5hkpZcucXFWKN4V5ltnzpG9jhDERBJwWfdwhQfG3Kf/xl
         gXeZyJl//1LU7Vm2JncIov8i5WV3VdP/qQVPwuEpmChVv1QZDtgJjGtCt54ar0aqJLxR
         MmHH59mylKv0KEgil3wH87H2A0aaQ/H+p3zWlHVjPWH67brJR/D8QJfqq83FN4P8C4Ui
         tHLcbsGBfR1QsN6DRauaTXqYwyPg61Rfw4ePrD3ln5T4qbx1g0HOw7Qom99RNW2sl9J/
         EtDWPGEhoCU9TaB20jIJQh9PRpnqewOEUJasIiG/3AdilHwKcKMbRcGn0bSVJBx0+iIA
         FANQ==
X-Gm-Message-State: AO0yUKUQzQUhX1GkO2RUc9fwout9qCJWv1pQFvuusUrt9+WrCe7YO2wy
        4TASUtoYjcx/RTAHfIwg36SUbcKO5akGYCqJlVU=
X-Google-Smtp-Source: AK7set/u+kGLu3w1ip9GAAvTbS0saaaSjTyyHz+jr/vGeHdDj9p15VN1El6T62ph0JwqYQmMNntP1A==
X-Received: by 2002:a05:600c:30d2:b0:3dc:4fd7:31f7 with SMTP id h18-20020a05600c30d200b003dc4fd731f7mr12377537wmn.41.1676041337313;
        Fri, 10 Feb 2023 07:02:17 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id w23-20020a1cf617000000b003db1d9553e7sm8282482wmc.32.2023.02.10.07.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 07:02:16 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 10 Feb 2023 16:02:10 +0100
Subject: [PATCH v2 07/11] arm64: dts: qcom: sm8550: add port subnodes in
 dwc3 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v2-7-71fea256474f@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v2-0-71fea256474f@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v2-0-71fea256474f@linaro.org>
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
X-Mailer: b4 0.12.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add ports subnodes in dwc3 node to avoid repeating the
same description in each board DT.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 9910006c32aa..2914a12a1c89 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2469,6 +2469,25 @@ usb_1_dwc3: usb@a600000 {
 				phys = <&usb_1_hsphy>,
 				       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
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

