Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8371B68DC63
	for <lists+linux-usb@lfdr.de>; Tue,  7 Feb 2023 16:02:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232382AbjBGPCM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Feb 2023 10:02:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232353AbjBGPCL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Feb 2023 10:02:11 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 489A0144AC
        for <linux-usb@vger.kernel.org>; Tue,  7 Feb 2023 07:02:08 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id u10so8182687wmj.3
        for <linux-usb@vger.kernel.org>; Tue, 07 Feb 2023 07:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ReMP1fTRj+2lUjIQIzq9JI1fRxLOQx1rg3anIwo/iw0=;
        b=sR3NjPoRRzWOQXyUZ0RJ5J0ibpc4nnmKD2/25SisIezzZBC25LC4AmcIRtPy4IQyrh
         tH4X5Jz6nu1BcEBAdmYu9QrEOYMUUTtO2WvNSf4Cj5Lm3JO9dF/PmD/eHshgltg2facd
         1znLlaUm1xqJFK7dVN/X+j4b1wvDVGgqfGo/mtabP13naZhkDBaOk3mNrhUDbFlyplWJ
         5rma2IpkAliJTZGy72WhmOCX8AYG18Rttef4CtKx5W/rBRk7O+E3u6U6JPHPdAA9JNqH
         0pawOk50lHD3P0jIuaTKJhzp2nt9+I+enDxS+9lCHGP7S6vEbSXHs0NXWpujzxXpxo9j
         L4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ReMP1fTRj+2lUjIQIzq9JI1fRxLOQx1rg3anIwo/iw0=;
        b=hSM3CO36Pn0s4+pCuYkM1zVr2mevB/aPEZk7qSde2qM6FivGhb8LZBlVO7RuMkWDy4
         F24TLLtjCuu+Jgcd87xwG1tO1Jvi0w6zk4ONxkHMP04plJZUbXBDJCvmFNL+UwBAgiGb
         bqRLXfAz6GNXsqGFxX8GMJYIoZbfQt0QXMMfGGhThRghqXmeQgkNavygzE7qlNAAgCOR
         4XIxJQ1vOkF7mI5ALvPdec+AxmkK7treO7nE9lCf6IyDKkiAetw1psyVJDDOKrYqdF75
         ekXOs9DQuwcctvUb75m5KzsNbL8wu4Ok4t+c42z7Np3OGAHJPBTb/98b41VOty/MDPJW
         pumQ==
X-Gm-Message-State: AO0yUKXussD/GhM/G0l/CFK8npRxF0wXELcjEAqYFC9y9EUwX+te/n4S
        UlqtQCRis0mnGQ7B2kJmiquOkg==
X-Google-Smtp-Source: AK7set+4Rc6Lc+fXClJniTktYSdYRjfsCxjlMj16mSKHcCU1TSNVVZVGZGFgicaFljxVHNg+9f+BBA==
X-Received: by 2002:a05:600c:4d92:b0:3df:dea7:8e3 with SMTP id v18-20020a05600c4d9200b003dfdea708e3mr3546852wmp.21.1675782126801;
        Tue, 07 Feb 2023 07:02:06 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id g24-20020a7bc4d8000000b003df30c94850sm18264340wmk.25.2023.02.07.07.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 07:02:06 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 07 Feb 2023 16:02:04 +0100
Subject: [PATCH] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: make G12A
 usb3-phy0 optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-b4-amlogic-g12a-usb-ctrl-bindings-fix-v1-1-c310293da7a2@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOtn4mMC/x2N3QrCMAxGX2X02kB/hKGvIl6kbewCNZPGiTD27
 gYvz+HjfLtTGkzqrtPuBn1YeRWDcJpcWVAaAVdjF31MPvoZ8hnw2dfGBVqICJtmKO/RIbNUlqb
 w4C9gCOFCaa6UirNWRiXIA6UsVpOtd5OvQbb9n9/ux/EDKFP+l4wAAAA=
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On the G12A USB complex, the USB3 PHY is shared with the PCIe controller,
thus on designs without PCIe enabled the USB3 PHY entry can be ommited from
the PHY list.

Fixes: cdff2c946f06 ("dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add the Amlogic AXG Families USB Glue Bindings")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
index daf2a859418d..f38a2be07eda 100644
--- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
+++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
@@ -108,6 +108,7 @@ allOf:
     then:
       properties:
         phy-names:
+          minItems: 2
           items:
             - const: usb2-phy0 # USB2 PHY0 if USBHOST_A port is used
             - const: usb2-phy1 # USB2 PHY1 if USBOTG_B port is used

---
base-commit: 49a8133221c71b935f36a7c340c0271c2a9ee2db
change-id: 20230207-b4-amlogic-g12a-usb-ctrl-bindings-fix-a1119e37de3c

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

