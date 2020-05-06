Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5507F1C65F6
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2020 04:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgEFCqf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 May 2020 22:46:35 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:50086 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725915AbgEFCqf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 May 2020 22:46:35 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7BDAFC1324;
        Wed,  6 May 2020 02:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588733194; bh=xt6Sw5O+Er2S1enRqwZlVgsKdI0/x2gDivNEbRVKUXw=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=DizfBtK7LAx6gf1ddwXnGC0fcsrbREdxyQq9y3MFZXLWhr4CMwoFlQt9BokzJfaJ7
         5EfIpjLbSoRGcPdxbiMIl8lTcs9Rd/mF7tImHx8MPyQspQYbaLp0Xw/YPMnlZijcH6
         CWPWFwM/tMiIxs5epPnQDRUI4fMuYRnWCVElAJQkbj8u0S0nRbm+H90C0AX3FQrsCV
         Gtd2jkrNxoyYgv5OkD9va8vRfi4bl9UPUOr7++BlGo5FbYRLT0bdjFGx5nQCvyw4oM
         IEgocpnicmI6lMxl9NijMnKMJqjvqn8geFDFPr9UDljMgEx12gRCeqAZ0Mp/c3chVF
         WiaeIeRSeh8pQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 4ACD6A025B;
        Wed,  6 May 2020 02:46:33 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 05 May 2020 19:46:33 -0700
Date:   Tue, 05 May 2020 19:46:33 -0700
Message-Id: <a31692578e4ddd342d2ff58035834c4b25755e7e.1588732815.git.thinhn@synopsys.com>
In-Reply-To: <cover.1588732815.git.thinhn@synopsys.com>
References: <cover.1588732815.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 04/11] usb: dwc3: gadget: Check for in-progress END_TRANSFER
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

While handling TRBs completion, if a END_TRANSFER command isn't
completed, don't kick new transfer or issue END_TRANSFER command.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 865e6fbb7360..3bb6f847a865 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2675,11 +2675,15 @@ static void dwc3_gadget_endpoint_transfer_in_progress(struct dwc3_ep *dep,
 
 	dwc3_gadget_ep_cleanup_completed_requests(dep, event, status);
 
+	if (dep->flags & DWC3_EP_END_TRANSFER_PENDING)
+		goto out;
+
 	if (stop)
 		dwc3_stop_active_transfer(dep, true, true);
 	else if (dwc3_gadget_ep_should_continue(dep))
 		__dwc3_gadget_kick_transfer(dep);
 
+out:
 	/*
 	 * WORKAROUND: This is the 2nd half of U1/U2 -> U0 workaround.
 	 * See dwc3_gadget_linksts_change_interrupt() for 1st half.
-- 
2.11.0

