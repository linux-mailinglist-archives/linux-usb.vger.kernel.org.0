Return-Path: <linux-usb+bounces-20827-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE2AA3C372
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 16:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57CF23BB492
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 15:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD581F417E;
	Wed, 19 Feb 2025 15:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="vHQOQRek"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF1E1F37CE
	for <linux-usb@vger.kernel.org>; Wed, 19 Feb 2025 15:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739978231; cv=none; b=famRge7rNpfqRBrECxs4e5/b/DZ4cOUizyf1KoHnBhGHx+93keRTIcxHC7lwHJSCxgK/APD0EtqRpe5NI6ouHPAhnxUxNXmos7HKxMaFgMKDnwHnBKwh9zGmS7MmzjKMZxSe3bnoDoWXxW0G63dkskjN6XlXhZaJgwYsixolqig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739978231; c=relaxed/simple;
	bh=w7fP5VJsqdJFhYmueyYdah4nlb2jc1Wn/053sE2nQdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDrNQf2mkKeM5bweg6/8lkiKqGgK5tLWO+GvHL29ILXpu8PeqtnJ89jh2MhexIh4JmLBJN8C/Q6PGQ8QyEJXWUKE8/9oqwbo3ynxf0l0xDbak8wufRKKckupeq4lkxhRhSoO/4jvg0lw0/+IbRWSlWJNz+B5tdsqdCbgTlJbO9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=vHQOQRek; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c0970e2e79so599152085a.3
        for <linux-usb@vger.kernel.org>; Wed, 19 Feb 2025 07:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1739978228; x=1740583028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLngn1c7OgszDhQYwrs3tuXmUNGW9guC8b5guhMRolg=;
        b=vHQOQRek3SAuGGm5hZzY+o0gjg1WMNFjb6vlzofW6dsTijWzWQ4n4MXFp2SMqbdwWb
         ZqOJQqIu/+0Gq4f8cHOJocdeyMLvAabxxNqI3AORcwEFdLOu+dCCrQNulEzZEIB2L/61
         Ia6cqOAbxwPtHQLilAJm07+tJ1yOFgLJh/xYkZ2+jdRzP48y2nJjf045ilRbJllEnKQ5
         BXj0vGJMn6YnU0G29HEmZ/cxlwn4MqNOD32knoRy9GDdEb8bZdSMRGxwkUQkgYXn9uhG
         N8vJrQOV3HAwKY3w67pLt4WCMKLofdByGJfJBz1fPlYJTQn3D0/IOuZf0wb7Q/2R9DvX
         oJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739978228; x=1740583028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLngn1c7OgszDhQYwrs3tuXmUNGW9guC8b5guhMRolg=;
        b=Xredvp9+Y/w4GZHoAJ/ehTXUrHB8LsTPqkz8ekDDB/zbsz4oLMC5IGWlxBv7s4z6Ed
         hWuLN9n3X8FxlbFr0h3Av7sfjNxyR4hLah/cNjUouR8CwkaclB1Xz5IF7T3PvBhMSXVF
         z4vFz7PWgLFBiMJyeC0PBdMbBnWHba7Ud97fAhdA44MZVC4DjHSIpdgJAeCh2Kw1a4N2
         NRbyQNDAiGAgSPo9gEKs61TtHFF1y0S+zmq86fWeowJ4Jt/d0BG6KbBUkSZyJeftVJxH
         9fE5z7f8D6M3Vlgra/CzkcCRKVqKKE/bKmsmOyAAspCAPQluI4d98wC/EdGRL5RKOEhO
         7HUA==
X-Forwarded-Encrypted: i=1; AJvYcCUqPYz7be5f7/bFxAEBCeihZrsuZRU9pJG/uTxBjFS/ecPvFKBefIbtrX4jQk+S+URS6PTGozhg4J8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrINnJ7EHsNS8XO3WsEkwG0/HlQBgctrBhqYyxSDufBjFAdOgM
	HsE5QVZdKmRezaPhxUmJhlMUx95weH4jIemDB9sLGnS7n3ISmpGDZfENPfaePA==
X-Gm-Gg: ASbGnctVNk+4PyfC9zSaZZwzkBjfbhaVcFypEHsRCeljbsfQFCLYop/3D5g6XNshOMc
	J+UO5X09Ry3QLf47754Xlv2DFykzZrkQ8kqLbGwuZLosLsnnOxTJl5awyA+Koa6TiAYdPWAHhAn
	31hgloeAxoxFk2b4NYX4zS+XOs6+NRjJ1Oj5NtKbDQIlMmtaHcflwep5KyFLhpFODQVZqNAJ+jL
	ftQhx1+/S9K1wUXF5n2+rVyuTcxeCwLc/cmgXXmpvnNC/rPTtXiiiWsHy1umWW6Qi+Az1UoMOCS
	uEahPTi8tVURbrtlVAQZNW6gbqEUfw/23g==
X-Google-Smtp-Source: AGHT+IFU4MYbB6zopLM4Vw6VY01SbuBIlw1aYMolPw19EYJwiK6vA3t38BJTotpTUC2Ignn7JMiZCg==
X-Received: by 2002:a05:620a:4550:b0:7c0:c0d7:580e with SMTP id af79cd13be357-7c0c0d75998mr89190785a.45.1739978227894;
        Wed, 19 Feb 2025 07:17:07 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65d9f36f5sm75044706d6.75.2025.02.19.07.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 07:17:07 -0800 (PST)
Date: Wed, 19 Feb 2025 10:17:05 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1] usb: core: replace usb_sndaddr0pipe macro with
 usb_sndctrlpipe
Message-ID: <8fba35c4-fe72-4dc3-85cf-270efb0c7765@rowland.harvard.edu>
References: <20250219083745.10406-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219083745.10406-1-eichest@gmail.com>

On Wed, Feb 19, 2025 at 09:36:44AM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> The usb_sndaddr0pipe macro is only used in the hub_set_address function.
> Replace it with usb_sndctrlpipe which provides the same functionality
> but would also consider the endpoint device number.
> 
> If the device has not been initialised, it is safe to use
> usb_sndctrlpipe in this context because udev->devnum is set to 0.
> Therefore, this change does not affect behaviour, but reduces code
> complexity by reusing the existing macro.
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> ---
> Even though this patch does not fix a bug it is related to the following
> discussion and addresses the change proposed by Alan:
> https://lore.kernel.org/all/aa0c06f6-f997-4bcf-a5a3-6b17f6355fca@rowland.harvard.edu/
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/core/hub.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 59e38780f76d0..66dfdf0bab90b 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -4697,8 +4697,6 @@ void usb_ep0_reinit(struct usb_device *udev)
>  }
>  EXPORT_SYMBOL_GPL(usb_ep0_reinit);
>  
> -#define usb_sndaddr0pipe()	(PIPE_CONTROL << 30)
> -
>  static int hub_set_address(struct usb_device *udev, int devnum)
>  {
>  	int retval;
> @@ -4722,7 +4720,7 @@ static int hub_set_address(struct usb_device *udev, int devnum)
>  	if (hcd->driver->address_device)
>  		retval = hcd->driver->address_device(hcd, udev, timeout_ms);
>  	else
> -		retval = usb_control_msg(udev, usb_sndaddr0pipe(),
> +		retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
>  				USB_REQ_SET_ADDRESS, 0, devnum, 0,
>  				NULL, 0, timeout_ms);
>  	if (retval == 0) {
> -- 
> 2.45.2
> 

