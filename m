Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1CF662BDEB
	for <lists+linux-usb@lfdr.de>; Wed, 16 Nov 2022 13:31:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238368AbiKPMbf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Nov 2022 07:31:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238803AbiKPMbB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Nov 2022 07:31:01 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D1A1E08F
        for <linux-usb@vger.kernel.org>; Wed, 16 Nov 2022 04:30:38 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id h9so29694165wrt.0
        for <linux-usb@vger.kernel.org>; Wed, 16 Nov 2022 04:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nJxt9QrKnPjdX4FLTqxuaRyNG0lj0vQQUUKMLh4iHk=;
        b=rIlo6EgH1ESzdhDRESiPYw617PV6yijGCXHCINyQ0owOLcAWoim0ahP6gC4RLTix9n
         V/x9m5pwlyv0bUtMKrMB0AN4Qd8MuOmGQMBSivtdsvSHWkO8p3IMgpQohZd+eLBg52M+
         28SikkR+0COasuKSGoFTj7lASWLSHY8QjcjuZJVxGNEUnnBbedGUGDTj8WqzscFFd0aR
         vnx4Xgst+Dwo9yZD0Vcs/s7CyiTL86fq7RmhTaQHbisF6ko7w7Z0dW70KsTPCsuMDr5/
         ZHdxuQoDhkDP0ATh7U1LwuXoDQ3aVOakSRrz3k7K4XbgoNi/BvXb0DKQjlKvmCQKMQO9
         ThHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nJxt9QrKnPjdX4FLTqxuaRyNG0lj0vQQUUKMLh4iHk=;
        b=sY0jxGTsM0JtQvuedD9pSs7vckhgnTFmudubElRaVakOBbzZN3Na9MpDEj83vgZOgn
         6c4UO3NvAjNftSsXStGWA8E7jcR+5ve1SaYsqi4Nbfilmw0vWHZScuOosA209vYqg6v6
         gi233vWqwORcHpyjjdgznYenGUvefdv3thUcZ70VD3aOiWOG2oFxS1LacBqTMn6UrU4e
         NFjU2auZUoy5w6lN6F1nK34ofYX1g9tUbePjH+7u0cIteuByxzh7bfVJ8t0qmdMnIxSA
         795Ki0nAV3M275EI2XG1DjJeANqaGMA0C1D6xY9pfEYinqryH3G03nKVCpLAq/D94EbV
         mLrA==
X-Gm-Message-State: ANoB5pnAjMXkHfxQZvX5oODL/N3T0DbQZFngKbgKXrZP+eGJJ5N9vGx1
        E+AIAcWtXabcZbPOMb9EhoiEeQ==
X-Google-Smtp-Source: AA0mqf6PF+Qp6K54utHjDeimLXRwvJcd0r8AJLNshUMa5u5sOw0j9nHS3DLyQ5z5OkZwkLbBMYkGSg==
X-Received: by 2002:adf:e507:0:b0:236:6442:3a48 with SMTP id j7-20020adfe507000000b0023664423a48mr13432715wrm.41.1668601836673;
        Wed, 16 Nov 2022 04:30:36 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id l42-20020a05600c1d2a00b003cf4eac8e80sm2870991wms.23.2022.11.16.04.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 04:30:36 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [RFC PATCH 2/3] dt-bindings: usb: Add qcom,snps-eusb2-repeater schema
Date:   Wed, 16 Nov 2022 14:30:18 +0200
Message-Id: <20221116123019.2753230-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116123019.2753230-1-abel.vesa@linaro.org>
References: <20221116123019.2753230-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add dt-binding schema for the Qualcomm SNPS eUSB2 repeater.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../usb/qcom,snps-eusb2-repeater.yaml         | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,snps-eusb2-repeater.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-eusb2-repeater.yaml
new file mode 100644
index 000000000000..f2b5ace675eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-eusb2-repeater.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/qcom,snps-eusb2-repeater.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Synopsis eUSB2 to USB 2.0 repeater
+
+maintainers:
+  - Abel Vesa <abel.vesa@linaro.org>
+
+properties:
+  compatible:
+    const: qcom,pm8550b-eusb2-repeater
+
+  reg:
+    maxItems: 1
+
+  vdd18-supply: true
+
+  vdd3-supply: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+    pm8550b: pmic@7 {
+        compatible = "qcom,pm8550", "qcom,spmi-pmic";
+        reg = <0x7 SPMI_USID>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pm8550b_eusb2_repeater: usb-repeater@fd00 {
+            compatible = "qcom,pm8550b-eusb2-repeater";
+            reg = <0xfd00>;
+        };
+    };
+...
-- 
2.34.1

