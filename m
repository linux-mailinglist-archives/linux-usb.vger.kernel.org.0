Return-Path: <linux-usb+bounces-24792-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5B4ADB30B
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 16:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85BB516B4ED
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 14:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3AA21D6DB5;
	Mon, 16 Jun 2025 14:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="MeKBSpTS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F078B1B4247
	for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 14:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082855; cv=none; b=plQeqlNkZh1ASWeupM7pO424WYC+NOfzjf89Oeqgo2QQiRSXaQiR3Vk63msrevtQAyQfa8o1IlYplosU9EYLGQr0Fge7cTeHYgxdzi0vWdqGPkjLcR5I6tNaS9xGs19fmkpMC+B42rh5sqxvJW7qp8eXwK1xgvVsL3g0lmJYsoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082855; c=relaxed/simple;
	bh=VOlFTK+czEYRjfGf+Dzen6MJPjhAC1FwiHRCDVvik0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oyBLOaM72fexfFj8NafAOMoI/VsDt/yKscRNZceaFdlbbzg1TWJGY+cP7z8oPEj+ROQ5K+r1p/fUOPtfHaTrDT1R9il47bmAuLX/sNm5dIlTCCV3kTtRYi1O3vp7HrOTts8/xGTGqeVVt8pvBIqhOoJxRZSFkeU3ZEq8g9fmoXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=MeKBSpTS; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c56a3def84so469729385a.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 07:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1750082852; x=1750687652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6iXQWbgKb41RQoxa2LzxIBSkI5h3O7I/P68z8+crXOE=;
        b=MeKBSpTS33WPffEAV00cEKY+mGhd4T8g49serRPzI13thcd8lNjqEDoFOnhFoOp41K
         yiHjZtaAatZJ59GV45Sy9WCOT64YKuCYMwt8XhTmSSCZ8v4xIoEm2aIpKvc9E6lSnv/0
         goUthPT8E+KYsvVRxckqMBcjVgrl0rWgFWXyX3kpBETXWD0HbTaCzsCy/KfcebgBJQ0c
         s9V2KeMiL5YbJW8v6CEjKKJtOm8z1+kzIxKBBnEcd9c7JsP0vebez8JjtKfd3AztlOeD
         bdRclxPW69FZLmIxwTVGMvtq/hDCQmUB9G6YylPAIX2+l52sMUgQiabLyagHglomGMds
         mQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082852; x=1750687652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6iXQWbgKb41RQoxa2LzxIBSkI5h3O7I/P68z8+crXOE=;
        b=Q455RTX9fqPnUrRll7P5ZPY1t3Y0y/iKQnjqm7rA9V9A6+Y2aevSRugyDmRbryty6Z
         WMzJNQh3BaHduOSkDTKBMjXxmns1kZRj4A5CEVmNC4gYBbjpvj+5OkYOxLAeBzcEJIqN
         TPTnZTn6EQepVWctBbS/I6J9HVJJpNwCDltLIaikgN/rQGd/gv6RVRXXSieiET+CV7Ai
         9uBdylqFLjxHLuYkCsiEdTuOaKONpAr9g6AwPxq8mb2LkKxB+F5FLxB+9o3QO2vabiF5
         Ziw2N3ECu/HvtSBjXQU1qBJaD/x1TdhUYoL+VWwed0Nz+k4wZIhHqbDx6PdhKuWb4LxF
         IfvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5E+sCWWX+3iL0MnEkF4nLjjoPe+eGGu+2rf0LJN1MPRXh04Jpvgt/Q6cgynhop/6m0QtZ6T95XMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFCoYVJjQf6v5Azo18HA2xEapuhcAxOjQ2Dcn0AoS7yNmsL8HD
	F+WaveTreaseF4X1IFwwSCxOFs7H7/SaKS4KQk8aOUiujrFNtoypzI7w2/IHpBV7eg==
X-Gm-Gg: ASbGncvcX5+K8SenhuUGObGL29yTnJrB2hiOWcEV/KaWSUPHHOqvoNb6Rmqe3ygaw4B
	hzu7YB40jFeDRjp0igjOwj81l8chdH12AxtjRZCbLkh6jDGEE9Nt4AeEi3NDFkxeD/8XLrFvSlr
	CnL/BFN4CWT0Mgu2ettHHhfryop+5INSNer7fvB1YO4DHh+kHVpii0eh9kD90ZoqSc0rt4Oo1xY
	HeHP8NRzRngT7UE+aro1Lj814ut/yeN5jAW76dr549Cg4qUkMMnb6ZRkOMHCHIm81OvGVE5kVCj
	OhuYJNajyR74GOfvRJyKW+2bZ9f6ZzXAvszpUD5U5V/a0gaaeZIe/Ew0uETQiISJVgFSRW3uj4Q
	ip+BY
X-Google-Smtp-Source: AGHT+IFkSUYnJV0/yN77bju16oisYocc1x/yEGqbjZIhUKVVF4Zf2CxdRQFefSRz1+8JbH1TMEjCvQ==
X-Received: by 2002:a05:620a:19a7:b0:7c7:9a85:d395 with SMTP id af79cd13be357-7d3c6ceb724mr1373478185a.44.1750082851704;
        Mon, 16 Jun 2025 07:07:31 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8eceaf6sm533663985a.78.2025.06.16.07.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:07:31 -0700 (PDT)
Date: Mon, 16 Jun 2025 10:07:28 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com, Thinh.Nguyen@synopsys.com,
	Amardeep Rai <amardeep.rai@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 2/3] USB: core: support eUSB2 double bandwidth large isoc
 URB frames
Message-ID: <c82aa592-7904-44c1-b595-ede6eed14ee4@rowland.harvard.edu>
References: <20250616093730.2569328-1-mathias.nyman@linux.intel.com>
 <20250616093730.2569328-3-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616093730.2569328-3-mathias.nyman@linux.intel.com>

On Mon, Jun 16, 2025 at 12:37:29PM +0300, Mathias Nyman wrote:
> From: Amardeep Rai <amardeep.rai@intel.com>
> 
> eUSB2 double isochronous in bandwidth devices support up to 6 transactions
> per microframe, and thus doubles the total bytes possible to receive per
> microframe.
> 
> Support larger URB isoc frame sizes for eUSB2 double isoc in endpoints.
> 
> Signed-off-by: Amardeep Rai <amardeep.rai@intel.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>  drivers/usb/core/urb.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
> index 5e52a35486af..911091b92fd7 100644
> --- a/drivers/usb/core/urb.c
> +++ b/drivers/usb/core/urb.c
> @@ -372,6 +372,7 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
>  	struct usb_host_endpoint	*ep;
>  	int				is_out;
>  	unsigned int			allowed;
> +	bool				is_eusb2_isoch_double;
>  
>  	if (!urb || !urb->complete)
>  		return -EINVAL;
> @@ -434,7 +435,12 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
>  		return -ENODEV;
>  
>  	max = usb_endpoint_maxp(&ep->desc);
> -	if (max <= 0) {
> +	is_eusb2_isoch_double = dev->speed == USB_SPEED_HIGH &&
> +				xfertype == USB_ENDPOINT_XFER_ISOC &&
> +				usb_endpoint_dir_in(&ep->desc) &&
> +				le16_to_cpu(dev->descriptor.bcdUSB == 0x220) &&
> +				le16_to_cpu(ep->desc.wMaxPacketSize == 0);
> +	if (max < 0 || (max == 0 && !is_eusb2_isoch_double)) {

Minor point: It's impossible to have max < 0 here, because 
usb_endpoint_maxp() always returns a non-negative value (the return 
value is &'ed with 0x07ff).  That part of the test can be removed.

Alan Stern

