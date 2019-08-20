Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B21F7967F1
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2019 19:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729803AbfHTRp0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Aug 2019 13:45:26 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41282 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728360AbfHTRp0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Aug 2019 13:45:26 -0400
Received: by mail-pf1-f195.google.com with SMTP id 196so3808503pfz.8
        for <linux-usb@vger.kernel.org>; Tue, 20 Aug 2019 10:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1mI/fsnxr7SJRcgo+NbhPuqvEtthADzWDuenEYEuutw=;
        b=WYO56BcRaUfZzl1gOuDdMFCvIgKrBAM14lmqr6BUMqMPpMsNtPVYwjuPwb+2Cdc3vc
         lIdsyCEWC5QfSDVo8KFK+qUx/hOgdgm2aBIXcru6VOops555F1ZEolkzSS/iVCPRaUm1
         otmI2omSG0IUJxQI7pIlV04OIbKPqUYyaReWQ1obwyutYxSjTHVYPwIaHhgX57kQZxo7
         aBV/a1hvrQWC8d54OaMKs1NL+ZurhX8CqUDzb5yux6tUGQokxPb1vkqLxuWfvdCkCP0x
         JHW5E6PQK0fNc/9etfFq/U12O7j+ueDIq+tmPYEt0sirVCgFSzaiqd9w2bcp3nB3Owq9
         N2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1mI/fsnxr7SJRcgo+NbhPuqvEtthADzWDuenEYEuutw=;
        b=mt2GUE9ubeeDf3gkkftteLCiMajsjqz4lf9inAepC37caU2/uSq3lRfYIomr2PoteU
         lYeLZfIVZI6w70po4JopGgII7oNeMxqJ+8q+JJyKRnLH3MPWXy0o5C/FIeOHLIMHpZJv
         /Uo2efhOHBojxnYdJYc5+3Mt/mnUO7dvwuYCreUzhhlW4ElN3RsLJOqlqK8HCquEoKBX
         e2B5PMQEkUdIysTvTq0aTWvtlnoaUebrhr4nox+2Voy9MthlJBSCt1w132J1BB5kknLP
         qXN5emdb7a/d8CgjBG4O1ghFobR3rmGi60JqDH7vLGhfZJMH/QDsxKa2V7Mj7At0oQzn
         Wl7A==
X-Gm-Message-State: APjAAAUEcPbQr+VlXiCatwi5IVzEV3bymKpJw7/MOTXgduoEYNwL1XIo
        6XIQlgFO27ifzxhWR2AkA2ef5Q==
X-Google-Smtp-Source: APXvYqy7oTAAl5zE65n3kn58l9U02ciVMZiLy4QXiS3K+51wT2cNIbXx1DyGZYRHcSlxaWgucITIoA==
X-Received: by 2002:a63:f304:: with SMTP id l4mr18303453pgh.66.1566323124945;
        Tue, 20 Aug 2019 10:45:24 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com ([2620:15c:211:200:5404:91ba:59dc:9400])
        by smtp.gmail.com with ESMTPSA id y188sm23403339pfb.115.2019.08.20.10.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 10:45:24 -0700 (PDT)
From:   Mark Salyzyn <salyzyn@android.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, "Yavuz, Tuba" <tuba@ece.ufl.edu>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        stable <stable@vger.kernel.org>, Felipe Balbi <balbi@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: USB: gadget: f_midi: fixing a possible double-free in f_midi
Date:   Tue, 20 Aug 2019 10:45:13 -0700
Message-Id: <20190820174516.255420-1-salyzyn@android.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: "Yavuz, Tuba" <tuba@ece.ufl.edu>

cherry pick from commit 7fafcfdf6377b18b2a726ea554d6e593ba44349f
("USB: gadget: f_midi: fixing a possible double-free in f_midi")
Removing 'return err;' from conflict.

It looks like there is a possibility of a double-free vulnerability on an
error path of the f_midi_set_alt function in the f_midi driver. If the
path is feasible then free_ep_req gets called twice:

         req->complete = f_midi_complete;
         err = usb_ep_queue(midi->out_ep, req, GFP_ATOMIC);
            => ...
             usb_gadget_giveback_request
               =>
                 f_midi_complete (CALLBACK)
                   (inside f_midi_complete, for various cases of status)
                   free_ep_req(ep, req); // first kfree
         if (err) {
                 ERROR(midi, "%s: couldn't enqueue request: %d\n",
                             midi->out_ep->name, err);
                 free_ep_req(midi->out_ep, req); // second kfree
                 return err;
         }

The double-free possibility was introduced with commit ad0d1a058eac
("usb: gadget: f_midi: fix leak on failed to enqueue out requests").

Found by MOXCAFE tool.

Signed-off-by: Tuba Yavuz <tuba@ece.ufl.edu>
Fixes: ad0d1a058eac ("usb: gadget: f_midi: fix leak on failed to enqueue out requests")
Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: stable <stable@vger.kernel.org> # 4.4.y
---
 drivers/usb/gadget/function/f_midi.c | 3 ++-
 drivers/usb/gadget/u_f.h             | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index 5ead414586a1..e5c4a907e5d4 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -366,7 +366,8 @@ static int f_midi_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 		if (err) {
 			ERROR(midi, "%s queue req: %d\n",
 				    midi->out_ep->name, err);
-			free_ep_req(midi->out_ep, req);
+			if (req->buf != NULL)
+				free_ep_req(midi->out_ep, req);
 		}
 	}
 
diff --git a/drivers/usb/gadget/u_f.h b/drivers/usb/gadget/u_f.h
index 69a1d10df04f..3ee365fbc2e2 100644
--- a/drivers/usb/gadget/u_f.h
+++ b/drivers/usb/gadget/u_f.h
@@ -65,7 +65,9 @@ struct usb_request *alloc_ep_req(struct usb_ep *ep, size_t len, int default_len)
 /* Frees a usb_request previously allocated by alloc_ep_req() */
 static inline void free_ep_req(struct usb_ep *ep, struct usb_request *req)
 {
+	WARN_ON(req->buf == NULL);
 	kfree(req->buf);
+	req->buf = NULL;
 	usb_ep_free_request(ep, req);
 }
 
-- 
2.23.0.rc1.153.gdeed80330f-goog

