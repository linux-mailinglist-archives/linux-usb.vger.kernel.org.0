Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A81AF6B2557
	for <lists+linux-usb@lfdr.de>; Thu,  9 Mar 2023 14:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbjCIN2L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Mar 2023 08:28:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230363AbjCIN2I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Mar 2023 08:28:08 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B15F029E2D
        for <linux-usb@vger.kernel.org>; Thu,  9 Mar 2023 05:28:05 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so3584271wmb.5
        for <linux-usb@vger.kernel.org>; Thu, 09 Mar 2023 05:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678368484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ehh+IB7mATn8qRRIIxxLIJvaBEzJ12on/Ve9T/GbUQs=;
        b=uWE32Jzi7B/VYhLBA77vhUCna5zpACF5NtdS4D77IOtvhnWVfzrMF2r6JL1RfHdq45
         W2dE1JnuyPTnL8U1+w+OrhknqqHIF8xPLZwW0RyxQK53xMCZGS11xxNpxY3fGJxtYs8K
         4s+x4Nf0SWl5rHbyyilkfRdR5pLy82rWq/nXEG9XE99nHvqt+3fA2qf7GW75AnCRr+fa
         FQw2JifZwJL+r8mshlpMDkbGNo+XzvvIEjUN4iQeRvt8bEeQEL79ey8LxraQne5OTHGz
         bgoukJ+APy+9+rWoLaE+pZtJefIiphistRHIH4rHdPjnhqGBMHb6jpNWcdh/EOIoUtWH
         SUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678368484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehh+IB7mATn8qRRIIxxLIJvaBEzJ12on/Ve9T/GbUQs=;
        b=geTZ/JaenOMJg36R3IpKopZeAg9yCXxwpTR0WPyoETZ4tnmMmstTtWlC8iKhq1Mvbu
         06A9CJ00n1cL300sd8MTVFST9WidGi7ooYntylD1Bg+fgbmkiS68GSxDvJW3Ri1z5Ci+
         VEiEX/VQ8JUW3E0qpAvJBhrPhr6fNIqklZPZEgjTU4qt2zeNiDntNS3vrXzt21X1DTPC
         hJwDPvpDTstwB1vIITNa2AMofYyXqXjRhVSU8qgjS/JvLlNcvd0fDrGkoaM0oxiz8Ij1
         eI99AoVvXxOPp1mNB1nKiFqNn9UCemDFaX591hgZoJfD6DRVYtOXoiVg2VKhecFKj84U
         8PjA==
X-Gm-Message-State: AO0yUKUJDINyMkLuh/4/JH5zk8RjfYacKvLpVOokOnNA9knvMMgncSnw
        h9c+jfQBnniAopJFXAgM8JXD6A==
X-Google-Smtp-Source: AK7set+RRnLwGGAsX74B0ntwn/d+CjngaH9g7XwPMQjpwM2tmR3OSeqQimDeJ+a1XnFHewZPcEUB0A==
X-Received: by 2002:a05:600c:501f:b0:3eb:3947:41ea with SMTP id n31-20020a05600c501f00b003eb394741eamr19133342wmr.37.1678368484282;
        Thu, 09 Mar 2023 05:28:04 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c458700b003eb966d39desm2926714wmo.2.2023.03.09.05.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 05:28:03 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 09 Mar 2023 14:27:54 +0100
Subject: [PATCH v3 03/12] dt-bindings: soc: qcom: qcom,pmic-glink: document
 SM8550 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v3-3-4c860d265d28@linaro.org>
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>
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

