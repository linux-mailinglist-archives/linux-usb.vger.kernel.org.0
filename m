Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 714E5391866
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 15:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235131AbhEZNDJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 09:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235000AbhEZNCn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 09:02:43 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7251CC061352
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:01:07 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id p7so1021925wru.10
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SstsYYHlOJNFxJcFIIyoQziYm6AwfAPQpEUk2TCe0GU=;
        b=QF82RN242X5HtKAatNgT/qgGfUpO25QtmvdltzP3FsDkyUtjq2GV86LhSpzIPW2y4N
         Z9QP2HWF0uXip3AGH/WZfptwQAE/f1DSS7cs9jtV5xYofb9wXy/8iF9RfgFjIjxE8k8p
         Ug9kZLmO6QzFwFVh+50D7spVdYi9omwh0HympLkeNf2LU1Qf1dy3+TzL9GDfXESuYGGj
         UFAYZcQCZwVNNiSPHHY2b25aqxwk8RQQBVYxDnSCP0bFGumy9RfTPdAanPp/rEm/pn6d
         zo3DOTHllQEq94N40s3KVmw+WnOq2dbEL7Itx3OZbxrJ/4NV0PNQ4j3wnPGmsb5mg0xA
         gZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SstsYYHlOJNFxJcFIIyoQziYm6AwfAPQpEUk2TCe0GU=;
        b=eOSpU/9DPg42kxIwkUPp1r3qkSms+TLFvTogz3cOXE+aNwnfObXfUgtpEg4DfFrM9v
         5ZOhnlJ8B1pGP2mcTwLq5ZaNAIvzxf1bM6351fbFrbFCBYRzEqMmBDn8OvOkKOhNwfkF
         ywjqWO9f1FJR8VxVm7MRHtXX6neU5TA8OysFHpvOZ9fzdkDt5Xs/T+hj9mNb5mjb/MnB
         5G0j1Zs8FQOC/eBXzVQt1cenGb1/DZ6li6cDS1AuXmNYFwEL7Jv4VlAewNLWLIftvs94
         Jtzhd4VtTLXjL1x5zwQ5oa1wl1lB87gohIE8E68vtge9T1lUklGq0XvCW/lN8nwgL1Ta
         zFSg==
X-Gm-Message-State: AOAM532aKOMjReyPwi4CkhpZTyc21kVerq0njPESMtR241CKfGhHCbir
        MgcYYbOrxx8OtE8aVLGmMQg6hQ==
X-Google-Smtp-Source: ABdhPJyRGUgs1PnvtyEBBRL+/zjH/5oq1XavlOMX2b9sgoXWYDfs4A+DlUKJpkwVVNV2rtfQlhD//g==
X-Received: by 2002:a5d:4b08:: with SMTP id v8mr33135582wrq.122.1622034066371;
        Wed, 26 May 2021 06:01:06 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id y14sm6430036wmj.37.2021.05.26.06.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:01:05 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 19/24] usb: gadget: udc: udc-xilinx: Place correct function names into the headers
Date:   Wed, 26 May 2021 14:00:32 +0100
Message-Id: <20210526130037.856068-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526130037.856068-1-lee.jones@linaro.org>
References: <20210526130037.856068-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/usb/gadget/udc/udc-xilinx.c:802: warning: expecting prototype for xudc_ep_enable(). Prototype was for __xudc_ep_enable() instead
 drivers/usb/gadget/udc/udc-xilinx.c:997: warning: expecting prototype for xudc_ep0_queue(). Prototype was for __xudc_ep0_queue() instead

Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: linux-usb@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/gadget/udc/udc-xilinx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index 72f2ea062d554..fb4ffedd6f0dd 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -791,7 +791,7 @@ static int xudc_ep_set_halt(struct usb_ep *_ep, int value)
 }
 
 /**
- * xudc_ep_enable - Enables the given endpoint.
+ * __xudc_ep_enable - Enables the given endpoint.
  * @ep: pointer to the xusb endpoint structure.
  * @desc: pointer to usb endpoint descriptor.
  *
@@ -987,7 +987,7 @@ static void xudc_free_request(struct usb_ep *_ep, struct usb_request *_req)
 }
 
 /**
- * xudc_ep0_queue - Adds the request to endpoint 0 queue.
+ * __xudc_ep0_queue - Adds the request to endpoint 0 queue.
  * @ep0: pointer to the xusb endpoint 0 structure.
  * @req: pointer to the xusb request structure.
  *
-- 
2.31.1

