Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A81122C10D9
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 17:39:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730653AbgKWQjF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 11:39:05 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:34298 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729294AbgKWQjF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Nov 2020 11:39:05 -0500
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BE2E3C095F;
        Mon, 23 Nov 2020 16:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1606149544; bh=jy/hTMdS2l33xUmBAXbX1JccNnVQ9AiMjULVgOFzCRA=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=MGurgf/EF+y1inqGiEQ7qL/avEvYW4HmwX/vq7EfXkXxDFdKkiA4EP6xoeryBfklI
         //ZUckLxVYy62/Thdlpc5Tq+KeV1tyAukh8SfUAqcWHWJp5lr02hbXGZn+HUfQcFbi
         ayOfgcBBaAL/0AjaGBl4rXjRImYOne600uAMSKS+CTBfSolPfXdUNvR27cIA2Cil+l
         7GEitmMMjgDGKKyH6Eg2XsItfnVUblznvfdbN+BABmCUw4YBhXWIWBHlpazarxM497
         hE9/ftk4Dlj/aO5cWXzfwPRoktj5I+6GFCFCo2FdGKE/YvJPxDC1a0v+VxcIBlLnOL
         CsKRTsXkpIqdQ==
Received: from tejas-VirtualBox (joglekar-e7480.internal.synopsys.com [10.146.24.135])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id A33ADA005D;
        Mon, 23 Nov 2020 16:39:01 +0000 (UTC)
Received: by tejas-VirtualBox (sSMTP sendmail emulation); Mon, 23 Nov 2020 22:08:59 +0530
Date:   Mon, 23 Nov 2020 22:08:59 +0530
Message-Id: <0b96cb765bb154cf0e83a436e7fed8882f566cf9.1606149078.git.joglekar@synopsys.com>
In-Reply-To: <cover.1606149078.git.joglekar@synopsys.com>
References: <cover.1606149078.git.joglekar@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Subject: [PATCH v6 3/3] usb: dwc3: Pass quirk as platform data
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

