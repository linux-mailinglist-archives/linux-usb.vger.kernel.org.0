Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01B475FAE66
	for <lists+linux-usb@lfdr.de>; Tue, 11 Oct 2022 10:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbiJKI3v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Oct 2022 04:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbiJKI3o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Oct 2022 04:29:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8A2ACD8
        for <linux-usb@vger.kernel.org>; Tue, 11 Oct 2022 01:29:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1oiAdl-0005Sp-77; Tue, 11 Oct 2022 10:29:29 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1oiAdj-000r70-6j; Tue, 11 Oct 2022 10:29:27 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1oiAdi-003iNs-FI; Tue, 11 Oct 2022 10:29:26 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Peter Chen <peter.chen@kernel.org>,
        Peng Fan <peng.fan@oss.nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 6/6] dt-bindings: usb: ci-hdrc-usb2: Add more phy tuning properties
Date:   Tue, 11 Oct 2022 10:29:24 +0200
Message-Id: <20221011082924.884123-7-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221011082924.884123-1-s.hauer@pengutronix.de>
References: <20221011082924.884123-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Following the example of samsung,picophy-dc-vol-level-adjust more
phy tuning properties are added for configuring the remaining bitfields
in the USBNC_n_PHY_CFG1 register.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 11d08ffeb1e9c..c467924235759 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -255,15 +255,94 @@ allOf:
           minimum: 0x0
           maximum: 0x3
 
+        samsung,picophy-usb-source-impedance-adjust:
+          description: |
+            USB Source Impedance Adjustment. In some applications, there can be
+            significant series resistance on the USB DP/DN path between the
+            USB_OTG*_DP/USB_OTG*_DN pins tns and the USB cable. This bus adjusts
+            the driver source impedance to compensate for that added resistance.
+            The default value is 0x1. For more details refer to TXRESTUNE0 bits of
+            USBNC_n_PHY_CFG1.
+
+          $ref: /schemas/types.yaml#/definitions/uint32
+          minimum: 0x0
+          maximum: 0x3
+
+        samsung,picophy-hs-rise-time-adjust:
+          description: |
+            This bus adjust the rise/fall times of the high-speed transmitter
+            waveform. The default value is 0x1. For more details refer to
+            TXRISETUNE0 bits of USBNC_n_PHY_CFG1.
+
+          $ref: /schemas/types.yaml#/definitions/uint32
+          minimum: 0x0
+          maximum: 0x3
+
         samsung,picophy-dc-vol-level-adjust:
           description: |
             HS DC Voltage Level Adjustment. Adjust the high-speed transmitter DC
             level voltage. The range is from 0x0 to 0xf, the default value is
             0x3. Details can refer to TXVREFTUNE0 bits of USBNC_n_PHY_CFG1.
+
+        $ref: /schemas/types.yaml#/definitions/uint32
+          minimum: 0x0
+          maximum: 0xf
+
+        samsung,picophy-fs-ls-source-impedance-adjust:
+          description: |
+            FS/LS Source Impedance Adjustment. This bus adjusts the low- and
+            full-speed single-ended source impedance while driving high. The
+            adjustment values listed are based on nominal process, voltage, and
+            temperature conditions. The default value is 0x3. For more details
+            refer to TXFSLSTUNE0 bits of USBNC_n_PHY_CFG1.
+
           $ref: /schemas/types.yaml#/definitions/uint32
           minimum: 0x0
           maximum: 0xf
 
+        samsung,picophy-transmitter-hs-crossover-adjust:
+          description: |
+            Transmitter High-Speed Crossover Adjustment. This bus adjusts the
+            voltage at which the USB_OTG*_DP and USB_OTG*_DN signals cross
+            while transmitting in HS mode. The default value is 0x3. For more
+            details refer to TXHSXVTUNE0 bits of USBNC_n_PHY_CFG1.
+
+          $ref: /schemas/types.yaml#/definitions/uint32
+          minimum: 0x0
+          maximum: 0x3
+
+        samsung,picophy-vbus-valid-threshold-adjust:
+          description: |
+            VBUS Valid Threshold Adjustment. This bus adjust the voltage level
+            for the VBUS VALID threshold. The default value is 0x4. For more
+            details refer to OTGTUNE0 bits of USBNC_n_PHY_CFG1.
+
+          $ref: /schemas/types.yaml#/definitions/uint32
+          minimum: 0x0
+          maximum: 0x7
+
+        samsung,picophy-squelsh-threshold-adjust:
+          description: |
+            Squelch Threshold Adjustment. This bus adjusts the voltage level for
+            the receiver threshold used to detect valid high-speed data. The
+            default value is 0x3. For more details refer to SQRXTUNE0 bits of
+            USBNC_n_PHY_CFG1.
+
+          $ref: /schemas/types.yaml#/definitions/uint32
+          minimum: 0x0
+          maximum: 0x7
+
+        samsung,picophy-disconnect-threshold-adjust:
+          description: |
+            Disconnect Threshold Adjustment. This bus adjusts the voltage level for
+            the receiver threshold used to detect a disconnect event at the host.
+            The default value is 0x4. For more details refer to COMPDISTUNE0 bits of
+            USBNC_n_PHY_CFG1.
+
+          $ref: /schemas/types.yaml#/definitions/uint32
+          minimum: 0x0
+          maximum: 0x7
+
 additionalProperties: true
 
 examples:
-- 
2.30.2

