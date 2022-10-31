Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 075BD613448
	for <lists+linux-usb@lfdr.de>; Mon, 31 Oct 2022 12:14:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbiJaLO2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Oct 2022 07:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbiJaLO0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Oct 2022 07:14:26 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3C35E2DCF;
        Mon, 31 Oct 2022 04:14:26 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49AC112FC;
        Mon, 31 Oct 2022 04:14:32 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FC263F703;
        Mon, 31 Oct 2022 04:14:23 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, Karl Kurbjun <karl.os@veroson.com>,
        Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 2/7] dt-bindings: phy: Add special clock for Allwinner H616 PHY
Date:   Mon, 31 Oct 2022 11:13:53 +0000
Message-Id: <20221031111358.3387297-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221031111358.3387297-1-andre.przywara@arm.com>
References: <20221031111358.3387297-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB PHY IP in the Allwinner H616 SoC requires a quirk that involves
some resources from port 2's PHY and HCI IP. In particular the PMU clock
for port 2 must be surely ungated before accessing the REG_HCI_PHY_CTL
register of port 2. To allow each USB port to be controlled
independently of port 2, we need a handle to that particular PMU clock
in the *PHY* node, as the HCI and PHY part might be handled by separate
drivers.

Add that clock to the requirements of the H616 PHY binding, so that a
PHY driver can apply the quirk in isolation, without requiring help from
port 2's HCI driver.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../phy/allwinner,sun8i-h3-usb-phy.yaml       | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun8i-h3-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun8i-h3-usb-phy.yaml
index 77539b4601c24..2df012d13655e 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun8i-h3-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun8i-h3-usb-phy.yaml
@@ -36,18 +36,22 @@ properties:
       - const: pmu3
 
   clocks:
+    minItems: 4
     items:
       - description: USB OTG PHY bus clock
       - description: USB Host 0 PHY bus clock
       - description: USB Host 1 PHY bus clock
       - description: USB Host 2 PHY bus clock
+      - description: PMU clock for host port 2
 
   clock-names:
+    minItems: 4
     items:
       - const: usb0_phy
       - const: usb1_phy
       - const: usb2_phy
       - const: usb3_phy
+      - const: pmu2_clk
 
   resets:
     items:
@@ -96,6 +100,28 @@ required:
   - resets
   - reset-names
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun50i-h616-usb-phy
+    then:
+      properties:
+        clocks:
+          minItems: 5
+
+        clock-names:
+          minItems: 5
+    else:
+      properties:
+        clocks:
+          maxItems: 4
+
+        clock-names:
+          maxItems: 4
+
 additionalProperties: false
 
 examples:
-- 
2.25.1

