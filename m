Return-Path: <linux-usb+bounces-27536-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CD3B432D4
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 08:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD87C682581
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 06:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35C8286880;
	Thu,  4 Sep 2025 06:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tx8cSZc/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31882848AC
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 06:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756968728; cv=none; b=UlOpqeCVQToi/DyFrO8w+Jy+Mugr6Ax+4J9n8mo/iIWdCQXTukHoE8VdKc8rvmhs/Y8r5dgltKsUNn/Fpe1Uw5thdgNWrwxaJIB+fz+faIP6CxqScstzIGfwblO3kWM5nOIXrZ7tQcjjxZSpgwCPwTS1pe+MdDiPiNOJSDHWKqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756968728; c=relaxed/simple;
	bh=1+0suipFAqPVK2b39xso4IDF2mC8kFIado6DrgEAJ0w=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=BEmg1AhN/DEFYGWRVn+9oQ2oX1T6IUJYpfbTzp1ZvhMF0MnwWPV69eyv0heAIah2h8NC8M/Q3UJdGOtAbgvvOaEHJAu43YERkJ5JsZhfmpPfW+wEhrC30l1wirVVxAkhNRlwyUnsCwyXQBCoJFuvHnb+O0QNHF8fIDhumsQkoec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tx8cSZc/; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-24b2b347073so10324175ad.1
        for <linux-usb@vger.kernel.org>; Wed, 03 Sep 2025 23:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756968726; x=1757573526; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JHPzyeNqj1Mzv1xbWbzAD1fU2zO4WV3m0mAuAIf2PJM=;
        b=tx8cSZc/rZOouBuojaQn/enUOnbRburCNK/OYphIMP4uo925myK85HfL9QqLMwxy2c
         jDQr1UnFBSX+3BbyfkQRPaT1hiJTaKtOjXt7tbF6qHfd2TZ7z4EX+aolQQOWypHJQ67l
         +ww6EkPpmaZXjyDAs3Zd8FRsR/uiuVN0uokreT7kEASz3Hz2pjxL2vo6+g7MeylZUuTn
         nSaNrpq5QHXE1Jl7NNKAyRHrZRurIVVcTeUGU4dn11ht28gB6wgXnY6KVzHWqtRCP2M4
         m5VjQQaaZ/CXuKq6gXMrGFpG+6OU/jc/0+kIsxIzcvQs8vukH2nwCr5a4ATmc7h4WWlQ
         /1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756968726; x=1757573526;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JHPzyeNqj1Mzv1xbWbzAD1fU2zO4WV3m0mAuAIf2PJM=;
        b=HicBBQuFnMKOTn3cyx/hYftyDyL/p5D2bQi1SFhp2JEkQEmMcwj0x6lYWPjG7z1IVT
         x5oQk3iSyv+udsAU9YfKKEHBZcEbfAIhSM4TASDd7PXe1bsGuKULE3S0whC9MypAA2xi
         W3/wJ1uam37n/A+jXAEEXC87TlcmLPUYTyVd2l8wz4mLxGs7IfU+vlOh0qTxghGLIK0T
         yEpKBfVBrKeRIvjW5BdN21pX5bSr/ckAT2M/3PyxkefBnxIWPMBTphWwtAXJTL/4xdUC
         XxPTJTwU+SRilShskQ73g0RUJHez42hMBrOhRjGO+n9Y1nNy22SgOAdp54mcGFdzYRfb
         Vu0A==
X-Gm-Message-State: AOJu0YyPi7iaqiHQwQKLQkqZAt6+yEUKYiwY3h69/PYkpN+5BHcZwoo+
	00XQHixeazkNgrVp9OKo62Br3Y3ya9pVnO840YHim3VH8f0c2Tf4kbL4eSGLkaWMhtl8n/gWWKf
	/3XeBNw==
X-Google-Smtp-Source: AGHT+IGZvnH/NPgDPtqoHtlb8P8AkmPCwzvfM8VsiPQXxFU9ve/Or9NoleMaOm66Sy1x0f744LyDOKwku1s=
X-Received: from pjbpx16.prod.google.com ([2002:a17:90b:2710:b0:32a:a943:aa8a])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c949:b0:246:6a8b:8473
 with SMTP id d9443c01a7336-24944aed0f4mr207987455ad.45.1756968725972; Wed, 03
 Sep 2025 23:52:05 -0700 (PDT)
Date: Thu,  4 Sep 2025 14:52:00 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
Message-ID: <20250904065203.1162629-1-khtsai@google.com>
Subject: [PATCH v2] usb: gadget: f_ecm: Fix ecm_opts->bound logic in bind path
From: Kuen-Han Tsai <khtsai@google.com>
To: gregkh@linuxfoundation.org, krzysztof.kozlowski@linaro.org, 
	prashanth.k@oss.qualcomm.com, Thinh.Nguyen@synopsys.com, 
	s.hauer@pengutronix.de
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

The bound flag in ecm_opts is being set to true even if
gether_register_netdev() failed.

Move the assignment of ecm_opts->bound to after the success check to
ensure the flag only reflects the true state. The race condition on this
flag is not a concern because the caller, configfs_composite_bind(),
binds functions sequentially.

Fixes: d65e6b6e884a ("usb: gadget: f_ecm: Always set current gadget in ecm_bind()")
Cc: stable@kernel.org
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
 drivers/usb/gadget/function/f_ecm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
index 027226325039..9f5ed6f32a62 100644
--- a/drivers/usb/gadget/function/f_ecm.c
+++ b/drivers/usb/gadget/function/f_ecm.c
@@ -690,13 +690,14 @@ ecm_bind(struct usb_configuration *c, struct usb_function *f)
 
 	if (!ecm_opts->bound) {
 		status = gether_register_netdev(ecm_opts->net);
-		ecm_opts->bound = true;
 	}
 
 	mutex_unlock(&ecm_opts->lock);
 	if (status)
 		return status;
 
+	ecm_opts->bound = true;
+
 	ecm_string_defs[1].s = ecm->ethaddr;
 
 	us = usb_gstrings_attach(cdev, ecm_strings,
-- 
2.51.0.338.gd7d06c2dae-goog


