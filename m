Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18D6075E19
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2019 07:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbfGZFGL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Jul 2019 01:06:11 -0400
Received: from gate.crashing.org ([63.228.1.57]:51672 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbfGZFGL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Jul 2019 01:06:11 -0400
Received: from ufdda393ec48b57.ant.amazon.com (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6Q55j3W017580;
        Fri, 26 Jul 2019 00:06:06 -0500
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Linux USB List <linux-usb@vger.kernel.org>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg KH <gregkh@linuxfoundation.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH v3 08/10] usb: gadget: aspeed: Improve debugging when nuking
Date:   Fri, 26 Jul 2019 15:05:37 +1000
Message-Id: <20190726050539.7875-9-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726050539.7875-1-benh@kernel.crashing.org>
References: <20190726050539.7875-1-benh@kernel.crashing.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When nuking requests, it's useful to display how many were
actually nuked. It has proven handy when debugging issues
where EP0 went in a wrong state.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/usb/gadget/udc/aspeed-vhub/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
index db3628be38c0..9e698de4b1e8 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -65,14 +65,16 @@ void ast_vhub_done(struct ast_vhub_ep *ep, struct ast_vhub_req *req,
 void ast_vhub_nuke(struct ast_vhub_ep *ep, int status)
 {
 	struct ast_vhub_req *req;
-
-	EPDBG(ep, "Nuking\n");
+	int count = 0;
 
 	/* Beware, lock will be dropped & req-acquired by done() */
 	while (!list_empty(&ep->queue)) {
 		req = list_first_entry(&ep->queue, struct ast_vhub_req, queue);
 		ast_vhub_done(ep, req, status);
+		count++;
 	}
+	if (count)
+		EPDBG(ep, "Nuked %d request(s)\n", count);
 }
 
 struct usb_request *ast_vhub_alloc_request(struct usb_ep *u_ep,
-- 
2.17.1

