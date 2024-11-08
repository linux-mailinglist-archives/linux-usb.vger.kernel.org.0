Return-Path: <linux-usb+bounces-17371-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B979C1EDF
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2024 15:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 058CC2847EB
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2024 14:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9051F4711;
	Fri,  8 Nov 2024 14:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="CrntBuLj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDC81F4701
	for <linux-usb@vger.kernel.org>; Fri,  8 Nov 2024 14:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731074937; cv=none; b=CdPQCbPt+bRZAf6ff87l6AXoP5sjnq53c6KiL/2jI6kPfV+mlCZRXgbTk/3ULCK1kAzS6EpCJTf9evctF9Q786c3k6be+4p7/GJoYnJrIS2Anrjh5phFqBPIvosKV2BfLmNVxoJeuUjz1Jg2Im6LxUmId+N2tSqgi2r+zMwmHMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731074937; c=relaxed/simple;
	bh=KExqbf/k1K5jA+XDKyLl0s3iDkO6sjOXt2uAj01ZmCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPOLSYlhjnwJCglCMmEX6mPMO5cS6ARXAnuPJYdCUSn6eyrwxrY2xKBbUiZS/deqiRkZAjgGlH5h3Ne5eysBc+pgzX2EPhXUi4LIwTvg7iz6uhzm59QNWj4Jy+6ZEBXk/mMiQX1wzjS/oPuDIThAY4LfVmADdHrshiWPQnY23G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=CrntBuLj; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-460b16d4534so12680291cf.3
        for <linux-usb@vger.kernel.org>; Fri, 08 Nov 2024 06:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1731074934; x=1731679734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vEs+Cvdo88hID74B2Tz0bsmB7rf5MJJrk+JfTQxl8PY=;
        b=CrntBuLjlIORsVMXvt3oUwEktST2+jxSTMjGN6R5DGTsVOzyfzOOHm7P0kuJUgadXH
         eSimiL2ruY9/8YTxXKhCX7/IDplYPGG5Hn9ydeRJ8RNoHZN1yOK0MP84yTClkvDrEy6W
         VFYDyAz4+0rPMSXTzX8iAQ01mKDUh/nTqmS2c9a8WbMCNTfNOKa4yK8gxH0OVX6vNxaF
         cbX/1Hkh4eXYw5+uNR2v1HGjWGeLzaRt4ZxSf23uZROjuvoJFhpibFqoMzXFXGclLcQp
         St5GTIozwbuFVo10ZJOZJtNaFemggnLYgmZ/Wx126Nl+Jmxp5MBMNps0bSazib0rZP8d
         5omA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731074934; x=1731679734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEs+Cvdo88hID74B2Tz0bsmB7rf5MJJrk+JfTQxl8PY=;
        b=S2hpq97cLLbZeTWY6kK+9m5Yf0hhO8J6E95xOdU54zlt+UemrqE7VQqdRLpNXRfwBD
         gmKdbZsVitbqymvEl5cl7RmqTv3dBpCvYFgET4yxndFjbbWAePhF2DxgaUNSV70A9vCq
         4HGeq/WmuXgXfTfnC7venp3MEWYGGZ/05qJUXWN3MIptBL3YYSvR4PzvjMkdKYoXzYKo
         08AcK2yEj0GYbHK3UzH8FeOu24LxjpTeOfoT1bS/YsRNmRJEpv2c5LcPiXNMx1lnAnZU
         tf+ymEW8w8R7sX614f2Aeiu+NZhUXPA47tcIE09OcVaGxnjiruCENxBKp3ldP585Ual9
         H2eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeSmSmaF6BgpkjbeIBaONKubld3DfKjMQa9KVwCkZr9la9gEC60z/yStTl/HNxinC01PiK+7iYJyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY6nyMvmmc+g5BpAUfD7rHjSfWlM3thDSUkav+YYFLnnfM/g/+
	bWhzC36ouSpmfrcxJ4aCn+iy9wdhlrH37z5fCNseefVDEoG1PixnFxqktUvYXFVivIZWx3LPPyg
	=
X-Google-Smtp-Source: AGHT+IEzObL6UAU9yJ7jTgc1UgisBaDPStxv3ts2Ea+AI00Pk1QIitQFDzlUiloIeOtyKXC3RnS10A==
X-Received: by 2002:a05:6214:570a:b0:6d3:531d:8aa7 with SMTP id 6a1803df08f44-6d39e19d5bemr37918486d6.25.1731074934122;
        Fri, 08 Nov 2024 06:08:54 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::b282])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3961ed26asm19698146d6.38.2024.11.08.06.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 06:08:53 -0800 (PST)
Date: Fri, 8 Nov 2024 09:08:51 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Rex Nie <rex.nie@jaguarmicro.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, angus.chen@jaguarmicro.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] USB: core: remove dead code in do_proc_bulk()
Message-ID: <160ed4e4-0b8b-4424-9b3c-7aa159b8c735@rowland.harvard.edu>
References: <20241108094255.2133-1-rex.nie@jaguarmicro.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108094255.2133-1-rex.nie@jaguarmicro.com>

On Fri, Nov 08, 2024 at 05:42:55PM +0800, Rex Nie wrote:
> Since len1 is unsigned int, len1 < 0 always false. Remove it keep code
> simple.
> 
> Signed-off-by: Rex Nie <rex.nie@jaguarmicro.com>

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> ---
>  drivers/usb/core/devio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index 3beb6a862e80..712e290bab04 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -1295,7 +1295,7 @@ static int do_proc_bulk(struct usb_dev_state *ps,
>  		return ret;
>  
>  	len1 = bulk->len;
> -	if (len1 < 0 || len1 >= (INT_MAX - sizeof(struct urb)))
> +	if (len1 >= (INT_MAX - sizeof(struct urb)))
>  		return -EINVAL;
>  
>  	if (bulk->ep & USB_DIR_IN)
> -- 
> 2.17.1
> 
> 

