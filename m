Return-Path: <linux-usb+bounces-27190-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21713B31A9E
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 16:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66C16AC23D2
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 13:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A923305E33;
	Fri, 22 Aug 2025 13:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="p8zbifub"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267EF284B4E
	for <linux-usb@vger.kernel.org>; Fri, 22 Aug 2025 13:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755871015; cv=none; b=RxZOfZSCyd9K/NuZLnesMGe0qPFdIygwAfKdnVseQ/tB6HN40LODvpFJ/g0rcIlU6iaC9r2sZInq+8y9HfzKtcwGUO44veWLCLnTIbqPaBuwaS9DBEkGMI1TuYUXvSNj1MkbTPxDq5MK/xOW6lqHuiT6Pa1iO+1CxnLMP7YrtMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755871015; c=relaxed/simple;
	bh=Z38lZ8HTjUBjB4ep5770vP6LsmNBlzJ7QTHWWCYh6S0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBPNMbuEhuHTLKPm1Yq5fyTy9CNxTIWH0a7QKiVY+1T/D6Vz6z4fD0oIHVhRTSu7+1JuNlbG0Ti9thivSq8x5JrQ8NnITH9EKOG/teA6ZVoYb0XAj2dD+9G5DAXWPcysy/SP0AtpvhfS9koZT/TnMrZpuy7Dfb1t4Ovv9q4kyFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=p8zbifub; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7e870636870so231353985a.2
        for <linux-usb@vger.kernel.org>; Fri, 22 Aug 2025 06:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1755871013; x=1756475813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nZYV/lOVxyLopKkodxehHImvjO52GrrOsoxMKVsFDgs=;
        b=p8zbifubRHUjF/Nwk2M46Fww9EdZZ084fydB2uzrVQ/8N0mf9SU8Ksf1pOMxHNOFQp
         rpklAfkTZQaxZHxWlztRMdwVHNfxsFDOqvQHRa3FV+S9FfV+j7XWwMCfJyi4GcgVHf9B
         lR4zumfVa94+tkJLzijSuZVZk349zmunsRSymVO/2g8eqwx2znQk3Vq4r8r2ad3SNggv
         nPzxxrqRI+lOMfP7YZZ7mX71EwxUULQKZE2A7X+Wfg71lH/gWuitv5AInXALeswa+BhK
         REshncUro+kGRaQePdPEpzz0FVlCfHp/ku+7bSK5i+NrSVBHhHY4aPf8uaWcWumZn1cz
         S0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755871013; x=1756475813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZYV/lOVxyLopKkodxehHImvjO52GrrOsoxMKVsFDgs=;
        b=MLS7ZejsvE/+Es8/UvfZeoSH07FZzS2cb8qQ+M2YKGpt3KHc2XwVrsQImSNuYQmgVe
         JEoF4JnNFz9Nl5oN0YStBtzw+Mik5JMIRUTQKDr48x0YFjpjmaC7iwN1yRsFeHv/dxqH
         vxHeH3ih55oNn7KCo9NHSiYtVcYyz6CRMp/oojvVyTGd/zF/kTJW9zT9aWai5gM4Djut
         JbUCrbA0feyUt2TtAojTpf7qd7PDJJMugNDu7p06h1qMTI7LSgVFCVFh2+DiBVU3LlnF
         qXjvR6OIptc44TTO/9Bgad0SK1PlS+r5q4RdMn+62geMra/WgNxOe9q55RorWO3PUp+V
         1m1w==
X-Forwarded-Encrypted: i=1; AJvYcCXupDM7Pvb1U9OoAj0KMA5nQMjUkaJhk6SGYpZhw5bXuHUgUiK5WmxFUBuEExIwZk4aaGwJWP1Je4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1pykl/pRd964Ks32Yb3nMAe/cHaQikJkIbo75jWvpfCGkCBKS
	8nYOdrRFO4QfyLHIXuOcSvr6OMGsOrdVA7tz+by+7iLnwhsZSBFsGVdwJsa1E6cNrg==
X-Gm-Gg: ASbGncv6ihAGtYRl6tU+yi52k+fJCYP6/NVTTGSQP22Q+8px7ddf1ZpKK3ncxSouijJ
	KSAQD08lo90RUeWtjwK5yM0QLtIqYymsDHEW0GpExmpHJiMeh/m6Vl6qVsmNZw1iwEt3x1EJkvD
	m3Sz8K2xoTSR4dY5BB/ADgT4ecNcpTuGojgwMAiOlAhtSNxhTX/s9Po3AElvBFyiNNk5Iq05K8Y
	L821PXSF40pGJL12xQm7Yrqn56/CdTcunLi1QQ/gvLs4HB6GJSB9hNOxN2xx6jau1wHusRy1uQa
	0NyepltK5vuApBXBea4GBu3jW5KvbRL+dBjemRoppCMRu8YDoNCK6JV+eyJv/EJvRzpKsxCAj8O
	Foq/SLKU1vB7UCw6U0DZuGVNMyS3v
X-Google-Smtp-Source: AGHT+IEenma9Vbx+kv/9/x3JbF+/IZ5+YvWnnHq6SX8M5lkdxgGOoJ4n+r2TlUe1OinW734nthus/A==
X-Received: by 2002:a05:620a:4003:b0:7e8:13ef:2b33 with SMTP id af79cd13be357-7ea110445f9mr348465385a.59.1755871012947;
        Fri, 22 Aug 2025 06:56:52 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:156:8000:24f0::3e8c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e04f43csm1322495585a.19.2025.08.22.06.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:56:52 -0700 (PDT)
Date: Fri, 22 Aug 2025 09:56:49 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: William Wu <william.wu@rock-chips.com>
Cc: gregkh@linuxfoundation.org, Chris.Wulff@biamp.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	frank.wang@rock-chips.com, jianwei.zheng@rock-chips.com,
	yue.long@rock-chips.com
Subject: Re: [PATCH] usb: gadget: f_hid: Fix zero length packet transfer
Message-ID: <c09f21ee-be83-4880-841b-70e1e5c036f0@rowland.harvard.edu>
References: <1755828118-21640-1-git-send-email-william.wu@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1755828118-21640-1-git-send-email-william.wu@rock-chips.com>

On Fri, Aug 22, 2025 at 10:01:58AM +0800, William Wu wrote:
> If the hid transfer with size divisible to EPs max packet
> size, it needs to set the req->zero to true, then the usb
> controller can transfer a zero length packet at the end
> according to the USB 2.0 spec.
> 
> Signed-off-by: William Wu <william.wu@rock-chips.com>
> ---
>  drivers/usb/gadget/function/f_hid.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
> index 8e1d1e8..8021af3 100644
> --- a/drivers/usb/gadget/function/f_hid.c
> +++ b/drivers/usb/gadget/function/f_hid.c
> @@ -511,7 +511,7 @@ static ssize_t f_hidg_write(struct file *file, const char __user *buffer,
>  	}
>  
>  	req->status   = 0;
> -	req->zero     = 0;
> +	req->zero     = ((count % hidg->in_ep->maxpacket) == 0);

Here and below, there is no need to check whether count is divisible by 
the maxpacket length.  The UDC driver does this for you automatically.  
(See the kerneldoc for struct usb_request.)  Simply set req->zero to 1.

Alan Stern

>  	req->length   = count;
>  	req->complete = f_hidg_req_complete;
>  	req->context  = hidg;
> @@ -967,7 +967,7 @@ static int hidg_setup(struct usb_function *f,
>  	return -EOPNOTSUPP;
>  
>  respond:
> -	req->zero = 0;
> +	req->zero = ((length % cdev->gadget->ep0->maxpacket) == 0);
>  	req->length = length;
>  	status = usb_ep_queue(cdev->gadget->ep0, req, GFP_ATOMIC);
>  	if (status < 0)
> -- 
> 2.0.0

