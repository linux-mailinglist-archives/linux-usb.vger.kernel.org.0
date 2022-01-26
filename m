Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210D749CBFC
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 15:14:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242001AbiAZON4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 09:13:56 -0500
Received: from mx1.tq-group.com ([93.104.207.81]:61280 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241975AbiAZONz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Jan 2022 09:13:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1643206434; x=1674742434;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l1nUXsM59Ui0doiVm12hhhwuohicemAjdr43H7R6YUg=;
  b=LLz8wQaUiFsszVteAWL/EintRBQkVe+z9UqK3kVsWMdohM9YWNm9Tc+5
   B0DOiYo2/g0QmXMryuQazO+8S32N3Mn3D6ygrZ46fWMB6NSzhr/Bpi2bK
   7eyHob8rjDfn6bLd2xY0Kjs3v7H8oJZ53s8VGEGflaApTDOK8nDtU0njj
   9cr1BsfbsvAquE8seVJ8E6uMNVNLQz75KwYqpyrpp0j+AQIOMYEQ+oyAI
   ZaK1tSLUOut75QIc2L6D5CADSdWXDMJmIp9PctTvKh+IEMaNCvmartsxx
   6wuVJyx4Leh+Ay5eno81cL/p6/z9mJauZ9M4yaacKEUFY2/I9yAEQYYC3
   g==;
X-IronPort-AV: E=Sophos;i="5.88,318,1635199200"; 
   d="scan'208";a="21725569"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 26 Jan 2022 15:13:51 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 26 Jan 2022 15:13:51 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 26 Jan 2022 15:13:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1643206431; x=1674742431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l1nUXsM59Ui0doiVm12hhhwuohicemAjdr43H7R6YUg=;
  b=KKU+55Z4pD+fDkoFvrY6v7ry80/FFmV6RHiIttpB1AVSMNp/3V/3mLKS
   DbVAjh3U6+RRHOipFr0meGWDB0p52DIrBeKwQMR+v+cRsz/U+sa52Zz8D
   FQiVueRKEfJlgwNlYrdC0tmwlxRkaUTaBglMnhw8D0TeQ2NvsE6qDyR5t
   nDdWmQNBCBkSPPWeiwofdCTGHQ/ZKf0G6Aj5psVlzfohzwBrYswPyDxgf
   6ysYnfnWxEsPLiqeUdB5ZTSXqlKBazmSnoahbOyfHTOZA8/YqzLF2nOaJ
   cvQUCF99bo9RX39HV5wDL0IUddds/tLeGfc8Z/MgAiDzIDAjAuEkZmAj/
   A==;
X-IronPort-AV: E=Sophos;i="5.88,318,1635199200"; 
   d="scan'208";a="21725565"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 26 Jan 2022 15:13:51 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 3299F280078;
        Wed, 26 Jan 2022 15:13:51 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Li Jun <jun.li@nxp.com>
Subject: [PATCH v4 2/4] dt-bindings: usb: dwc3-imx8mp: Add imx8mp specific flags
Date:   Wed, 26 Jan 2022 15:13:38 +0100
Message-Id: <20220126141340.234125-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220126141340.234125-1-alexander.stein@ew.tq-group.com>
References: <20220126141340.234125-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This adds bindings for features in the USB glue block. They allow
setting polarity of PWR and OC as well as disabling port power control.
Also permanently attached can be annotated as well.
Additional IO address and clock are needed.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../bindings/usb/fsl,imx8mp-dwc3.yaml         | 31 ++++++++++++++++---
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
index 974032b1fda0..01ab0f922ae8 100644
--- a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
@@ -15,9 +15,9 @@ properties:
     const: fsl,imx8mp-dwc3
 
   reg:
-    maxItems: 1
-    description: Address and length of the register set for the wrapper of
-      dwc3 core on the SOC.
+    items:
+      - description: Address and length of the register set for HSIO Block Control
+      - description: Address and length of the register set for the wrapper of dwc3 core on the SOC.
 
   "#address-cells":
     enum: [ 1, 2 ]
@@ -49,6 +49,28 @@ properties:
       - const: hsio
       - const: suspend
 
+  fsl,permanently-attached:
+    type: boolean
+    description:
+      Indicates if the device atached to a downstream port is
+      permanently attached.
+
+  fsl,disable-port-power-control:
+    type: boolean
+    description:
+      Indicates whether the host controller implementation includes port
+      power control. Defines Bit 3 in capability register (HCCPARAMS).
+
+  fsl,over-current-active-low:
+    type: boolean
+    description:
+      Over current signal polarity is active low.
+
+  fsl,power-active-low:
+    type: boolean
+    description:
+      Power pad (PWR) polarity is active low.
+
 # Required child node:
 
 patternProperties:
@@ -74,7 +96,8 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     usb3_0: usb@32f10100 {
       compatible = "fsl,imx8mp-dwc3";
-      reg = <0x32f10100 0x8>;
+      reg = <0x32f10100 0x8>,
+            <0x381f0000 0x20>;
       clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
                <&clk IMX8MP_CLK_USB_ROOT>;
       clock-names = "hsio", "suspend";
-- 
2.25.1

