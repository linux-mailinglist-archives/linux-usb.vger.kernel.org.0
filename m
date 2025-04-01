Return-Path: <linux-usb+bounces-22443-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D6BA77DAD
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 16:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7906B3B135A
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 14:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6B6204C16;
	Tue,  1 Apr 2025 14:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="M75HErG7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E49202F90
	for <linux-usb@vger.kernel.org>; Tue,  1 Apr 2025 14:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517487; cv=none; b=SWZZjl0ZlbcynWH8NLw+lC3vvPl222vfJv5YGCCyHqMbhX+7v1cw0w7NBtAkphlzr4Nc+9XjYxYKqY2RRJ8ZpPhL6iuQLGxVQRwlB3yqeEpdwt+WvVjgWDw/3IVNJZn/1B8+4t716xqpimKQBqodNrG8tWUY9BVJ/GCJ+EUQJwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517487; c=relaxed/simple;
	bh=ruRQP+NALzlaps2YWcoiJXAJEk0o6bPMKOX1fg7yeVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvGFqvuA93a9mLADQTc0iDGWGg+rX+UOAxkQUevgSsoiUzAq0EjUJQ1bVza3E88vWx5FID63JWhsvma97U2Vv6BYaitKNfPLFjG5EAPZqlfpUY7TayIADBgScyRetc1yKsseF1lSDKnU9seCAcNKJEpwrvRb3LJoq2jXBxwWVnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=M75HErG7; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-476ab588f32so80204891cf.2
        for <linux-usb@vger.kernel.org>; Tue, 01 Apr 2025 07:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743517484; x=1744122284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KalA4225oBl3ZvNYyeXZv8udkfU/6CXUOgPRtBpVF98=;
        b=M75HErG7nlQueEr/I5yNgtPRsq7Dbop8Rp8hB3KzqRncY4IUY5IWdMOyv5edBrRv/S
         nD5VejQGsw3BAujgvlnJzS7bvtEFeF00T69B4IgRLWWD6GeiVzagfFhNSMkTvrHRbZz6
         bdD4lSaoVlsr0ynDBlrsFJEDW7zuiJu/7PdUG/KPgeiOZiBOw3BZGNxlhrzBKrHkxiM2
         o3vf0hpt05fFt3Hyih3f9jqO7WrTSJdeFOPttxaW3SURz2AqXtJaRlCh3BWkjhDz0P11
         gCWlBamIAnK3g9ACfgyVDud1EW3ukShDQ6flyyLZ/Jj/pPtAvl7fAxti99aNe/JwOCLo
         zQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517484; x=1744122284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KalA4225oBl3ZvNYyeXZv8udkfU/6CXUOgPRtBpVF98=;
        b=NQCu9X7CZS0X/8T4DcPGC+HNH0xw67uLUFvB7IaoKtGz20haYtHGYx5+R/DEVs37Uv
         fV7zGyFNi1fP+zfRn5QSxG7Wo2v0OtwgaigQBxtIasAQJ/LzFBhkqvL4RmBNagBoboCE
         j6FMhjz12ECSQ8Nr9VenGxt7228BMM+IRiN9utn0mn8LmOJFUhgk3jplpMSLFvhTLTb4
         EjaDuRwRiEbxoxgU82PXgkewJkFUyZX2aNGWDBXTl+kQv6wPaeD00zY9Imepiz2KCj6w
         XnTsvPoxhaGYo9f5ssU5cQ1w1vL17QW4Taf/XWnuNPTdKbDOZ4NOHIbSvGYVioMK+P0I
         vDrg==
X-Forwarded-Encrypted: i=1; AJvYcCXWKyZzBqKMVjde4h2/C7hN7kcOM/m9VXsSNbM3zqIE2pqq78xIsa/jxd235Y90eThErAnGl45FAqM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ8/+CyLBUocZPSkbs0F7NUcxOL1UYTU7pyVFHUMtNTFHnkSNw
	IWeWLKt3d5z/6uf/BY5osBmHsI0qUeuTThm82sDeprzSl0r9ZN5CM3c7MwpcAA==
X-Gm-Gg: ASbGncuqACbwf9qm/AD/HwctO6kEuJpQq+8kXvVS5QuM1xC6ejtN82KgLCWbyo8V2Px
	mYlEl/bljP1wRyeGgxT6RKQp1QuATHk0qSWXdBw0SY48sPAmesOZhIYyDqVzSxeJU1oFJeCHrCt
	VrMuSkjsNRcBysK297N4Rn2T+NKjG5Noz66Yt/JzcLNZASGnzTxLaUOvSkatLZeJvih7yZcyIVO
	SmGjvlQOsIfiABXbvjFJUO34lG9btVMn+PRj7k78r+QG7Pie4rUo+J2kla+EkR/Niw5ckRCgGdZ
	BAlZ3ox8q77CrqhRNdKeWdPyZexf83esdU5xWOYrBa6jkcF2fzym2ObNpNn9ynE=
X-Google-Smtp-Source: AGHT+IHM51nyniYqK5T/X7rJ6xKvSn4u9N4XA6OP1lkcVAxyNAwhavhEPDkoCbRJzJPfgL1uJjnDug==
X-Received: by 2002:a05:6214:202c:b0:6ee:ba5b:d8d1 with SMTP id 6a1803df08f44-6eed61c3606mr265124296d6.16.1743517484138;
        Tue, 01 Apr 2025 07:24:44 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f76824d5sm663280885a.30.2025.04.01.07.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:24:43 -0700 (PDT)
Date: Tue, 1 Apr 2025 10:24:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com,
	sumit.garg@kernel.org, kekrby@gmail.com,
	jeff.johnson@oss.qualcomm.com, elder@kernel.org,
	quic_zijuhu@quicinc.com, ben@decadent.org.uk,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/4] usb: add apis for offload usage tracking
Message-ID: <fd54ab58-1357-462a-8e3f-a785f7b56813@rowland.harvard.edu>
References: <20250401062951.3180871-1-guanyulin@google.com>
 <20250401062951.3180871-3-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401062951.3180871-3-guanyulin@google.com>

On Tue, Apr 01, 2025 at 06:22:40AM +0000, Guan-Yu Lin wrote:
> Introduce offload_usage and corresponding apis to track offload usage
> on each USB device. Offload denotes that there is another co-processor
> accessing the USB device via the same USB host controller. To optimize
> power usage, it's essential to monitor whether the USB device is
> actively used by other co-processor. This information is vital when
> determining if a USB device can be safely suspended during system power
> state transitions.
> 
> Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
> ---

> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -2036,6 +2036,114 @@ int usb_disable_usb2_hardware_lpm(struct usb_device *udev)
>  
>  #endif /* CONFIG_PM */
>  
> +#if IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND)
> +
> +/**
> + * usb_offload_get - increment the offload_usage of a USB device
> + * @udev: the USB device to increment its offload_usage
> + *
> + * Incrementing the offload_usage of a usb_device indicates that offload is
> + * enabled on this usb_device; that is, another entity is actively handling USB
> + * transfers. This information allows the USB driver to adjust its power
> + * management policy based on offload activity.
> + *
> + * The caller must hold @udev's device lock.
> + *
> + * Return: 0 on success. A negative error code otherwise.
> + */
> +int usb_offload_get(struct usb_device *udev)
> +{
> +	int ret;
> +
> +	if (udev->state == USB_STATE_NOTATTACHED ||
> +			udev->state == USB_STATE_SUSPENDED)
> +		return -EAGAIN;
> +
> +	/*
> +	 * offload_usage could only be modified when the device is active, since
> +	 * it will alter the suspend flow of the device.
> +	 */
> +	ret = pm_runtime_resume_and_get(&udev->dev);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	refcount_inc(&udev->offload_usage);
> +	pm_runtime_put_sync(&udev->dev);

The USB subsystem has wrappers: usb_autoresume_device() and 
usb_autosuspend_device().  You should use them instead of calling the 
runtime PM routines directly.

The same advice applies to usb_offload_put().

Alan Stern

