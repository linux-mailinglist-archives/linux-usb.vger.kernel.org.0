Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6C2935A9B0
	for <lists+linux-usb@lfdr.de>; Sat, 10 Apr 2021 02:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235324AbhDJAro (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 20:47:44 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:39350 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235302AbhDJArl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Apr 2021 20:47:41 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 23F7E401F1;
        Sat, 10 Apr 2021 00:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1618015648; bh=D4xc62yjlF5gA22+eduGTT9Gb/N0nG6e5KR72LP9XwI=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=lZ5go6vACw7JDUhg3dJg3SEtIfnWtR1sWA9mDrQks+fB42FIg5DeGE8Bt7uSldb7P
         0i9eIcOyo2/FQ8HGhSV5Ji9WVgkj5mkni0nI76KVucKt+V5WZS8c0izOal9i3B5DTN
         ANFq/w680/CmW+wQtyyQOhP/aJb5d7oPVllbdAQHC1hWpvYy0Zw2n01yz/Dj4084QL
         Wbdc2hLz+I/FXXlK0p5c1fWFaBKaUByVyFFpJZtjGRVwk6KMBae5gIb9uPd/+XQbRd
         rYinfmiQAT/vpP+AwITtNmOmZS6qXpPCSmdoaRw0ux+xE5+jXPgyGsEMESWLDc6SQ9
         8ZsYaU3SJvwJQ==
Received: from lab-vbox (unknown [10.205.130.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id F36ABA0096;
        Sat, 10 Apr 2021 00:47:26 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Fri, 09 Apr 2021 17:47:26 -0700
Date:   Fri, 09 Apr 2021 17:47:26 -0700
Message-Id: <0fb179b977cd187f003ae18adf01bccf09d74092.1618014279.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1618014279.git.Thinh.Nguyen@synopsys.com>
References: <cover.1618014279.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 7/7] usb: dwc3: host: Set quirks base on version
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We can check for host quirks at runtime base on the controller IP and
version check. Set the following quirks for the DWC_usb31 IP host mode
before creating a platform device for the xHCI driver:

 * XHCI_ISOC_BLOCKED_DISCONNECT
 * XHCI_LIMIT_FS_BI_INTR_EP
 * XHCI_LOST_DISCONNECT_QUIRK

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 Changes in v2:
 - None

 drivers/usb/dwc3/host.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index f29a264635aa..8abb9be32cbb 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -9,6 +9,8 @@
 
 #include <linux/acpi.h>
 #include <linux/platform_device.h>
+#include <linux/usb/xhci-quirks.h>
+#include <linux/usb/xhci-plat.h>
 
 #include "core.h"
 
@@ -42,6 +44,17 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
 	return irq;
 }
 
+static void dwc3_host_init_quirks(struct dwc3 *dwc, struct xhci_plat_priv *priv)
+{
+	memset(priv, 0, sizeof(*priv));
+
+	if (DWC3_VER_IS_WITHIN(DWC31, ANY, 190A)) {
+		priv->quirks |= XHCI_ISOC_BLOCKED_DISCONNECT;
+		priv->quirks |= XHCI_LIMIT_FS_BI_INTR_EP;
+		priv->quirks |= XHCI_LOST_DISCONNECT_QUIRK;
+	}
+}
+
 int dwc3_host_init(struct dwc3 *dwc)
 {
 	struct property_entry	props[4];
@@ -49,6 +62,7 @@ int dwc3_host_init(struct dwc3 *dwc)
 	int			ret, irq;
 	struct resource		*res;
 	struct platform_device	*dwc3_pdev = to_platform_device(dwc->dev);
+	struct xhci_plat_priv	dwc3_priv;
 	int			prop_idx = 0;
 
 	irq = dwc3_host_get_irq(dwc);
@@ -87,6 +101,14 @@ int dwc3_host_init(struct dwc3 *dwc)
 		goto err;
 	}
 
+	dwc3_host_init_quirks(dwc, &dwc3_priv);
+
+	ret = platform_device_add_data(xhci, &dwc3_priv, sizeof(dwc3_priv));
+	if (ret) {
+		dev_err(dwc->dev, "couldn't add platform data to xHCI device\n");
+		goto err;
+	}
+
 	memset(props, 0, sizeof(struct property_entry) * ARRAY_SIZE(props));
 
 	if (dwc->usb3_lpm_capable)
-- 
2.28.0

