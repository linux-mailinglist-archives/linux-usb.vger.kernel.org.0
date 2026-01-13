Return-Path: <linux-usb+bounces-32293-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 759CED1A328
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 17:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96763300FEC0
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 16:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE4A2D8797;
	Tue, 13 Jan 2026 16:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="cX36y3LO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3A61A2392
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 16:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768321368; cv=none; b=kTiZ4GUVqe2A4EBQWtPUq2km1y3guVHRmYGC6rLZmsTfDr+Vei+ulubQ5+MaDTdhXw0qWEoYIBxXv0CqdqWhKPW4Lh9wQ6dAgSk9QHHUq+zjc+dFS1qIGZctazd0eI2v3UJKLB7rhFWvlDZ4usgiROwYt4HHYkpoo71alYFUT8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768321368; c=relaxed/simple;
	bh=qgUSiS7edCa80dD5CHPMKtsgWFpXgSvjMxjdeWpzQSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmrH2NKJQomJueLIEoPQYZqjuNIhWL5wAoa2txegdYx6E9DE6vNkvLo5SZZKnuHFU7v2CsshwFjQkQclWDYtu46RFzXdN3rMVX0ukqY9l+U0mZ/EdvVN/Mbt9GW5Yq+dMcZURJzOy2iiEGaNlcvLX6h3yTOyvp4ZSH6JR3NOnV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=cX36y3LO; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4ee1a3ef624so47362511cf.0
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 08:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1768321366; x=1768926166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X74vWYnBsqzGHyfTnqM4DKdfP76kV6yU74BIUcrrZcc=;
        b=cX36y3LO5aQ8V45PGAlZsCjUp1l2KcdR7IPZ2gGManu1R23yOb3DzCkP3DfcMDLrNg
         L1Vn0170vQwTkVS62xEdkWNeAkj23ivc0KhERm3wZAYKp6qPgxog+CAt9D4nnuRf5keh
         MZym0JoY+LX1OehXw6BtqlL2gfRAarU/XA8WiA2T1YjUbwb8DQxxqYPQjlS36h1YsCcr
         x4y1Y60I8ZRyn2x0t38LS21U2RiB0x6FAk2bQtBNawYA3VWlgIvan8G8Mew6oMb5PxWB
         BikkNzPi3foovxdO6lqN8kY9AQV4n2ZslCzA5WsCpI6xFtYO/zOVde6eDLcy7q/hfE8R
         kC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768321366; x=1768926166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X74vWYnBsqzGHyfTnqM4DKdfP76kV6yU74BIUcrrZcc=;
        b=o5Hy4qdL9tWw+Hp+n0JMvym58W2IR5M3JF1BK1y1L+SxLAzWc7uclYWljJHBC5esqp
         N5jmoYQ/mRMr8v5eA3JeNSNxSiFdqJw1asLZhiLTtff4YVDdJQn74ZrWWRZrDyyg6UKo
         7EhFo/FTBwTWNqb2wlt2PdFa93ggIYv4nAhxVod5Zrr80NtCjOuKwiKWXxOapZ+JBzK0
         I4EgQ/rVUp3UoSYdEONmvJcJTWS77zZcsL732/TNmXOYaF0V5SIgPUqbGNDI35LKsJvK
         YI+4XB7/g9NEdtKh64I6paOpHuIyQ0pYzmfjS+l/+IFfGziW9F0kxdzHO/IxOfFcFbgf
         8DqQ==
X-Gm-Message-State: AOJu0YwCyRehllt3sr7w33pF5Y0uMjvdJVDgVlTPE2E9zo38cXXIXBUW
	yFiFIXEfem91FVb77AbzSbfMeFn4i5olQX3tKsIHJanCm7X5MhBVdDWzUtl7GyMVYA==
X-Gm-Gg: AY/fxX6y5zyD8/VsCII6ZQ7/xlko2oBJM2LOnOHicv1umNUAEEcO1CMaflfaJevFJEH
	JMMEipwt8P1CTHs+DglbrKCB7zZKsk7KIrijWaw7ZmbC6yjp6law+pfm4fRiufV/1Ay9ogThIC+
	lL70iWDAI8syh/Bm9onbMSR0HSKWPIRIcJy04SwTfJ3MtqiGTtDFDSvauhzd2X4v5AEpzyyPSXD
	cTcsVKslatQitM/DFbMlLfkI2hvy8JtGUiv2DT3p92IkeuOJ9m8sY5Aw4AsB4waVlfxgGXP48Hw
	wjycM5/l+al2UlQWl09Qt0raQNpjaIXCxm1J0x6DorAyNEI3EgBN3jrlaQFo6FaHwDuc7kA8F33
	D7AoN7Q9T9/18hOPPQZmoiKvvbvOgJFJG3HNNwQl3u9k4FSFz5ppZCKelPitczGU7sNkFE9MPQB
	Cw6iihIvny1Agz
X-Google-Smtp-Source: AGHT+IErkjpWa120sFbKMAdCMCgyMbzGdCF7VgpTh5sizxo1ArqrW9ocmCNmPhmTtyPd14FP/67arg==
X-Received: by 2002:a05:622a:11d3:b0:4f1:cd0c:80f6 with SMTP id d75a77b69052e-4ffb4a44431mr309936451cf.49.1768321365696;
        Tue, 13 Jan 2026 08:22:45 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::7a0a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8d6d2ffsm156409631cf.15.2026.01.13.08.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:22:45 -0800 (PST)
Date: Tue, 13 Jan 2026 11:22:43 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: USB mailing list <linux-usb@vger.kernel.org>,
	linux-rockchip@lists.infradead.org
Subject: Re: Track down EHCI and companion errors on rk3xxx systems
Message-ID: <b9041d32-1eab-4428-ab2b-769daefdbdcd@rowland.harvard.edu>
References: <073879e4-aea8-4625-bc83-c4b6dd9c9231@rowland.harvard.edu>
 <DFNI1Q9N7GC6.20PN0RG9LRAQF@cknow-tech.com>
 <38365c37-b125-4ffb-8ce7-bd4f3f7596ba@rowland.harvard.edu>
 <DFNLGSUWJA5Z.3OJHVYWST2YFH@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFNLGSUWJA5Z.3OJHVYWST2YFH@cknow-tech.com>

On Tue, Jan 13, 2026 at 05:16:05PM +0100, Diederik de Haas wrote:
> On Tue Jan 13, 2026 at 4:47 PM CET, Alan Stern wrote:
> > Is this repeatable?
> 
> It doesn't happen every time, but it did actually happen another time.
> After that test, I shutdown the device and unplugged the keyboard
> adapter. Then I powered on the device and waited till it had completed
> the boot process.
> Logged in via SSH, retrieved my usual boot process data (what you saw in
> my 'paste' starting with ``uname -a``) and then did ``dmesg -W``.
> 
> Then I plugged in my keyboard adapter in the bottom port and noticed it
> didn't work (straight away). This time I waited, pressed various keys on
> my keyboard, turned the keyboard off and on again, pressed some more
> keys ... and after ~20 (or 30?) seconds, my keyboard started to work.
> When I then switched back to my SSH session, I saw dmesg had (then)
> printed messages indicating it saw the adapter plugged in and ``lsusb``
> did see the device.
> 
> But that ~20 seconds is key here. Normally I would conclude that "it
> doesn't work" after (say) >5 seconds of nothing happening.
> 
> > If it is, try doing the following.  After a fresh boot, log in via SSH 
> > and turn on dynamic debugging for USB:
> >
> > 	echo module usbcore =p >/sys/kernel/debug/dynamic_debug/control
> >
> > and clear the kernel's log buffer:
> >
> > 	dmesg -C
> 
> Would ``dmesg -W`` also work?

The point is to get rid of the everything in the log from before the 
time you plug in the keyboard adapter.  If you want to use "dmesg -W" 
and edit out all the initial stuff by hand, that's fine.  I just don't 
want to see it, because it's not useful and will only make the report 
harder to figure out.

> > Then plug the keyboard adapter into the non-working bottom USB2 port and 
> > wait a short time (say, 30 seconds).
> >
> > Then get a copy of the dmesg output and post it here.  Also, check to 
> > see whether the keyboard is working.  In fact, you should check the 
> > keyboard during that 30-second wait, so you will know just how long the 
> > delay was before it started working.
> 
> Normally my SSH session is displayed on the same monitor as the desktop
> session of the Quartz64-A (I switch between HDMI-1 and HDMI-2 input
> sources of my monitor). This makes doing any kind of precise timing
> activity impossible. I'll try doing the SSH session via my laptop, which
> hopefully allows timings to be closer (but likely still not precise).

Exact timing isn't important.  An approximate number that can be 
compared with the log is what we want.

> > Another thing you can try is to force the necessary module(s) to load 
> > before plugging in the keyboard adapter.  For now, a simple modprobe 
> > issued over the SSH connection will do the job.  If this turns out to 
> > help, you can configure modprobe to load the module(s) automatically at 
> > boot time.
> 
> I was already planning to make it built-in as the chances of me not
> needing USB2 in some way, are quite slim. And they should (hopefully)
> prevent such issues and I'd have a warning less in dmesg.

Okay.

Alan Stern

