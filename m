Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADC793752FA
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 13:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234662AbhEFLXJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 07:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234618AbhEFLXJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 May 2021 07:23:09 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB3BC061574
        for <linux-usb@vger.kernel.org>; Thu,  6 May 2021 04:22:10 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id j3-20020a05600c4843b02901484662c4ebso5135015wmo.0
        for <linux-usb@vger.kernel.org>; Thu, 06 May 2021 04:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xX8oNQuVw461EY8weBD4WdkQqtE66BqEug4vL4X/XJU=;
        b=m2+OSgbtJPu4fE6EdgDgf7oYLJxeo7fJ09HtncB20niKLA4zhAGqWHprJNMpf3vo7g
         UQg3XmHwbTIXX+uvE/KqZmR0FwVBmrs8JjUAggGd4CID5o2Ycje5Hvf7coSKFVhVcV8x
         wsJIjPB2TqUk37DtYEnt1aS6DjxZpG0VaxPWH9eT/9py5NNwT3sCgXKWworXlO5sshpA
         9oJk77pIp8crA6hBy/KfjgI1R3y9G5PE8vTv3nzAr6EJ1VyuUyCUjevnO/brDR/VLMco
         6lfgqlItB5LOIafn61ss6y8pHKVePnHWHknltQlih1bbJ4Uk+7r7pgG8S7YvJ4rfhEqE
         xEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xX8oNQuVw461EY8weBD4WdkQqtE66BqEug4vL4X/XJU=;
        b=CGJzPkRf7kli+97eZHBY7KWZGnjjd3RQp4VnEjbHWIHifCcGZZ6Gen+gAb9n8/IEHM
         a2LpfhzlKdz3WjtMVWT+V5FF63unnKjG8ywsFY5erYKBwk53SLKvgO7KmnA7nsG42dhf
         JNfvQtdnMTBkjBw4weP3WLsUyJc2Rcj19YATzOe5b2dav2hjbt35YYgODXxL2kU4be77
         U/96LwsqLwHtGMVIOW0HYCBMn8OHxIT1GGzk0VsgBXniiEQIdAWcA1AcC8I4/bqxC1jt
         DBirxqARgm02MGXTGjFbaTGQgb8URJHFJdz0fbGmcMwEVOss5Qp9hNgEYlPz31Aw5mED
         /KGA==
X-Gm-Message-State: AOAM532x8dVzgnBaLpg940KNbhkQuW23hsjXGFGcHTs/3bGf0ihvv8PA
        /0/PEGqdP7ZTWSceOwJMCMeqjA==
X-Google-Smtp-Source: ABdhPJxW2GKLE/2T1+QdXBtHaqHeRjF8OABMkPC3ciG3cNZCUDuKkTMJuBNHDD8A0ySnNr55idpAng==
X-Received: by 2002:a7b:c217:: with SMTP id x23mr14249512wmi.26.1620300128776;
        Thu, 06 May 2021 04:22:08 -0700 (PDT)
Received: from buildbot.pitowers.org ([2a00:1098:3142:14:ae1f:6bff:fedd:de54])
        by smtp.gmail.com with ESMTPSA id f22sm2979216wmj.42.2021.05.06.04.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 04:22:08 -0700 (PDT)
From:   Phil Elwell <phil@raspberrypi.com>
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mian Yousaf Kaukab <yousaf.kaukab@intel.com>,
        Felipe Balbi <balbi@ti.com>,
        Paul Zimmerman <paulz@synopsys.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        linux-usb@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Cc:     Phil Elwell <phil@raspberrypi.com>
Subject: [PATCH] usb: dwc2: Fix gadget DMA unmap direction
Date:   Thu,  6 May 2021 12:22:00 +0100
Message-Id: <20210506112200.2893922-1-phil@raspberrypi.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The dwc2 gadget support maps and unmaps DMA buffers as necessary. When
mapping and unmapping it uses the direction of the endpoint to select
the direction of the DMA transfer, but this fails for Control OUT
transfers because the unmap occurs after the endpoint direction has
been reversed for the status phase.

A possible solution would be to unmap the buffer before the direction
is changed, but a safer, less invasive fix is to remember the buffer
direction independently of the endpoint direction.

Fixes: fe0b94abcdf6 ("usb: dwc2: gadget: manage ep0 state in software")
Signed-off-by: Phil Elwell <phil@raspberrypi.com>
---
 drivers/usb/dwc2/core.h   | 2 ++
 drivers/usb/dwc2/gadget.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index da5ac4a4595b..ab6b815e0089 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -113,6 +113,7 @@ struct dwc2_hsotg_req;
  * @debugfs: File entry for debugfs file for this endpoint.
  * @dir_in: Set to true if this endpoint is of the IN direction, which
  *          means that it is sending data to the Host.
+ * @map_dir: Set to the value of dir_in when the DMA buffer is mapped.
  * @index: The index for the endpoint registers.
  * @mc: Multi Count - number of transactions per microframe
  * @interval: Interval for periodic endpoints, in frames or microframes.
@@ -162,6 +163,7 @@ struct dwc2_hsotg_ep {
 	unsigned short		fifo_index;
 
 	unsigned char           dir_in;
+	unsigned char           map_dir;
 	unsigned char           index;
 	unsigned char           mc;
 	u16                     interval;
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index e6bb1bdb2760..184964174dc0 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -422,7 +422,7 @@ static void dwc2_hsotg_unmap_dma(struct dwc2_hsotg *hsotg,
 {
 	struct usb_request *req = &hs_req->req;
 
-	usb_gadget_unmap_request(&hsotg->gadget, req, hs_ep->dir_in);
+	usb_gadget_unmap_request(&hsotg->gadget, req, hs_ep->map_dir);
 }
 
 /*
@@ -1242,6 +1242,7 @@ static int dwc2_hsotg_map_dma(struct dwc2_hsotg *hsotg,
 {
 	int ret;
 
+	hs_ep->map_dir = hs_ep->dir_in;
 	ret = usb_gadget_map_request(&hsotg->gadget, req, hs_ep->dir_in);
 	if (ret)
 		goto dma_error;
-- 
2.25.1

