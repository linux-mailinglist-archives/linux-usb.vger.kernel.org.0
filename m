Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACD916B95A4
	for <lists+linux-usb@lfdr.de>; Tue, 14 Mar 2023 14:11:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232253AbjCNNL0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Mar 2023 09:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231835AbjCNNK7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Mar 2023 09:10:59 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CB3AACE2C
        for <linux-usb@vger.kernel.org>; Tue, 14 Mar 2023 06:07:43 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id eh3so5860821edb.11
        for <linux-usb@vger.kernel.org>; Tue, 14 Mar 2023 06:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678799254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oc/yTtxpfi/cx0O/ciOGYJj7wULj4xSmUjomTMHGaJ0=;
        b=p31pF1ns4sWtaUTbv/C0UlhNDkvsh3talyRX1LTrzSfXABvN8jNrAGIGfp9aNrsnk9
         G1Vt3uZhvDVLIH0TiXhrSKrdASC1l8nyLqbBD47HAeDydcQ/wJKYrk44oPyxaxgEZYBI
         r8k4lMR6DJfFuILGaPeo2sCOhDHVmZ5XzvyxQ4HWZHBwiV9aNJZZBirjUMm222CU+lp3
         /JrA0ERg1O5IpwhXmw/348WJqXymx4dWt3VZEEBQHvBCX0Cs6tog2jxQT7kpYtQxxLuf
         k7Bjl29+Q2HqosR/IzmVyv8heCg2LatBoj2ri1A6q3h/fDu7pPPRS23rQsgwJ0TW3pVY
         amqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678799254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oc/yTtxpfi/cx0O/ciOGYJj7wULj4xSmUjomTMHGaJ0=;
        b=So3KIEZHk5dRbAHx2+V5hAP3jcTR0217AQe0Vm6SRnVb/6Car+XbhXcwrJOhenqKL2
         45wvNOrrx3Gio42sJfG+0uMLW4PqHtWyJ5o1sMedaObA1LjmEEgujmko5r9wMc9oCWjg
         9POBTcCTOk2ZEvHgxTMQPA9xhgIQhGoVqY27n5/omlqfsADG26VSsYRDv18Y6xe9QTp9
         XRJwAUPnbP0XXjL/7PfcXu/UwNSzdFMIvIxdHW0gO7FV5QJjftCo3ygdL/mB/+UMmKej
         0wV/KCseI+dTRGT2Xa++H4kdecKiBo0iZdb0fQt9RJbRI1RYUo7WKQdLrgGDRGGatr9O
         rn/g==
X-Gm-Message-State: AO0yUKUgfWLOtEIpGfYD5brGiAfnXvT51u4lphCHv9gJqo3s9nuJJmeJ
        1vyQNFXaz9f+3z6FqiWiNxc+jG7DsIYuPSnHz/s=
X-Google-Smtp-Source: AK7set/cA5JzNq58dSwBAkLHZCu0RayEc27uAlLkeTiHXGkrsrtUKK6Xmh8rmkhOulNKQc/fzE5z3w==
X-Received: by 2002:ac2:4c29:0:b0:4e8:49ff:8df8 with SMTP id u9-20020ac24c29000000b004e849ff8df8mr770470lfq.61.1678798393458;
        Tue, 14 Mar 2023 05:53:13 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id s9-20020a19ad49000000b004dda74eccafsm395374lfd.68.2023.03.14.05.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 05:53:13 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 14 Mar 2023 13:52:58 +0100
Subject: [PATCH 3/6] dt-bindings: nvmem: Add compatible for QCM2290
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230314-topic-2290_compats-v1-3-47e26c3c0365@linaro.org>
References: <20230314-topic-2290_compats-v1-0-47e26c3c0365@linaro.org>
In-Reply-To: <20230314-topic-2290_compats-v1-0-47e26c3c0365@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678798384; l=777;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=hWgvEppu/A1SXLKMMX+IVEfzPX58BD27JWEng55RY7w=;
 b=Ef0WrVrVXlVDBJBByuHYfJlJ7lKiC4VKDD9vte3q6X/PFMC2o+9sSEcy8IVuH2VILi/qU5aK+BY5
 Ts3tc5KED8ipFSTE15LUOfkLBF7qH00cFE3ULYIfdjVnID+Jp6zW
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Docuemnt the QFPROM on QCM2290.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 2173fe82317d..1bd213f9eb38 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,msm8976-qfprom
           - qcom,msm8996-qfprom
           - qcom,msm8998-qfprom
+          - qcom,qcm2290-qfprom
           - qcom,qcs404-qfprom
           - qcom,sc7180-qfprom
           - qcom,sc7280-qfprom

-- 
2.39.2

