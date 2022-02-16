Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5DD4B84E9
	for <lists+linux-usb@lfdr.de>; Wed, 16 Feb 2022 10:53:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232517AbiBPJvV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Feb 2022 04:51:21 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:48466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232520AbiBPJvU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 04:51:20 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E81652B4074
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 01:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645005059; x=1676541059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L9IoCPdVPu8QzPwB9ZH3k81wJN+NTTltzRqmgvJF9Y4=;
  b=n0wS/GRzAev7/3xqU6z3oWCzwzaFzjChuNShXDkH1XdZZ0Qf7Wm1iDIn
   kkwyWp1KxoezNeR3O13HB1+zthi+hnnE6TO+/I05m5iy7GGDgqADI0bAG
   dbqvDnZRumER40dGMYupQA1KWT3BBYqs0uZQ4oWe317QQ4qCSh/JpsKES
   aJCP9CnoZldSDGX4YzGX55GPnB0vyai/9qZ1McJQjXrKafzOhcE7Gsvr2
   9pzTRSWEjQWEgCWAvDqqBzxQsCG2pbNnNv4tFiPWg+TJdyyyIpw1GZgfd
   /RXuZ+G83Pw5x8IE6zP3jnsn63dwztX95ZILDdAR0GQo8rR7eZybWebhf
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="249396972"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="249396972"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 01:50:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="636410379"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga004.jf.intel.com with ESMTP; 16 Feb 2022 01:50:32 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 8/9] usb: host: xhci: drop redundant checks
Date:   Wed, 16 Feb 2022 11:51:52 +0200
Message-Id: <20220216095153.1303105-9-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220216095153.1303105-1-mathias.nyman@linux.intel.com>
References: <20220216095153.1303105-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sergey Shtylyov <s.shtylyov@omp.ru>

In xhci_endpoint_{disable|reset}() the expression '&vdev->eps[ep_index]'
just cannot be NULL, so the checks have no sense at all...

Found by Linux Verification Center (linuxtesting.org) with the SVACE static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 2a58677d9b7a..33bae434aa94 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3150,8 +3150,6 @@ static void xhci_endpoint_disable(struct usb_hcd *hcd,
 
 	ep_index = xhci_get_endpoint_index(&host_ep->desc);
 	ep = &vdev->eps[ep_index];
-	if (!ep)
-		goto done;
 
 	/* wait for hub_tt_work to finish clearing hub TT */
 	if (ep->ep_state & EP_CLEARING_TT) {
@@ -3209,8 +3207,6 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
 		return;
 	ep_index = xhci_get_endpoint_index(&host_ep->desc);
 	ep = &vdev->eps[ep_index];
-	if (!ep)
-		return;
 
 	/* Bail out if toggle is already being cleared by a endpoint reset */
 	spin_lock_irqsave(&xhci->lock, flags);
-- 
2.25.1

