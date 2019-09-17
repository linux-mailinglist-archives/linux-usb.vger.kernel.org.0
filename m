Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB1EB50C2
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2019 16:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728704AbfIQOwE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Sep 2019 10:52:04 -0400
Received: from mga11.intel.com ([192.55.52.93]:28905 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727708AbfIQOwD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 17 Sep 2019 10:52:03 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Sep 2019 07:52:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,516,1559545200"; 
   d="scan'208";a="211518274"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga004.fm.intel.com with ESMTP; 17 Sep 2019 07:52:01 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     jan@centricular.com
Cc:     p.zabel@pengutronix.de, linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFT PATCH] xhci: Prevent device initiated U1/U2 link pm if exit latency is too long
Date:   Tue, 17 Sep 2019 17:53:49 +0300
Message-Id: <1568732029-11186-1-git-send-email-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <7e3aca8f-3918-08be-f1fd-cb3299c2af16@centricular.com>
References: <7e3aca8f-3918-08be-f1fd-cb3299c2af16@centricular.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If host/hub initiated link pm is prevented by a driver flag we still must
ensure that periodic endpoints have longer service intervals than link pm
exit latency before allowing device initiated link pm.

Fix this by continue walking and checking endpoint service interval if
xhci_get_timeout_no_hub_lpm() returns anything else than USB3_LPM_DISABLED

While at it fix the split line error message

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 447c29bbad48..8892dfbb2af7 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4809,10 +4809,12 @@ static u16 xhci_calculate_lpm_timeout(struct usb_hcd *hcd,
 		if (intf->dev.driver) {
 			driver = to_usb_driver(intf->dev.driver);
 			if (driver && driver->disable_hub_initiated_lpm) {
-				dev_dbg(&udev->dev, "Hub-initiated %s disabled "
-						"at request of driver %s\n",
-						state_name, driver->name);
-				return xhci_get_timeout_no_hub_lpm(udev, state);
+				dev_dbg(&udev->dev, "Hub-initiated %s disabled at request of driver %s\n",
+					state_name, driver->name);
+				timeout = xhci_get_timeout_no_hub_lpm(udev,
+								      state);
+				if (timeout == USB3_LPM_DISABLED)
+					return timeout;
 			}
 		}
 
-- 
2.7.4

