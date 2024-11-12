Return-Path: <linux-usb+bounces-17489-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6E79C607A
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 19:34:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7133CB305CA
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 15:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE112205120;
	Tue, 12 Nov 2024 15:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="A/tPLfXD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AD1204F8F
	for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2024 15:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731426756; cv=none; b=f+e/MKaT+MmOdc5S71971xHQPA90kfnQvxGHXfrjU5uwBDlxZ0BpPTH7urCaoklgNy6uCTHpgBQiXQ3oMnadFmJDeVhv6AppUt8LI9RV/1/A7ZSpnU4thCR6A80WSoG18KuOzDp9B2IYwTQzUZn/FZzzz7breGNQ+l/XJFyl0AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731426756; c=relaxed/simple;
	bh=Tl1x5Bk+jUwBokslkn6nOHImIaTZVlEvg+0B1tgEYwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmIujtkDrF3v0gTOpP4Yb61IliZUMOgIH9jjgmv+8sqT09KR4nG3C/srUMyZKG2tK+MGJec2g4B5CZg5G63MYKY1Yb2vg2YpZKmMTR0OGGySl3KGDxvzqu4ugFN9Lzh+uLulNOiRMccM4CdZG/jOwp2ulbKSzRUrLwOS7zyoDxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=A/tPLfXD; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-460b16d4534so33688291cf.3
        for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2024 07:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1731426753; x=1732031553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1XEndPtU5GDkMHoEO1w7O3RQK19ymAjkNoxM3jg4QLk=;
        b=A/tPLfXDJwRPCJBs9Gz3OdJLtmImtfMPu+JWHpbDzwwkf8EH770c7/eLM/35mpa7Wu
         3yCkskezdXfn+p+E+4fgcl7DMe4Xvv5yfgpNBqQNCVcZFe0YzxK01ovacFsPiD1saoqo
         yJ3OsbfX6DEijrCxRlNtsgZgr2pMnM4mS+wXfKOguQDJJ6KYuq9U/JDrOIQ36zxtCPyh
         ZL4QeSebS5JOCwczM/yd/fY7yRM73xEAKxYGoDzfekyX6NMxWTwDphO0ZLuRnu00yggY
         39kVcLdMVZ0NqyVKbC3+dcAzz8EAojbQ1X1kiwjnulwi6mpxzQAivy0PdwuIxSH5W8Yg
         ZPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731426753; x=1732031553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XEndPtU5GDkMHoEO1w7O3RQK19ymAjkNoxM3jg4QLk=;
        b=pNgwwDZH6/T+KTTBKqe7RMJX0NkFq2vKIGY7XplFwUGMnk9DWZaBhDL+MmIH6/YPJc
         q//cntZWDP4b9PFi/IIb0Crpb/WZYcaceEUxCPX5ncneXd7T+pLTL/54GqlUOyYfNyLe
         vWLdTAmEid0ki8wxfvpwWY+fuFdFbX/Xw7dzRnPHT27B3azTvXML5UBPE5H12RQKR9FE
         WysNtRy9GjQHjDvYMYQMJWt+MuN/Wd51gXCfdidfYGBY7aCWW7fm+fZPn7JfuCVP/1YN
         1YBqbmNcpJXx+CI3K76zCdRpLOpYZ36P0U4Gqvknff3NQbubMqA2WP1TCpRtSTfgJrhK
         qVFA==
X-Forwarded-Encrypted: i=1; AJvYcCX1adbnHslC+1iVzd+WvwmmtVXywbXLgLNk/Oc3AQE57bc3wYQUctjQbjsdc2ESyFCGeckZy434AqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YynVFHGAYWaBkSE43vDbb10hcRtDlj+kEOuuVt05pLG3aigCGA5
	1LpSY3L1EGsCak3NR0g8NAm3byln3kwub14gqugA9gufokDamb8RFNVOs+kxoQ==
X-Google-Smtp-Source: AGHT+IGx09QnY+a4QJcLEf4HugOufvp4qILo6Oon7AWW2cEFrH62MxQ9c2KHoGuxelT2bD8VHWHiRQ==
X-Received: by 2002:a05:622a:1901:b0:45f:bca0:b8d2 with SMTP id d75a77b69052e-4630932b3efmr232082961cf.20.1731426753453;
        Tue, 12 Nov 2024 07:52:33 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.12.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ff46d293sm76541571cf.47.2024.11.12.07.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 07:52:32 -0800 (PST)
Date: Tue, 12 Nov 2024 10:52:30 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: gregkh@linuxfoundation.org, oneukum@suse.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzbot+9760fbbd535cee131f81@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v4] usb/cdc-wdm: fix memory info leak in wdm_read
Message-ID: <824e839d-ee72-4923-bc88-e9cc58201b07@rowland.harvard.edu>
References: <2024111232-relative-bottom-4995@gregkh>
 <20241112132931.3504749-1-snovitoll@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112132931.3504749-1-snovitoll@gmail.com>

On Tue, Nov 12, 2024 at 06:29:31PM +0500, Sabyrzhan Tasbolatov wrote:
> syzbot reported "KMSAN: kernel-infoleak in wdm_read", though there is no
> reproducer and the only report for this issue.
> 
> The check:
> 
> 	if (cntr > count)
> 		cntr = count;
> 
> only limits `cntr` to `count` (the number of bytes requested by
> userspace), but it doesn't verify that `desc->ubuf` actually has `count`
> bytes. This oversight can lead to situations where `copy_to_user` reads
> uninitialized data from `desc->ubuf`.
> 
> This patch makes sure `cntr` respects` both the `desc->length` and the
> `count` requested by userspace, preventing any uninitialized memory from
> leaking into userspace.

> ---
>  drivers/usb/class/cdc-wdm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
> index 86ee39db013f..5a500973b463 100644
> --- a/drivers/usb/class/cdc-wdm.c
> +++ b/drivers/usb/class/cdc-wdm.c
> @@ -598,8 +598,9 @@ static ssize_t wdm_read
>  		spin_unlock_irq(&desc->iuspin);
>  	}

Note that the code immediately before the "if" statement which ends here 
does:

	cntr = READ_ONCE(desc->length);

And the code at the end of the "if" block does:

		cntr = desc->length;

(while holding the spinlock).  Thus it is guaranteed that either way, 
cntr is equal to desc->length when we reach this point.

>  
> -	if (cntr > count)
> -		cntr = count;
> +	/* Ensure cntr does not exceed available data in ubuf. */
> +	cntr = min_t(size_t, count, desc->length);

And therefore this line does exactly the same computation as the code 
you removed.  Except for one thing: At this point the spinlock is not 
held, and your new code does not call READ_ONCE().  That is an 
oversight.

Since the new code does the same thing as the old code, it cannot 
possibly fix any bugs.

(Actually there is one other thing to watch out for: the difference 
between signed and unsigned values.  Here cntr and desc->length are 
signed whereas count is unsigned.  In theory that could cause problems 
-- it might even be related to the cause of the original bug report.  
Can you prove that desc->length will never be negative?)

Alan Stern

