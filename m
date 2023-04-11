Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA2486DD1C5
	for <lists+linux-usb@lfdr.de>; Tue, 11 Apr 2023 07:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbjDKFgC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Apr 2023 01:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbjDKFgB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Apr 2023 01:36:01 -0400
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C612728
        for <linux-usb@vger.kernel.org>; Mon, 10 Apr 2023 22:35:57 -0700 (PDT)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 33B5ZVo64024652, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
        by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 33B5ZVo64024652
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
        Tue, 11 Apr 2023 13:35:31 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Tue, 11 Apr 2023 13:35:52 +0800
Received: from RTEXH36506.realtek.com.tw (172.21.6.27) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 11 Apr 2023 13:35:51 +0800
Received: from localhost.localdomain (172.21.252.101) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 11 Apr 2023 13:35:51 +0800
From:   Stanley Chang <stanley_chang@realtek.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     <linux-usb@vger.kernel.org>,
        Stanley Chang <stanley_chang@realtek.com>
Subject: [PATCH v2 2/2] dt-bindings: usb: snps,dwc3: Add 'snps,parkmode-disable-hs-quirk' quirk
Date:   Tue, 11 Apr 2023 13:35:50 +0800
Message-ID: <20230411053550.16360-2-stanley_chang@realtek.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230411053550.16360-1-stanley_chang@realtek.com>
References: <20230411053550.16360-1-stanley_chang@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-KSE-ServerInfo: RTEXMBS03.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 04/11/2023 05:15:09
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 176613 [Apr 11 2023]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: stanley_chang@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 509 509 b12bcaa7ba85624b485f2b6b92324b70964a1c65
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;realtek.com:7.1.1
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 04/11/2023 05:17:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIzLzQvMTEgpFekyCAwMTo0NDowMA==?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a new 'snps,parkmode-disable-hs-quirk' DT quirk to dwc3 core for
disable the high-speed parkmode.

Signed-off-by: Stanley Chang <stanley_chang@realtek.com>
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index be36956af53b..45ca967b8d14 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -232,6 +232,11 @@ properties:
       When set, all SuperSpeed bus instances in park mode are disabled.
     type: boolean
 
+  snps,parkmode-disable-hs-quirk:
+    description:
+      When set, all HighSpeed bus instances in park mode are disabled.
+    type: boolean
+
   snps,dis_metastability_quirk:
     description:
       When set, disable metastability workaround. CAUTION! Use only if you are
-- 
2.34.1

