Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C53D29E63B
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 09:18:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgJ2ISg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 04:18:36 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:51459 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729651AbgJ2ISG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Oct 2020 04:18:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603959485; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=rBO+gLxUOacuOrU8nhzUA2kRYlZuHbZRL7FH2c8gIMo=; b=C6HijSzU7K4/JYxW7A5Pc6/GPd2b3HUrI50SuXMsb5WZbbDuedq17cjB/Ez3BzTMsdRUwuG9
 OOLEMDvZ8nbwvbVJUAHeOJw2v/xInXstWf7Q2jyG1ltLkLylIUVdzrhdB4ZGvZlQewz1cNTM
 vsDTaKO2C/7w7s9sMGiVH+ig5KI=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f9a5f87562508bbca7ca0fa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Oct 2020 06:21:59
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C9485C433FF; Thu, 29 Oct 2020 06:21:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A7B2AC433C9;
        Thu, 29 Oct 2020 06:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A7B2AC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Felipe Balbi <balbi@kernel.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>,
        Jack Pham <jackp@codeaurora.org>, Ferry Toth <fntoth@gmail.com>
Subject: [PATCH v2] usb: gadget: audio: Free requests only after callback
Date:   Wed, 28 Oct 2020 23:21:44 -0700
Message-Id: <20201029062144.3574-1-jackp@codeaurora.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As per the kernel doc for usb_ep_dequeue(), it states that "this
routine is asynchronous, that is, it may return before the completion
routine runs". And indeed since v5.0 the dwc3 gadget driver updated
its behavior to place dequeued requests on to a cancelled list to be
given back later after the endpoint is stopped.

The free_ep() was incorrectly assuming that a request was ready to
be freed after calling dequeue which results in a use-after-free
in dwc3 when it traverses its cancelled list. Fix this by moving
the usb_ep_free_request() call to the callback itself in case the
ep is disabled.

Fixes: eb9fecb9e69b0 ("usb: gadget: f_uac2: split out audio core")
Reported-and-tested-by: Ferry Toth <fntoth@gmail.com>
Signed-off-by: Jack Pham <jackp@codeaurora.org>
---
v2: call free_request() in case of ep_dequeue() failure

 drivers/usb/gadget/function/u_audio.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index e6d32c536781..6e69ccf02c95 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -89,7 +89,12 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 	struct snd_uac_chip *uac = prm->uac;
 
 	/* i/f shutting down */
-	if (!prm->ep_enabled || req->status == -ESHUTDOWN)
+	if (!prm->ep_enabled) {
+		usb_ep_free_request(ep, req);
+		return;
+	}
+
+	if (req->status == -ESHUTDOWN)
 		return;
 
 	/*
@@ -336,8 +341,9 @@ static inline void free_ep(struct uac_rtd_params *prm, struct usb_ep *ep)
 
 	for (i = 0; i < params->req_number; i++) {
 		if (prm->ureq[i].req) {
-			usb_ep_dequeue(ep, prm->ureq[i].req);
-			usb_ep_free_request(ep, prm->ureq[i].req);
+			if (usb_ep_dequeue(ep, prm->ureq[i].req))
+				usb_ep_free_request(ep, req);
+			/* else will be freed in u_audio_iso_complete() */
 			prm->ureq[i].req = NULL;
 		}
 	}
-- 
2.24.0

