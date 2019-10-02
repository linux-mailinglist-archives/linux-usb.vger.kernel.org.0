Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB124C8749
	for <lists+linux-usb@lfdr.de>; Wed,  2 Oct 2019 13:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728208AbfJBL1B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Oct 2019 07:27:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:42638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728203AbfJBL1B (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Oct 2019 07:27:01 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0E15821920;
        Wed,  2 Oct 2019 11:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570015620;
        bh=DXFtBgxGGgvpKY8DJ0Xw76yv+899ap6972HaBCLpO6g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=11J36BMuspOigGLsrGnlBC+q9XqU0A3fhCLsa9iZ5LAkYZyh9JsHdOxBBRE595vEM
         4oyu04jdRQ3IM4l0MYc1RrfTa+imy7mC7BNmnHn6GC6QVMBQXjiDCRjlovzpIWBJVK
         Iy15N0dMHTp5tanBmY6D78ajcGe2uab0Uhegf0Hg=
From:   Maxime Ripard <mripard@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Emmanuel Vadot <manu@bidouilliste.com>
Subject: [PATCH 2/2] dt-bindings: usb: Bring back phy-names
Date:   Wed,  2 Oct 2019 13:26:51 +0200
Message-Id: <20191002112651.100504-2-mripard@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191002112651.100504-1-mripard@kernel.org>
References: <20191002112651.100504-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

While the original bindings that were superseeded by the YAML schemas
didn't mention that phy-names was needed, it turns out that phy-names is
required if phys is set according to phy/phy-bindings.txt.

Let's add back those properties.

Fixes: 14ec072a19ad ("dt-bindings: usb: Convert USB HCD generic binding to YAML")
Fixes: c93bcace1098 ("dt-bindings: usb: Convert the generic OHCI binding to YAML")
Fixes: c3e2485d5f4f ("dt-bindings: usb: Convert the generic EHCI binding to YAML")
Reported-by: Emmanuel Vadot <manu@bidouilliste.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 7 ++++++-
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 7 ++++++-
 Documentation/devicetree/bindings/usb/usb-hcd.yaml      | 5 +++++
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 059f6ef1ad4a..1ca64c85191a 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -63,7 +63,11 @@ properties:
     description:
       Set this flag to force EHCI reset after resume.
 
-  phys: true
+  phys:
+    description: PHY specifier for the USB PHY
+
+  phy-names:
+    const: usb
 
 required:
   - compatible
@@ -89,6 +93,7 @@ examples:
         interrupts = <39>;
         clocks = <&ahb_gates 1>;
         phys = <&usbphy 1>;
+        phy-names = "usb";
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index da5a14becbe5..bcffec1f1341 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -67,7 +67,11 @@ properties:
     description:
       Overrides the detected port count
 
-  phys: true
+  phys:
+    description: PHY specifier for the USB PHY
+
+  phy-names:
+    const: usb
 
 required:
   - compatible
@@ -84,6 +88,7 @@ examples:
           interrupts = <64>;
           clocks = <&usb_clk 6>, <&ahb_gates 2>;
           phys = <&usbphy 1>;
+          phy-names = "usb";
       };
 
 ...
diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
index 9c8c56d3a792..7263b7f2b510 100644
--- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
@@ -18,8 +18,13 @@ properties:
     description:
       List of all the USB PHYs on this HCD
 
+  phy-names:
+    description:
+      Name specifier for the USB PHY
+
 examples:
   - |
     usb {
         phys = <&usb2_phy1>, <&usb3_phy1>;
+        phy-names = "usb";
     };
-- 
2.23.0

