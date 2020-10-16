Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40B772905B3
	for <lists+linux-usb@lfdr.de>; Fri, 16 Oct 2020 15:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408035AbgJPNFu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Oct 2020 09:05:50 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:57368 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2408033AbgJPNFu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Oct 2020 09:05:50 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C8B3B40695;
        Fri, 16 Oct 2020 13:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1602853550; bh=jy/hTMdS2l33xUmBAXbX1JccNnVQ9AiMjULVgOFzCRA=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=PBIJpTBrc2879HE16I3P6FHpgDNs6XRxkfUPLjHCQgk1COgX6msBkObMPpxxejYuF
         eCM9b4r9nVLv+NoNstu/bCNsS/bVvBkniTuICGahCdJnvr2xHRb6CWoDArHKkC7pgG
         BRewk/WYAum8Vf8p4iXoMcddXw0JY/Zghyi0/rlKSiErKz6vVI10EooW8UT2fE/dHF
         vPhfZYT6nnxXSwbKWeuffMFLIe0UuJJM2ZwosZuryn1KvKBSP3p16KGON6+UXTUDcl
         mC+d72tUzDc4HDp09WMyJUm/+Idrj+D+SAw6jEdF4LXdJDbM6GmayVP6KGDR1TZsJd
         bKlwDe20X7EOg==
Received: from tejas-VirtualBox (joglekar-e7480.internal.synopsys.com [10.146.27.183])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 31F34A005C;
        Fri, 16 Oct 2020 13:05:46 +0000 (UTC)
Received: by tejas-VirtualBox (sSMTP sendmail emulation); Fri, 16 Oct 2020 18:35:43 +0530
Date:   Fri, 16 Oct 2020 18:35:43 +0530
Message-Id: <ea34abd77a34e9587fb49868050e152094cf1403.1602853270.git.joglekar@synopsys.com>
In-Reply-To: <cover.1602853270.git.joglekar@synopsys.com>
References: <cover.1602853270.git.joglekar@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Subject: [PATCH v5 3/3] usb: dwc3: Pass quirk as platform data
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
but create xhci-plat platform device at runtime. So
this patch allows parent device to supply the quirk
through platform data.

Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
---
 drivers/usb/dwc3/host.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index e195176580de..0434bc8cec12 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -11,6 +11,11 @@
 #include <linux/platform_device.h>
 
 #include "core.h"
+#include "../host/xhci-plat.h"
+
+static const struct xhci_plat_priv dwc3_pdata = {
+	.quirks = XHCI_SG_TRB_CACHE_SIZE_QUIRK,
+};
 
 static int dwc3_host_get_irq(struct dwc3 *dwc)
 {
@@ -87,6 +92,11 @@ int dwc3_host_init(struct dwc3 *dwc)
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

