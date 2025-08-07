Return-Path: <linux-usb+bounces-26584-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF21B1DAB0
	for <lists+linux-usb@lfdr.de>; Thu,  7 Aug 2025 17:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 949D87A2E3F
	for <lists+linux-usb@lfdr.de>; Thu,  7 Aug 2025 15:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1C4265CA4;
	Thu,  7 Aug 2025 15:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="B4Hlb6/N"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB44EAF9
	for <linux-usb@vger.kernel.org>; Thu,  7 Aug 2025 15:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754579963; cv=none; b=KTSvQ4g/65CLK6TNUmCG2JHkbJb0a+27dC/+PyzKylCRCz/4n9phyA+LR7SNHpUaCXigCSNIdJ2/3qlo+vzIbXzfSe/hERBlrFWk3JlM7bbxKDFietsJcgYR3hYIR/iGUnIrrI18DaOGA6LZI3D2XYdND0L3lYOwbOHZ8XRa1KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754579963; c=relaxed/simple;
	bh=dUJYtnKMaNQEX2kjQtBoukkJFRxePnlo/yn1utIkSis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNVjzH4rt9luSr4XvQdReFjX1b+XB6AT7osYodUmL+GzWFpmqT+TyCNpzeVRdol6sHGPaTiC11Syh8D4yFCy2aV8noKYADH+t80mVGiUpGMJMBOkJw1KzrH1POvlhB4oaFFBhmXnksXereajzLMhTvo0mz7VzOjr6uHrAiBSnbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=B4Hlb6/N; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4b070e57254so11411311cf.3
        for <linux-usb@vger.kernel.org>; Thu, 07 Aug 2025 08:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1754579959; x=1755184759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=faHGYry7JFACWgwhAk05+kiORH323at/E9i9XFDBCg8=;
        b=B4Hlb6/NURauht4R26dPyyaA4bakgYX1fMlDv7Z6I/4DXCuuEeofx5+ltOAFQs5MJE
         vqX/UUe2tCU3NnimpfaDun413RS5HtWK14UQKg9lIGPTFnbmhaxb0fljG5qACajGGT8R
         jM7+i1LEsWLJ8TXFoFRXAIAWd+Yv1hqmPQoCjhEhogdXYUWJlr5MKmpPTpKChvhNL41k
         KMsJmlpkHSwJ7xw5aE/OGwWCZ2BXCDHZ0xPAwxo/thFc5kaYcHEcMNT8aMAcSSvzkKeV
         9bK3Z9Ncff8r0FnKBDqX5vxsAf6NxMABa1Ljq7GFCGLWFTxKYX4r40+u8gjPLRi89F0/
         Hmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754579959; x=1755184759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faHGYry7JFACWgwhAk05+kiORH323at/E9i9XFDBCg8=;
        b=pVmxAh0zYqEafGVt+14Bmgi3QqcuK/S7oh8wNP+GZ6HUOK0aUdXGwDTeYrIruRuTV7
         zjtrN7e7AjD1bZLFsGpEpzhg6s7KVI6CH6vOjKPx59wD+XYSNg8Hja7Y97dXCA9z+ZV8
         RAWASYgK1p/JHSAbxiYBUrOOBUBBe1u1sVU7ZODnzfd1LnhKAPX9b9WqjB56W0mZoqld
         mCMTSF5LHrstamXm2b1teS0Lyk8gIpvc0PozABByT5/9hteZ+7yTuDiVvbblRefdzXul
         ErsOWPa2y1DRdyr1gaMEn9j3cygTw8PJYKqYM3mQ65nO2HwtfE2fkgvQNgkhZyw9/gGN
         c3rg==
X-Gm-Message-State: AOJu0YyHDAyJtG4JYbDhi488jSeFAhO+plaNJn+3ckXwwWEzb1tvphMg
	KDLl35p7sRZshYdoo+ZycAlvPKXJAGsCzAnClkZCwDafCUcUhhxcYGOEGj6VzAxwX7+gmiZV+lI
	9EXE=
X-Gm-Gg: ASbGncv5HPpPqdfcUm5Ne7/jYXhhzyPvypN2M4LKudYwuJ6PPXnrz2ffyNTD/v18DYz
	THR49D7LQuhNGv9zjGziDkGBJCC4YCwBmJHrwu/RfI2dphI564sTg6uZlVJLGZWPZ6tgsoYc1MI
	vVMpqCgvdQalGLSWKAXyAu3V6rOv9Lh5w3yIC4mkvSPLBSVJQ7OU7CrDNNS/6Hs6KsgERS6NEuu
	Lt2LUAWeaq7ikfMbYf7Q4NCZoYC7DeGJVNXdWI8HZ+Dn/4xhYIjmfP21PKi5BWjWeX2NpUUtewF
	xvwXe2BMwedq2+2WR822SN5H7iPoy3ZykRMO5f64PJoCqMJcNXJS8+mtoduylKIk5TNcmu2qVtQ
	V8onDOsBrRbM8IWM52DzP3nQ=
X-Google-Smtp-Source: AGHT+IHZH/vc6xpU6QyixPHPPQtt1ig9MiU0yUoxvy04aS1nputwwrIeFoiC5ItTvYYz257gyJDRYg==
X-Received: by 2002:a05:622a:1a13:b0:4ab:5e1f:ca8a with SMTP id d75a77b69052e-4b0adeff0fcmr1316911cf.14.1754579959069;
        Thu, 07 Aug 2025 08:19:19 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::401d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0696a3744sm51521971cf.37.2025.08.07.08.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 08:19:18 -0700 (PDT)
Date: Thu, 7 Aug 2025 11:19:15 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com, Thinh.Nguyen@synopsys.com,
	Amardeep Rai <amardeep.rai@intel.com>,
	Kannappan R <r.kannappan@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v3 3/4] USB: Add a function to obtain USB version
 independent maximum bpi value
Message-ID: <c8b96c39-ba49-4199-8895-5056efea5dac@rowland.harvard.edu>
References: <20250807055355.1257029-1-sakari.ailus@linux.intel.com>
 <20250807055355.1257029-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807055355.1257029-4-sakari.ailus@linux.intel.com>

On Thu, Aug 07, 2025 at 08:53:54AM +0300, Sakari Ailus wrote:
> From: "Rai, Amardeep" <amardeep.rai@intel.com>
> 
> Add usb_endpoint_max_isoc_bpi() to obtain maximum bytes per interval for
> isochronous endpoints in a USB version independent way.

Is "bpi" really a commonly recognized acronym?  Offhand, I wouldn't 
guess that it stands for "bytes per interval".  Can you come up with a 
more explicit name?

> Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Hans de Goede <hansg@kernel.org>
> ---
>  include/linux/usb.h | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 535ac37198a1..da0f51dfe15f 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -2049,6 +2049,37 @@ static inline int usb_translate_errors(int error_code)
>  	}
>  }
>  
> +/**
> + * usb_endpoint_max_isoc_bpi - Get maximum isochronous transfer bytes per interval
> + * @dev: The USB device
> + * @ep: The endpoint
> + *
> + * Returns: the maximum number of bytes isochronous endpoint @endpoint can
> + * transfer in during a service interval, or 0 for non-isochronous endpoints.
> + */
> +static inline u32 usb_endpoint_max_isoc_bpi(struct usb_device *dev,
> +					    const struct usb_host_endpoint *ep)
> +{
> +	if (usb_endpoint_type(&ep->desc) != USB_ENDPOINT_XFER_ISOC)
> +		return 0;
> +
> +	switch (dev->speed) {
> +	case USB_SPEED_SUPER_PLUS:
> +		if (USB_SS_SSP_ISOC_COMP(ep->ss_ep_comp.bmAttributes))
> +			return le32_to_cpu(ep->ssp_isoc_ep_comp.dwBytesPerInterval);
> +		fallthrough;
> +	case USB_SPEED_SUPER:
> +		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
> +	case USB_SPEED_HIGH:
> +		if (ep->eusb2_isoc_ep_comp.bDescriptorType &&
> +		    !usb_endpoint_maxp(&ep->desc) && usb_endpoint_dir_in(&ep->desc))
> +			return le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
> +		fallthrough;
> +	default:
> +		return usb_endpoint_maxp(&ep->desc) * usb_endpoint_maxp_mult(&ep->desc);
> +	}
> +}

This function is complicated enough that it probably should not be an 
inline routine.  Not unless it's used in only one place (in which case 
why define it in a .h file?).

Alan Stern

