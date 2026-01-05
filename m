Return-Path: <linux-usb+bounces-31928-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8C6CF4B95
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 17:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C1B3331FFBE
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 16:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7010E34CFC1;
	Mon,  5 Jan 2026 15:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="PfZXt8UI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3AF34CFAE
	for <linux-usb@vger.kernel.org>; Mon,  5 Jan 2026 15:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767628532; cv=none; b=rIwJD45wXeuqcAmJhV1vRO5JL0DGHQk4flYDJLY1zc+BtvMOjcZ53wyAJo6LqCTPNebp4P/uFq6tDf+xL8aHGa70vSlcS1g4xfE3yIUz3FVs5myFlNuDd5sVNoz8lGlNMLA8fRz5FpWeUQ+Ik2KzkJbsvC3re84RVuBdTjmM0rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767628532; c=relaxed/simple;
	bh=hes2MbdkVF9yIn9MnCpJxkd66Lx7SdXTjEcqnRJvL2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QAV6xYZPnnsTIBI59mGbYtP3jxCoiYuC0Yx+jATv9egs4pLzMyF7Jx4nnNiAlk2CMtR3FgTDv9f2coDTFfd9kLEaSoEXx6EA3MPP4PwxkfqVDgTuFn9pCqMGI4ki/5J/q9XE/5z/Tinr2DbNFynbDOzirG3OduRb0dtzE8tpQ8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=PfZXt8UI; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8c30365ac43so3769785a.0
        for <linux-usb@vger.kernel.org>; Mon, 05 Jan 2026 07:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1767628528; x=1768233328; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BeAT9vM71VqfwMjw1Ny+vwWqsDrL2cWSeK9CC94wID0=;
        b=PfZXt8UIwV9X5jSxDa/YJR6KDeAw1vPkpvUsEo4Nu6QtS9ezZAYL7BQzBoT/kd70QH
         Qq6ukcZ4JIPz/eh5OQeqjjT9ckIeTCElDALahsZeQjk44ubHNNu7CGXJg3OFlufPxcWh
         Vwz6Zo3AqA3rIfxvN3JU6IJFqwQ4I4iS+jAYAnYB47yt8z5vDMeHqn+4yOMztq4kPBmd
         Q+Jj7UbrsEo6oX5z1TL0bVpsDFSljEQ23vRfqMiGMYEo8okJnjPWApw4PMaypdZ4RaV9
         y66/MvLA6j3L//dz6klrIKn2XQRjZcL9Tb+GMk88R1ctPp9EUiN3aUu4sipuiKOMy68V
         e/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767628528; x=1768233328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BeAT9vM71VqfwMjw1Ny+vwWqsDrL2cWSeK9CC94wID0=;
        b=QzN54rdDCuiANpTRP8Oyz6ocvRNCqLfzq4tfi3alsaoipd/d7GyCbn3/hdMa9GvvQg
         vgvtaLshuhXp8ZXbuXm2U3LkSAb9yEoiPJ/X7gvi9obl1WL2Xc0AAhBBS5vhFjV/E8hK
         veQWBFuo2lzRWW7Xao4ME7/nyjpn5xwMSjBPCMgK3wVlrQW7pfpygh8EGsZpbWdCnoR2
         FxVhM6AK7sYU43uQZ8yhUe4Ihm8N6zo4iLKMDPorWuVtz/FHRCtupIqUZCJsU1HgJcE0
         LeremcuUh2sodMItZ0roj3oJNWOc7rpEa6zf8o2pHrD7sHLO9gyBFAVzwBpGqF6RDPVV
         TIMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBx5e0gdM7f8x/q09hDLdMjRos6Wix8I/p6QpPzYxVcdfPsgncjkHAF0tFoCftVfHraBTfbNNL4rg=@vger.kernel.org
X-Gm-Message-State: AOJu0YznZYHyHPhHE3VqMMUcSFj6WBYQPxz6yJpJ7AsfrJ1m5FZIplfQ
	15xF6mizhSBB3OfoimVhicxIuWpzxpERhstVzuiqeRm1NXXqzAqvbkf74gfLmjd4JgeogOBMTeG
	ryZM=
X-Gm-Gg: AY/fxX7i+QmEMXMWwU9Voldv0c65Sz6QB25FKpRZxK/pLEyAY2KbzuwIe6d5CD0mpuq
	GUrLSUrt1nWQhNmDV6/1Wi83lTaV+ClU7Nzpol1z9TxDAhhGQWIK7lr//+OvbkG+i1FWz4qgD0F
	7hvdjT9jsSikUDoUk0GlDIFOt/ku+qF05XL4mS71n7XAqyftmlAVcnAm5v6f2kiPx/SjsK5FhCf
	83z9LHSMt/xtfvd64/XizP8a+77IJ1RLdm/EIpVKfLhRCUwy76+ECBEWHYl45YJJGfUti41RzII
	00FIx3dVkF6vg3R7IIUlzATQmE8OSM8IjcTC2yIq1FOCWdF8RyenTNd97HelCWMFb/hNo+r2q2Y
	IZuEAM1Rz+7VzuEYkzyw0fg3YhchvpTq4rRHW0eykKZoJe/e3Jy0wVKvGv5Wi7oqFg2RTPwOsvw
	+NonC06/MmrFvb
X-Google-Smtp-Source: AGHT+IGlRMQLJRb3GZ220nv5wnHw42Zy7HSuNwfcckmPxpt35yifoP1PGs5uvmjp44CbejRczhio9w==
X-Received: by 2002:a05:622a:5c05:b0:4ee:1f22:3615 with SMTP id d75a77b69052e-4f4abd753a9mr725214301cf.51.1767628527916;
        Mon, 05 Jan 2026 07:55:27 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::e55f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa7201af4sm705951cf.33.2026.01.05.07.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 07:55:27 -0800 (PST)
Date: Mon, 5 Jan 2026 10:55:24 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [RFC PATCH] usb: gadget: uvc: Prevent smmu fault in unstopped
 stream uvc teardown
Message-ID: <9101e538-022a-4802-8bec-891c14b221a9@rowland.harvard.edu>
References: <20260105050724.2041581-1-udipto.goswami@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105050724.2041581-1-udipto.goswami@oss.qualcomm.com>

On Mon, Jan 05, 2026 at 10:37:24AM +0530, Udipto Goswami wrote:
> When switching USB compositions while the camera is streaming, an SMMU
> fault can occur because dwc3_remove_requests() unmaps buffers via
> dwc3_gadget_giveback() while the controller hardware is still performing
> DMA operations on subsequent requests in the started_list.
> 
> Fix this by adding a delay in uvc_video_complete() when handling the first
> -ESHUTDOWN event  (detected by checking !UVC_QUEUE_DISCONNECTED) to allow
> the controller to  complete in-flight DMA and drain its FIFO before
> dwc3_remove_requests()  proceeds to unmap remaining buffers,
> preventing the SMMU translation fault.

Wouldn't it be better to wait for the in-flight URBs to complete, so 
that you _know_ the controller is finished with them, instead of 
delaying for some arbitrary and possibly too-short amount of time?

Also, wouldn't it be better to avoid calling mdelay() while in interrupt 
or atomic context?

Alan Stern

> Signed-off-by: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
> ---
>  drivers/usb/gadget/function/uvc_video.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index fb77b0b21790..04724bd44ab9 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -366,7 +366,15 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
>  
>  	case -ESHUTDOWN:	/* disconnect from host. */
>  		uvcg_dbg(&video->uvc->func, "VS request cancelled.\n");
> +		if (!(queue->flags & UVC_QUEUE_DISCONNECTED))
> +			delay = 1;
>  		uvcg_queue_cancel(queue, 1);
> +		if (delay) {
> +			if (in_interrupt() || irqs_disabled() || in_atomic())
> +				 mdelay(1);
> +			else
> +				msleep(50);
> +		}
>  		break;
>  
>  	default:

