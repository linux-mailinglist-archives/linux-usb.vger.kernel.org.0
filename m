Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 099EE1359E1
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2020 14:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730730AbgAINRC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jan 2020 08:17:02 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42288 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729237AbgAINRB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jan 2020 08:17:01 -0500
Received: by mail-wr1-f68.google.com with SMTP id q6so7326473wro.9
        for <linux-usb@vger.kernel.org>; Thu, 09 Jan 2020 05:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cw0YAnK06txM/JsrjQ+gtJRtA2/PXI58iStpISQaGi0=;
        b=PnOflMOOcnWRx3hUQ6D0AwQJUdeP5krpDqFFKN7HDTxpMD6/N2c/qdLBEveCH0irfj
         Eg3OnJumPG4H8a+d65Cziey5bqcpF+Dny+3AqVOZ+CitWhW9TCrToGS5V2I0euhuNqbn
         6EHbnHzBrpjh3tZd/jYf1jRWeNoQADbpcxQLnjEgDOAt0RBQktrxhnOwIzx2EuGBHRPW
         zF6XfsUX4NFsDiPz5qfI9OTg2hN66t5f+pntQTiXJHIsAKPyWEbiSuX/LeBbTnovIeFE
         ZWEi56LWMCfvRtZCdgaqkWpScA/J5ooQoBpl1lOpviTYYN4JuGnHRmK03EbCPwCoQyi5
         ApmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cw0YAnK06txM/JsrjQ+gtJRtA2/PXI58iStpISQaGi0=;
        b=DowQt2WqrXkEoUiG8SPT3EeeYJre6BYZUNvuxube/YSngJEdp+dThAbDH2BRQnYa6n
         CzZ0ugnrUQJG7PXYTsUnoXZBBsD+QP+MiS4D8MIFd6WomOdy7sm8K2Jc+cKvcsKVes3/
         xQi0STR7SlACknrJ47yBIT9sm+mPlKhjcUZFCHJfynQlR3CSTG8oS0lQhQHPmpbV6Itu
         /1KnqYt0FGns2WiL8IOHQbOFqOR6I7dgg8pkyDrNalsgzbeP3F1LAa26BDVFyKM32spT
         N2cKv94WZDTkjxzp4MOaD9HPoCVzD4ZLw1aHe0P2Ert9JlV9YzNUFs0I7HUfwlprtWDH
         Scxg==
X-Gm-Message-State: APjAAAW7YCekNHVQzHpp5dDyi1JnHCxy0Q8AWbxZ69CBYm2DrIV1GMcK
        fASmqkQwqcXQn6ytr9D1Ua8OGKVHoW8=
X-Google-Smtp-Source: APXvYqwzvjxqez9GknsRtXqXmkLrtMB5BUvUCUvukArwsdIzX2tRl7fPf86bgHdvFU2YN7WxsHUKDw==
X-Received: by 2002:adf:b648:: with SMTP id i8mr11163272wre.91.1578575819762;
        Thu, 09 Jan 2020 05:16:59 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id u22sm8172989wru.30.2020.01.09.05.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 05:16:59 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 2/2] usb: gadget: f_ecm: Use atomic_t to track in-flight request
Date:   Thu,  9 Jan 2020 13:17:22 +0000
Message-Id: <20200109131722.4090238-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200109131722.4090238-1-bryan.odonoghue@linaro.org>
References: <20200109131722.4090238-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently ecm->notify_req is used to flag when a request is in-flight.
ecm->notify_req is set to NULL and when a request completes it is
subsequently reset.

This is fundamentally buggy in that the unbind logic of the ECM driver will
unconditionally free ecm->notify_req leading to a NULL pointer dereference.

Fixes: da741b8c56d61 ("usb ethernet gadget: split CDC Ethernet function")

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/gadget/function/f_ecm.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
index 460d5d7c984f..7f5cf488b2b1 100644
--- a/drivers/usb/gadget/function/f_ecm.c
+++ b/drivers/usb/gadget/function/f_ecm.c
@@ -52,6 +52,7 @@ struct f_ecm {
 	struct usb_ep			*notify;
 	struct usb_request		*notify_req;
 	u8				notify_state;
+	atomic_t			notify_count;
 	bool				is_open;
 
 	/* FIXME is_open needs some irq-ish locking
@@ -380,7 +381,7 @@ static void ecm_do_notify(struct f_ecm *ecm)
 	int				status;
 
 	/* notification already in flight? */
-	if (!req)
+	if (atomic_read(&ecm->notify_count))
 		return;
 
 	event = req->buf;
@@ -420,10 +421,10 @@ static void ecm_do_notify(struct f_ecm *ecm)
 	event->bmRequestType = 0xA1;
 	event->wIndex = cpu_to_le16(ecm->ctrl_id);
 
-	ecm->notify_req = NULL;
+	atomic_inc(&ecm->notify_count);
 	status = usb_ep_queue(ecm->notify, req, GFP_ATOMIC);
 	if (status < 0) {
-		ecm->notify_req = req;
+		atomic_dec(&ecm->notify_count);
 		DBG(cdev, "notify --> %d\n", status);
 	}
 }
@@ -448,17 +449,19 @@ static void ecm_notify_complete(struct usb_ep *ep, struct usb_request *req)
 	switch (req->status) {
 	case 0:
 		/* no fault */
+		atomic_dec(&ecm->notify_count);
 		break;
 	case -ECONNRESET:
 	case -ESHUTDOWN:
+		atomic_set(&ecm->notify_count, 0);
 		ecm->notify_state = ECM_NOTIFY_NONE;
 		break;
 	default:
 		DBG(cdev, "event %02x --> %d\n",
 			event->bNotificationType, req->status);
+		atomic_dec(&ecm->notify_count);
 		break;
 	}
-	ecm->notify_req = req;
 	ecm_do_notify(ecm);
 }
 
@@ -907,6 +910,11 @@ static void ecm_unbind(struct usb_configuration *c, struct usb_function *f)
 
 	usb_free_all_descriptors(f);
 
+	if (atomic_read(&ecm->notify_count)) {
+		usb_ep_dequeue(ecm->notify, ecm->notify_req);
+		atomic_set(&ecm->notify_count, 0);
+	}
+
 	kfree(ecm->notify_req->buf);
 	usb_ep_free_request(ecm->notify, ecm->notify_req);
 }
-- 
2.24.0

