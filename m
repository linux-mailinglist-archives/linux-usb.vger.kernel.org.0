Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1A672F9B7B
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 09:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387927AbhARIsN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 03:48:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387859AbhARIrp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Jan 2021 03:47:45 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4884BC061757
        for <linux-usb@vger.kernel.org>; Mon, 18 Jan 2021 00:47:04 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id y17so15583722wrr.10
        for <linux-usb@vger.kernel.org>; Mon, 18 Jan 2021 00:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OyQZB4rl5Zar0wRlUg3JZS81nsXMFf2BksOtPVpSskk=;
        b=1eDIvqm2DYBQvrlEqrZOdoWFbDIRO661ivbAjhUrNDhelTRzl7byhn20hOJ85oJkbL
         b7zrCpvOOaWz6/ecVYNyQ9+YN9D55OrwQgAjzIWATqfremCD8/lk8X6iMYKtdaGnvSpb
         m+eLJP37fOXg5Z0WUwwbqFmRw748VjyEYfp7ApQHwSF41krg9wAExURz+5ScqvdOk4mg
         WzRgr/PPaFcn8eUOi8Mq95V0H/jF4fvilivYDzZ1uZurTW9RNtjk+3d23p/fsUcPaqGC
         ZzchM2EtTLBQOpYSu5VimxKpLNG042e1NYdZb7kDM3Zlw5rxjQmIwQVl4Z05XVJB7vZB
         xujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OyQZB4rl5Zar0wRlUg3JZS81nsXMFf2BksOtPVpSskk=;
        b=B0A7B5hxR6UoLxCxOTsAccCoB5qGtuQ3sbm3Pui4tYHmodyDgOKk3Kx/gJtZ6wLoKM
         IJFwKZH8HJEb8WJsF0+0SiKfzNXL907gAAEcLMG4Gxf439Gj+kjy6jKhcga5Lqvml+yA
         JUe7tnccCmXRVA3QMDEWMfMj4qGJt8hHDr7fZyymczHxzTBsSG3VC+JOMVu7+r/7JFp1
         jHFU/adv2gvNWv+4vACvPt+9nGSoXsucNVA7hrzBb5eUE/paJODqeqlySOa4suYGSuaC
         f27Wd3QCSy80xA48NTBD1u0Ni8b4STx9+uSi1e4JHBzluYIH6VCiih+mLzvrFbVeEbiQ
         vhVA==
X-Gm-Message-State: AOAM530o0UAzOcY7/mOO/ppTUeEbfZQ6cZfw74CIKDDffGwbGON7jlRZ
        91FMZYtSzEIyWLHMgiBnPaF3Pg==
X-Google-Smtp-Source: ABdhPJxxgODJToo7TFdLLUjVzIUDyoOMj4r4LZZaidqcgw0ViKZvSuhZl4yqyYfhUNITTmsGPDGnWQ==
X-Received: by 2002:a5d:6cd4:: with SMTP id c20mr24712137wrc.57.1610959622969;
        Mon, 18 Jan 2021 00:47:02 -0800 (PST)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id y63sm26224518wmd.21.2021.01.18.00.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 00:47:02 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jack Pham <jackp@codeaurora.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ferry Toth <fntoth@gmail.com>, Peter Chen <peter.chen@nxp.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v3 1/4] usb: gadget: u_audio: Free requests only after callback
Date:   Mon, 18 Jan 2021 09:46:39 +0100
Message-Id: <20210118084642.322510-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118084642.322510-1-jbrunet@baylibre.com>
References: <20210118084642.322510-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Jack Pham <jackp@codeaurora.org>

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
Reviewed-and-tested-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Jack Pham <jackp@codeaurora.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Acked-by: Felipe Balbi <balbi@kernel.org>
---
 drivers/usb/gadget/function/u_audio.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index e6d32c536781..908e49dafd62 100644
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
@@ -336,8 +341,14 @@ static inline void free_ep(struct uac_rtd_params *prm, struct usb_ep *ep)
 
 	for (i = 0; i < params->req_number; i++) {
 		if (prm->ureq[i].req) {
-			usb_ep_dequeue(ep, prm->ureq[i].req);
-			usb_ep_free_request(ep, prm->ureq[i].req);
+			if (usb_ep_dequeue(ep, prm->ureq[i].req))
+				usb_ep_free_request(ep, prm->ureq[i].req);
+			/*
+			 * If usb_ep_dequeue() cannot successfully dequeue the
+			 * request, the request will be freed by the completion
+			 * callback.
+			 */
+
 			prm->ureq[i].req = NULL;
 		}
 	}
-- 
2.29.2

