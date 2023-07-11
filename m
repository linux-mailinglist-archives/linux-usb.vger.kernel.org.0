Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6786374F851
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jul 2023 21:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbjGKTSU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jul 2023 15:18:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbjGKTSS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Jul 2023 15:18:18 -0400
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9409E10EA
        for <linux-usb@vger.kernel.org>; Tue, 11 Jul 2023 12:18:16 -0700 (PDT)
Received: from [192.168.1.103] (178.176.78.121) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Tue, 11 Jul
 2023 22:18:07 +0300
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v4] usb: host: xhci-plat: fix possible kernel oops while
 resuming
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
CC:     Florian Fainelli <f.fainelli@gmail.com>
Organization: Open Mobile Platform
Message-ID: <e0459058-5ca5-1c1a-c06a-47100c176ba2@omp.ru>
Date:   Tue, 11 Jul 2023 22:18:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [178.176.78.121]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 07/11/2023 18:52:41
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 178558 [Jul 11 2023]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 521 521 0c3391dd6036774f2e1052158c81e48587b96e95
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.78.121 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: omp.ru:7.1.1;178.176.78.121:7.1.2,7.7.3,7.4.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: {iprep_blacklist}
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.78.121
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 07/11/2023 18:57:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 7/11/2023 2:37:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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

In order to fix this issue, add the result checks for clk_prepare_enable()
calls in xhci_plat_resume(), add conditional clk_disable_unprepare() calls
on the error path of xhci_plat_resume(); then factor out the common clock
disabling code from the suspend() and resume() driver PM methods into a
separate function to avoid code duplication.

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Fixes: 8bd954c56197 ("usb: host: xhci-plat: suspend and resume clocks")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'usb-linus' branch of Greg KH's 'usb.git' repo...

Changes in version 4:
- resolved reject in xhci_plat_resume() due to the changed xhci_resume() call;
- added the __maybe_unused attribute to xhci_plat_disable_clocks().

Changes in version 3:
- sanitized the clock enabling error paths in xhci_plat_resume() WRT the
  applicability checks;
- factored out the common clock disabling code from the suspend() and resume()
  driver PM methods;
- added to the patch sescriptiun a passage describing the change being done.

Changes in version 2:
- fixed up the error path for clk_prepare_enable() calls in xhci_plat_resume().

 drivers/usb/host/xhci-plat.c |   35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

Index: usb/drivers/usb/host/xhci-plat.c
===================================================================
--- usb.orig/drivers/usb/host/xhci-plat.c
+++ usb/drivers/usb/host/xhci-plat.c
@@ -424,6 +424,14 @@ void xhci_plat_remove(struct platform_de
 }
 EXPORT_SYMBOL_GPL(xhci_plat_remove);
 
+static void __maybe_unused xhci_plat_disable_clocks(struct xhci_hcd *xhci)
+{
+	if (xhci->quirks & XHCI_SUSPEND_RESUME_CLKS) {
+		clk_disable_unprepare(xhci->clk);
+		clk_disable_unprepare(xhci->reg_clk);
+	}
+}
+
 static int __maybe_unused xhci_plat_suspend(struct device *dev)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
@@ -444,10 +452,8 @@ static int __maybe_unused xhci_plat_susp
 	if (ret)
 		return ret;
 
-	if (!device_may_wakeup(dev) && (xhci->quirks & XHCI_SUSPEND_RESUME_CLKS)) {
-		clk_disable_unprepare(xhci->clk);
-		clk_disable_unprepare(xhci->reg_clk);
-	}
+	if (!device_may_wakeup(dev))
+		xhci_plat_disable_clocks(xhci);
 
 	return 0;
 }
@@ -459,23 +465,36 @@ static int __maybe_unused xhci_plat_resu
 	int ret;
 
 	if (!device_may_wakeup(dev) && (xhci->quirks & XHCI_SUSPEND_RESUME_CLKS)) {
-		clk_prepare_enable(xhci->clk);
-		clk_prepare_enable(xhci->reg_clk);
+		ret = clk_prepare_enable(xhci->clk);
+		if (ret)
+			return ret;
+
+		ret = clk_prepare_enable(xhci->reg_clk);
+		if (ret) {
+			clk_disable_unprepare(xhci->clk);
+			return ret;
+		}
 	}
 
 	ret = xhci_priv_resume_quirk(hcd);
 	if (ret)
-		return ret;
+		goto disable_clks;
 
 	ret = xhci_resume(xhci, PMSG_RESUME);
 	if (ret)
-		return ret;
+		goto disable_clks;
 
 	pm_runtime_disable(dev);
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
 	return 0;
+
+disable_clks:
+	if (!device_may_wakeup(dev))
+		xhci_plat_disable_clocks(xhci);
+
+	return ret;
 }
 
 static int __maybe_unused xhci_plat_runtime_suspend(struct device *dev)
