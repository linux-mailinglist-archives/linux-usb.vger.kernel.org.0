Return-Path: <linux-usb+bounces-23245-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88974A94503
	for <lists+linux-usb@lfdr.de>; Sat, 19 Apr 2025 20:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A8E83B4163
	for <lists+linux-usb@lfdr.de>; Sat, 19 Apr 2025 18:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9561DF754;
	Sat, 19 Apr 2025 18:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="HrMjsFuc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E9A801
	for <linux-usb@vger.kernel.org>; Sat, 19 Apr 2025 18:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745087018; cv=none; b=Rk4DHwG1vCl5EQbvA5gahILNr47/oFI1YahJ1Ujb/j1qxXIOm/pE0gnAPSVRiAkE94tFuH4n8tp3RtWm+cSarfGXNYDYCJ6guK/EEoqFm0GPo3syPfzW42z3ffKEwFGYRN3CQxEVwnV4ORB7T+SNNOxFBMY0b7jG/Vzh8fhrZaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745087018; c=relaxed/simple;
	bh=nuNVOSGPQKzwjSRRu8IdegaSaPu18+iZJ7gSfJ1NBuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5Agma1GkQMABdgGy77hdW4cJBIBdUBwHQYmVLGgA1MyGooqfOHSYWO0IE0looL6in4b4C4xytcOWgm8LQJEOwA/Ir3r9kiBDv9cXfYXyOBmGW+zYx3medxhuIDzb9RCCMcgRg03Gr7VuUJgV94rrwHVIIQYbahAvjfPt6x93wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=HrMjsFuc; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c0e135e953so291848585a.2
        for <linux-usb@vger.kernel.org>; Sat, 19 Apr 2025 11:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1745087015; x=1745691815; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Be699Z0XWmnd1ie2fkCT1s7BAuEr7bCvDrJMaeKg5q0=;
        b=HrMjsFucfzC/zXH4pYvVBfFSWrD6KypakTwY16Yx+97pbGz+tcxidd/5AMrHdwmSM5
         jWH8eM6WIj2qpzj0li6xMwQGV/3NG072KnMAOITqqDnOjoOgQoBpjhG8L7KpglWfGizm
         woCOMPgq/ah/Hz31ymetuD0Iqy9RHqEo3vN0+kHq71Z8hPw+ovmT6Iv7GI1HHDtkM27N
         J+w4IT6Ghn6vX8U3cmBeESqbTEuOQyQrhxpnWrocKt5D9KPeWgYTxIrGvcr67mHfF32m
         DUxFwvC9YjfBR4qNYkMu+M0i3IqX2+RltTq0wLUoUJ5p9FWwTkmjzrDQIEjEo3yerWJZ
         Kd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745087015; x=1745691815;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Be699Z0XWmnd1ie2fkCT1s7BAuEr7bCvDrJMaeKg5q0=;
        b=b8dZGsendmDyNk5tbT7oZL9aDCFpzeCtxFHDZWkwNh74Ifg/Pr8wYS5OvzoHo7xU4O
         g1NPqs6dyTgeWLhSf35itVFNZJMKC1ymZ3pRH1bybMlzDpYnIZYPGc0FDp8WTO7gclOK
         ufnAOfB97wdXAvbF2kwUalH+ANqzJHT+omyZsZnoFsRDmZJ6N26//Xs4lyQH7Nfz2ImR
         W/LV4h/zdtMG2ZV6hBLNORYiOo7xriWY0HqmW+vYJ8NPjDznzSR90JTu+GJFkOXVSnPa
         RlXH5r3dItZSqjhRWjZs2PeVnoFSLeMHbNKrO1nk3BrQONEvCoJysN0Nu+jP0NRdAqQJ
         s3QQ==
X-Gm-Message-State: AOJu0YzMrtVeV/f1iK6oytHitHgYjwD2k+UFyAPleVCCVyotOh1tXcRX
	JRKrWBspIp2+AjM51t3HmlflsEyrgmwPYEfkCubDi+zu/PySQ9YVZXhRWQcf/w==
X-Gm-Gg: ASbGnctSusmms63BhKwGo256jZXZRrBGPlUjMjI9T4lHLIC39EX3MJVNH2qLjAh59oA
	jb5R0skX55byJM2MIxAkA9ETtscIMErGE0wZK0HIZ7ifjHXH3m93c2Vl+NR8EDWgrZc49SUr8po
	0FR2/6LsMLcNgjnjjI/u0wQt8PyFsW7QGt1gCFFRBaxWz7ediOVCiu8VRLHAYl2MJkv3wglNV7M
	lepHNPmd7enrKZHmpjM7Q4/KA3TvmRu4pudPIK3jkFsTvGHeSDMg03yhgY7A406LxI6ynifbMrw
	1h+cZkuNzz7q3SpFbsHFvyYrO3albUzBH0p6Zb++iw==
X-Google-Smtp-Source: AGHT+IG8t7mYUI20UpY8kNWowi+28qFnFmGInQ1xqRoXVIQziqRSsdiCozGJwvGni2WVxZAnUh9HsQ==
X-Received: by 2002:a05:620a:45aa:b0:7c5:a29e:3477 with SMTP id af79cd13be357-7c92804954emr1173453485a.53.1745087015581;
        Sat, 19 Apr 2025 11:23:35 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::2ca9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a6f5bcsm234421685a.20.2025.04.19.11.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 11:23:34 -0700 (PDT)
Date: Sat, 19 Apr 2025 14:23:32 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] usb: Add checks for snprintf() calls in
 usb_alloc_dev()
Message-ID: <ab7c2f42-f566-4c7b-b0ba-6f7446617e85@rowland.harvard.edu>
References: <20250321164949.423957-1-andriy.shevchenko@linux.intel.com>
 <aAPO3P1_-C7Nhil4@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aAPO3P1_-C7Nhil4@smile.fi.intel.com>

On Sat, Apr 19, 2025 at 07:27:08PM +0300, Andy Shevchenko wrote:
> On Fri, Mar 21, 2025 at 06:49:49PM +0200, Andy Shevchenko wrote:
> > When creating a device path in the driver the snprintf() takes
> > up to 16 characters long argument along with the additional up to
> > 12 characters for the signed integer (as it can't see the actual limits)
> > and tries to pack this into 16 bytes array. GCC complains about that
> > when build with `make W=1`:
> > 
> >   drivers/usb/core/usb.c:705:25: note: ‘snprintf’ output between 3 and 28 bytes into a destination of size 16
> > 
> > Since everything works until now, let's just check for the potential
> > buffer overflow and bail out. It is most likely a never happen situation,
> > but at least it makes GCC happy.
> 
> Any comments anybody?

It's not a hot path; the extra check won't hurt anything.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

