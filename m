Return-Path: <linux-usb+bounces-37974-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UK1hKIPHEWpApwYAu9opvQ
	(envelope-from <linux-usb+bounces-37974-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 17:28:03 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 442355BFA78
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 17:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A156C30087F9
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 15:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980D430C60D;
	Sat, 23 May 2026 15:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdkD1N5W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4CA28DB46
	for <linux-usb@vger.kernel.org>; Sat, 23 May 2026 15:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779550081; cv=none; b=AH5r/U6I4S65o4F1vx4mYJAEf4zL03pqn7KRscLxBVLT5/9lu8w63Lg+MkxnrTmS6szP37m47cz06TJrsHFzPrw50+i5lSsiuELg4nFxftM4EQRadDF3Ncc0nv1WJWdO5oOrwfog+U1aQ/Ay1S/acWnz5fNosoh/X2kBgkJoUaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779550081; c=relaxed/simple;
	bh=BYzGSzwVskCyUgvPX1pCwcDkXR9mWKSVLYBOavmncGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LCJfkH4TK1ZEr+noPlHII17L4qkzJlg/3Uh3DEyHZiGBDr7kbicq+tWFf5bYZTyBO/ePCg1dZWFWODhw1qCzaUezcJYzAozI7WDMCw45sfzVE5cixu7Fy2Z1KwoZBoiO4qc+XpKCrUviIjp3TR+RQU4SV0SnFPreQT5N/yagySA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdkD1N5W; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-834f1075805so6437363b3a.2
        for <linux-usb@vger.kernel.org>; Sat, 23 May 2026 08:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779550079; x=1780154879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=STeyAHz8huFsIROfqu2tsbEyvrvCu1lCeBtg8Cf0meA=;
        b=fdkD1N5WH83jjS2d9hSUCxok7MwMejQ1dQ4WBL4SZjFqnl+aXWwknJmyI2wPa0Bau2
         n2BkKdI9folDl5/pdYW8LstRT03neGmDA39xCn/p3XmFs/DsybD2375zJzajSr/eC5qu
         35Tc8iDa3507LQbzffoXGGzv0M5ecc/R5weL/B5YR7hqXRnvX/3I9ILOqZ4tlaEmBrsi
         FAy5eLA0oE86E1aYmKThVl7YSK1W0Pm2dQfRdO8YHnqir9y6lDn4Achl1GHo3SVjm22j
         xoQ961/A8vb5wjuVe4MRfTfguCAPqNDAhzqL/DrMs9JLrvSQfzNMuhEGr5D3f5b7cIcI
         qL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779550079; x=1780154879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STeyAHz8huFsIROfqu2tsbEyvrvCu1lCeBtg8Cf0meA=;
        b=lDw8h2xcWxuKvku4KxCcrQF6OwOqIn5Rb4IYjhgJlGwsq/E7daVCHMFnRBGGOosNKt
         HL/3cBSsJlW+c4ixt0WfVKkmTmdpPhKZEajjTntc00OasTPweYg2nh1pIs1DaBlb7tYK
         Ob4bH1RKp46++ewqXfd+wSgGdXSGhfjRKy2w8eS/h3iegkaqURfUrHciD6uCkr1ZPkdl
         +NXhVpqHkXbeLJwgvfAiLkzDyv5szVwD9c+W0t/3VtAz0JfyIjeF25q2VYXsbDqtZ+9/
         4hgcTUa4SeMuUu1hEdiY3Hbl3PIPdisHmxJmKRUVk4RK1wlyQv7lhfw2DBK+RN7VnTw4
         aU5g==
X-Forwarded-Encrypted: i=1; AFNElJ9ukMuj5DSqdtLCHCxDzTgvdp/5TTVfctNIuL3XtINEKNzSCs/6SNtrU71ZKgIbKduwPTvkr4bCLYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLVl5VTogGIKbtildaKP0gVrlJ4dUMoKUsRUjF8Ua1pbCfVE/u
	EoCKztBNX5KJRp9ucPDV09JMCq79vkGj44UW/kogDCuGysbeCvNCG4AZ
X-Gm-Gg: Acq92OFVy4oSNxwV+NmXGhE07C+fn9g72M24SxIw5sKuOEG+ItzWnxokWVVDfC1gMad
	e1HEt0mbIOQS67AQW0lyyRCbtEROat72fhFPZFZRjXOf3hg0vdRF8eYxGRBcUQicUBaW5zfuEBx
	L6i+jUlz0XyeNGKz6BFK2M54Bfly4fdJaw0j1oBlj1Fkag/Rb2VPktHDMHEGqhEwBnG7h6opkgX
	cBwfxb9esVJJ+U5dvyyaq2bxoCoRMpQTt9zzv7HXPXU0AvK9ItW3+Uh3/QpBA3Vp2suK3UMhOMX
	Mqug9PUbx196NNvSfemXUQQdG4RpEOuqaZ9tsGeOhcVdn/m9bSkOwlgFQzMdJKBBuP2UosG9ZYF
	/mdTwXfvBFCm/8gPDVT3W/LWJ+bHt0ZiD3vEC2VNrthokEa7Jmc7Ru0wEDx951fQgZA6R/ig9XI
	juKRt+HsRbRwyTVx4BesvYhewV/Cf1xYjLN+V6OJIiCEDIYkZo/fUepv5T304z
X-Received: by 2002:a05:6a00:f8a:b0:83a:4846:90bf with SMTP id d2e1a72fcca58-8415f3a13c9mr8207941b3a.43.1779550079097;
        Sat, 23 May 2026 08:27:59 -0700 (PDT)
Received: from KIPREYXIAO-MC2.tencent.com ([2409:8a00:1892:2b90:7d54:8390:eded:819])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9b5asm4945621b3a.12.2026.05.23.08.27.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 23 May 2026 08:27:58 -0700 (PDT)
From: Zhenghang Xiao <kipreyyy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Cercueil <paul@crapouillou.net>
Cc: security@kernel.org,
	linux-usb@vger.kernel.org,
	Zhenghang Xiao <kipreyyy@gmail.com>
Subject: [PATCH usb-gadget] usb: gadget: f_fs: clear stale priv->req/ep on DMA-BUF transfer completion
Date: Sat, 23 May 2026 23:27:39 +0800
Message-ID: <20260523152739.66340-1-kipreyyy@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37974-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kipreyyy@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 442355BFA78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ffs_epfile_dmabuf_io_complete() frees the usb_request via
usb_ep_free_request() but never clears priv->req or priv->ep. When the
host later triggers endpoint disable (via SET_INTERFACE, disconnect, or
gadget unbind), the completion fires and frees req, leaving priv->req as
a dangling pointer. A subsequent close() or FUNCTIONFS_DMABUF_DETACH
ioctl then passes the stale pointer to usb_ep_dequeue(), resulting in a
use-after-free on the freed kmalloc-128 object.

Walk back from req->context to the ffs_dma_fence and its priv, then
clear priv->req and priv->ep before freeing the request. The cleanup
paths in ffs_epfile_release() and ffs_dmabuf_detach() already check for
NULL under eps_lock before calling usb_ep_dequeue().

Fixes: 7b07a2a7ca02 ("usb: gadget: functionfs: Add DMABUF import interface")
Signed-off-by: Zhenghang Xiao <kipreyyy@gmail.com>
---
 drivers/usb/gadget/function/f_fs.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 002c3441bea3..88d3e89c21b7 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1413,8 +1413,13 @@ static void ffs_dmabuf_signal_done(struct ffs_dma_fence *dma_fence, int ret)
 static void ffs_epfile_dmabuf_io_complete(struct usb_ep *ep,
 					  struct usb_request *req)
 {
+	struct ffs_dma_fence *fence = req->context;
+	struct ffs_dmabuf_priv *priv = fence->priv;
+
 	pr_vdebug("FFS: DMABUF transfer complete, status=%d\n", req->status);
-	ffs_dmabuf_signal_done(req->context, req->status);
+	ffs_dmabuf_signal_done(fence, req->status);
+	priv->req = NULL;
+	priv->ep = NULL;
 	usb_ep_free_request(ep, req);
 }
 
-- 
2.50.1 (Apple Git-155)


