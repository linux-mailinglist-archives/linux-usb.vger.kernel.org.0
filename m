Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8770851A0C9
	for <lists+linux-usb@lfdr.de>; Wed,  4 May 2022 15:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350488AbiEDNZk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 May 2022 09:25:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350485AbiEDNXg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 May 2022 09:23:36 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B3FB40937
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 06:19:38 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id m20so2816383ejj.10
        for <linux-usb@vger.kernel.org>; Wed, 04 May 2022 06:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2xS+3Wq/qARvDYZ495/QJzgQMFIcqN5BlqQIo6Nwqu0=;
        b=Xv2tW6s0n6YZ8iVchnpOyt+jsm7rAsv5nm12e8wVrOiE76NhrNAykn3GsR+abcbwee
         j8q1fdVKvAY03NUuxp3OouylVW/2muBkZMDCPMGZMNBSnRkUkXvxZq01/FT2nlfK5ZgQ
         DljrEqSK8KnUd3yks7KZVG9X8A2UYSxpXHXKnDse/VVJD3sfm1MoACL3Ke1vNBVgbLaE
         3XPpEgWSTEyZ84IZQoBtueEtnp5lEvIm9f0fI5O4xPlXQCBYiHa3YWlnE1nrKmbCrmI5
         XVrmklD0pJ9OAWtBvq/rbaDP2M+xie/SA3yWzeGi1VOokfWA7bphD+dUi5u1sEcudgiw
         4SfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2xS+3Wq/qARvDYZ495/QJzgQMFIcqN5BlqQIo6Nwqu0=;
        b=euDSoxUxkoF2SSjhqGkJfiX3vYyKW1211os3E37l/qGtyvTjBAmqngQ9B701T7SOA1
         utlbtY12MxDNvDndCAkypmeNDn5fkiU5OA340nvBLQb6ENoyhSE+7IOoj+oThbxj/yZF
         ohDmfeS0xS1Qn4W4/vCp/cVZVHqA8Fv+IId6KLPiLc4XU8z+JdwOZugxhcpLZPDEd5J2
         RN1bn7ssD2XMBakdRI8Boxe1zvtqtoy31GzAmq6CFuvmwO6AJO1pb0PMvemQ9chJu/XJ
         36pEOs7cNZE8cR9DepmvZDHjW/gSSjymfjnl0bDU8cGCPfE644Lcsi22M4cNKx1gmpqW
         VgoA==
X-Gm-Message-State: AOAM532PEQBUdnU4ANZzYVbbM1Ya1Cp8KIV/13fvTHa8YDuVLmjg//+Q
        HfgBDFj6fNcphouJN5n3zA5KXdj3x3x6+g==
X-Google-Smtp-Source: ABdhPJw5+CyL4NjX2j/bsZp3+/uT3m87qFXb6CjbQGBrCcBokpRX6U0WSVDj7IdHjP2m5JHP+hYmNA==
X-Received: by 2002:a17:907:1b28:b0:6f0:836:89b0 with SMTP id mp40-20020a1709071b2800b006f0083689b0mr19282474ejc.379.1651670376494;
        Wed, 04 May 2022 06:19:36 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gx3-20020a1709068a4300b006f3ef214dc4sm5660924ejc.42.2022.05.04.06.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 06:19:36 -0700 (PDT)
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
Subject: [PATCH 08/13] arm64: dts: qcom: msm8994: add dedicated qcom,msm8994-dwc3 compatible
Date:   Wed,  4 May 2022 15:19:18 +0200
Message-Id: <20220504131923.214367-9-krzysztof.kozlowski@linaro.org>
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
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 367ed913902c..10c1cce74dad 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -428,7 +428,7 @@ frame@f9028000 {
 		};
 
 		usb3: usb@f92f8800 {
-			compatible = "qcom,msm8996-dwc3", "qcom,dwc3";
+			compatible = "qcom,msm8994-dwc3", "qcom,dwc3";
 			reg = <0xf92f8800 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.32.0

