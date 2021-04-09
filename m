Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF102359193
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 03:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233158AbhDIBmr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 21:42:47 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:47602 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232426AbhDIBmq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 21:42:46 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 21C6AC00CA;
        Fri,  9 Apr 2021 01:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1617932554; bh=DIMCHZSRXXjfYtacNGDpPEqi4k9O2sDIegxiRCrb64I=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=jCWuVXOWuFYuqxdeVkmb6XgzPM+32qbhBwmOe/+CDcPKqn50c/9X72hD+A0HVNx79
         QWHBxUc6QvwwLY/tW1BEEVtaX8UHPE8zSQLZKJAjk8MRUIU3MS6RJykFrbu5ikHKp7
         lR+/bitT9XxScBWDMh6iVcdUOTbV/v6AYChANUdStDGpGVXnYGccckCx06ibIUK2kk
         QmyTQj2gUIJtyLV/S+rb1YNLh7cQK4FSPrKTZJH+LjvuvHrfvk1gdujCN3l7OT9qUp
         aBNl1D10e8JiLfccEwx9o64FwxHXK6qzeISHvq3kl9TRxplxYRERif+c1B+6mY1rKK
         pXBOhqDwOB5SA==
Received: from lab-vbox (unknown [10.205.144.97])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id D340CA006A;
        Fri,  9 Apr 2021 01:42:32 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Thu, 08 Apr 2021 18:42:32 -0700
Date:   Thu, 08 Apr 2021 18:42:32 -0700
Message-Id: <a792b1ea6b7083d400b3a6b38dcca70588fc5587.1617929509.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1617929509.git.Thinh.Nguyen@synopsys.com>
References: <cover.1617929509.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 6/6] usb: dwc3: host: Set quirks base on version
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
 drivers/usb/dwc3/host.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index f29a264635aa..a486d7fbb163 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -9,6 +9,7 @@
 
 #include <linux/acpi.h>
 #include <linux/platform_device.h>
+#include <linux/usb/xhci-quirks.h>
 
 #include "core.h"
 
@@ -42,6 +43,17 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
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
@@ -49,6 +61,7 @@ int dwc3_host_init(struct dwc3 *dwc)
 	int			ret, irq;
 	struct resource		*res;
 	struct platform_device	*dwc3_pdev = to_platform_device(dwc->dev);
+	struct xhci_plat_priv	dwc3_priv;
 	int			prop_idx = 0;
 
 	irq = dwc3_host_get_irq(dwc);
@@ -87,6 +100,14 @@ int dwc3_host_init(struct dwc3 *dwc)
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

