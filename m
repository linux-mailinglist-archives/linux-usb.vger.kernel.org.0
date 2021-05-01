Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E604A37069D
	for <lists+linux-usb@lfdr.de>; Sat,  1 May 2021 11:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231871AbhEAJcM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 May 2021 05:32:12 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:15907 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231713AbhEAJcM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 May 2021 05:32:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619861482; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=SR5NSXTOa/z+LdUfqPLSxuvJfzsNFIe+bGjvDPJ508U=; b=FotBASRKahQ74pNLaYJC7OAKAjRlFb03iWwJ9Bw/BEBtxerdq0je0QhIAkaGkw//GCU98kkG
 RcHeNiyVgV9AlK7+vSl76vOtBPZmCTo/uSQqFseSVWl5+AY3qpgIojLCV7x14oEirJTKtwt4
 C9hEI76ack/oJslPC6Llevb2q6Q=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 608d1fe1febcffa80ff13ea7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 01 May 2021 09:31:13
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BEDF2C4323A; Sat,  1 May 2021 09:31:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 62BFEC433F1;
        Sat,  1 May 2021 09:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 62BFEC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Peter Chen <peter.chen@nxp.com>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Elliot Berman <eberman@codeaurora.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>
Subject: [PATCH] usb: dwc3: gadget: Free gadget structure only after freeing endpoints
Date:   Sat,  1 May 2021 02:30:55 -0700
Message-Id: <20210501093055.1468-1-jackp@codeaurora.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As part of commit e81a7018d93a ("usb: dwc3: allocate gadget structure
dynamically") the dwc3_gadget_release() was added which will free
the dwc->gadget structure upon the device's removal when
usb_del_gadget_udc() is called in dwc3_gadget_exit().

However, simply freeing the gadget results a dangling pointer
situation: the endpoints created in dwc3_gadget_init_endpoints()
have their dep->endpoint.ep_list members chained off the list_head
anchored at dwc->gadget->ep_list.  Thus when dwc->gadget is freed,
the first dwc3_ep in the list now has a dangling prev pointer and
likewise for the next pointer of the dwc3_ep at the tail of the list.
The dwc3_gadget_free_endpoints() that follows will result in a
use-after-free when it calls list_del().

This was caught by enabling KASAN and performing a driver unbind.
The recent commit 568262bf5492 ("usb: dwc3: core: Add shutdown
callback for dwc3") also exposes this as a panic during shutdown.

There are a few possibilities to fix this.  One could be to perform
a list_del() of the gadget->ep_list itself which removes it from
the rest of the dwc3_ep chain.

Another approach is what this patch does, by splitting up the
usb_del_gadget_udc() call into its separate "del" and "put"
components.  This allows dwc3_gadget_free_endpoints() to be
called before the gadget is finally freed with usb_put_gadget().

Fixes: e81a7018d93a ("usb: dwc3: allocate gadget structure dynamically")
Signed-off-by: Jack Pham <jackp@codeaurora.org>
---
 drivers/usb/dwc3/gadget.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 6eab78f8a1a7..c7e5f5a07f3b 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4062,8 +4062,9 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 
 void dwc3_gadget_exit(struct dwc3 *dwc)
 {
-	usb_del_gadget_udc(dwc->gadget);
+	usb_del_gadget(dwc->gadget);
 	dwc3_gadget_free_endpoints(dwc);
+	usb_del_gadget_put(dwc->gadget);
 	dma_free_coherent(dwc->sysdev, DWC3_BOUNCE_SIZE, dwc->bounce,
 			  dwc->bounce_addr);
 	kfree(dwc->setup_buf);
-- 
2.24.0

