Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 199D228CE93
	for <lists+linux-usb@lfdr.de>; Tue, 13 Oct 2020 14:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbgJMMoX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Oct 2020 08:44:23 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:49622 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726492AbgJMMoX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Oct 2020 08:44:23 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D021E4083B;
        Tue, 13 Oct 2020 12:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1602593063; bh=zs9+cfaZee8kANbbEIgzPeWpko0vsbx8JTYJUWCZARA=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=P4VRgRsC0FmTm+dHrJSRqY+2rkOOIZk4Pc5nJTomTvzqcSQc78+6uZaEKPfR9Jxu3
         qUlT5DxU+9qMOpsetYGu918sLn3BCgtPhVjArbKeQOboXm3nwu6mUCN2I0m7C8Ea4y
         pRwRAvCdqkeD77y0gzoEkauLNNVQNERWz2yJMGLbbS7A1pNZVbfebvTJNENU0gQjwB
         biJ45W0b4EuLjMxXx6DcGH4dP2Onz1ofStZpMRyaQeqZy2pjitWapCk8dkAnKxvKp5
         9AT0Z8Sp8J+VnVfLBuDpnt/6dP5TWbX4oLln4QV41FWEQaTfzzQJ8dywi9quXPsPiH
         u6vs5bma0h1/Q==
Received: from tejas-VirtualBox (joglekar-e7480.internal.synopsys.com [10.146.18.14])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 8571FA005E;
        Tue, 13 Oct 2020 12:44:19 +0000 (UTC)
Received: by tejas-VirtualBox (sSMTP sendmail emulation); Tue, 13 Oct 2020 18:14:17 +0530
Date:   Tue, 13 Oct 2020 18:14:17 +0530
Message-Id: <b3dbe5d9de39fb5105b8474e9c560917a78e2c63.1602592488.git.joglekar@synopsys.com>
In-Reply-To: <cover.1602592488.git.joglekar@synopsys.com>
References: <cover.1602592488.git.joglekar@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Subject: [PATCH v4 3/3] usb: dwc3: Pass quirk as platform data
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This commit adds the platform device data to setup
the XHCI_SG_TRB_CACHE_SIZE_QUIRK quirk. DWC3 hosts
which are PCI devices does not use OF to create platform device
but create xhci-plat platform device runtime. So
this patch allow parent device to supply the quirk
through platform data.

Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
---
 drivers/usb/dwc3/host.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index e195176580de..dd7c742333f7 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -11,6 +11,15 @@
 #include <linux/platform_device.h>
 
 #include "core.h"
+#include "../host/xhci-plat.h"
+
+static const struct xhci_plat_priv dwc3_pdata = {
+	.plat_start = NULL,
+	.init_quirk = NULL,
+	.suspend_quirk = NULL,
+	.resume_quirk = NULL,
+	.quirks = XHCI_SG_TRB_CACHE_SIZE_QUIRK,
+};
 
 static int dwc3_host_get_irq(struct dwc3 *dwc)
 {
@@ -87,6 +96,11 @@ int dwc3_host_init(struct dwc3 *dwc)
 		goto err;
 	}
 
+	ret = platform_device_add_data(xhci, &dwc3_pdata, sizeof(dwc3_pdata));
+	if (ret) {
+		dev_err(dwc->dev, "couldn't add platform data to xHCI device\n");
+		goto err;
+	}
 	memset(props, 0, sizeof(struct property_entry) * ARRAY_SIZE(props));
 
 	if (dwc->usb3_lpm_capable)
-- 
2.28.0

