Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D922660E57
	for <lists+linux-usb@lfdr.de>; Sat,  6 Jul 2019 02:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfGFAyE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jul 2019 20:54:04 -0400
Received: from gate.crashing.org ([63.228.1.57]:42793 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbfGFAyD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Jul 2019 20:54:03 -0400
Received: from ufdda393ec48b57.ant.amazon.com (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x660rlML017940;
        Fri, 5 Jul 2019 19:53:58 -0500
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Joel Stanley <joel@jms.id.au>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 04/10] usb: gadget: aspeed: Improve debugging when nuking
Date:   Sat,  6 Jul 2019 10:53:39 +1000
Message-Id: <20190706005345.18131-5-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190706005345.18131-1-benh@kernel.crashing.org>
References: <20190706005345.18131-1-benh@kernel.crashing.org>
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

