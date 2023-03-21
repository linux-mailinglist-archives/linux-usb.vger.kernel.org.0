Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 458906C328A
	for <lists+linux-usb@lfdr.de>; Tue, 21 Mar 2023 14:22:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbjCUNWO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Mar 2023 09:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbjCUNWI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Mar 2023 09:22:08 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1E1525959
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 06:21:47 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id h17so13642313wrt.8
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 06:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679404905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ehh+IB7mATn8qRRIIxxLIJvaBEzJ12on/Ve9T/GbUQs=;
        b=DV2TNtsxDYXWXzRZKsFxzxQSej9B2guGqqbcTjPvMfx6ncekyN38PXPJ5uDWG89BZx
         04nAR0KzfWjcgjpNnQb/u72km9Yfm4mWUxTIAuD9xKZ3r7Br7ABhZneOoaReemZekxR5
         1y5UomFFiD10/I64Hd/rFQFuwVCEk+Q+tO49UA6OFfDHxEK4U1vAO2Cuj59nm+xYyqCc
         rrBr6P5eUkoeZvVZNPRTRDEuXetzJUeLv7nyHGIT9RG+1/GhwqVgcXYv1hfPSXjbAqZ1
         v3zvVSq7Of1NIZfALQqg/XkQc92XdsmnWOsHcWz1PKYDaeR+7RHOkfXLuGRr4wgjJIHg
         8iMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679404905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehh+IB7mATn8qRRIIxxLIJvaBEzJ12on/Ve9T/GbUQs=;
        b=aChoSN/M9KTjXk9VNQQ1kLUvtUZi2cY6QGXYL5Vg2RCOJKEJuYpKmvS1ibHY0USBOr
         HVsmraAg2ES5Agn2n6EP3SgWRlER4NJcYu57K8M1P2CVk7M0a7Lzc87jsICx4szvSc6b
         ycm1FzZ9Cu97DX5jjx+N1MwU6FWRu3QHDAvtQ3OI/BKji3s/jSUO0xLFDTdMApZBH0eG
         Am2a3Lj+vNikY66wd9j/KlNeX/qJQpqXydA9IZkw4aiQjhTqAyO7a1UojFB5MavcJYod
         LnRZKIIP4I4Y0gooC505rZ0MyJ9wOSSWjLMlTnC807UNZ6oTa6RZ+GXCOUFrjCFv9XNl
         zHaA==
X-Gm-Message-State: AO0yUKXvgEUS38fdG+ISFdk1rKhtO5/4VTkBnL59MgXwhTN/kc8YY34s
        GG0GKbxzn+9WXdyXgSSv18LO4w==
X-Google-Smtp-Source: AK7set+sqa4/xg261Yb6uzzxiJnOAn/IIZVWphU6jrdstdxV7ma1s/mxy8Ybhw6S9btW4BVnjQVJNw==
X-Received: by 2002:a5d:6603:0:b0:2cf:e3d8:5df9 with SMTP id n3-20020a5d6603000000b002cfe3d85df9mr2057223wru.58.1679404905457;
        Tue, 21 Mar 2023 06:21:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v26-20020a05600c215a00b003eafc47eb09sm13393016wml.43.2023.03.21.06.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 06:21:45 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 21 Mar 2023 14:21:43 +0100
Subject: [PATCH v5 03/12] dt-bindings: soc: qcom: qcom,pmic-glink: document
 SM8550 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v5-3-552f3b721f9e@linaro.org>
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>
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

Document the SM8550 compatible used to describe the pmic glink
on this platform.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index a85bc14de065..6440dc801387 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,sc8280xp-pmic-glink
           - qcom,sm8350-pmic-glink
           - qcom,sm8450-pmic-glink
+          - qcom,sm8550-pmic-glink
       - const: qcom,pmic-glink
 
   '#address-cells':

-- 
2.34.1

