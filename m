Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E814821A3
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 18:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729045AbfHEQZf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 12:25:35 -0400
Received: from dougal.metanate.com ([90.155.101.14]:49836 "EHLO metanate.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727928AbfHEQZf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 5 Aug 2019 12:25:35 -0400
X-Greylist: delayed 1425 seconds by postgrey-1.27 at vger.kernel.org; Mon, 05 Aug 2019 12:25:34 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=metanate.com;
         s=stronger; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Mb0+WXDHWSc/rNkXJbc6lMJLOwyKt65paFmvwJ/SejM=; b=o/TXRB5b64C8hWjvr6mX7H06kv
        VIGgsbS1DCOycyZPbyoYeD876x/PTwEz1CUpjs6+v08vj4CH6SMHggOVQPikmH96RRZySnnt0muRh
        /nKLigUZWLfpAUPkge7xd9K0dXqkKEOO3IEJk8Y5r4eTevojkLLlp6jAggxZ/giZlu0mCONyEOfyW
        vlyAowfG5AGz3rR+0FtHZTyCEwldjBQXhBWxRhQg9epS0xa6LnJe8DEwbduNXLK+sUPd19kXUGv9k
        m2eylPwiqn1BXjOZ0pQw1ERSnKKkM1nTIDF01q4n/QsGdiI8jP0eLYoNVSmwAWZhJdVEjg1rK4aB/
        09k9ADPQ==;
Received: from dougal.metanate.com ([192.168.88.1] helo=localhost.localdomain)
        by shrek.metanate.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.90_1)
        (envelope-from <john@metanate.com>)
        id 1hufQg-0000vT-0R; Mon, 05 Aug 2019 17:01:46 +0100
From:   John Keeping <john@metanate.com>
To:     Minas Harutyunyan <hminas@synopsys.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Keeping <john@metanate.com>
Subject: [PATCH] usb: dwc2: gadget: Fix kill_all_requests race
Date:   Mon,  5 Aug 2019 17:01:21 +0100
Message-Id: <20190805160121.27443-1-john@metanate.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When a gadget is disabled, kill_all_requests() can be called
simultaneously from both a user process via dwc2_hsotg_pullup() and from
the interrupt handler if the hardware detects disconnection.

Since we drop the lock in dwc2_hsotg_complete_request() in order to call
the completion handler, this means that the list is modified
concurrently and leads to an infinite loop in kill_all_requests().

Replace the foreach loop with a while-not-empty loop in order to remove
the danger of this concurrent modification.

Note: I observed this with threadirqs, I'm not sure if it can be
triggered without threaded interrupts.

Signed-off-by: John Keeping <john@metanate.com>
---
 drivers/usb/dwc2/gadget.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 60ac98cd8ad8..92e8de9cb45c 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -3227,14 +3227,15 @@ static void kill_all_requests(struct dwc2_hsotg *hsotg,
 			      struct dwc2_hsotg_ep *ep,
 			      int result)
 {
-	struct dwc2_hsotg_req *req, *treq;
 	unsigned int size;
 
 	ep->req = NULL;
 
-	list_for_each_entry_safe(req, treq, &ep->queue, queue)
-		dwc2_hsotg_complete_request(hsotg, ep, req,
-					    result);
+	while (!list_empty(&ep->queue)) {
+		struct dwc2_hsotg_req *req = get_ep_head(ep);
+
+		dwc2_hsotg_complete_request(hsotg, ep, req, result);
+	}
 
 	if (!hsotg->dedicated_fifos)
 		return;
-- 
2.22.0

