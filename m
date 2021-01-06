Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2087C2EBEDD
	for <lists+linux-usb@lfdr.de>; Wed,  6 Jan 2021 14:40:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbhAFNhu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Jan 2021 08:37:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbhAFNhs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Jan 2021 08:37:48 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 442D7C061357
        for <linux-usb@vger.kernel.org>; Wed,  6 Jan 2021 05:37:08 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id c7so4403811edv.6
        for <linux-usb@vger.kernel.org>; Wed, 06 Jan 2021 05:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mTKp7Q6ON2dW5g8WxlLxPPWuU/dM5NtfKl7JdpUhkyQ=;
        b=tg7dAOXk4CYwqY0t8U52DZtiOl5U0NCSq3yA1LUuUEG1E8pNyB30rU35PWIk9DGFvU
         O4q1x6tqEv6EyeSh2neLePQgVjOD/oPoTBMAQd6TM8oZlFkvWYqu+b+rhu7Jv3mGCS95
         MVuGunVtzjU+ci4mQe6zVySG6jfz0alNjuSNdCdNt5lLr+N08TYdC9zUhxMbccB2tjlE
         snW5RoUMvd5/ZpeW4DQ2ANsLcQy6NhXrmxTwh7fGZZrCyiWssFaBv+t4zCX3JFvnRtgD
         VIUoOCdUTqfDtsnD6es+pTFw8UptiXnP5OojO6DcDw/xN2WQhr0NvCwGdMam5in5xj1M
         OLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mTKp7Q6ON2dW5g8WxlLxPPWuU/dM5NtfKl7JdpUhkyQ=;
        b=pTST+qSkARG9ZSrFFSJiFYA1B1tJsZjacWwHdyMkhXZ+E8JcoQwo6mhpJp/fKxNHCb
         GV4BQ1Wg5jEQwZGEJYIza2jrXoHooyu5kGsskdBZiZzH0vV7+hqft/NZa5VIFFrJyOux
         08GqrOGaoLMOV7zZh6osRsiS59xkvs3JZO9Jst5uMljFigmt9Nhzasrz2WUV0HekCmJj
         CRlZBWnglPOaYAYBHOyzkmrSD5FIF0pcvkx0WhYDf7o3s78rKJpz6HOdDIH5Zppg4oFH
         yFnIVyD4r3OKH8Pc3F1uilF2dFWBIwzvepn/1qe25P+7nMKGgtr8M4oIbR4FbKBKu9Ko
         Wtkg==
X-Gm-Message-State: AOAM530BiCj8pULlYedSojX08vPSNs1NvoVbQ/hpRM/bQ+REE9M87Kw2
        HlgzAxeEkGsnGfCYSW13NbGaFw==
X-Google-Smtp-Source: ABdhPJxJsn3ynxCdwwuAtQAgpObVIwXnASNQNPImD0uKNhZ3vTlasph4oiIihP2pnaIjq57WyrzwFQ==
X-Received: by 2002:a50:e8c4:: with SMTP id l4mr3903622edn.337.1609940226992;
        Wed, 06 Jan 2021 05:37:06 -0800 (PST)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id n20sm1259275ejo.83.2021.01.06.05.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 05:37:06 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jack Pham <jackp@codeaurora.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ferry Toth <fntoth@gmail.com>, Peter Chen <peter.chen@nxp.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 1/5] usb: gadget: u_audio: Free requests only after callback
Date:   Wed,  6 Jan 2021 14:36:48 +0100
Message-Id: <20210106133652.512178-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106133652.512178-1-jbrunet@baylibre.com>
References: <20210106133652.512178-1-jbrunet@baylibre.com>
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
---
 drivers/usb/gadget/function/u_audio.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index e6d32c536781..71dd9f16c246 100644
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
+				usb_ep_free_request(ep, prm->ureq[i].req);
+			/* else will be freed in u_audio_iso_complete() */
 			prm->ureq[i].req = NULL;
 		}
 	}
-- 
2.29.2

