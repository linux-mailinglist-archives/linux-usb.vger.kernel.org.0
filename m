Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36517FC02
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 16:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbfD3O7p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 10:59:45 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50718 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbfD3O7o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 10:59:44 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3UExhgT099566;
        Tue, 30 Apr 2019 09:59:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1556636383;
        bh=8TyrOpAFv43hh7ZU7QY3FbOD3tIE0MS9xDmWrg0cELQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=BNc+nzmLx/qeA4ptcJh27KnqMJ15NYGf7wONukmyN9x5anwZcbwRGxdudhL0YGJog
         mXWGOLQP4Aimhggp5IxfWufU4KG5P25skTKbqS0srQYFQefSuzjpw2yAIAfZoRcBuz
         BZvXWmdNLngL512Zv+NieF07umKNZ6kAqgx9OLs8=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3UExhvM094135
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 30 Apr 2019 09:59:43 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 30
 Apr 2019 09:59:42 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 30 Apr 2019 09:59:42 -0500
Received: from uda0271908.am.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3UExgrE071248;
        Tue, 30 Apr 2019 09:59:42 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 4/7] dt-bindings: usb: Add usb-phy property to the jz4740-musb node
Date:   Tue, 30 Apr 2019 09:59:38 -0500
Message-ID: <20190430145942.1128-5-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430145942.1128-1-b-liu@ti.com>
References: <20190430145942.1128-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Paul Cercueil <paul@crapouillou.net>

Add a required 'usb-phy' property, to obtain a phandle to the USB PHY
from devicetree.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 .../devicetree/bindings/usb/ingenic,jz4740-musb.txt       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt b/Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt
index 620355cee63f..16808721f3ff 100644
--- a/Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt
+++ b/Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt
@@ -8,9 +8,15 @@ Required properties:
 - interrupt-names: must be "mc"
 - clocks: phandle to the "udc" clock
 - clock-names: must be "udc"
+- phys: phandle to the USB PHY
 
 Example:
 
+usb_phy: usb-phy@0 {
+	compatible = "usb-nop-xceiv";
+	#phy-cells = <0>;
+};
+
 udc: usb@13040000 {
 	compatible = "ingenic,jz4740-musb";
 	reg = <0x13040000 0x10000>;
@@ -21,4 +27,6 @@ udc: usb@13040000 {
 
 	clocks = <&cgu JZ4740_CLK_UDC>;
 	clock-names = "udc";
+
+	phys = <&usb_phy>;
 };
-- 
2.17.1

