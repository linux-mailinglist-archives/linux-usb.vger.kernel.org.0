Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9F6C1ABFCB
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2020 13:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506442AbgDPLk3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Apr 2020 07:40:29 -0400
Received: from mga05.intel.com ([192.55.52.43]:26459 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2505893AbgDPK71 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 Apr 2020 06:59:27 -0400
IronPort-SDR: BILabQEDycCkwZxhkaBeI7k0ugeJuEJmQERe6S150XWE9p23we8m3rNnqSe+lxi5xHWOZLkyb1
 kCFrBQiCJ/1w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 03:59:27 -0700
IronPort-SDR: eTo0gTRFn6S5RrrpYN+BlMKSt14iwvJBb6/qjr3y13lqVU3lFdgKt58tU4pZtFDtRUbIybfD43
 OnPc4mEdGBwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; 
   d="scan'208";a="427794549"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga005.jf.intel.com with ESMTP; 16 Apr 2020 03:59:25 -0700
To:     Jim Lin <jilin@nvidia.com>
Cc:     USB <linux-usb@vger.kernel.org>, florianmey@gmx.de,
        hawk.it@tiscali.it
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Subject: [RFT PATCH] xhci: Don't clear hub TT buffer on ep0 protocol stall
Message-ID: <c27a32e9-1299-60d0-1612-3657b7841056@linux.intel.com>
Date:   Thu, 16 Apr 2020 14:02:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Jim Lin

The commit: ef513be0a905 ("usb: xhci: Add Clear_TT_Buffer") causes some
regression for other devices. 

https://bugzilla.kernel.org/show_bug.cgi?id=203419
https://bugzilla.kernel.org/show_bug.cgi?id=206897
https://bugzilla.kernel.org/show_bug.cgi?id=207065

Issue is poinpointed to clearing TT buffer for endpoint 0 protocol stalls
which should not be needed.

I have a patch to resolve this but I'm concerned it may cause regression for the
original case your patch solved.

If possible, can you try the patch below and check if the ConferenceCam
device still works with it, and let me know

Thanks 
Mathias

---- >8 ----

xhci: Don't clear hub TT buffer on ep0 protocol stall

The default control endpoint ep0 can return a STALL indicating the
device does not support the control transfer requests. This is called
a protocol stall and does not halt the endpoint.

xHC behaves a bit different. Its internal endpoint state will always
be halted on any stall, even if the device side of the endpiont is not
halted. So we do need to issue the reset endpoint command to clear the
xHC host intenal endpoint halt state, but should not request the HS hub
to clear the TT buffer unless device side of endpoint is halted.

Clearing the hub TT buffer at protocol stall caused ep0 to become
unresponsive for some FS/LS devices behind HS hubs, and class drivers
failed to set the interface due to timeout:

usb 1-2.1: 1:1: usb_set_interface failed (-110)

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index a7f4cd35da55..0fda0c0f4d31 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1876,7 +1876,6 @@ static void xhci_cleanup_halted_endpoint(struct xhci_hcd *xhci,
 		ep->ep_state |= EP_HARD_CLEAR_TOGGLE;
 		xhci_cleanup_stalled_ring(xhci, slot_id, ep_index, stream_id,
 					  td);
-		xhci_clear_hub_tt_buffer(xhci, td, ep);
 	}
 	xhci_ring_cmd_db(xhci);
 }
@@ -1997,11 +1996,18 @@ static int finish_td(struct xhci_hcd *xhci, struct xhci_td *td,
 	if (trb_comp_code == COMP_STALL_ERROR ||
 		xhci_requires_manual_halt_cleanup(xhci, ep_ctx,
 						trb_comp_code)) {
-		/* Issue a reset endpoint command to clear the host side
-		 * halt, followed by a set dequeue command to move the
-		 * dequeue pointer past the TD.
-		 * The class driver clears the device side halt later.
+		/*
+		 * xhci internal endpoint state will go to a "halt" state for
+		 * any stall, including default control pipe protocol stall.
+		 * To clear the host side halt we need to issue a reset endpoint
+		 * command, followed by a set dequeue command to move past the
+		 * TD.
+		 * Class drivers clear the device side halt from a functional
+		 * stall later. Hub TT buffer should only be cleared for FS/LS
+		 * devices behind HS hubs for functional stalls.
 		 */
+		if ((ep_index != 0) || (trb_comp_code != COMP_STALL_ERROR))
+			xhci_clear_hub_tt_buffer(xhci, td, ep);
 		xhci_cleanup_halted_endpoint(xhci, slot_id, ep_index,
 					ep_ring->stream_id, td, EP_HARD_RESET);
 	} else {
-- 
2.17.1

