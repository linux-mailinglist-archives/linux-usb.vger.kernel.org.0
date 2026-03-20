Return-Path: <linux-usb+bounces-35236-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PsFKQ8MvWkO5gIAu9opvQ
	(envelope-from <linux-usb+bounces-35236-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 09:57:51 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2974B2D79AC
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 09:57:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E403B31270AC
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 08:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883AD376484;
	Fri, 20 Mar 2026 08:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jIUegXOV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E434B375AB5
	for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 08:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773996921; cv=none; b=ZcXBkDm42Iw6VppYd/zZF9njBCxfVwHcNiaiXRWJnBr9LBKOQUIVAAZCPAS7j5LPngYSG4fZTn20zJ/mDgbF03QXYPMY7pvUDfZZeorDDkOy8FG2NFKUpBG0OlIaC+LkcC0RnXZ+38tJjp+V4mgowVE7w+3uKiC8jtOFtCORpOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773996921; c=relaxed/simple;
	bh=GaK3fnyt6sUtJdGJ1MYlD0Zj97Sh5Zjn/UmRR+fsbns=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VUcWOqNcASwKI6JZF6asKogAFmLmJ+T8drgUfIWeHs/DFQ5GAfg3PfKiYv7Kgn943idf3dCt9he8P3wECzMBhDaDSRxtwSuDO3KhM9HeuV9W3bfi91bzyogKD+96FFN6pI1T974nA1jriTwOMmZlYKlk5xGbjMR96Suqkv/7nNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jIUegXOV; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-35b9246248dso1545065a91.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 01:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773996919; x=1774601719; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WgV220nsjvXYUtCcSN6gGHf35gDIvTt1U7idg/3OBAg=;
        b=jIUegXOVMODGeq7BYevvelsOBx0iDFcukCVoxXqPAx1lvGDcVjngh3jzkgcXwAikrU
         v17PHO5tTHqnwkpnqWrRKhpvHtvIcNQ9nIlAbDT6HvZA3rtyWcTjXc2ewudEI2zgBjyD
         WTwAt8lAcNedTr/yYL6wu+I7ImbKsusnGS1C83eChbifDSGcafhAkbyXWXbnPIR2Jk8r
         0kdNudl1ZMFAQPffrTxzR+AVlay75kPk5+gYgOaeD8qQyjPAmTeCg1pNFlfPc9CNTsca
         IZ22fP1m7wQOj9TrvgDp7rpZyCcN/gIicfbsAQlvMHXhy6od7AFXIhJ4HX3S4j677tX2
         Mn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996919; x=1774601719;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WgV220nsjvXYUtCcSN6gGHf35gDIvTt1U7idg/3OBAg=;
        b=UDTg4vuWZuT8Q5l7cBPXfPP5CAvkA4iaawJxIpgR20fLxbSqA6a571dVlXgrgQ8+/I
         EfN3gF4/ocfxzhTgHZqGsW2AHevbsoJK6zs0Xwro/EW7DsMT/j0iEbTx964AQsVOE9s0
         2G3Fp/4mzS5Kebp82gYhKTx0mPrB8IoSZCVrInnGODQldyLp6+xURL28gt97wBW9kFbq
         /vBOqXVT5y/REsNQg3HaKclnbJqWbxcuQVeqTK6lz9XoG+POfnAHPp3i9g5DTTa9v54/
         RzRv7WmNpre7VsIe7PSkdcxM5Xfz98nHUPpQA9FGfgwygiR+lW8AN5jxTjW/MJ01n7r0
         MreQ==
X-Gm-Message-State: AOJu0YwAa97mqxSwD4iVetgs5dCvYPT65xqK1ft93apdpQzTvY9n6P5s
	U1qxz/kKHvNQsAuOkH+dWR3KqiL6PWfDUkKuYTY/Lm0kIWxkuBlpkRs/zDMd6e+oy+UWllwgnsF
	SEwfgdQ==
X-Received: from pjzl15.prod.google.com ([2002:a17:90b:78f:b0:35b:9114:f5fe])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:184c:b0:354:c593:b1a8
 with SMTP id 98e67ed59e1d1-35bd2be16b5mr1830414a91.13.1773996919107; Fri, 20
 Mar 2026 01:55:19 -0700 (PDT)
Date: Fri, 20 Mar 2026 16:54:44 +0800
In-Reply-To: <20260320-usb-net-lifecycle-v1-0-4886b578161b@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260320-usb-net-lifecycle-v1-0-4886b578161b@google.com>
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773996915; l=1297;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=GaK3fnyt6sUtJdGJ1MYlD0Zj97Sh5Zjn/UmRR+fsbns=; b=+/IvBeyEb1KCNPGCJl7fYirjn/sIcTPTyTsiNvrttl0wrz+0QELKMA77pGV/5JzGwEn4uyrqU
 1JFgAyJdvwDAYFphJqt0GWYWcl0P/WoopApWoF1kDXk2/A0+tEL7oab
X-Mailer: b4 0.14.3
Message-ID: <20260320-usb-net-lifecycle-v1-1-4886b578161b@google.com>
Subject: [PATCH 1/7] usb: gadget: f_subset: Fix unbalanced refcnt in geth_free
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Felipe Balbi <balbi@kernel.org>, David Lechner <david@lechnology.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35236-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khtsai@google.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2974B2D79AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

geth_alloc() increments the reference count, but geth_free() fails to
decrement it. This prevents the configuration of attributes via configfs
after unlinking the function.

Decrement the reference count in geth_free() to ensure proper cleanup.

Fixes: 02832e56f88a ("usb: gadget: f_subset: add configfs support")
Cc: stable@vger.kernel.org
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
 drivers/usb/gadget/function/f_subset.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/function/f_subset.c b/drivers/usb/gadget/function/f_subset.c
index 076072386e5e..74dc6da5c767 100644
--- a/drivers/usb/gadget/function/f_subset.c
+++ b/drivers/usb/gadget/function/f_subset.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2008 Nokia Corporation
  */
 
+#include <linux/cleanup.h>
 #include <linux/slab.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -449,8 +450,13 @@ static struct usb_function_instance *geth_alloc_inst(void)
 static void geth_free(struct usb_function *f)
 {
 	struct f_gether *eth;
+	struct f_gether_opts *opts;
+
+	opts = container_of(f->fi, struct f_gether_opts, func_inst);
 
 	eth = func_to_geth(f);
+	scoped_guard(mutex, &opts->lock)
+		opts->refcnt--;
 	kfree(eth);
 }
 

-- 
2.53.0.959.g497ff81fa9-goog


