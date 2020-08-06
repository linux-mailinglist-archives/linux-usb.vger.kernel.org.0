Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B483723D4D8
	for <lists+linux-usb@lfdr.de>; Thu,  6 Aug 2020 02:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbgHFApb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Aug 2020 20:45:31 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:35942 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726862AbgHFApa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Aug 2020 20:45:30 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A377B407DB;
        Thu,  6 Aug 2020 00:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1596674729; bh=DlxA/Yuqr9J090SCVcL5aYY9XswWfbhtbnDRyo2GcE8=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=IC51MT/zDYOWckYQXCAbC50gPvuT1ciqkk8CP/EKfLaYYwaj2HvpBYLpiyXKoJf/V
         y9HzZIwp69dnkMPmqXTJDGD4Pt/PcS8XN6oZbmET2TBlippbwF4xIEG9OAxZd2KpDq
         o6fkBZH3NOTnqLwKcEKXKymArWMOSwTJTqjSydWxAKBewzxoVOvAW+Uhfjl9v4Fhbj
         pRS66mEji12xxAwLvL/aGMdKfeZmoY7jf/di9T/dFIdfGsAlkacjMft8KGn7LKVOiH
         98fvh1gYWJcrBrhQ1r45MIaaIfvoaRWtbk5aEKX5gPU2C/C97cxrtbGVA12j80oash
         XCfs8OiK6E5lw==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 8D556A0096;
        Thu,  6 Aug 2020 00:45:28 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 05 Aug 2020 17:45:28 -0700
Date:   Wed, 05 Aug 2020 17:45:28 -0700
Message-Id: <34883d133c8645bb258025aa170ddd5e01fdc0d9.1596674378.git.thinhn@synopsys.com>
In-Reply-To: <cover.1596674377.git.thinhn@synopsys.com>
References: <cover.1596674377.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 7/7] usb: dwc3: ep0: Skip ZLP setup for OUT
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
 drivers/usb/dwc3/ep0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index 59f2e8c31bd1..ade9503cf876 100644
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

