Return-Path: <linux-usb+bounces-30010-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F18C2B984
	for <lists+linux-usb@lfdr.de>; Mon, 03 Nov 2025 13:18:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7E7DE349398
	for <lists+linux-usb@lfdr.de>; Mon,  3 Nov 2025 12:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032C130AD08;
	Mon,  3 Nov 2025 12:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h5VYnZri"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECFA78F2F
	for <linux-usb@vger.kernel.org>; Mon,  3 Nov 2025 12:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762172302; cv=none; b=msijqt0S7xzIbK+vPHmo6Xk+vYKSGWq2bYdjsRjy5WJrQftgF67jVpMukVCLN8L4zo9pY6YcSk0dKOEXncCwlq5AzBK1iI5aTy+2765VwowcJMQbIsHuYrAsgo9S/Mta9TpSlIdkwYlX3SdiB00fJX3goyUDMV4CRh1G4/vWNsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762172302; c=relaxed/simple;
	bh=lCBHxR560VrCvyH/VPyQ9rGtbUvg+uTp3AfswUNaCwU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=BuUzeeO61ANYAEMvvIUo1Xs2ZIjL6nLaOZvZJNb1cT+mXeNgS50irpP/5PiTpMeBjKJb6JmwE66u7xvnjs5C5AQqV+OnWS117Gd7xQe7dXw4NCPb7TxX2yDiiIrQJQv3NCzoyLno3ZuO4CIm222xu/j+th9cNUXal6i26aI3h0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h5VYnZri; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b9ceccbd7e8so743895a12.0
        for <linux-usb@vger.kernel.org>; Mon, 03 Nov 2025 04:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762172300; x=1762777100; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2LD8GK3pIPbr0iXGHwDU1sX6lg+zmtmtG9m7gSTkkV0=;
        b=h5VYnZri6xNwSQol3pNsLuHJmX6AwlOu/WL09o/gVftXSrN3SQTrtJxTtAOYXU6piS
         l2OnNx0a9S9xPlJqT+rmkA0EnKOPaOItrO4p3WjbzG6DZuJyrATHW1cZy+NsmvV8u1U7
         kRUJwmYxoDbfMPnUO8jZnlc+nJcWid5vIV2vzja425s4LuCbS5XgSq7gmydLiaxkKaW0
         OFy0Hw6UVnQ8U4ABim7MuIPMFchT0W+QMVsv3Z685Hkock+wcon/WhDv/Q8O3f99mAG5
         c6uDxy5xlzabw7YIrLJxoC3604gp8KiEGg+jc038OujLWZCa6JO69E+JZQS6rYwELR/N
         Adeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762172300; x=1762777100;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2LD8GK3pIPbr0iXGHwDU1sX6lg+zmtmtG9m7gSTkkV0=;
        b=msQf8N/PjlWX9rNV27JCPwvPb17C5JB9NhMygoJ9/afj1YabbSsvwgK1LIOx4TlQXS
         LxGk6jfADSrTuARFZpbY9hS9jG7WUjo9e6XRmT5HWKwIom8ZuJa7kVtWqHsG5HHFqGOI
         yC/M9+qlz7itqkU1bOJ+4xKyKe3CYfdnHavCG/5ym0tZotqgVi0t8U9yAgifZZaJqrKC
         mpAI0Z6xOIOQFbeXla7gFiZrTDheO7ZHErXSHISI6cctCdXveKCLUzkQZet1G1mw2Mpg
         oR0Y7MizYnzriIFbbKWL0JVO5v1KdI+bBysLtQREo70CIRmKwo0g1SK6c7rmrfjRSYwq
         9Cqg==
X-Gm-Message-State: AOJu0YzSBLUfvMibSUOlctYeYuQEc0rN5Qxtk8BnHYKZYmJZCEFY6VJP
	zIoOz8BFtEGCpsoiWoDCZXkh9kj8l2S3sE/MQgRai8Nr4VXQmVyD7naJSv6f7taCJ7cswPjnyJa
	v+dNdjw==
X-Google-Smtp-Source: AGHT+IFYj2bc2+wvjxhjaaBXfWAhANMdDhDx7DCRHrEyTF9mpAjtjHhPdTtptoJl8tKopX/K0DGDgh01h+U=
X-Received: from plcr17.prod.google.com ([2002:a17:903:151:b0:295:5580:89bd])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db07:b0:295:5623:e59b
 with SMTP id d9443c01a7336-2955623e7e9mr91846145ad.32.1762172300352; Mon, 03
 Nov 2025 04:18:20 -0800 (PST)
Date: Mon,  3 Nov 2025 20:17:59 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251103121814.1559719-1-khtsai@google.com>
Subject: [PATCH] usb: gadget: f_eem: Fix memory leak in eem_unwrap
From: Kuen-Han Tsai <khtsai@google.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

The existing code did not handle the failure case of usb_ep_queue in the
command path, potentially leading to memory leaks.

Improve error handling to free all allocated resources on usb_ep_queue
failure. This patch continues to use goto logic for error handling, as the
existing error handling is complex and not easily adaptable to auto-cleanup
helpers.

kmemleak results:
  unreferenced object 0xffffff895a512300 (size 240):
    backtrace:
      slab_post_alloc_hook+0xbc/0x3a4
      kmem_cache_alloc+0x1b4/0x358
      skb_clone+0x90/0xd8
      eem_unwrap+0x1cc/0x36c
  unreferenced object 0xffffff8a157f4000 (size 256):
    backtrace:
      slab_post_alloc_hook+0xbc/0x3a4
      __kmem_cache_alloc_node+0x1b4/0x2dc
      kmalloc_trace+0x48/0x140
      dwc3_gadget_ep_alloc_request+0x58/0x11c
      usb_ep_alloc_request+0x40/0xe4
      eem_unwrap+0x204/0x36c
  unreferenced object 0xffffff8aadbaac00 (size 128):
    backtrace:
      slab_post_alloc_hook+0xbc/0x3a4
      __kmem_cache_alloc_node+0x1b4/0x2dc
      __kmalloc+0x64/0x1a8
      eem_unwrap+0x218/0x36c
  unreferenced object 0xffffff89ccef3500 (size 64):
    backtrace:
      slab_post_alloc_hook+0xbc/0x3a4
      __kmem_cache_alloc_node+0x1b4/0x2dc
      kmalloc_trace+0x48/0x140
      eem_unwrap+0x238/0x36c

Fixes: 4249d6fbc10f ("usb: gadget: eem: fix echo command packet response issue")
Cc: stable@kernel.org
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
 drivers/usb/gadget/function/f_eem.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_eem.c b/drivers/usb/gadget/function/f_eem.c
index 6de81ea17274..edbbadad6138 100644
--- a/drivers/usb/gadget/function/f_eem.c
+++ b/drivers/usb/gadget/function/f_eem.c
@@ -477,8 +477,13 @@ static int eem_unwrap(struct gether *port,
 				req->complete = eem_cmd_complete;
 				req->zero = 1;
 				req->context = ctx;
-				if (usb_ep_queue(port->in_ep, req, GFP_ATOMIC))
+				if (usb_ep_queue(port->in_ep, req, GFP_ATOMIC)) {
 					DBG(cdev, "echo response queue fail\n");
+					kfree(ctx);
+					kfree(req->buf);
+					usb_ep_free_request(ep, req);
+					dev_kfree_skb_any(skb2);
+				}
 				break;
 
 			case 1:  /* echo response */
-- 
2.51.1.930.gacf6e81ea2-goog


