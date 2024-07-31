Return-Path: <linux-usb+bounces-12745-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 189D0943588
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 20:20:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 724F8B22A74
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 18:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC293FB9F;
	Wed, 31 Jul 2024 18:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="K5z60veX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914481E86F
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 18:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722450000; cv=none; b=O3ml4sMrUnnqKLm7oDbLXS5UGG+zdUcxXYrzQPoYyXFTcIO2Ww5zoDViplRhP9tkuJZsUa8ncSsVTmjInw5hTdg0fEUBxokdT2LiXnvBPZPkOKWm+c4uQRJCH+tQTbCDTDCFZ3lU4yIVQ3e5ji5QBpQ89iHDIk0N4N/VnbAQXfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722450000; c=relaxed/simple;
	bh=zzeXu0V2XrTOH9QXqXrrAt5OkQnJlMRSRL+oX4kdGts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmygOGTZN+UdX6hrLSo663yUElfsFReIBRutnk88vi+z33C3X8jUHZ5RpgiN8jJPKzECg7iISEnlCB/wlOh+QiS9kJz5bMjZ7A9m+Wv1CUJLXY71+O0gSgOH9CA+IMAKoAcDei6yX/C9USXfbnoX6sv18T2SUokICuBSZksnIyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=K5z60veX; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-44fe58fcf2bso35390161cf.2
        for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 11:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1722449997; x=1723054797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SnOSTDz5p85GiwsKhk/eE53XisA23eDTKA9fiAEKZb4=;
        b=K5z60veX6K3Q0PGLy3ZzjAxNK7PHwtQEVpavO8292AxUmH6sx8T4a6xYGJd9lhcotu
         DRGiDJNy0n39hif5PgMpUwSjVGT+zPSYId0oF8H+d+8YBeD0+K0aycFM76yENbD1XA3s
         GgP1f4/wMfbzHpI/tb6Z3k7GnbcIqlojcfKoi25e3wmC0SJNO+IB/CJYWfYXayIamC0M
         ic8LGGNECL76QY12WTUOPkcnNOzzyf8hUGe+pBHG+wbfditi276tXaWn9QbaVAZmAGIN
         YciH8q7bhqs+L1DqWexfS9HC6QE5wNYJY9mEtqTFsVRrURYkJf8qAjZILrqfEdhEVmuH
         XtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722449997; x=1723054797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnOSTDz5p85GiwsKhk/eE53XisA23eDTKA9fiAEKZb4=;
        b=pDqFFFrArwt6pYvzqqacgwe+8/B+eum84KJ+kZPxh/OcIvBHkp+nF62rxVkWi2ieQB
         I4uaboX7aFL2Qu94VXFiilLnetg4GtJ8m1cFLf4/7lpdco0s4CacMpMenNz8kfhgXw0C
         oyYzxAcYQkZFcshNJeL3S/4341DHdqXcVhCXh0e6wsHVv2Qpiq0JRk8cWL2f5s02PMog
         kTWT/VIWsFB9BDgrk3xsgvlEBAFMuLVyAEr9g0Qw4FoHzBDUYu7j2MUPMLUAChc3W5lw
         +w9IuQReGgxAhMgDa5aiZJQ5jN1hO78GS8tE74sGYdjSCRv5HH7ACglPN/K9zp7SXSb0
         hOeA==
X-Forwarded-Encrypted: i=1; AJvYcCVkBfOWa0vj3UYe8a1nc2i/huYYxOQ16Xj5EqSwFqgnUPFYGMDNfi0vDEbbO5SMAgmp5ikbOQPcxbCjJYCKzfle8jP5rWa9YhY4
X-Gm-Message-State: AOJu0YygeWcZ72Rg/f5Qwhx6YpxcRoBFeKNYZyRSxz3YuMsxMyLVvY89
	gUfA64Q2y2sKKNEf1z5+IQHdHXeu4r8yHb7xDPtwC8vkXTRD5y/YNS9D602M6w==
X-Google-Smtp-Source: AGHT+IGHq1pCN5+SZ6wLoOrS7zzkUEg0Kf/ITIW2bSTAZXtWNPHjw1SfGm/eJfr5OIMu6iKyU2I3PQ==
X-Received: by 2002:a05:622a:249:b0:446:60ba:610a with SMTP id d75a77b69052e-4514f965be1mr1668221cf.9.1722449997405;
        Wed, 31 Jul 2024 11:19:57 -0700 (PDT)
Received: from rowland.harvard.edu (iolanthe.rowland.org. [192.131.102.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44fe82012bcsm62119401cf.66.2024.07.31.11.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 11:19:56 -0700 (PDT)
Date: Wed, 31 Jul 2024 14:19:54 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: gregkh@linuxfoundation.org, oneukum@suse.com,
	usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
	skhan@linuxfoundation.org, dan.carpenter@linaro.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: storage: ene_ub6250: Fix right shift warnings
Message-ID: <b35a344a-018b-44ae-975a-7767a3d5b6ec@rowland.harvard.edu>
References: <20240729182348.451436-1-abhishektamboli9@gmail.com>
 <e72cc56a-3066-4cb8-848d-bfe27a48c095@suse.com>
 <ZqkpOQIjcBSAg8rC@embed-PC.myguest.virtualbox.org>
 <5d7870b0-6b63-430b-8885-2509b33dc78a@suse.com>
 <804a6d40-73a4-4af6-944b-95e9324d7429@rowland.harvard.edu>
 <Zqp8vbbIC8E/XrQY@embed-PC.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zqp8vbbIC8E/XrQY@embed-PC.myguest.virtualbox.org>

On Wed, Jul 31, 2024 at 11:34:45PM +0530, Abhishek Tamboli wrote:
> On Wed, Jul 31, 2024 at 10:04:33AM -0400, Alan Stern wrote:
> > On Wed, Jul 31, 2024 at 11:15:28AM +0200, 'Oliver Neukum' via USB Mass Storage on Linux wrote:
> > > Hi,
> > > 
> > > On 30.07.24 19:56, Abhishek Tamboli wrote:
> > > > On Tue, Jul 30, 2024 at 09:09:05AM +0200, Oliver Neukum wrote:
> > > 
> > > > > 1. use a constant, where a constant is used
> > > > I think you are suggesting that I should replace hard-coded values like the
> > > > buffer size with named constants. For example:
> > > > 
> > > > #define BUF_SIZE 8
> > > > unsigned char buf[BUF_SIZE];
> > > 
> > > Yes, but the constant we need to look at here is bl_len.
> > > This is a variable needlessly.
> > 
> > The code in ms_scsi_read_capacity() is written that way to be consistent 
> > with the sd_scsi_read_capacity() routine.  Or maybe it was just 
> > copied-and-pasted, and then the variable's type was changed for no good 
> > reason.
> > 
> > Replacing the variable with a constant won't make much difference.  The 
> > compiler will realize that bl_len has a constant value and will generate 
> > appropriate code anyway.  I think just changing the type is a fine fix.
> > 
> > > > > 2. use the macros for converting endianness
> > > > Can I use macros like cpu_to_le32 for converting the bl_num and bl_len values.
> > > > Should I replace all instances of manual bitwise shifts with these macros?
> > > 
> > > Yes.
> > > 
> > > > For example:
> > > > 
> > > >      u32 bl_len = 0x200;
> > > >      buf[0] = cpu_to_le32(bl_num) >> 24;
> > > >      buf[4] = cpu_to_le32(bl_len) >> 24;
> > > > 
> > > > Is using cpu_to_le32 appropriate for the data format required by this
> > > > device?
> > > 
> > > Well, the format is big endian. So, cpu_to_be32() will be required.
> > 
> > Better yet, use put_unaligned_be32().
> Would you recommend submitting a follow-up patch to incorporate this change, or should I leave it as is for now.

You can submit another patch as a clean-up, if you want.  But as I said, 
it isn't needed.

> >However, there's nothing really 
> >wrong with the code as it stands. It doesn't need to be changed now.
> As you mentioned there's no need to change the code, So my initial patch is okay as is?

It is as far as I'm concerned.  Obviously Oliver has a different 
opinion.  But I'm the Maintainer of the usb-storage driver, so my 
opinion counts for more than his does, in this case.  :-)

Alan Stern

