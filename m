Return-Path: <linux-usb+bounces-27561-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B1459B445DD
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 20:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5EDD97BC2B5
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 18:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47384343D94;
	Thu,  4 Sep 2025 18:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="WGj/zXVY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172373164CA
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 18:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757012067; cv=none; b=c/3ow1j4yVsXnRB15AW+9D7hky1UlLgcsf97NAE+V/X0Tim28QxBz7/FDM/tumh5mFhv/If/eWLCs2L7FYmNo+JHFiYZSgIGNPI9HOUj5OK75YAyVL25edHAJgW2kNXVk7KfDZSvfyo9JMkIaFJAw1w2/5DqI5XIP82vPHwxHL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757012067; c=relaxed/simple;
	bh=USJiRxOlrfKNw9tm18/7QTC3dHtNRlb0VspI3nSkIVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4224syZW9sVfFR8V/8WLW8fKL+EiJlzyXL4u8h9rUOe6D7mDAgm3EvanbFx2Ox/SQ8YYw/xOfZ311k8MSd/1iioHSsWVRdg0C7/HxqBpZYjf2VO6eZ2rPE2rJXwRhtXWPc9ZbZyrbA7jzrc5y64CrVjkb+riM6p1u9Yk+fztVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=WGj/zXVY; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-810e642c0bbso6433985a.3
        for <linux-usb@vger.kernel.org>; Thu, 04 Sep 2025 11:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1757012065; x=1757616865; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mzCtbkm/2+83HxTP0mUY++HNILHw+GWBJB56u05RJ5Y=;
        b=WGj/zXVY5M+7Dy8sNST2S7nJsjivtyJWTec5CYA9XM6KNyv+64vwjB9zHPaRoXG6WP
         ZUCsfJ2D8EpW227UbP/RIMNMhy7bvDzfWm6cHDMMzebLRz1MLy25HKzmFa6lvuj+wfpz
         c4+YR2ubggb7wQAepm0Y7hElZMqngtU7V5yua1FshHDZXE4bMW1H7VbJg0OdKl0p3AI6
         AsJHpviK9yeKNxvsvSJ7wCWkXbPqoFfcRpCZDEdX04F0iwHQFAsfKdBB8aZbhtG505f4
         EbPDoOiKy4UJauAtgpaiQWp+vlUU/JwZgCh8D/laazPktUWq9ipnHyjmrZDoj+eRfyg+
         v+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757012065; x=1757616865;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzCtbkm/2+83HxTP0mUY++HNILHw+GWBJB56u05RJ5Y=;
        b=L3E0MisH8Jkew7rGBYaYAWP8mICp66qjSQEeoKbc/bjk8xWzl3mOG/ZEWRE+z2HqDY
         Pqlk5GYR+aMhHAqv99G3vCeDXtB2hPGFla0tE8YnTGfzC8KFH/5eA3gNYYejkqNo/y7b
         fSMAaY/+KEa2Vl5ZybgLYpuMJ0KYHcQAOha0OPPaJzit1fu/fI4oywY/wuIlR+L0uueX
         HW+Aquidy5rN3GzxA/PuhceyVG921euQcxfNYKRy/BO04clBjsdFJXA4RNiqOoodWpJN
         kUVwGGgQyJpHOZalOXbTWnY4e+5M58iTzdMLrJS0gw6np4ZedM7pOtTTzbc4BUTormYR
         jl9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWo/wK9h3PiPNNHkgzHxgRiTUDal7Ehl7wxAvzEKI92LBy/6rTwDm51Wf3GUTn0OViPUXJr5yrVp6w=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc1Pi1/coQgXRyRJ1kFCm9T1bZFYtsrLZNer8TRotBky2JzLYv
	dSz6TkNfRgYE7zE6828hAzlU1WKVJxVGVPBMs+Y6OguDwEcgcShW2VuPkJHf2+9oHQ==
X-Gm-Gg: ASbGncvUYXnOZBUHG2OSWLaPc38vZY5Cl+ByV8CET+c2cw5UAXkhyta0UCjX4PiYrp+
	OZeRhONMv3H1uz7IgcR1Q1OhaxOfs15u6Bnx3upeMMsq3y67fo4AQz8eJ0CiRrw3GLdC4zct/E3
	+4S511eRfYfypjGU4H7UoRxQ40dJ/NxTlUqZOjsIRlTepF4ukvrPFuE305IvvzweI9CvbqEuQRu
	zHPSVpM62XYExMEPqZQSbuhKRxxIoXkqb0mhqq3Lxci3OpydxN9LB5HO5ASu+Htd1JAJBGTB88U
	/v85AHFStgJw73Q64BDX0impWZX6IRrs1AyPYOYIMlG8RJTSeJxoGxru6cz1BWImK+3Ko4qX47g
	Z+FJd/GDqfKlZvi9l/735WhzGoXtkcCSIuTipTakbRSk/JYd59xdBxJ3fNDecRGhGuqRQTdfmSW
	vE/WfDt7wiza3cWSCG+xxdc9M//6e5cc7h
X-Google-Smtp-Source: AGHT+IGHdeGzFWkN+ABRwUjtLifuMbybMpSCf6gseVTkXo1T+K9BVfbCoM+cFTPrAR5xZReiFuH/qQ==
X-Received: by 2002:a05:620a:4095:b0:7f9:ad9a:1eec with SMTP id af79cd13be357-7ff2b0dc837mr2351006885a.42.1757012064604;
        Thu, 04 Sep 2025 11:54:24 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-27.harvard-secure.wrls.harvard.edu. [65.112.8.27])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aaac092dbsm326626485a.36.2025.09.04.11.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 11:54:24 -0700 (PDT)
Date: Thu, 4 Sep 2025 14:54:21 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	ryan zhou <ryanzhou54@gmail.com>, Roy Luo <royluo@google.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH] drvier: usb: dwc3: Fix runtime PM trying to activate
 child device xxx.dwc3 but parent is not active
Message-ID: <385dccf3-234a-4f83-9610-81ac30bf1466@rowland.harvard.edu>
References: <CAJZ5v0gwBvC-y0fgWLMCkKdd=wpXs2msf5HCFaXkc1HbRfhNsg@mail.gmail.com>
 <f8965cfe-de9a-439c-84e3-63da066aa74f@rowland.harvard.edu>
 <CAJZ5v0g9nip2KUs2hoa7yMMAow-WsS-4EYX6FvEbpRFw10C2wQ@mail.gmail.com>
 <CAJZ5v0gzFWW6roYTjUFeL2Tt8kKJ_g5Q=tp2=s87dy05x-Hvww@mail.gmail.com>
 <38b706cc-5966-4766-9165-51935fdcd790@rowland.harvard.edu>
 <CAJZ5v0h=i9XF_SQMOhz3P+4SAH3Qy-r1oUiiw7Bp=PcRnJjVbQ@mail.gmail.com>
 <59951c2d-60e8-47a8-a43c-00b92e095043@rowland.harvard.edu>
 <CAJZ5v0i6aFarDU8OTZ_3VS9dp4SaqKJ0SuiN4gFSxrRoAAV5CQ@mail.gmail.com>
 <24a69e4d-2f10-43fb-81d4-f7eea44a6b8d@rowland.harvard.edu>
 <CAJZ5v0gUjgY45WFye5STJ7kv30O4rQ=23qkOsHEMSxfwg8jO4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0gUjgY45WFye5STJ7kv30O4rQ=23qkOsHEMSxfwg8jO4g@mail.gmail.com>

On Thu, Sep 04, 2025 at 07:34:22PM +0200, Rafael J. Wysocki wrote:
> On Thu, Sep 4, 2025 at 4:19 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Thu, Sep 04, 2025 at 04:08:47PM +0200, Rafael J. Wysocki wrote:

> > > Say this is not the case and say that the device is runtime-suspended
> > > to start with.  Then the "suspend" callback has two choices: either
> > > (1) it can runtime-resume the device before doing anything to it,
> > > which will also cause the device's parent and suppliers to
> > > runtime-resume, or (2) it can update the device's state without
> > > resuming it.
> > >
> > > If it chooses (1), then "resume" is straightforward.  If it chooses
> > > (2), "resume" may just reverse the changes made by "suspend" and
> > > declare that the device is runtime-suspended.  And if it really really
> > > wants to resume the device then, why not call runtime_resume() on it?
> >
> > That's what I meant by needing "cooperation from the driver".  The
> > driver's ->resume callback needs to do this check to see which pathway
> > to follow: (1) or (2).
> 
> Unless "suspend" always does the same thing, so it always does (1) or
> it always does (2).
> 
> In that case, "resume" will know what to do without checking.

It still has to check whether the device is runtime suspended.

> I'd like to mention that if "suspend" chooses (2), it may need to
> resume the suspended parent or suppliers to be able to access the
> device even though the device itself won't be resumed.  I'm not sure
> if (2) is really attractive then, though.

True.

> Also, in the example we've been considering so far, the assumption is
> that B can just stay in runtime suspend, so why would it need to be
> resumed by "resume"?  And if there is a specific reason for resuming
> it, "resume" can just call runtime_resume() on it AFAICS.

So it appears to boil down to this, as far as ->resume is concerned: At 
the start of the callback routine, there should be something like:

	if (pm_runtime_suspended(dev)) {
		if (the device needs to be woken up) {
			pm_runtime_resume(dev);
			... whatever else is needed ...
		}
		return 0;
	}

If ->suspend is clever, it can clear or set the SMART_SUSPEND flag 
according to whether the device will need to be woken up.  Then the 
second conditional above will always be true whenever the callback runs, 
so the test can be skipped.

Alan Stern


