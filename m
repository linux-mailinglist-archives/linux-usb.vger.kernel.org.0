Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8533E5338
	for <lists+linux-usb@lfdr.de>; Tue, 10 Aug 2021 08:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234302AbhHJGEF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Aug 2021 02:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232947AbhHJGEF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Aug 2021 02:04:05 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 243BEC0613D3
        for <linux-usb@vger.kernel.org>; Mon,  9 Aug 2021 23:03:43 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id j1so31563968pjv.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Aug 2021 23:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rtst-co-kr.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=gNSA/QqvaxKCqHSWnVz2swgpIR5+WkaDSkJI1ULT9rA=;
        b=LgY/E8dsE++Nv72Q1nlDTOYah9pp2hBgV4azqDWovVC7KEw80sgREuXKkU0Ll4K2AR
         iKBiu/UcLOK2AOtWWNQcd20P/OwJ77xjnhKT39aZIlYI5M9B18DcUNOnFAKOgX94wBpj
         JsDmBoXsVg9B5cGemetypTwapHG3EvoEc9551wZp5ZgFoPhqXARg9sDxNpEWya2wmuZV
         +2qSl1tTq40KrJwQc//JJLUmaZRhAVHLLQ/UXjwld7rxPdenXYK+3fxHlF94/YgNXmZ3
         7z5wW72+oP4IOM95ayZ1sFtgxLzB8K9EMRSum7wZmnnqsfHyKZ9MsTR29W/J5bEwtdAc
         UuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=gNSA/QqvaxKCqHSWnVz2swgpIR5+WkaDSkJI1ULT9rA=;
        b=olRbb6gAXAgFNKVQnX+jS6BjqBnoWkLUP4Z4AsBcECXnsP7JkhZWiErupPFUwT6l/h
         BIB2hQ58DprdvQ39zieirO7yXSq+XgkBFGNQ7kf+XeHLFt9kgEVGnceSsCNAJ0OBNVo4
         2ZusFrvfn7MKwXcNgw4UCYHoCrfZgZ4NTkUTbljYeIyenChsnTSHxXfp9xc3IQG6C3MX
         K/KEcoUQEuhmhZ+XVZY5wtHPTie+lfgI5ymWfFmD3Pk6V9JSZzc71AGa/a2l1j3Cnabf
         XovmvYs5m1A7nCsqmFRvFnm5lGP+s0jxtXjuSO41jEfC1elHXS9GYaz3JZwtu5nn1XjA
         rk9A==
X-Gm-Message-State: AOAM5306b5BruCMxm/lZ6PHPDOx/1hh+ihbzpkbl9MhTmrdTVwHpM35i
        HVw6UHpUmHw/PFVlSfL+xfJE66gZ/yezog==
X-Google-Smtp-Source: ABdhPJxKliws3410q1HD7YF34N5EEBwQenuTxL1SGbdk2QoxAWDCsw1kWTRpj513cJUJy9qSGyOfyw==
X-Received: by 2002:a17:90a:8809:: with SMTP id s9mr3152778pjn.44.1628575415238;
        Mon, 09 Aug 2021 23:03:35 -0700 (PDT)
Received: from ubuntu ([106.245.77.4])
        by smtp.gmail.com with ESMTPSA id u3sm18983464pfn.76.2021.08.09.23.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 23:03:34 -0700 (PDT)
Date:   Tue, 10 Aug 2021 15:02:28 +0900
From:   Jeaho Hwang <jhhwang@rtst.co.kr>
To:     Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: chipidea: fix RT issue for udc
Message-ID: <20210810060228.GA3326442@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

hw_ep_prime sometimes fails if irq occurs while it rus on RT kernel.
to prevent local_irq_save should keep the function from irqs.

I am not sure where is the best to submit this patch, between RT and USB
community so sending to both. thanks.

Signed-off-by: Jeaho Hwang <jhhwang@rtst.co.kr>
---
 drivers/usb/chipidea/udc.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 5f35cdd2cf1d..a90498f17cc4 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -102,6 +102,9 @@ static int hw_ep_flush(struct ci_hdrc *ci, int num, int dir)
 {
 	int n = hw_ep_bit(num, dir);
 
+    /* From zynq-7000 TRM, It can take a long time
+     * so irq disable is not a good option for RT
+     */
 	do {
 		/* flush any pending transfer */
 		hw_write(ci, OP_ENDPTFLUSH, ~0, BIT(n));
@@ -190,22 +193,32 @@ static int hw_ep_get_halt(struct ci_hdrc *ci, int num, int dir)
 static int hw_ep_prime(struct ci_hdrc *ci, int num, int dir, int is_ctrl)
 {
 	int n = hw_ep_bit(num, dir);
+	unsigned long flags;
+	int ret = 0;
 
 	/* Synchronize before ep prime */
 	wmb();
 
-	if (is_ctrl && dir == RX && hw_read(ci, OP_ENDPTSETUPSTAT, BIT(num)))
-		return -EAGAIN;
+	/* irq affects this routine so irq should be disabled on RT.
+	 * on standard kernel, irq is already disabled by callers.
+	 */
+	local_irq_save(flags);
+	if (is_ctrl && dir == RX && hw_read(ci, OP_ENDPTSETUPSTAT, BIT(num))) {
+		ret = -EAGAIN;
+	goto out;
+	}
 
 	hw_write(ci, OP_ENDPTPRIME, ~0, BIT(n));
 
 	while (hw_read(ci, OP_ENDPTPRIME, BIT(n)))
 		cpu_relax();
 	if (is_ctrl && dir == RX && hw_read(ci, OP_ENDPTSETUPSTAT, BIT(num)))
-		return -EAGAIN;
+		ret = -EAGAIN;
 
+out:
+	local_irq_restore(flags);
 	/* status shoult be tested according with manual but it doesn't work */
-	return 0;
+	return ret;
 }
 
 /**
-- 
2.25.1

