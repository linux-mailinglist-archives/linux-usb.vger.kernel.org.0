Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 184E6465AB
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2019 19:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbfFNRXJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Jun 2019 13:23:09 -0400
Received: from lnfm1.sai.msu.ru ([93.180.26.255]:50801 "EHLO lnfm1.sai.msu.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725837AbfFNRXI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Jun 2019 13:23:08 -0400
X-Greylist: delayed 2129 seconds by postgrey-1.27 at vger.kernel.org; Fri, 14 Jun 2019 13:23:05 EDT
Received: from dragon.sai.msu.ru (dragon.sai.msu.ru [93.180.26.172])
        by lnfm1.sai.msu.ru (8.14.1/8.12.8) with ESMTP id x5EGlAZb020158;
        Fri, 14 Jun 2019 19:47:15 +0300
Received: from oak.local (unknown [92.243.181.209])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by dragon.sai.msu.ru (Postfix) with ESMTPSA id 7FE5D86C92;
        Fri, 14 Jun 2019 19:47:08 +0300 (MSK)
From:   "Matwey V. Kornilov" <matwey@sai.msu.ru>
To:     b-liu@ti.com, gregkh@linuxfoundation.org, stern@rowland.harvard.edu
Cc:     matwey.kornilov@gmail.com,
        "Matwey V. Kornilov" <matwey@sai.msu.ru>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] usb: musb: Introduce musb_start_urb()
Date:   Fri, 14 Jun 2019 19:45:53 +0300
Message-Id: <20190614164554.27679-6-matwey@sai.msu.ru>
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

This function allows us to start arbitrary urb.

Signed-off-by: Matwey V. Kornilov <matwey@sai.msu.ru>
---
 drivers/usb/musb/musb_host.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index 3a202a2a521d..ed99ecd4e63a 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -213,11 +213,10 @@ static struct musb_qh *musb_ep_get_qh(struct musb_hw_ep *ep, int is_in)
  * Context: controller locked, irqs blocked
  */
 static void
-musb_start_next_urb(struct musb *musb, int is_in, struct musb_qh *qh)
+musb_start_urb(struct musb *musb, int is_in, struct musb_qh *qh, struct urb *urb)
 {
 	u32			len;
 	void __iomem		*mbase =  musb->mregs;
-	struct urb		*urb = next_urb(qh);
 	void			*buf = urb->transfer_buffer;
 	u32			offset = 0;
 	struct musb_hw_ep	*hw_ep = qh->hw_ep;
@@ -293,6 +292,14 @@ musb_start_next_urb(struct musb *musb, int is_in, struct musb_qh *qh)
 	}
 }
 
+static void
+musb_start_next_urb(struct musb *musb, int is_in, struct musb_qh *qh)
+{
+	struct urb *urb = next_urb(qh);
+
+	musb_start_urb(musb, is_in, qh, urb);
+}
+
 /* Context: caller owns controller lock, IRQs are blocked */
 static void musb_giveback(struct musb *musb, struct urb *urb, int status)
 __releases(musb->lock)
-- 
2.16.4

