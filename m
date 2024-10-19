Return-Path: <linux-usb+bounces-16439-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACE79A4EB3
	for <lists+linux-usb@lfdr.de>; Sat, 19 Oct 2024 16:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CB59287D8D
	for <lists+linux-usb@lfdr.de>; Sat, 19 Oct 2024 14:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F47C7DA68;
	Sat, 19 Oct 2024 14:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="N05SGE2f"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414C539FD0
	for <linux-usb@vger.kernel.org>; Sat, 19 Oct 2024 14:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729348704; cv=none; b=p42yd0/GzsdC4O9KgjRMBbxqy2w99wWRoP/Ju9EWAEb03kC6U5j/amNwrIUGG75pqptblJlTM+Dd6UGXULxZ9HgoEIiWplYe/FEaU7XKLYEISdIcYUGUt2Uko9RUIJeMcMZpmvPBaAtSkLHqNgNcG9SDn5MOCW/9SXpratA1xOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729348704; c=relaxed/simple;
	bh=VIE641AVYoKwNzNUkgcOpPm89muFyXaWF6sFCDWnRLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B5VGsvhHoeRe8RjIqPkkK5ozU8jXBUG8oN3b6Q+HlhwkQhTYHZngYdrC4R8ZswJVDlf+9ni7m/KdrvkEE7BfT1x22Of9TvIwfwh8Q6XXpfMcxH0xnedaFU9aiH73Q/THsH0iRO76hI0oDJdsRdYYMpBLVRgoZH50YBzUNhkKdx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=N05SGE2f; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4608da1bea5so21089121cf.1
        for <linux-usb@vger.kernel.org>; Sat, 19 Oct 2024 07:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1729348701; x=1729953501; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IGA6q3qImZA/r3V1nLiHsfZKOfoZrNahU0Nw/MJ8a9k=;
        b=N05SGE2fqMWnE7Db4u1Z7GbXw6CLkPbWhJsJCW3j2Oh5oTjJMcX9Hp/I85WQEAYU/4
         JsW2jHIhPiJanIe9lUMdGpkX+feedgfnRuToJGK1MOVxGVUMUMWuPsP3SLiTNCZBB6ne
         Gj1m55ZJDvQYus8oi2U5zlT0FAEOYFtV2D5ND5CZYrTrMPZKwOzTIQjDoMIrC1MY3AWj
         2attwL8OrzeTEkxgwM4AxHnWnIMUv1WUb10mqXg6AW5IjAxseMremnhSmF7bihEUWLB/
         zga/HuWL0K8dDIeXuwf+6Rm9kVbRQvIx+uSB5O16XPeSaQMlO/3PsONoSrBFmX+3L5kT
         6u2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729348701; x=1729953501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGA6q3qImZA/r3V1nLiHsfZKOfoZrNahU0Nw/MJ8a9k=;
        b=wyEu3IuLwTQP81+SOeOTSj/l+NU6hdi9HP7eRO5B5eX3EIadZbGAya2jzySstEF+Ao
         Kf2qr86Okg5whdNbMt2ki/FFmknvmpOiu8z6lvJIjTP+JGTkl4VAHPa8zTZWuG1QOuhr
         EvUbzwJUwzogcOvs7M8roTh+lZUFXGMRpDToYCnCl0KZTFCVsCl4bOWzAhnyy8vhA5p6
         1pn+rKw6bfek1OPfzsPcZ7ZKIcP3qT7NGroTzYj4oz6SUWpTN4P8Ws+o72yHVFok0Fvj
         QZHkoI7Hnk0Et9LTsgTH4PKzc1Xwbj4O9iATD+Z5rm6OJ9LxreWujZD7eEYIAfJvg4mV
         +K6g==
X-Gm-Message-State: AOJu0YxIiHa6wohx9uPpuj0UYbUOShoMLABUSLWuXSbi4Qj6A7aPf3e6
	j3l9RGUOKj3a+8MBLhFJHU4hRqYvN1ZcQNuO1ReuwBjssh1Btlw4Df+YskuUbQ==
X-Google-Smtp-Source: AGHT+IGywOivmt303+DcTC3ofP9YgOMyMjeMWzRDMj7dGdLgOMs5iukGXycHoDa7LF4a5exz43oPuA==
X-Received: by 2002:a05:622a:1ba8:b0:458:256:bf7d with SMTP id d75a77b69052e-460aed6efd9mr73336091cf.22.1729348701002;
        Sat, 19 Oct 2024 07:38:21 -0700 (PDT)
Received: from rowland.harvard.edu (ool-18bba9aa.dyn.optonline.net. [24.187.169.170])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-460ae99c68fsm19750331cf.52.2024.10.19.07.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 07:38:20 -0700 (PDT)
Date: Sat, 19 Oct 2024 10:38:18 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Pixiae <pxiaegbayn@use.startmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Usb IP Failing to connect depending of program being runned even
 when the connection talks are identical
Message-ID: <ce91333c-93e2-4f5c-903e-0510912430f3@rowland.harvard.edu>
References: <50f9a086-d873-44d2-bdda-a8e00dd2421e@startmail.com>
 <2024101824-shakable-portfolio-9cfb@gregkh>
 <830fb71a-d259-4414-ad42-73a858a3bce6@use.startmail.com>
 <2024101946-usage-worst-bac3@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024101946-usage-worst-bac3@gregkh>

On Sat, Oct 19, 2024 at 08:47:23AM +0200, Greg KH wrote:
> On Fri, Oct 18, 2024 at 10:56:45AM -0600, Pixiae wrote:
> > Dear Greg KH,
> > 
> > 
> > > Why not just use the in-kernel device code instead of creating your own?
> > 
> > Do you mean that, why I don't write a kernel module?
> 
> Yes, what's wrong with the existing usbip client code in Linux?
> 
> > If that is what you mean, I don't want to have to share the code of my
> > device if I ever want to share my device, would be one reason.
> 
> Then it's going to be hard, if not impossible, for us to help you,
> sorry, as this is a group for Linux kernel issues.

You might get some more useful information by writing directly to the 
maintainers of the USB Over IP kernel driver (see the MAINTAINERS file 
in the kernel source).

Alan Stern

