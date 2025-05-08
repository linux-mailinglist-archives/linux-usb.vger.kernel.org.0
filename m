Return-Path: <linux-usb+bounces-23796-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F87AAF1D1
	for <lists+linux-usb@lfdr.de>; Thu,  8 May 2025 05:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 828817BB05C
	for <lists+linux-usb@lfdr.de>; Thu,  8 May 2025 03:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAC5204F90;
	Thu,  8 May 2025 03:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WdiC7YSb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EA82A1BB
	for <linux-usb@vger.kernel.org>; Thu,  8 May 2025 03:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746676046; cv=none; b=hCvDZUCQvDVSi4VWleWhSKA2/h0eQ0NUIOjJE3kSqekxzo+DSCF18y+PlE178EExbP70zKnfKaJL403epVQFDd68vjYkM6TkvUoAyfL+T+YNfuKf7GBxXKeKnojQZKp4aoPuHFP57DeVl/ACKxR16xlAyoVyb9UChRNUVWRNZMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746676046; c=relaxed/simple;
	bh=gMvqmUDQloM/OGi8vQ9oaLiFubDBuCvPI4E4jN9iTYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rz4WXj7WPfUy6SV2YP4cTqeP3MheMqVvQuGyiMnrEc66xINy+r6QoAqwUQ+1T8UI2lGj3SD4bcaEn0KGv9sOz6aBhSQChvZRKXwEtwDWtljx0NwIQv1RBfbVLTHtgzf2I+bPGZSqBJzyRa/T7i6euWto3lFDmf42bMNeqQZG8SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WdiC7YSb; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22e6a088e16so4351835ad.1
        for <linux-usb@vger.kernel.org>; Wed, 07 May 2025 20:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746676044; x=1747280844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ajwTuAXKGu9zIQucAwG1LBx8zev6+XMsQE6hj821iRA=;
        b=WdiC7YSbT0gO+yuQ54FzHmEEWfEJeB7xpCmD75sMK38l64VJCzVfLcikwmDxkD8vg0
         u3d2HEyC0pLhoKGDDnVPqY/lFC79uBR1MYQUd2OoxiDemlcxzisuo5+h1LjbAoDozfeZ
         XEhyO5doG3AvctrR3Jae0QS5m5LMZgonyX+0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746676044; x=1747280844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajwTuAXKGu9zIQucAwG1LBx8zev6+XMsQE6hj821iRA=;
        b=I0UklFUNP7tyS2PmWtnYQpm0tg29fvIl7REaUBNaw6FmRmfJDHF1v4vJCpfPRPwk3W
         t3VaQJ6WfrfmwkSzkT41t7oy/fEpGp4g+0EEYj+K3tg/biYcAwT3F9zfmKSH9s0lbgHo
         BQyVSJrAvgNA31MkPitWtoOY8joPsf5mXdfTSEOgQTZYIioQAZ/+WCT86AbtykSM+Pyk
         AurblbO0IKgQoNWb/5KF9O6mkGcNKL5mpO835BCBEDse4ZmzwNpjLYP2yYffunY4rLSZ
         zalGcc/0QROYW3MwBgP3f1l5CRd7WhKDjV4ZngTMulqzTMzeh51zgOHFy4yykQI9Rx21
         lakQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRHqQ+GCFUWwBrq8mCJritFaS25pNxW/WYasuanH6OGJPfktEIl9UWms9+taOZb4k1XKCn4/HUHpI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGEoR1FRPQ8AczDkhJmURgwZK1Zw2fjMwgsLiGY8OHKY56jnVH
	PxtwvcKYAB+VvBhoKPrKJz9u3js8qzOeAyY03ist1LIICJzbRsjG8CwKBcG2YA==
X-Gm-Gg: ASbGncs/fdzEHwlOSge1Lygq8RVdIov9yQEqcRvSPobfqa+Dkq6wkZLRNSkBOLEcWgU
	mqTbQ69XAjRfdUknAj9t9l9T10yp00teaxuJ/ZBqnSWQciHk8wuqcRSMthnReNrRaD+hgIi0iiV
	PQwxoN6lCHpM49rSBDVpXhhWPqVcFFtlpJ4d/VwUotrx0dFjCUFEgnomZ4Lu204VLvBwYHaMdRF
	OJI8LsZVVjhd8pfqGRXv1eKLtztsvBFyxsFJ3uH6zjso+euIC4sDk7UN/eSbhhhUK8RZO2LH2VO
	HReoBZwHj4E1Pt7m3x4hE/pI1rlVL0ttxjgJMYLv14bA
X-Google-Smtp-Source: AGHT+IGcl17l7VZA4rVy6AOSJ6DC+M8PTTH8SKwAHZrFUgJBfGe+LwYpbZdpVLRwNYkh8vHIu6cVwQ==
X-Received: by 2002:a17:902:fc8d:b0:22e:457d:3989 with SMTP id d9443c01a7336-22e845bcb87mr29979685ad.0.1746676043927;
        Wed, 07 May 2025 20:47:23 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:c794:38be:3be8:4c26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522916esm102263245ad.196.2025.05.07.20.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 20:47:23 -0700 (PDT)
Date: Thu, 8 May 2025 12:47:18 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>, 
	Michael Jamet <michael.jamet@intel.com>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv3] thunderbolt: do not double dequeue a request
Message-ID: <ojkrbtd2kpweo5xcfulfobdavj5ab3ysxxle4kr5oa455me77s@p2o4jdwsr3m2>
References: <20250327150406.138736-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327150406.138736-1-senozhatsky@chromium.org>

On (25/03/28 00:03), Sergey Senozhatsky wrote:
> Some of our devices crash in tb_cfg_request_dequeue():
> 
>  general protection fault, probably for non-canonical address 0xdead000000000122
> 
>  CPU: 6 PID: 91007 Comm: kworker/6:2 Tainted: G U W 6.6.65
>  RIP: 0010:tb_cfg_request_dequeue+0x2d/0xa0
>  Call Trace:
>  <TASK>
>  ? tb_cfg_request_dequeue+0x2d/0xa0
>  tb_cfg_request_work+0x33/0x80
>  worker_thread+0x386/0x8f0
>  kthread+0xed/0x110
>  ret_from_fork+0x38/0x50
>  ret_from_fork_asm+0x1b/0x30
> 
> The circumstances are unclear, however, the theory is that
> tb_cfg_request_work() can be scheduled twice for a request:
> first time via frame.callback from ring_work() and second
> time from tb_cfg_request().  Both times kworkers will execute
> tb_cfg_request_dequeue(), which results in double list_del()
> from the ctl->request_queue (the list poison deference hints
> at it: 0xdead000000000122).
> 
> Do not dequeue requests that don't have TB_CFG_REQUEST_ACTIVE
> bit set.

Mika, as was discussed in [1] thread we rolled out the fix to
our fleet and we don't see the crashes anymore.  So it's tested
and verified.

[1] https://lore.kernel.org/linux-kernel/20250327145543.GC3152277@black.fi.intel.com

> ---
> 
> v3: tweaked commit message
> 
>  drivers/thunderbolt/ctl.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
> index cd15e84c47f4..1db2e951b53f 100644
> --- a/drivers/thunderbolt/ctl.c
> +++ b/drivers/thunderbolt/ctl.c
> @@ -151,6 +151,11 @@ static void tb_cfg_request_dequeue(struct tb_cfg_request *req)
>  	struct tb_ctl *ctl = req->ctl;
>  
>  	mutex_lock(&ctl->request_queue_lock);
> +	if (!test_bit(TB_CFG_REQUEST_ACTIVE, &req->flags)) {
> +		mutex_unlock(&ctl->request_queue_lock);
> +		return;
> +	}
> +
>  	list_del(&req->list);
>  	clear_bit(TB_CFG_REQUEST_ACTIVE, &req->flags);
>  	if (test_bit(TB_CFG_REQUEST_CANCELED, &req->flags))
> -- 
> 2.49.0.395.g12beb8f557-goog
> 

