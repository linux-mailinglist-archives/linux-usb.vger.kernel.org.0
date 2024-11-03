Return-Path: <linux-usb+bounces-16973-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A8B9BA397
	for <lists+linux-usb@lfdr.de>; Sun,  3 Nov 2024 03:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A888A1F2166A
	for <lists+linux-usb@lfdr.de>; Sun,  3 Nov 2024 02:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A926C70821;
	Sun,  3 Nov 2024 02:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="fEeUBh/4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DF445979
	for <linux-usb@vger.kernel.org>; Sun,  3 Nov 2024 02:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730601290; cv=none; b=k7WqNEg/zMJdlLzf8wAQ1eW/wCH085ATyox74ko8kcEx8yvSLRS2xiCs+PO4qFX+b9T0g7y0VYMSgy3z6DBhnCXxdjDTVzsKtpNlm0V6piMrtLSFZt9cYVUZT78TwjdoFnEKMNK/o/xMziToc96H8ZOoH/4AK2HGdKmVVIIuATM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730601290; c=relaxed/simple;
	bh=LuHVLAzMFk6hZvNyWTAy35Xv1KQMBx3TENN5kbLp3NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e3xzFUkLrVjSAyLcxHgtJb5qIP/yXvE04YJAvXs/F3NRqinhTtj2/4x/Vx6Hg6BwPRCk8+bxxt45MjoejpPnl9YT4+arryUo5l7gkutB5E+exIFaExwaw3XmNU1mB8MQyDQup/HypFNmzlny0Z8CBoAAoK+cseNE9kD+vI7SlcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=fEeUBh/4; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6cbceb48613so21918166d6.2
        for <linux-usb@vger.kernel.org>; Sat, 02 Nov 2024 19:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1730601287; x=1731206087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=simIhPgZ5INGYc/Ss0nsrTipLp3khz9bO6neanpU7S8=;
        b=fEeUBh/41+JqkQfY7wApz30WszSsbLcl+Efd2t3T63Ljsy50LRTBCfIXc34J1uHbFs
         UBYM2jZfGBDW+RHzQisKlxbcI0PFMI1G7fB9vNKstqnJOdEkRwwpX+KATv2pNkjFG/iZ
         tzqoBp1dJ4vx51q4gBYOCzfZPeE+VGQoNNrcUiEtHuZMQqpZ0ett9fpk3fPRrhtZUFzA
         rRng8dDo8fgUknjACIvlSS+/Chl5DdMs9zluHWLQKDa2nPTuSDfZ0bPqNA9LDJgMdg2w
         c9DA0oqJAquLleP3EBTvGAE/7qFj/AHaFQpVxF5Y2pNjlef7fq9Cd7Ki66137vMPyTRZ
         Zpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730601287; x=1731206087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=simIhPgZ5INGYc/Ss0nsrTipLp3khz9bO6neanpU7S8=;
        b=bNroZ4BCVCmVjazgvq8FvGOpeDUBRDA29zbtcwe3XgdqUPrKyw0u4sGQ6CkEEoTKMo
         Y9i2q9UgjGx6KRFr2jvIvk4kITf5cmAas7BNe091lt5XKh53CZO2O8enhHmW/u+gMbDl
         nqkJsVZMv4Kan0Jj7kXeHIZjBMuswxhoL5Dt0JQxc6+W/Gm496gkvOhOhgzJuj46db+0
         lx0R/zLkuauKE6VU8QF/xYoa9PsncDoKdiQBF+mOf8tAhKYlPlIndzTrb+91w6jGUHCY
         xzl7mxlaF8m+UrV8jwdY28x4jPJiTSDT8EyAVaj8fxBymzuyXRWbJNqP1k41dTfdeXWu
         BEvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8ApWinNzQDF8FlJ19GdPwZAJG1LixB3nHpS1vO13Qilq+H0To6ECEcRHTR50lBXEHQdNPoiGHLYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQwq4PxvS3Z4zi3scu4mHZkdpoFST9FaOUFayFJ6veEj71jrFq
	lJcwB0sNvofgSvH8fCBIzkzt2a9qlVC7bDZpe7phpLOIj67L30uKFGoRH/iHMQ==
X-Google-Smtp-Source: AGHT+IH7yVTD8FxIYa8mCipU6770krMfSM0TSaUdVx1gt+8Ibey/D/2ABlCQwBetVu2yThisWhr8Mg==
X-Received: by 2002:a05:6214:2b93:b0:6cc:42d:bbb with SMTP id 6a1803df08f44-6d3460e4899mr152415956d6.53.1730601287198;
        Sat, 02 Nov 2024 19:34:47 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::9dc2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d35c73440esm24669676d6.63.2024.11.02.19.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 19:34:46 -0700 (PDT)
Date: Sat, 2 Nov 2024 22:34:44 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chang Yu <marcus.yu.56@gmail.com>
Cc: andreyknvl@gmail.com, gregkh@linuxfoundation.org,
	viro@zeniv.linux.org.uk, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] usb: raw_gadget: Fix a KASAN double-free bug in
 raw_release
Message-ID: <cd15266d-bdfa-4cfc-82d9-e7ba9c1b4301@rowland.harvard.edu>
References: <ZyapVdMqauFmeeng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyapVdMqauFmeeng@gmail.com>

On Sat, Nov 02, 2024 at 03:36:05PM -0700, Chang Yu wrote:
> syzkaller reported a double free bug
> (https://syzkaller.appspot.com/bug?extid=3e563d99e70973c0755c) in
> raw_release.
> 
> I suspect this is because a race between raw_release and
> raw_ioctl_run.

This is confusing.  raw_ioctl_run is called directly from raw_ioctl, 
which is invoked through an open file reference, so while it is running 
the file cannot be closed.  But raw_release is called when the file is 
closed for the last time, so while it runs there cannot be any ioctls in 
progress.

Given this, how can the two routines race?

A debugging patch that shows what's going on whenever the kref is 
incremented or decremented might help clarify the situation.

Alan Stern

>  While kref_get in raw_ioctl_run is protected by
> the spin lock, all kref_put in raw_release are not under the
> lock. This makes it possible that a kref_put might occur during
> kref_get, which is specifically prohibited by the kref
> documentation[1].
> 
> The fix is to ensure that all kref_put calls are made under lock
> and that we only call kfree(dev) after releasing the lock.
> 
> [1] https://docs.kernel.org/core-api/kref.html

