Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75C28256FB8
	for <lists+linux-usb@lfdr.de>; Sun, 30 Aug 2020 20:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgH3Sg6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 30 Aug 2020 14:36:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22554 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726380AbgH3Sg5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 30 Aug 2020 14:36:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598812616;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=QozYeGLLb3VY909mnDA2JjEU+D2LsIUp8jIV0Jpgmp4=;
        b=XXe8ONkAOIOg48XgLbK5kVSJL4L1HGy63VAqzpewlKUEeZZcOl8S7OKa+XgxzXuI/It+Ta
        oeNNkJ2d+yd+RKfS2cFbIy4P0RsI08MVsHlXS0eoqiByT9dLC4S+nV0eCdaPy4B1n/uUEH
        YDS2G2RzR17t8uwpM8qyYc1TVbFmxPY=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-O4ts9YZTMNSUzV5MyeqLjQ-1; Sun, 30 Aug 2020 14:36:53 -0400
X-MC-Unique: O4ts9YZTMNSUzV5MyeqLjQ-1
Received: by mail-il1-f200.google.com with SMTP id 2so3555975ill.10
        for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2020 11:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QozYeGLLb3VY909mnDA2JjEU+D2LsIUp8jIV0Jpgmp4=;
        b=k0+r08kUSoC4tFJ2j5V34CJSSm+0CvpfQXGKvfiz6RjDrhNc4hEURMhK6MLOSeXDGM
         0lZk8Qcz8FI/5xRwFDQhPhQoAhA+9c7sGqLRujpdy9Kz3BQd2jo2wh6UN4QPl0XtIJc7
         ZKZY1iQzzqrbZNEnX58RbJuD1p1umU7e4BRhP+UAVj0pHREnoLfXlOdrMKU7lNLW5Uat
         qSZ9Djh5ldqzaKwXNaYQbLwMBjC282wPAbeKRO9NiDc0YZwe1egL81lZ6ctJOogXdaBg
         vDVn+sttSWKBwxhL8PdqzuKvMF1Jgx5VQTC5ErhKCVXx9Qsq7kGe08s7FIUZf+lwvURI
         Qcjg==
X-Gm-Message-State: AOAM532vZ70n0E4Jt0c/9jb1ylw3EZECgm54VDvkrGneFgze5IV/MuS1
        kNRJGE11O7xOm0zeu5QMaYzHp9rnWxivPCjEelzFksRuCw+w1r/LMJdw0WfGxaLmMaH3lAnf/BY
        VrNwi0SHeXWYA944Lz/hG
X-Received: by 2002:a92:c904:: with SMTP id t4mr6323572ilp.257.1598812612571;
        Sun, 30 Aug 2020 11:36:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJws0aS2JRLx2nRnOEJQonJ8J7aNV73fnvMcA6Cq8vQw0/+MPUr+w4mfxekC3wDSgZkuIXIHRg==
X-Received: by 2002:a92:c904:: with SMTP id t4mr6323556ilp.257.1598812612345;
        Sun, 30 Aug 2020 11:36:52 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id x185sm2883927iof.41.2020.08.30.11.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:36:51 -0700 (PDT)
From:   trix@redhat.com
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        natechancellor@gmail.com, ndesaulniers@google.com,
        christophe.jaillet@wanadoo.fr, peter.chen@nxp.com, b-liu@ti.com,
        chunfeng.yun@mediatek.com, novikov@ispras.ru, yanaijie@huawei.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] usb: gadget: net2272: assert for a valid dma request
Date:   Sun, 30 Aug 2020 11:36:46 -0700
Message-Id: <20200830183646.24930-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Tom Rix <trix@redhat.com>

clang static analysis flags this representive problem

net2272.c:1541:8: warning: Dereference of null pointer
    if ((req->req.length % ep->ep.maxpacket != 0) ||
         ^~~~~~~~~~~~~~~
This is mostly not a problem.

In net2272_handle_dma(), even though every path through
the routine dereferences req, it is set to NULL when the
ep->queue is empty.  If the eq->queue was ever empty this
would have oops.

So the else statement should not be needed.  If it is,
flag it as a BUG.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/gadget/udc/net2272.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/net2272.c
index 44d1ea2307bb..8301723a8b1a 100644
--- a/drivers/usb/gadget/udc/net2272.c
+++ b/drivers/usb/gadget/udc/net2272.c
@@ -1506,17 +1506,16 @@ static int net2272_stop(struct usb_gadget *_gadget)
 static void
 net2272_handle_dma(struct net2272_ep *ep)
 {
-	struct net2272_request *req;
+	struct net2272_request *req = NULL;
 	unsigned len;
 	int status;
 
 	if (!list_empty(&ep->queue))
 		req = list_entry(ep->queue.next,
 				struct net2272_request, queue);
-	else
-		req = NULL;
 
 	dev_vdbg(ep->dev->dev, "handle_dma %s req %p\n", ep->ep.name, req);
+	BUG_ON(!req);
 
 	/* Ensure DREQ is de-asserted */
 	net2272_write(ep->dev, DMAREQ,
-- 
2.18.1

