Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A085765A488
	for <lists+linux-usb@lfdr.de>; Sat, 31 Dec 2022 14:08:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235663AbiLaNIB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 31 Dec 2022 08:08:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235650AbiLaNH7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 31 Dec 2022 08:07:59 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 011496275
        for <linux-usb@vger.kernel.org>; Sat, 31 Dec 2022 05:07:58 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so23853684pjj.4
        for <linux-usb@vger.kernel.org>; Sat, 31 Dec 2022 05:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03EcVfcgn594UPANtn877VRHUEcrNy316gwc2wdWerc=;
        b=NsR2jtqsrt3qzyDQmMkY9hX72wNshQRRtijNRgntkmZwYcvtH2uXkilcK36csmmuTx
         DnWpJXMX80s1FW/xzo9KtsRtpNz4bmUjVtie4frFR/h3/wXLiXQcOK9BRxsoe8SVcuYX
         ZlG2GOcH1zTc9RgOkFiQ7xNESfwSt0MEUzF2Udolh7Ml7/QPFSp7z2u6vs3n3+Uc4dAW
         RAu58jYejFvZKdww7Z9dPr1I8f25YDA86XuFK5QK4mGIrbPdQHC6Z2CL+KhsMyta8nW6
         +SRhktdiRs/ax3aTwgpmiy7F+S3b+Ijl+w27DWVsHq8k7e8vTA6it2MycQluQN1t4esY
         yU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03EcVfcgn594UPANtn877VRHUEcrNy316gwc2wdWerc=;
        b=4Cnp44VheG4zXpbFuS9hLSG9v4txhK931fRzmFgtr96DErihL5lIMcrOukA9mEsvxI
         MFpkBfpLn5EIpFkQEXnaTTqoLa5gG48BhdrmpM9kYAk8iFozcaWrmEmuFNpRrKZd7tCn
         h4yzoe7qbJ5zwTNUsRFfqG9EZdQdu+VaoutsASYcVKSOwS0py13drPLCRNad5SseO4HZ
         CoGGwNR7gSdLobQEPgCslL378FYxu/OL4TVMVhe63oQVI6rLFDGZ3auU43FfQWf49oWe
         nVns/D5vuVs1gklYTzIJrTR+qWBMmvIFxlDrvK66w6SDzgoIobxlvsd3KffONOfGuhEt
         Yl2A==
X-Gm-Message-State: AFqh2kopUxxollOd5ZqRGvq63+2doI7OdZH5Lkaa1F9Ui4oai424yl7A
        rHzk+boU0l1IR6S581fTakhI7g==
X-Google-Smtp-Source: AMrXdXvLOdVZiYlJtJLOLdI970jqGgZJV9+4ih0D6yth1+4aZD202Q2MXMXVtF57Mhkmtz3rP1r7zw==
X-Received: by 2002:a05:6a20:b297:b0:9d:efbf:7880 with SMTP id ei23-20020a056a20b29700b0009defbf7880mr37131383pzb.53.1672492078593;
        Sat, 31 Dec 2022 05:07:58 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c5e:e3b5:c341:16de:ce17:b857])
        by smtp.gmail.com with ESMTPSA id d7-20020a17090ab30700b0021904307a53sm14568161pjr.19.2022.12.31.05.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 05:07:58 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     quic_schowdhu@quicinc.com, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org
Subject: [PATCH 1/2] dt-bindings: soc: qcom: eud: Add SM6115 / SM4250 binding
Date:   Sat, 31 Dec 2022 18:37:42 +0530
Message-Id: <20221231130743.3285664-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221231130743.3285664-1-bhupesh.sharma@linaro.org>
References: <20221231130743.3285664-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add dt-bindings for EUD found on Qualcomm SM6115 / SM4250 SoC.

On this SoC (and derivatives) the enable bit inside 'tcsr_check_reg'
needs to be set first to 'enable' the eud module.

So, update the dt-bindings to accommodate the third register
property required by the driver on these SoCs.

Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../devicetree/bindings/soc/qcom/qcom,eud.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index c98aab209bc5d..1dffe14868735 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -18,12 +18,22 @@ properties:
     items:
       - enum:
           - qcom,sc7280-eud
+          - qcom,sm6115-eud
       - const: qcom,eud
 
   reg:
+    minItems: 2
     items:
       - description: EUD Base Register Region
       - description: EUD Mode Manager Register
+      - description: TCSR Check Register
+
+  reg-names:
+    minItems: 2
+    items:
+      - const: eud-base
+      - const: eud-mode-mgr
+      - const: tcsr-check-base
 
   interrupts:
     description: EUD interrupt
-- 
2.38.1

