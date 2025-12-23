Return-Path: <linux-usb+bounces-31692-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C53B4CD7F74
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 04:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D89E30142E0
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 03:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D762D3221;
	Tue, 23 Dec 2025 03:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="R8wCwXNL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8D52C21C2
	for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 03:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766460282; cv=none; b=DAMHNASmfFHiDrglDTsYHGwMo+woFw/TeZfARF1kjAid7TI9p2KJo+9EndJ92x8HU2eLqCPr8kYIn6zKswksPuYaW9g7ArqAR98HnMrXb/hK7VskoBpWMyF2ALeHZEDwBUmcw2ZM6xsFjS4buAR4PhozHZfEND9/2pBDkcUkEC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766460282; c=relaxed/simple;
	bh=MFmPAhL/0KJLi2oXs+mC6oVzLwT2hgzK3OwxJnO5seQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VuRT3gtMS1Cmdipp7Ev3iI8S+0xHDqrvHmNuVfdHHKXvgDSLw06KHch/qy95g66ALQ/06O8/CjqH62kB8Pv4ob7Vw4xHzomjajGAmbaKzFNtW9LgmkUSQhm/tUp+bsVqzvvsk+2r37atjZmSz6AArFddcP+KhhsZVdTteW20Rvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=R8wCwXNL; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4f1b212ba25so40363491cf.2
        for <linux-usb@vger.kernel.org>; Mon, 22 Dec 2025 19:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1766460279; x=1767065079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mwUjOqAifF3DIVwSME/aBHzjmZZUpRf1Av8+p4xdqSw=;
        b=R8wCwXNL23JMn5pEs9qETZLz+4zCLiQL6aYhrFz8BrH+884inW+dZo2S90lmXNMvsW
         F2pZWThggGTaqTDSq/NgsqyGhI89oTxIOmhnvoUkDrRduLgDnauFINJY8HSPy6epi1em
         kOdIbIvN0N5z3X5DNlmzMSpR4tBrsdiyxvGIL/Ovylo2E7S9C/QfMmlpxx8sP+MepS1n
         Ie8RMC7G5zB2UsRvAlC3W8NdWDNiwVlrTiE/PLY1HFRsFPYqjwUHVeLcOacRssk3z0fD
         Ga65ebpzN/EAvusAlzxZI/bQfw49A7N1g6+l6b4Jv9fofafLH0kT4BRU0K0IG1wgYIR5
         sPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766460279; x=1767065079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwUjOqAifF3DIVwSME/aBHzjmZZUpRf1Av8+p4xdqSw=;
        b=ORzyE9hW0d4WzxhmWWPUN7afEoVORakUwkv491bBqqPRFQK9mNjECSBt3cVffsUJHF
         +K7+jJyh8yXWaq+FeCnI1xTCoXH2uOnszMcOl0ZQ5OqO3V7AEhWMViGQeXcidbgi5kTM
         GS/NbsrZCsVY9SCAq5DdR7K4eMKtq0tmDOJJLu3oYK66maTr5gPTgG0ucshxVO1cCIhB
         27NNNi+TbwzM4fCxQLbsEV664z2jfTPfo/M83y3rEh7Xo3GhpxYOY5tm85RlwHtlvP4K
         hQ6bCp0FG4ns8T8WbtShZV9iW67HTOlZtTYa4myZrfs3TBr7SbFczkIAMuNVriKE9AgX
         ejbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfhRDqhAth0m5NIIn42efqpJkTm6hUz/DZWZo0LsNvqTw4/78gkfh69MpzTG8JwV1D9PzQqunOh2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCcorn2wGCk/TdEIihp2km7B4vwD9vM9elzjjET75yFgdYZlVO
	/x3stOiOH8Y7IEAfJ0SRELdLc/78ceVxcEQkqcHAcIOF8rny689rexqnj7Qda3Ytpsint45LfPn
	10W4=
X-Gm-Gg: AY/fxX4CFYv+mCM1mNtmzzuMKY3LL2B5TLtZdFzEtVKQwMpT4beDfOXFJL5kwbWwNRK
	I1PWESJ165jsLe8XCxQa9utjXHqidFDaPL2PgRJAEoMkH+4hD94FWqIQh7WFnBZ0cUPgw0tXTXb
	RiGB5VjGmuSuF/D1jH7f/gKYdmhxzwyFKlmR4lROzpBkgwMvxX2quT8Hh52fiUQ7tantCBzHQBx
	E9xkU3B1EWA45aL5BDFtAP1afdcYeJBaxGesZ0CTl98Rdn8omGobtQ4vJ+j26jX1qoOgrJJs/kN
	gKp28SS4rkHED826Mwef4uPkMr69YbqLYVKNCK3KnkAooy1auD1oCnfxdYhupfjK1wWH3m2SFq5
	zcEiCVC51l3P//vXjqM8xXbjE2keze/r8auL1QWUjwtWOgd3wMskrOZk7oLwew/srVmbXgA2Uow
	6v2ggqmtlSN9IU
X-Google-Smtp-Source: AGHT+IGKxSiI3Uf9P9Z1j2X27ol/VysTzOsuH1d9EUVBj49beOTILhE3NO4Wx6CTCm0tYk4jk9tenA==
X-Received: by 2002:ac8:5a4c:0:b0:4f1:ab28:d9f6 with SMTP id d75a77b69052e-4f4abd03195mr190147771cf.26.1766460279389;
        Mon, 22 Dec 2025 19:24:39 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::7e72])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4b1302d44sm88478721cf.29.2025.12.22.19.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 19:24:38 -0800 (PST)
Date: Mon, 22 Dec 2025 22:24:35 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: xhci: check Null pointer in segment alloc
Message-ID: <e2ec66ae-2516-4030-8bb2-51ed5c8918db@rowland.harvard.edu>
References: <TYUPR06MB6217AC2CE5431DC9B3956FE7D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20251220141510.1bc1ef19.michal.pecio@gmail.com>
 <20251222064252.GA1196800@google.com>
 <2025122253-stopper-tweed-6e68@gregkh>
 <20251222085543.4d7430d5.michal.pecio@gmail.com>
 <TYUPR06MB6217CB438F21763401A93E6ED2B4A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <eb5715b5-613a-4610-9852-1a6ae67b4153@rowland.harvard.edu>
 <20251222174934.4c9b62d2.michal.pecio@gmail.com>
 <38822950-6d69-4ad6-be28-fb8f328c8ae5@rowland.harvard.edu>
 <20251222220349.2d6c1a43.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222220349.2d6c1a43.michal.pecio@gmail.com>

[Redundant and invalid entries removed from CC: list]

On Mon, Dec 22, 2025 at 10:03:49PM +0100, Michal Pecio wrote:
> On Mon, 22 Dec 2025 12:03:45 -0500, Alan Stern wrote:
> > There's not supposed to be an inappropriate time for doing an 
> > autoresume.
> 
> > By the time the sound device's resume routine runs, the HC should be 
> > fully resumed.
> 
> OK, if "should" means "supposed to" then somebody needs to check it.
> Is this the HCD_FLAG_HW_ACCESSIBLE flag by any chance?

HCD_FLAG_HW_ACCESSIBLE means the HC is powered and can respond to I/O.  
If the flag is clear, it means the HC is unpowered or in a low-power 
mode or dead, and I/O accesses are likely to cause some sort of hardware 
exception.  At a minimum, they probably won't work.  (Think of a PCI HC 
in D3.  It won't respond to PCI traffic to any but a couple of its 
registers until it is put back into D0.)

> I see that devices recursively call bus_resume() before resuming, and

Are you talking about hcd_bus_resume()?  (There is no function named 
bus_resume() in usbcore.)  That's the routine in charge of resuming root 
hubs.  The PM core ensures that all of a device's ancestors are at full 
power before the device is resumed, so it would (indirectly) call this 
routine if an entire USB bus was suspended when a resume was requested 
for one of the devices on that bus.

I can't see it being an autoresume in that situation, though.  An 
autoresume is one that was requested by the device itself -- a wakeup 
request -- and that can't happen if the HC is suspended.  First there 
would be an autoresume of the HC, and only when that was finished and 
the hub driver started checking the status of the HC's ports would the 
device's wakeup request be noticed and acted on.

> this fails with -ESHUTDOWN if the flag is unset, which seems to prevent
> device resume from progressing further and crashing. Is this what is
> meant to happen in such case?

I'm not sure what code in what routine you're talking about.  However, 
it's obvious that if the host controller's registers can't be accessed 
then no downstream device resume is going to work.  On the other hand, 
the result should just be a normal failure, with an error code return -- 
not a crash.

> So I guess it's not happening because xhci_resume() sets this flag
> right away and then it may drop the lock and start deallocating memory
> to reset everything. So we can "successfully" complete bus_resume()
> and allow USB devices to resume while HC resume is still in progress.

The root-hub resume (i.e., the ->bus_resume() callback) does not occur 
until after the HC's own resume handler returns.

> Looks dodgy and I suspect this is the bug.

No, there should never be a device resume while the HC resume is still 
in progress.  If one happens, it means there must be a bug somewhere.

Is it possible that the HC's resume handler decided that the HC was 
dead, and so started deallocating stuff, but failed to call 
usb_hc_died()?  (But note that resume_common() in hcd-pci.c calls 
usb_hc_died() automatically on the HCD's behalf when a resume fails.)

Alan Stern

