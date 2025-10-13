Return-Path: <linux-usb+bounces-29216-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A51A1BD29D6
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 12:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 93B444EBC46
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 10:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C52303A28;
	Mon, 13 Oct 2025 10:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fEF8oKQV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2063019DA
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 10:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760352474; cv=none; b=I1zyC2KuVN2NiL4z8FDQEle56/VfJDkwz6wGC+vFK6UtTE9zRddwdpKtsyh/fL0qwHnziOWEw080t8/0V1RLj3lQSIvyBiNjjXyFGRbvepAX5IzJDOrSxvoE0+4msbUbceD7ux4ish3lC2VNb80jJ0uL/6SKj/lKcWRAvyuEtr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760352474; c=relaxed/simple;
	bh=iB1q2765rIGnKV1pyckvw0revez+8d+BzIPDH9vSEcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fszy3P5/aPxdntSzNehgUTcV0uY6KOrKT1dFIH6dyth3+6YUQNpVQVgtzMlonDGBIKHVt2BC7yY3GOdbqkhkn42bRBQfqG/0ppL5XP1GZ4jDg2Cq/HklnAD5XbqCb/hUe777gGP8QixfZaEocy9x4VT1PSF3m8pL5sYw5fS1Tc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fEF8oKQV; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e42fa08e4so35778415e9.3
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 03:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760352463; x=1760957263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yQncbKq9y2wDNxo+HJmCsZjQUXqSjFrpzVZTySLDT7U=;
        b=fEF8oKQVjRZ091BB3FOLXoVwHB2QmvGRg37gIcd3zqewPWSoJ6CGLBrEnht35G4gNi
         uq9ADQhHD8QYn7v0SZuBWsdtrWhDxNMEBGDS7Vk/0vEC7Yhl/IGY8bTr4V6g1y5v5TCZ
         +qnZrneIa5HPuGj03/862g5fgvlbFCn9jFhRoMI/5z4j4aVxOs6H8+Z2nJdHtPXAyHep
         Qm/x1RA7SHJqmEfOu6YOz6E3OX8MHYuqDHRlnluVXuRIDDZLVhjn/G1S1wXz1cpAm+9O
         lVY9a7JaILQjlVGSkq9RXyzv/Ty4EnqHWe5dhQf/lW0wnO/EJLakFM7VnExw8y8jZ8GO
         naUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760352463; x=1760957263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQncbKq9y2wDNxo+HJmCsZjQUXqSjFrpzVZTySLDT7U=;
        b=xB0HojFfhsM8Y7NpgRwFJhLB3v77xL9Jw3Av5G4L8oEc1D3xgMRPl1DrsmRGzpby2g
         sPZCXf8GD+0psZlfKklvPPcOuRI7h5BizdkFVZKbd6IbWdu99QXLelM5n0oXf3OuM+DH
         YFkRMx8xzH1nulN7UF/E33DYOKElMcwYY9WQzkH+XvVUI6SuAXcU7EJuEmHHndjUNIl4
         xyfTGReG8s+rUjeJH4qQ+GDpmMt04UKdqSGmOgXqaeCrpN76Xr6Vu9T+i8ZlT8fH/wrK
         jFxm16IfmGLVaXfPf5kN0nnfh8yAKcykDxjw5kMKLUDoAr1AKQ5BLxjkA/Hzl2mFCOlD
         5vzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/KCew1OA/cNIRDcIwrQPsCLcxbSeMRGMGmjUOf8wxRXCVEqgc71ulyzjU28gmpeRUC8RdiHS7E6A=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy2LxvC5Dl0kXZflaeicSbG9sfCVLv74Hc0pLRdnStLMOMGfly
	xkTpgJXWejvxKJURLImzHaLdi64gdptyXVUs3d/xqePpan1RPiJeyUCAsTkznBuWgR8=
X-Gm-Gg: ASbGnctckbFbQJhj/h0judZU0AruKvK5TarfX8wEi1+ttDesuCfJJPSGJxEczvq28vU
	P4ZbjTrN2mcGX67sBPO6CcVyeIUaHT7thmqLGEhw+YW/Trw1ckIDk3tVpncK1i6YgL8bH7438dC
	lBs9bVsduGGisbYE4bmr4IgXULC6e+y27FdR9wd9uNgDmcRT6gnd6Ht8OD2OUXzi0gBbUyxXiYy
	nhmppfrTZS5zGTZdV0loegzQyZz6NW/GRxKHKfvRFaD1+F+X/tIJOi9s8JYD9BEPKNCrROXSqaa
	gTxIQ1Lmjcm2T5te9p4xm8vLBX29YIdC9/rXFU4UA6ofAE6YTE8gO5PvnPA0jXO0pxm9zPSbPdg
	wVofsOMZTAJ7OsUTM8eK2tUmg/Y+kS22eM75/yOIVZSXrhO1oTziNPQNEla8=
X-Google-Smtp-Source: AGHT+IFg4eU1ujTs602xzuyfjmDMbU9Rs+B0qQF1RTLvVr0x++5S/VHkkosXuUaKpSpl3SReeW+r/Q==
X-Received: by 2002:a05:600c:46d1:b0:46e:4a30:2b0f with SMTP id 5b1f17b1804b1-46fa9b06d11mr139615025e9.29.1760352462625;
        Mon, 13 Oct 2025 03:47:42 -0700 (PDT)
Received: from suse.com (78-80-27-28.customers.tmcz.cz. [78.80.27.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb484c71csm185298065e9.8.2025.10.13.03.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:47:42 -0700 (PDT)
Date: Mon, 13 Oct 2025 12:47:40 +0200
From: Vojtech Pavlik <vojtech@suse.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: Alex Henrie <alexhenrie24@gmail.com>,
	Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: Re: ttyACM versus ttyUSB
Message-ID: <aOzYzH01b39gjIDP@suse.com>
References: <CAMMLpeRU72CMxHdF-rO9y1Nvzj9nPnuQTOZWcCrM4fOJ1byacw@mail.gmail.com>
 <2025101243-ongoing-truce-3aa5@gregkh>
 <CAMMLpeRrO_E3_c98OB9XvpiGNjhTetrw2ucFyaq5BByPWh58SA@mail.gmail.com>
 <2025101238-mastiff-decibel-4b4f@gregkh>
 <CAMMLpeQvb1SJ=_kC+N1pGHkh36yrORJq+Der7fDzPj_urzefow@mail.gmail.com>
 <194258bf-e78c-46b8-8229-3b019f2b8ab0@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <194258bf-e78c-46b8-8229-3b019f2b8ab0@suse.com>
X-Bounce-Cookie: It's a lemon tree, dear Watson!

On Mon, Oct 13, 2025 at 11:28:59AM +0200, Oliver Neukum wrote:
> On 12.10.25 21:01, Alex Henrie wrote:
> 
> > I did notice that the ACM protocol has no way to set the baud rate or
> > read the CTS line and I wondered if those limitations were the reason
> > for keeping its driver separate. Today there are ttyUSB drivers that
> > likewise have limitations on the baud rate and the flow control lines
> > (some are even based on ACM), but they weren't around in 1999, so I
> > can see how the difference in capabilities would have been another
> > motivation for the difference in naming conventions.
> 
> You could argue that ACM is intended to be a driver for a _modem_ ,
> not a serial line. In principle we are trying to propagate a layering
> violation that is so old that we no longer see it as a violation.

The ttyACM driver is also older than the ttyUSB driver.

And yes, indeed, USB CDC ACM was intended as a class for USB modems, not
for serial ports, so it doesn't directly support pin twiddling.

One would assume that baud rate setting would also be unnecessary in
this usecase, yet, surprisingly enough, many of the early USB modems
absolutely failed to work unless a baud rate was explicitly set.
(USB_CDC_REQ_SET_LINE_CODING)

Today, some USB-serial chips have the ACM protocol, so perhaps it would
make sense to merge the drivers, I certainly would not object.

-- 
Vojtech Pavlik

