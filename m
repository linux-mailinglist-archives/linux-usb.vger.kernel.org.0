Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EACC2546613
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jun 2022 13:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345490AbiFJLw1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jun 2022 07:52:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346377AbiFJLwZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Jun 2022 07:52:25 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79FAC1DBD40
        for <linux-usb@vger.kernel.org>; Fri, 10 Jun 2022 04:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654861944; x=1686397944;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7fYbz1aqRj88PaQoHhEgPCS6d5E0kNXzMJd//Vnz4og=;
  b=VOyJ/mFM8boernG8y/yxu1kZcnEry5IJ8/zxH0W/dT01oynnh8PrKnXN
   e9nueHqzhiwy/+XKMK+pcVo4uveyjGAP/4GqCuz2cb5b0+jXdMd9uUd4s
   jpBEQ53JA2ERHTv232yyQwQw4QOZK6rPflXmuBr1QVPZGcGtcdZ9tzhct
   Pv7viIbzZ41TqkeldKQSRa1GC55WFq5TUq7l4TAcRIVQlzcoMkmDQWKAQ
   /cSGFCu70gLQCGxsHKcBAwkXzxL3T/5npj1MG8riSFWUbUcrCrQ2uj26W
   XYpoILcKXjVrEvyT1MPgibAjLORb4cJnknvgmLxcAP/ykB2a0x9RQRy6P
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="302983862"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="302983862"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 04:52:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="671815277"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Jun 2022 04:52:22 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 1/1] xhci: Fix null pointer dereference in resume if xhci has only one roothub
Date:   Fri, 10 Jun 2022 14:53:38 +0300
Message-Id: <20220610115338.863152-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610115338.863152-1-mathias.nyman@linux.intel.com>
References: <20220610115338.863152-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In the re-init path xhci_resume() passes 'hcd->primary_hcd' to hci_init(),
however this field isn't initialized by __usb_create_hcd() for a HCD
without secondary controller.

xhci_resume() is called once per xHC device, not per hcd, so the extra
checking for primary hcd can be removed.

Fixes: e0fe986972f5 ("usb: host: xhci-plat: prepare operation w/o shared hcd")
Reported-by: Matthias Kaehlcke <mka@chromium.org>
Tested-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index f0ab63138016..9ac56e9ffc64 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1107,7 +1107,6 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 {
 	u32			command, temp = 0;
 	struct usb_hcd		*hcd = xhci_to_hcd(xhci);
-	struct usb_hcd		*secondary_hcd;
 	int			retval = 0;
 	bool			comp_timer_running = false;
 	bool			pending_portevent = false;
@@ -1214,23 +1213,19 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		 * first with the primary HCD, and then with the secondary HCD.
 		 * If we don't do the same, the host will never be started.
 		 */
-		if (!usb_hcd_is_primary_hcd(hcd))
-			secondary_hcd = hcd;
-		else
-			secondary_hcd = xhci->shared_hcd;
-
 		xhci_dbg(xhci, "Initialize the xhci_hcd\n");
-		retval = xhci_init(hcd->primary_hcd);
+		retval = xhci_init(hcd);
 		if (retval)
 			return retval;
 		comp_timer_running = true;
 
 		xhci_dbg(xhci, "Start the primary HCD\n");
-		retval = xhci_run(hcd->primary_hcd);
-		if (!retval && secondary_hcd) {
+		retval = xhci_run(hcd);
+		if (!retval && xhci->shared_hcd) {
 			xhci_dbg(xhci, "Start the secondary HCD\n");
-			retval = xhci_run(secondary_hcd);
+			retval = xhci_run(xhci->shared_hcd);
 		}
+
 		hcd->state = HC_STATE_SUSPENDED;
 		if (xhci->shared_hcd)
 			xhci->shared_hcd->state = HC_STATE_SUSPENDED;
-- 
2.25.1

