Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9202035A9AD
	for <lists+linux-usb@lfdr.de>; Sat, 10 Apr 2021 02:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235319AbhDJArX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 20:47:23 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:39328 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235312AbhDJArW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Apr 2021 20:47:22 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 02EA3401F1;
        Sat, 10 Apr 2021 00:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1618015629; bh=boOwoNo4+Zfzi026H2CCOo49+BR7HecMuFsdKCIS/WI=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=b1gr4tGTZjvX6QsbhcAjZUZ6hGowogUl593zw5fSk5Y1JLmd3eDfyN9RJGKsMwv6D
         CEPbMu1zAjW3klBER8GGoaioRI83R/Fi+0aKxDLXLQ7n2QrFE5OH7JIgtpcgq0VLhX
         A7GXdyvh8cr4HT2WK3JxYn5i4letqMLBreG/BuR451NExkginAOCHIkT7PcfiMPRwn
         k1IZdkZgVFhySbpg7k8luCHd8Lm3NSH4VSW086Y3Kau+DTNjEpoXbNWXC4abtpY7+i
         bWHV6pfVARPRlsJYv/cSu/f3EUhG9w3DxZmRTjE+HKqqkHIcViPyL3UQpkEPJ/9kp5
         oD3SvxsX2ZL9Q==
Received: from lab-vbox (unknown [10.205.130.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id CD5C9A0096;
        Sat, 10 Apr 2021 00:47:07 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Fri, 09 Apr 2021 17:47:07 -0700
Date:   Fri, 09 Apr 2021 17:47:07 -0700
Message-Id: <ed5ddb78abd157ef2bb9317545b9fec63c6a5b66.1618014279.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1618014279.git.Thinh.Nguyen@synopsys.com>
References: <cover.1618014279.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 4/7] usb: xhci: Workaround undercalculated BW for fullspeed BI
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
Changes in v2:
- None

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
index 65bb62d3d31d..5bedf5a25f7a 100644
--- a/include/linux/usb/xhci-quirks.h
+++ b/include/linux/usb/xhci-quirks.h
@@ -59,5 +59,6 @@
 #define XHCI_SG_TRB_CACHE_SIZE_QUIRK	BIT_ULL(39)
 #define XHCI_NO_SOFT_RETRY		BIT_ULL(40)
 #define XHCI_ISOC_BLOCKED_DISCONNECT	BIT_ULL(41)
+#define XHCI_LIMIT_FS_BI_INTR_EP	BIT_ULL(42)
 
 #endif /* __LINUX_USB_XHCI_QUIRKS_H */
-- 
2.28.0

