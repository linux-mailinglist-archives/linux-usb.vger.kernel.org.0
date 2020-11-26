Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5E52C4EFE
	for <lists+linux-usb@lfdr.de>; Thu, 26 Nov 2020 07:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388182AbgKZGy1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Nov 2020 01:54:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:36684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732132AbgKZGy0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Nov 2020 01:54:26 -0500
Received: from localhost.localdomain (unknown [180.164.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C456620DD4;
        Thu, 26 Nov 2020 06:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606373666;
        bh=5Z9txHg2UFqQ7NQd1RgxRSaUOZ1cwrf26ByxIMYvDCM=;
        h=From:To:Cc:Subject:Date:From;
        b=UCphCZhfIgLMsBWd9J7Yywokv1gWjyUJQp/M3qWRbPTxYr4Ruuz2VrcLX9mO9KWzc
         Uhlm6r+m++UjsS+i0PXNQhYmtx7xiN4TWKZncaYofeBWqghIxx/CrUccLe20CbQrzO
         1+OA3Omt/qlQS9eNwzo3YHCVJbPl1mjzuhzz6GYw=
From:   Peter Chen <peter.chen@kernel.org>
To:     pawell@cadence.com, rogerq@ti.com
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        frank.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/2] usb: cdns3: gadget: clear trb->length as zero after preparing every trb
Date:   Thu, 26 Nov 2020 14:54:08 +0800
Message-Id: <20201126065409.7533-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

It clears trb->length as zero before preparing td, but if scatter
buffer is used for td, there are several trbs within td, it needs to clear
every trb->length as zero, otherwise, the default value for trb->length
may not be zero after it begins to use the second round of trb rings.

Fixes: abc6b579048e ("usb: cdns3: gadget: using correct sg operations")
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 365f30fb1159..0aa85cc07ff1 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -1260,6 +1260,7 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 		priv_req->end_trb = priv_ep->enqueue;
 		cdns3_ep_inc_enq(priv_ep);
 		trb = priv_ep->trb_pool + priv_ep->enqueue;
+		trb->length = 0;
 	} while (sg_iter < num_trb);
 
 	trb = priv_req->trb;
-- 
2.17.1

