Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB357742F52
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jun 2023 23:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbjF2VLE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Jun 2023 17:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231681AbjF2VK6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Jun 2023 17:10:58 -0400
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E71DA2D4C
        for <linux-usb@vger.kernel.org>; Thu, 29 Jun 2023 14:10:55 -0700 (PDT)
Received: from [192.168.1.103] (31.173.87.199) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Fri, 30 Jun
 2023 00:10:46 +0300
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] usb: host: xhci-plat: fix possible kernel oops while resuming
Organization: Open Mobile Platform
Message-ID: <7eff75da-bdd5-8ccd-1ad1-676f29041545@omp.ru>
Date:   Fri, 30 Jun 2023 00:10:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [31.173.87.199]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 06/29/2023 20:56:06
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 178343 [Jun 29 2023]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 517 517 b0056c19d8e10afbb16cb7aad7258dedb0179a79
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.87.199 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.87.199
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/29/2023 21:02:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 6/29/2023 6:28:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If this driver enables the xHC clocks while resuming from sleep, it calls
clk_prepare_enable() without checking for errors and blithely goes on to
read/write the xHC's registers -- which, with the xHC not being clocked,
at least on ARM32 usually causes an imprecise external abort exceptions
which cause kernel oops.  Currently, the chips for which the driver does
the clock dance on suspend/resume seem to be the Broadcom STB SoCs, based
on ARM32 CPUs, as it seems...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Fixes: 8bd954c56197 ("usb: host: xhci-plat: suspend and resume clocks")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'usb-linus' branch of Greg KH's 'usb.git' repo...

 drivers/usb/host/xhci-plat.c |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

Index: usb/drivers/usb/host/xhci-plat.c
===================================================================
--- usb.orig/drivers/usb/host/xhci-plat.c
+++ usb/drivers/usb/host/xhci-plat.c
@@ -470,8 +470,14 @@ static int __maybe_unused xhci_plat_resu
 	int ret;
 
 	if (!device_may_wakeup(dev) && (xhci->quirks & XHCI_SUSPEND_RESUME_CLKS)) {
-		clk_prepare_enable(xhci->clk);
-		clk_prepare_enable(xhci->reg_clk);
+		ret = clk_prepare_enable(xhci->clk);
+		if (ret)
+			return ret;
+		ret = clk_prepare_enable(xhci->reg_clk);
+		if (ret) {
+			clk_disable_unprepare(xhci->clk);
+			return ret;
+		}
 	}
 
 	ret = xhci_priv_resume_quirk(hcd);
