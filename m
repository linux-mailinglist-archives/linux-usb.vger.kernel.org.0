Return-Path: <linux-usb+bounces-19537-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C600EA16EBA
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 15:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D05593A4F82
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 14:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A41C1E3DE5;
	Mon, 20 Jan 2025 14:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="uSeqt+j1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3584B1E3DC8
	for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2025 14:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737384480; cv=none; b=kX/MX/QxbrqkYvloGn1D8/0VbL2MXutmEDHcwMKFAeF6mYvoXVcTii5pQ0ZJvq7ueN7pgLhvGi1C8j0Lu/Fvl+OnNhZElftyQiriT8CJJI93FyepdcNea1qBM7xo7DEVqJQOqWVBZ7Oe1FCyv/7N7Xy5L5IJmFSYX/zOGMJ83XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737384480; c=relaxed/simple;
	bh=cQiC1VlinKMjiH6Hg7QzNEIlt8SoOZCTsm2ULnu9UEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkozSgTC3iugkdmpmQAPGeqrV9HiZZGOfPBc2oKFPXVa6yR/Rzxc7YJ1X9frNpxNrCJRA2OxDh+tLxJlWcZJZZ3eodSsRzckGc2OB6iUNDqLZNVSWlyKj3kw6kOv7uU9cd+j+ZOl1c04gHqoR4DK5pdDwRHswu6FoMC9MaN0EiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=uSeqt+j1; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6d8fd060e27so37335166d6.1
        for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2025 06:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1737384477; x=1737989277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cvJ4aFuh+9Vk2RHzmd33jWpA4HR+ynJYIEu3P+NRp/E=;
        b=uSeqt+j1Mt1JQG+1KhmnFpaVkO8aAVUueNbmny6jRc+/rcz2+e8rLSgTHJpXnN5osq
         Z+J/FWkKnL0nttwXbcknhz4SZEcMrYaYnw1ubMqnezNXhRu5MILXX0yHPUCfz/TMYyCV
         hF1uhnDl7dTZfjyYX620tgBzJJHkjDFmvLKcTPNJ/aSGMVx7KrwMr5P0xsmoUOrjjeFx
         BEJgPZAjdYsBDm8PAMT7nxM3gIHmqpN+ny0X+8UO//RxPd9iI/qMZ6/npW5ezihKBxHd
         +4YXsU7a5D4u67iHIsDewyBOzVGkOEKc2Q6VIDkGzd/gLC/a6KgligfKhEDG5zzLT+o6
         vrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737384477; x=1737989277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvJ4aFuh+9Vk2RHzmd33jWpA4HR+ynJYIEu3P+NRp/E=;
        b=Y04EknSh7U0TGauV3u9XWM0eSNGetLGWaQSld+ppno7TY0H1auJGGA6R7mGjsuMbuE
         +ssrjNgZgoArG08zkeNNguGYKrN/RCc4LkO6cfuCNnB9Vs0soZgEdCCeGtJtuDK445AH
         EjXoiRd093NBvA2qD6d71biMlOooVV5zmKnKbjOzmE1V9Yi0ln7umWTz35DpQz68O6Op
         HNrmExCqJbPJfFsypAiZn+/9WxOauqm5S2wLcD5Pmm1/tMPr3l1AqIlyBu7a/eQj+S4f
         0d96nAnhBuep3ITc0FcC0XlrmaXPOBLLI6NKRBbfPIQ81+mW1Gex8d4/mYWBGqcGA0oZ
         U0QQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTeBhTgZ+cZ3K0hXtfvz+0fVg4vAIUt1vNNR6Si5Uw81//nA9QJM+ibRRCdzSYl/m0vgV6GTc37r4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWilrUK4z3mG4mHBRvJGk/bGeS43RiO8QJAb+IOtNCMSOds9I/
	3WfY9Na3xULEIIs+F3oL7Aa/tmCSNYpFx1JF4QZinYVMex5vpVWKdD3F4AKtEg==
X-Gm-Gg: ASbGnctoxe1/5FTcd3yJpFRnx16i/Aivxpcc0FGqo8dTJRkk2XZrkfHpTdgDK6eFZNv
	dJMeMLC1EsqsIWxSQkkmnTha71aQHWbiEKQd5M/5KnQCZQbu0ZdX+GaXyn33BDCEbWLDG0bQf/d
	Y+pCJGUGklCtLWwN1LWm9eJdZUY0BADZhnSHbKaLm7DH7GWqgjZPpK5AJiDNOkDUspP/DfORyal
	CAP6UcrndOjezzDoYOf4PHhj4YU3Yko+c2ZRTIi/d17GZp8PFHNrj2hxbZDbOA5bFP2NDk=
X-Google-Smtp-Source: AGHT+IGIZk+b5nCASQc3ZLeWNmTrkefis+nz6YWiyPzWRfgJQ/TaXNUglqTYnc2IvYfdWsmHE7XTJg==
X-Received: by 2002:ad4:5c6a:0:b0:6d8:a4fd:d247 with SMTP id 6a1803df08f44-6e1b2170094mr229924336d6.7.1737384476942;
        Mon, 20 Jan 2025 06:47:56 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::56b8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afc24122sm41726806d6.60.2025.01.20.06.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 06:47:56 -0800 (PST)
Date: Mon, 20 Jan 2025 09:47:53 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Takashi Iwai <tiwai@suse.de>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: Increase the limit of USB_GADGET_VBUS_DRAW
 to 900mA
Message-ID: <894f42a7-50a5-401e-a705-a06eafd6161d@rowland.harvard.edu>
References: <20250120111702.3738161-1-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120111702.3738161-1-prashanth.k@oss.qualcomm.com>

On Mon, Jan 20, 2025 at 04:47:02PM +0530, Prashanth K wrote:
> Currently CONFIG_USB_GADGET_VBUS_DRAW limits the maximum current
> drawn from Vbus to be up to 500mA. However USB gadget operating
> in SuperSpeed or higher can draw up to 900mA. Also, MaxPower in
> ConfigFS takes its default value from this config. Hence increase
> the allowed range of CONFIG_USB_GADGET_VBUS_DRAW to 900mA.

Is this the sort of thing that really needs to be a Kconfig option?  Why 
not make the decision at runtime, based on the needs of the gadget or 
function drivers and the connection speed?

Alan Stern

> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
> ---
>  drivers/usb/gadget/Kconfig | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
> index 76521555e3c1..904652c37385 100644
> --- a/drivers/usb/gadget/Kconfig
> +++ b/drivers/usb/gadget/Kconfig
> @@ -97,8 +97,8 @@ config USB_GADGET_DEBUG_FS
>  	   to conserve kernel memory, say "N".
>  
>  config USB_GADGET_VBUS_DRAW
> -	int "Maximum VBUS Power usage (2-500 mA)"
> -	range 2 500
> +	int "Maximum VBUS Power usage (2-900 mA)"
> +	range 2 900
>  	default 2
>  	help
>  	   Some devices need to draw power from USB when they are
> @@ -107,8 +107,11 @@ config USB_GADGET_VBUS_DRAW
>  	   such as an AC adapter or batteries.
>  
>  	   Enter the maximum power your device draws through USB, in
> -	   milliAmperes.  The permitted range of values is 2 - 500 mA;
> -	   0 mA would be legal, but can make some hosts misbehave.
> +	   milliAmperes. The permitted range of values depends on the
> +	   connection speed, for SuperSpeed and higher it's 2 - 900 mA,
> +	   but connections with High-Speed or slower can draw power
> +	   ranging from 2 - 500 mA; 0 mA would be legal, but can make
> +	   some hosts misbehave.
>  
>  	   This value will be used except for system-specific gadget
>  	   drivers that have more specific information.
> -- 
> 2.25.1
> 
> 

