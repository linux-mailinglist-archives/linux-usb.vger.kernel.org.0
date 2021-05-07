Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21968375F84
	for <lists+linux-usb@lfdr.de>; Fri,  7 May 2021 06:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbhEGEmN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 May 2021 00:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231501AbhEGEmN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 May 2021 00:42:13 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A86C061574
        for <linux-usb@vger.kernel.org>; Thu,  6 May 2021 21:41:13 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id h14-20020a17090aea8eb02901553e1cc649so4629722pjz.0
        for <linux-usb@vger.kernel.org>; Thu, 06 May 2021 21:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JMUNJAKvNnurV0h85ctnycyg2Vjqwe0Voc3cawQ6zV0=;
        b=Swy2QD7wLpdqPa/FPGpatGLDEmoUD2SofkK6CTFbSpupOWSrMbcjOQHjRnT6lcUkl0
         7iR//qMWoiTRpZxBUEXcREZ6QX2lh0AjLClNqKNpQTUKbPxkU3yWtZhpfST2A9B3OIcx
         DRKOdWhC7kLuWTSj8PJUqPCkwKbDMTuWd3M9ErC0x7U8JEmmXMM5ssAZqoCWMEXWE3JG
         VY+TPt5jIaOilaOYkQplOxPep7TK/KEuiaZ7pFm+v8TePiz2p91KxYLZ11KuVTaGZXWK
         5Q1CQvQnyPyuKAhLscXbtVgHYivf5t3QxFWtdO9XjEmEv9IG3VV8LXCJko3qSvjaNS9J
         0hTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JMUNJAKvNnurV0h85ctnycyg2Vjqwe0Voc3cawQ6zV0=;
        b=pvAycY+h0kPv972FCUGAYXoMc52EL/5MXhrMRRYWnewWYNiryp6qe2+nu1HRIV7UD+
         hWiT5d2TByDl7HNGmTHds08zjCog1R4EeSDWlNzKhJKQbekhV5i1h8ky/6NtAVPcoGpb
         ZCn1w01Bib+4yO84b0fsTs15mTojKSOjTUGQNFdh9KO8jUyPgpa4sfNHrPSl1/H3Lw8u
         lTRp5AjNXNjM5kI7J7eEoUmP14fWC+x4JTlwNHULEJKfRVOv71yiw0BUaDXoRp2M+sVC
         F22TDvfsB3p6/AwAcBBnFtCHSIAqqQve5gKb4l4ahs12XxPKRP8iimoViIBJzbrEALvI
         MBSA==
X-Gm-Message-State: AOAM531GHcjoy5HJSBdwrHZ6n3Fcjh6CI3tpGK/iWjonvkEhbQYIBsFB
        4+9NeG4AClJaHGeScDvVOFWHvINVALs=
X-Google-Smtp-Source: ABdhPJxRt0Kmt35KCuy+8lG5dJOtJEOlldWkAU3V9ipsNjpTLUjWDtBqpMaP33yQEy9lR/2SBJuRrw==
X-Received: by 2002:a17:902:b7c9:b029:ed:5a0c:d1ca with SMTP id v9-20020a170902b7c9b02900ed5a0cd1camr8163926plz.4.1620362472533;
        Thu, 06 May 2021 21:41:12 -0700 (PDT)
Received: from user ([2001:4490:4409:2c26:38dc:7b11:ac4b:4ec7])
        by smtp.gmail.com with ESMTPSA id n11sm3706225pff.96.2021.05.06.21.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 21:41:12 -0700 (PDT)
Date:   Fri, 7 May 2021 10:11:07 +0530
From:   Saurav Girepunje <saurav.girepunje@gmail.com>
To:     saurav.girepunje@hotmail.com
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 1/2] usb: musb: remove unused function argument
Message-ID: <390d572be063d615b6aa34dfbd019472795c7659.1620361861.git.saurav.girepunje@gmail.com>
References: <cover.1620361861.git.saurav.girepunje@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1620361861.git.saurav.girepunje@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Remove unused function argument from musb_tx_dma_set_mode_cppi_tusb()
in musb_host.c

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/usb/musb/musb_host.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index 8b7d22a0c0fb..978d822af2c5 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -602,12 +602,8 @@ static void musb_tx_dma_set_mode_mentor(struct dma_controller *dma,
 	musb_writew(epio, MUSB_TXCSR, csr);
 }

-static void musb_tx_dma_set_mode_cppi_tusb(struct dma_controller *dma,
-					   struct musb_hw_ep *hw_ep,
-					   struct musb_qh *qh,
+static void musb_tx_dma_set_mode_cppi_tusb(struct musb_hw_ep *hw_ep,
 					   struct urb *urb,
-					   u32 offset,
-					   u32 *length,
 					   u8 *mode)
 {
 	struct dma_channel *channel = hw_ep->tx_channel;
@@ -633,8 +629,7 @@ static bool musb_tx_dma_program(struct dma_controller *dma,
 		musb_tx_dma_set_mode_mentor(dma, hw_ep, qh, urb, offset,
 					    &length, &mode);
 	else if (is_cppi_enabled(hw_ep->musb) || tusb_dma_omap(hw_ep->musb))
-		musb_tx_dma_set_mode_cppi_tusb(dma, hw_ep, qh, urb, offset,
-					       &length, &mode);
+		musb_tx_dma_set_mode_cppi_tusb(hw_ep, urb, &mode);
 	else
 		return false;

--
2.25.1

