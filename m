Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CAFD664B7
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jul 2019 04:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729328AbfGLCzH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Jul 2019 22:55:07 -0400
Received: from gate.crashing.org ([63.228.1.57]:54472 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729276AbfGLCzH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Jul 2019 22:55:07 -0400
Received: from ufdda393ec48b57.ant.amazon.com (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6C2rnGf010240;
        Thu, 11 Jul 2019 21:54:02 -0500
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Joel Stanley <joel@jms.id.au>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH v2 04/12] usb: gadget: aspeed: Improve debugging when nuking
Date:   Fri, 12 Jul 2019 12:53:40 +1000
Message-Id: <20190712025348.21019-5-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190712025348.21019-1-benh@kernel.crashing.org>
References: <20190712025348.21019-1-benh@kernel.crashing.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When nuking requests, it's useful to display how many were
actually nuked. It has proven handy when debugging issues
where EP0 went in a wrong state.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/usb/gadget/udc/aspeed-vhub/core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
index db3628be38c0..0c77cd488c48 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -65,13 +65,16 @@ void ast_vhub_done(struct ast_vhub_ep *ep, struct ast_vhub_req *req,
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
+	}
+	if (count) {
+		EPDBG(ep, "Nuked %d request(s)\n", count);
 	}
 }
 
-- 
2.17.1

