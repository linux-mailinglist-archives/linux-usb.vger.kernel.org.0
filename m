Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A12E1492412
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jan 2022 11:46:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238018AbiARKqd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jan 2022 05:46:33 -0500
Received: from comms.puri.sm ([159.203.221.185]:34284 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235240AbiARKqc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Jan 2022 05:46:32 -0500
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 4E22ADF979;
        Tue, 18 Jan 2022 02:46:32 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id f7MZ0gyTnMCp; Tue, 18 Jan 2022 02:46:31 -0800 (PST)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     mathias.nyman@intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, sarah.a.sharp@linux.intel.com,
        stern@rowland.harvard.edu, andiry.xu@amd.com
Cc:     Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH] usb: xhci: how to recover from stop endpoint timeout?
Date:   Tue, 18 Jan 2022 11:46:05 +0100
Message-Id: <20220118104605.1861175-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I haven't done anything in the usb host controller drivers yet, so here's
my question: I sometimes see
"xHCI host not responding to stop endpoint command." which is obviously
followed by "xhci died" and nothing works anymore.

I see it after "Port resume timed out, port 1-1: 0xfe3" so resuming somehow
fails.

How would I distinguish between ETIMEDOUT and other paths
when we're in xhci_stop_endpoint_command_watchdog() before calling
xhci_hc_died()?

How would a "host controller reset" look like, when I'd want to test?
Something similar to suspend and resume, or something even simpler?

I'd be very happy about some hints from usb developers as a first
step here.

thank you all a lot!

                                  martin
---
 drivers/usb/host/xhci-ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index a0623b2b4dd6..d5c0e119e1da 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1293,7 +1293,7 @@ void xhci_stop_endpoint_command_watchdog(struct timer_list *t)
 
 	/*
 	 * handle a stop endpoint cmd timeout as if host died (-ENODEV).
-	 * In the future we could distinguish between -ENODEV and -ETIMEDOUT
+	 * TODO In the future we could distinguish between -ENODEV and -ETIMEDOUT
 	 * and try to recover a -ETIMEDOUT with a host controller reset
 	 */
 	xhci_hc_died(xhci);
-- 
2.30.2

