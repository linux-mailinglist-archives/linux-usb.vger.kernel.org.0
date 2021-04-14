Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4F335EAAA
	for <lists+linux-usb@lfdr.de>; Wed, 14 Apr 2021 04:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242311AbhDNCNk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Apr 2021 22:13:40 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:55318 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239472AbhDNCNk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Apr 2021 22:13:40 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 968F840461;
        Wed, 14 Apr 2021 02:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1618366399; bh=SUjyqObXbrjLgBIAdUyzQrmgYRcTEkLh4y7+TTm8rfY=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=O7i89Vfa3zMhdGaGw3Duutm0GlnESJ2sZiyQioaIr630XS4NHc0XOabW3Q0QH7YRQ
         CL0Rhf9bTx0BHd3vxDVVtW2Xu5dhOaI3/gLGJEub8iuMyejMUod8vdwdALOqAnqHcy
         CUMhnzqTJl4/Ng9pFD6Xn7jXv5fm1eVNWa11uKF3b8pCvQn7YIsusurbPnzdmJzMYq
         bG+3NXl9eChgrhoaaxan3ywznUNjjaP7ak8Wt8EKiZPHYvvtqfdoUYeee8+V4piBE9
         NeZjVsyvqIeKyMYWYq/oN9jxWQTFM611j3MN8MCAXsIWKKO1I/nzU7uHT0r6bWa9kX
         WAL9qjMH/Fihw==
Received: from lab-vbox (unknown [10.205.146.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 6E3DDA0096;
        Wed, 14 Apr 2021 02:13:18 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Tue, 13 Apr 2021 19:13:18 -0700
Date:   Tue, 13 Apr 2021 19:13:18 -0700
Message-Id: <9e68527ff932b1646f92a7593d4092a903754666.1618366071.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1618366071.git.Thinh.Nguyen@synopsys.com>
References: <cover.1618366071.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 2/2] usb: dwc3: gadget: Check for disabled LPM quirk
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the device doesn't support LPM, make sure to disable the LPM
capability and don't advertise to the host that it supports it.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 Changes in v2:
 - Use a different DT property than usb2-lpm-disable (since it's host specific)

 drivers/usb/dwc3/core.c   | 2 ++
 drivers/usb/dwc3/core.h   | 4 +++-
 drivers/usb/dwc3/gadget.c | 9 ++++++++-
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 05e2e54cbbdc..f3316caefbad 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1286,6 +1286,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 				"snps,usb3_lpm_capable");
 	dwc->usb2_lpm_disable = device_property_read_bool(dev,
 				"snps,usb2-lpm-disable");
+	dwc->usb2_gadget_lpm_disable = device_property_read_bool(dev,
+				"snps,usb2-gadget-lpm-disable");
 	device_property_read_u8(dev, "snps,rx-thr-num-pkt-prd",
 				&rx_thr_num_pkt_prd);
 	device_property_read_u8(dev, "snps,rx-max-burst-prd",
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 6e9abfbccaa6..83086e71122d 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1035,7 +1035,8 @@ struct dwc3_scratchpad_array {
  * @dis_start_transfer_quirk: set if start_transfer failure SW workaround is
  *			not needed for DWC_usb31 version 1.70a-ea06 and below
  * @usb3_lpm_capable: set if hadrware supports Link Power Management
- * @usb2_lpm_disable: set to disable usb2 lpm
+ * @usb2_lpm_disable: set to disable usb2 lpm for host
+ * @usb2_gadget_lpm_disable: set to disable usb2 lpm for gadget
  * @disable_scramble_quirk: set if we enable the disable scramble quirk
  * @u2exit_lfps_quirk: set if we enable u2exit lfps quirk
  * @u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk
@@ -1241,6 +1242,7 @@ struct dwc3 {
 	unsigned		dis_start_transfer_quirk:1;
 	unsigned		usb3_lpm_capable:1;
 	unsigned		usb2_lpm_disable:1;
+	unsigned		usb2_gadget_lpm_disable:1;
 
 	unsigned		disable_scramble_quirk:1;
 	unsigned		u2exit_lfps_quirk:1;
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index e1b04c976da5..767661b740ab 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3484,6 +3484,7 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 	/* Enable USB2 LPM Capability */
 
 	if (!DWC3_VER_IS_WITHIN(DWC3, ANY, 194A) &&
+	    !dwc->usb2_gadget_lpm_disable &&
 	    (speed != DWC3_DSTS_SUPERSPEED) &&
 	    (speed != DWC3_DSTS_SUPERSPEED_PLUS)) {
 		reg = dwc3_readl(dwc->regs, DWC3_DCFG);
@@ -3510,6 +3511,12 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 
 		dwc3_gadget_dctl_write_safe(dwc, reg);
 	} else {
+		if (dwc->usb2_gadget_lpm_disable) {
+			reg = dwc3_readl(dwc->regs, DWC3_DCFG);
+			reg &= ~DWC3_DCFG_LPM_CAP;
+			dwc3_writel(dwc->regs, DWC3_DCFG, reg);
+		}
+
 		reg = dwc3_readl(dwc->regs, DWC3_DCTL);
 		reg &= ~DWC3_DCTL_HIRD_THRES_MASK;
 		dwc3_gadget_dctl_write_safe(dwc, reg);
@@ -3958,7 +3965,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 	dwc->gadget->ssp_rate		= USB_SSP_GEN_UNKNOWN;
 	dwc->gadget->sg_supported	= true;
 	dwc->gadget->name		= "dwc3-gadget";
-	dwc->gadget->lpm_capable	= true;
+	dwc->gadget->lpm_capable	= !dwc->usb2_gadget_lpm_disable;
 
 	/*
 	 * FIXME We might be setting max_speed to <SUPER, however versions
-- 
2.28.0

