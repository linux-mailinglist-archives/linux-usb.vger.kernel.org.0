Return-Path: <linux-usb+bounces-38207-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FpCMKjmHGrKTwkAu9opvQ
	(envelope-from <linux-usb+bounces-38207-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 03:55:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21331618B3C
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 03:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86CB33053DF4
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 01:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB5920468E;
	Mon,  1 Jun 2026 01:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="YCq5NDkM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4481B142D
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 01:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780278831; cv=none; b=Rb5z4XohiqZJ/mel8peiw6bK4XRFX7jVSN6WJDTcIR9t1qX4MmQ4CGzuC3iwcqySCtx1O5n5p04Ncln98y9HKF42tPd7Jp5PvfKEkauW52Spj1UelNc8YR4evkNPskjfG3k9CFAwIjgQTo9zeqDbLO8IlKejgvyPvNxFr5RBVeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780278831; c=relaxed/simple;
	bh=7caKcjAWTldJ9xg1lMC04gC+3EQ3fLzwiRjyJ+/Chhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6wyLMX+jcCXLvQxLfEZIIomFJHH8s3KswlRvT9cT3LzDHS0BCPQvMMXJ5EONti+JoVQaVOvgU7GxgP91nm29VxW8jRZcqpoyLivNzk45275pK9NU1Kq8DsZ6xyEGR6j54UfwCQbi89HWXim6nSEjeoWMoPBT7lI1uMpBxM5wjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=YCq5NDkM; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-516d78df76aso99279301cf.3
        for <linux-usb@vger.kernel.org>; Sun, 31 May 2026 18:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1780278829; x=1780883629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H9m0+o8alr4Gu0mh218M712NUHG39se1EDLLQn8jO8g=;
        b=YCq5NDkMAOq+YmBLjsBqoigF0xLMQUewYOXPqXE6S/eKcaGOl18wnIWgSMUxnPpCOs
         TUvt3TS3poqFe96gQoLSwT8tBkY8QOwwx4l3J2yyTo14KQTI+gPZx98vF4C9UpevGO5b
         T0vOy4eOP018lmrF3Qz29FmiygH1MPZ1VobkM8hGb3TFSnpdUTzWhsCNLZk3AE/t5QUK
         rD4ExcKpdoBatrfSMUUgR7vOZanJSsYoWCzsmzP11oi4oL6TcvwEmorawKWQ/TdoigfK
         Jvb6Kyzw+IPUogYHdkcABvQ5BSDvTvH3rYH/esQG1abfvISW0lZB1F3RsIMXUGndD5Di
         7fIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780278829; x=1780883629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9m0+o8alr4Gu0mh218M712NUHG39se1EDLLQn8jO8g=;
        b=s18+5HGaculDLvjNcV7ZzDU2FOfD0W1FWrK6E3zCVgS5x2gR1pXNaK8nQKieR3mYUB
         SyGQGsfGuz5jTu9hXRejf/my1cxSozzEj447zhIZUpzSEE6Q1hqMgjc+G4eIuNtz4eNy
         c4vcU2H8huzvrdh/N0bv7fZoagRntyIZjLOeOfUlLOWINzz0lkxPX36wa9+7JoBYRAUq
         /dAOHoG18CF+m7yirnHedV11hsc4dms26FYKR15hZtIz1pbR+r/0nKqk6Om0B0HVFRJy
         kzGFBT15Ly2v+TTCBx2+WyWPwiaJDv2hu30pNWhnc4VMzsisJtVvHCzVyvOqz5mjMExR
         AwIQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vS5pfxrjfJpkMX2kyU9t2v/cW/3ucBAnsXFjk+W8RJDwX8R355d7b2sULT3w8XFtfjGuOaamURds=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCowT9iVgTKQ6bwjjWLq5GfaMA/DAuO2tdp/Ak8flQ9MbNi6b4
	2r+8mqWtkJ2tlHRV6LLe+DipAq9RhAG8kGdb+zGvwpDopafzbyiCUD2BO12+eXhcKg==
X-Gm-Gg: Acq92OGSIss8r3iv6/TuvN3Z+0bsgRYW0QEqg5m77OtywWchOU2u3WxQJFbiF3XA9t1
	gIdRjuAETXIwzX8SQ/2f2NJrNW9fOhvYqXWjYE5rw0OoxXWZObwP6HsdIlXtO53Ej0hghHpxSS2
	6XQCWu7xbcfqQOBua4uHMLa0TvdKoD4JBWzylcUJDnCPuUg2TRh5JNoG65prk31YumO54MGO8Qa
	TFiuIdme9bWyh02OB+4Yn3ogZbz2WyHDPKn6FFWVsELraL8k4zNy8H+oabnC4uL81rohVeNxZ3y
	EdkIaqQ5Fk8agrIeXcQIjIY8Lxsg8DOHCJBDpt7Vz8b87OEwjZ2MK1k3XhA9YJPPkiyXDnk6yQt
	2zHfcMtDF56ETxTVUpmcP+27YKeuINu0bYuW3Z2Y2lV6wbcGKrfKknUe88Yrjzocto06S8TA6Cb
	HB6IJ32M53kjd0o3nuQ6KWWornLFisSxzNJRKPI5PwYljPQeOKtdCZPQ==
X-Received: by 2002:a05:622a:831a:b0:516:ec82:32f0 with SMTP id d75a77b69052e-5173a8f1ed0mr108155201cf.34.1780278829029;
        Sun, 31 May 2026 18:53:49 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5175c83a1b9sm110261cf.11.2026.05.31.18.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 18:53:48 -0700 (PDT)
Date: Sun, 31 May 2026 21:53:46 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: prostitisgabriel@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] USB: gadget: inode: fix mm lifetime handling
Message-ID: <20067140-fdc3-4aaa-b617-7eb803887633@rowland.harvard.edu>
References: <20260531-mm-uaf-fix-v1-0-91571cc6ca46@gmail.com>
 <20260531-mm-uaf-fix-v1-2-91571cc6ca46@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531-mm-uaf-fix-v1-2-91571cc6ca46@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38207-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,harvard.edu:email,rowland.harvard.edu:mid,rowland.harvard.edu:dkim]
X-Rspamd-Queue-Id: 21331618B3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 31, 2026 at 11:04:41PM +0200, Gabriel Prostitis via B4 Relay wrote:
> From: Gabriel Prostitis <prostitisgabriel@gmail.com>
> 
> priv stores a pointer to the submitting task's mm_struct,
> but does not currently hold a reference to it while async
> requests are pending.
> 
> This can result in a use-after-free if the task exits before
> completion handling finishes.
> 
> Take a reference with mmgrab() when queuing the read request
> and release it with mmdrop() on request completion.
> 
> Signed-off-by: Gabriel Prostitis <prostitisgabriel@gmail.com>
> ---
>  drivers/usb/gadget/legacy/inode.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
> index d87a8ab51510..f9b7199afc9e 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
> @@ -471,11 +471,17 @@ static void ep_user_copy_worker(struct work_struct *work)
>  	struct kiocb *iocb = priv->iocb;
>  	size_t ret;
>  
> -	kthread_use_mm(mm);
> -	ret = copy_to_iter(priv->buf, priv->actual, &priv->to);
> -	kthread_unuse_mm(mm);
> -	if (!ret)
> +	if (mmget_not_zero(mm)) {
> +		kthread_use_mm(mm);
> +		ret = copy_to_iter(priv->buf, priv->actual, &priv->to);
> +		kthread_unuse_mm(mm);
> +		mmput(mm);
> +		if (!ret)
> +			ret = -EFAULT;
> +	} else {
>  		ret = -EFAULT;
> +	}
> +	mmdrop(mm);
>  
>  	/* completing the iocb can drop the ctx and mm, don't touch mm after */
>  	iocb->ki_complete(iocb, ret);
> @@ -501,6 +507,7 @@ static void ep_aio_complete(struct usb_ep *ep, struct usb_request *req)
>  	 * complete the aio request immediately.
>  	 */
>  	if (priv->to_free == NULL || unlikely(req->actual == 0)) {
> +		mmdrop(priv->mm);
>  		kfree(req->buf);
>  		kfree(priv->to_free);
>  		kfree(priv);
> @@ -540,6 +547,7 @@ static ssize_t ep_aio(struct kiocb *iocb,
>  	get_ep(epdata);
>  	priv->epdata = epdata;
>  	priv->actual = 0;
> +	mmgrab(priv->mm);

This new statement is certainly in the wrong place, because priv->mm 
isn't assigned until the next line.  The two lines should be swapped.

After you fix that glaring mistake you can add:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

>  	priv->mm = current->mm; /* mm teardown waits for iocbs in exit_aio() */
>  
>  	/* each kiocb is coupled to one usb_request, but we can't
> @@ -570,6 +578,7 @@ static ssize_t ep_aio(struct kiocb *iocb,
>  
>  fail:
>  	spin_unlock_irq(&epdata->dev->lock);
> +	mmdrop(priv->mm);
>  	kfree(priv->to_free);
>  	kfree(priv);
>  	put_ep(epdata);
> 
> -- 
> 2.54.0
> 
> 
> 

