Return-Path: <linux-usb+bounces-1104-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8D57B8E4B
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 22:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id AC65B281BDB
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 20:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B3922F0B;
	Wed,  4 Oct 2023 20:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF23A2110B
	for <linux-usb@vger.kernel.org>; Wed,  4 Oct 2023 20:47:09 +0000 (UTC)
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D71B5B8
	for <linux-usb@vger.kernel.org>; Wed,  4 Oct 2023 13:47:06 -0700 (PDT)
Received: from [192.168.1.103] (31.173.82.102) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Wed, 4 Oct 2023
 23:47:03 +0300
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v5] usb: host: xhci-plat: fix possible kernel oops while
 resuming
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>
CC: Florian Fainelli <f.fainelli@gmail.com>
Organization: Open Mobile Platform
Message-ID: <c8c4ea38-c0f7-756d-01fb-cab51a3f8393@omp.ru>
Date: Wed, 4 Oct 2023 23:47:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [31.173.82.102]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.0.0, Database issued on: 10/04/2023 20:24:56
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 180363 [Oct 04 2023]
X-KSE-AntiSpam-Info: Version: 6.0.0.2
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 535 535 da804c0ea8918f802fc60e7a20ba49783d957ba2
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.82.102 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	31.173.82.102:7.7.3,7.4.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {cloud_iprep_silent}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: {rdns complete}
X-KSE-AntiSpam-Info: {fromrtbl complete}
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.82.102
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=none header.from=omp.ru;spf=none
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/04/2023 20:29:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/4/2023 5:06:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

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
This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo...

Changes in version 5:
- got rid of xhci_plat_disable_clocks() helper;
- removed the passage on what's done by the patch from the patch description;
- rebased the patch against the 'usb-next' branch.

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

 drivers/usb/host/xhci-plat.c |   23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

Index: usb/drivers/usb/host/xhci-plat.c
===================================================================
--- usb.orig/drivers/usb/host/xhci-plat.c
+++ usb/drivers/usb/host/xhci-plat.c
@@ -458,23 +458,38 @@ static int __maybe_unused xhci_plat_resu
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
+	if (!device_may_wakeup(dev) && (xhci->quirks & XHCI_SUSPEND_RESUME_CLKS)) {
+		clk_disable_unprepare(xhci->clk);
+		clk_disable_unprepare(xhci->reg_clk);
+	}
+
+	return ret;
 }
 
 static int __maybe_unused xhci_plat_runtime_suspend(struct device *dev)

