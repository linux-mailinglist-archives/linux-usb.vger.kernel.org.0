Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 045FF51A09B
	for <lists+linux-usb@lfdr.de>; Wed,  4 May 2022 15:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350417AbiEDNXQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 May 2022 09:23:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350360AbiEDNXH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 May 2022 09:23:07 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 408113614F
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 06:19:30 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id dk23so2833355ejb.8
        for <linux-usb@vger.kernel.org>; Wed, 04 May 2022 06:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G7irfyCQlD/M8tL+PfS8TGD+KmTIlsaIOgtkEZDavc8=;
        b=HR9JpF8cgsadmt47pxzxG0FT3E+/zIhvH8v7yx3sqf9xRKstzI1D/CuJbh4EIqDL2H
         Z0mWC1f6nY/uFvjPcqyxt/C9gUhBB9/7DEgt88W36p386VIidahonAtxgvuIITHcQzCw
         ooQ1osUEi99qUsVaEKYfcPGIt9q5dYNcC1P4nl5ix6Haw78a9l41qQTYrWP2h9ln+LC1
         5i4cS1OZRr6blhjloTBrtAtdbCUYp1Ii904wsTZLUtW7xrQKFWEr+NpjbeGRr3K0c6wL
         zLQ5AX+jXe+g+xqvtVWFLXwq2jJYsE3wTqM+Cvd7sJ1xL6Zem4jPK60ZfeTyGzmw3xOF
         TVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G7irfyCQlD/M8tL+PfS8TGD+KmTIlsaIOgtkEZDavc8=;
        b=ApsgGFSOf8XqFjsNcCUHzIaxDY4XoCKBknAEEveOH+Ee94Ah5vmcCl7kKr8VemasZW
         MF7Fyj97h6LxFqFdulddTsjMMHHrCsu/kFEbnicX4hFpMJkx2TcLRNWUxsOOhPi8db8Z
         vi5+0eIaB6tPr6aEzvYUvndXT03AhP9vrzOVDqSsgrgv0IxzRADYHt4+hof6HpgcsOcG
         zyJ4YOET94ZYkea+0ww95kM6P/3vtowtqluPYWS4QrpE3YpQ8ZOdTqIr1J3GUysGp/dE
         YcGKWcXoLPSe3DiVVM4q7Wvfh/jKP1SfCyPDaRjd/d5qIn7j970LPVzChwIG63rUuEA2
         I8+A==
X-Gm-Message-State: AOAM532bYQUnecEZp1VXrdhpnMk9S7lRcOrFKwChCQr9JPc+BVv1zhxu
        OSOKxOnV/WbPq2Jq6133kdNTkA==
X-Google-Smtp-Source: ABdhPJwRQ+1dtDdX/5DAMYWUOT+0UJnZBnzubU+AKGBV77frwhOwL3kuGIPEnLBy+9queoUWx5VT1w==
X-Received: by 2002:a17:907:d9e:b0:6f4:2983:c371 with SMTP id go30-20020a1709070d9e00b006f42983c371mr17267601ejc.558.1651670368800;
        Wed, 04 May 2022 06:19:28 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gx3-20020a1709068a4300b006f3ef214dc4sm5660924ejc.42.2022.05.04.06.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 06:19:28 -0700 (PDT)
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
Subject: [PATCH 01/13] dt-bindings: soc: qcom: aoss: document qcom,sm8450-aoss-qmp
Date:   Wed,  4 May 2022 15:19:11 +0200
Message-Id: <20220504131923.214367-2-krzysztof.kozlowski@linaro.org>
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

Add compatible for qcom,sm8450-aoss-qmp with qcom,aoss-qmp as a
fallback.  This fixes dtbs_check warnings like:

  sm8450-hdk.dtb: power-controller@c300000: compatible:0: 'qcom,sm8450-aoss-qmp' is not one of
    ['qcom,sc7180-aoss-qmp', 'qcom,sc7280-aoss-qmp', 'qcom,sc8180x-aoss-qmp', 'qcom,sdm845-aoss-qmp',
     'qcom,sm6350-aoss-qmp', 'qcom,sm8150-aoss-qmp', 'qcom,sm8250-aoss-qmp', 'qcom,sm8350-aoss-qmp']

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index e2e173dfada7..d01e98768153 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -33,6 +33,7 @@ properties:
           - qcom,sm8150-aoss-qmp
           - qcom,sm8250-aoss-qmp
           - qcom,sm8350-aoss-qmp
+          - qcom,sm8450-aoss-qmp
       - const: qcom,aoss-qmp
 
   reg:
-- 
2.32.0

