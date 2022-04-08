Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 995144F9732
	for <lists+linux-usb@lfdr.de>; Fri,  8 Apr 2022 15:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236479AbiDHNsp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Apr 2022 09:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231500AbiDHNsn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Apr 2022 09:48:43 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C13F60CEF
        for <linux-usb@vger.kernel.org>; Fri,  8 Apr 2022 06:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649425599; x=1680961599;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=136wie3i/bYsT6DVEB+wKLiTRysIqDsROC7NtcicCrc=;
  b=ZZEFiQvV0gocePNRMuYA0oNqUdvqGxEYyX6Q1nB3V0IEfgmVPNzl2ZJf
   EzoeTIB519sK/bHHuDSMmMBDU3Tn4MEqeNu/HS6iZavbYnzBTC9ZOtkAl
   7sZLweijw/hgnCNsAeafnKeyEWmUwTcgtruzern28k0RPWJFNWKzIwzFq
   OBF6Fh3zryVPsm1vTC7Gt4MTW0lPkXZsfyu+X+tfUU5e0OfeS/tjkNIKp
   9vj0PUiIxBpaOQ4OEvgEudj/X8jMX/c3opzMgpdWm+1M7K0qLBUgcEPpx
   GQavxwRyybStIfuGV3htbDXvXg2PevNgM+qeaZ+rHaR3+Zz0YdGes5pP+
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="260432083"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; 
   d="scan'208";a="260432083"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2022 06:46:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; 
   d="scan'208";a="653263282"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga002.fm.intel.com with ESMTP; 08 Apr 2022 06:46:37 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Weitao Wang <WeitaoWang-oc@zhaoxin.com>,
        Peter Chen <peter.chen@kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 1/3] USB: Fix xhci event ring dequeue pointer ERDP update issue
Date:   Fri,  8 Apr 2022 16:48:21 +0300
Message-Id: <20220408134823.2527272-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408134823.2527272-1-mathias.nyman@linux.intel.com>
References: <20220408134823.2527272-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Weitao Wang <WeitaoWang-oc@zhaoxin.com>

In some situations software handles TRB events slower than adding TRBs.
If the number of TRB events to be processed in a given interrupt is exactly
the same as the event ring size 256, then the local variable
"event_ring_deq" that holds the initial dequeue position is equal to
software_dequeue after handling all 256 interrupts.

It will cause driver to not update ERDP to hardware,

Software dequeue pointer is out of sync with ERDP on interrupt exit.
On the next interrupt, the event ring may full but driver will not
update ERDP as software_dequeue is equal to ERDP.

[  536.377115] xhci_hcd 0000:00:12.0: ERROR unknown event type 37
[  566.933173] sd 8:0:0:0: [sdb] tag#27 uas_eh_abort_handler 0 uas-tag 7 inflight: CMD OUT
[  566.933181] sd 8:0:0:0: [sdb] tag#27 CDB: Write(10) 2a 00 17 71 e6 78 00 00 08 00
[  572.041186] xhci_hcd On some situataions,the0000:00:12.0: xHCI host not responding to stop endpoint command.
[  572.057193] xhci_hcd 0000:00:12.0: Host halt failed, -110
[  572.057196] xhci_hcd 0000:00:12.0: xHCI host controller not responding, assume dead
[  572.057236] sd 8:0:0:0: [sdb] tag#26 uas_eh_abort_handler 0 uas-tag 6 inflight: CMD
[  572.057240] sd 8:0:0:0: [sdb] tag#26 CDB: Write(10) 2a 00 38 eb cc d8 00 00 08 00
[  572.057244] sd 8:0:0:0: [sdb] tag#25 uas_eh_abort_handler 0 uas-tag 5 inflight: CMD

Hardware ERDP is updated mid event handling if there are more than 128
events in an interrupt (half of ring size).
Fix this by updating the software local variable at the same time as
hardware ERDP.

[commit message rewording -Mathias]
Fixes: dc0ffbea5729 ("usb: host: xhci: update event ring dequeue pointer on purpose")
Signed-off-by: Weitao Wang <WeitaoWang-oc@zhaoxin.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index d0b6806275e0..f9707997969d 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3141,6 +3141,7 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 		if (event_loop++ < TRBS_PER_SEGMENT / 2)
 			continue;
 		xhci_update_erst_dequeue(xhci, event_ring_deq);
+		event_ring_deq = xhci->event_ring->dequeue;
 
 		/* ring is half-full, force isoc trbs to interrupt more often */
 		if (xhci->isoc_bei_interval > AVOID_BEI_INTERVAL_MIN)
-- 
2.25.1

