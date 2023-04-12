Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2938D6DE9E5
	for <lists+linux-usb@lfdr.de>; Wed, 12 Apr 2023 05:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjDLDaY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Apr 2023 23:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjDLDaX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Apr 2023 23:30:23 -0400
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD05930E0
        for <linux-usb@vger.kernel.org>; Tue, 11 Apr 2023 20:30:20 -0700 (PDT)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 33C3Tjz76001695, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
        by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 33C3Tjz76001695
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
        Wed, 12 Apr 2023 11:29:45 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Wed, 12 Apr 2023 11:30:07 +0800
Received: from RTEXH36505.realtek.com.tw (172.21.6.25) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 12 Apr 2023 11:30:06 +0800
Received: from localhost.localdomain (172.21.252.101) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server id
 15.1.2375.32 via Frontend Transport; Wed, 12 Apr 2023 11:30:06 +0800
From:   Stanley Chang <stanley_chang@realtek.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     <linux-usb@vger.kernel.org>,
        Stanley Chang <stanley_chang@realtek.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 2/2] dt-bindings: usb: snps,dwc3: Add 'snps,global-regs-starting-offset' quirk
Date:   Wed, 12 Apr 2023 11:30:06 +0800
Message-ID: <20230412033006.10859-2-stanley_chang@realtek.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412033006.10859-1-stanley_chang@realtek.com>
References: <20230412033006.10859-1-stanley_chang@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-KSE-ServerInfo: RTEXDAG02.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a new 'snps,global-regs-starting-offset' DT to dwc3 core to remap
the global register start address

The RTK DHC SoCs were designed the global register address offset at
0x8100. The default address is at DWC3_GLOBALS_REGS_START (0xc100).
Therefore, add the property of device-tree to adjust this start address.

Signed-off-by: Stanley Chang <stanley_chang@realtek.com>
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index be36956af53b..5cbf3b7ded04 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -359,6 +359,13 @@ properties:
     items:
       enum: [1, 4, 8, 16, 32, 64, 128, 256]
 
+  snps,global-regs-starting-offset:
+    description:
+      value for remapping global register start address. For some dwc3
+      controller, the dwc3 global register start address is not at
+      default DWC3_GLOBALS_REGS_START (0xc100). This property is added to
+      adjust the address.
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description:
-- 
2.34.1

