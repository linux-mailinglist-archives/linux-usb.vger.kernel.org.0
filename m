Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 890CD75E1D
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2019 07:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbfGZFGR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Jul 2019 01:06:17 -0400
Received: from gate.crashing.org ([63.228.1.57]:51687 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbfGZFGQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Jul 2019 01:06:16 -0400
Received: from ufdda393ec48b57.ant.amazon.com (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6Q55j3Y017580;
        Fri, 26 Jul 2019 00:06:10 -0500
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Linux USB List <linux-usb@vger.kernel.org>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg KH <gregkh@linuxfoundation.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH v3 10/10] usb: gadget: aspeed: Implement dummy hub TT requests
Date:   Fri, 26 Jul 2019 15:05:39 +1000
Message-Id: <20190726050539.7875-11-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726050539.7875-1-benh@kernel.crashing.org>
References: <20190726050539.7875-1-benh@kernel.crashing.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We just accept them instead of stalling and return
zeros on GetTTState.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/usb/gadget/udc/aspeed-vhub/hub.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
index 0755115fd90d..19b3517e04c0 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
@@ -730,6 +730,12 @@ enum std_req_rc ast_vhub_class_hub_request(struct ast_vhub_ep *ep,
 	case ClearPortFeature:
 		EPDBG(ep, "ClearPortFeature(%d,%d)\n", wIndex & 0xf, wValue);
 		return ast_vhub_clr_port_feature(ep, wIndex & 0xf, wValue);
+	case ClearTTBuffer:
+	case ResetTT:
+	case StopTT:
+		return std_req_complete;
+	case GetTTState:
+		return ast_vhub_simple_reply(ep, 0, 0, 0, 0);
 	default:
 		EPDBG(ep, "Unknown class request\n");
 	}
-- 
2.17.1

