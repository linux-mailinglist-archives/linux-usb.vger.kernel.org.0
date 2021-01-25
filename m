Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 163DD302C47
	for <lists+linux-usb@lfdr.de>; Mon, 25 Jan 2021 21:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731749AbhAYUJE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Jan 2021 15:09:04 -0500
Received: from gloria.sntech.de ([185.11.138.130]:60888 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732187AbhAYT6T (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 25 Jan 2021 14:58:19 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1l47Im-00048n-6w; Mon, 25 Jan 2021 20:13:28 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     hminas@synopsys.com, gregkh@linuxfoundation.org
Cc:     christoph.muellner@theobroma-systems.com, paulz@synopsys.com,
        yousaf.kaukab@intel.com, balbi@ti.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, heiko@sntech.de,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        stable@vger.kernel.org
Subject: [PATCH] usb: dwc2: Fix endpoint direction check in ep_from_windex
Date:   Mon, 25 Jan 2021 20:13:24 +0100
Message-Id: <20210125191324.1981199-1-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

dwc2_hsotg_process_req_status uses ep_from_windex() to retrieve
the endpoint for the index provided in the wIndex request param.

In a test-case with a rndis gadget running and sending a malformed
packet to it like:
    dev.ctrl_transfer(
        0x82,      # bmRequestType
        0x00,       # bRequest
        0x0000,     # wValue
        0x0001,     # wIndex
        0x00       # wLength
    )
it is possible to cause a crash:

[  217.533022] dwc2 ff300000.usb: dwc2_hsotg_process_req_status: USB_REQ_GET_STATUS
[  217.559003] Unable to handle kernel read from unreadable memory at virtual address 0000000000000088
...
[  218.313189] Call trace:
[  218.330217]  ep_from_windex+0x3c/0x54
[  218.348565]  usb_gadget_giveback_request+0x10/0x20
[  218.368056]  dwc2_hsotg_complete_request+0x144/0x184

This happens because ep_from_windex wants to compare the endpoint
direction even if index_to_ep() didn't return an endpoint due to
the direction not matching.

The fix is easy insofar that the actual direction check is already
happening when calling index_to_ep() which will return NULL if there
is no endpoint for the targeted direction, so the offending check
can go away completely.

Fixes: c6f5c050e2a7 ("usb: dwc2: gadget: add bi-directional endpoint support")
Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Cc: stable@vger.kernel.org
---
 drivers/usb/dwc2/gadget.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 70ac47a341ac..a68c01b1dd73 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -1553,12 +1553,7 @@ static struct dwc2_hsotg_ep *ep_from_windex(struct dwc2_hsotg *hsotg,
 	if (idx > hsotg->num_of_eps)
 		return NULL;
 
-	ep = index_to_ep(hsotg, idx, dir);
-
-	if (idx && ep->dir_in != dir)
-		return NULL;
-
-	return ep;
+	return index_to_ep(hsotg, idx, dir);
 }
 
 /**
-- 
2.29.2

