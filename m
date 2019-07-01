Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DACA84659E
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2019 19:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbfFNRXM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Jun 2019 13:23:12 -0400
Received: from lnfm1.sai.msu.ru ([93.180.26.255]:50801 "EHLO lnfm1.sai.msu.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726298AbfFNRXL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Jun 2019 13:23:11 -0400
X-Greylist: delayed 2129 seconds by postgrey-1.27 at vger.kernel.org; Fri, 14 Jun 2019 13:23:05 EDT
Received: from dragon.sai.msu.ru (dragon.sai.msu.ru [93.180.26.172])
        by lnfm1.sai.msu.ru (8.14.1/8.12.8) with ESMTP id x5EGl6mP020151;
        Fri, 14 Jun 2019 19:47:11 +0300
Received: from oak.local (unknown [92.243.181.209])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by dragon.sai.msu.ru (Postfix) with ESMTPSA id E08B084C8E;
        Fri, 14 Jun 2019 19:47:07 +0300 (MSK)
From:   "Matwey V. Kornilov" <matwey@sai.msu.ru>
To:     b-liu@ti.com, gregkh@linuxfoundation.org, stern@rowland.harvard.edu
Cc:     matwey.kornilov@gmail.com,
        "Matwey V. Kornilov" <matwey@sai.msu.ru>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] usb: musb: Rename musb_start_urb() to musb_start_next_urb()
Date:   Fri, 14 Jun 2019 19:45:52 +0300
Message-Id: <20190614164554.27679-5-matwey@sai.msu.ru>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190614164554.27679-1-matwey@sai.msu.ru>
References: <20190403185310.8437-1-matwey@sai.msu.ru>
 <20190614164554.27679-1-matwey@sai.msu.ru>
In-Reply-To: <20190403185310.8437-1-matwey@sai.msu.ru>
References: <20190403185310.8437-1-matwey@sai.msu.ru>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In the following commit we introduce new musb_start_urb() function
which will be able to start arbitrary urb. In order to have
intuitive function names we rename musb_start_urb() to
musb_start_next_urb().

Signed-off-by: Matwey V. Kornilov <matwey@sai.msu.ru>
---
 drivers/usb/musb/musb_host.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index 5d23c950a21b..3a202a2a521d 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -213,7 +213,7 @@ static struct musb_qh *musb_ep_get_qh(struct musb_hw_ep *ep, int is_in)
  * Context: controller locked, irqs blocked
  */
 static void
-musb_start_urb(struct musb *musb, int is_in, struct musb_qh *qh)
+musb_start_next_urb(struct musb *musb, int is_in, struct musb_qh *qh)
 {
 	u32			len;
 	void __iomem		*mbase =  musb->mregs;
@@ -403,7 +403,7 @@ static void musb_advance_schedule(struct musb *musb, struct urb *urb,
 	if (qh != NULL && qh->is_ready) {
 		musb_dbg(musb, "... next ep%d %cX urb %p",
 		    hw_ep->epnum, is_in ? 'R' : 'T', next_urb(qh));
-		musb_start_urb(musb, is_in, qh);
+		musb_start_next_urb(musb, is_in, qh);
 	}
 }
 
@@ -1001,7 +1001,7 @@ static void musb_bulk_nak_timeout(struct musb *musb, struct musb_hw_ep *ep,
 		}
 
 		if (next_qh)
-			musb_start_urb(musb, is_in, next_qh);
+			musb_start_next_urb(musb, is_in, next_qh);
 	}
 }
 
@@ -2141,7 +2141,7 @@ static int musb_schedule(
 	qh->hw_ep = hw_ep;
 	qh->hep->hcpriv = qh;
 	if (idle)
-		musb_start_urb(musb, is_in, qh);
+		musb_start_next_urb(musb, is_in, qh);
 	return 0;
 }
 
-- 
2.16.4

