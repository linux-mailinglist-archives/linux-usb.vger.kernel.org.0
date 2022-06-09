Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4451544B2B
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jun 2022 14:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237581AbiFIMCw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jun 2022 08:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236504AbiFIMCu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jun 2022 08:02:50 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4579D6D39A
        for <linux-usb@vger.kernel.org>; Thu,  9 Jun 2022 05:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654776168; x=1686312168;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cTic0mTIKuxHFwLGK2iox4ar6809DO3DQ2zz48eDte4=;
  b=JqffStp3bbvh07YYfl/xX3VpUr7kRkfuyLDuSWgazOWVmXbo272cxTUR
   xZwF584z95SIKLLlrCcFb8t6Ae6T6oGVgk2TGwIQ9yNQ90BbPCIjckUbL
   0D8nGF4IklxrhzazDnNGWct16XbduMQA/DNM9nUgomGY2dVdhecrjFiJM
   +Q1MHB3nJ7R8KfRxuyJdoT2SSZJJN0kTmzTgDn6bq8NiN2RC7aJABmWH4
   5FDoSilX+35San1upQsigCW8ljNJC6t+o+MOzH7gyxU3VuoBpXbg8FBf1
   P7DSszjlvUpFuokRL5YuSJx8yC1xvDljTqSVK/Ouu1hU5OXZ4njOXacMy
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="278406683"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="278406683"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 05:02:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="637484776"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga008.fm.intel.com with ESMTP; 09 Jun 2022 05:02:36 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     mka@chromium.org, hkallweit1@gmail.com
Cc:     <gregkh@linuxfoundation.org>, <stern@rowland.harvard.edu>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        <linux-usb@vger.kernel.org>, quic_jackp@quicinc.com,
        tunguyen@apm.com, linux-amlogic@lists.infradead.org
Subject: [RFT PATCH] xhci: Fix null pointer dereference in resume if xhci has only one roothub
Date:   Thu,  9 Jun 2022 15:03:36 +0300
Message-Id: <20220609120336.831533-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <c4e9f0d8-c736-1153-3f32-b85e7024b3fe@linux.intel.com>
References: <c4e9f0d8-c736-1153-3f32-b85e7024b3fe@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
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

