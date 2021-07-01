Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC9AD3B914B
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jul 2021 13:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236230AbhGALvV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jul 2021 07:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236156AbhGALvU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Jul 2021 07:51:20 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A986AC0617A8
        for <linux-usb@vger.kernel.org>; Thu,  1 Jul 2021 04:48:50 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id f11so3533536plg.0
        for <linux-usb@vger.kernel.org>; Thu, 01 Jul 2021 04:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pQaNAfrD1+BiW8zjIC842Kwk61cOaCg4oH+q5bN0dno=;
        b=AhKo+tPrQzbO5ZwQpxfuq2JRA0a6XmLx8EI9jGOn6GcR2mz6kHKFzyRJ/CbRmNULU5
         ETuhC3MHbyWTAPhssObKl1KibF+nq3qvWhg+QwbVdfRgDg6TX6St8Y22E7kVwA6Q3QXh
         Dl9fDTKBTG9JMVuWer+4IEA2yAxerqye9O8RkomdKRUOGA6S2VTAcosSCXPc4RgywWtg
         ggeyzOsohJbC1diawlqDH0z5M7vSxYLmoSQpFfX7QZ+6hFinGitIvAQl+50SwJMlkTMp
         hcwn5WiVbZ7ekIEM/gYSfNrtd360P5xgnoYd9i/ONrLZYd6LSQifDt5pt/jCthEKm+lM
         vjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pQaNAfrD1+BiW8zjIC842Kwk61cOaCg4oH+q5bN0dno=;
        b=tMK91YCrq9TxSXvTKZ9yzRuoT7PzvaBkwpZ/WK0t7HSzCxRouF36/3TLnt3JMw98pJ
         7ZuFwbQlerfv81y2+wKZYXTIQ9Qazkv0LO1LgffjroHBRybBEc+5BAFuNw4ur9Vkzcr6
         tXnEPsMu5bUu3N/eGqUq2aGofzaooHDJdbyF9urIJ7OYOXfQJng83eTrB3wq0AKAuio1
         y6UwRc+/RJmgRm6r4mGCxCRS4agUM8S5QQM1UNLrJNPfUlailJvdGMclvPUO94tsFh2n
         mV5DDQUZ8ZImu85tHo9tz2lBw7kLTs3j4rJx+E2ByvCR87g9S5/bdGw3QaSsvpNv0HLK
         r00w==
X-Gm-Message-State: AOAM530hk2b02zx6l4wfSNUbgFNObZ3Gh3OPaCzunZrch7UwSmXWxNJM
        QVmppH7YiA4rdEquQct8KHE=
X-Google-Smtp-Source: ABdhPJwR/Ed3ulbMBjEHlZ/e1CVx25d7AwueHWrL3/Ak9g2emxmtZ+0Q/fA94thv1uFAZYxFnGxzoQ==
X-Received: by 2002:a17:90a:ac06:: with SMTP id o6mr19046840pjq.124.1625140130208;
        Thu, 01 Jul 2021 04:48:50 -0700 (PDT)
Received: from athina.mtv.corp.google.com ([2620:15c:211:200:6c1:7d8f:dfdc:fc1e])
        by smtp.gmail.com with ESMTPSA id w2sm24600601pjq.5.2021.07.01.04.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 04:48:49 -0700 (PDT)
From:   =?UTF-8?q?Maciej=20=C5=BBenczykowski?= <zenczykowski@gmail.com>
To:     =?UTF-8?q?Maciej=20=C5=BBenczykowski?= <maze@google.com>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Brooke Basile <brookebasile@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lorenzo Colitti <lorenzo@google.com>
Subject: [PATCH 2/6] usb: gadget: f_ncm: remove spurious boolean timer_stopping
Date:   Thu,  1 Jul 2021 04:48:30 -0700
Message-Id: <20210701114834.884597-2-zenczykowski@gmail.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210701114834.884597-1-zenczykowski@gmail.com>
References: <20210701114834.884597-1-zenczykowski@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Maciej Żenczykowski <maze@google.com>

It is equivalent to ncm->netdev being NULL.

Cc: Brooke Basile <brookebasile@gmail.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lorenzo Colitti <lorenzo@google.com>
Signed-off-by: Maciej Żenczykowski <maze@google.com>
---
 drivers/usb/gadget/function/f_ncm.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index afbe70bc8d6b..e45a938424a4 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -73,7 +73,6 @@ struct f_ncm {
 	struct sk_buff			*skb_tx_ndp;
 	u16				ndp_dgram_count;
 	struct hrtimer			task_timer;
-	bool				timer_stopping;
 };
 
 static inline struct f_ncm *func_to_ncm(struct usb_function *f)
@@ -889,7 +888,6 @@ static int ncm_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 
 		if (ncm->port.in_ep->enabled) {
 			DBG(cdev, "reset ncm\n");
-			ncm->timer_stopping = true;
 			ncm->netdev = NULL;
 			gether_disconnect(&ncm->port);
 			ncm_reset_values(ncm);
@@ -927,7 +925,6 @@ static int ncm_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 			if (IS_ERR(net))
 				return PTR_ERR(net);
 			ncm->netdev = net;
-			ncm->timer_stopping = false;
 		}
 
 		spin_lock(&ncm->lock);
@@ -1157,16 +1154,19 @@ static struct sk_buff *ncm_wrap_ntb(struct gether *port,
 static enum hrtimer_restart ncm_tx_timeout(struct hrtimer *data)
 {
 	struct f_ncm *ncm = container_of(data, struct f_ncm, task_timer);
+	struct net_device *netdev = READ_ONCE(ncm->netdev);
 
 	/* Only send if data is available. */
-	if (!ncm->timer_stopping && ncm->skb_tx_data) {
+	if (netdev && ncm->skb_tx_data) {
 		/* XXX This allowance of a NULL skb argument to ndo_start_xmit
 		 * XXX is not sane.  The gadget layer should be redesigned so
 		 * XXX that the dev->wrap() invocations to build SKBs is transparent
 		 * XXX and performed in some way outside of the ndo_start_xmit
 		 * XXX interface.
+		 *
+		 * This will call directly into u_ether's eth_start_xmit()
 		 */
-		ncm->netdev->netdev_ops->ndo_start_xmit(NULL, ncm->netdev);
+		netdev->netdev_ops->ndo_start_xmit(NULL, netdev);
 	}
 	return HRTIMER_NORESTART;
 }
@@ -1355,7 +1355,6 @@ static void ncm_disable(struct usb_function *f)
 	DBG(cdev, "ncm deactivated\n");
 
 	if (ncm->port.in_ep->enabled) {
-		ncm->timer_stopping = true;
 		ncm->netdev = NULL;
 		gether_disconnect(&ncm->port);
 	}
-- 
2.32.0.93.g670b81a890-goog

