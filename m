Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5959C359190
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 03:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233206AbhDIBm2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 21:42:28 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:47578 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233153AbhDIBm0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 21:42:26 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 68224C00CA;
        Fri,  9 Apr 2021 01:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1617932534; bh=qN36OdJ3maLkAisTgL3+ppJaMxfizuDDIZsNgcgx0Sc=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=cgt9ZXJH/2fZmfQDHcKjw+gCnQ722iCbAPXbW3lEPRjLUD5bm1pqLtImrwh0zfwxL
         e+tJEH11PQNtGuE2pyZ76W2fNNEFWUHzQEsV2EZbwSY+dfctIq451VF9MlsCSRncap
         Neute1A0WJPp9Ag/8VrVRQ+51qewtXu8hfeAZNRNc1PAL5vKE1eC6aLrvm5GcfSDSn
         sqRzC5oAIboe1OtZTnxRHvk8A/mvyaLklTep7UFY2UP30+cxEke3UQAhpLj8rIM82k
         9ByuqJYAygLRFZ9megRue6OFVNpWtYF0GKqjaNumrWDJ3yCP3dpLcflNwDfP95jt34
         g9Zm8Qt9+xYcA==
Received: from lab-vbox (unknown [10.205.144.97])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 1893EA007C;
        Fri,  9 Apr 2021 01:42:13 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Thu, 08 Apr 2021 18:42:12 -0700
Date:   Thu, 08 Apr 2021 18:42:12 -0700
Message-Id: <afc17d834d424e7865860b286b2a201c60c935a8.1617929509.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1617929509.git.Thinh.Nguyen@synopsys.com>
References: <cover.1617929509.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 3/6] usb: xhci: Workaround undercalculated BW for fullspeed BI
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DWC_usb31 host version 1.90a and prior undercalculates the bandwidth
available for interrupt endpoints. The controller will return bandwidth
error on config endpoint commands if there are already 6 or more
fullspeed interrupt endpoints with bInterval of 4 (or 4ms) associated
with a single fullspeed bus instance (BI).

To workaround this, configure and use the endpoint at a shorter
interrupt interval. Lower the ep_ctx interval from 5 to 4 (or 2ms)
for interrupt endpoints of the fullspeed BI. Note: we have not observed
functional impact to the fullspeed devices by lowering the interrupt
service interval (at least for a few devices that we tested).

To simplify the workaround, let's just check and apply the workaround if
the endpoint is a fullspeed interrupt endpoint with interval of 4ms and
if the top parent device is also operating in fullspeed (i.e. associated
with fullspeed BI).

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Note:
Checkpatch will give a warning below for getting top_dev:
	WARNING: suspect code indent for conditional statements

Since this logic is done everywhere else in the driver, I'm keeping it
consistent here.

 drivers/usb/host/xhci-mem.c     | 23 +++++++++++++++++++++++
 include/linux/usb/xhci-quirks.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 1053b43008e4..e01d0ddb012a 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1463,6 +1463,29 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 		}
 	}
 
+	/*
+	 * Check for undercalculated bandwidth quirk for interrupt endpoints
+	 * associated with fullspeed BI.
+	 */
+	if ((xhci->quirks & XHCI_LIMIT_FS_BI_INTR_EP) &&
+	    usb_endpoint_xfer_int(&ep->desc) &&
+	    udev->speed == USB_SPEED_FULL &&
+	    interval == 5) {
+		struct usb_device *top_dev;
+
+		for (top_dev = udev;
+		     top_dev->parent && top_dev->parent->parent;
+		     top_dev = top_dev->parent)
+			/* Found device below root hub */;
+
+		/*
+		 * If the top device is operating at fullspeed, then the
+		 * controller is using fullspeed BI for this device.
+		 */
+		if (top_dev->speed == USB_SPEED_FULL)
+			interval = 4;
+	}
+
 	mult = xhci_get_endpoint_mult(udev, ep);
 	max_packet = usb_endpoint_maxp(&ep->desc);
 	max_burst = xhci_get_endpoint_max_burst(udev, ep);
diff --git a/include/linux/usb/xhci-quirks.h b/include/linux/usb/xhci-quirks.h
index c78638ba4735..3a8566c902be 100644
--- a/include/linux/usb/xhci-quirks.h
+++ b/include/linux/usb/xhci-quirks.h
@@ -59,6 +59,7 @@
 #define XHCI_SG_TRB_CACHE_SIZE_QUIRK	BIT_ULL(39)
 #define XHCI_NO_SOFT_RETRY		BIT_ULL(40)
 #define XHCI_ISOC_BLOCKED_DISCONNECT	BIT_ULL(41)
+#define XHCI_LIMIT_FS_BI_INTR_EP	BIT_ULL(42)
 
 struct usb_hcd;
 
-- 
2.28.0

