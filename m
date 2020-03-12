Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 317A1183375
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2020 15:43:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbgCLOnH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Mar 2020 10:43:07 -0400
Received: from mga09.intel.com ([134.134.136.24]:50332 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727770AbgCLOnH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Mar 2020 10:43:07 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Mar 2020 07:43:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; 
   d="scan'208";a="443955862"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga006.fm.intel.com with ESMTP; 12 Mar 2020 07:43:05 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 6/9] xhci: Ensure link state is U3 after setting USB_SS_PORT_LS_U3
Date:   Thu, 12 Mar 2020 16:45:14 +0200
Message-Id: <20200312144517.1593-7-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200312144517.1593-1-mathias.nyman@linux.intel.com>
References: <20200312144517.1593-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Kai-Heng Feng <kai.heng.feng@canonical.com>

The xHCI spec doesn't specify the upper bound of U3 transition time. For
some devices 20ms is not enough, so we need to make sure the link state
is in U3 before further actions.

I've tried to use U3 Entry Capability by setting U3 Entry Enable in
config register, however the port change event for U3 transition
interrupts the system suspend process.

For now let's use the less ideal method by polling PLS.

[use usleep_range(), and shorten the delay time while polling -Mathias]
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index af92b2576fe9..712cd44f05ac 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1322,7 +1322,16 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			xhci_set_link_state(xhci, ports[wIndex], link_state);
 
 			spin_unlock_irqrestore(&xhci->lock, flags);
-			msleep(20); /* wait device to enter */
+			if (link_state == USB_SS_PORT_LS_U3) {
+				int retries = 16;
+
+				while (retries--) {
+					usleep_range(4000, 8000);
+					temp = readl(ports[wIndex]->addr);
+					if ((temp & PORT_PLS_MASK) == XDEV_U3)
+						break;
+				}
+			}
 			spin_lock_irqsave(&xhci->lock, flags);
 
 			temp = readl(ports[wIndex]->addr);
-- 
2.17.1

