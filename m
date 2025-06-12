Return-Path: <linux-usb+bounces-24709-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC96AD7849
	for <lists+linux-usb@lfdr.de>; Thu, 12 Jun 2025 18:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB2B53A98A6
	for <lists+linux-usb@lfdr.de>; Thu, 12 Jun 2025 16:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECFC129B8D9;
	Thu, 12 Jun 2025 16:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="RwSl8+2F"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF2E7263C
	for <linux-usb@vger.kernel.org>; Thu, 12 Jun 2025 16:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749745832; cv=none; b=pCW7KocUE7It0ZzcVTz397IN6ucNmKASchJJny0i761GmE+y5a9VOU4cBN+chS22I13II+aJUAUz6vqtR2yOhuYsSQkp0rSrdVfY2vaHS8XtuVE0VhVUsvRpXtDcQRQugRLHo4dJ26A3X9J35YAb0UpAZ5YjGIL36MyaZsT6aYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749745832; c=relaxed/simple;
	bh=5yGzX5WRvCZZ03Y5hO8o3+o9AKT1W9SdjvrE2/QMcVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+yMB02JklGOHlwc+kU0fVB5aa2mnLUN9MjxNZVysnhR4V1qIhi9yQAI7gM/FvMutMqiHpTaxX/ZEXe+0z5ErIy7tmECB52MB/rSssLDCqvLDsYNEFsEM2/IhF8NYvH9eBSVX30dnBlMkbHFoaFVlRGBbUASR65mdicSjY+Dfms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=RwSl8+2F; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a58b120bedso13571851cf.2
        for <linux-usb@vger.kernel.org>; Thu, 12 Jun 2025 09:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1749745830; x=1750350630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o/RSt9FtSczKBI6tD3GRKRTB4CumD47oxM1S5aAKTew=;
        b=RwSl8+2F1fRdEsTWMlYLmXIth1stdPzFdc8dDnggE4MTfoicElvj5GprJFKCd72Pov
         +woMVWXZ6qKRn87+5OTE7P5OKavkV+E5GYM5GEPqqF32+MhHK5I2vawgGSIegicOdfIX
         axUUcCEnjaopE0ywOkQyc26KDtW0YWxUNlpmjLH6SacD1dXtRzwybd1zR2adf8r660eL
         Iid1lin4qx6n4BK53abRjddZzAjXkYMf8EMf+bhlGOfiXo5sICQ9kX26ClQSYLjRAub6
         TSJn9OVSaTk1vQAoQCBbBHUMm2GK0WTUZSWjw3hz+VIV1p05OMzcDZ3hY+vJZ+hpp1o6
         6kHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749745830; x=1750350630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/RSt9FtSczKBI6tD3GRKRTB4CumD47oxM1S5aAKTew=;
        b=AyPV9y5KJrRVlv4PkUotrin6YMKDtmhBjJYQUNGXc8f5Y8nnYv2oYlF8z9dt/xH4Z6
         mLp85fmQtMa7tBXQ+1sjyV9Hpr7/5NOXFdjWgy756D94fEEVeA0/qjUJiKEaB/S+I9Ya
         ziql2Nv++LBK394bzb67aUO7XD0UIOvzBX3JEsAKwRLUJrDqbjhY9HZ+Bn24A4MTVzBb
         v4xUvzZpUu4yY//qHK0chyy4G3sGQDYcwjaSUdKFWQO0XXA0iHTm9BjEiPn0+5yjmrVx
         uJ59LkAW47PMr8ppoelCjo08MVXeCuvGdrp4Fzrcq2cZ6pLdaRwT+n0e0rQhoXbDZqQO
         UyzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcg28LRKkyAghXjZVLN7WJJEcFjvBZaJN8+n79J/fsxyjZrjk1IFbC2BIVtGmZMwsU3iGzLjee/Xs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaZVGETaFmO5EzeITAO+cVTs24OIeOMB9sQXZapAaenn9w46Ty
	D87RbE2OzqHmsd7bjiAmPiXO77qlxnz4efggEes6oBpKUP1BV8hDpMoM19XrC6jGHdABcWfmsjk
	Fth4=
X-Gm-Gg: ASbGncsw5gcI8RaD59+3dvEKgaPiDdUyaIyoBfHU9wdNQXehkUn7g/l22V9N0USj4gr
	92pcrp1DA5kjrCT0sWVy8Fepgg4g0v7LjK182qj59UbTDRMxj2hqMeOxYXtfOZMdgWyZOE3Ij70
	YdiEqmizjO5YMvjh82s1/MmxiXGsdZidS84G73V7vHcF52yGdJGrQp20ZJDgGUUP3CxLNHnhYHo
	eBfn+nEBTqBoDLBiQ8gvAR4pza4P6z03XBu+5LeTraAaKTUewD00sK7o9yrwBus1phTgZoZA3k0
	oFP2kpKVK5NIRkJKoUt8unNWUamUSIKNbWyQxBWJ4ztqbw2kfkmv6zKq002kwwzmIUgM1FFoSQW
	E/LFbVUjxyVPTikzXZFkf31s2oPmm2kE4+yrP33JRk/P8SilfyBy7yEU=
X-Google-Smtp-Source: AGHT+IFuuSNq25LXvUbv121dV3sHz3VPGgo84X6Sew1/Eq5SM/Gh9D2OcbGjC8tsUj1zs6tPbhCqCg==
X-Received: by 2002:a05:622a:259a:b0:478:f8bb:b5e with SMTP id d75a77b69052e-4a72f3c0945mr3376591cf.13.1749745829689;
        Thu, 12 Jun 2025 09:30:29 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-28.harvard-secure.wrls.harvard.edu. [65.112.8.28])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a2c0506sm6018651cf.3.2025.06.12.09.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 09:30:29 -0700 (PDT)
Date: Thu, 12 Jun 2025 12:30:27 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: gregKH@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: usb_submit_urb: downgrade type check
Message-ID: <ac4e3c9e-be18-4a0a-919d-b6886c59bbd1@rowland.harvard.edu>
References: <20250612122149.2559724-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612122149.2559724-1-oneukum@suse.com>

On Thu, Jun 12, 2025 at 02:20:25PM +0200, Oliver Neukum wrote:
> Checking for the endpoint type is no reason for a WARN,
> as that can cause a reboot. A driver not checking the
> endpoint type must not cause a reboot, as there is just
> no point in this.
> We cannot prevent a device from doing something incorrect
> as a reaction to a transfer. Hence warning for a mere
> assumption being wrong is not sensible.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> 
> V2: using dev_warn_once()
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/core/urb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
> index 5e52a35486af..120de3c499d2 100644
> --- a/drivers/usb/core/urb.c
> +++ b/drivers/usb/core/urb.c
> @@ -500,7 +500,7 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
>  
>  	/* Check that the pipe's type matches the endpoint's type */
>  	if (usb_pipe_type_check(urb->dev, urb->pipe))
> -		dev_WARN(&dev->dev, "BOGUS urb xfer, pipe %x != type %x\n",
> +		dev_warn_once(&dev->dev, "BOGUS urb xfer, pipe %x != type %x\n",
>  			usb_pipetype(urb->pipe), pipetypes[xfertype]);
>  
>  	/* Check against a simple/standard policy */
> -- 
> 2.49.0
> 

