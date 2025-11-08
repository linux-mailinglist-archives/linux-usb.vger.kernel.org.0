Return-Path: <linux-usb+bounces-30225-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93866C434AB
	for <lists+linux-usb@lfdr.de>; Sat, 08 Nov 2025 21:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DB2334E2BA1
	for <lists+linux-usb@lfdr.de>; Sat,  8 Nov 2025 20:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78BB1EFF8D;
	Sat,  8 Nov 2025 20:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Q1Kpnx4V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86B216132F
	for <linux-usb@vger.kernel.org>; Sat,  8 Nov 2025 20:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762634888; cv=none; b=BctRhEHxvKJQciuj3kwsWMrdDuas8Egw1nHWPQeAUQnlKMZk6W8zz+CpDWIZ2lbcZDB2QXz1lMsfBmtqRVIYsObquoZga/na720FUK55nxJ8b1KuyyQau9bAAiJXnvihPHjEniWatxsmEWeKvE0ffqP+UWz6y4yVG2MEghcQoeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762634888; c=relaxed/simple;
	bh=QlR0B6N9BjTErbq8JWiIdrooqruUIOIdvGtkH+2nQNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQJiSPfpXh7c2YWiJnJSHzsc3YYdMEw74rnYoAC2EF5Pc7JyppMNgFyVZjBRfrTp3uzRDX8HCfZQaUmUQr2ASAeiZKkZsl5t9JTC7kHvNK4hY912br0M04eMNOYf82zH3uh+ltSEkh6txFID2UlrKthDAXXmQvowYODzHSRH5Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Q1Kpnx4V; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-88044caaa3eso19854066d6.3
        for <linux-usb@vger.kernel.org>; Sat, 08 Nov 2025 12:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762634886; x=1763239686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qCYrdx1jDzo1jgoNSrvx+iisAmac061wFNMLeHZf7TI=;
        b=Q1Kpnx4VGdjK9/YN5UfIjNFboQYMCdgOLeXkwOz96HcKt7SqUMgvNrcQ8HvHdxDZqE
         rOSFPNI31h9BkiJDf7VRHTfK1fUJ5DLXDXU+X3fTgfUG9xYqc74tiY9/zEhR63OFDfaA
         lq97RYl/OK+PFWomTA87VE6jqLRw6F7W4KqQuKtaCBLDg+xFLDUO7wtNeBAHf1T78lnL
         dl0UFCxV3/764OJJFBocmEvYoXznFaaePpTixwST9CuODsnCXwUjL+UKnsHxp8GccBx/
         WuTWu4j5Vla+PsPKK7asvwgRzTgQaHj3mQCiL2k+5129ZypRC6YEfdVEgTraqyJEGVuO
         xdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762634886; x=1763239686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCYrdx1jDzo1jgoNSrvx+iisAmac061wFNMLeHZf7TI=;
        b=Liw5cKM/CqwXWneIF5tOtSlS5MVUljbsZGJUmKN1KfAqe5UeugoKB2SdcsAeVbsB/s
         FB/w6DFJMvUcsljezlHrWF4oF+B9n/J2WaGFRa6nH20k9VkugtagWsopIBfHxXSgsPzk
         nnUSx6Vvg6DfMOCFzNJzK9r+jnxagjcu4oQfsL/AtCCqTkAvUVnjpAt422BeA5QcNy9N
         B7mkzlMPn/x3cl9pn+ROpW/k2T/lt9ruN3qdjvdXd5nE8w0eTBFBL7aYSCsi4qmLCEzL
         NzafyFs7vxcQpnIc5M0+BVdsnDbfulB0kyaWrKuqwHTB7YVzku3lCpRFm4sBcQCOuULy
         rY8w==
X-Forwarded-Encrypted: i=1; AJvYcCUbOtBhJq1P6TqUUPXyoNFoNgDm/Kat63gIQJQfBjCl56rFjz/f3mCS/aRoMEjCPdwQsIWdDQY4W3s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMB3K/YvzhLfzO9+ASpuqBcJxZdXJO6ji2f2sHWWTX6cFnD/ZM
	GTQZKAVrAWuzehWGnpnYeqKRXRJas6vkPpne+BZIQM9o9epEIai/6BGr2RpCa+luYg==
X-Gm-Gg: ASbGncsh0cPReGKfwWln2JJDp+yVSgDdTMLPakYjmXqL8m2pP232piQmwfvzfSo//Un
	EHeuTJEKrOdCm+/xSML7GxzqvmIgxO3b/t6qfNM4cS9sSnqPDBKu/qv5jT4DrFIZpz/SMlGAxia
	GS+TLzpLwWxlPTPjpFp660UU8q3WMZAdfSl3EGCGTRtV7Nlv6OTXPB33LZVuZp9czgCnkMoM4ad
	FX8EDX29Zs1uNxOVv3RQuj+ayicrM8mN4gMIa5jc5jmu7xuwt6sALfZ7I+NMCAMUze2p5LrLNbc
	TQBn9VQkor3i0vHJ+n0UkhmWyv/q7VUjA0koCf2gHx8RkmohcSo0MoD/fUQoPkNTCkBIVzEYnUO
	pHPSBgXDbMa0NbjDNijnXmXvALgrv0zHmK22fcaY8x6FYMdDx61QMvULd0z0gSF2/2zkoA6Km3l
	KIBQ==
X-Google-Smtp-Source: AGHT+IGVJnBaKHGM31qZ2OMIKVy7/r7gI8SWt96oc87GL1Lm6WBvCGhhnKi5OFoKYu+BZ/8J0Pu/vw==
X-Received: by 2002:ad4:5ded:0:b0:880:4ec0:417f with SMTP id 6a1803df08f44-882386120e3mr46827916d6.24.1762634885616;
        Sat, 08 Nov 2025 12:48:05 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::db9a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eda563fbfcsm17586141cf.10.2025.11.08.12.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 12:48:04 -0800 (PST)
Date: Sat, 8 Nov 2025 15:48:00 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: The-Luga <lugathe2@gmail.com>
Cc: Terry Junge <linuxsound@cosmicgizmosystems.com>,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
Message-ID: <d7e888a6-6a65-40c1-84af-058b97ca0178@rowland.harvard.edu>
References: <CALvgqEAq8ZWgG4Dyg_oL7_+nUDy+LUoTXi+-6aceO-AKtBS3Mg@mail.gmail.com>
 <3eb2564d-5008-434e-9698-99b0cbe4d1cc@cosmicgizmosystems.com>
 <CALvgqECkMdntW2He8C7EcvOtCL-PpiXM9xNXWHzGtgimDxezHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALvgqECkMdntW2He8C7EcvOtCL-PpiXM9xNXWHzGtgimDxezHA@mail.gmail.com>

On Sat, Nov 08, 2025 at 03:18:03PM -0300, The-Luga wrote:
> What I am doing in order:
> 
> 1. The speaker is physically disconnected.
> 2. I connect it to the USB port.
> 3. I will use the knob to change the brightness.
> 4. The speaker reboots.
> 5. I will change the knob again.
> 6. Wait for the system to come back after reboot.
> 7. Stop logging.
> 
> ```
> > sudo modprobe usbmon
> > sudo cat /sys/kernel/debug/usb/usbmon/3u > qr30.log
> ```
> 
> 
> A little off-topic but... Even though it's safe, the cable used to
> connect to it is USB-A to USB-A. Every time I look at it, I'm
> horrified. However, they also work with a USB-A to USB-C cable (where
> A is for the device and C is for my computer). They have a program to
> adjust the RGB Light, Equalizer and Volume not using the standard but
> something they invented (No hardware volume, then). It works with a
> pass-through to windows VM (reset does not happen on pass-through).

Have you collected a usbmon trace showing what the pass-through does
when you adjust the settings?  The differences between that and the
usbmon trace you collected before should be illuminating.

Alan Stern

