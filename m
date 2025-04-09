Return-Path: <linux-usb+bounces-22807-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3882A82A1A
	for <lists+linux-usb@lfdr.de>; Wed,  9 Apr 2025 17:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B3FB188FA17
	for <lists+linux-usb@lfdr.de>; Wed,  9 Apr 2025 15:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711852676E3;
	Wed,  9 Apr 2025 15:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ttQN+AIr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1308F267392
	for <linux-usb@vger.kernel.org>; Wed,  9 Apr 2025 15:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744211881; cv=none; b=OA9YuSilk0HIt+oOV/D8ohGqu3/Nl/nfR4xfKSWqfrOIVirRvs3Sev39RA8gnCfAJKSM+eYyI0eL9m+yMb+zWbt/F5F/Hn3ftK6kFL5KDvG/boV3w7qE/wKAMs2837CWhC03vNFIFcCya48s7zPIZB07uL6wZhxbIeN2diBi7/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744211881; c=relaxed/simple;
	bh=L05GeTPpsVwGei1PRLQ+qItaPjTFR+kADeT9SbaA8AM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TIyzxyau9Pz8vUnpI/bRkwQawnCxy+WtlUk2bDUehTeN0/2PpPvxcy00d7HvRMXh9dW4gDbvrdA1KDlgGko7H++L22qIqz2+Qu+S74ifLOxquTmulhxg5c4YIjffqAhj1jRlPPt/Ab+IQp2pMI29OTNjkV6f9q+GXtJArIRO1Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ttQN+AIr; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e8fce04655so66071786d6.3
        for <linux-usb@vger.kernel.org>; Wed, 09 Apr 2025 08:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1744211877; x=1744816677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSz4oGBczB4s7QzN4sMG6IGoZmYK3gCdR0YSP1AReVY=;
        b=ttQN+AIrpWeQeVj+ZHxZxFOzdBrB/wi7yXNpTiqFNZ25ZDGiTwxFvDg026gSHMsDr9
         4p3xPVj6tcCWn9ySCpqZ80+xtIPphShVotBxsRZtunIqGmnZsoJjLaCGHAn/b7DT8Vpe
         AFd/UKhhRT9xHN87YU8OCL3x4JsHUhwR2QszgXy0GyOozLRRbqmydYYa1KINEqOjiSAD
         cidmjZ6BdlQHJCNgprjEDow/qXV/rU7uPf+CumBAgwoflykP7oMtq0bbe3GzaryqWC0i
         t1JwKzf9qhqxHBnwK770RhA8qq6UWYKEPpFWIVQY2ceTmhNzEgS51V2pZ7ul3abiabae
         0s0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744211877; x=1744816677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSz4oGBczB4s7QzN4sMG6IGoZmYK3gCdR0YSP1AReVY=;
        b=MLoC1epT699jsGkawX8cNiVcvWiG7E8C4uHLSusIQ5XTL3HCylSy7c/9raiCZT0XKg
         dYVGwp84dqI5u1yEnachNetXzoCmKOB2Uh4bKWHRXVT3FF2ZxASTgNzIX+u/hg7qJ/pl
         FQ6ekEL7cc/CBPiUBWPem7rpnT0gI2JMetJPWMxTdT0hBtJ09XzVkQtGKcRi8wDvPiSD
         nzBcgP7uO3bdG5VRfrOm3vdHlIwwW5PKfLsY3WctVbmtaL3YukNH+hDBYEKEmcs/Qk5x
         AOYrUnZ1pMNG3NTE6uvfBe1fVJQFSbZhkAYRrBvEvZ3TiMqUtk+huXTXApZEEabUjyyz
         k2qA==
X-Forwarded-Encrypted: i=1; AJvYcCVwXKjlJwnF8Rf6kKkCCdekJB/QZBf3gmOiGXmmvwh0f5BvwZbOQ6oEdKOkaH3FJBMgypKjOFBq6IA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVyosgzUwzlvc/1I58tBw2N0st8NXMAU0YevtpTu5H9cXd7AZr
	WtzB0WEf5bwh+mNfnwNcp9U36igIvNknL2RmpMLkyH9EFb0x2+Q6kprOl5IBSA==
X-Gm-Gg: ASbGncvNIa13E9SgS1POJzkDYUebRY6s0mI+iuiDf38njqyvOx74JUY09tAmXylLE5r
	kK5GDATdgK57olD2HK6NFpU88CVrSsVuWr1wbxJjo8ajYWzm7p7HWLdYl774ssQvVpLEvpISj87
	YFrHE9fgCo+XE6P8A8/F1PFkevvat/WbV8ZV7ouFEfszYXMbU28flSDWupdPEjHEFQYeLPJm+jh
	3qAJ5fkh5ETk7XpGKXfkDPqADeUOAu2+uMmhcLURXBBRzTeVvHKYJgSUcxJpSUh2qGFBAWbC9Y8
	Nf56CmYay1WjNQapajny2R24ZxMHwJsLzYfJ9BBcHaRuJ7ITP43FtgQXtfMCwSaRZJOfsw==
X-Google-Smtp-Source: AGHT+IHjwyEnZ98boe3bPSpo46Gy/YwX3wb//6rfyBN5Ja9ijCITZ3UxvTOSgqs8SVsosirRXDfodg==
X-Received: by 2002:a05:6214:409:b0:6e8:f464:c9a0 with SMTP id 6a1803df08f44-6f0dbbc0972mr55539716d6.13.1744211876980;
        Wed, 09 Apr 2025 08:17:56 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0de95fdfbsm8457386d6.1.2025.04.09.08.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:17:56 -0700 (PDT)
Date: Wed, 9 Apr 2025 11:17:53 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com,
	gargaditya08@live.com, kekrby@gmail.com,
	jeff.johnson@oss.qualcomm.com, elder@kernel.org,
	quic_zijuhu@quicinc.com, ben@decadent.org.uk,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 4/4] usb: host: enable USB offload during system sleep
Message-ID: <adc03a95-baa0-4a2a-9b00-39a644bab426@rowland.harvard.edu>
References: <20250408035833.844821-1-guanyulin@google.com>
 <20250408035833.844821-5-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408035833.844821-5-guanyulin@google.com>

On Tue, Apr 08, 2025 at 03:57:24AM +0000, Guan-Yu Lin wrote:
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
> - not suspending the xhci controller. This is done by skipping the
>   suspend/resume callbacks in the xhci platform driver.
> 
> Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
> ---
>  drivers/usb/core/driver.c    | 43 +++++++++++++++++++++++++++++++-----
>  drivers/usb/host/xhci-plat.c | 19 ++++++++++++++++
>  drivers/usb/host/xhci-plat.h |  1 +
>  include/linux/usb.h          |  2 ++
>  4 files changed, 59 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index 316526a05250..59b33e5e9a87 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -1420,11 +1420,25 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
>  			udev->state == USB_STATE_SUSPENDED)
>  		goto done;
>  
> +	if (msg.event == PM_EVENT_SUSPEND && usb_offload_check(udev)) {
> +		dev_dbg(&udev->dev, "device offload active, skip suspend.\n");
> +		udev->offload_at_suspend = 1;
> +	}
> +
>  	/* Suspend all the interfaces and then udev itself */
>  	if (udev->actconfig) {
>  		n = udev->actconfig->desc.bNumInterfaces;
>  		for (i = n - 1; i >= 0; --i) {
>  			intf = udev->actconfig->interface[i];
> +			/*
> +			 * Don't suspend interfaces with remote wakeup while the controller is
> +			 * active. This preserves pending interrupt urbs, allowing interrupt
> +			 * events to be handled during system suspend.
> +			 */

Here and below, please try to limit the line lengths to below 80 
columns, even in comments.

Alan Stern

