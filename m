Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4091702E45
	for <lists+linux-usb@lfdr.de>; Mon, 15 May 2023 15:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242281AbjEONgv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 May 2023 09:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242212AbjEONgu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 May 2023 09:36:50 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2B2210F1
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 06:36:48 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3064099f9b6so8300034f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 06:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684157807; x=1686749807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdPOb/kVKRm2CWLAaTiuZb0Yvx8fGBpCags1edg/orY=;
        b=P2nMy5kWesrwNUFuR6XxUgH50gZSP156WdrgkZUFoEujdrWB2qXaDAAZ27bqjQtaHM
         NsYrqY1X/OKqcdF99Vqe/slbwItiAlGR6xlHlfPaeZi/8V+fMAdS46rLy4SW2przUces
         IZ92U1LNxmzf8QwSuuXMZQpMkWNuvSDWo9jBeLYGlHbwMzSt8Fj+hARO626YfqpMcOgW
         4o6MJcrbMZDwrM+w5OtZL5L39aRPumyk3vGGC7yx0s51Tjpilu6ycbZXbrTocmB4qux1
         CAaEMLSWH2Xb5T48i0mkeBfUnlEUKTRHM3cy1KYcxxJOtYw5hynclp0SId0piJaCLyaS
         DhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684157807; x=1686749807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdPOb/kVKRm2CWLAaTiuZb0Yvx8fGBpCags1edg/orY=;
        b=Anc1YzcKdd+Q5F2zNB+Lubf0dJkuOSjOsiT/szK3+7fEHQcirEiGXvGoV21k9Jkqgg
         rJbQ4AfXTsxMjfDTGgc8DLnWU+/A2MU3oWOgTrPHN6iNQlqpZ+81+0AbXHkEa+mzj5JR
         GryM6iEtWkq7SIhBG000WILel7kSisywZIIEHpugYI5HF1U7qXV5OUJv9nFYdLii6+gK
         bXxPLuxOQ3BQPJ1Y4oNkUerUdZd348OHXppwdGsr3SxvSdvnCVFDLLZ26DuCNbpc15aG
         t8wHkunQtumySiyRpqHbxzoer7E5jDWRloCbogfcY6NdWovVk5pKdraB4SV6PoDZNdBG
         yNOg==
X-Gm-Message-State: AC+VfDwhRMp0+CD4dFhNl1qXh3NhaTtVXTW7VvW+ckYVt03RnAsEs+Pz
        1mfwV9rDPSIpYhV23Nt7Y+L2yw==
X-Google-Smtp-Source: ACHHUZ5T2LTC43PDHW+CSbEU5nTt3qXm05lj7zS9ZugG2rSSW7jgimeIx8QUsaOl3dXKdcJAkxOL4g==
X-Received: by 2002:adf:facc:0:b0:306:30e8:eb34 with SMTP id a12-20020adffacc000000b0030630e8eb34mr25685200wrs.48.1684157807179;
        Mon, 15 May 2023 06:36:47 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d4091000000b003078a3f3a24sm28856634wrp.114.2023.05.15.06.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 06:36:46 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, lujianhua000@gmail.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     konrad.dybcio@linaro.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, subbaram@quicinc.com,
        jackp@quicinc.com, robertom@qti.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 01/11] dt-bindings: regulator: qcom,usb-vbus-regulator: Mark reg as required
Date:   Mon, 15 May 2023 14:36:33 +0100
Message-Id: <20230515133643.3621656-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
References: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
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

The regulator code needs to know the location of the register to write to
to switch on/off. Right now we have a driver that does this, a yaml that
partially describes it and no dts that uses it.

Switching on the VBUS for sm8250 shows that we haven't documented reg as a
required property, do so now.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
index b1cff3adb21b5..7a3b59f836092 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
@@ -25,6 +25,7 @@ properties:
 
 required:
   - compatible
+  - reg
 
 additionalProperties: false
 
-- 
2.39.2

