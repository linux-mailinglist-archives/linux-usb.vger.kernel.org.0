Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42FE5251849
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 14:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730163AbgHYMKl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 08:10:41 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:49400 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730160AbgHYMKk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Aug 2020 08:10:40 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07PC18G8016602;
        Tue, 25 Aug 2020 07:01:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598356868;
        bh=6iTGZN+JwkBeWLVHlq7OEf0y2toD1uBMC769ulSTz+s=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=MzO8WnLMEp49BPPld4153s0JLGNLVRxIGAmEJLJLW8KsOBLmC9qWX9Xq/O3jLxExV
         nP3Y3lhouJQqKpA1K+YTMMRHbZg+H2cWEEtnnQXykeZz0j87Pert2ZQ84vf88KEk+6
         iOgWZRonU7OjgII4u7Y/Pp4/HEuBjK2tAVHtkbF0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07PC18Aa009435
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Aug 2020 07:01:08 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 25
 Aug 2020 07:01:08 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 25 Aug 2020 07:01:08 -0500
Received: from lta0400828a.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07PC10LC024089;
        Tue, 25 Aug 2020 07:01:05 -0500
From:   Roger Quadros <rogerq@ti.com>
To:     <balbi@kernel.org>
CC:     <pawell@cadence.com>, <kurahul@cadence.com>, <nsekhar@ti.com>,
        <vigneshr@ti.com>, <robh+dt@kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH 2/3] dt-bindings: usb: cdns,usb3: Add cdns,phyrst-a-enable property
Date:   Tue, 25 Aug 2020 15:00:58 +0300
Message-ID: <20200825120059.12436-3-rogerq@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825120059.12436-1-rogerq@ti.com>
References: <20200825120059.12436-1-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Controller version 0x0002450D has USB2 PHY RX sensitivity issues
that needs to be worked around by enabling phyrst-a-enable bit
in PHYRST_CFG register.

There is no way to distinguish between the controller version
before the device controller is started so we need to add this
DT property.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index 7bc0263accee..e670adc955e1 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -58,6 +58,10 @@ properties:
       buffers expressed in KB
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  cdns,phyrst-a-enable:
+    description: Enable resetting of PHY if Rx fail is detected
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

