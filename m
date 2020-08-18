Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A241248C3C
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 18:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728475AbgHRQ7V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 12:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728622AbgHRQ7E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Aug 2020 12:59:04 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB77C061389
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 09:59:00 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id e196so22797839ybh.6
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 09:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=o9JIR5P3YJ8yGWm9bzlQRfs81LouvpWibUbieKx2QVI=;
        b=erPbZV0GF/QmzAGkM2ZLKrh5OqgkEH9MKapp+ZOn0UurUQueV4xibTy9lqklSs2SqG
         L4Hb/6e0hAxKCYhDT4IyjvXGtQdI1RpK9GSzSAoBV7yCC5GsJFYHBfO++TOed8V0/jd0
         jW9MnKhEdRQ2ue4Qy/edAo7ttGw4boC8dUKZXXQqv0CWdZ4rV+uweEAQMSpv52JXN4UX
         fhp/dkLnhgskJr2wLN6eZifKTrFkrl9DYqFBn/qdqoIh2/pZOOQm7ewha2EpTaI9xxvd
         yJlwgYbNik+t+8UDxaO/veRQ6qXb5dre1CWy3LSK/b6rKigz6fnCtA25qP9meqtWqpFm
         CCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=o9JIR5P3YJ8yGWm9bzlQRfs81LouvpWibUbieKx2QVI=;
        b=NalQqg2WCidd8CxmbkRum4Iqx56HsmK5s80mTF+AnnsxL5+9xaZ6WHeRCwwSR3VenJ
         KQE1DgoI7B8Y+s5mnpI0kPdzvsJGgKi1Ey0UVc1bcKzD9xyC8T5CEE+OAtS2SUZqgc8h
         WpYGTpEXvIV6eJB8bJMCASXo5cnqlVZ7G3inPmPotwGNRO8uzjf7uLAKUnnNWw0r4yu9
         jdgjC0mlD37/dzP/O9Sd6hbNI8ufXr6DLWF1cKvaYPlTTbrWvGJ0+BBMw+T/E7C8C5uy
         PqDoaaFMCdy9y058opYyzevpxvTpDutOZQcIiFmt5MKJ4ba1zghoVB1o5IwRBF56LQ2M
         dXYA==
X-Gm-Message-State: AOAM533NwHfnZTj7qbzbJnOESQ64ABfxpdlJWL+83xxfSEp58X/37EiZ
        q766CggNppMWcauYTT5kQHuzI1e8Z+U647I4lDbVMkRwGpF75BaK7amtt+m1lBoLgtOXwrJUoTM
        3H/7ixjnwZhwyXYzWtgzFT9qGE8sxc6toL35USRkajde5+Y2eNfO0ACexeidnXau2oOin
X-Google-Smtp-Source: ABdhPJyfitNCesM5cOHJkJpKWrV6GNClGCzG9qsfZ1py5ry9HqzrpEZw+xNGOwERl1NSKRRGq38TK1+AmXlU
X-Received: by 2002:a25:5755:: with SMTP id l82mr30677619ybb.175.1597769939743;
 Tue, 18 Aug 2020 09:58:59 -0700 (PDT)
Date:   Wed, 19 Aug 2020 01:58:46 +0900
Message-Id: <20200818165848.4117493-1-lorenzo@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
Subject: [PATCH v2 1/3] usb: gadget: f_ncm: fix ncm_bitrate for SuperSpeed and above.
From:   Lorenzo Colitti <lorenzo@google.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        zenczykowski@gmail.com, Lorenzo Colitti <lorenzo@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently, SuperSpeed NCM gadgets report a speed of 851 Mbps
in USB_CDC_NOTIFY_SPEED_CHANGE. But the calculation appears to
assume 16 packets per microframe, and USB 3 and above no longer
use microframes.

Maximum speed is actually much higher. On a direct connection,
theoretical throughput is about 3.86 Gbps for gen1x1 and
9.35 Gbps for gen2x1, and I have seen gadget->host speeds
>2 Gbps for gen1x1 and >4 Gbps for gen2x1.

Unfortunately the ConnectionSpeedChange defined in the CDC spec
only uses 32-bit values, so we can't report accurate numbers for
10Gbps and above. So always report a speed of 4 Gbps, which is
close enough to the technical maximum of a 5 Gbps link.

This results in:

[96033.958723] cdc_ncm 8-2:1.0 enx4643f5db6f40: renamed from usb0
[96033.997136] cdc_ncm 8-2:1.0 enx4643f5db6f40: 4000 mbit/s downlink 4000 mbit/s uplink

Fixes: 1650113888fe ("usb: gadget: f_ncm: add SuperSpeed descriptors for CDC NCM")
Signed-off-by: Lorenzo Colitti <lorenzo@google.com>
---
 drivers/usb/gadget/function/f_ncm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 1d900081b1..0c073df225 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -85,8 +85,8 @@ static inline struct f_ncm *func_to_ncm(struct usb_function *f)
 /* peak (theoretical) bulk transfer rate in bits-per-second */
 static inline unsigned ncm_bitrate(struct usb_gadget *g)
 {
-	if (gadget_is_superspeed(g) && g->speed == USB_SPEED_SUPER)
-		return 13 * 1024 * 8 * 1000 * 8;
+	if (gadget_is_superspeed(g) && g->speed >= USB_SPEED_SUPER)
+		return 4000000000;
 	else if (gadget_is_dualspeed(g) && g->speed == USB_SPEED_HIGH)
 		return 13 * 512 * 8 * 1000 * 8;
 	else
-- 
2.28.0.220.ged08abb693-goog

