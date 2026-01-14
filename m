Return-Path: <linux-usb+bounces-32336-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9530BD1FB31
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 16:21:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7303B302DC8C
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 15:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB079320A10;
	Wed, 14 Jan 2026 15:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="BEOemPsa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42B028750C
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 15:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768403982; cv=none; b=ke4p/hpHE2SRAjBOmCISFQsTX8glOikI9ENOM3ZGAv7UmxGdOXwcKHiiiwedo6HsmtYPD0k0751yPLoUjC5nW+L/yVPq57ccDzLK5cnhIoLgHjrcX4dXagfl6odWpM7LkDITv7GcC4KuvMlxw1etzepDEWdoQk8lBV758E8kAtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768403982; c=relaxed/simple;
	bh=+aADKw5HXLYGHf7YWvZ81bbHzTUVpKu2/zifzLNN8Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IdPXZQvMvEVE1x5ot08G+e8qoxRHpQ35xyU8Y0LXibgacmkON1SklNywsKYTpNVHQ0c6IefSnMY/4gvkT2tcUWPaxxXD4jS9IXev6A0dU7g3dmhnmqQShcBSMJFoWPxX7DhuMhBAR9OcBvq7gdzcq/8peCvCU53IPiZ3u+6gKg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=BEOemPsa; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8c52e25e644so113898685a.0
        for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 07:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1768403980; x=1769008780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q/l2dTGi1fcjjWqEh6dTIcofWxSDYplLtwaLtxQH71o=;
        b=BEOemPsavrjSKvVMoPDNX7xYveHMwo0ZuWI0bTUvYjzUdxWUb0fpnC1Fbb+AYI5A/I
         EMaFmdO4RBdLEhHgx1LIf/BUeXS8sS7M8TpdT2dBGRG67tG0X1a8faxHn8m7E3i7px8T
         P2JAqElTqeWGU0NWfEn54mIiM3DX47jkO4wEYdX3iWd0AgjMlHSOmiiaP8hPjKEr9Gym
         a5+6OU5JPOz94QgWAUA1yxc5mL+Oj2yGw3NCeE9z0PmpvoLrfqAssQS1MpuIqWKexXpB
         oM/qnXxrDAdjSn2P8M3EJA63uutyWaXjqG5OGjnpafRZuvRIk3XX1EtliJcnx75qDqeJ
         yVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768403980; x=1769008780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q/l2dTGi1fcjjWqEh6dTIcofWxSDYplLtwaLtxQH71o=;
        b=L8GYgTL/OrLvABRiTdQGhruODuooAAlYepTCaL4RHPixAkQG1ACHZy0YG1uUlRaMKs
         7QvazI7MUQmsUmz3w22qVPo63V60vvdoRLxn5a38l9d+s1K3jwKvLThiZVIb3qIpaLnB
         PLNetNVrKMzoK1OO6p9I/spK/pdB53M4eejJggCIQhymBrbxpp++YhYZUhVKCipSS7Xw
         to8SNRuy2p5bNx6B4fdoTM2yzVzpv97CE69F6oql5GnEWShYW9YB5Tp221uDM060QoxL
         lwuaCPWM1cJS6iMfWgxSynzEsh3WfStqykQNx7iXWs04oMqrIAptE/qWOMK88SM0CNiC
         ZCbQ==
X-Gm-Message-State: AOJu0Yx+Lbts38n8FFSzc4HxAEjtZ8nhlYILs50eVuxzwegXrf1OkrGx
	TLgPOnOdX6LHKQLPuk2V9bZibHvv7K9cn9hQ1lFvpDkqS7B16se00/0eF7+TFyUzgg==
X-Gm-Gg: AY/fxX6+wGrnLEYbJ/ks29TD+qjDhHuKWBq466dQbj54JgqJcuG+R+HMFe39FojkAnW
	Q0dANlVFJKi7C5/CCZGSvkUjWGHN1OWdFCqPatI6Mx2adtvMr6Eij2GQXN5if60tMFk348c1C86
	+9XPLz3Ugin4NRtcbcz+8a3iy3QQaVYXmCul1fjsGltWgHVawHs8pRqFsPxvTTnqaPSTyrM12Gd
	k1H/PdHxqPofwW80FkFqfpwykA+LH70NADGqR7mP93sZ/TXGMYh1TfbMGKmcxTAlrkVHywkKHvg
	aG2M9ExEMgQLZNbgYhDwaQrci9n91XvYlWkBtwpBq3po2xCQJHZtX+hMI34T7gwq38lCo5Mo6gE
	xVySYeOynIRSUqqME38PRzbCk7oBa8TWSXZ2rpB/1wKcLSyMiW7prbyDcskxQZNEZzbsC5+g/kH
	OjcNNAfz6yxdj0ijasijCckasPf7m1Rw==
X-Received: by 2002:a05:620a:2991:b0:892:eeb9:4def with SMTP id af79cd13be357-8c52fb9240fmr397315185a.49.1768403979358;
        Wed, 14 Jan 2026 07:19:39 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530a6c1a1sm179648085a.2.2026.01.14.07.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:19:38 -0800 (PST)
Date: Wed, 14 Jan 2026 10:19:37 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: USB mailing list <linux-usb@vger.kernel.org>,
	linux-rockchip@lists.infradead.org
Subject: Re: Track down EHCI and companion errors on rk3xxx systems
Message-ID: <91fb697a-7bfa-4e26-85cd-40810a8d2be5@rowland.harvard.edu>
References: <073879e4-aea8-4625-bc83-c4b6dd9c9231@rowland.harvard.edu>
 <DFNI1Q9N7GC6.20PN0RG9LRAQF@cknow-tech.com>
 <38365c37-b125-4ffb-8ce7-bd4f3f7596ba@rowland.harvard.edu>
 <DFNLGSUWJA5Z.3OJHVYWST2YFH@cknow-tech.com>
 <b9041d32-1eab-4428-ab2b-769daefdbdcd@rowland.harvard.edu>
 <DFNRUF2LUPH4.1493G2SYERZ7Q@cknow-tech.com>
 <b108b747-cc7c-4537-b9bc-b0862bac71ff@rowland.harvard.edu>
 <DFOEGOTI1AQ9.175GP7V1VK1XU@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFOEGOTI1AQ9.175GP7V1VK1XU@cknow-tech.com>

On Wed, Jan 14, 2026 at 03:59:28PM +0100, Diederik de Haas wrote:
> On Wed Jan 14, 2026 at 4:20 AM CET, Alan Stern wrote:
> > On Tue, Jan 13, 2026 at 10:15:59PM +0100, Diederik de Haas wrote:
> >> I'm now wondering if there's something wrong with the Quartz64-A ...
> >> I already thought that it took way too long before I got a login prompt.
> >> 
> >> In my first attempt I noticed I did NOT have the "Warning! ehci_hcd
> >> should always be loaded before uhci_hcd and ohci_hcd, not after"
> >> It took so long I forgot to keep counting, but most of all I forgot the
> >> dynamic debug command, so I tried again ...
> 
> I know it didn't result in the requested dmesg log, but isn't it
> significant I had the problem *without* the warning? IOW: the connection
> (correlation or causation) I thought there was, (possibly) isn't there?

I told you much earlier in this discussion that the warning message was 
unlikely to be connected with the problem you were seeing.

> This was with a 6.19-rc5 based kernel (with mostly media patches added
> on top) and on a Rock64 (rk3328) I got a whole bunch of these warnings:
> 
> WARNING: drivers/gpio/gpiolib.c:3523 at gpiod_get_value+0x64/0x98, CPU#0: swapper/0/0
> 
> log of a few of them:
> https://paste.sr.ht/~diederik/154c5023a3a50d77f1da2195e7bb9a96f6a88555
> 
> and I suspect (but don't KNOW!) this commit is relevant:
> 20cf2aed89ac ("gpio: rockchip: mark the GPIO controller as sleeping")
> 
> So I'll switch to a 6.19-rc4 based kernel, which is mostly the same,
> but doesn't have that commit.

It's very hard to tell whether this is at all connected to your problem.  
It could easily be a totally separate issue.

> FWIW: I'd expect to see sth in dmesg within a second of me plugging sth
> in, so I was surprised by you calling '30 secs' a short period.

30 seconds was a generous estimate on my part; 5 seconds probably would 
have been enough.  However, the USB subsystem does include some timeouts 
that are 2 seconds long and others that are 5 seconds long, and some of 
these timeouts are inside retry loops.  So a 30-second wait isn't 
unreasonable.

Alan Stern

