Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9A1F1D1CD3
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 20:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390034AbgEMSBw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 14:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2390029AbgEMSBv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 May 2020 14:01:51 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54F47C061A0E
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2020 11:01:50 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id n7so579843ybh.13
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2020 11:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=5/MRceWyn7IA9pmXU1Ty874NROsCdfVXPSq0u2J/dn0=;
        b=cyEJYbuoTCZwv/JsnJBEdVmnQ08+rJVCHUfnXpjw128J6smQ4hrmkq2g50efB/eedA
         XV5xHOXTYGeGEuee1G7pe2Zpw8/80UZC50cT2fcIuXIaiCx+GaAFketbc4CGpNGGP87V
         mQcTySPjLpKyPF9jyRn9Q5QgBn3IXJZITq3QDXPao4y5YJjgT6jbCvHHdrO2y8IlLX/U
         lRmnImSFuOZRaRV1omRTFJeKCK5o+Wk6KdmJ8kUGU6ROsMKa0GoQlN1oenuJ30Ne0B1z
         uUpnTabyDpe1JCNnMheGtM8SA/UHb95RHyKxn59/KD3i0o/zmRrg11F7PSx395ghxN9b
         lQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=5/MRceWyn7IA9pmXU1Ty874NROsCdfVXPSq0u2J/dn0=;
        b=QWw+YzF/wjDMp94ZbAywHLNVggqpIWDo8LA+eBmeJWVJZeG8gEFPNwdOfNywnBQ64g
         vuAkv4vEskG1jApAiPwasynDZrIg2Mvj7N/yRFFKboTasplH0/2kucVHtyPix7LZGBZ8
         hXVUxFgilg4qrLfNdWq7k69kZpHBF7iDgJFux55qbQe70ufesOyiMA5apNBD1QDtcCsw
         hDtm5awDdWUAEbSMwkIWv5X6kglHruZ8Y0BYaCvNpQEP63mi1ZlC66btL9+HaWk4U8Np
         aBk7yDH1O6tHXUzXHIR9Xxvd7S8G87QtA28x+4vQnJf1jP/eM0NAf6C8onaNu2dnjX3f
         FOQw==
X-Gm-Message-State: AOAM532j9u3vBPqr5iPLtyd//f2w0cCWFRyNwaI9NQwA0oavg/oUJid0
        qXl9z0qwxPFApHitwJTDqyniZJZojyXEcrGZ
X-Google-Smtp-Source: ABdhPJzByBrBAtuTVt//2PEhmGvansFFvV+KulV8oXted/AGzBiO6VtlMfXhTAQAalvYmvNwUeaRobr214loYVWO
X-Received: by 2002:a25:d084:: with SMTP id h126mr361526ybg.424.1589392909379;
 Wed, 13 May 2020 11:01:49 -0700 (PDT)
Date:   Wed, 13 May 2020 20:01:42 +0200
Message-Id: <76557d920a125f6e42b3dc46d3ae84bffbe9a2f9.1589392709.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
Subject: [PATCH USB] usb: raw-gadget: fix null-ptr-deref when reenabling endpoints
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently we preassign gadget endpoints to raw-gadget endpoints during
initialization. Fix resetting this assignment in raw_ioctl_ep_disable(),
otherwise we will get null-ptr-derefs when an endpoint is reenabled.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---

Felipe, this is technically a fix for "usb: raw-gadget: fix gadget
endpoint selection", which AFAICS is already in your testing/fixes tree.
Please let me know if you would like me resend that patch with this fix
folded in.

---
 drivers/usb/gadget/legacy/raw_gadget.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index d73ba77014c8..e01e366d89cd 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -867,7 +867,6 @@ static int raw_ioctl_ep_disable(struct raw_dev *dev, unsigned long value)
 	spin_lock_irqsave(&dev->lock, flags);
 	usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
 	kfree(dev->eps[i].ep->desc);
-	dev->eps[i].ep = NULL;
 	dev->eps[i].state = STATE_EP_DISABLED;
 	dev->eps[i].disabling = false;
 
-- 
2.26.2.645.ge9eca65c58-goog

