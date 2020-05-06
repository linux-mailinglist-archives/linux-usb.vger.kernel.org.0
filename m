Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81F591C65F8
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2020 04:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgEFCqr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 May 2020 22:46:47 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:50092 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725915AbgEFCqr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 May 2020 22:46:47 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A7DDFC1324;
        Wed,  6 May 2020 02:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588733206; bh=X/Vlrm4XVv8F68xYVlydCczkB39v5861HS30a8cJ7os=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=SZDlTnjv5Jv5pLp0WAlhFNLIZqNPV009gV3ucWkhCfwbG9on6QzDosEWCJKYFcIIi
         CXOa3RjutBeuk+wl2yjOee5NMzOjzSNebyKf5NL3xyd+U0YHePtVAWsGtGho7gDzur
         vtGmJD9gCmgPaPh+LVYmYOFtzJHTrY22L7MU7Ca3kyKssBmu2sFp6rmCOkZ7j9Af9U
         bgecJgaWLtPSDTWBWSjMezPettlwGd5YQ2ObBULUyFtAN4plOl9I/b+wqhNK9T4da7
         96B3GzbR4eIQUcHT+quJZNjSntbm55soRtkznS87TCcQfKBUOe8qnRkLHPKHgley3P
         U0dB8WhQ/8z2A==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 704B3A007C;
        Wed,  6 May 2020 02:46:45 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 05 May 2020 19:46:45 -0700
Date:   Tue, 05 May 2020 19:46:45 -0700
Message-Id: <3c12b4e3f719509310257778a8524886a7efe95b.1588732815.git.thinhn@synopsys.com>
In-Reply-To: <cover.1588732815.git.thinhn@synopsys.com>
References: <cover.1588732815.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 06/11] usb: dwc3: gadget: Enable XferComplete event
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To switch from one stream to another, this requires the driver to start
a new transfer with a specific stream ID. For a transfer to complete,
the driver needs to indicate the last TRB of a transfer, and it needs to
enable XferComplete event to handle completed TRBs of a transfer. Let's
enable this event only for stream capable endpoints.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 5f98b424f20b..81aa7de4cb17 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -579,6 +579,7 @@ static int dwc3_gadget_set_ep_config(struct dwc3_ep *dep, unsigned int action)
 
 	if (usb_ss_max_streams(comp_desc) && usb_endpoint_xfer_bulk(desc)) {
 		params.param1 |= DWC3_DEPCFG_STREAM_CAPABLE
+			| DWC3_DEPCFG_XFER_COMPLETE_EN
 			| DWC3_DEPCFG_STREAM_EVENT_EN;
 		dep->stream_capable = true;
 	}
-- 
2.11.0

