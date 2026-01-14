Return-Path: <linux-usb+bounces-32339-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CB0D2019C
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 17:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8704D309A5ED
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 16:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490C13A1D15;
	Wed, 14 Jan 2026 16:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="mOAHnV3k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAEB3176EE
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 16:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768406869; cv=none; b=SiTKxD6w+n5djFfXckyUnLJpgGCgxrCCS+bqrfW4e5hPrCc1g+ybVu9j+CFXlAvYTv0QaedRj7GQiWGHNc57EsvO76DZ0w8pv1A4bhYtq4lDOqyH2ooFKLy+A0tfx0fkxdvCSLY0dCU5M/To4Iyj0iQl3H/tgd7voS5xrGLp2C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768406869; c=relaxed/simple;
	bh=/RzWcGs7/ehTRGv2/VJKjpBFkmFgm+JqX5m70TUVj5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bKs1MWS7YCvfGxT0Fvse1ugoQuehvF3OWNvZJH8gq/X+UNdl9JBB+WmWun3UNPMrZtgl6d2WoRynkO96o92dU2hiz3j1tzIecL3jnlqezzqJuLZ9uO4GxibHcTpcPavICDEay0QSZvRaZpd5adT6MLYRNabeVqz1pZFd1hSm8BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=mOAHnV3k; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-88ffcb14e11so97633306d6.0
        for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 08:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1768406867; x=1769011667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0w8zIqQECJAGujQJ53HaaQtSuGI0B6FUk93HelliUNY=;
        b=mOAHnV3kmfB3UL2KTOe6m4faTeTq21tyggXvR/0p7yVCr7hSYn1xe51aGhAfR0TWeI
         XfsJJqKLysXkaDYrwRfM2MEremsfs3bLxEUkOjZzE1dEnYXGVRFlA26YY5Zssv3F8lhO
         p9piA6opupPD4A0rXHaC0tL/x8M7WWcOOO9LhKQ4y3cWAJaUVl81rsQAZzvmFWc+P7lh
         2dFC4EvxS8wToSlATVzY852+/pAx3K4lV9ADjX1ghd0RwScZnLXtxj/CcKWdxqli32ZT
         2DDMrEzWgy8qjLooNI5TyEqNvtq6Ftr3OItDdsqReb/SmbiCDVGAR5yVjWDBUD4n4pUe
         Ru5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406867; x=1769011667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0w8zIqQECJAGujQJ53HaaQtSuGI0B6FUk93HelliUNY=;
        b=aRIMFg+nkswoLiZFUr9PCval6vfKIBALKZ8Ir8t73/yzQd3eSnaOUhbzvQlQVe+Juu
         ZaqUhVKy6RFXytnHTT2SHjzBzH+yTPPLvo7gs7VH5Hk/yCqloS3GeU7BpnSyQzblf/eB
         fpISfc5N7OYeDHLI+yL0e2KHU2DHUbAHT84568DJuPqrbSuGS5zGQYyzgFVscG8EQ3p1
         5rx1BL2ibyllus9l8qWeY6sKuM66MEHibKUJ84rNMp/nKXGI+iuT5H1U1gZmyAXHgAje
         je07oes4NG3fOeT0f6KrKPStk92qrQG00uj8B1DJyH+d41F4jiSGPDi1fUJxqJu1KJUH
         o1fw==
X-Gm-Message-State: AOJu0YwPvznqmpuw6a01qJ5R8YNgIufZsioK2HLR2hmrYD/hfyNgyAYv
	xlO4SOWyJ7roG84kHEgAoTJnZhz7sh3GqvT90Qd+PMX+EHj3Ica97sedej1OS3KPxQ==
X-Gm-Gg: AY/fxX7gzd9orIA2U7FaisynQWre2npbmXdICznIy7cg4VOAXfXL71WQ27oD4I4MQ0/
	1xm6Gn/A8iM65WuDMz5RyQmq1aURFCJM99UrzvzeUkvC1NNk1AiYMCrJ3HcfkOUw1JFuAm5a8sm
	XVAGZbF2yzxCttVGNMOtwRNaM+z6B+D5RXnY+/6s+2HZOkNXvJZ49JL0eiI9Mg1yXmvFFzIrJ3o
	APjPE0zdAOt0sCj9cms2B3UmdTEL5h+ySyQ6Y7FDBA/f0v7PSaiw89wOsIa5uD9vuHyI0/y/zgL
	WT4PdSFzb/Y8vhC4uJqbV5DeFDLUWn7h/EKgpKSAWFQIXQ7aHGLV4sgjPaMM8dj7YXs6nTVnmQM
	38Q2F7dwTERhXaEyTgqIW82L7ORWHMubX+yvIdUlYOHhhxClEAIoaN9u2l13cGjHd6vu33im1FJ
	OOpHGo6NixgSyvtfEhhjirkCUXwD9qLSN35d1oD1tC
X-Received: by 2002:ad4:5be5:0:b0:888:593d:c08c with SMTP id 6a1803df08f44-89274390c21mr42145126d6.20.1768406865775;
        Wed, 14 Jan 2026 08:07:45 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907728565dsm172303526d6.56.2026.01.14.08.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 08:07:45 -0800 (PST)
Date: Wed, 14 Jan 2026 11:07:42 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: USB mailing list <linux-usb@vger.kernel.org>,
	linux-rockchip@lists.infradead.org
Subject: Re: Track down EHCI and companion errors on rk3xxx systems
Message-ID: <febe88e2-9abd-481e-af9d-3f0825ef204b@rowland.harvard.edu>
References: <073879e4-aea8-4625-bc83-c4b6dd9c9231@rowland.harvard.edu>
 <DFNI1Q9N7GC6.20PN0RG9LRAQF@cknow-tech.com>
 <38365c37-b125-4ffb-8ce7-bd4f3f7596ba@rowland.harvard.edu>
 <DFNLGSUWJA5Z.3OJHVYWST2YFH@cknow-tech.com>
 <b9041d32-1eab-4428-ab2b-769daefdbdcd@rowland.harvard.edu>
 <DFNRUF2LUPH4.1493G2SYERZ7Q@cknow-tech.com>
 <b108b747-cc7c-4537-b9bc-b0862bac71ff@rowland.harvard.edu>
 <DFOEGOTI1AQ9.175GP7V1VK1XU@cknow-tech.com>
 <91fb697a-7bfa-4e26-85cd-40810a8d2be5@rowland.harvard.edu>
 <DFOFCN7H0Z10.1FAC3SN3TX79O@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFOFCN7H0Z10.1FAC3SN3TX79O@cknow-tech.com>

On Wed, Jan 14, 2026 at 04:41:13PM +0100, Diederik de Haas wrote:
> On Wed Jan 14, 2026 at 4:19 PM CET, Alan Stern wrote:
> > 30 seconds was a generous estimate on my part; 5 seconds probably would 
> > have been enough.  However, the USB subsystem does include some timeouts 
> > that are 2 seconds long and others that are 5 seconds long, and some of 
> > these timeouts are inside retry loops.  So a 30-second wait isn't 
> > unreasonable.
> 
> But that's all processing times *after* it detected a USB device?
> The thing that really surprised me that it took the kernel a minute to
> detect anything had happened at all. If that had taken 30 secs, that
> would've surprised me too. If it then took some time to make the device
> fully available and operational, sure, fine.

Well yes, I wanted you to wait long enough for all the initial 
processing (making the device fully available and operational) to finish 
up.

However, I agree: 30 seconds is _much_ longer than it should take to 
detect a newly plugged-in device.  It should take less than one second.  
One possibility is that something involved in waking up the EHCI host 
controller from its runtime suspend may have caused the delay -- that's 
why I asked you to try turning off the controller's runtime suspend. 

Also, I'm not at all familiar with the particular hardware used by your 
platform for receiving wakeup signals.  It's possible that a GPIO 
responsible for this wasn't working right and that's why you were 
getting all those warning messages.  Another reason for wanting to know 
what will happen if you take suspends and wakeups out of the picture.

Alan Stern

