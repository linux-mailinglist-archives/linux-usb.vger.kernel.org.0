Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C79FC6F30AC
	for <lists+linux-usb@lfdr.de>; Mon,  1 May 2023 14:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232487AbjEAMLZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 May 2023 08:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232496AbjEAMLW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 May 2023 08:11:22 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BF31E58
        for <linux-usb@vger.kernel.org>; Mon,  1 May 2023 05:11:20 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f178da21b2so25456995e9.1
        for <linux-usb@vger.kernel.org>; Mon, 01 May 2023 05:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682943079; x=1685535079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0ZVe1Rg8aI+3oAHf/45YjTZiSKYleI9/VQitLDptks=;
        b=S4XKhzsVfIyhkEwAu5e8tTwJ+Rs9GFPkaLsK5pCsi29IRVpRCukc4oqKc40mDkgfBw
         2PPmrASXJY498MViUoidhp+RRlvPvttQdtlhQuOMnXu8YVO59E+pcgYg3dlbAkXNf/pW
         ZOUrwtcB8LdcqcEl5WfVhVKtRcBcGew+0zKaTjWSqoPi1aExOg76aq8lsX7l+MKvWpZb
         GtJl5fnrFnA9SvbQdiwuQejbldVmMj79yJJQYnPubND3alVP4J2wC4yJcslBPcOYiaMC
         OtcBnla5wtUrTL/MXtnRPkZT6VsszH4kJBuHx3Zaw7oRkjS0S/EYuipohXjwQjM6Vwod
         687Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682943079; x=1685535079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0ZVe1Rg8aI+3oAHf/45YjTZiSKYleI9/VQitLDptks=;
        b=V6RKyMOCMrgQo0UHLhn9mWIfja2kR17khihI1xPKCau8oQjsAkcZ9/xvvs4J/233W+
         B7tENrjKDjQxdHVIFaU5dpngTId/tBGI1PWC2RpQKXJi9kEN2jAComvBtYSOD5f0zm9a
         x2d2rzgrbTX4LK9p5B5fl+5wmex7L1nrXHsJPzCvrMLYhtMLbzQ1lcj7P2AgPxWg2vFF
         ZSCabAKNyAiPQ873hkOmbaR/jITZQuZ2GYgumw3LMMr51ceOpFiAg1cDdtdQal55+RAZ
         /q6LC1MLCP7JB3qVg9i4LQq3mDT5OvF/PJE28IcjqWWBQ2ICjLpN9HbwwpNsBCjRAgrL
         CHjA==
X-Gm-Message-State: AC+VfDwYVBenSXjuLDmnElObbtJRLUI2YKijGWx5bcO6evqGhHg9PqMr
        2g09LyKxk3YDIv+74gGjzUSBBQ==
X-Google-Smtp-Source: ACHHUZ7QkBdAryGghaDycrZ3+rM0st7rKAqDElyuUlGG89kfrxswEMSkxFpRDHANGgA8IM0SYPIijg==
X-Received: by 2002:a5d:4a43:0:b0:2f9:26f7:7b0c with SMTP id v3-20020a5d4a43000000b002f926f77b0cmr9565171wrs.35.1682943078711;
        Mon, 01 May 2023 05:11:18 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o10-20020a05600c510a00b003ee443bf0c7sm35856634wms.16.2023.05.01.05.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:11:18 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
Subject: [PATCH v6 04/13] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add input and output ports
Date:   Mon,  1 May 2023 13:11:02 +0100
Message-Id: <20230501121111.1058190-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
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

Add a ports declaration which is optional containing two port@
declarations.

port@0 to receive an orientation-switch message from the Type-C port or
redriver

port@1 to subsequently transmit the orientation-switch on once the PHY has
finished doing its orientation turn-around.

If ports is declared the input port port@0 is mandatory but the output
port@1 is optional.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
index d307343388888..c370b9cd58c2e 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
@@ -65,6 +65,25 @@ properties:
     description: Flag the port as possible handler of orientation switching
     type: boolean
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: OF graph bindings that model incoming orientation-switch and
+      outgoing orientation-switch messages. An example of an incoming
+      orientation-switch message might come form a Type-C connector or a USB
+      redriver. An example of an output would be a DisplayPort controller.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Type-C mux orientation-switch input.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: PHY orientation-switch output.
+
+    required:
+      - port@0
+
   resets:
     items:
       - description: reset of phy block.
@@ -279,4 +298,23 @@ examples:
             #clock-cells = <1>;
             #phy-cells = <0>;
         };
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                qmpphy_typec_mux_in: endpoint {
+                    remote-endpoint = <&pmic_typec_mux_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                qmpphy_typec_mux_out: endpoint {
+                    remote-endpoint = <&dp_typec_mux_in>;
+                };
+            };
+        };
     };
-- 
2.39.2

