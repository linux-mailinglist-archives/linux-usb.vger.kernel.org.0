Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD3A786DF6
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 01:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404652AbfHHXjr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 19:39:47 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.61.142]:59630 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2404499AbfHHXjq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Aug 2019 19:39:46 -0400
Received: from mailhost.synopsys.com (dc8-mailhost2.synopsys.com [10.13.135.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 684C9C0AB4;
        Thu,  8 Aug 2019 23:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1565307585; bh=PnviOQFZInCmfO++RGn709FBckZqCTd6GhlNF4I5lpY=;
        h=Date:From:Subject:To:CC:From;
        b=YFHjdigtZ96FSMChqi7ICUV/haZyQI1G3e5+ZH3T9lxouSFmRF3fYJ+1U5SOM81Ll
         nHijblG9lwMBaIRRFP/hY5+SeGY8f+7Qc5oxzoY/YI4UhPovqzo6O6rCm5zgjO8hDP
         +om/lGL5zkM4GCjP/CvnXhag5kKvJ9HD5ArM5fS4o1RlZYUjud3NITJJE4uQTY0oIw
         cGnDrqgZ4nKyQUScf+b1UGXGZY5igRXqSR8JWxRC5m8oKMPOt4nolJFKGkSDscDqXw
         AgElT13om5iNmx8SQkBjCs9j160U6Mvec6Amj72H3yCg5FAD2ntIonqfFMIkwMtd1N
         frdwRqTf9LKLQ==
Received: from us01wehtc1.internal.synopsys.com (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 2002CA0065;
        Thu,  8 Aug 2019 23:39:45 +0000 (UTC)
Received: from US01WEHTC3.internal.synopsys.com (10.15.84.232) by
 us01wehtc1.internal.synopsys.com (10.12.239.231) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 8 Aug 2019 16:39:44 -0700
Received: from te-lab16 (10.13.184.19) by US01WEHTC3.internal.synopsys.com
 (10.15.84.231) with Microsoft SMTP Server (TLS) id 14.3.408.0; Thu, 8 Aug
 2019 16:39:42 -0700
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 08 Aug 2019 16:39:42
 -0700
Date:   Thu, 8 Aug 2019 16:39:42 -0700
Message-ID: <ac09fd05a411b585a73dde6b6745c79ec9123743.1565307304.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: dwc3: Update soft-reset wait polling rate
To:     Felipe Balbi <balbi@kernel.org>, <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.184.19]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Starting from DWC_usb31 version 1.90a and later, the DCTL.CSFRST bit
will not be cleared until after all the internal clocks are synchronized
during soft-reset. This may take a little more than 50ms. Set the
polling rate at 20ms instead.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/core.c | 23 ++++++++++++++++++-----
 drivers/usb/dwc3/core.h |  2 ++
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 98bce85c29d0..252c397860ef 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -252,12 +252,25 @@ static int dwc3_core_soft_reset(struct dwc3 *dwc)
 	reg |= DWC3_DCTL_CSFTRST;
 	dwc3_writel(dwc->regs, DWC3_DCTL, reg);
 
+	/*
+	 * For DWC_usb31 controller 1.90a and later, the DCTL.CSFRST bit
+	 * is cleared only after all the clocks are synchronized. This can
+	 * take a little more than 50ms. Set the polling rate at 20ms
+	 * for 10 times instead.
+	 */
+	if (dwc3_is_usb31(dwc) && dwc->revision >= DWC3_USB31_REVISION_190A)
+		retries = 10;
+
 	do {
 		reg = dwc3_readl(dwc->regs, DWC3_DCTL);
 		if (!(reg & DWC3_DCTL_CSFTRST))
 			goto done;
 
-		udelay(1);
+		if (dwc3_is_usb31(dwc) &&
+		    dwc->revision >= DWC3_USB31_REVISION_190A)
+			msleep(20);
+		else
+			udelay(1);
 	} while (--retries);
 
 	phy_exit(dwc->usb3_generic_phy);
@@ -267,11 +280,11 @@ static int dwc3_core_soft_reset(struct dwc3 *dwc)
 
 done:
 	/*
-	 * For DWC_usb31 controller, once DWC3_DCTL_CSFTRST bit is cleared,
-	 * we must wait at least 50ms before accessing the PHY domain
-	 * (synchronization delay). DWC_usb31 programming guide section 1.3.2.
+	 * For DWC_usb31 controller 1.80a and prior, once DCTL.CSFRST bit
+	 * is cleared, we must wait at least 50ms before accessing the PHY
+	 * domain (synchronization delay).
 	 */
-	if (dwc3_is_usb31(dwc))
+	if (dwc3_is_usb31(dwc) && dwc->revision <= DWC3_USB31_REVISION_180A)
 		msleep(50);
 
 	return 0;
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 3dd783b889cb..1c8b349379af 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1137,6 +1137,8 @@ struct dwc3 {
 #define DWC3_USB31_REVISION_120A	(0x3132302a | DWC3_REVISION_IS_DWC31)
 #define DWC3_USB31_REVISION_160A	(0x3136302a | DWC3_REVISION_IS_DWC31)
 #define DWC3_USB31_REVISION_170A	(0x3137302a | DWC3_REVISION_IS_DWC31)
+#define DWC3_USB31_REVISION_180A	(0x3138302a | DWC3_REVISION_IS_DWC31)
+#define DWC3_USB31_REVISION_190A	(0x3139302a | DWC3_REVISION_IS_DWC31)
 
 	u32			version_type;
 
-- 
2.11.0

