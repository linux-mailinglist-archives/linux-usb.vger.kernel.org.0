Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE82EF417
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 04:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729996AbfKEDex (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 22:34:53 -0500
Received: from funyu.konbu.org ([51.15.241.64]:51872 "EHLO funyu.konbu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728910AbfKEDew (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Nov 2019 22:34:52 -0500
X-Greylist: delayed 316 seconds by postgrey-1.27 at vger.kernel.org; Mon, 04 Nov 2019 22:34:52 EST
Received: from tungsten (178.231.214.202.rev.vmobile.jp [202.214.231.178])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by funyu.konbu.org (Postfix) with ESMTPSA id 9397F280DA5;
        Tue,  5 Nov 2019 03:29:28 +0000 (UTC)
Date:   Tue, 5 Nov 2019 12:29:22 +0900
From:   Boris ARZUR <boris@konbu.org>
To:     linux-usb@vger.kernel.org
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Grigor Tovmasyan <Grigor.Tovmasyan@synopsys.com>,
        Gevorg Sahakyan <Gevorg.Sahakyan@synopsys.com>,
        John Youn <John.Youn@synopsys.com>,
        Sevak Arakelyan <sevaka@synopsys.com>,
        William Wu <william.wu@rock-chips.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] usb: dwc2: extend treatment for incomplete transfer
Message-ID: <20191105032922.GA3041@tungsten>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Channel halt can happen with BULK endpoints when the
cpu is under high load. Treating it as an error leads
to a null-pointer dereference in dwc2_free_dma_aligned_buffer().

Signed-off-by: Boris Arzur <boris@konbu.org>
---
 drivers/usb/dwc2/hcd_intr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/hcd_intr.c b/drivers/usb/dwc2/hcd_intr.c
index a052d39b4375..697fed530aeb 100644
--- a/drivers/usb/dwc2/hcd_intr.c
+++ b/drivers/usb/dwc2/hcd_intr.c
@@ -1944,7 +1944,8 @@ static void dwc2_hc_chhltd_intr_dma(struct dwc2_hsotg
*hsotg,
                         */
                        dwc2_hc_ack_intr(hsotg, chan, chnum, qtd);
                } else {
-                       if (chan->ep_type == USB_ENDPOINT_XFER_INT ||
+                       if (chan->ep_type == USB_ENDPOINT_XFER_BULK ||
+                           chan->ep_type == USB_ENDPOINT_XFER_INT ||
                            chan->ep_type == USB_ENDPOINT_XFER_ISOC) {
                                /*
                                 * A periodic transfer halted with no other
--
2.23.0
