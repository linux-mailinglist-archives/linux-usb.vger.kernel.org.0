Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C435E6BEC21
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 16:04:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbjCQPEe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 11:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbjCQPEc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 11:04:32 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B7110EAB6
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:04:28 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id o7so4727556wrg.5
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679065467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8+H5EEAbdvf52NcUpG/q5u48K7jDEZDyAtoMXnmBJw=;
        b=jHGCSiXevtNjxOVGInmryEA0cMxUdotBKyr94ROrASFDjwy5qXgtX5VUmbzeD4M6eN
         yMnRzvZZn3QOv+HvQArfIRC4oRGVNzT130NdtAhDH6RCQiqvMVz11WF0lA8vkxXi+CSo
         C5N51luDn1GqmZxFvbCPnbRM0jkuYp46suEXI9Qd2hc1PL33Tu5pxi6jUytLMz3pmBee
         HkIaipaXCtArPpAAxfDcbZvqz175ekyrbM2PqVoLmObjLqjelmL3IQ6/mfAlDt+mcB4f
         Z2nhWA9+VTycG+9luVDC5/S6LeUn1gEuKcguZVXC/FiSJcUjX83t/WqU2W7U0PGqADs2
         YpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679065467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8+H5EEAbdvf52NcUpG/q5u48K7jDEZDyAtoMXnmBJw=;
        b=jpKg5b/YaBcydmT4WTmGkrPaMwrgqGlZM13dEqKYVrlB0Cljyio4qPMpga4+x4fcl9
         vNIPFBnjKPDPAsllHcr0bTa+OJgcm7l/oSdLydwEqNiktQB44gLpEo8P0XIL4Q4rJMss
         yCwzf17pBMMX+fptfQpneMfkClQlk4zbgBPpR8rUG6SCHIYrYteds0nbqde1Zx3f+1YO
         hrUddH2fZeqTdy3nKzpXSdts1tHsy+wBtoJuJodU9Qi9GtOVybfLyjs8n2pjr07cIWW1
         SNfSkyLUi7VAkSXjOUbqpIQn/844frXa2smOSN//gNFiKJqY3erZzzda7D1go2+eqb6S
         7iGA==
X-Gm-Message-State: AO0yUKUz5RwKjoPiiAXDk/bG7OGZDz/MF+YIZH1L6hh1t5rXAqIwGPxi
        jz2FqpAv7piJy9AZ75UoDIYSNw==
X-Google-Smtp-Source: AK7set81ak7mUMjYlTz5RGLLeMqFxklgoARBhu+7vkLku+YL8l7zvmRB8APlHJRa1BrJkd1uFIabFw==
X-Received: by 2002:adf:d083:0:b0:2ca:c865:51c4 with SMTP id y3-20020adfd083000000b002cac86551c4mr6914500wrh.0.1679065466776;
        Fri, 17 Mar 2023 08:04:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600000ce00b002be505ab59asm2133773wrx.97.2023.03.17.08.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 08:04:26 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 17 Mar 2023 16:04:18 +0100
Subject: [PATCH v4 02/12] dt-bindings: soc: qcom: qcom,pmic-glink: document
 SM8450 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v4-2-38bf0f5d07bd@linaro.org>
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Document the SM8450 compatible used to describe the pmic glink
on this platform.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index cf863683c21a..a85bc14de065 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,sc8180x-pmic-glink
           - qcom,sc8280xp-pmic-glink
           - qcom,sm8350-pmic-glink
+          - qcom,sm8450-pmic-glink
       - const: qcom,pmic-glink
 
   '#address-cells':

-- 
2.34.1

