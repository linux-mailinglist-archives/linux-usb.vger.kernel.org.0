Return-Path: <linux-usb+bounces-20165-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C40A2968B
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2025 17:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 247E11888570
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2025 16:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94BC11DBB03;
	Wed,  5 Feb 2025 16:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="QeiPBh2J"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF097083A
	for <linux-usb@vger.kernel.org>; Wed,  5 Feb 2025 16:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738773886; cv=none; b=LU/q7Kx0kgtjgoVB0QqnTIfTKwBhGP3Al1FGyBMVocn9n2c6Z4gXNO+BAFEd6LUL/9AmSH9lr8x/grZk8MTL3vNYPk+FCnhu0CAfr0ecgoYG7HMJ5e5fSs3lwMLWgBzytLsZwWYHJEiDQ7gVEZCeO9NdnzbTsjYFW4IOJHmN9bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738773886; c=relaxed/simple;
	bh=bBU+pt61zyAtW2Ud1OYyE3Ce2NAzO80oqdMnELCX/GY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPEhQiYX8+UvnjquVZcCaFzGNsGPMS3yhBUcCW+TmSCxHl4CuKX8mWb6hPFa+uONFbAdmu+TS7nlt0KLj2cW2k1hvffa8dEPAYRtxeeyctutO+5MWyaQs3yhTO69jYNW4xaUvBHXf9htqxiTdqTVpdhEeYNveGsr/HsVXkHnUnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=QeiPBh2J; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4678cd314b6so13291cf.3
        for <linux-usb@vger.kernel.org>; Wed, 05 Feb 2025 08:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1738773882; x=1739378682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FjoGXlkAkW/LVx7Wgz5EofRxkYv+KJC4KXFoMOpGEvk=;
        b=QeiPBh2JbO6rVhZA1hyLVAaaLxWulf6Xwy/FPxBtxqntRjb11SzXtv6WVKtXESqYPJ
         Hp2N+jYFF/CnMdhnJQy0K560vNFnv4SULoXWWWl3nlcPSGmj5IH59oAtBNIhefa+1UH3
         LbRWEm9RWjExsJoJ/xwSqyGcpWdR+TfhtIlUmSwIi/qgty773D+/ViasyThjwRNq0o31
         9k32m3JchRNlW0V463rOKK+ceZxa1A5DW7o4eEUHddPevLJPSulRIOGIYRMarPMn7cKh
         FOKsIlIvWqJ+DvBX/8cnaz4advKktJKo8A6ZRXL21zU3dNeA6R0pafilgDYF2hx2ccZZ
         oCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738773882; x=1739378682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjoGXlkAkW/LVx7Wgz5EofRxkYv+KJC4KXFoMOpGEvk=;
        b=k0vbaJlFrX+GUOJ/5blZUAWlSUqkW9a5WzkvjNLcB0ZPaoiZI08eCzeBU07A+im6Rn
         OnTeATbSxNrTlTxojaqV9PgLDEt3oWNazY74bf+ztf6zGdi8B4RxOIZdk7kJEj/F+JdK
         DEzx+bhIJALqKEq0EP4CqlGU6ziwBlqulY5Rk9nfOS1HW6UJhXz71dpeOhuwSxKi3Ham
         21l8ac0tik7VzFTJ72wQf6ht3wNcTczwNvzORTrPHoT1BDCkOeKK/4DrGsbDET2qfQ+w
         03kGVkE2agMWyosLX9WtdaeniixoWev5BJOOles/Q3c210lv2uQrUXfEI7/X0W6TAet5
         JJHw==
X-Forwarded-Encrypted: i=1; AJvYcCXt68S/RD0dd97Co8QXSQl1gzcZ+iekpzwQTcRtkihFVJyF5n1FD6ZU6jowt9d8go9B2Yl6S8hHqbA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwb+T4Dbp4N7vgpz088KU/g+6fkOPtcEBe099H2NbtEuw7PUTo
	XZKRMZBgPvRI4+7Xua+NAQw91JVVw1oIOld8HqWGd/wSv01+/mr5jhS77K+Zfw==
X-Gm-Gg: ASbGncvrgPR+pH/mzrpc/O6e26T3LGPxZ50zeOvLpg5WD7PvmlyD2Bv7NC7E/idkGpm
	eJndq/aDvzYhq7fnSK6txMuVK7peGT1kEZkk4Oj5qzLTZO+XAbphyhqQg8ccxCdb709JmE2XLLf
	Mhw8j8A+8Og/MQwJi68xMhYCeNOCO1QIjuBCvxiiG/rTKSaOTcozL5I+s3PHjTaIRXvXALQ4tCz
	yFLyrzfC3sN0mm+W+QZ+in2G1CfntztI5p9pfdAL5AYQI1OaStCly50jQVb5auO756LlA7wp81s
	qSL3T1EA88JB21zGL9BPW3sOZKLmsmayFJykm56yTAWyfCHkaGQhgVT2Rl3RjtxhlGL9p/nh72i
	KB9pNf12G
X-Google-Smtp-Source: AGHT+IEJJIFFkoN3GGHuFCIeaeqDpk11sq27Z6ttoSKnjS+COwjd8IQQqwUcMadaS0VY1/XoRDycYQ==
X-Received: by 2002:a05:622a:81:b0:46e:23bc:8589 with SMTP id d75a77b69052e-470281b8dcdmr57411681cf.13.1738773881979;
        Wed, 05 Feb 2025 08:44:41 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-21.harvard-secure.wrls.harvard.edu. [65.112.8.21])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0ceacesm71401691cf.31.2025.02.05.08.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:44:41 -0800 (PST)
Date: Wed, 5 Feb 2025 11:44:39 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Roy Luo <royluo@google.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org, elder@kernel.org, crwulff@gmail.com,
	paul@crapouillou.net, jkeeping@inmusicbrands.com,
	yuanlinyu@hihonor.com, sumit.garg@linaro.org, balbi@ti.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: core: flush gadget workqueue after
 device removal
Message-ID: <f083ad19-bea8-4a51-834c-14d6810699fe@rowland.harvard.edu>
References: <20250204233642.666991-1-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204233642.666991-1-royluo@google.com>

On Tue, Feb 04, 2025 at 11:36:42PM +0000, Roy Luo wrote:
> device_del() can lead to new work being scheduled in gadget->work
> workqueue. This is observed, for example, with the dwc3 driver with the
> following call stack:
>   device_del()
>     gadget_unbind_driver()
>       usb_gadget_disconnect_locked()
>         dwc3_gadget_pullup()
> 	  dwc3_gadget_soft_disconnect()
> 	    usb_gadget_set_state()
> 	      schedule_work(&gadget->work)
> 
> Move flush_work() after device_del() to ensure the workqueue is cleaned
> up.
> 
> Fixes: 5702f75375aa9 ("usb: gadget: udc-core: move sysfs_notify() to a workqueue")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Roy Luo <royluo@google.com>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/gadget/udc/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index a6f46364be65..4b3d5075621a 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1543,8 +1543,8 @@ void usb_del_gadget(struct usb_gadget *gadget)
>  
>  	kobject_uevent(&udc->dev.kobj, KOBJ_REMOVE);
>  	sysfs_remove_link(&udc->dev.kobj, "gadget");
> -	flush_work(&gadget->work);
>  	device_del(&gadget->dev);
> +	flush_work(&gadget->work);
>  	ida_free(&gadget_id_numbers, gadget->id_number);
>  	cancel_work_sync(&udc->vbus_work);
>  	device_unregister(&udc->dev);
> 
> base-commit: f286757b644c226b6b31779da95a4fa7ab245ef5
> -- 
> 2.48.1.362.g079036d154-goog
> 

