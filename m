Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B99866DD1C6
	for <lists+linux-usb@lfdr.de>; Tue, 11 Apr 2023 07:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbjDKFgD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Apr 2023 01:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjDKFgB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Apr 2023 01:36:01 -0400
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D082729
        for <linux-usb@vger.kernel.org>; Mon, 10 Apr 2023 22:35:57 -0700 (PDT)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 33B5ZUwJ4024640, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
        by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 33B5ZUwJ4024640
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
        Tue, 11 Apr 2023 13:35:30 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 11 Apr 2023 13:35:52 +0800
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
Subject: [PATCH v2 1/2] usb: dwc3: core: add support for disabling High-speed park mode
Date:   Tue, 11 Apr 2023 13:35:49 +0800
Message-ID: <20230411053550.16360-1-stanley_chang@realtek.com>
X-Mailer: git-send-email 2.40.0
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
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Setting the PARKMODE_DISABLE_HS bit in the DWC3_USB3_GUCTL1.
When this bit is set to '1' all HS bus instances in park mode are disabled

For some USB wifi devices, if enable this feature it will reduce the
performance. Therefore, add an option for disabling HS park mode by
device-tree.

In Synopsys's dwc3 data book:
In a few high speed devices when an IN request is sent within 900ns of the
ACK of the previous packet, these devices send a NAK. When connected to
these devices, if required, the software can disable the park mode if you
see performance drop in your system. When park mode is disabled,
pipelining of multiple packet is disabled and instead one packet at a time
is requested by the scheduler. This allows up to 12 NAKs in a micro-frame
and improves performance of these slow devices.

Signed-off-by: Stanley Chang <stanley_chang@realtek.com>
---
 drivers/usb/dwc3/core.c | 5 +++++
 drivers/usb/dwc3/core.h | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 476b63618511..8fbc92a5f2cb 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1233,6 +1233,9 @@ static int dwc3_core_init(struct dwc3 *dwc)
 		if (dwc->parkmode_disable_ss_quirk)
 			reg |= DWC3_GUCTL1_PARKMODE_DISABLE_SS;
 
+		if (dwc->parkmode_disable_hs_quirk)
+			reg |= DWC3_GUCTL1_PARKMODE_DISABLE_HS;
+
 		if (DWC3_VER_IS_WITHIN(DWC3, 290A, ANY) &&
 		    (dwc->maximum_speed == USB_SPEED_HIGH ||
 		     dwc->maximum_speed == USB_SPEED_FULL))
@@ -1555,6 +1558,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 				"snps,resume-hs-terminations");
 	dwc->parkmode_disable_ss_quirk = device_property_read_bool(dev,
 				"snps,parkmode-disable-ss-quirk");
+	dwc->parkmode_disable_hs_quirk = device_property_read_bool(dev,
+				"snps,parkmode-disable-hs-quirk");
 	dwc->gfladj_refclk_lpm_sel = device_property_read_bool(dev,
 				"snps,gfladj-refclk-lpm-sel-quirk");
 
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 4743e918dcaf..30907ffcb3ec 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -263,6 +263,7 @@
 #define DWC3_GUCTL1_DEV_FORCE_20_CLK_FOR_30_CLK	BIT(26)
 #define DWC3_GUCTL1_DEV_L1_EXIT_BY_HW		BIT(24)
 #define DWC3_GUCTL1_PARKMODE_DISABLE_SS		BIT(17)
+#define DWC3_GUCTL1_PARKMODE_DISABLE_HS		BIT(16)
 #define DWC3_GUCTL1_RESUME_OPMODE_HS_HOST	BIT(10)
 
 /* Global Status Register */
@@ -1102,6 +1103,8 @@ struct dwc3_scratchpad_array {
  *			generation after resume from suspend.
  * @parkmode_disable_ss_quirk: set if we need to disable all SuperSpeed
  *			instances in park mode.
+ * @parkmode_disable_hs_quirk: set if we need to disable all HishSpeed
+ *			instances in park mode.
  * @tx_de_emphasis_quirk: set if we enable Tx de-emphasis quirk
  * @tx_de_emphasis: Tx de-emphasis value
  *	0	- -6dB de-emphasis
@@ -1318,6 +1321,7 @@ struct dwc3 {
 	unsigned		dis_tx_ipgap_linecheck_quirk:1;
 	unsigned		resume_hs_terminations:1;
 	unsigned		parkmode_disable_ss_quirk:1;
+	unsigned		parkmode_disable_hs_quirk:1;
 	unsigned		gfladj_refclk_lpm_sel:1;
 
 	unsigned		tx_de_emphasis_quirk:1;
-- 
2.34.1

