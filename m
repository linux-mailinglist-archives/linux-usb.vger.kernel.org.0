Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5A386BF9F7
	for <lists+linux-usb@lfdr.de>; Sat, 18 Mar 2023 13:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbjCRMTG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Mar 2023 08:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbjCRMS5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Mar 2023 08:18:57 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4768F3D905
        for <linux-usb@vger.kernel.org>; Sat, 18 Mar 2023 05:18:50 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso4840494wmo.0
        for <linux-usb@vger.kernel.org>; Sat, 18 Mar 2023 05:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679141930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmmSgVp+T5bjkIFsMi3maL1+5aq8aFIlfAImDxKbXx8=;
        b=jBF3mPf638u6dQjyRXjV1gl7BuWJh9R4eNHIXH6gEO0TmG7FExVfyd88UJqQzMo5dZ
         EUJJkBUy5n7UEXJTQJpE2ocEnOg3S4vNaXhkyjkIw4lipMOb9O0kIocQWzctEiQ6Yx5o
         tkiAbR3bOmCmOQSJVWrYmYNywp6zFD/3gipFdcqzmkNBKzC+kuc8l40Nz/rk7ZvErhEU
         uSS1d55Azhb6BmadEH83lKOoi3+3UPt01jeR/HBrt/b0wonl6t8Obl/X7WTPajqz/MKJ
         Qq0fMbfGaLFanHfOZfaZCP0vB2v0kQ+fIUjXv8PcAfmDK64jt5M5ZzuwKPhS7luS/vh9
         8Qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679141930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lmmSgVp+T5bjkIFsMi3maL1+5aq8aFIlfAImDxKbXx8=;
        b=FjnR7jZ4n++giTSgSMG2KVKk1KAwoZFytnlkEx5m1+yyVAJnjqkvQkMvMEsoWBh4uk
         qY0YnsAkmGvwoG58taXR6Us9X7oT8g/aY6CS+rebqupXjP3rnAKREx3a+thVAWsbNxr3
         FBjbMdYRcToeCihpb3iRRaLxh/CLJsn37miaOmoWfzlOweC7V7Fs+QWLshsM707kN9cd
         8LD15PNDWcaUm7NBrgUpY0sDQqA0rYYWOycIEWcQo11H1v91bxzyRDStXNDkmduovRhM
         f3/kOouKFYH1MY76CGTIkLo3tIZm2HoNbrRxU+9t8H4tVjsEWpGyM16OvUtecPmAFknn
         TNNA==
X-Gm-Message-State: AO0yUKUFmqGc6GE5rUbJjzoa+XSafzg8le6i8NIZEUDPI4npA1ROcbX3
        6vUGytUcfhel0XY9BD+2eLNNhA==
X-Google-Smtp-Source: AK7set9rrtWziKSBJYKllFgoT2rlmBSnnqp8pFppSQ6pJxHQ3UdbDlCPmHZ9RWj26VoXxguDvGFpJA==
X-Received: by 2002:a05:600c:4452:b0:3e1:374:8b66 with SMTP id v18-20020a05600c445200b003e103748b66mr26723807wmn.40.1679141930580;
        Sat, 18 Mar 2023 05:18:50 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id az40-20020a05600c602800b003e2096da239sm10814997wmb.7.2023.03.18.05.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 05:18:50 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: [PATCH v4 15/18] arm64: dts: qcom: qrb5165-rb5: Switch on Type-C VBUS boost
Date:   Sat, 18 Mar 2023 12:18:25 +0000
Message-Id: <20230318121828.739424-16-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Switch on VBUS for the Type-C port. We need to support a higher amperage
than the bootloader set 2 Amps.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index aa0a7bd7307ce..1ce88f0c31db2 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1338,3 +1338,9 @@ &qup_spi0_data_clk {
 	drive-strength = <6>;
 	bias-disable;
 };
+
+&pm8150b_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <3000000>;
+	status = "okay";
+};
-- 
2.39.2

