Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDE604926EC
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jan 2022 14:16:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242052AbiARNQl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jan 2022 08:16:41 -0500
Received: from mx1.tq-group.com ([93.104.207.81]:30785 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241360AbiARNQj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Jan 2022 08:16:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1642511799; x=1674047799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/o6MmTbpFIjUnuZdxv6xZk80oeBZ2Pk9GWe8PY2e5ls=;
  b=hE3qb/R6pVQ0dU8l5PwfflTzmjdFl1vQO8lXgBgea74IhZQDmBNWbFQn
   pMCCt3LvDtvCn22cjDQOxcL7uuWhzfzAVqHLkyzlzV0hD1PJzW4nFWEY3
   Ip0jvll/WJ9TuXTVtM6Dsjh9DT3i9LRTHxhh9fR48pM6n93+Kou/5RIsx
   6FVHA/Dpka8boASopBp7jal2YzCP/1OGGtS+NFanSlLkN2p9gM4jrU312
   a/VZJCWykkvBjia94vReDIbN9Xvv5YYiarE4FEo5Ul5ucoZOKI0YR8qRt
   gEMQDFpnE+VtTMSW5Hhq83RQ5TdOyjjedGhCfaiQlpj5nTN1n3Y/y3gpg
   w==;
X-IronPort-AV: E=Sophos;i="5.88,297,1635199200"; 
   d="scan'208";a="21564687"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Jan 2022 14:16:37 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 18 Jan 2022 14:16:37 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 18 Jan 2022 14:16:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1642511797; x=1674047797;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/o6MmTbpFIjUnuZdxv6xZk80oeBZ2Pk9GWe8PY2e5ls=;
  b=cWFzLF2XzZDxLxFATwWJlqWm712mIgJ2WI8xv7q0pfuysi/JU30SbGEj
   alWCSruyoAjnZN7xKmdN5b4Ujp64ruZL6/SVD/8fIi8A8v1Z5J0O2biEW
   Lh6UrKlc9QT+P49gkm0a0avVVdZekLuEKtLWAyDihT5vawp22WrQTdVpB
   RnQRYg+s+MFgCi635twXyiDJE4vXDGegdBLDtux9ghmPX2JCHF9YH6zhp
   HKlH8DrDUQ929M5ONyFVT7Fg5O2Aasftxv2u74gQScQOqlg8AdBU2qQRV
   J0K5RHHIxh6kxxH0WvCWoNFDAqZ72FgqlPvFRkkJryzZG/CXDDxgpuZoe
   w==;
X-IronPort-AV: E=Sophos;i="5.88,297,1635199200"; 
   d="scan'208";a="21564686"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Jan 2022 14:16:37 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8D8B9280065;
        Tue, 18 Jan 2022 14:16:36 +0100 (CET)
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
Subject: [PATCH v3 2/4] dt-bindings: usb: dwc3-imx8mp: Add imx8mp specific flags
Date:   Tue, 18 Jan 2022 14:16:24 +0100
Message-Id: <20220118131626.926394-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118131626.926394-1-alexander.stein@ew.tq-group.com>
References: <20220118131626.926394-1-alexander.stein@ew.tq-group.com>
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
 .../bindings/usb/fsl,imx8mp-dwc3.yaml         | 38 ++++++++++++++++---
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
index 974032b1fda0..ff48b4e8427d 100644
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
@@ -43,11 +43,35 @@ properties:
     items:
       - description: system hsio root clock.
       - description: suspend clock, used for usb wakeup logic.
+      - description: clock for the USB glue block
 
   clock-names:
     items:
       - const: hsio
       - const: suspend
+      - const: phy
+
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
 
 # Required child node:
 
@@ -74,10 +98,12 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     usb3_0: usb@32f10100 {
       compatible = "fsl,imx8mp-dwc3";
-      reg = <0x32f10100 0x8>;
+      reg = <0x32f10100 0x8>,
+            <0x381f0000 0x20>;
       clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
-               <&clk IMX8MP_CLK_USB_ROOT>;
-      clock-names = "hsio", "suspend";
+               <&clk IMX8MP_CLK_USB_ROOT>,
+               <&clk IMX8MP_CLK_USB_PHY_ROOT>;
+      clock-names = "hsio", "suspend", "phy";
       interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
       #address-cells = <1>;
       #size-cells = <1>;
-- 
2.25.1

