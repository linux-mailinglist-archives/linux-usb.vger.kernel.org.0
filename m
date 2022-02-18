Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE254BBC24
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 16:27:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237004AbiBRP1h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Feb 2022 10:27:37 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237000AbiBRP1h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Feb 2022 10:27:37 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 807EE253BD6;
        Fri, 18 Feb 2022 07:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1645198040; x=1676734040;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NUNBthkSzGU6hGyMwUVYeSCWLjIWKGHnzMfDpZUB7Zw=;
  b=qXsACdo6tb5q1h9aKNrION6kQC8AIdFxSx36eyBr1q74BviYCrio44kl
   38UeDnuVmrV4rX1ZMFfPGKQByPulXQue56ecsScORtFdCx7grvl3YSUQH
   XPDlmkFtlSIA8hl/+/1sA99Z75dM3VdpipRrRc71EVr1il4CKSYY+fJcR
   7IguykOc84hFXQ007q2/Nbza2sTIGJ8tO8PleNZzuETlP5MUkAv24Kws0
   29KLxpS61oCETUBCJW/DvpX8DSQeUcgWTb8d9m8iuLyVKmOZ0w7Dkc1YD
   JLIxnXrFCUV4M3W3/CeUbc9KDr24Im4Er+KLfdFnROKXIOZRIIDD0uwL4
   A==;
X-IronPort-AV: E=Sophos;i="5.88,379,1635199200"; 
   d="scan'208";a="22181141"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Feb 2022 16:27:14 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 18 Feb 2022 16:27:14 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 18 Feb 2022 16:27:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1645198034; x=1676734034;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NUNBthkSzGU6hGyMwUVYeSCWLjIWKGHnzMfDpZUB7Zw=;
  b=iql3kk7dHSssCmzUkrvVXEcvLKSegqKIlpcVDihjlJ2VkX31T73s4Sh9
   M0vvDkx5RIHJ+vLqNndwbj62sbIQQ71PJZmdzeF/4bgADiIR1Xx3x0zNU
   HY6O17pxrpDaU4GpjySn2drt6ZgvoL9HS22opQUJGb3QwUh5xK6BYIVu1
   N/XdYWrrkv+beFM3DNi8t4XSJUFdr+tgr9jxaAUXroo5+MgksFdgWXbos
   wh/kgKsZatxX40JkqQEeTxQDMn4b9eE24citD1sbSyB2n5rkLGD15lxai
   /Ct6whkbYpZKXw/ouzp+KVpOykeUz8ehE3LhsOydDhbe72GB20yUgjUlK
   A==;
X-IronPort-AV: E=Sophos;i="5.88,379,1635199200"; 
   d="scan'208";a="22181140"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Feb 2022 16:27:14 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 81693280065;
        Fri, 18 Feb 2022 16:27:14 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Li Jun <jun.li@nxp.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 2/4] dt-bindings: usb: dwc3-imx8mp: Add imx8mp specific flags
Date:   Fri, 18 Feb 2022 16:27:05 +0100
Message-Id: <20220218152707.2198357-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220218152707.2198357-1-alexander.stein@ew.tq-group.com>
References: <20220218152707.2198357-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This adds bindings for features in the USB glue block. They allow
setting polarity of PWR and OC as well as disabling port power control.
Also permanently attached can be annotated as well.
Additional IO address and clock are needed.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v5:
* Added Reviewed-by: Rob Herring

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

