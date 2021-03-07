Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A37A433000B
	for <lists+linux-usb@lfdr.de>; Sun,  7 Mar 2021 11:13:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231582AbhCGKNF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Mar 2021 05:13:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:51628 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231571AbhCGKNB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 7 Mar 2021 05:13:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA6D365134;
        Sun,  7 Mar 2021 10:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615111981;
        bh=tIc/2N64eY8KnqMMTNJqlX9sQMIABmR3U+HS3rV6unY=;
        h=From:To:Cc:Subject:Date:From;
        b=bqy5rDjLERG7EAxenNgRNVpRe9fvdmd6DKfLZyzVmXS1FAnJbmt50a7PLaEdQX0Vm
         tVfTJ+9uS0wX7CahuxJ7f12YI2ZmMt6THh7m6LHOBbpKhVZyd4jPM7dTsJ5wFQ0J0J
         Q6buDA82Oo0Hb4xvSWr9OpVH/y+tceeR3+GYaI4Wu/58v2MbWO+gHSOJrnF/mLss72
         Fjfc3R/vnSj/bA0AM58u2Ec4hrdXp+4dh9t4R0rC7YTbOm5wJZsOh4sIzqXZ4UmfAQ
         PIhf9mFEMTLedmkfVwqZE7lYBpTqAUogwxDIPEd99ScWv7I3FeQXSfq9LsTD3IdUsh
         LNrZZoeil284Q==
From:   Peter Chen <peter.chen@kernel.org>
To:     pawell@cadence.com
Cc:     linux-usb@vger.kernel.org, rogerq@kernel.org, frank.li@nxp.com,
        a-govindraju@ti.com, Peter Chen <peter.chen@kernel.org>
Subject: [PATCH 1/1] usb: cdns3: trace: delete the trace parameter for request->trb
Date:   Sun,  7 Mar 2021 18:12:55 +0800
Message-Id: <20210307101255.26760-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It is not correct using %pa to print virtual address of request->trb, and
it is hard to print its physical address due to the virtual address is
zero before using. It could use index (start_trb/end_trb) to know the
current trb position, so no matter virtual address or physical address
for request-trb is not so meaningful.

Reported-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Peter Chen <peter.chen@kernel.org>
---
 drivers/usb/cdns3/cdns3-trace.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-trace.h b/drivers/usb/cdns3/cdns3-trace.h
index 8648c7a7a9dd..7574b4a62813 100644
--- a/drivers/usb/cdns3/cdns3-trace.h
+++ b/drivers/usb/cdns3/cdns3-trace.h
@@ -214,7 +214,6 @@ DECLARE_EVENT_CLASS(cdns3_log_request,
 		__field(int, no_interrupt)
 		__field(int, start_trb)
 		__field(int, end_trb)
-		__field(struct cdns3_trb *, start_trb_addr)
 		__field(int, flags)
 		__field(unsigned int, stream_id)
 	),
@@ -230,12 +229,11 @@ DECLARE_EVENT_CLASS(cdns3_log_request,
 		__entry->no_interrupt = req->request.no_interrupt;
 		__entry->start_trb = req->start_trb;
 		__entry->end_trb = req->end_trb;
-		__entry->start_trb_addr = req->trb;
 		__entry->flags = req->flags;
 		__entry->stream_id = req->request.stream_id;
 	),
 	TP_printk("%s: req: %p, req buff %p, length: %u/%u %s%s%s, status: %d,"
-		  " trb: [start:%d, end:%d: virt addr %pa], flags:%x SID: %u",
+		  " trb: [start:%d, end:%d], flags:%x SID: %u",
 		__get_str(name), __entry->req, __entry->buf, __entry->actual,
 		__entry->length,
 		__entry->zero ? "Z" : "z",
@@ -244,7 +242,6 @@ DECLARE_EVENT_CLASS(cdns3_log_request,
 		__entry->status,
 		__entry->start_trb,
 		__entry->end_trb,
-		__entry->start_trb_addr,
 		__entry->flags,
 		__entry->stream_id
 	)
-- 
2.17.1

