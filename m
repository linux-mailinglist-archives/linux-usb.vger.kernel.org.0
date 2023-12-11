Return-Path: <linux-usb+bounces-3960-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E5F80C2CC
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 09:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1CEA1C209A9
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 08:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D083720B2E;
	Mon, 11 Dec 2023 08:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BVUNNdi6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E57420B19
	for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 08:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E7EC433C7;
	Mon, 11 Dec 2023 08:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702282316;
	bh=lwg3nYb4h/3ogXtioWhBqB3UFL32bdulqLDfxNytXS4=;
	h=Subject:To:From:Date:From;
	b=BVUNNdi67klPhkt+V+4yazd9Etbi8/qL+pUF931c99MuhHzLDTWb4jzK514o8+Yv9
	 pELHlQA0mWRtgB2L1cVcA6WPA7I3qtFI9ypAkOqLRFG0R/sfgrmrv4jhEi0PJwm7FU
	 a8I7gxckwpjjHREuH6v/nKP4T3dTC5wd+hCm3r9w=
Subject: patch "usb: fotg210-udc: fix function kernel-doc comments" added to usb-next
To: rdunlap@infradead.org,gregkh@linuxfoundation.org,linus.walleij@linaro.org,linux-usb@vger.kernel.org
From: <gregkh@linuxfoundation.org>
Date: Mon, 11 Dec 2023 09:11:45 +0100
Message-ID: <2023121145-mushily-overpass-6cc1@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit


This is a note to let you know that I've just added the patch titled

    usb: fotg210-udc: fix function kernel-doc comments

to my usb git tree which can be found at
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
in the usb-next branch.

The patch will show up in the next release of the linux-next tree
(usually sometime within the next 24 hours during the week.)

The patch will also be merged in the next major kernel release
during the merge window.

If you have any questions about this process, please let me know.


From 51920207674e9e3475a91d2091583889792df99a Mon Sep 17 00:00:00 2001
From: Randy Dunlap <rdunlap@infradead.org>
Date: Wed, 6 Dec 2023 10:13:35 -0800
Subject: usb: fotg210-udc: fix function kernel-doc comments

Correct kernel-doc comments to prevent warnings from
scripts/kernel-doc.

fotg210-udc.c:1103: warning: Function parameter or member 'g' not described in 'fotg210_vbus_session'
fotg210-udc.c:1103: warning: Excess function parameter '_gadget' description in 'fotg210_vbus_session'
fotg210-udc.c:1103: warning: No description found for return value of 'fotg210_vbus_session'
fotg210-udc.c:1129: warning: No description found for return value of 'fotg210_phy_event'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:  <linux-usb@vger.kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Link: https://lore.kernel.org/r/20231206181335.27540-1-rdunlap@infradead.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/fotg210/fotg210-udc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/fotg210/fotg210-udc.c b/drivers/usb/fotg210/fotg210-udc.c
index f7ea84070554..0bae12e34f9a 100644
--- a/drivers/usb/fotg210/fotg210-udc.c
+++ b/drivers/usb/fotg210/fotg210-udc.c
@@ -1094,10 +1094,10 @@ static int fotg210_udc_stop(struct usb_gadget *g)
 
 /**
  * fotg210_vbus_session - Called by external transceiver to enable/disable udc
- * @_gadget: usb gadget
+ * @g: usb gadget
  * @is_active: 0 if should disable UDC VBUS, 1 if should enable
  *
- * Returns 0
+ * Returns: %0
  */
 static int fotg210_vbus_session(struct usb_gadget *g, int is_active)
 {
@@ -1122,7 +1122,7 @@ static const struct usb_gadget_ops fotg210_gadget_ops = {
  *
  * Called by the USB Phy when a cable connect or disconnect is sensed.
  *
- * Returns NOTIFY_OK or NOTIFY_DONE
+ * Returns: NOTIFY_OK or NOTIFY_DONE
  */
 static int fotg210_phy_event(struct notifier_block *nb, unsigned long action,
 			     void *data)
-- 
2.43.0



