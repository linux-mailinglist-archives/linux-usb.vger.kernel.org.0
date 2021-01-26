Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB0B303975
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jan 2021 10:51:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390706AbhAZJum (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jan 2021 04:50:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731147AbhAZJu2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Jan 2021 04:50:28 -0500
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A276C061573
        for <linux-usb@vger.kernel.org>; Tue, 26 Jan 2021 01:49:45 -0800 (PST)
Received: by mail-qk1-x749.google.com with SMTP id v82so12012375qka.1
        for <linux-usb@vger.kernel.org>; Tue, 26 Jan 2021 01:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=BF2hBw3bB3mfwjZpc0M5f9hBJombs4W8oqTNboMD/xg=;
        b=K6h1Ou5AguZ3r6ZvH3cYWbby9H66C405JKnvwlHa3nXbLqOrtvpm7xBiL5N1CgCEPV
         iyV6Fi+UTj5bLvoivR1NmNCCtZSWctvLvKgn6itxG5zitKjuAN6zWJsPVJXLr9e4vYWR
         EurH8Wh4bP8aliNaJ8LN1sCKMA69f/V7375kZ1w/GsGK0jvNsH5RoxHxdTgKvmdhHOn8
         b6UtF9lZ95CcjLlJcInz1bIXMNsofu6h6+K7m0bQB9pZnITlESBJjnuXxPzn8m/arfFu
         FebbXnk/EcfZaY2mweFU4aAggkXYWdzOXTA3ScyLQ3OHfKSGxxv8h8q8w1W5FjKdncvP
         R3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=BF2hBw3bB3mfwjZpc0M5f9hBJombs4W8oqTNboMD/xg=;
        b=T507hUUwqQSIASywVKn0Rpd7KOkBH31FnDF9hX9mHCv/LEVP7tgWvuIiCb6yk08tRe
         ED81OjKMMtxDTzRB++RVL4RKBbGI2QGe2Ld4hnztheWsbrhNKCJUtnlipH8HnodD+PVb
         VMJh8t8D+dwl0yKyvBDTZEIwGDJxRJHkc1SvoV1OA6gqzclsTeXsZmbLYSFotj49AlOx
         MVVY3acAed8acg66kq5lYtG+kySHU7w5nPUG0hQT1yZ2r0jn1YprTWF+jzf68ajxw2PE
         kn8qPT7wCjwSJeFxEBOskv1pti7ZLaM54n5n+f7RbjwIReVBkv457oMhGe4knFMcwvww
         I/Dg==
X-Gm-Message-State: AOAM532tca/1qA9Vrx2FaEhzTi48Vb80cQgYVaRQKrmdWWdxFnfZN/3b
        IcBNDFoGlELqqFKSFuev33CnQD1NOd8=
X-Google-Smtp-Source: ABdhPJyG0RZkBdnGkD/yVvD7getHuGA3psKuJkxto6Cj6WbA9xafqZ+MfUyjAk14AI6a1AuzH8bONyjMiW4=
Sender: "raychi via sendgmr" <raychi@raychi.tao.corp.google.com>
X-Received: from raychi.tao.corp.google.com ([2401:fa00:fc:202:44fe:139b:e6d6:511a])
 (user=raychi job=sendgmr) by 2002:a05:6214:b2b:: with SMTP id
 w11mr4741618qvj.27.1611654584236; Tue, 26 Jan 2021 01:49:44 -0800 (PST)
Date:   Tue, 26 Jan 2021 17:49:13 +0800
Message-Id: <20210126094913.180945-1-raychi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH] usb: dwc3: add EXPORT_SYMBOL_GPL for role init functions
From:   Ray Chi <raychi@google.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kyletso@google.com, Ray Chi <raychi@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently, role init functions are used in dwc3 driver but
can't be called from kernel modules.
  dwc3_host_init
  dwc3_host_exit
  dwc3_gadget_init
  dwc3_gadget_exit
  dwc3_event_buffers_setup
  dwc3_event_buffers_cleanup

If other kernel modules want to use these functions, it needs
EXPORT_SYMBOL_GPL() to get compile pass.

Signed-off-by: Ray Chi <raychi@google.com>
---
 drivers/usb/dwc3/core.c   | 2 ++
 drivers/usb/dwc3/gadget.c | 2 ++
 drivers/usb/dwc3/host.c   | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 25c686a752b0..f34a7dd5323e 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -418,6 +418,7 @@ int dwc3_event_buffers_setup(struct dwc3 *dwc)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dwc3_event_buffers_setup);
 
 void dwc3_event_buffers_cleanup(struct dwc3 *dwc)
 {
@@ -433,6 +434,7 @@ void dwc3_event_buffers_cleanup(struct dwc3 *dwc)
 			| DWC3_GEVNTSIZ_SIZE(0));
 	dwc3_writel(dwc->regs, DWC3_GEVNTCOUNT(0), 0);
 }
+EXPORT_SYMBOL_GPL(dwc3_event_buffers_cleanup);
 
 static int dwc3_alloc_scratch_buffers(struct dwc3 *dwc)
 {
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 80c3ef134e41..43110bfdc440 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3699,6 +3699,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 err0:
 	return ret;
 }
+EXPORT_SYMBOL_GPL(dwc3_gadget_init);
 
 /* -------------------------------------------------------------------------- */
 
@@ -3712,6 +3713,7 @@ void dwc3_gadget_exit(struct dwc3 *dwc)
 	dma_free_coherent(dwc->sysdev, sizeof(*dwc->ep0_trb) * 2,
 			  dwc->ep0_trb, dwc->ep0_trb_addr);
 }
+EXPORT_SYMBOL_GPL(dwc3_gadget_exit);
 
 int dwc3_gadget_suspend(struct dwc3 *dwc)
 {
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index bef1c1ac2067..30589e313a67 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -126,8 +126,10 @@ int dwc3_host_init(struct dwc3 *dwc)
 	platform_device_put(xhci);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(dwc3_host_init);
 
 void dwc3_host_exit(struct dwc3 *dwc)
 {
 	platform_device_unregister(dwc->xhci);
 }
+EXPORT_SYMBOL_GPL(dwc3_host_exit);
-- 
2.30.0.280.ga3ce27912f-goog

