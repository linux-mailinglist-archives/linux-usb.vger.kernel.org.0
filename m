Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B60D61E0786
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 09:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388981AbgEYHLI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 May 2020 03:11:08 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:34058 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388979AbgEYHLH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 May 2020 03:11:07 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04P7AstL068652;
        Mon, 25 May 2020 02:10:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590390654;
        bh=95hvA0bQAWwkvQo1S9cy4RYDGWSfQiEBjR10x+N8Vlg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=VUMKauIJ5AVBKrvPjxWVdxS+9sbZOHjMeEbmZQ/ntDEUlKhtyXKAer4BpTRJRc0CW
         LaceH7B+0rXUW6pSKGYTmcCf1lvdUeI1Al6PyWYBPPJAcjZviz+Lp6/zLLZSkbjimF
         KLpk3YEwoO0X9HtthIlHREcrixdJ0/ccdNadNgVw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04P7AspA091515
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 25 May 2020 02:10:54 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 25
 May 2020 02:10:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 25 May 2020 02:10:54 -0500
Received: from lta0400828a.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04P7AohV077897;
        Mon, 25 May 2020 02:10:52 -0500
From:   Roger Quadros <rogerq@ti.com>
To:     <balbi@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <vigneshr@ti.com>,
        <chunfeng.yun@mediatek.com>, <linux-kernel@vger.kernel.org>,
        Roger Quadros <rogerq@ti.com>
Subject: [PATCH v2 1/2] dt-bindings: usb: ti,keystone-dwc3.yaml: Add USB3.0 PHY property
Date:   Mon, 25 May 2020 10:10:47 +0300
Message-ID: <20200525071048.7738-2-rogerq@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200525071048.7738-1-rogerq@ti.com>
References: <20200525071048.7738-1-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

AM654 SoC requires USB3.0 PHY to be turned on before the USB controller.
For this SoC, the 'phys' property is used to provide the USB3.0
reference.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 .../devicetree/bindings/usb/ti,keystone-dwc3.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml b/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml
index 14d2fe329b93..f127535feb0b 100644
--- a/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml
@@ -34,6 +34,16 @@ properties:
       value. This property is as per the binding,
       Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
 
+  phys:
+    description:
+      PHY specifier for the USB3.0 PHY. Some SoCs need the USB3.0 PHY
+      to be turned on before the controller.
+      Documentation/devicetree/bindings/phy/phy-bindings.txt
+
+  phy-names:
+    items:
+      - const: "usb3-phy"
+
   dwc3:
     description: This is the node representing the DWC3 controller instance
       Documentation/devicetree/bindings/usb/dwc3.txt
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

