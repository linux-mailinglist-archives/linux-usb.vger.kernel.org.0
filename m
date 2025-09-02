Return-Path: <linux-usb+bounces-27426-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D565B3F27C
	for <lists+linux-usb@lfdr.de>; Tue,  2 Sep 2025 04:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 030014E06CA
	for <lists+linux-usb@lfdr.de>; Tue,  2 Sep 2025 02:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C6F2E03E6;
	Tue,  2 Sep 2025 02:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="UNtW6m5l"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90200218EA8
	for <linux-usb@vger.kernel.org>; Tue,  2 Sep 2025 02:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756780900; cv=none; b=lhlbn7e6vPsbkh8iry1sPaL1GVVbwlF3/j0CD4Mbhcphiv2+wz84r9ZqySua6ZmlLmAjOFEygon1Uj72lIKE6nBMLbQGtfdBD1lmHmQJx+yYPsfPyEHWcrrKlvvFjdb1h+sJNdRvBtzLB9ZUdtWAlpCt+tMg79wXkRYDi1BPUGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756780900; c=relaxed/simple;
	bh=cliUwr/BqV8Jj3ASMnnWECpyPQX0+Z1jg4U/YeW3IAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEoWZio0rPNeCli+KP5RgeOYlAX7rqxBjpOnKCIDaI3VKdwLE9sA2MWlEVcr7bsfG7Z8Dp/CRPlEFZkwjGbPMuwTSrZXKeub+rKbNEEcRlP2RvP64MGdHRTpzzrwmJzCZnoREIg182urHVsnsdXuBbGe0JSCuJzPqNypT+zK9SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=UNtW6m5l; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7f7edf7621dso417601785a.0
        for <linux-usb@vger.kernel.org>; Mon, 01 Sep 2025 19:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1756780896; x=1757385696; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Enuy41nwZCcQ9zOdmE9e02q6xzYJW1G0wWmqMhJZXMk=;
        b=UNtW6m5lj1yl6NVQFu/I6RiQEN4wlipqid+O32WQTvmuXMfTUHGepv55FXMCyehr0+
         BUCGK7IinpNBj0x6APdlSkIul1RmOXiLhN7zFw3h7+ITb1tf9Gp9GrRlfbfDn1D7OlGd
         XiBIf/on8wDptiG5yL973Cm2c6yBogpGFswXDxPCSeTqnA5YEzxLRfOEJTPskC050bvW
         7+cnqCZomwfjIvRLOJmpRmo+ReHb0gp6yrCfQgzciM6ZvWL37QDOt8IVz2wonmnk6nDB
         VDX1VoxRazQnRmxKetnlBc6f9iUI8NvFlJfrek6Sxsf5iSmbxE4nNImCCtyNwTisZA4L
         p6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756780896; x=1757385696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Enuy41nwZCcQ9zOdmE9e02q6xzYJW1G0wWmqMhJZXMk=;
        b=AXaglhFNerJZlov6jOkf+aC1eHwvNjdF5qZoJc2BiRrybElIRsLujI8/TwLIjCJ5DM
         7Thvejkn8kjn+CrdcVeN2qJiCqP0t0GxS1fsHWVkSCHXlc2iIgkDMHFXzPimRr4Pm8mI
         OFaoMoTKXE3jQGBww/Jl9D7hVj6AGiEkLCEbUKMkawEgnDl0Vn49jeWFAKDjktJtLXpK
         AoDscOrPU9zeiKb+5tCcsII7qQSy19RHloBV2I+Gr+Q4CIxwUTeUhO/dV/u1VBN5k8Nc
         FQoJ7yKZBmsAo7f0/Yls+h1a0ofRwNuyAPRSBg/GJq+yzNcn17x37axsslruCOrcxSL/
         jC+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWGqmAEhhmv/nWLvEAuufq3UtkIdAWDze2O51FJf6Y/Odl0lpDTcSFL341wDHZq0R/2M0Nw47cwC1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhZP7B2wn5qydSZ14t/qQ9CfcCvHg6q1FR73T3KYyl374DG4Qv
	186jJbQUY/dPGeZNG5ZL1GiLKYw0OlWFBtQ0FwDWBjsF/63Uy3LEQ8Fb1DuGrv9T/Q==
X-Gm-Gg: ASbGncvuxc7nSwd351xfYXNnybKz36kxdYMOZ58EHInFZBS0H5uEGxCtky7Alug1S18
	p2P7wtJ/+82ZOQfm9A5uUld8G/a3fpBQvfK4zV4FKc4+fcHjpTeGPk5wxDkanP+Fe9zOfuLyuuw
	kKutNd3QVBVVqs6Kq7vHWQTfmvJ/TSsLj8Qkk+rTYJIDNBxunv//6c0PQGBRMtYBTQ2zSaQvq4L
	WtIrmjIofbFPfBzcDaiQ+Pj7Gps5Qu2n8m/8GadKJ/OuI5hRa0q0xRoOJdDP5DE5k6Rot8Ts2aQ
	gROyB9du2KlicRJ6jRmgQRLZjyxjWetu7MSpvPO3yaBVs/b3znZh1UgKw2zzxTEf/sRelojYW1i
	a5c5DodZeOm16NjZhdOqG/VwIbTS55SgmeYQv6PhMWAopQkXOn/k=
X-Google-Smtp-Source: AGHT+IEfGRzkAZoJGulJoHViWTZWxO98WsvX1GNg/acRhZQU9F+ZFNkV87Dz1dLl6TBxLDnLIyPHCw==
X-Received: by 2002:a05:620a:700c:b0:7e8:12c1:12c2 with SMTP id af79cd13be357-7ff282c764dmr1013796185a.34.1756780896276;
        Mon, 01 Sep 2025 19:41:36 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::f777])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8069c1524cfsm62575685a.43.2025.09.01.19.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 19:41:35 -0700 (PDT)
Date: Mon, 1 Sep 2025 22:41:32 -0400
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
Message-ID: <38b706cc-5966-4766-9165-51935fdcd790@rowland.harvard.edu>
References: <CA+zupgwnbt=5Oh28Chco=YNt9WwKzi2J+0hQ04nqyZG_7WUAYg@mail.gmail.com>
 <CAPwe5RMpdG1ziRAwDhqkxuzHX0x=SdFQRFUbPCVuir1OgE90YQ@mail.gmail.com>
 <5d692b81-6f58-4e86-9cb0-ede69a09d799@rowland.harvard.edu>
 <CAJZ5v0jQpQjfU5YCDbfdsJNV=6XWD=PyazGC3JykJVdEX3hQ2Q@mail.gmail.com>
 <20250829004312.5fw5jxj2gpft75nx@synopsys.com>
 <e3b5a026-fe08-4b7e-acd1-e78a88c5f59c@rowland.harvard.edu>
 <CAJZ5v0gwBvC-y0fgWLMCkKdd=wpXs2msf5HCFaXkc1HbRfhNsg@mail.gmail.com>
 <f8965cfe-de9a-439c-84e3-63da066aa74f@rowland.harvard.edu>
 <CAJZ5v0g9nip2KUs2hoa7yMMAow-WsS-4EYX6FvEbpRFw10C2wQ@mail.gmail.com>
 <CAJZ5v0gzFWW6roYTjUFeL2Tt8kKJ_g5Q=tp2=s87dy05x-Hvww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0gzFWW6roYTjUFeL2Tt8kKJ_g5Q=tp2=s87dy05x-Hvww@mail.gmail.com>

On Mon, Sep 01, 2025 at 10:40:25PM +0200, Rafael J. Wysocki wrote:
> Of course, the driver of B may also choose to leave the device in
> runtime suspend in its system resume callback.  This requires checking
> the runtime PM status of the device upfront, but the driver needs to
> do that anyway in order to leave the device in runtime suspend during
> system suspend, so it can record the fact that the device has been
> left in runtime suspend.  That record can be used later during system
> resume.

As a general rule, I think this is by default the best approach.  That 
is, since B was in runtime suspend before the system sleep, you should 
just keep it in runtime suspend after the system sleep unless you have 
some good reason not to.  In other words, strive to leave the entire 
system in the same state that it started in, as near as possible.

One good reason not to would obviously be if B is the source of a wakeup 
signal...

> The kind of tricky aspect of this is when the device triggers a system
> wakeup by generating a wakeup signal.  In that case, it is probably
> better to resume it during system resume, but the driver should know
> that it is the case (it has access to the device's registers after
> all).

Not necessarily.  Suppose that C is a child of B, and C is the wakeup 
source.  B's driver might decide to keep B in runtime suspend 
since B wasn't the wakeup source -- but then C's driver would have to 
make the same decision and would not have access to C's registers.

>  It may, for example, use runtime_resume() for resuming the
> device (and its parent etc) then.

Consider this as a possible heuristic for B's ->resume callback, in the 
case where B was in runtime suspend throughout the system sleep:

	If B's parent A is not in runtime suspend, test whether B
	has a wakeup signal pending.  If it does, do a runtime
	resume.  If not (or if A is in runtime suspend), leave B
	in runtime suspend.

At first glance I think that will work fairly well.  Even if B is kept 
in runtime suspend when it shouldn't be, the normal runtime wakeup 
signalling mechanism should kick in without too much of a delay.

The big problem is that this issue applies to all subsystems and 
devices.  It would be better if we had a uniform solution that could be 
implemented in the PM core, not in every single subsystem or device 
driver.

Here's another possibility, one that can be implemented in the PM core 
during the ->resume, ->resume_early, or ->resume_noirq phase of system 
wakeup:

	If A and B are both in runtime suspend, do not invoke B's
	->resume callback.  (Or maybe don't invoke it if A's ->resume
	callback wasn't invoked.)

There probably are some detailed reasons why that won't always work, but 
maybe you figure out something like it that will be okay.

Alan Stern

