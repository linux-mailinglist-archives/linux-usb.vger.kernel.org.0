Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1C5438602
	for <lists+linux-usb@lfdr.de>; Sun, 24 Oct 2021 02:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbhJXAjY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 Oct 2021 20:39:24 -0400
Received: from phobos.denx.de ([85.214.62.61]:37030 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231131AbhJXAjX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 23 Oct 2021 20:39:23 -0400
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id D337D83303;
        Sun, 24 Oct 2021 02:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1635035822;
        bh=Sy1O37cAs5gqV5sR7/uMeWWea3WjWSSRC8MZNh3N/8U=;
        h=From:To:Cc:Subject:Date:From;
        b=E+Wmca333vp2sTkVdW4S8aO6Zycl8NnzjEozzRGYW0IpOXHDMEVlNbYG0L3vdRP8d
         GSQkkqt1PXAPxOJC8GJirr6jxXtnPt1r8RH+5SAQtSdw6qmBGXnaQeGr4NwBKiUoHB
         m5vVpGjRx3kMedm6tFOoAz7IKk0mUhuJh4FMDg+wLsdNc7jGXTIcI5LVjC8umyn5YT
         zpY04Ot9zW+K6BcMpTYCif9nNv28MtFqR2AL3DimNNi+X/PfF9VPN+9ekM3cp0mByl
         OXpS+ebLib94VQeMcgxwBGNuTxL0OFHixSxO9/sJjkrw068nd/u7DzjOmKDjOCAHNp
         gZPIVOrVNAyiQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-usb@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: usb: dwc2: Add otg-rev property documentation
Date:   Sun, 24 Oct 2021 02:36:52 +0200
Message-Id: <20211024003652.227772-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Copy the otg-rev property documentation from usb-drd.yaml into the DWC2
binding document, since some users of the DWC2 IP like STM32MP1 use the
otg-rev property in DT bindings for this controller.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
NOTE: Shouldn't this somehow be part of the USB core bindings instead?
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index 10c7d9b6cc53f..254436c19870b 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -120,6 +120,16 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     description: size of periodic tx fifo per endpoint (except ep0) in gadget mode.
 
+  otg-rev:
+    description:
+      Tells usb driver the release number of the OTG and EH supplement with
+      which the device and its descriptors are compliant, in binary-coded
+      decimal (i.e. 2.0 is 0200H). This property is used if any real OTG
+      features (HNP/SRP/ADP) is enabled. If ADP is required, otg-rev should be
+      0x0200 or above.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0x0100, 0x0120, 0x0130, 0x0200]
+
   snps,need-phy-for-wake:
     $ref: /schemas/types.yaml#/definitions/flag
     description: If present indicates that the phy needs to be left on for 
-- 
2.33.0

