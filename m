Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36EE46DA8B6
	for <lists+linux-usb@lfdr.de>; Fri,  7 Apr 2023 08:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233087AbjDGGHM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Apr 2023 02:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233079AbjDGGHL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Apr 2023 02:07:11 -0400
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FE7C61BE
        for <linux-usb@vger.kernel.org>; Thu,  6 Apr 2023 23:07:09 -0700 (PDT)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 33766iI22023101, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
        by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 33766iI22023101
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
        Fri, 7 Apr 2023 14:06:44 +0800
Received: from RTEXH36505.realtek.com.tw (172.21.6.25) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Fri, 7 Apr 2023 14:07:04 +0800
Received: from localhost.localdomain (172.21.252.101) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server id
 15.1.2375.32 via Frontend Transport; Fri, 7 Apr 2023 14:07:04 +0800
From:   Stanley Chang <stanley_chang@realtek.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH v1 1/2] usb: dwc3: core: add support for remapping global register start address
Date:   Fri, 7 Apr 2023 14:07:02 +0800
Message-ID: <20230407060703.19469-1-stanley_chang@realtek.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
X-KSE-Antispam-Frontend-Serialized-Headers: RnJvbTogU3RhbmxleSBDaGFuZyA8c3RhbmxleV9jaGFuZ0ByZWFsdGVrLmNvbT4NClRvOiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQpDYzogbGludXgtdXNiQHZnZXIua2VybmVsLm9yZw0KU3ViamVjdDogW1BBVENIIHYxIDEvMl0gdXNiOiBkd2MzOiBjb3JlOiBhZGQgc3VwcG9ydCBmb3IgcmVtYXBwaW5nIGdsb2JhbCByZWdpc3RlciBzdGFydCBhZGRyZXNzDQpEYXRlOiBGcmksICA3IEFwciAyMDIzIDE0OjA3OjAyICswODAwDQpNZXNzYWdlLUlkOiA8MjAyMzA0MDcwNjA3MDMuMTk0NjktMS1zdGFubGV5X2NoYW5nQHJlYWx0ZWsuY29tPg0KWC1NYWlsZXI6IGdpdC1zZW5kLWVtYWlsIDIuMzkuMA0KTUlNRS1WZXJzaW9uOiAxLjANCkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQNCg0K
Content-Type:   text/plain; charset=US-ASCII
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The RTK DHC SoCs were designed the global register address offset at 0x8100.
The default address is at DWC3_GLOBALS_REGS_START (0xc100).
Therefore, add the property of device-tree to adjust this start address.

Signed-off-by: Stanley Chang <stanley_chang@realtek.com>
---
 drivers/usb/dwc3/core.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 476b63618511..771b35449376 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1785,6 +1785,23 @@ static int dwc3_probe(struct platform_device *pdev)
 	dwc_res = *res;
 	dwc_res.start += DWC3_GLOBALS_REGS_START;
 
+	/* For some dwc3 controller, the dwc3 global register start address is
+	 * not at DWC3_GLOBALS_REGS_START (0xc100).
+	 */
+	if (dev) {
+		int fixed_dwc3_globals_regs_start;
+
+		device_property_read_u32(dev, "snps,fixed_dwc3_globals_regs_start",
+				 &fixed_dwc3_globals_regs_start);
+		if (fixed_dwc3_globals_regs_start) {
+			dwc_res.start -= DWC3_GLOBALS_REGS_START;
+			dwc_res.start += fixed_dwc3_globals_regs_start;
+			dev_info(dev,
+			    "fixed dwc3 globals register start address from 0x%x to end 0x%x\n",
+			    (int)dwc_res.start, (int)dwc_res.end);
+		}
+	}
+
 	regs = devm_ioremap_resource(dev, &dwc_res);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
-- 
2.34.1

