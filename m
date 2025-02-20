Return-Path: <linux-usb+bounces-20890-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCF1A3E511
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 20:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DBB5421EBA
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 19:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDDF12638BC;
	Thu, 20 Feb 2025 19:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IaHRufLS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35B41DDC3F
	for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 19:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740079896; cv=none; b=WvtP6PaF/dTjrslASUnrEOk/7OgGO7MNgvob8aD/Den6pv74cV+zAonEW6f5P8rW3DK8wDfu/o6mB4wBFs69TiJlPGWVcr1xlGn+FqL9OwocsE2w4iHBNifya1/G/EvSMeiBlwzfV8sq92XuFcp+9e4qH3/fij61VtPt4WePJ2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740079896; c=relaxed/simple;
	bh=MVq0rSd2W/rQ4EG/nAQY+fo+iAlMg/MrYiWZeK0fCbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rFhkz1wqn0/NZOw+Lko0Bdv5O/nPxZc/fTBqAeBa8LLWWYs5M8NKfYrQNAc46sTm5OWtJR6hYVF7hDpQyh+z+mbrVJvpBM8oQ3Ljt+diMfpc/PxflF/8Sc2PzyE1woj1I6B/mTDtepcc7/yNz5qiDlOErEVfFDhPFlgsnZsUJYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IaHRufLS; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-220e83d65e5so26169255ad.1
        for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 11:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740079894; x=1740684694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oNqMwP45iYYk0uj0DcAs+5VuYjHL2HKpybnKvS9Q0Q8=;
        b=IaHRufLSvQZngqQVwGbV25xIjHyZZLiFvtUFLBLJadlw9vGU6dZydzT+myueiN4GJt
         8woU0VnpwUs2vAQOM8QUB5XTC6Nahh1rbiWia12oKzDVG3jzeJ4N80pAL7kOgR4CA1dl
         +3fJNxWtmpkPG/cMcguZCKfwATQNiqCJ9KueVF45xt9WyzTqeSxOBAz0ulKDAsl2tuKq
         pfCW3N6X8B9lgWss4+buWuOT61r7j4I0XIwKPANQ5ylyJRq7iZtX50+5jfYUGj8LxkGI
         HDV1e7ZPt8n1hEVXNiBJuQsXqs1uTbUQk+vryHy3zk5R6J2iAk1GSPbUYetNL7O5dfXy
         boag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740079894; x=1740684694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNqMwP45iYYk0uj0DcAs+5VuYjHL2HKpybnKvS9Q0Q8=;
        b=mYkHqmD9j3sG7rLTN0f+ljMm18CEnrBdL/otxbBIPcdZthukdzVKDFlI1UrBUuKadT
         Uojn6drZcGk3/FmRvHYsL7bvzZSo4e/1PXQEpsZnAeE91wh46uYoG17br3gLc/5EUTDB
         60aDFqSGiDYWO/Pnv3ilENU92fFB6ogtQa/e8MrwuEhaTU39CanmEAf2PTc8YbmsprHp
         UISdIACxl3v87XUeBVpTLghbJUXeM3/l/W5VeOyn5CNz0lsO+agsX2eVuDj1NCBDMDyo
         0Z1HTCKL5TM/yfqmlyWsYJ0HS6XndcNmdtPGyj+S4ZXcvIcar0kgaQ7Ee/9bEK2/3lcH
         2XqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4/VMgPWQOeipS7d/536VJoWB/c1BCvDmlgYYVINRdhDpS8VfS9zW30Bld3x7QnCS1Q8hHIIYTP4I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2o+1dBIQF4YBkl5RJibrf0LAvNkKJl0y/irMLpjPyvSHUaTtz
	RB2E2qCs+B58tIFU+EQBGD2ZnODxHpAqdnMAQ0kzZSTkk4+JxkgNdJqnETykPA==
X-Gm-Gg: ASbGncu6FykFqNPyscnvX93XknHhS6A3QV5KSagQYlzwZz2S4+C9Bt/4pgjMHT67hJ0
	sua7tqTM06Rt3TdmT+YCymPYnM5/tqj8cqTiZiku7oaX/znN/NwEHsuNPMvBI5sU+oAkMUCj0yK
	Pu9x/2UyqfhUBnCdbOBOIxlTwezfYmUeIamqhS43HRbpxJNRnJjPbGiuzRWp++iA2bSYWQWgrLG
	CeO3UjAEedC5s9tFVy8WQ3lkPFm/Q4pbchI94JQjxP9Qxq0bab8xdDbABvzwV8fIK5AeCsWm0aW
	uqQCEOUwb0+LPQVCGbMf+f/jwkkgfxUHibknBID98IZdmGNVhnbohtxN
X-Google-Smtp-Source: AGHT+IGm0mMkDx5+higAvQTvJgGM6Q5QWoVBcT94T2De4H3OUSImBFKF4r5go8AQeAfrxEm5a+S3bw==
X-Received: by 2002:a17:903:230f:b0:216:4883:fb43 with SMTP id d9443c01a7336-2219ffd2718mr6024575ad.32.1740079892529;
        Thu, 20 Feb 2025 11:31:32 -0800 (PST)
Received: from google.com (139.11.82.34.bc.googleusercontent.com. [34.82.11.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fc13ba5f27sm14323197a91.43.2025.02.20.11.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 11:31:31 -0800 (PST)
Date: Thu, 20 Feb 2025 11:31:27 -0800
From: William McVicker <willmcvicker@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Prashanth K <prashanth.k@oss.qualcomm.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Peter Korsgaard <peter@korsgaard.com>,
	Sabyrzhan Tasbolatov <snovitoll@gmail.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, andre.draszik@linaro.org,
	kernel-team@android.com
Subject: Re: [PATCH v2] usb: gadget: Set self-powered based on MaxPower and
 bmAttributes
Message-ID: <Z7eDD1PsBYVIYWMY@google.com>
References: <20250217120328.2446639-1-prashanth.k@oss.qualcomm.com>
 <Z7dv4rEILkC9yRwX@google.com>
 <2025022032-cruelness-framing-2a10@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025022032-cruelness-framing-2a10@gregkh>

On 02/20/2025, Greg Kroah-Hartman wrote:
> On Thu, Feb 20, 2025 at 10:09:38AM -0800, William McVicker wrote:
> > Hi Prashanth,
> > 
> > On 02/17/2025, Prashanth K wrote:
> > > Currently the USB gadget will be set as bus-powered based solely
> > > on whether its bMaxPower is greater than 100mA, but this may miss
> > > devices that may legitimately draw less than 100mA but still want
> > > to report as bus-powered. Similarly during suspend & resume, USB
> > > gadget is incorrectly marked as bus/self powered without checking
> > > the bmAttributes field. Fix these by configuring the USB gadget
> > > as self or bus powered based on bmAttributes, and explicitly set
> > > it as bus-powered if it draws more than 100mA.
> > > 
> > > Cc: stable@vger.kernel.org
> > > Fixes: 5e5caf4fa8d3 ("usb: gadget: composite: Inform controller driver of self-powered")
> > > Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
> > > ---
> > > Changes in v2:
> > > - Didn't change anything from RFC.
> > > - Link to RFC: https://lore.kernel.org/all/20250204105908.2255686-1-prashanth.k@oss.qualcomm.com/
> > > 
> > >  drivers/usb/gadget/composite.c | 16 +++++++++++-----
> > >  1 file changed, 11 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
> > > index bdda8c74602d..1fb28bbf6c45 100644
> > > --- a/drivers/usb/gadget/composite.c
> > > +++ b/drivers/usb/gadget/composite.c
> > > @@ -1050,10 +1050,11 @@ static int set_config(struct usb_composite_dev *cdev,
> > >  	else
> > >  		usb_gadget_set_remote_wakeup(gadget, 0);
> > >  done:
> > > -	if (power <= USB_SELF_POWER_VBUS_MAX_DRAW)
> > > -		usb_gadget_set_selfpowered(gadget);
> > > -	else
> > > +	if (power > USB_SELF_POWER_VBUS_MAX_DRAW ||
> > > +	    !(c->bmAttributes & USB_CONFIG_ATT_SELFPOWER))
> > >  		usb_gadget_clear_selfpowered(gadget);
> > > +	else
> > > +		usb_gadget_set_selfpowered(gadget);
> > >  
> > >  	usb_gadget_vbus_draw(gadget, power);
> > >  	if (result >= 0 && cdev->delayed_status)
> > > @@ -2615,7 +2616,9 @@ void composite_suspend(struct usb_gadget *gadget)
> > >  
> > >  	cdev->suspended = 1;
> > >  
> > > -	usb_gadget_set_selfpowered(gadget);
> > > +	if (cdev->config->bmAttributes & USB_CONFIG_ATT_SELFPOWER)
> > > +		usb_gadget_set_selfpowered(gadget);
> > 
> > I'm hitting a null pointer derefence here on my Pixel 6 device on suspend.  I
> > haven't dug deep into it how we get here, but in my case `cdev->config` is
> > NULL. This happens immediate after booting my device. I verified that just
> > adding a NULL check fixes the issue and dwc3 gadget can successfully suspend.
> 
> This was just fixed in my tree today with this commit:
> 	https://lore.kernel.org/r/20250220120314.3614330-1-m.szyprowski@samsung.com
> 
> Hope this helps,
> 
> greg k-h

Yup, works for me. Thanks!

--Will

