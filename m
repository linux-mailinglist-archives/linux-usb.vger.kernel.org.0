Return-Path: <linux-usb+bounces-17700-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB699D150D
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2024 17:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33C92B2F671
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2024 16:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7681BD9D3;
	Mon, 18 Nov 2024 16:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="KW3XCT2R"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C87B1B6D0A
	for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2024 16:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731945797; cv=none; b=HHVpSANC+AxXDTmB6BjH3GhLp4dX0gXUpyWno5LhyQ9DW5LrxASd6V4FMfu1fGJ8hZ6tUohIgjKgYXePY/UFR3tKcWFHIaaP1TSspxqgRREn/3Xbl6gXYzeAR/lV3YVORouGB+45QDNqZRkZc0P3kmoFrzTbovjyJTPr5VeadEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731945797; c=relaxed/simple;
	bh=bYd1O49NovQL8MRsQgoUWi8aQ4V2FYR0YWSmW+r2qZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2YIWTy6WzvgBh0DN3A0keCaVK1ACxwceoFcOS92jECpTX9OQ358F/AVIvDzFMJZAbGi2Ksa5ubKF6DDqgR90GNG3sELXXfH6ND31SXJF22QEW6leBhnKMCMldwP6A0+4IFid6F62Xl0gWMpYTKeANtSscwYuezO1rGO2IxKqDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=KW3XCT2R; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b1418058bbso162376085a.3
        for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2024 08:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1731945794; x=1732550594; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fsjxKrl8udJFZOol9X53dv8vA35IEJmDKzP72/dq5v8=;
        b=KW3XCT2RlFw43z/2vMaUBEFzOJmqJENjEZm8Ne9MEMBj2iv6EXgNxADDtrl2fjNrRZ
         HzWwWj7D3Ou2h3/r2Bty6Nu4MTah1k9ewYsSXQ9z4jYxoEex97QjnLFqKbISH0IVr2gY
         F+HPLkKuUt6CoU8S6XaAd8MkqCqBOBAyKAzzBBNYt/ruVLlf3ikeABnvzmKMUWSExX9P
         V1hXnlsET9jbrg9RB9QXPXnE4Z+K8gndInw/HJXkhrZhEEzzQITNNXE31/6PCnxj83Bf
         WrAF/PoYo4Jz7Ln5JuPiw0nkkg97dvKo8881wOwNDgKjOD86rt+bGvn6gbD4iuQo3UET
         kDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731945794; x=1732550594;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fsjxKrl8udJFZOol9X53dv8vA35IEJmDKzP72/dq5v8=;
        b=ZkOorSeKDWH32mVo8DMPnonEIGHezg81MR0a77U/hN7ckQLvjMQNfPDcGp4J1JfHgl
         RDARM4mWqRols8KYhFuUbKBskZjn+lGFZt39pPmg4NNfgOUke1wfku6XsDfAO6uGtLtx
         MAWfZN/LV3z8yc02hxhLnLjKFYEaTQV7pa06jWNskkP3vPnKCFxvhrgIex+24/7hgKh4
         YwePmK0nYr01O7G3cUO2NXFBSHZQvnXK3aR5j1EiIwpfWjV2rSvQMOq5cazXIpQzubew
         UKvYNBR5ndXH06Qbv/ZdzH1LwKI0w7K0VpxzG0vnFqa7l8kzoWnRUyhlbxAePX6GFn+L
         BZrA==
X-Gm-Message-State: AOJu0YysnhfFIUQCVkvQBkLOQDcrs5tGcb6iz6GgRPU5GeFrllR9uc9o
	qAVmjK9y5maQaxTZrgIh2gdQ+8sRaZUZNOBQ+56nDqx0g4RDu7PEhHJEs+sNCQ==
X-Google-Smtp-Source: AGHT+IHz48vpI8RJM4EMBpXBJd7k1BMf3BeY5zzrWzIg+eBml++/aBaI0Cwbd6v/iQWuFqQHYsg3iA==
X-Received: by 2002:a05:620a:46a0:b0:7b1:4e01:5470 with SMTP id af79cd13be357-7b3622cbf68mr1306630485a.28.1731945794338;
        Mon, 18 Nov 2024 08:03:14 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.12.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b35c9ad539sm495943185a.66.2024.11.18.08.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 08:03:13 -0800 (PST)
Date: Mon, 18 Nov 2024 11:03:11 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Markus Rechberger <linuxusb.ml@sundtek.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Highly critical bug in XHCI Controller
Message-ID: <3df5d5f8-7d26-4064-954a-d130ceaf36a5@rowland.harvard.edu>
References: <3905c1c88695e0ffcfabf700c06dd7223decef8d.camel@sundtek.de>
 <dd4239c7b0538e1cd2f2a85307c73299117d5f0e.camel@sundtek.de>
 <50f730ae-4918-4dac-88ec-b3632bee67e7@rowland.harvard.edu>
 <35c051354414ae9ef6e6b32b1a15a5dedf471176.camel@sundtek.de>
 <dff9f24a-4aa2-45aa-920f-20876cf4ccbf@rowland.harvard.edu>
 <f34636ebeda843de9329ac0aa4ec51c6627a0e5c.camel@sundtek.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f34636ebeda843de9329ac0aa4ec51c6627a0e5c.camel@sundtek.de>

On Mon, Nov 18, 2024 at 01:14:09PM +0800, Markus Rechberger wrote:
> 
> 
> On Sun, 2024-11-17 at 16:02 -0500, Alan Stern wrote:
> > On Sun, Nov 17, 2024 at 11:47:52PM +0800, Markus Rechberger wrote:
> > > On Sun, 2024-11-17 at 10:18 -0500, Alan Stern wrote:
> > > > On Sun, Nov 17, 2024 at 08:44:16PM +0800, Markus Rechberger
> > > > wrote:
> > > > > Basically the issue comes from hub_port_connect.
> > > > > 
> > > > > drivers/usb/core/hub.c
> > > > > 
> > > > > hub_port_init returns -71 -EPROTO and jumps to loop
> > > > > https://github.com/torvalds/linux/blob/master/drivers/usb/core/hub.c#L5450
> > > > > 
> > > > > I'd question if usb_ep0_reinit is really required in loop which
> > > > > is
> > > > > running following functions:
> > 
> > > This should only go down there in case an error happened earlier
> > > no?
> > 
> > Of course, since -EPROTO indicates there was an error.
> 
> Alan, first of all thank you for your feedback.
> 
> Do you know any practical way how to test this?

Not any easy way, no.  Shorting out the signals like you do, but for 
only a few milliseconds, might work.

> > > My experience is just - reconnect the device in case an error
> > > happened
> > 
> > You can't reconnect some devices; they are permanently attached. 
> > There 
> > are other reasons why reconnecting might not be practical.
> 
> 
> I understand what you mean here but isn't it primarily about downsizing
> USB 2.0 -> USB 1.1?

No.  This has nothing to do with changing the speed of the connection.

> The next point would be if eg. an endpoint of a webcam downsizes to 1.1
> you don't have to expect a workable device because video would exceed
> the bandwidth easily.
> Do you know any practical example/hardware where this is really
> relevant?
> 
> The failure handling will call the xhci reset which is not meant to be
> run without fully initialized data structures. In my case the driver
> returns -EPROTO (while the device is already disconnected), then first
> of all it tries to reset the endpoint which in the upstream kernel
> causes the NULL PTR exeption. For XHCI this code stream logic is simply
> not meant to be applied in such an error.
> My first submitted patch will solve the issue but just papers a higher
> logic issue. 

I think it's fair to say that the logic error lies in the xhci-hcd 
driver, not in the hub driver.  xhci-hcd should be prepared for attempts 
to reset endpoint 0 before the device is fully initialized.  After all, 
initializing the device requires us to be able to communicate with it 
(to read its descriptors), which requires ep0 to be working properly.

> > In any case, it is generally recognized that the type of errors
> > leading 
> > to -EPROTO (bad CRC or no response, for instance) can be temporary or
> > intermittent.  Retrying is an appropriate strategy.

> > -EPROTO does not necessarily indicate the device is gone; it
> > indicates 
> > there was a problem communicating with the device.  The problem might
> > be 
> > caused by a disconnection, or it might be caused by temporary 
> > electromagnetic interference (for example), or by something else.
> 
> 
> a bad CRC response on a short cable -  something has gone very wrong
> then.

Just a bad CRC response; the cable length is irrelevant.  Another 
possiblity is a bit-stuffing error.  Yes, something has gone very badly 
wrong, but it may go right again if we wait a few milliseconds and 
retry.

I have seen reports from people who experienced problems of this sort 
caused by interference from a bad fluorescent light fixture or by 
electrical noise from a nearby fan.

> If there are temporary EMI issues ... I'd consider that an as an a
> absolute failure as well, they
> need to be handled in HW rather than a software workaround.
> 
> In my experience with USB anything that is a 'temporary' failure can be
> considered as 'permanent' failure and I've really seen a lot over the
> last 1 1/2 decades.
> However issues are mostly related to immature controllers / missing
> quirks for some controllers.

It's true that errors of this type are quite rare.  Nevertheless, 
retrying is a valid strategy for dealing with them and it doesn't hurt 
anything.

> Our devices in the field since 2008 usually pump around 100-300mbit
> through the USB 2 link,
> streaming  devices which usually run for a long period of time (up to
> months / years).
> 'retrying' something on a link where something has gone wrong for sure
> never worked properly for me, it would have continued with another
> followup issue at some point.

I also changed the ehci-hcd driver to retry multiple times after one of 
these errors, rather than using the strict "3 strikes and you're out" 
approach.  There were cases where that helped.

> I'm definitely in favor of telling the user if something went wrong
> either reconnect or submit a bug report for that particular device to
> add some quirk for special handling.
> 
> Anyway can you give a particular example where this 'retrying'
> mechanism and reloading the endpoint size solves or solved a problem?

I cannot.  The events referred to above occurred many years ago.  They 
were rare then, and they probably are even more rare now.

> Over the years people will certainly forget why this was implemented
> and take the code 'as is'
> and the next ones will just say it was always like that don't change.
> I don't mind keeping it as it is but it should be more clear / obvious
> why it's really done that
> way.

It seems obvious that what the code does is to retry when -EPROTO errors 
occur.  (Also -EILSEQ and -ETIME.)  And the reason for retrying should 
also be pretty obvious: There's a chance that the error will go away 
when the transfer is retried -- why else would you retry something?

This hardly seems like something we need to explain in a comment.  But 
if you want to submit a patch adding such a comment, please feel free to 
do so.

Alan Stern

