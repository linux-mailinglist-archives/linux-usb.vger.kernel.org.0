Return-Path: <linux-usb+bounces-19690-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D465DA1B131
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2025 08:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8211C3A191F
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2025 07:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29EC41DB150;
	Fri, 24 Jan 2025 07:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZbeLAsxW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBEB1DB136
	for <linux-usb@vger.kernel.org>; Fri, 24 Jan 2025 07:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737705566; cv=none; b=hgCAm5sTwKyRQYJLnb1iutTL16WxpXFmInQAziIpNMPe1/B9p8I3+9Z2s3Jbhb+slzhSnkwmuaE/YYlU8M+PHKF6nHdyoqjE5CNplG27rUjswiAcMwPruDSi7LmCnu/f3SOP1kHBB02wVirIMt8FB6VwGZEtCRRg7dNX0W0eRRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737705566; c=relaxed/simple;
	bh=SEAr4o2GPcY/VIxC0WU6recjoscaZQy6zHJEuMQywso=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=U/R6cwVbHOSjLkMt7JLp8WCZmp2rVd2Euuq4EKfS3EXQhj2Nju2b2JCvz6S8cFIo65ssi4Zh2wTUMkGEpO/fdSuLJ4yzHyKg1QqgmbShMxfKwNk8XP63WAVqP/kiJScnYp2VwJt7NdCWk8r5+Ai79DYjpVFrhZklIE36MuSNY9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZbeLAsxW; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21632eacb31so24350275ad.0
        for <linux-usb@vger.kernel.org>; Thu, 23 Jan 2025 23:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737705564; x=1738310364; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tvMIp44R3FtpENPY8qJDGodHaD57T8o35D4CEU3mG5w=;
        b=ZbeLAsxWBpl4TwcettOqTZnVdS0PgAYnsZyLUaSTcbgrU1+FV3e2+ZUemDPkSTXux8
         FZgVEkmIRd/+eEDWu3HrifCc6eeGcNH9yCbYpOlm/JNQRlaLjhsoalmqI6il6tUFp7ai
         l22VHjSzLzOPBUEGJVqAnd4uW8syYzDGFyVcgjrKWF3I0JYZ4xFrjceKqWsQc3wLb9FC
         FPwWRtQqUjeZUziHCsCw3jh4+jrQZkhSgwWZ2qNs/wAMwxFb8+DJPCIy9bdEIbXfrVze
         6Q9abQyOvDq7Hq/eXPIbPpcYHixyAGOzmN7uSX3wd+g+9XtFarjjCx8+06ebpvh4t+53
         jwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737705564; x=1738310364;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tvMIp44R3FtpENPY8qJDGodHaD57T8o35D4CEU3mG5w=;
        b=I3+IzF6uhS2w0WyqQdLXDWpa9cwOs+QSCs5qAP5bJKQ8JBQcAvQiPaDd/CkMOUmqAx
         U7+8TWWpdvJsdxyX8WraxtATZQ/1u9XPsbDEv/lj+HC5oHgRasj6OzCwV+ORhqA4JWW0
         t8U70/qx94Byhcmx0rBb6EFEweTACFLSO5t4v4aPOFlSQR3yD0LLiG9pOJKVJS9+gpPe
         FatQsfpOG73Y5uP/IwILUPuReKIwF8kZanG3p458M3HVK5i2itP8KIolHl3y21G4L8ZL
         AgESunjiVB8A7ja9PeL3IkuniFrztdXEJ7HZLcM5gzMMZRZM4HnH/+1y0+KlqesXm6CD
         RCtg==
X-Gm-Message-State: AOJu0YxjtfVtr8GaV3q2lDMAALLJn1UOYEOEfflpigNpKrivqbn0X4lK
	TKJiSNobhOZyt5rql3nzE8hWkFV3ks/7NPRXRgZk1Q5iUfch0VGwumMSu0uIMEiJNO8e03ccrSy
	BPA==
X-Google-Smtp-Source: AGHT+IEx/v7k7nacKRbtPfWnK44BqfMKeMONJ12VeacG3MfZDZ51XHDmPYjzUrL/FZdGk6UIwsbdjTXWrDo=
X-Received: from pfbcr10.prod.google.com ([2002:a05:6a00:f0a:b0:728:e76c:253f])
 (user=badhri job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:918b:b0:1e1:aba4:2095
 with SMTP id adf61e73a8af0-1eb21585e6fmr57281225637.32.1737705564412; Thu, 23
 Jan 2025 23:59:24 -0800 (PST)
Date: Fri, 24 Jan 2025 07:59:10 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250124075911.811594-1-badhri@google.com>
Subject: [PATCH v1] usb: dwc3: gadget: Prevent irq storm when TH re-executes
From: Badhri Jagan Sridharan <badhri@google.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	felipe.balbi@linux.intel.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jameswei@google.com, Badhri Jagan Sridharan <badhri@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

While commit d325a1de49d6 ("usb: dwc3: gadget: Prevent losing events
in event cache") makes sure that top half(TH) does not end up overwriting
the cached events before processing them when the TH gets invoked more
than one time, returning IRQ_HANDLED results in occasional irq storm
where the TH hogs the CPU. The irq storm can be prevented if
IRQ_WAKE_THREAD is returned.

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
Fixes: d325a1de49d6 ("usb: dwc3: gadget: Prevent losing events in event cache")
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/dwc3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index d27af65eb08a..376ab75adc4e 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4519,7 +4519,7 @@ static irqreturn_t dwc3_check_event_buf(struct dwc3_event_buffer *evt)
 	 * losing events.
 	 */
 	if (evt->flags & DWC3_EVENT_PENDING)
-		return IRQ_HANDLED;
+		return IRQ_WAKE_THREAD;
 
 	count = dwc3_readl(dwc->regs, DWC3_GEVNTCOUNT(0));
 	count &= DWC3_GEVNTCOUNT_MASK;

base-commit: 70cd0576aa39c55aabd227851cba0c601e811fb6
-- 
2.48.1.262.g85cc9f2d1e-goog


