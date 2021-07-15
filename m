Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C88833C9F30
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jul 2021 15:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237441AbhGONQu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Jul 2021 09:16:50 -0400
Received: from mga07.intel.com ([134.134.136.100]:18215 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232518AbhGONQt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Jul 2021 09:16:49 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="274370847"
X-IronPort-AV: E=Sophos;i="5.84,242,1620716400"; 
   d="scan'208";a="274370847"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 06:13:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,242,1620716400"; 
   d="scan'208";a="655738906"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga005.fm.intel.com with ESMTP; 15 Jul 2021 06:13:54 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>, <stern@rowland.harvard.edu>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 2/2] usb: hub: Disable USB 3 device initiated lpm if exit latency is too high
Date:   Thu, 15 Jul 2021 16:15:44 +0300
Message-Id: <20210715131544.1984726-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210715131544.1984726-1-mathias.nyman@linux.intel.com>
References: <20210715131544.1984726-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The device initiated link power management U1/U2 states should not be
enabled in case the system exit latency plus one bus interval (125us) is
greater than the shortest service interval of any periodic endpoint.

This is the case for both U1 and U2 sytstem exit latencies and link states.

See USB 3.2 section 9.4.9 "Set Feature" for more details

If host initiated lpm is enabled but device initiated is not due to exit
latency limitations then still set the udev->usb3_lpm_ux_enabled flag so
that sysfs users can see the link may go to U1/U2.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/core/hub.c | 68 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 56 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index a35d0bedafa3..63e150982da9 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -4116,6 +4116,47 @@ static int usb_set_lpm_timeout(struct usb_device *udev,
 	return 0;
 }
 
+/*
+ * Don't allow device intiated U1/U2 if the system exit latency + one bus
+ * interval is greater than the minimum service interval of any active
+ * periodic endpoint. See USB 3.2 section 9.4.9
+ */
+static bool usb_device_may_initiate_lpm(struct usb_device *udev,
+					enum usb3_link_state state)
+{
+	unsigned long long sel;		/* us */
+	int i, j;
+
+	if (state == USB3_LPM_U1)
+		sel = DIV_ROUND_UP(udev->u1_params.sel, 1000);
+	else if (state == USB3_LPM_U2)
+		sel = DIV_ROUND_UP(udev->u2_params.sel, 1000);
+	else
+		return false;
+
+	for (i = 0; i < udev->actconfig->desc.bNumInterfaces; i++) {
+		struct usb_interface *intf;
+		struct usb_endpoint_descriptor *desc;
+		unsigned int interval;
+
+		intf = udev->actconfig->interface[i];
+		if (!intf)
+			continue;
+
+		for (j = 0; j < intf->cur_altsetting->desc.bNumEndpoints; j++) {
+			desc = &intf->cur_altsetting->endpoint[j].desc;
+
+			if (usb_endpoint_xfer_int(desc) ||
+			    usb_endpoint_xfer_isoc(desc)) {
+				interval = (1 << (desc->bInterval - 1)) * 125;
+				if (sel + 125 > interval)
+					return false;
+			}
+		}
+	}
+	return true;
+}
+
 /*
  * Enable the hub-initiated U1/U2 idle timeouts, and enable device-initiated
  * U1/U2 entry.
@@ -4188,20 +4229,23 @@ static void usb_enable_link_state(struct usb_hcd *hcd, struct usb_device *udev,
 	 * U1/U2_ENABLE
 	 */
 	if (udev->actconfig &&
-	    usb_set_device_initiated_lpm(udev, state, true) == 0) {
-		if (state == USB3_LPM_U1)
-			udev->usb3_lpm_u1_enabled = 1;
-		else if (state == USB3_LPM_U2)
-			udev->usb3_lpm_u2_enabled = 1;
-	} else {
-		/* Don't request U1/U2 entry if the device
-		 * cannot transition to U1/U2.
-		 */
-		usb_set_lpm_timeout(udev, state, 0);
-		hcd->driver->disable_usb3_lpm_timeout(hcd, udev, state);
+	    usb_device_may_initiate_lpm(udev, state)) {
+		if (usb_set_device_initiated_lpm(udev, state, true)) {
+			/*
+			 * Request to enable device initiated U1/U2 failed,
+			 * better to turn off lpm in this case.
+			 */
+			usb_set_lpm_timeout(udev, state, 0);
+			hcd->driver->disable_usb3_lpm_timeout(hcd, udev, state);
+			return;
+		}
 	}
-}
 
+	if (state == USB3_LPM_U1)
+		udev->usb3_lpm_u1_enabled = 1;
+	else if (state == USB3_LPM_U2)
+		udev->usb3_lpm_u2_enabled = 1;
+}
 /*
  * Disable the hub-initiated U1/U2 idle timeouts, and disable device-initiated
  * U1/U2 entry.
-- 
2.25.1

