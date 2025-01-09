Return-Path: <linux-usb+bounces-19174-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67422A080A4
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 20:39:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98F6E3A8F11
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 19:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33AA41AF0B6;
	Thu,  9 Jan 2025 19:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="KxR2Gq4x"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054A719C546
	for <linux-usb@vger.kernel.org>; Thu,  9 Jan 2025 19:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736451543; cv=none; b=J5s4wjQdM+EbGAGQWjeL8pIVirEFyJRdb10eHeDKOARt0C8u556dvckiPwQXLeW4QM7RyJtjS4QH8ruEZQi5BQxhKFL/xko2Zjf1pf/ekpH3Rm1yEUwu3KocrmQ+bYOm/EcRsO8BQ+zkhQTp+zwUb8ZtduQJtQh/O7BCbXDWg94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736451543; c=relaxed/simple;
	bh=3lGVSdSHNekne6jmUmGx+iDSFM463vRTjm27riMmfbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8PGR67Thz4jXKpVAJGFYrtxEyhrFY6ykOwjq3zY7FVFQN+4YO+n9NELgFAwrxpRiIt5xL0MGmEyUemkdEOmBBjosDdCFFCIy2zeu0pD9XVb1gyrTiCVkYSkIU7IausMJ9lCpMnj2NyWoWlQ8MDfm9bBrI2Zbp0hg0IfJFqOYNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=KxR2Gq4x; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-467838e75ffso14295011cf.3
        for <linux-usb@vger.kernel.org>; Thu, 09 Jan 2025 11:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1736451541; x=1737056341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EbACJFUzOcM9PoCMAPfVyAdP4O362Dsxc0t3YD8lMmI=;
        b=KxR2Gq4xKeABfaoBmcHZn5dN+1nMbpGTSgMJEn3geu5lXyaO1x1wLy811QFtWpqMKc
         3FKUa9VXIdfyCLchmPVvO5ZSOJbHSMqHGAnmCc7f98lcioRgObVNt+3gOf9FmFfTsc9g
         Z7USggoYT6t0LWipQsAR/8/Qr1uM1y2dSMZdaOwG7jsnVtU+Ms96zMyH4UXerIYsfykL
         gStqRWQKL/ePBDs1nHdfhVA+pvzUvPIB5cdaIcOZ4m4ThmvePRFleFvgkvbKdz57B5ze
         q/ErjppcDiN6nJni28zLCNSxgoIu3AT9SYXVQLpgRLY/C3kiosOehBd3vwcoqLbV/PbA
         hVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736451541; x=1737056341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbACJFUzOcM9PoCMAPfVyAdP4O362Dsxc0t3YD8lMmI=;
        b=d4yD8iBDGUQhfNO/aWpdT9eun2nnqtMJvk44WfCqpi3maUZDo+Opn58vMJGgHH75sm
         XpEgwXHoydepuRzIwx41Aiv2OOy593lmIbuj26GWZRUsZ282Y2tDp3HUZVOGDUvwdKpC
         CFc5FxGHKXn2NSKKN3c4tkEYam5Q+llY6CVgqedXIMNkvdsSXnw2fv/D+QpM2SxUHXNl
         1eCTr2q32bILzQf3IaZXd3+vRToHgqjZRLL5LcYq6pm0bb0LMcOi0/NCqRjWFnrU0ZaN
         xFta4+G31EsgArzUp62V3mXlzJLkOsbWp4Hunwgj+CV+ZmjaBOpxrWXsD+PKkfe7iGW+
         FcvA==
X-Gm-Message-State: AOJu0YynTq6vlVmZLCVvgj75p4DAB41Bfe+y7ig740jm67kDTskM2lXD
	lb1ni1k5ieQtBaNSQqj/j925bnVeIa3paD0YQN1AG5g3jOKne8x2Tod3/RfMh765c+6xFM8XSOE
	=
X-Gm-Gg: ASbGnctnEnbTs7jxjpVSSwwDM2/4ywedFw22rZSoGQUMoH2Xp4BGI61NrnTt+AY+TBh
	yudqbPakm3IZTgpO9duMou+J40jzunC/kMF221KhlkWwgZkZxrg22X36qbAoKN1h3+sd6Yplv6/
	TOXYMsAcpFwmO0cZvLVaN0nGQz1YQMNo6GN8VtUEFjHGs21KF2OeLO4eVZP9rTW0hl/D+6btsZk
	N6xvcIYQJBDzLIFIYRciSWKMvfSE0Am5DL5Ehg/rMhD/RvI8rywE3NCZ5JhqDf5ua7BjCVQkosI
	xN7L1yCj+l1veXVRhBERftjBRs4Fy6HKPR71RDWpfobLZMArgQ==
X-Google-Smtp-Source: AGHT+IHN8a1/KehvNJpUTrWc5/8ilDZWVaT/r/e2/NpSW3qkJ7oyYLcqpx9krlSZJH/7B6GByOLhYA==
X-Received: by 2002:a05:622a:20d:b0:467:8630:584f with SMTP id d75a77b69052e-46c71081952mr107167691cf.36.1736451540871;
        Thu, 09 Jan 2025 11:39:00 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-51.harvard-secure.wrls.harvard.edu. [65.112.8.51])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46c873de443sm1506251cf.70.2025.01.09.11.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 11:39:00 -0800 (PST)
Date: Thu, 9 Jan 2025 14:38:57 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: MT7601U with on-board storage reports incorrect capacity
Message-ID: <c0194169-0406-4450-908f-8537c464d122@rowland.harvard.edu>
References: <060301fe-17e2-4061-bb01-f5660b5d10a3@gmail.com>
 <2be45061-034f-4cbb-8ed1-f028bbb35936@rowland.harvard.edu>
 <c1a60120-ed18-4793-a7ba-a119e048ab2b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1a60120-ed18-4793-a7ba-a119e048ab2b@gmail.com>

On Thu, Jan 09, 2025 at 08:57:29PM +0200, Bitterblue Smith wrote:
> On 09/01/2025 17:34, Alan Stern wrote:
> > On Thu, Jan 09, 2025 at 04:02:58PM +0200, Bitterblue Smith wrote:
> >> Hi,
> >>
> >> I have this wifi device with on-board storage for the Windows driver:
> >>
> >> New USB device found, idVendor=148f, idProduct=2878, bcdDevice= 0.01
> >>
> >> After switching to wifi mode, we can see it's a MT7601U:
> >>
> >> New USB device found, idVendor=148f, idProduct=7601, bcdDevice= 0.00
> >>
> >> The problem with this one is that it can't be mounted, nothing happens
> >> for a long time. I'm testing with kernel 6.12.8-arch1-1 but it's been
> >> like this for at least two years. 
> >>
> >> The problem seems to be that reading from the "end" of the device
> >> takes 17 seconds. I assume the reason for that is the fake capacity:

> >> How can this be fixed?

> > Probably your best approach is to tell usb-storage to ignore the device 
> > completely.  You can do this with a suitable module parameter for the 
> > usb-storage driver.  For example, add:
> > 
> > 	usb-storage.quirks=148f:7601:i
> > 
> > on the kernel's boot command line (or put a similar entry in an 
> > /etc/modprobe.d/*.conf file if usb-storage is a loadable kernel module 
> > on your system).  Of course, then you wouldn't be able to mount the 
> > device or access the Windows driver files on it, but I imagine you don't 
> > care about them very much while you're running Linux.

> Haha, so it's hopeless. Thank you for the detailed explanation.

Not hopeless at	all.  The module parameter approach really should work,	
at least to the	extent of getting rid of those annoying	17-second-long 
waits.

Alan Stern

