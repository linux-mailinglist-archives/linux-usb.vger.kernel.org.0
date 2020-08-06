Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9733E23DBBE
	for <lists+linux-usb@lfdr.de>; Thu,  6 Aug 2020 18:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728360AbgHFQbF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Aug 2020 12:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728205AbgHFQay (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Aug 2020 12:30:54 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CFD0C002178
        for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2020 09:17:09 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id v65so14161386ybv.9
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2020 09:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=wOnxt8yJ8wg77ZYwwslQl282OLXtAHOuc/XW3sHDZ+4=;
        b=dSCPQApDZWNb8zLFFjUFjAY9fD/PCQu3iRxIva+q4QmjH8g3OPE8/brbtMUtvu1bRH
         oJwlqPOqq50y0js6N4JpTQrvOpRJlDl2ONhIBg+w4wD2Le2cNHRXBXmjNJukNICVIFzF
         o0aAfxJMFx5baIPfdI50Pri8O2qAP7LSjxVaknyjwBn0WAolSM1kN/6CXbOaQ3Hj8wjN
         W7Lp0yEBtuSe37lpDoDgyJjtecjxPFtCqZNzvd5ncW0w2qq3ighkCIRrYOSM/HvgSoIe
         ay2s8lm5daQEBVKERfHELKBVJ/bDBRYynLveGuJMwl3wYpOEvdKvWzUDP7tlOna4MoMd
         GJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=wOnxt8yJ8wg77ZYwwslQl282OLXtAHOuc/XW3sHDZ+4=;
        b=KuVS1+vzadEsYUMzd7lSvTyIWu5rZFQX/obEXA6F8HScv2gdRGE0B+lYRpLo8lOi8q
         5FbNsg2bDpujaJY79/JfzAIyx0bjHj/hoEpuV7pptLWWuLuBn6Wnkm9bURq6tMkvlNMp
         e7fAdkPdEReOUQ17EnP5VXZMo/umBlFpJi5I7gRpYtT6t1C68cwCIomQcTU6kbJX0vyY
         hu25YctJSrMFQhl0y6mhS5K7+wn5RLxO1u5kstgRWo4A3eAjU7a2AOnRQzXdW2a7ZlGH
         Dy07ilUXcSafMhzz0WqdNVglPr0ec3Ld7YX9T8XAuwr9HM9jkq6mNN6TeB4HfezgKcZd
         U+qA==
X-Gm-Message-State: AOAM53143A4drdMYo64HkMODAxNSJvnMDQE0EvNL+LkF+tF3C2xCeIze
        PjCOMoA2O7828ooF3hbmBw2qVlJQo51aJ+5U2mhpWi6d9ZwEi0aimEQ/C/Oow1Mh0x7c9AeWoh0
        wnsrYAxVVGr4sD+C+RnQ52fd0GcjWevhja0Enf+m4cNjIAbvnU/bMoeBltaCoUM7mZTJ1
X-Google-Smtp-Source: ABdhPJyf+qjy2HoOeZvualRq/ZB8GNjFUOkdkObedN/LaqBdivBfOVTGfIkvaqcCp3szFUCjD7/z8FmPZpbV
X-Received: by 2002:a25:1f55:: with SMTP id f82mr14155954ybf.103.1596730628394;
 Thu, 06 Aug 2020 09:17:08 -0700 (PDT)
Date:   Fri,  7 Aug 2020 01:16:43 +0900
Message-Id: <20200806161643.1694266-1-lorenzo@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
Subject: [PATCH] usb: gadget: u_ether: enable qmult on SuperSpeed Plus as well
From:   Lorenzo Colitti <lorenzo@google.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        zenczykowski@gmail.com, Lorenzo Colitti <lorenzo@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The u_ether driver has a qmult setting that multiplies the
transmit queue length (which by default is 2).

The intent is that it should be enabled at high/super speed, but
because the code does not explicitly check for USB_SUPER_PLUS,
it is disabled at that speed.

Fix this by ensuring that the queue multiplier is enabled for any
wired link at high speed or above. Using >= for USB_SPEED_*
constants seems correct because it is what the gadget_is_xxxspeed
functions do.

The queue multiplier substantially helps performance at higher
speeds. On a direct SuperSpeed Plus link to a Linux laptop,
iperf3 single TCP stream:

Before (qmult=1): 1.3 Gbps
After  (qmult=5): 3.2 Gbps

Signed-off-by: Lorenzo Colitti <lorenzo@google.com>
---
 drivers/usb/gadget/function/u_ether.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index c3cc6bd14e..31ea76adcc 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -93,7 +93,7 @@ struct eth_dev {
 static inline int qlen(struct usb_gadget *gadget, unsigned qmult)
 {
 	if (gadget_is_dualspeed(gadget) && (gadget->speed == USB_SPEED_HIGH ||
-					    gadget->speed == USB_SPEED_SUPER))
+					    gadget->speed >= USB_SPEED_SUPER))
 		return qmult * DEFAULT_QLEN;
 	else
 		return DEFAULT_QLEN;
-- 
2.28.0.163.g6104cc2f0b6-goog

