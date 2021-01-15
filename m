Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 796442F82E3
	for <lists+linux-usb@lfdr.de>; Fri, 15 Jan 2021 18:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733054AbhAORsg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Jan 2021 12:48:36 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:37895 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731791AbhAORsb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Jan 2021 12:48:31 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610732890; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=VauDd45xSSN3CEAyZoE9ERuoz3UVyIDJB7nhr/3ovFc=; b=YPFSL9inPbDWOd1plmFSoI+Lpg1QonC6ecGmgazehPyD7ZaWG5liCOkY6P1holsW52EQIldw
 1VPpJrlMOAAN8be9ZitRH3Yn6DQ/rugCPuw1ws54rgY/j4E6iw9JNO8Pn1Z98XESquREFKkn
 P/D/05h99yxgGrFzccqQdT1Mebw=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6001d53f75e5c01cba48f80a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 15 Jan 2021 17:47:43
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7AA28C433CA; Fri, 15 Jan 2021 17:47:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 31E42C433C6;
        Fri, 15 Jan 2021 17:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 31E42C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jack Pham <jackp@codeaurora.org>
Subject: [PATCH v2 1/4] dt-bindings: phy: qcom,qmp: Add SM8150, SM8250 and SM8350 USB PHY bindings
Date:   Fri, 15 Jan 2021 09:47:20 -0800
Message-Id: <20210115174723.7424-2-jackp@codeaurora.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20210115174723.7424-1-jackp@codeaurora.org>
References: <20210115174723.7424-1-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the compatible strings for the USB3 PHYs found on SM8150, SM8250
and SM8350 SoCs. These require separate subschemas due to the different
required clock entries.

Note the SM8150 and SM8250 compatibles have already been in place in
the dts as well as the driver implementation but were missing from
the documentation.

Signed-off-by: Jack Pham <jackp@codeaurora.org>
---
 .../devicetree/bindings/phy/qcom,qmp-phy.yaml | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index 390df23b82e7..841c72863b4f 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -30,15 +30,24 @@ properties:
       - qcom,sdm845-qmp-ufs-phy
       - qcom,sdm845-qmp-usb3-uni-phy
       - qcom,sm8150-qmp-ufs-phy
+      - qcom,sm8150-qmp-usb3-phy
+      - qcom,sm8150-qmp-usb3-uni-phy
       - qcom,sm8250-qmp-ufs-phy
       - qcom,sm8250-qmp-gen3x1-pcie-phy
       - qcom,sm8250-qmp-gen3x2-pcie-phy
       - qcom,sm8250-qmp-modem-pcie-phy
+      - qcom,sm8250-qmp-usb3-phy
+      - qcom,sm8250-qmp-usb3-uni-phy
+      - qcom,sm8350-qmp-usb3-phy
+      - qcom,sm8350-qmp-usb3-uni-phy
       - qcom,sdx55-qmp-usb3-uni-phy
 
   reg:
+    minItems: 1
+    maxItems: 2
     items:
       - description: Address and length of PHY's common serdes block.
+      - description: Address and length of PHY's DP_COM control block.
 
   "#clock-cells":
     enum: [ 1, 2 ]
@@ -287,6 +296,64 @@ allOf:
         reset-names:
           items:
             - const: phy
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8150-qmp-usb3-phy
+              - qcom,sm8150-qmp-usb3-uni-phy
+              - qcom,sm8250-qmp-usb3-uni-phy
+              - qcom,sm8350-qmp-usb3-uni-phy
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Phy aux clock.
+            - description: 19.2 MHz ref clk source.
+            - description: 19.2 MHz ref clk.
+            - description: Phy common block aux clock.
+        clock-names:
+          items:
+            - const: aux
+            - const: ref_clk_src
+            - const: ref
+            - const: com_aux
+        resets:
+          items:
+            - description: reset of phy block.
+            - description: phy common block reset.
+        reset-names:
+          items:
+            - const: phy
+            - const: common
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8250-qmp-usb3-phy
+              - qcom,sm8350-qmp-usb3-phy
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Phy aux clock.
+            - description: 19.2 MHz ref clk.
+            - description: Phy common block aux clock.
+        clock-names:
+          items:
+            - const: aux
+            - const: ref_clk_src
+            - const: com_aux
+        resets:
+          items:
+            - description: reset of phy block.
+            - description: phy common block reset.
+        reset-names:
+          items:
+            - const: phy
+            - const: common
 
 examples:
   - |
-- 
2.24.0

