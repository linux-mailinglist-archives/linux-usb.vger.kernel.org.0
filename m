Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE013A7294
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jun 2021 01:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbhFNXn7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Jun 2021 19:43:59 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:48928 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229689AbhFNXn7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 14 Jun 2021 19:43:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623714116; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=ibeoOv7R2fFr7c9P5sK8mLpBRVjlFyC7DS3rMGgAaIo=; b=xK0Ibivji51+W7BZqHgjg1PRQbOSMGqZ0UhRA/hY5E0yD2mu3e5QlvmN3xz0YxZ6gLjjHc2G
 Wua4oiGif2Qwu9LtEBCEkGw6Pi9sv8uUngj8xhVCTLEXHuGfzwKjNqo4iD92Q8Hwr5MPm1bf
 hCc5YjKgb6Hj6P37zK3+/7KfoRE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60c7e941abfd22a3dc2b41fd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Jun 2021 23:41:53
 GMT
Sender: linyyuan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E2340C4338A; Mon, 14 Jun 2021 23:41:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from localhost.localdomain (unknown [101.87.142.17])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: linyyuan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D214C433D3;
        Mon, 14 Jun 2021 23:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6D214C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=linyyuan@codeaurora.org
From:   Linyu Yuan <linyyuan@codeaurora.org>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Linyu Yuan <linyyuan@codeaurora.com>
Subject: [PATCH v2] usb: gadget: eem: fix echo command packet response issue
Date:   Tue, 15 Jun 2021 07:41:33 +0800
Message-Id: <20210614234133.17708-1-linyyuan@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Linyu Yuan <linyyuan@codeaurora.com>

when receive eem echo command, it will send a response,
but queue this response to the usb request which allocate
from gadget device endpoint zero,
and transmit the request to IN endpoint of eem interface.

on dwc3 gadget, it will trigger following warning in function
__dwc3_gadget_ep_queue(),

	if (WARN(req->dep != dep, "request %pK belongs to '%s'\n",
				&req->request, req->dep->name))
		return -EINVAL;

fix it by allocating a usb request from IN endpoint of eem interface,
and transmit the usb request to same IN endpoint of eem interface.

Signed-off-by: Linyu Yuan <linyyuan@codeaurora.com>
---

v2: fix mail format and expand commit message

 drivers/usb/gadget/function/f_eem.c | 44 +++++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/f_eem.c b/drivers/usb/gadget/function/f_eem.c
index 2cd9942707b4..7de355c63189 100644
--- a/drivers/usb/gadget/function/f_eem.c
+++ b/drivers/usb/gadget/function/f_eem.c
@@ -30,6 +30,11 @@ struct f_eem {
 	u8				ctrl_id;
 };
 
+struct in_context {
+	struct sk_buff	*skb;
+	struct usb_ep	*ep;
+};
+
 static inline struct f_eem *func_to_eem(struct usb_function *f)
 {
 	return container_of(f, struct f_eem, port.func);
@@ -320,9 +325,12 @@ static int eem_bind(struct usb_configuration *c, struct usb_function *f)
 
 static void eem_cmd_complete(struct usb_ep *ep, struct usb_request *req)
 {
-	struct sk_buff *skb = (struct sk_buff *)req->context;
+	struct in_context *ctx = req->context;
 
-	dev_kfree_skb_any(skb);
+	dev_kfree_skb_any(ctx->skb);
+	kfree(req->buf);
+	usb_ep_free_request(ctx->ep, req);
+	kfree(ctx);
 }
 
 /*
@@ -410,7 +418,9 @@ static int eem_unwrap(struct gether *port,
 		 * b15:		bmType (0 == data, 1 == command)
 		 */
 		if (header & BIT(15)) {
-			struct usb_request	*req = cdev->req;
+			struct usb_request	*req;
+			struct in_context	*ctx;
+			struct usb_ep		*ep;
 			u16			bmEEMCmd;
 
 			/* EEM command packet format:
@@ -439,13 +449,37 @@ static int eem_unwrap(struct gether *port,
 				skb_trim(skb2, len);
 				put_unaligned_le16(BIT(15) | BIT(11) | len,
 							skb_push(skb2, 2));
+
+				ep = port->in_ep;
+				req = usb_ep_alloc_request(ep, GFP_ATOMIC);
+				if (!req)
+					goto freeskb;
+
+				ctx = kmalloc(sizeof(*ctx), GFP_KERNEL);
+				if (!ctx)
+					goto freereq;
+				ctx->skb = skb2;
+				ctx->ep = ep;
+
+				req->buf = kmalloc(skb2->len, GFP_KERNEL);
+				if (!req->buf)
+					goto freectx;
+
 				skb_copy_bits(skb2, 0, req->buf, skb2->len);
 				req->length = skb2->len;
 				req->complete = eem_cmd_complete;
 				req->zero = 1;
-				req->context = skb2;
-				if (usb_ep_queue(port->in_ep, req, GFP_ATOMIC))
+				req->context = ctx;
+				if (usb_ep_queue(ep, req, GFP_ATOMIC)) {
 					DBG(cdev, "echo response queue fail\n");
+					kfree(req->buf);
+freectx:
+					kfree(ctx);
+freereq:
+					usb_ep_free_request(ep, req);
+freeskb:
+					dev_kfree_skb_any(skb2);
+				}
 				break;
 
 			case 1:  /* echo response */
-- 
2.25.1

