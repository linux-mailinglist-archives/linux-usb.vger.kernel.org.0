Return-Path: <linux-usb+bounces-27384-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2919BB3C381
	for <lists+linux-usb@lfdr.de>; Fri, 29 Aug 2025 21:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6DC816664A
	for <lists+linux-usb@lfdr.de>; Fri, 29 Aug 2025 19:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E88C244686;
	Fri, 29 Aug 2025 19:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="hU0ZLCmk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030B82417F2
	for <linux-usb@vger.kernel.org>; Fri, 29 Aug 2025 19:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756497532; cv=none; b=o29wz0wfHPu9809R4uPoLw3eCNQrmCFWyPL3lLbQYqcMX9hSaDa8HqTdSzr9ZawLke1LysHQ2fQMcjA2REgqYAWtIzVemi4UoH10ymSawWhaCS4oxWa7R/sh8eDDzejbJSXeWJ/msl3ccu4qoyAlASqKFFpFhBNn+ALPxEDNlu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756497532; c=relaxed/simple;
	bh=8l7WloauFJzBWhqUn0J8vIbg+sAFNP6CNrqLP/SLa7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZAihnEZgdI0QCfgPWv2th1Fdcq/1VvXs1jAQfC4eJnqDiUeeHdVJjUKEkdmQakqvGScZd881smVrSpF7j0tTUalAI+ctDgg4Ce+8GKxbux5kP1jm1ypSG/T50HtucwmMwOYTqgz4wF6ZqlSFb20X4N7C7/U6ejNEhhzIzBvKGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=hU0ZLCmk; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7f84c170734so294844085a.0
        for <linux-usb@vger.kernel.org>; Fri, 29 Aug 2025 12:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1756497529; x=1757102329; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gwfj8BSnuRCasoSQ1waOm5Q9KayvsIsoixpELYgVNyA=;
        b=hU0ZLCmkWtB3/QnRM+p1ZO6Leno5i3rHsL/TRR2K3A3qtQUg7Zp+etocnbHqyAABAf
         JB8P3n+jTjJ41JYhc7HvuxjZqwgj1BGSWe8pVpEPjq1WCsPCQjAdbX8g5k2K2KP3z0X3
         GdjBZBhy6JWgoAZGHokeQhAAEjpDDx10bVDc/NaW/tkQQxL/iXDv64BD3MB+oiqx3Khn
         zlLMwhhWt7iJAV8u9tQXzPg/1FtBVPqRvPAMyDWz2IVqeyp9SJeKdRz21OmRKF3Wi/f9
         yqRAWthp9+ym0OPWSM2mYJDkmUAOT3MmW+i03szKqWFManEFOh1okeV3eDJRzzq6r6Bh
         96Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756497529; x=1757102329;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gwfj8BSnuRCasoSQ1waOm5Q9KayvsIsoixpELYgVNyA=;
        b=nfCx3ahGVWDzddPR20EODALlThhOccd0fgKMADRtE+2KQqJTtj85K0znNMIixAyhnv
         3liAcp056ZvSsiWfp/iQTDdUmWFPJZYJclgFWpqOUm1c8L4aCoMERnAmaaLfAv1kESc2
         NowTUn0kCVELIbIWSt/W1osvBB59+cdC6eYhO7VLSPGH3W0aIIX4n3atG7PHZ0fyQ+YG
         rjk9J1nbCdq7z4TJTBX+IXDFCe50BwfNPHg/Y4ohxruntBU2/rMUyFOR29P9rdD3ulai
         68QmeuPCTwrPmsP7Bg/nIUWrPcb3s1FCnQEwP2v3RTVkaVW/0zv67EVsNIXzXk0Ldcl0
         uK+g==
X-Forwarded-Encrypted: i=1; AJvYcCV1IcB0X1RMmN0ZElzQ/M0We/23ae1Yog8pCMp+kB19iaTAJByk61n3XRedOTB1XhjI6ZWiNCG6TjU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjqYWM1zXBbeCI0yFuABfIkQWflqU++xSPVZFfZnFM+m9ENXpT
	43zBpSDPIHDH5o1ScN9EDfvgcxyZ18YJZyf8Ng9gEmBxCavQNah/Du+G3PkrUiBmlg==
X-Gm-Gg: ASbGncvU4FIzJUGvrCaI9gAWgaWMwGCRglzHPM81HsVcSJbwS4tMqLsSwY2IPWUfZMF
	4m7DA9Se/k+IO27ytviJYt+ucUDtAtrxad0vbyD5kmkxYYqE6i36fCT6ZaFPXGiStS5L2rpYgeZ
	qvchL7voKo909v6AXMsvZdfYcSHt5E5wQuoH/7canLoq5GjZ0kjNraA9nh2xsfmeQ+xmxD1axi2
	GVv7LHxtSzpRalgfPBnTAAgiyIT3IOy0eMibogKI4rWkcdbwxHLaAzKuIp4P313xPLoHT2l8gwa
	GwwCT3CyxsJxilhaWSorSuwg5goG+4qEp2iBGWlh7r8oupatARR/hYBk73wlvW28w4Z0cs3RHH7
	BvYCQnS5niOBdj10DCMyklOk/kq0uzcyzKfvFp0Do
X-Google-Smtp-Source: AGHT+IG2Lf7E7o/NrgCtywMKuNoJcyEOoQ9/McbEtruHNyVu4Eboh3tPAysx+5+AkL59N+5ujTQ8Hw==
X-Received: by 2002:a05:620a:4047:b0:7f6:b6e7:81d4 with SMTP id af79cd13be357-7f6b6e78321mr1728616285a.35.1756497528867;
        Fri, 29 Aug 2025 12:58:48 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::fd35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc0d774772sm246165485a.12.2025.08.29.12.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 12:58:48 -0700 (PDT)
Date: Fri, 29 Aug 2025 15:58:45 -0400
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
Message-ID: <f8965cfe-de9a-439c-84e3-63da066aa74f@rowland.harvard.edu>
References: <20250826150826.11096-1-ryanzhou54@gmail.com>
 <CA+zupgwnbt=5Oh28Chco=YNt9WwKzi2J+0hQ04nqyZG_7WUAYg@mail.gmail.com>
 <CAPwe5RMpdG1ziRAwDhqkxuzHX0x=SdFQRFUbPCVuir1OgE90YQ@mail.gmail.com>
 <5d692b81-6f58-4e86-9cb0-ede69a09d799@rowland.harvard.edu>
 <CAJZ5v0jQpQjfU5YCDbfdsJNV=6XWD=PyazGC3JykJVdEX3hQ2Q@mail.gmail.com>
 <20250829004312.5fw5jxj2gpft75nx@synopsys.com>
 <e3b5a026-fe08-4b7e-acd1-e78a88c5f59c@rowland.harvard.edu>
 <CAJZ5v0gwBvC-y0fgWLMCkKdd=wpXs2msf5HCFaXkc1HbRfhNsg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0gwBvC-y0fgWLMCkKdd=wpXs2msf5HCFaXkc1HbRfhNsg@mail.gmail.com>

On Fri, Aug 29, 2025 at 09:23:12PM +0200, Rafael J. Wysocki wrote:
> On Fri, Aug 29, 2025 at 3:25 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> > It sounds like the real question is how we should deal with an
> > interrupted system suspend.  Suppose parent device A and child device B
> > are both in runtime suspend when a system sleep transition begins.  The
> > PM core invokes the ->suspend callback of B (and let's say the callback
> > doesn't need to do anything because B is already suspended with the
> > appropriate wakeup setting).
> >
> > But then before the PM core invokes the ->suspend callback of A, the
> > system sleep transition is cancelled.  So the PM core goes through the
> > device tree from parents to children, invoking the ->resume callback for
> > all the devices whose ->suspend callback was called earlier.  Thus, A's
> > ->resume is skipped because A's ->suspend wasn't called, but B's
> > ->resume callback _is_ invoked.  This callback fails, because it can't
> > resume B while A is still in runtime suspend.
> >
> > The same problem arises if A isn't a parent of B but there is a PM
> > dependency from B to A.
> >
> > It's been so long since I worked on the system suspend code that I don't
> > remember how we decided to handle this scenario.
> 
> We actually have not made any specific decision in that respect.  That
> is, in the error path, the core will invoke the resume callbacks for
> devices whose suspend callbacks were invoked and it won't do anything
> beyond that because it has too little information on what would need
> to be done.
> 
> Arguably, though, the failure case described above is not different
> from regular resume during which the driver of A decides to retain the
> device in runtime suspend.
> 
> I'm not sure if the core can do anything about it.
> 
> But at the time when the B's resume callback is invoked, runtime PM is
> enabled for A, so the driver of B may as well use runtime_resume() to
> resume the device if it wants to do so.  It may also decide to do
> nothing like in the suspend callback.

Good point.  Since both devices were in runtime suspend before the sleep 
transition started, there's no reason they can't remain in runtime 
suspend after the sleep transition is cancelled.

On the other hand, it seems clear that this scenario doesn't get very 
much testing.  I'm pretty sure the USB subsystem in general is 
vulnerable to this problem; it doesn't consider suspended devices to be 
in different states according to the reason for the suspend.  That is, a 
USB device suspended for runtime PM is in the same state as a device 
suspended for system PM (aside from minor details like wakeup settings).  
Consequently the ->resume and ->runtime_resume callbacks do essentially 
the same thing, both assuming the parent device is not suspended.  As we 
have discussed, this assumption isn't always correct.

I'm open to suggestions for how to handle this.  Should we keep track of 
whether a device was in runtime suspend when a system suspend happens, 
so that the ->resume callback can avoid doing anything?  Will that work 
if the device was the source of a wakeup request?

Alan Stern

