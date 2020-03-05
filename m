Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31ACB17B092
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2020 22:23:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbgCEVXv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Mar 2020 16:23:51 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:47408 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726111AbgCEVXv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Mar 2020 16:23:51 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B5E91C10CC;
        Thu,  5 Mar 2020 21:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1583443431; bh=yrq7Q9RqsiuUmyEzEOOBnbBOQwoF7QudkSxK5FWQMz8=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=PJLgzcz7QyDxpORLYGj7+Q6jdvt7xRFbn3JOjRIHx2Tg9IC3LEzwsDV8LLIRT6SN6
         85A8pHj/dE7iJ99AWUmsaiMgIMlWVWibFda9OySAT24T+cJ1Rus/6CzRy3HAQd0BFP
         t5e/CZiOe9yGphXNkSLJT0Uhq5XhiMVGWL1rBqsQ2De6vxUjMxWPXH7LAF+ht94rTg
         xfMlZktmAR4tPIWthU9BAy+I4f1v/T6DEbyy/+T1DBynoPsnUdUP3cID8Yi6cghOgg
         7PeNepYnfYe1smiZUFdsJeLGNnvo/QIbaUyEakXyjLA1VDc7huGeD2a7xtUUnj4j3Q
         7pEk10feesNDA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 67C37A006D;
        Thu,  5 Mar 2020 21:23:49 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 05 Mar 2020 13:23:49 -0800
Date:   Thu, 05 Mar 2020 13:23:49 -0800
Message-Id: <6daaa98986b2061c2784e7229df2af8baeb9d783.1583443184.git.thinhn@synopsys.com>
In-Reply-To: <cover.1583443184.git.thinhn@synopsys.com>
References: <cover.1583443184.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 1/6] usb: dwc3: gadget: Don't clear flags before transfer ended
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We track END_TRANSFER command completion. Don't clear transfer
started/ended flag prematurely. Otherwise, we'd run into the problem
with restarting transfer before END_TRANSFER command finishes.

Fixes: 6d8a019614f3 ("usb: dwc3: gadget: check for Missed Isoc from event status")
Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 1b7d2f9cb673..b87bdec84210 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2563,10 +2563,8 @@ static void dwc3_gadget_endpoint_transfer_in_progress(struct dwc3_ep *dep,
 
 	dwc3_gadget_ep_cleanup_completed_requests(dep, event, status);
 
-	if (stop) {
+	if (stop)
 		dwc3_stop_active_transfer(dep, true, true);
-		dep->flags = DWC3_EP_ENABLED;
-	}
 
 	/*
 	 * WORKAROUND: This is the 2nd half of U1/U2 -> U0 workaround.
-- 
2.11.0

