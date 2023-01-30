Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D742F680A15
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 10:55:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236058AbjA3JzX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 04:55:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235985AbjA3JzS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 04:55:18 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 157F5B75F
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 01:54:59 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id d14so10449430wrr.9
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 01:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n966g2oytrrI+/j6t013UuTzLUKjnaUrX5GhJ4ozsXg=;
        b=ZOwhZvD2lSeo382ndgIzNynH5GDowRNc0fXYdhjAhhGozZEMle/xd4AFhAM3AR0fxP
         huO8SLuSmvXE+NQksi+gfyW8KL3Bi6SyTRJNKgacRP4B84BV0KNoicDfTeTVzT2eN8Ii
         W6MtnmtZRRqda7o6TyCBd2+2/M3CHARhBDLE1kqsbKuFCxfa9F+eKvcY+UAtR3xoan9u
         lEA/W26cxN5B8narooYnF1ThsfyGaI8Y65Q4vfFbvhh1LnVcHb05OvQfDiu1jJW+uQ8F
         /0jcJCKZZxOQxbBFy1hFcRTCcKGgF0DhboicHS5P4iI8GGpBL9onOHrXA8F13WOenqhX
         JkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n966g2oytrrI+/j6t013UuTzLUKjnaUrX5GhJ4ozsXg=;
        b=To+wOw0WIxv7dx2Yy7Rl87moWVAYket/VrFho8SFG+yUknxFCeGnRPI7lwC5h8e8Ka
         VRuzE0jaEjSF82hwfzcb3HrypSfS3ZD1Lh4DvEug8ioahKXaEMiIUwUGPr58HrL5WvUE
         rR6WYFvbns9U9du9RUQ14fKs0SZ+cP2oPD//ntATKQUrdFddcA90QCh6hKAm9E7KP4VA
         BjwcdjTHbFYrp9macLVfYzezsz6VdRdQOiFSu850e9QhH1b/SaMCPbM/DY1bLuGFCcfB
         ImUQxCGfhGSA7gL3jQpgWJ3odZ4IEX8Jme4ksk18gTC2HQc1bXFQkBze+sQbsxMuZcIP
         XmEA==
X-Gm-Message-State: AO0yUKXpfCjJ9kk/fxkV0EAOTlE/3Adj/S8/R3FbW5ayc9YdZ/8m51Yc
        uLYoW8Y1Hfn0D5HV+avvSOqadw==
X-Google-Smtp-Source: AK7set/UWd2HAUscqvmpzv+2/RkYvIvkbUAFztMrzHEQdNwR0bBci3eFfop0wai9KWcDFyy+xVsIKg==
X-Received: by 2002:adf:a1c4:0:b0:2bf:b1f0:7bab with SMTP id v4-20020adfa1c4000000b002bfb1f07babmr17618268wrv.47.1675072478016;
        Mon, 30 Jan 2023 01:54:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id k4-20020a5d4284000000b00241fde8fe04sm11453537wrq.7.2023.01.30.01.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 01:54:37 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 30 Jan 2023 10:54:34 +0100
Subject: [PATCH 3/7] dt-bindings: soc: qcom: qcom,pmic-glink: document
 SM8550 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v1-3-0b0acfad301e@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v1-0-0b0acfad301e@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v1-0-0b0acfad301e@linaro.org>
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

Document the SM8550 compatible used to describe the pmic glink
on this platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 2dc11686c33e..59ac9db81733 100644
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

