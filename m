Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB81525B892
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 04:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727965AbgICCGc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 22:06:32 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:51396 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726177AbgICCGc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Sep 2020 22:06:32 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 73ED5C00B2;
        Thu,  3 Sep 2020 02:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1599098791; bh=FAcdJ8pWFyDHfDki1U6x0jqoQZefGIeFFvsdKvw53pU=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=i0tFf0Bxtg6RsVE3HWDcSp9XoBuZqytW8Aoy7xuyqP13nyZkTXwtutw0EXzTw7EVs
         3LTGdK0nYl0q+Gg7lhMU3JwzLYF/35VXp7eIVjY4plWQ7UkGQ4ecTMqUyaatHR8Vi8
         He9n+5G4NVCknEk/nepWc18doGpOtS+IoM5lnmwKfB4tB0Zqc0e5r1W4KKO4C4rrUv
         fzx6ANWrYpYyFiFX8tykEqFIgKpU44UVU58TezAa+IzvFLh12RCvklX0pFKageRx2w
         IGJqmPFsOf4N+IfncD/mFeC1RKx18LdgaqWgKGPvQs4MpuQN24/MZ6dkZ/3FDq+sOq
         dsPOh9VemZG6Q==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 4600DA007B;
        Thu,  3 Sep 2020 02:06:30 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 02 Sep 2020 19:06:30 -0700
Date:   Wed, 02 Sep 2020 19:06:30 -0700
Message-Id: <da702dc9b6f2413da5f8e8967ef1e591293102b1.1599098161.git.thinhn@synopsys.com>
In-Reply-To: <cover.1599098161.git.thinhn@synopsys.com>
References: <cover.1599098161.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v3 4/4] usb: dwc3: ep0: Skip ZLP setup for OUT
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The current implementation for ZLP handling of usb_request->zero for ep0
is only for control IN requests. For OUT direction, DWC3 needs to check
and set up for MPS boundary alignment, and it doesn't do that at the
moment.

Usually, control OUT requests can indicate its transfer size via the
wLength field of the control message. So usb_request->zero is usually
not needed for OUT direction. To handle ZLP OUT for control endpoint,
we'd need to allocate at least 3 TRBs for control requests (we have 2 at
the moment). For now, let's just make sure the current ZLP setup is only
for IN direction.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 Changes in v3:
 - None
 Changes in v2:
 - None

 drivers/usb/dwc3/ep0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index 5bb4327ae237..b531f63d19de 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -979,7 +979,7 @@ static void __dwc3_ep0_do_control_data(struct dwc3 *dwc,
 					 false);
 		ret = dwc3_ep0_start_trans(dep);
 	} else if (IS_ALIGNED(req->request.length, dep->endpoint.maxpacket) &&
-		   req->request.length && req->request.zero) {
+		   req->request.length && req->request.zero && req->direction) {
 
 		ret = usb_gadget_map_request_by_dev(dwc->sysdev,
 				&req->request, dep->number);
-- 
2.28.0

