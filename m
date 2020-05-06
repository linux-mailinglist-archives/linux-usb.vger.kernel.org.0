Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64F281C65F3
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2020 04:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgEFCqQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 May 2020 22:46:16 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:50054 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725915AbgEFCqQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 May 2020 22:46:16 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1C008C1324;
        Wed,  6 May 2020 02:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588733175; bh=AZYtsK6RyTCnkegFvkbkNFPoHGJNBqM/RZHtQa2EkQk=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=PjnwE1YMLGsmAE/ZOoDFvba7c95TNIjbbnbPJqTJ834aA4p8tsFb1ZL88Y7XOooT+
         AG3RfT0JRzdeb3u0Lh45RRSEf97arhsRbx9/jU0tJZk2yh6HLylgWrOPzFMFSjJCJZ
         clnMk4BaYI12hvoI86iRCo9OPa9JOMJmd6gcoYOQiIRsa5NA5Qg7eDtu8hTUrBsEhT
         EC3hrPhNhhJOHiURuPdgdYu2j5bPYUgNTLulYXhIkJC6uH8B063GcQo/dPGSji5RXj
         IHdcTcH6FZQI1n8yJ28QjiyPZJRbKGfrIZCvLxS4pCWlH2EXis+ACyDMga7ojoBSiz
         nK1wH5yODscRA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id C189CA025E;
        Wed,  6 May 2020 02:46:13 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 05 May 2020 19:46:13 -0700
Date:   Tue, 05 May 2020 19:46:13 -0700
Message-Id: <d5c089459fc34be53e9a9395d7f24618db37f3db.1588732815.git.thinhn@synopsys.com>
In-Reply-To: <cover.1588732815.git.thinhn@synopsys.com>
References: <cover.1588732815.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 01/11] usb: gadget: Introduce usb_request->is_last
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To take advantage of DWC3 internal TRB prefetch and cache for
performance, inform the controller the last request with stream_id
before switching to a different stream transfer. This allows the
controller to maintain its transfer burst within the stream ID.

Introduce the usb-request is_last field to help inform the DWC3
controller of this.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 include/linux/usb/gadget.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index e959c09a97c9..281eabae7f33 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -42,6 +42,8 @@ struct usb_ep;
  * @num_mapped_sgs: number of SG entries mapped to DMA (internal)
  * @length: Length of that data
  * @stream_id: The stream id, when USB3.0 bulk streams are being used
+ * @is_last: Indicates if this is the last request of a stream_id before
+ *	switching to a different stream (required for DWC3 controllers).
  * @no_interrupt: If true, hints that no completion irq is needed.
  *	Helpful sometimes with deep request queues that are handled
  *	directly by DMA controllers.
@@ -104,6 +106,7 @@ struct usb_request {
 	unsigned		num_mapped_sgs;
 
 	unsigned		stream_id:16;
+	unsigned		is_last:1;
 	unsigned		no_interrupt:1;
 	unsigned		zero:1;
 	unsigned		short_not_ok:1;
-- 
2.11.0

