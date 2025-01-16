Return-Path: <linux-usb+bounces-19416-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5BFA13D36
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 16:06:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C28863A3B6C
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 15:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C32E22B8B4;
	Thu, 16 Jan 2025 15:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="sH/VnWpT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3091C22B590
	for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2025 15:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737039993; cv=none; b=OR1PD83UhKtC6gnfgGMP2ghZkaIdFUPjWOJVFP7TAwBInEPP0rsf8Gx0F8oj0Sun3iJe96YYAQ+NYMZAbXPyiXtpGQXamOKfL6LVtnt41o8XLh7XF7Tk+3KcR0Ju/3jcGGmq76eXQ/E2UcbVoW4UPwCMgJalcl2hNzY71HAYkJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737039993; c=relaxed/simple;
	bh=oG2F8xXGtIwtvCB2psTNr2rTBTy0NoXrjQaVcy/VBS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OAWKnoYvp1rRY6Ix8rVUzSASCOnHiHkgihHc7fDMo/ZKEfIH5JWgrc/AMAOGehRy04KcN7jXKq2BzJD/n7v3wMrr8+HK9ODeNHBq9rYDkXakBcFQ6oAiYUbp42CgriukeChchVAYLDMXj2zM8t6tkm32OCJzYRvJ/S8RpUIl4tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=sH/VnWpT; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6d8f75b31bfso10124246d6.3
        for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2025 07:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1737039991; x=1737644791; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0nAZJMInzyGZTtSyDilCukDk7rI34qxFCU+Z358ruI=;
        b=sH/VnWpTpgKen++BGBMCB8e4RlTVosfVzShLz3+364d4FUwbWI9VObglhIYuf8JjhU
         RWcPr1pZ3ti4QbamOS7PlE8LkwifcDV90u4fVrv9wBmtZ57pPL21n2u0RnTC0GhiMxzG
         ul1xUFxEJ/3S8Qnd4CqvzJ8O+BDwwAa2uW1fJxjssWDhn82lG5qbgRNzAvPrwqCW06RN
         XwXPjQGWnxGW9Hvv+OfRol9cdBIoyznSe0RaQDRchRFjokoi0c87DsHVq1UAovi1w3sk
         rI9sKjVTRMbItbmDOKfW9gnwrKVHUZwKmJG/GF1cWFEaIcNDlUe0F6iR1MuLXCcY3a69
         Bs7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737039991; x=1737644791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0nAZJMInzyGZTtSyDilCukDk7rI34qxFCU+Z358ruI=;
        b=kHXfQ4ojcvfYNxf8zJ2VTS3yCWZ2reWHXSpHQns46NhIkxqze8b/H3SDIqTLRPwZQQ
         okulULpA4uCi0PbX/xc6Ej7Kmi07mB3ZuIUI2/1UVrRNd6510LoqgTw1o4WiCyRoLraA
         Q0Y0hqYS2YpWvjA4uzAoQgMgGJeFU8WTnvB3F88p+isrd04hfz4Vt7GIYGiVkVIZ8yHU
         HxfuzkuEqQ4g1Tf/AmGwavHog6cVIL8nT6ujX6xlO+DhpFcbMhhBLk7fjwv5fymZ+S62
         b2TjmAdvKxYU7omqEMecSEiHSMlaYUuu9PLKyUFBpXMOZO5KecyPAkHiOfclupf+gshg
         S+Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXtMt4n2Ctp2uCJw6Hzrpil2nxT6rgPbnVZITV6gorUMOD3SrNXOzzGfHR2z4VuqR8GhD0VcH9DVfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYSA4WRX45FuuSJG+hQ7tsdRwrUC7M5LxBuHd1WrT4dXCU0Hq6
	qiygJchUJlrQGmQW8UoW0V9UvZWN0TR9px2tnRWAWFQqXAtoap8BZOA1JLKW1g==
X-Gm-Gg: ASbGncusoL0fjXi+mqRCdFAU4qwxKsAlKCEg1VLuk4LQ6Qs7itOhvVehgeo1bIydvK+
	zBxEECPEjSRx7xqtZyv2/Db5OlDMIGDe4UAJD/gqCXv5z9GOZAj/1elYLqewQe9w8o4gHo2uqDt
	7C/0OvvleahUTpB002TPAfNvYuJJ4tasGNADg1nM6P68xAwx+bHhKUe63vp0fR3fz720Ts/ykTU
	qua2P9jKcWVrQz0IiZ+E82xEvaUZHNadxlX0pq9dGbwZ2MRH/QgNXJ52Q==
X-Google-Smtp-Source: AGHT+IE8qovXuuvi3CKjkFHljYmIvNkybJE3IrpSuCl/AVPhp93pJK7DzHsIz1p0ZQINBJZvJPkaNA==
X-Received: by 2002:a05:6214:449f:b0:6d8:a4fd:d253 with SMTP id 6a1803df08f44-6df9b22d70emr555753786d6.21.1737039990992;
        Thu, 16 Jan 2025 07:06:30 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::5bb3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afc117a2sm774686d6.40.2025.01.16.07.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 07:06:30 -0800 (PST)
Date: Thu, 16 Jan 2025 10:06:27 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
	mathias.nyman@intel.com, perex@perex.cz, tiwai@suse.com,
	sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com,
	ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v8 5/5] usb: host: enable USB offload during system sleep
Message-ID: <47efaf4a-8237-4030-8386-5e67a50c3030@rowland.harvard.edu>
References: <20250116135358.2335615-1-guanyulin@google.com>
 <20250116135358.2335615-6-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116135358.2335615-6-guanyulin@google.com>

On Thu, Jan 16, 2025 at 01:50:17PM +0000, Guan-Yu Lin wrote:
> Sharing a USB controller with another entity via xhci-sideband driver
> creates power management complexities. To prevent the USB controller
> from being inadvertently deactivated while in use by the other entity, a
> usage-count based mechanism is implemented. This allows the system to
> manage power effectively, ensuring the controller remains available
> whenever needed.
> In order to maintain full functionality of an offloaded USB devices,
> several changes are made within the suspend flow of such devices:
> - skip usb_suspend_device() so that the port/hub are still active for
>   USB transfers via offloaded path.
> - not suspending the endpoints which are used by USB interfaces marked
>   with needs_remote_wakeup. Namely, skip usb_suspend_interface() and
>   usb_hcd_flush_endpoint() on associated USB interfaces. This reserves a
>   pending interrupt urb during system suspend for handling the interrupt
>   transfer, which is necessary since remote wakeup doesn't apply in the
>   offloaded USB devices when controller is still active.
> - not flushing the endpoints of actively offloaded USB devices. Given
>   that the USB devices is used by another entity, unilaterally flush the
>   endpoint might lead to unexpected behavior on another entity.
> 
> Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
> ---

> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index 1bbf9592724f..6441742869ff 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -1413,19 +1413,31 @@ static int usb_resume_interface(struct usb_device *udev,
>   */
>  static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
>  {
> -	int			status = 0;
> -	int			i = 0, n = 0;
> -	struct usb_interface	*intf;
> +	int			 status = 0;
> +	int			 i = 0, n = 0;
> +	bool			 offload = false;
> +	struct usb_interface	 *intf;

Unnecessary whitespace change.  Please remove this from the patch.

Alan Stern

