Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1F1F779C
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2019 16:26:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726888AbfKKP0y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Nov 2019 10:26:54 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:49333 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726857AbfKKP0y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Nov 2019 10:26:54 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mol@pengutronix.de>)
        id 1iUBac-0000i0-11; Mon, 11 Nov 2019 16:26:50 +0100
Received: from mol by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mol@pengutronix.de>)
        id 1iUBaa-0003bS-Rg; Mon, 11 Nov 2019 16:26:48 +0100
From:   Michael Olbrich <m.olbrich@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        Michael Olbrich <m.olbrich@pengutronix.de>
Subject: [PATCH 2/2] usb: dwc3: gadget: restart the transfer if a isoc request is queued too late
Date:   Mon, 11 Nov 2019 16:26:45 +0100
Message-Id: <20191111152645.13792-3-m.olbrich@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191111152645.13792-1-m.olbrich@pengutronix.de>
References: <20191111152645.13792-1-m.olbrich@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently, most gadget drivers handle isoc transfers on a best effort
bases: If the request queue runs empty, then there will simply be gaps in
the isoc data stream.

The UVC gadget depends on this behaviour. It simply provides new requests
when video frames are available and assumes that they are sent as soon as
possible.

The dwc3 gadget currently works differently: It assumes that there is a
contiguous stream of requests without any gaps. If a request is too late,
then it is dropped by the hardware.
For the UVC gadget this means that a live stream stops after the first
frame because all following requests are late.

This patch changes the behaviour of the dwc3 gadget driver to match the
expectations. If a request arrives too late, then the transfer will be
restart to create the needed gap.

A request is late if:
1. There are currently no requests queued in the hardware
2. The current frame number provided by DSTS does not match the frame
   number returned by the last transfer.

If this happens transfers are stopped. The following XferNotReady provides
the new correct frame number and restarts the transfer.

Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
---
 drivers/usb/dwc3/gadget.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index ac4673d91939..eb7f09929f28 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1473,6 +1473,14 @@ static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct dwc3_request *req)
 				return __dwc3_gadget_start_isoc(dep);
 			}
 		}
+		if ((dep->flags & DWC3_EP_TRANSFER_STARTED) &&
+		    list_empty(&dep->started_list) &&
+		    ((dep->frame_number & 0x3fff) !=
+		    __dwc3_gadget_get_frame(dwc))) {
+			dwc3_stop_active_transfer(dep, true, true);
+			dep->flags = DWC3_EP_ENABLED;
+			return 0;
+		}
 	}
 
 	return __dwc3_gadget_kick_transfer(dep, false);
-- 
2.20.1

