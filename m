Return-Path: <linux-usb+bounces-23145-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21725A90638
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 16:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 684F88E484D
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 14:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA0B1FC114;
	Wed, 16 Apr 2025 14:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="HaioJZAF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083921F8BC6
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 14:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812792; cv=none; b=XVL0Iafw0iqnFvx71o4d7SF+xO//e/2NG79LD5uQ5sxYdht6x/LzDuO1kJRQuZKx+eJcSM4vr3xsFbGP9ou9RACZJRxKOi2Sj6ThH9wYPfU40vuSsFBETUChJZ0YZNrby4x8RVwVvddMScKTQtWjwEKthUDlygtwcmMBp1J9o5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812792; c=relaxed/simple;
	bh=als+rfk6oCyvduGa+aQFEMQSki0kbRznKDEXbNApUMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r15M95pzDPhg+aP/Mdc2TMwFnG5Hi3el1jrSPoyHKZ5fHgzoDwTdfKmYron7k1LgyYnhzMh8NCO/wzys6tZTyREJt//+IreBLlATPkks4JbWrSvJEHYLUKfKbtszvKOsQVjkI/iItYwt5HMJzL+7ss0GIRhS/gq5WPiDUT+Z3YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=HaioJZAF; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c5b8d13f73so720967585a.0
        for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 07:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1744812789; x=1745417589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pks0t2682ixEDV+rKJC/2pXrF3RbV5mK870WF9n4hZ0=;
        b=HaioJZAFjTstRFj5iBqS+lq9/N9uJR7kwucLiB9GFQKOaUXbTrFxqwi9rq/VBQAHAH
         f0HHX9N2qoE2/V1WJNmEjbBchs4eVlpkt/aaDlT6Jh4ee0/4NYqnQuJumu1Of3717n7r
         pEVoWCoJGya7HsbKbEx8t/0mzGBpibMyfwBMZerybJrf5nX/z62NtvoiGYFh0O7TbdCg
         13urAJxJxd1GvxLKQ0MmdUuqrPlSu0MYPjAUSwhJBj2wJ0A9iVONeWf5NrnNuyP7G8ne
         84onzlCCSpwwmMSpI5vIvxCo9AVq40SdYs2kthx8ssXXMRgEhWP1io7N0sU5HSdDJvDA
         uChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744812789; x=1745417589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pks0t2682ixEDV+rKJC/2pXrF3RbV5mK870WF9n4hZ0=;
        b=g8vv5WAd4dq4vWXAWbTPSxyh7k0bd5iq2pO2lpYvTzDg9tDV5yKPFioUYlY1jXoGZM
         y/OZX3SKiezZll8/vK4axYpvW64zO0qqPVUFCFBXcE5dxf9nA6KVZc0ZEQxbAEQEvgAV
         fBjojSU2z0DRj+6ze9soaeLpkF0CZMs8SCpxlBLbxmvQZXpJxXUXeWi4dxkxFk4PD2J0
         1AeFk2IQBm5fF+ptKkkHibJ1b4VYOtqZ5mDIcN2OVO9f3phpLH1I4ubCzCMF4kWk4kOW
         DDCwvNcwTiZQpVwiq1i7xn0zSWkGrD2ugC3G9QKmOWBhCYAqYzcnApGaiwsH/rWyaQxi
         A7Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUWKBlHMQGMbHdm/77MneljNAVRKj2uU5D5hKHZYMzlVnQ9Xat6BrHTonn9dPcIgSxcqFtA6KKLLjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhMl5cbA2iFdaGnpwu9J/koLfnrlfPVdvQVbwRv+X8fkwaOb0w
	b+yguoCZNIksheSkdagGEizeoaHCTTrWRQooU9S9ETvcH8bLwJeVs9+WWXI1EQ==
X-Gm-Gg: ASbGncu/IF+E8t13+5GXpzgnxCuQ7Vg84/mVPba/BeKV8DiqgCTq4pKEpuit9RjFQGr
	8JURMIY+6CSsvCsoNLxJXWlVJcyB6zE7a28ck6H85K/h13Vk59E+F6e/6rzU2C+1TQrRiuOHcLF
	hwMkf/KePs6/hiKymrASn+W65mGFlYDWEus4krxmMXLQ18usHy0GIsYKQ3F/5OLvUHSXmPPpgZ/
	ejm8QmHYgh/5iFMiDD1A1tAXGQAHZZc+B7ilKtITOUDce1yjv3BqrjZWekI960MkqAXIfbqYiFu
	09X/nOa5wNU4d84JWHOkBOzi+0BihqJ5uIKNNBVJJyDaXtX+h2YQSurdNkk=
X-Google-Smtp-Source: AGHT+IFQVfFHxsUSyybMpwGTdG8vsHYAdEt7pGJ1yLJInbTaNdDRC1d/nfkD2HwTdo7V4ul8wPDRGw==
X-Received: by 2002:a05:620a:468c:b0:7c5:5003:81b0 with SMTP id af79cd13be357-7c918fefdf6mr240846285a.23.1744812788810;
        Wed, 16 Apr 2025 07:13:08 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8a0e5e4sm1058184485a.104.2025.04.16.07.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 07:13:08 -0700 (PDT)
Date: Wed, 16 Apr 2025 10:13:05 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Alexey V. Vissarionov" <gremlin@altlinux.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe Kleine-Knig <u.kleine-koenig@baylibre.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>, linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH v2] usb: tegra-xudc: check ep and ep->desc before deref
Message-ID: <f17d63cd-14a0-44bf-af9c-358d2a36b69d@rowland.harvard.edu>
References: <20250415174204.GB6814@altlinux.org>
 <79265b11-c23a-4e4e-b7c3-6cf5b89b9977@nvidia.com>
 <20250416095555.GB27292@altlinux.org>
 <6e0b8bb7-c9c4-4625-bad0-552dcad89ea0@nvidia.com>
 <20250416120000.GD27292@altlinux.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120000.GD27292@altlinux.org>

On Wed, Apr 16, 2025 at 03:00:00PM +0300, Alexey V. Vissarionov wrote:
> Check ep before dereferencing it in trb_phys_to_virt() and ep->desc
> before dereferencing it in tegra_xudc_req_done()
> 
> Found by ALT Linux Team (altlinux.org) and Linux Verification Center
> (linuxtesting.org)
> 
> Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB device mode controller")
> Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
> index c7fdbc55fb0b97ed..d61a0675e18f448f 100644
> --- a/drivers/usb/gadget/udc/tegra-xudc.c
> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> @@ -2658,9 +2658,21 @@ static void tegra_xudc_handle_transfer_completion(struct tegra_xudc *xudc,
>  	short_packet = (trb_read_cmpl_code(event) ==
>  			TRB_CMPL_CODE_SHORT_PACKET);
>  
> +	/* trb_phys_to_virt() dereferences ep; check it here */
> +	if (!ep) {
> +		dev_err(xudc->dev, "unexpected NULL pointer: ep\n");
> +		return;
> +	}

Is this condition something that is totally under the kernel's control?  
That is, is ep always passed in by a driver and there's never a valid 
reason for it to be NULL?

Then there's really no need for this check.  In real life it will never 
trigger.  And if it does, because of a programming bug, you're better 
off getting the stack dump that comes with a NULL-pointer dereference -- 
it would certainly be a lot more visible to the developer when testing 
new code than a easy-to-miss error message, and it would indicate where 
the actual problem originated.

> +
>  	trb = trb_phys_to_virt(ep, trb_read_data_ptr(event));
>  	req = trb_to_request(ep, trb);
>  
> +	/* tegra_xudc_req_done() dereferences ep->desc; check it here */
> +	if (!ep->desc) {
> +		dev_err(xudc->dev, "unexpected NULL pointer: ep->desc\n");
> +		return;
> +	}

Same here.

Of course, if it is reasonable for ep or ep->desc to sometimes be NULL, 
then the checks should be made.  But if that were true, I don't know why 
you would call dev_err().

Alan Stern

