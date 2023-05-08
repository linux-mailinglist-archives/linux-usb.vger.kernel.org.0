Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03A9B6FB284
	for <lists+linux-usb@lfdr.de>; Mon,  8 May 2023 16:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234559AbjEHOX1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 May 2023 10:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234544AbjEHOXZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 May 2023 10:23:25 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D47C10E3
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 07:23:21 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f417ea5252so14665955e9.0
        for <linux-usb@vger.kernel.org>; Mon, 08 May 2023 07:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683555799; x=1686147799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdPOb/kVKRm2CWLAaTiuZb0Yvx8fGBpCags1edg/orY=;
        b=yIBHKDr9ml1J2JcqNoaWW7WrzMFuA9l8xBp6pK2Ix/vQOqi43fpjss3oEUpgmoYWVP
         MpZZ9+LGV5oP64MTmToAiznCGOZdX7UuoXw81rli8Gqs5YoQZcuhIgHc7zvg+r35i2sZ
         BAGmYP+tBlftcOsyy4GNNEsfzRNaqycPZwFGQtTc/urJZxRDMomCBAZufgXmtdENAYyc
         7VmJ90x2HoYwxed+ux2sYLFmdhoBEMDDV7SFQkt1xcx9MfJwPopPRf8J2q5o3MBIbwVW
         vLJ0aCWOKdVZKNB14enAtyn0LnQeLzLq2p9XC64ukDroLKDbvrLMsPjfSaRnfMJtUGQY
         F+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683555799; x=1686147799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdPOb/kVKRm2CWLAaTiuZb0Yvx8fGBpCags1edg/orY=;
        b=OjpA+9Z6GCiz1g5SJSz1R53N6cXEAZcmQaKF0mSv1K2FzxDRopnCdlwLVqpBOCwj2V
         P+QjzUQuGroCRKc6xquH7h+YvlcW8rKV0TPcdzQEu7nNYxkSKAuz08yTmYxJbAe92ZfC
         SexGHHBcMA2dty6MJVpk1MGMoeBTc5I3tbSto0KPYFzDmHlFBBhv9yG4/DgbEoCYtDJh
         OB71DXGuXdWGCuSy/3EKzEOxcjeIK0kWut1bHR7GSg00ZU1JkyOapf82fM3+IXBS093i
         dzJEKKq78kEQszl+8pMCqxi0mskrAXvTVkYAr4gASKQhi/jgMO6oYruI67TmXyS1KNwj
         0YIw==
X-Gm-Message-State: AC+VfDwsnXKJjuixGQW4O0K1dBliUPgemWVIh6fXG3uTWlTf7chTctwf
        uawMqaEoWqkXLI2ukJtTRHaC0g==
X-Google-Smtp-Source: ACHHUZ5hq0SyhyQa9Ak/eEutefcC6/24ACvPJHsagmiW4oPSiIw3HdOpMRl3hXIYd5TIKv6cUNvyKQ==
X-Received: by 2002:a05:600c:2317:b0:3f1:76d4:d43f with SMTP id 23-20020a05600c231700b003f176d4d43fmr7146344wmo.8.1683555799260;
        Mon, 08 May 2023 07:23:19 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y25-20020a05600c365900b003f42456c490sm4081544wmq.33.2023.05.08.07.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 07:23:18 -0700 (PDT)
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
Subject: [PATCH v7 01/13] dt-bindings: regulator: qcom,usb-vbus-regulator: Mark reg as required
Date:   Mon,  8 May 2023 15:22:56 +0100
Message-Id: <20230508142308.1656410-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508142308.1656410-1-bryan.odonoghue@linaro.org>
References: <20230508142308.1656410-1-bryan.odonoghue@linaro.org>
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

