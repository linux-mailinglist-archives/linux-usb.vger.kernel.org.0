Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB81B609E4D
	for <lists+linux-usb@lfdr.de>; Mon, 24 Oct 2022 11:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbiJXJtG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Oct 2022 05:49:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbiJXJtF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Oct 2022 05:49:05 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE5645FF4D
        for <linux-usb@vger.kernel.org>; Mon, 24 Oct 2022 02:48:59 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id q1so8232662pgl.11
        for <linux-usb@vger.kernel.org>; Mon, 24 Oct 2022 02:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XnAGFFH6hlB9GkUsVAF0QK5SQgC3hf7SewwhsiTdnHA=;
        b=5kjelKIaoQNlKa+/O/o1rvz6jyKf6B3J8qwQv7aZhfvbh8k0GyIkH5SOcN2anjY7Ax
         J8s4LN2F2vS0tcd/9WiqQEXXYJINxsEgNo/NSHRFHNx//7ZGecdbOc7YWviJ6LnZVRsF
         uo+Hf5KMVgLFcFwTyyc4jAED5DvhQsI9ZDdbmGF/tg08oMiXUltHu8V73hvJ4RwSgil3
         8eZUqK6P5QEWc2DDKGNb0UAaLu5NmK2x0DyI6kqv9d9RZbclUKwuiruh7nuUov5+/trk
         pLWSTn4ST0wxX7/r0DeAg8KjnefevIOYTSfptQ9OZwWr3fXDhBoks9jqt8B5W+i9Fnhy
         GO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XnAGFFH6hlB9GkUsVAF0QK5SQgC3hf7SewwhsiTdnHA=;
        b=tl21TC6wkayo94nSLmFt+VuS3oGroZkT/enfxTuLPueLvGB1OmCHm9KXKTwqs21wgL
         k5lYBDeeXZWAxoPINK5tbyTDQwZr1HM0DlY8Nb6Ozkj4OjhWtPX8q2K+uZ6VGfeDaAts
         mRl9GQSqc9Hn87Iam7RF3toCWXQfjZ11BsMrxF1gTm5VN8vh8Ugbtc/loH2cSc3XO/GU
         yeIIrSC39lAYHU7fYb1ehVRB54B6ByuA550j6B6bd1SX+XFxisOpTF4Mi7w2ZRVUM+GO
         qKmrKyTFzuQ6boVodiTY09kyUu2VFiWIKRlNQ7c1etPZ9+oafpZL4C8/ekGLsmN0Gf4M
         WaIA==
X-Gm-Message-State: ACrzQf0aoojnJ4gbc9Kg+6XTM5V/mNNmu8yz/nw2JckWa8auVYE5QzGk
        mbMUDXrnYCVB97c3iIz4qJcSIg==
X-Google-Smtp-Source: AMsMyM4HPivtKKPf5IVhM0PGh2Blshb7Bsjuf6zWDIjtnNi6dimHYXQBWA8uy3VdAxqCaibOS/yKGQ==
X-Received: by 2002:a63:34c8:0:b0:46e:f67c:c117 with SMTP id b191-20020a6334c8000000b0046ef67cc117mr5823331pga.401.1666604938609;
        Mon, 24 Oct 2022 02:48:58 -0700 (PDT)
Received: from localhost ([103.136.220.142])
        by smtp.gmail.com with ESMTPSA id p1-20020a62d001000000b0056bc742d21esm1764058pfg.176.2022.10.24.02.48.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Oct 2022 02:48:58 -0700 (PDT)
From:   Lei YU <yulei.sh@bytedance.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Lei YU <yulei.sh@bytedance.com>,
        Henry Tian <tianxiaofeng@bytedance.com>,
        Jakob Koschel <jakobkoschel@gmail.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: aspeed: fix buffer overflow
Date:   Mon, 24 Oct 2022 09:48:53 +0000
Message-Id: <20221024094853.2877441-1-yulei.sh@bytedance.com>
X-Mailer: git-send-email 2.11.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Henry Tian <tianxiaofeng@bytedance.com>

In ast_vhub_epn_handle_ack() when the received data length exceeds the
buffer, it does not check the case and just copies to req.buf and cause
a buffer overflow, kernel oops on this case.

This issue could be reproduced on a BMC with an OS that enables the
lan over USB:
1. In OS, enable the usb eth dev, verify it pings the BMC OK;
2. In OS, set the usb dev mtu to 2000. (Default is 1500);
3. In OS, ping the BMC with `-s 2000` argument.

The BMC kernel will get oops with below logs:

    skbuff: skb_over_panic: text:8058e098 len:2048 put:2048 head:84c678a0 data:84c678c2 tail:0x84c680c2 end:0x84c67f00 dev:usb0
    ------------[ cut here ]------------
    kernel BUG at net/core/skbuff.c:113!
    Internal error: Oops - BUG: 0 [#1] ARM
    CPU: 0 PID: 0 Comm: swapper Not tainted 5.15.69-c9fb275-dirty-d1e579a #1
    Hardware name: Generic DT based system
    PC is at skb_panic+0x60/0x6c
    LR is at irq_work_queue+0x6c/0x94

Fix the issue by checking the length and set `-EOVERFLOW`.

Tested: Verify the BMC kernel does not get oops in the above case, and
the usb ethernet gets RX packets errors instead.

Signed-off-by: Lei YU <yulei.sh@bytedance.com>
Signed-off-by: Henry Tian <tianxiaofeng@bytedance.com>
---
 drivers/usb/gadget/udc/aspeed-vhub/core.c |  2 +-
 drivers/usb/gadget/udc/aspeed-vhub/epn.c  | 16 ++++++++++++----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
index 7a635c499777..ac3ca24f8b04 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -37,7 +37,7 @@ void ast_vhub_done(struct ast_vhub_ep *ep, struct ast_vhub_req *req,
 
 	list_del_init(&req->queue);
 
-	if (req->req.status == -EINPROGRESS)
+	if ((req->req.status == -EINPROGRESS) ||  (status == -EOVERFLOW))
 		req->req.status = status;
 
 	if (req->req.dma) {
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/epn.c b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
index b5252880b389..56e55472daa1 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/epn.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
@@ -84,6 +84,7 @@ static void ast_vhub_epn_handle_ack(struct ast_vhub_ep *ep)
 {
 	struct ast_vhub_req *req;
 	unsigned int len;
+	int status = 0;
 	u32 stat;
 
 	/* Read EP status */
@@ -119,9 +120,15 @@ static void ast_vhub_epn_handle_ack(struct ast_vhub_ep *ep)
 	len = VHUB_EP_DMA_TX_SIZE(stat);
 
 	/* If not using DMA, copy data out if needed */
-	if (!req->req.dma && !ep->epn.is_in && len)
-		memcpy(req->req.buf + req->req.actual, ep->buf, len);
-
+	if (!req->req.dma && !ep->epn.is_in && len) {
+		if (req->req.actual + len > req->req.length) {
+			req->last_desc = 1;
+			status = -EOVERFLOW;
+			goto done;
+		} else {
+			memcpy(req->req.buf + req->req.actual, ep->buf, len);
+		}
+	}
 	/* Adjust size */
 	req->req.actual += len;
 
@@ -129,9 +136,10 @@ static void ast_vhub_epn_handle_ack(struct ast_vhub_ep *ep)
 	if (len < ep->ep.maxpacket)
 		req->last_desc = 1;
 
+done:
 	/* That's it ? complete the request and pick a new one */
 	if (req->last_desc >= 0) {
-		ast_vhub_done(ep, req, 0);
+		ast_vhub_done(ep, req, status);
 		req = list_first_entry_or_null(&ep->queue, struct ast_vhub_req,
 					       queue);
 
-- 
2.11.0

