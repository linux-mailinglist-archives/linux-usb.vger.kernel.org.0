Return-Path: <linux-usb+bounces-27179-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D034B312F0
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 11:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97BD062290A
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 09:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DD52EDD62;
	Fri, 22 Aug 2025 09:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l2tAGsDb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86D02E8B6C
	for <linux-usb@vger.kernel.org>; Fri, 22 Aug 2025 09:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854660; cv=none; b=mGIv7cNY6/nLly7X/SyMoubX8dIKJlaiKI+O2Q6cJBHJOensdG1rCFCUFFb9bhzGUwNdk5pj+KEnY+zuWpRQvTf5A+0LFkgyc/MuvMpf3GVIbFsqnybgFV7TRV2KbQi8Uf40B2QYGepsZ4UG4kWFDbKgllCsI1eq0uSIl2VUfDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854660; c=relaxed/simple;
	bh=xBfS/aUPzryTTOAwRCBOYzWxM5jgrtLXSWJgAlMdQhE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ekg6Sx0uSf/jrAsaB8nU9s5jzgTIMWw+tgzLK7RSaMJZACgOcU+VqoW0KI0+HMoU8zhtAvpJkG1u9Ti5Onu5rzzQLgueUvk1qKojQ35GVDxD5dV2uvHJ/LRiIyBh1LYmoAW1jBKMvD/zM8/G19QGHfddtlIuAyzgAKW7wrAPSpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l2tAGsDb; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-32515ec1faeso788955a91.1
        for <linux-usb@vger.kernel.org>; Fri, 22 Aug 2025 02:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755854658; x=1756459458; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yrv7lwvGLFeWfWcOe4UUVpb8JLfLX1obno5+HaM/rlM=;
        b=l2tAGsDbj9j4uPD8wFNKfc0RMkT9rvlXWQxiZ3SbogwFgLhJzfj2CmZz6CDPHl0Ztr
         xzfe8k6ro2qvwidwoqNj7I9tUoNxD82buoQWR5lQN8+DzuNA9dGUH/otzI3SLLjExMb5
         707M3n1rw4pkXQZC+Sq16BJNGU5P5lvHB1Q8lC5BUlKL5L9jntr/7igspySl6vov9/Jq
         JFtwj/uhCVWRwYPb3IQXN45aVmyqzXuPRdKlrlluEPYKczcGC8ikQjMunIEw2vmUPSNs
         GlrNAEKgubzirdsx8jXFold1275YyRnQNN/2Hi5d4sn4dfqjs/vZG+s8w3DCR3tPoFo/
         sZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854658; x=1756459458;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yrv7lwvGLFeWfWcOe4UUVpb8JLfLX1obno5+HaM/rlM=;
        b=Ljmsv7sZ0lrSwoGKmJMvDPZ8bqGp3LUtqhIhRLnVBw62COO9hJZUvNtPli5lTncXME
         30U+rVl1dz7x8K+Lg9DYtIwAVTtgM9+19XdEa5oAd+4GR55/KW73JmjPEmvC5TUl1gpf
         0viGAO4dhhP/+PKbpbv8CMbQTLI3R43Fil+VHkGi/vwsuzvvcYFlfrvKIzOJIBrksr1I
         eupuk4rLl0L1y36CcnTZCZ7S8i5Xbxb77qHGCLAxGHPilJeO54T1KyrqBC27BxnILVAe
         I8F0eMvvifdl0cDjJgKxxMHTlBeLLb+y4Ro7vzCQby/bT/x+LA3jC0J6w73ollfCPrLD
         QtlA==
X-Gm-Message-State: AOJu0YyAe2+Gd7/F9UB5i8VBV6qgg6p0lsqumm24m0ExNNYK8z/yLVFA
	Lks/H5QefYGnAPsCbKYAu6fjGxR8kckt/h/Q4sYs624U1pY6E9Smg+lkr4kaW9Ij3UDQLFYHZqK
	jnJH+tQ==
X-Google-Smtp-Source: AGHT+IFM1v6jfSSYzAEfLVNCVVilohJmWgKU4BYWL6TUTKngyH5l8ic3ymYK1v8JHYZOj4JOaVKofm7nx9c=
X-Received: from pjh3.prod.google.com ([2002:a17:90b:3f83:b0:325:23da:629b])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5101:b0:313:2206:adf1
 with SMTP id 98e67ed59e1d1-32515ec3611mr3371270a91.4.1755854658316; Fri, 22
 Aug 2025 02:24:18 -0700 (PDT)
Date: Fri, 22 Aug 2025 17:23:46 +0800
In-Reply-To: <20250822092411.173519-1-khtsai@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250822092411.173519-1-khtsai@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250822092411.173519-2-khtsai@google.com>
Subject: [PATCH v2 2/2] usb: dwc3: Refactor dwc3_mode_show
From: Kuen-Han Tsai <khtsai@google.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>
Content-Type: text/plain; charset="UTF-8"

Use dwc3_mode_string as the single source of truth for mode-to-string
conversion.

Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
v1 -> v2: Added the Acked-by tag.

 drivers/usb/dwc3/debugfs.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index ebf03468fac4..d18bf5e32cc8 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -402,6 +402,7 @@ static int dwc3_mode_show(struct seq_file *s, void *unused)
 	struct dwc3		*dwc = s->private;
 	unsigned long		flags;
 	u32			reg;
+	u32			mode;
 	int			ret;

 	ret = pm_runtime_resume_and_get(dwc->dev);
@@ -412,18 +413,15 @@ static int dwc3_mode_show(struct seq_file *s, void *unused)
 	reg = dwc3_readl(dwc->regs, DWC3_GCTL);
 	spin_unlock_irqrestore(&dwc->lock, flags);

-	switch (DWC3_GCTL_PRTCAP(reg)) {
+	mode = DWC3_GCTL_PRTCAP(reg);
+	switch (mode) {
 	case DWC3_GCTL_PRTCAP_HOST:
-		seq_puts(s, "host\n");
-		break;
 	case DWC3_GCTL_PRTCAP_DEVICE:
-		seq_puts(s, "device\n");
-		break;
 	case DWC3_GCTL_PRTCAP_OTG:
-		seq_puts(s, "otg\n");
+		seq_printf(s, "%s\n", dwc3_mode_string(mode));
 		break;
 	default:
-		seq_printf(s, "UNKNOWN %08x\n", DWC3_GCTL_PRTCAP(reg));
+		seq_printf(s, "UNKNOWN %08x\n", mode);
 	}

 	pm_runtime_put_sync(dwc->dev);
--
2.51.0.261.g7ce5a0a67e-goog


