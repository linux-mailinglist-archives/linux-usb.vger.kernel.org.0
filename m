Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E65C97573B7
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jul 2023 08:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbjGRGL2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jul 2023 02:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231261AbjGRGLS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jul 2023 02:11:18 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B6A210C7
        for <linux-usb@vger.kernel.org>; Mon, 17 Jul 2023 23:11:16 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-666e6ecb52dso3315880b3a.2
        for <linux-usb@vger.kernel.org>; Mon, 17 Jul 2023 23:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689660676; x=1692252676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3U8YGGir0L/mdYZ0L+59VSzteiUJkc0KitjLit6CXs=;
        b=asFylN+n0kUr9plq5cxM4Pwogu2AbP35sKK923oj7CnWW/DgT7MjZAsGYRthUkBd4d
         b8Hi3b4raiSvXdLqaqVpkHASKj0XLIIetKlI7q+BvECvA1B+ANvmy6x3WLIlMKxJwiLR
         IxeDloi3MvSFsCTk/6O4bHX6mqTJuhrN02OLk9442NPyIlMAs5SErx0oetDzzz3a4AwN
         O6CdOWctwj3IIYCoaNLxVQE13xu0UOfPc/w1I9dSKbhSujiAP4XuDxWvj/eCxshmbUzd
         qFddJJ/n4iZuwksLcThBDYi9hpPMxtvZOffw2AhgTx8AZm8KIwLdnAjy35lm85+QNyXH
         TxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689660676; x=1692252676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3U8YGGir0L/mdYZ0L+59VSzteiUJkc0KitjLit6CXs=;
        b=lIEPaZ487ZmLingMhZ51YuuMSDiIJX/iuX5u4R6lQDGFlBlnIFSvA6xytdObQCEnKu
         G/VM0f9QDh+0vZyfYz+CpyqJU+Z5/vSbmi64iuznLpcWoX05gAsGp4BAlc6hyuJBl5tP
         RmRYVZp9fTfnMhRZ5sodykowhl88eISrYO8vgdfofap+TRV2DV7bnyW5iE4giY/aYVV0
         bww8TVhMZI4xJIoVcGwJUJBmXEDiw8wC1kxa3H7wvJ7xLCMyU5WRLpA4aAQrw0QdeO30
         lXmqODMIfK5llKiNBGG4bhgYdALhsbzCQiM9CkJXMeIIkaJVLY6j1XtYgvnk2QFMRUKR
         s0Yg==
X-Gm-Message-State: ABy/qLYSI3pwLgO41FMZFcujZoiE6Wb6C7Da+Kj0SnC2uxqjMCO50VXW
        cp8HuYwU8AVDu3FLEjfQlBl0bMGjrb5Q+C56SPANSQ==
X-Google-Smtp-Source: APBJJlEbASCzBW5nny//1cmmMU2YlKnUEAb+V7SgOKcexNMZhmsXJfHXlbCrE+ldrpJWCd/Z6B0BXg==
X-Received: by 2002:a05:6a20:12ce:b0:135:4df7:f165 with SMTP id v14-20020a056a2012ce00b001354df7f165mr2429388pzg.21.1689660675802;
        Mon, 17 Jul 2023 23:11:15 -0700 (PDT)
Received: from localhost.localdomain ([223.233.68.54])
        by smtp.gmail.com with ESMTPSA id h21-20020a62b415000000b0067db7c32419sm778106pfn.15.2023.07.17.23.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 23:11:15 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
        quic_schowdhu@quicinc.com, gregkh@linuxfoundation.org,
        stephan@gerhold.net
Subject: [PATCH v9 2/7] dt-bindings: soc: qcom: eud: Document vendor-specific 'secure mode' property
Date:   Tue, 18 Jul 2023 11:40:47 +0530
Message-Id: <20230718061052.1332993-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230718061052.1332993-1-bhupesh.sharma@linaro.org>
References: <20230718061052.1332993-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On some SoCs (like the SM6115 / SM4250 SoC), the enable bit inside
'tcsr_check_reg' needs to be set first to 'enable' EUD mode.

So introduce a vendor-specific dt-property 'qcom,secure-eud-reg'
which specifies the base address of the TCSR reg space and the offset
of the 'tcsr_check_reg'.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index f2c5ec7e6437b..ca38d219e57d5 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -45,6 +45,14 @@ properties:
         $ref: /schemas/graph.yaml#/properties/port
         description: This port is to be attached to the type C connector.
 
+  qcom,secure-eud-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to TCSR hardware block
+          - description: offset of the secure mode manager register
+    description: TCSR hardware block
+
 required:
   - compatible
   - reg
-- 
2.38.1

