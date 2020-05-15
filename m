Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B207A1D5CDD
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2020 01:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726624AbgEOXku (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 19:40:50 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:44694 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726223AbgEOXku (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 May 2020 19:40:50 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8C017C0085;
        Fri, 15 May 2020 23:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1589586049; bh=K7OduQzJ4da4MNVwJor5XYJP9W+HZIlUXeY5uOJ4f2M=;
        h=Date:From:Subject:To:Cc:From;
        b=Qdrkt4+KgsVMW4xfCTkGU2iChvoaweJCRZm6pXLG4QoVqzS05Qjv/uSkMkNU6bdM+
         qq9nC2+nJpV8rRhL389+4Ezd4VRwDyjh3JR4kqDdw09vPcKV2uUw9JH1xtb5w593jV
         9GgT+v3uV+MI/uKkz/8mtlZmwitvpQA1RdGeNPh4sSu9hXo7eppugydzfp8NzswydO
         0ewxZif8QeO4dTBwTVCu2ptXKNzMR5VRrDP/bz1YW0h8QZvHXwhP1YZZc/CUzJypyC
         CBv2zHDP5HyzMvd1I9jlDc+arzXcix+XXyIWCG9sU7uCebriPNWB/cFLKLwi3/sdsa
         Jt8h1sTpNMvMg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 01901A0096;
        Fri, 15 May 2020 23:40:46 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Fri, 15 May 2020 16:40:46 -0700
Date:   Fri, 15 May 2020 16:40:46 -0700
Message-Id: <dcb46412b7454e517255e64b1c70d3e402797dd8.1589585973.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: dwc3: gadget: Check for prepared TRBs
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There are cases where the endpoint needs to be restarted. For example,
it may need to restart for NoStream rejection to reinitiate stream. If
so, check and make sure we don't prepare beyond the current transfer
when we restart the endpoint.

DWC_usb32 internal burst transfer feature will look into TRBs beyond a
transfer. Other controllers will stop on the last TRB, but not
DWC_usb32. This may cause the controller to incorrectly process TRBs of
a different transfer. Make sure to explicitly prevent preparing TRBs of
a different transfer.

This should only affect DWC_usb32 releases prior to v1.00a since it
doesn't use SET_ENDPOINT_PRIME to reinitiate stream. However, it's
better to be cautious in case users don't want to use SET_ENDPOINT_PRIME
command. Also, it's possible other controller IPs may share the same
features as DWC_usb32 in new releases.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index fea4fde1b5e3..45b7e6dca781 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1232,6 +1232,14 @@ static void dwc3_prepare_trbs(struct dwc3_ep *dep)
 
 		if (!dwc3_calc_trbs_left(dep))
 			return;
+
+		/*
+		 * Don't prepare beyond a transfer. In DWC_usb32, its transfer
+		 * burst capability may try to read and use TRBs beyond the
+		 * active transfer instead of stopping.
+		 */
+		if (dep->stream_capable && req->request.is_last)
+			return;
 	}
 
 	list_for_each_entry_safe(req, n, &dep->pending_list, list) {
-- 
2.11.0

