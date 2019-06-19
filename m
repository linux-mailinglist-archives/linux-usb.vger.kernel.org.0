Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8A274B23F
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2019 08:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfFSGlQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jun 2019 02:41:16 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.116]:55344 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725892AbfFSGlQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jun 2019 02:41:16 -0400
Received: from [67.219.250.195] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-b.us-west-2.aws.symcld.net id 91/8B-12524-A09D90D5; Wed, 19 Jun 2019 06:41:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRWlGSWpSXmKPExsVySpdNU5frJme
  swd/dbBaLlrUyOzB6fN4kF8AYxZqZl5RfkcCacfHDW6aC61wVN273sDcwtnN2MXJxCAlsZpRo
  nt/M2sXIycEmYCqxcu4+FhBbREBeYtbbi4wgtrCAn0TD2Q6wOIuAqsSDLeuZQGxegQCJXwuOg
  dVICMhJnDw2mRUiLihxcuYTsHpmAQmJgy9eMIPYQgK6Epfn/2OfwMg1C0nZLCRlCxiZVjFaJB
  VlpmeU5CZm5ugaGhjoGhoa6RoamwDZJnqJVbpJeqXFuuWpxSW6RnqJ5cV6xZW5yTkpenmpJZs
  YgUGRUtCWsYNx9pHXeocYJTmYlER593ZyxgrxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4D1zDSgn
  WJSanlqRlpkDDFCYtAQHj5IIr9Z1oDRvcUFibnFmOkTqFKOilDhvKEhCACSRUZoH1waLikuMs
  lLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHkXgUzhycwrgZv+CmgxE9DiR0vZQBaXJCKkpBqYCm
  a67jy60yBDr7GfN6l1mUnsvjiB1Aidi78+hjut+yv9fPIsVnsl4bXlze9Kc+6/Pd564uPuszM
  P/DzDHejuu8Opp7VqTrXs5MvLPh8RnWc8ZZIZa5RW2XK+G3r1kW/Ep/StOnGqcu2uaT96p05i
  +n760L01r/KZ5PSPP1xZX7GuTD+B5cQR9lcTPW9rR1m8K1FI+rO+8OY/3U6ppD5Gh5hS2RWvn
  0sHzg8UbJLq8NtxXtVaoMb72P7+hbrPLVg4LRc4/Az5/OfNDYOA72ZLfvvV8TdEKya8b9h1r6
  ROI/5/3AHlFbelc1/1np/tVD+jcs3MPO9Ky8e7LJu2Xk/3O/TMcqrHfeOsDHMG2c/LlFiKMxI
  NtZiLihMBqb7WNQUDAAA=
X-Env-Sender: Kiruthika.Varadarajan@harman.com
X-Msg-Ref: server-33.tower-343.messagelabs.com!1560926471!65188!1
X-Originating-IP: [202.45.6.41]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30780 invoked from network); 19 Jun 2019 06:41:13 -0000
Received: from unknown (HELO HIBDWSMB10.ad.harman.com) (202.45.6.41)
  by server-33.tower-343.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 19 Jun 2019 06:41:13 -0000
Received: from hiawsmblxbld30.ad.harman.com (10.46.128.17) by
 HIBDWSMB10.ad.harman.com (10.99.236.104) with Microsoft SMTP Server id
 15.0.1365.1; Wed, 19 Jun 2019 12:11:10 +0530
From:   kvaradarajan <Kiruthika.Varadarajan@harman.com>
To:     <linux-usb@vger.kernel.org>
Subject: [PATCH]  USB/Gadget: Fix race between gether_disconnect and rx_submit
Date:   Wed, 19 Jun 2019 06:41:10 +0000
Message-ID: <1560926470-15092-1-git-send-email-Kiruthika.Varadarajan@harman.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

  On spin lock release in rx_submit, gether_disconnect get
  a chance to run, it makes port_usb NULL, rx_submit access
  NULL port USB, hence null pointer crash.

  Fixed by releasing the lock in rx_submit after port_usb
  is used.

Signed-off-by: KVaradarajan <Kiruthika.Varadarajan@harman.com>
---
 drivers/usb/gadget/function/u_ether.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index 737bd77..76cf1e4 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -186,11 +186,11 @@ static void defer_kevent(struct eth_dev *dev, int flag)
 		out = dev->port_usb->out_ep;
 	else
 		out = NULL;
-	spin_unlock_irqrestore(&dev->lock, flags);
 
-	if (!out)
+	if (!out) {
+		spin_unlock_irqrestore(&dev->lock, flags);
 		return -ENOTCONN;
-
+	}
 
 	/* Padding up to RX_EXTRA handles minor disagreements with host.
 	 * Normally we use the USB "terminate on short read" convention;
@@ -215,6 +215,7 @@ static void defer_kevent(struct eth_dev *dev, int flag)
 	if (dev->port_usb->is_fixed)
 		size = max_t(size_t, size, dev->port_usb->fixed_out_len);
 
+	spin_unlock_irqrestore(&dev->lock, flags);
 	skb = __netdev_alloc_skb(dev->net, size + NET_IP_ALIGN, gfp_flags);
 	if (skb == NULL) {
 		DBG(dev, "no rx skb\n");
-- 
1.9.1

