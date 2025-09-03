Return-Path: <linux-usb+bounces-27486-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A92B41895
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 10:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA0F917AA99
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 08:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7BB82EF675;
	Wed,  3 Sep 2025 08:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wGgpsHhs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE602EFDBE
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 08:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756888223; cv=none; b=P1z/Er3B0CLf6424htVGYhjKtAGE+QQ/0mZQBr+jGu6TXwQtd08eJg/r6WtTvOpLozIyaVFGzIx+EJ8JQEtJZhm0hrN6VsrODkp/xJWmn7Z9y8sM8SMxvS4J3C6mdLYMG57dU9FSI1KbqRKfpqJyKKLDdmkw1UhbMrHQIuEA4kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756888223; c=relaxed/simple;
	bh=J7D8vkknewXqwkovzKpka5NJnRXgTW5zFlPuneM7dDU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=fzUErBf85QjxVtbTR1rsoNclUBRQaBWgLjADbGAkbmo2AuHx8hwUjIZqXPkOR69SUBm6s7/VQj+mlOZbuwUdliP0RKVxlTBrLa8LSnUT+6NIyP1y0XWkqsOgsM9tvwJJQIap7VsqaTYCjk/5330rkSY82roxPj7bTcr8FvOL2DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wGgpsHhs; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7723d779674so3307624b3a.3
        for <linux-usb@vger.kernel.org>; Wed, 03 Sep 2025 01:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756888221; x=1757493021; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fZ7j4se1Omhr/Y7LdW2hY2HsKoJ4kz8N5/Bot5alqdA=;
        b=wGgpsHhs/AAs+WRw2RMf2DptuKUzWc5iMC6jUS0Bd+kG0c5FiyNKsWb3MCQP6xhIUs
         kB5Tq6ZFCvpu2Pd0coFOUFtNUKYevlwGjr7q5utyQg3x6z/MmY8qvZrp21Lv5SAWdoVb
         T9b1Y8oQv0eBtGc77QYH1YxyR6dza3S8AoqrQsJRV3+rdTiqkx1GiUn0Nkfcnxph0F97
         a7LH4P1Nr5sCAW37DH8ALZqnqQq9ypi5l2ig+kOcqX08LMjJCyRKg+Ck3toNNRfa7wdI
         J0HmzWDWU+xU3KPVPxmaDUYStmYZSU0jZTWjyCz1hFgfmvieUuPZUjCaJqXFhpYYPRqe
         T3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756888221; x=1757493021;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fZ7j4se1Omhr/Y7LdW2hY2HsKoJ4kz8N5/Bot5alqdA=;
        b=stSjuniq0/sgScKbmy0tmaVqglywSDqOccnELZy2G2HkEwk49IQR9pP26mzwPFVlaF
         9uxPvwubGcygZlozpb6gbvL8GGVM70PpKCLckvVY8tsCzv+LPWCixmf/lFYmVFM+XbYH
         dPCAXC1uWes96SI9AST261T/lTzcERTZPCCbZwpMQ5jZxmW14oQhpr13vwnNW+wkqtT2
         5mWjACt0SVkVMG3gCu3VW3eVJ9uOnMD6ILWwqjRQ4TtcRcsC+xRp832SetnpqLgpUOTj
         j4Y83zAeta1aBCwNhnRtbUxDrB4Xf6ab0oZri3gPZdVfj+Pn+AY6yAsyzjTMF0XRNgrT
         pPEA==
X-Gm-Message-State: AOJu0YyBB+mrReK41EpJlhvJ92bS7rqFSH3mwYD32IFISfLixpRa63yY
	x/i0jxPW7lAARvFTcvoHpouw9pX0qMdz1pPW56ku65wdmSV3kzGutGqS7j9sQya0liah2NbQEW9
	zAhaX3g==
X-Google-Smtp-Source: AGHT+IECGuG1JyAn+Ycl/1sS/E1Ss4Sbu1q9s8gA4JBtg9nO2+7Bii+IPow+/Sx/8UVzVCE5KsxatOfFfD8=
X-Received: from pfbk6.prod.google.com ([2002:a05:6a00:b006:b0:772:3d03:c274])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:10d4:b0:772:84eb:bbf
 with SMTP id d2e1a72fcca58-77284eb1ce4mr811643b3a.9.1756888221062; Wed, 03
 Sep 2025 01:30:21 -0700 (PDT)
Date: Wed,  3 Sep 2025 16:30:12 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
Message-ID: <20250903083017.795065-1-khtsai@google.com>
Subject: [PATCH] usb: gadget: f_ecm: Fix ecm_opts->bound logic in bind path
From: Kuen-Han Tsai <khtsai@google.com>
To: gregkh@linuxfoundation.org, krzysztof.kozlowski@linaro.org, 
	prashanth.k@oss.qualcomm.com, Thinh.Nguyen@synopsys.com, 
	s.hauer@pengutronix.de
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

The bound flag in ecm_opts is being set to true even if
gether_register_netdev() failed.

Set ecm_opts->bound to true only upon success.

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


