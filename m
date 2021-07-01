Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB2253B914A
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jul 2021 13:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236228AbhGALvV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jul 2021 07:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236130AbhGALvU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Jul 2021 07:51:20 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C3AC061756
        for <linux-usb@vger.kernel.org>; Thu,  1 Jul 2021 04:48:49 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id q91so4074134pjk.3
        for <linux-usb@vger.kernel.org>; Thu, 01 Jul 2021 04:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lpaGKIfyLotOD36A3J8tLBkizc/zHMCbTaKmzPfSrgQ=;
        b=ueOYvU52At0+tVr7coSSaqJqRS7I5oG79u3+xEEYKH5i0WaINE94BcFkZaqO5+u0E6
         HqSpfcgi618OEOnSw3uFw6i060aq+humVt4Bp3xrAKo59NkQQ+W066+1gyBQD4dVOJ6G
         /XnMvDf35QhoVDZUFEjqW5c70gnW/2ia2d8EYb8utENdlvfsjsxRTrH9vXXeLf+HnM9W
         p9MeqOUGrFOpw812WzkiPVm4tYgVEGUfBQCPzOEex51wtTi4/t7jbgGHDLZaCEudBBBw
         xnvsxwuWuDqrGuo73hPVh5Ar7zfEr5zpotOd7klWuhFc6hSWP4c4TLPmRJX9nFiOWPy7
         qGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lpaGKIfyLotOD36A3J8tLBkizc/zHMCbTaKmzPfSrgQ=;
        b=O3IyUrmBPBzDxnpDekrza3vUuyX2BvnLQafAsB0jdzOGQE81HS9MrdJ+pwCWjELqiH
         JWCNJNBnbuYiXxF0Q37aoeX5nH5Rw77n0FkJXEzKBDCqYCbIyQbI/q4WeYDLPquV4FS6
         ABUr9L721o2v4AtO2FJNLQ/+j2M6E63VP3Sn0rg3dWp5TxcTzczMhNamsoNwUbUeZYmv
         iuLhj3HbyufAPffr3YpKWj7fLxdAPm7AWqzVhZJVHTN7Yi9AfaR255bb486gYNdd/fH8
         Apqz108S7TGIl7f9U4WNIaQqoNpHyajnL90V7J9WD8JfkykAHSkzUIwvSgVDJp1t2dDL
         bafg==
X-Gm-Message-State: AOAM531AqBdJFrytz+Tu8PFLfO4z9fXsiiVNw/p3gmiqXftytn2b/2DA
        /5vEZMFueOlHLr4ykWUn/jg=
X-Google-Smtp-Source: ABdhPJwl7QKIFoq4gfTK3OUAsOpweN/e4d+Sx+SzkM6HgazimlQRTKABSgIbb0/a6FPaAyZ0BndFpw==
X-Received: by 2002:a17:902:ecc6:b029:128:ed8c:a025 with SMTP id a6-20020a170902ecc6b0290128ed8ca025mr15594177plh.64.1625140128822;
        Thu, 01 Jul 2021 04:48:48 -0700 (PDT)
Received: from athina.mtv.corp.google.com ([2620:15c:211:200:6c1:7d8f:dfdc:fc1e])
        by smtp.gmail.com with ESMTPSA id w2sm24600601pjq.5.2021.07.01.04.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 04:48:48 -0700 (PDT)
From:   =?UTF-8?q?Maciej=20=C5=BBenczykowski?= <zenczykowski@gmail.com>
To:     =?UTF-8?q?Maciej=20=C5=BBenczykowski?= <maze@google.com>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Brooke Basile <brookebasile@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lorenzo Colitti <lorenzo@google.com>
Subject: [PATCH 1/6] usb: gadget: f_ncm: remove timer_force_tx field
Date:   Thu,  1 Jul 2021 04:48:29 -0700
Message-Id: <20210701114834.884597-1-zenczykowski@gmail.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Maciej Żenczykowski <maze@google.com>

It is simply not needed.  This field is equivalent to skb being NULL.

Currently with the boolean set to true we call:
  ncm->netdev->netdev_ops->ndo_start_xmit(NULL, ncm->netdev);
which calls u_ether's:
  eth_start_xmit(NULL, ...)
which then calls:
  skb = dev->wrap(dev->port_usb, NULL);
which calls back into f_ncm's:
  ncm_wrap_ntb(..., NULL)

Cc: Brooke Basile <brookebasile@gmail.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lorenzo Colitti <lorenzo@google.com>
Signed-off-by: Maciej Żenczykowski <maze@google.com>
---
 drivers/usb/gadget/function/f_ncm.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 855127249f24..afbe70bc8d6b 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -72,7 +72,6 @@ struct f_ncm {
 	struct sk_buff			*skb_tx_data;
 	struct sk_buff			*skb_tx_ndp;
 	u16				ndp_dgram_count;
-	bool				timer_force_tx;
 	struct hrtimer			task_timer;
 	bool				timer_stopping;
 };
@@ -1126,8 +1125,11 @@ static struct sk_buff *ncm_wrap_ntb(struct gether *port,
 		dev_consume_skb_any(skb);
 		skb = NULL;
 
-	} else if (ncm->skb_tx_data && ncm->timer_force_tx) {
-		/* If the tx was requested because of a timeout then send */
+	} else if (ncm->skb_tx_data) {
+		/* If we get here ncm_wrap_ntb() was called with NULL skb,
+		 * because eth_start_xmit() was called with NULL skb by
+		 * ncm_tx_timeout() - hence, this is our signal to flush/send.
+		 */
 		skb2 = package_for_tx(ncm);
 		if (!skb2)
 			goto err;
@@ -1158,8 +1160,6 @@ static enum hrtimer_restart ncm_tx_timeout(struct hrtimer *data)
 
 	/* Only send if data is available. */
 	if (!ncm->timer_stopping && ncm->skb_tx_data) {
-		ncm->timer_force_tx = true;
-
 		/* XXX This allowance of a NULL skb argument to ndo_start_xmit
 		 * XXX is not sane.  The gadget layer should be redesigned so
 		 * XXX that the dev->wrap() invocations to build SKBs is transparent
@@ -1167,8 +1167,6 @@ static enum hrtimer_restart ncm_tx_timeout(struct hrtimer *data)
 		 * XXX interface.
 		 */
 		ncm->netdev->netdev_ops->ndo_start_xmit(NULL, ncm->netdev);
-
-		ncm->timer_force_tx = false;
 	}
 	return HRTIMER_NORESTART;
 }
-- 
2.32.0.93.g670b81a890-goog

