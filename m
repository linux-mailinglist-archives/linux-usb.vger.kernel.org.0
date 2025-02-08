Return-Path: <linux-usb+bounces-20342-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9BDA2D37F
	for <lists+linux-usb@lfdr.de>; Sat,  8 Feb 2025 04:31:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC0D1188DF43
	for <lists+linux-usb@lfdr.de>; Sat,  8 Feb 2025 03:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39AF1157E6B;
	Sat,  8 Feb 2025 03:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LJFz7KrD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B39C611E
	for <linux-usb@vger.kernel.org>; Sat,  8 Feb 2025 03:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738985494; cv=none; b=JXwRa0GbM3Le5pBTK+EXeGGJ0V8SD9Q/+6VDhvIwhOdtWdgR/sIN8tBgT+bqqlebtXxk6g3bUhRGdMkeroLR5ncTFqub279A1QnoAzC3UI04CgtDlcd4uZwRGpeAZnL/7k1a1pCU/Ty4S5qw4AqSBnS+qQxHLfqBP3oCYTkEvMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738985494; c=relaxed/simple;
	bh=+sardm/LolQw6ziPvWfFf1wd1dVDkIErwNJaVuBhKCI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=FPBb3jHieIv12nXuQ9uJIrQm9MVppJPTb4x8t7/+570i43LXMvxJEu07YHvRto41KUmTeL2EOkdg2PPssFfTccY2BY9BE6SUJZ+3fjCfU9WKaHAmT//9kuRMZg0Nv1tTHutp/uzh9NxIgZyOro9Qm4hapg63wA7bB315KxGNwfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LJFz7KrD; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2fa44233a04so724612a91.1
        for <linux-usb@vger.kernel.org>; Fri, 07 Feb 2025 19:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738985492; x=1739590292; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p0gZ2q9HM3rX07kpmvYyR39VyXsdRnL4CUz3gU+Woqc=;
        b=LJFz7KrDHsIKgE1KF5CTCVOYMs+coq4m0/ipl0e6pW7LQ5n6CX5+40/KgcCubxkXm3
         o94Q9oPCMQYLHH3a9NPJ1hTK6ZxI1wQIyavXF3Fv8LQxJGlwLwaBV9p7bgxfYS9kTeI9
         s14fgdWz8kX9U6R7cYZenisjEB/wRDRODQ5CCgeJUPGxpCqtuPirEo4n51djQcK8UEtb
         IFiT4Zk3vbUW39kEGzWFR9pov6wBVCNcqMqesMC1VRNo2VQV6ixvvUpOH0929BVuFMR6
         52os5NztoupKNjWx3tpVkD1xezoWWz3zou9zgCdxl4cT1AhCPHvJgmBnlamDUrpNwR8S
         kvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738985492; x=1739590292;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p0gZ2q9HM3rX07kpmvYyR39VyXsdRnL4CUz3gU+Woqc=;
        b=c4rkLaOvO69Hxf/nMJ74JGdXFRMaLIKB+cKP1rAymAqp3z/gj919CmSFdBsalGgZBb
         9mPj4jUgMpSUGLMt+LXW2g+u9fR7QNqjH8uV2hyyDvBveD0KDQhvuXdlnj4fIgYIhPDS
         WKgpolxRis4Ck0a+rg9h+hG4vLCXMOWrqlBL0GBsb5IQqBH0o5jEIJ5yIqXhJqddrsN7
         68kjUKJhfoDEQM3q6jjcEvMKs8GSSIfPiP3g7uz8YpfH8/MriBJy8LTwecrXod3V++Q4
         uw8tZUZFPvnPjEX3tEzBB7D4w1sofrGc2Ipmd6XqLRQXXKnqy9zQ/sqU2vLMB2iRnQ2u
         kpFA==
X-Gm-Message-State: AOJu0YzEzzZDXEFZNfzGX3tc6DQJM/urJk3iTOBV7PKQLBOAzXmFZdj0
	VvSg6NkDYFePoXguAHKlrqsUK/zhsmYW4JtlguDyOmbdbbPD5CQyUulVsoxccY82SW2MelsLiM7
	ePg==
X-Google-Smtp-Source: AGHT+IHF6JQH1xgZnqdPNtMVklKecXq5Aajik4oseZpvmg90/Ega/bv/OBxCXP5JoMVF9e7hXVZw8+bCgNQ=
X-Received: from pjbsp15.prod.google.com ([2002:a17:90b:52cf:b0:2ee:53fe:d0fc])
 (user=badhri job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d8c:b0:2f9:9ddd:689b
 with SMTP id 98e67ed59e1d1-2fa242e75eamr7097462a91.22.1738985492599; Fri, 07
 Feb 2025 19:31:32 -0800 (PST)
Date: Sat,  8 Feb 2025 03:31:29 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250208033129.3524423-1-badhri@google.com>
Subject: [PATCH v2] usb: dwc3: gadget: Prevent irq storm when TH re-executes
From: Badhri Jagan Sridharan <badhri@google.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	felipe.balbi@linux.intel.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jameswei@google.com, Badhri Jagan Sridharan <badhri@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

While commit d325a1de49d6 ("usb: dwc3: gadget: Prevent losing events in
event cache") makes sure that top half(TH) does not end up overwriting the
cached events before processing them when the TH gets invoked more than one
time, returning IRQ_HANDLED results in occasional irq storm where the TH
hogs the CPU. The irq storm can be prevented by clearing the flag before
event handler busy is cleared. Default enable interrupt moderation in all
versions which support them.

ftrace event stub during dwc3 irq storm:
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000866: irq_handler_exit: irq=14 ret=handled
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000872: irq_handler_entry: irq=504 name=dwc3
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000874: irq_handler_exit: irq=504 ret=handled
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000881: irq_handler_entry: irq=504 name=dwc3
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000883: irq_handler_exit: irq=504 ret=handled
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000889: irq_handler_entry: irq=504 name=dwc3
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000892: irq_handler_exit: irq=504 ret=handled
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000898: irq_handler_entry: irq=504 name=dwc3
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000901: irq_handler_exit: irq=504 ret=handled
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000907: irq_handler_entry: irq=504 name=dwc3
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000909: irq_handler_exit: irq=504 ret=handled
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000915: irq_handler_entry: irq=504 name=dwc3
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000918: irq_handler_exit: irq=504 ret=handled
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000924: irq_handler_entry: irq=504 name=dwc3
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000927: irq_handler_exit: irq=504 ret=handled
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000933: irq_handler_entry: irq=504 name=dwc3
    irq/504_dwc3-1111  ( 1111) [000] .... 70.000935: irq_handler_exit: irq=504 ret=handled
    ....

Cc: stable@kernel.org
Suggested-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Fixes: d325a1de49d6 ("usb: dwc3: gadget: Prevent losing events in event cache")
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/dwc3/core.c   |  2 +-
 drivers/usb/dwc3/gadget.c | 10 +++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index dfa1b5fe48dc..6df971ef7285 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1835,7 +1835,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	dwc->tx_thr_num_pkt_prd = tx_thr_num_pkt_prd;
 	dwc->tx_max_burst_prd = tx_max_burst_prd;
 
-	dwc->imod_interval = 0;
+	dwc->imod_interval = 1;
 
 	dwc->tx_fifo_resize_max_num = tx_fifo_resize_max_num;
 }
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index d27af65eb08a..fad115113d28 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4467,14 +4467,18 @@ static irqreturn_t dwc3_process_event_buf(struct dwc3_event_buffer *evt)
 	dwc3_writel(dwc->regs, DWC3_GEVNTSIZ(0),
 		    DWC3_GEVNTSIZ_SIZE(evt->length));
 
+	evt->flags &= ~DWC3_EVENT_PENDING;
+	/*
+	 * Add an explicit write memory barrier to make sure that the update of
+	 * clearing DWC3_EVENT_PENDING is observed in dwc3_check_event_buf()
+	 */
+	wmb();
+
 	if (dwc->imod_interval) {
 		dwc3_writel(dwc->regs, DWC3_GEVNTCOUNT(0), DWC3_GEVNTCOUNT_EHB);
 		dwc3_writel(dwc->regs, DWC3_DEV_IMOD(0), dwc->imod_interval);
 	}
 
-	/* Keep the clearing of DWC3_EVENT_PENDING at the end */
-	evt->flags &= ~DWC3_EVENT_PENDING;
-
 	return ret;
 }
 

base-commit: 9682c35ff6ecd76d9462d4749b8b413d3e8e605e
-- 
2.48.1.502.g6dc24dfdaf-goog


