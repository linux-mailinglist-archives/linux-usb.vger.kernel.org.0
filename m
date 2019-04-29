Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDA3FE13A
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 13:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727839AbfD2LXt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 07:23:49 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:59078 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727710AbfD2LXs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 07:23:48 -0400
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 91452C0092;
        Mon, 29 Apr 2019 11:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1556537026; bh=5sWD2Y/brIjt+9b1fveY2f5CUtCTo7Kkqm8+5c6mVro=;
        h=Date:From:Subject:To:Cc:From;
        b=VtJr3zVXynf2OtoedJ9rkh/GgNm/VbpmQ7ZEeH1E4murlAFPZU82RqvOGiNQLS/hK
         CFZ0kOyVkCABAfYAfxErQeMpLQtKN4q4FTGO8XRUjQ8BqPxCAfUltJB4CcMr6rjrF+
         J32qF5v/Mijq/7GVPR8LlbqRKvLoVu7+zEsBTAaA5usuvyInJC8GuApVLbpzA5ZOth
         RhLTWrH3EXeVjSsgn3oHrL6SkbQPgKck3O9QBqvBcl1HA8zHFL0dfGJUw+DpaxelWU
         cEdLNyDiq6pZjHvOUXXpMqDL190c7V7PtKesX8FkKSbhycFfVnmGgp/xtqo+f4zdSk
         idvHvBotPpKoQ==
Received: from hminas-z420 (hminas-z420.internal.synopsys.com [10.116.126.211])
        (using TLSv1 with cipher AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id EC9C8A0098;
        Mon, 29 Apr 2019 11:23:45 +0000 (UTC)
Received: by hminas-z420 (sSMTP sendmail emulation); Mon, 29 Apr 2019 15:23:43 +0400
Date:   Mon, 29 Apr 2019 15:23:43 +0400
Message-Id: <0fea0710927341839f78280a11815b4f099e960c.1556536963.git.hminas@synopsys.com>
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH] usb: dwc2: Set actual frame number for completed ISOC transfer for none DDMA
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On ISOC OUT transfer completion, in none DDMA mode, set actual frame
number returning to function driver in usb_request.

Signed-off-by: Minas Harutyunyan <hminas@synopsys.com>
---
 drivers/usb/dwc2/gadget.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 6812a8a3a98b..608e0b1331c5 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2402,6 +2402,10 @@ static void dwc2_hsotg_handle_outdone(struct dwc2_hsotg *hsotg, int epnum)
 			dwc2_gadget_incr_frame_num(hs_ep);
 	}
 
+	/* Set actual frame number for completed transfers */
+	if (!using_desc_dma(hsotg) && hs_ep->isochronous)
+		req->frame_number = hsotg->frame_number;
+
 	dwc2_hsotg_complete_request(hsotg, hs_ep, hs_req, result);
 }
 
-- 
2.11.0

