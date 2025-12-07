Return-Path: <linux-usb+bounces-31245-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 80442CAB83C
	for <lists+linux-usb@lfdr.de>; Sun, 07 Dec 2025 18:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98ED930052B4
	for <lists+linux-usb@lfdr.de>; Sun,  7 Dec 2025 17:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4447A2BEC2E;
	Sun,  7 Dec 2025 17:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="PU2iqDAl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6AA26CE1A
	for <linux-usb@vger.kernel.org>; Sun,  7 Dec 2025 17:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765128143; cv=none; b=eOupbTrxAhomUfXvX6EAc8LCEjiocDW5zm48lgvz2ic1gem5MyLvJ1c5SFoO9BSv49bpWIv7hXYXHQ2IXlh1u+GtUyp82/7h5QAgUCs4bb3JVYu555pfDbCkcAAbonaAyculfA5UxnjjcYyHoE7NSJikvID+G0d1hyQ4Y+1DTO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765128143; c=relaxed/simple;
	bh=SJTikFcwlXEZVUWcVqm4rqbJuEmld60p/yz21tS1jc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4sTCrxRhvQuymZbPhSnHZGANEezjHF4YaHRalSMjw/aIu6xXNmZFsMSWRQZD2ulF7CSKD+838ep3ia+hLIzmAFKHHjSTwcER+x1XqXiFk1aw6dyNgz1+8kfdGSzateNR1uR9mfL6TQHaxHKeuy+9HJIZZE54xyYBImvaf8P9Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=PU2iqDAl; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4ee19b1fe5dso42483791cf.0
        for <linux-usb@vger.kernel.org>; Sun, 07 Dec 2025 09:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1765128141; x=1765732941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IaBKvGNbmPA24hm7L56qi1Jh7KC8A8oGFjN3eRt1eX0=;
        b=PU2iqDAlKYDXPEDgpCYnuf9MgRT2WZAVI0NmAp1h2E2NzDESlTrTQ8C7MrqlQKXHFw
         D95lhggZPWD8aaQJWN6kxMlwSY5De5CRIB6eSqFJd/KUoFGFA56x4Bauv/Sjxvsxe1L2
         FKBx28TIxjlFGlEU/faajhnhbrN015NPXXZdvHxopB5KHFQpUvPnvFWDyVFN8xzl2c12
         2gIM5KGzrpbDEVmDKO4eALCFIha8eoFAsDhRK9GXyhocf7qIqL2zdYPBnjSDm/RWUUzL
         1SEqcik1bwDsN7LVXNefAu/JJo8WQpX10sqLJ1gmaDW4m1ZVfrO+/GkcFK5M92mLkW8W
         YYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765128141; x=1765732941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IaBKvGNbmPA24hm7L56qi1Jh7KC8A8oGFjN3eRt1eX0=;
        b=h7DMSmKlVeqvJRgAoBPaAl5gHrOYtiRsz8gp0pOTj9I8GOVO0pQWkUGaMs2JLgvAG1
         hlMjrEpIKKPVmCi/qELr06WgPc4wiMA712RUwQSTsqB58/iRCDgY6gRLsbXY2H5XMIGS
         Nmek9Jsa3vIUMiR29MTdChdZB74K4pM94c1Es/psWlwfGZDl4owTvx+TH5QR8o8jz2Qw
         uB1WWBTl14dHGUNNLmXHh84H5gh16AMi56B7/fNIp07qd0wZJHUPHM8eeWZW0ETh1SY0
         2KES7ETQnh+0lKyWpdkxtSr3ndXqgLa4XZKQVXuNIh5X3HKNtjJh2K16u4imldsR4Cwg
         lDaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIU4NGNpbeeLv+MPxdnYVSK1TD1YAsTa6wIhStwnHtl3O3nQWTohtg+Y/3oeyWep9xnO+thbuoWUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjZUjTiriuqOHUwZITIZ7UDvn8Kmv6wFVWz7tJY4gydbiQgVmj
	9w4jymH3iqAkPaqFl4aWPvJHg6WB8Y6hlP/4zyZiUkRCjoAkZrmsCKDTLEDaCB0uxQ==
X-Gm-Gg: ASbGnct8cB3po70/v5xp00v7I7i0d5xGb5iezk/ysJswMtscU5VycSzHSDcIJSJ0bDb
	Jn6Bc/VD/qTRRPFmQaoa6FFUFyFgcwMGfQkA9fU+tLOrH3dTHRH9m056GE8gLNMIO/ubpyr31Vz
	uPtoS2ZnQJwyPwpCkNPUIve4/p34Lkbh7qVOTCbU+8wKS/lgKJ5qkTv1FTi/TY8HadCNNQPRrdI
	JLpxH5y0n+5lH8YjZ+fU7icRMv/wGQOQqDpDIOcE1WkKmitLpSQrCoOcJRLGU24b+6zklAYn3SJ
	TaPF5LJ3SSGtm9X/0cQh80whcYEbxxMix0bGdeGbkJ3oVNhvlr7JTy/SidcGLF7AC0Dz7uNQA4+
	vazOaFPAuwMp+zsuAGpkMfEIZEjJ3YTj+du0gRY3JQnpSZqsdAxkd7uN6R4WOzrkxx+s+FKxFyU
	+5GiuEpL4wJCTL
X-Google-Smtp-Source: AGHT+IG3PPiH/wd0NRHdGA4b4MDB43lGr8RK+nSJFxgV9IBt8f0m2kr2VFz89qCUNRi/H5k98ohH7Q==
X-Received: by 2002:a05:622a:44:b0:4ee:24fc:bea3 with SMTP id d75a77b69052e-4f03fe48289mr85401061cf.35.1765128141143;
        Sun, 07 Dec 2025 09:22:21 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::2aa9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f027669f3bsm64764611cf.6.2025.12.07.09.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 09:22:20 -0800 (PST)
Date: Sun, 7 Dec 2025 12:22:16 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: "biju.das.au" <biju.das.au@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 0/2] usb: host: Drop resume calls on
 {e,o}hci_platform_suspend()
Message-ID: <75630ef1-0367-4ed3-b286-664b63424f52@rowland.harvard.edu>
References: <20251207124742.96526-1-biju.das.jz@bp.renesas.com>
 <db985cbf-4813-44d1-a4c6-16826f935c17@rowland.harvard.edu>
 <TY3PR01MB11346E9D561CAE53CF47F7C0886A5A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346E9D561CAE53CF47F7C0886A5A@TY3PR01MB11346.jpnprd01.prod.outlook.com>

Rafael: Please see below.

On Sun, Dec 07, 2025 at 04:47:54PM +0000, Biju Das wrote:
> Hi Alan Stern,
> 
> Thanks for the feedback.
> 
> > -----Original Message-----
> > From: Alan Stern <stern@rowland.harvard.edu>
> > Sent: 07 December 2025 16:36
> > Subject: Re: [PATCH 0/2] usb: host: Drop resume calls on {e,o}hci_platform_suspend()
> > 
> > On Sun, Dec 07, 2025 at 12:47:25PM +0000, Biju wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > As per the suspend_devices_and_enter() [1], if .suspend() fails, it
> > > invoke the .resume() callback.
> > 
> > Quite wrong.  If .suspend() fails, the core assumes the device is still at full power.  It does not
> > try to resume the device.
> 
> If there is a failure on any device it aborts suspend and jump to Resume_devices that
> calls .resume_callback(). Please see failure logs of PWM device failure[2]
> 
> Recover_platform:
> 	platform_recover(state);
> 	goto Resume_devices;

That is true, but it is not the full story.

> > > This patch series drops redundant resume() from
> > > {e,o}hci_platform_suspend()
> > 
> > These resume() calls are not redundant and they should not be dropped.
> 
> ehci_resume() is called from both failure and resume path.

Yes, but the resume path will not be called if suspend fails.

> Maybe it is OK to call ehci_resume() twice. One from failure path and one from resume().
> 
> > 
> > > [1]
> > > https://elixir.bootlin.com/linux/v6.18-rc7/source/kernel/power/suspend
> > > .c#L519
> > 
> > The message on this line has no bearing on what you are doing.  It merely says "Some devices failed to
> > suspend, or early wake event detected".  There's nothing about invoking the .resume() callback.
> 
> See the logs[2] in case of failure.
> 
> 
> [2]
> [   47.965220] Filesystems sync: 0.000 seconds
> [   47.971883] Freezing user space processes
> [   47.977739] Freezing user space processes completed (elapsed 0.001 seconds)
> [   47.984772] OOM killer disabled.
> [   47.988065] Freezing remaining freezable tasks
> [   47.993681] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> [   48.001143] printk: Suspending console(s) (use no_console_suspend to debug)
> [   48.077166] renesas-gbeth 15c30000.ethernet end0: Link is Down
> [   48.081846] pwm-rzg2l-gpt 13010000.pwm: PM: dpm_run_callback(): rzg2l_gpt_suspend [pwm_rzg2l_gpt] returns -110
> [   48.081937] pwm-rzg2l-gpt 13010000.pwm: PM: failed to suspend: error -110

Okay, here we see that pwm-rzg2l-gpt failed to suspend.

> [   48.082157] PM: Some devices failed to suspend, or early wake event detected
> [   48.091749] dwmac4: Master AXI performs any burst length
> [   48.091829] renesas-gbeth 15c30000.ethernet end0: No Safety Features support found
> [   48.091924] renesas-gbeth 15c30000.ethernet end0: IEEE 1588-2008 Advanced Timestamp supported
> [   48.092073] renesas-gbeth 15c30000.ethernet end0: configuring for phy/rgmii-id link mode
> [   48.100718] dwmac4: Master AXI performs any burst length
> [   48.100791] renesas-gbeth 15c40000.ethernet end1: No Safety Features support found
> [   48.100875] renesas-gbeth 15c40000.ethernet end1: IEEE 1588-2008 Advanced Timestamp supported
> [   48.101016] renesas-gbeth 15c40000.ethernet end1: configuring for phy/rgmii-id link mode
> [   48.149094] usb usb1: root hub lost power or was reset
> [   48.149136] usb usb2: root hub lost power or was reset
> [   48.361219] OOM killer enabled.

And here we see no sign of a resume for pwm-rzg2l-gpt.

When recovering from a failed suspend transition, the kernel resumes 
only the devices that did suspend correctly.  The code that handles this 
is in drivers/base/power/main.c, and it's rather intricate and difficult 
to follow.

In short, dpm_resume() invokes the resume callback only for devices that 
are on dpm_suspended_list.  Devices are added to this list by 
dpm_suspend(), and if the suspend callback fails they are supposed to be 
removed from the list.

However, I don't see any place in device_suspend() where an error causes 
the device to be moved from dpm_suspended_list back to 
dpm_prepared_list.  Maybe this is a bug and needs to be fixed.  Or maybe 
I have misunderstood something.

Rafael should be able to explain this.

Alan Stern

