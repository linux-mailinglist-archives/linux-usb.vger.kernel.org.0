Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E109B6B254C
	for <lists+linux-usb@lfdr.de>; Thu,  9 Mar 2023 14:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbjCIN2Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Mar 2023 08:28:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbjCIN2N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Mar 2023 08:28:13 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66BE0265AA
        for <linux-usb@vger.kernel.org>; Thu,  9 Mar 2023 05:28:09 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so3584459wmb.5
        for <linux-usb@vger.kernel.org>; Thu, 09 Mar 2023 05:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678368489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7uAEq2TyKPhC0hnHOKkhkUFcLViZrukZ67+qR1wCW4=;
        b=RcSeibF5jTfFoLcLRn9u1iEpv9nekNW/d3R1mLLs6x4O8xQ794BZC2mBQqq7RZvFO9
         0h8vt3KZ8jU7nM/50d4/uuqav0zRRI+aPfx+x/rJc1Cf1Bi+OTkRvDt2xWUdJUTwDmYN
         FixSm82S7ilVgvhx2BnDFFVWZvXzEsrKerm9S4CUIF5cMcXCn6Q05YJ/wIT2G2wh4Sgm
         upp5zLsG6R4u9fQL8pvfSs+LRUidwswZsuoiYwFIhOypCv4Pk3Whd5xSWfLTym0U8CGC
         M9YbDR6Z08sRx4JLiRidi6k4loGXTPipYRBq+VTDO2eHcci4W7DYnQ/KBxu376c5VQFI
         xNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678368489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7uAEq2TyKPhC0hnHOKkhkUFcLViZrukZ67+qR1wCW4=;
        b=0RgdwHj5Wo+pGh00MjUh8wDUyfrbBajablQXq0MPCNKS+1CVYMID11Iv92Nkmho6r8
         G/wzwoZ42ZWvdbKV5pxUcHUIp2x2Wx5mzSeEEL6lQ+I4wYWUqaJB4uwgMlH4l1uZLXLn
         F07ZHyyL574nVFnD1ch4vxX+Znwclo+cueSRGUZeG6eA6DzJrxI4gzkg+2Q9wXnNNNO0
         +S/Hm8BD5G5g4tYmM/LKWfK7bvFyx4Ct1LcEPpOD0I+bcUiqHY+1YQTbXypcxK7MOWl4
         1IUuyFTRjlQuuSDpFxnA6DRsOD3cGgExkWab+6+HQ5Cj5RUO/y+WxXXXUpehCtHPh1g7
         MWxg==
X-Gm-Message-State: AO0yUKWlFO+pI4bL+gd3kk1B9/pUHwoqaHGnAA6BMZ06mCaUNGGS2FMM
        PLAwup9iVAObTwzyU0zflQTvDQ==
X-Google-Smtp-Source: AK7set8agEIuyZHhm3Ae9uVC754ljdQ41hdv0zYBi46QDJcccdlEumNqtKsTRbap11JDAL5fIaEayQ==
X-Received: by 2002:a7b:ca59:0:b0:3eb:966f:5811 with SMTP id m25-20020a7bca59000000b003eb966f5811mr16513880wml.3.1678368488961;
        Thu, 09 Mar 2023 05:28:08 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c458700b003eb966d39desm2926714wmo.2.2023.03.09.05.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 05:28:08 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 09 Mar 2023 14:27:59 +0100
Subject: [PATCH v3 08/12] arm64: dts: qcom: sm8550: add port subnodes in
 dwc3 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v3-8-4c860d265d28@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v3-0-4c860d265d28@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v3-0-4c860d265d28@linaro.org>
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
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index ff4d342c0725..283163eb01a2 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2467,6 +2467,25 @@ usb_1_dwc3: usb@a600000 {
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

