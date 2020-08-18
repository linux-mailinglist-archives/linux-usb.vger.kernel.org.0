Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13029248B5E
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 18:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbgHRQUF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 12:20:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727072AbgHRQT5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Aug 2020 12:19:57 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3F4DC061389
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 09:19:56 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id a14so22436299ybm.13
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 09:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=LaaiD2NvJ2Oni+LApCz/kL4upEs0zw6Yc4h/B7X/6Yk=;
        b=YG7wObR8jGVAeTTRg+gRnL221xQtDwa/W2lNE5ItV8sroaUx2O1/3OaCgTnzcfoQ5f
         tazjQtxWTzfUoH+ZnXkQTVsaLwAFPncWdUMoLrXiiMfK0Pv8PX3wc6C9axWqZfq8AUWz
         1F7hZ7/rtZLNROTrWfMBKFpL4ceolqBbImXkpu2sYR+oCr2lJF6KIDBHvrRF4tA+TUAW
         X0aJBfpSg+2R6oHmSyso8XhArcTLTm4+eQu2oOXFUjnA6b9Xe8oG1R343JbGdIrFis1Q
         4K7OP438eV6WVTES5IC+YdXBpSYmPS/kcMY508rHqiPvlk4p9uE9T4YO4klxYOJfSKeQ
         X3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=LaaiD2NvJ2Oni+LApCz/kL4upEs0zw6Yc4h/B7X/6Yk=;
        b=BAu1iNLRhRYosfM0pIlwK7EyXG1TS9SFQtOZ1D/vCYfI5CrR/PPYhCalr84tiNlaBG
         RN//n6j9O/FoAt38BQ+vAhJBxEdJ5Pc3nUOElToOi/h3PMChAF4v3wVxPA9hi7Ksg3SX
         p9U+g3JSzeEoatM07FXER+/9Ozv79r/EHmsTEB8f2JdLAVmCsIcQo6E70Q0eyJ3eUdcT
         aIPxXce1std7wILUz2L8fITHnn3PKdXBvesLciaKSx3bDQ/x4qzuV6A2ZVSgoLHLo0sa
         REMVuJ5WTPt5EqgwXzge6kGBEB+Qh/OtsSsm+pZn5XXcqn6IfHmZdxr0aa+WrCGrkMbP
         OF5g==
X-Gm-Message-State: AOAM532OhZSUknnXrhiAttv3g5MzvEolxt+OMWE9J0l70RzIBEbcL++C
        WSk5jw4uwZQ17+rT+qpi5ipXA5Pubn6etVP6WnjxX2LvXg3ngTMihx4/Uvi7ssYj0gMsrZXhgUp
        EeR/aMBUiEOVJSQoy3PFE2qJZTPz2HMy+qtZaRyAdHM4Fp58DE9oiit34ADiP+5tUgByF
X-Google-Smtp-Source: ABdhPJzR1jgVn51OBvx8CeAkUv4gBjVfwEpK7DUUZ8BhvZgQHxgMm4VUruclu9wOsYdqma9fD8zgIuWy9HGc
X-Received: by 2002:a25:9742:: with SMTP id h2mr26283477ybo.430.1597767595803;
 Tue, 18 Aug 2020 09:19:55 -0700 (PDT)
Date:   Wed, 19 Aug 2020 01:19:49 +0900
Message-Id: <20200818161949.4083551-1-lorenzo@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
Subject: [PATCH v2] usb: gadget: u_ether: enable qmult on SuperSpeed Plus as well
From:   Lorenzo Colitti <lorenzo@google.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        zenczykowski@gmail.com, Lorenzo Colitti <lorenzo@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The u_ether driver has a qmult setting that multiplies the
transmit queue length (which by default is 2).

The intent is that it should be enabled at high/super speed, but
because the code does not explicitly check for USB_SUPER_PLUS,
it is disabled at that speed.

Fix this by ensuring that the queue multiplier is enabled for any
wired link at high speed or above. Using >= for USB_SPEED_*
constants seems correct because it is what the gadget_is_xxxspeed
functions do.

The queue multiplier substantially helps performance at higher
speeds. On a direct SuperSpeed Plus link to a Linux laptop,
iperf3 single TCP stream:

Before (qmult=1): 1.3 Gbps
After  (qmult=5): 3.2 Gbps

Fixes: 04617db7aa68 ("usb: gadget: add SS descriptors to Ethernet gadget")
Signed-off-by: Lorenzo Colitti <lorenzo@google.com>
---
 drivers/usb/gadget/function/u_ether.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index c3cc6bd14e..31ea76adcc 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -93,7 +93,7 @@ struct eth_dev {
 static inline int qlen(struct usb_gadget *gadget, unsigned qmult)
 {
 	if (gadget_is_dualspeed(gadget) && (gadget->speed == USB_SPEED_HIGH ||
-					    gadget->speed == USB_SPEED_SUPER))
+					    gadget->speed >= USB_SPEED_SUPER))
 		return qmult * DEFAULT_QLEN;
 	else
 		return DEFAULT_QLEN;
-- 
2.28.0.220.ged08abb693-goog

