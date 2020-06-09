Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D22B11F3617
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jun 2020 10:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbgFII2T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Jun 2020 04:28:19 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:52642 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728105AbgFII2T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Jun 2020 04:28:19 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AF540C03B4;
        Tue,  9 Jun 2020 08:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1591691299; bh=XAKLW4HAuGvjQonq852ns1I3TG89AVQbOhokujMiKF4=;
        h=Date:From:Subject:To:Cc:From;
        b=EtRn/82/w1C22TTqQgd8Wnux/dbwKMzc8UbnAb0P66fGdX5NXy3RXdpbHZeM077u5
         W2D+t75nwmMQXdNf3lRkkCYjunfee8Z7fnhIm7ejGd4HZNcA9FGmMScBbZObLLe+fE
         HSOYFEfI5v5FRuIydpHhdXapw530oZPdaGg+GACokgjPwkBxZ0zjfxMZeKPUKz/2pD
         by+RzUJQGnMfYlpwscJqG+IdxOesLlYaTcTMplZ5udIdMN0JjsVimz5EmUPL6L6DZ8
         qLkfZVQFEn3BcK2hHz7t8uIVDmR22NTF/WOd032ApnrWRCSpaJ+DXrciQh/hT5SKLL
         1ygeovlXN0WKw==
Received: from hminas-z420 (hminas-z420.internal.synopsys.com [10.116.126.211])
        (using TLSv1 with cipher AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 6013FA0096;
        Tue,  9 Jun 2020 08:28:14 +0000 (UTC)
Received: by hminas-z420 (sSMTP sendmail emulation); Tue, 09 Jun 2020 12:28:11 +0400
Date:   Tue, 09 Jun 2020 12:28:11 +0400
Message-Id: <f21cb38fecc72a230b86155d94c7e60c9cb66f58.1591690938.git.hminas@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH v4] usb: dwc2: Postponed gadget registration to the udc class driver
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>, Marek Vasut <marex@denx.de>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

During dwc2 driver probe, after gadget registration to the udc class
driver, if exist any builtin function driver it immediately bound to
dwc2 and after init host side (dwc2_hcd_init()) stucked in host mode.
Patch postpone gadget registration after host side initialization done.

Fixes: 117777b2c3bb9 ("usb: dwc2: Move gadget probe function into
platform code")
Reported-by: kbuild test robot <lkp@intel.com>
Tested-by: Marek Vasut <marex@denx.de>

Signed-off-by: Minas Harutyunyan <hminas@synopsys.com>
---
Changes in V2:
- added module configuration check

Changed in V3:
- added tag "Reported-by: kbuild test robot <lkp@intel.com>

Changes in V4:
- remove Cc: stable. Require backport for stable versions

drivers/usb/dwc2/gadget.c   |  6 ------
 drivers/usb/dwc2/platform.c | 11 +++++++++++
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 12b98b466287..7faf5f8c056d 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -4920,12 +4920,6 @@ int dwc2_gadget_init(struct dwc2_hsotg *hsotg)
 					  epnum, 0);
 	}
 
-	ret = usb_add_gadget_udc(dev, &hsotg->gadget);
-	if (ret) {
-		dwc2_hsotg_ep_free_request(&hsotg->eps_out[0]->ep,
-					   hsotg->ctrl_req);
-		return ret;
-	}
 	dwc2_hsotg_dump(hsotg);
 
 	return 0;
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index e571c8ae65ec..c347d93eae64 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -575,6 +575,17 @@ static int dwc2_driver_probe(struct platform_device *dev)
 	if (hsotg->dr_mode == USB_DR_MODE_PERIPHERAL)
 		dwc2_lowlevel_hw_disable(hsotg);
 
+#if IS_ENABLED(CONFIG_USB_DWC2_PERIPHERAL) || \
+	IS_ENABLED(CONFIG_USB_DWC2_DUAL_ROLE)
+	/* Postponed adding a new gadget to the udc class driver list */
+	if (hsotg->gadget_enabled) {
+		retval = usb_add_gadget_udc(hsotg->dev, &hsotg->gadget);
+		if (retval) {
+			dwc2_hsotg_remove(hsotg);
+			goto error_init;
+		}
+	}
+#endif /* CONFIG_USB_DWC2_PERIPHERAL || CONFIG_USB_DWC2_DUAL_ROLE */
 	return 0;
 
 error_init:
-- 
2.11.0

