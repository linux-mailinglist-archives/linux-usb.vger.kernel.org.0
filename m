Return-Path: <linux-usb+bounces-28116-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D3DB57EB5
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 16:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FF7A188343D
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 14:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B259731986F;
	Mon, 15 Sep 2025 14:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="rDOSHwbH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30FE301027
	for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 14:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946000; cv=none; b=iqS8uBAaEjstgoAeFL4ljlo9Ivh7lahMh1IIMGx9I+V3M3U6O5bLDXAgV6ZKFocXlgZrY3nVypWYdeg1J+dgiglO1kX9fjSRsnoYqjpRlnoSep/4ZINZfSFbcWpv1nkbspf8TVfKD+PXjju0zBWMtIh3tJ6SA7GrlTXNZm83K00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946000; c=relaxed/simple;
	bh=zQ5QPRiVG3pjuad6CB2bBqliiABHFMuGHTERpYAq8Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RF3YcecQoYkVRLyD1A5Jw+G2+fvnVT86V2ocGHZtcKH25dkEbrI6j+P9DIc+u4ZGFzDSRkBNQBAjuerkFih5J8oOHHTDqwhCs9JP9T83x+tiNBZg8JEfMN7+X2vPC0Fqz7R/oExLgikrmJMBl20Zt58ABimhyYNF6HYd2xQlELM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=rDOSHwbH; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-77766aae0b3so16235506d6.2
        for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 07:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1757945997; x=1758550797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1ltJ3qWgJngyUcXpTPWVqY7F0iklIRp4Gy8Yg/l4qQg=;
        b=rDOSHwbHRD0It61GWPhOenfwvzv/HYS/UtOAUQzCShj4YPOoeWaJqSK74RB+vnrhil
         z28735lVxblFP3z9ppPP2ABidqs11aSN/a7SXybEtjm43kQZ8PgGrwf476Q5kh5zqs0y
         tb8730fOhqF18XPENjN6rjPkUFLsoMr5ZwCBDcz3+wvoDk2Iv4qwO8Difm2PHxfHg8ek
         Y7uVnui3kXtv7sFHLZf34QIGdlYkBQSPn/OwjI6cBJH1c8erjj6KD5mtPG7DPvasTnWO
         X4Ddhn8whIM/Wxg5/gA4xn+O+Od3kZqoL1shX1+jQowFKrz1hCURbBjTMGnxF2QVUjD5
         ndfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757945997; x=1758550797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ltJ3qWgJngyUcXpTPWVqY7F0iklIRp4Gy8Yg/l4qQg=;
        b=B8rDksNHOZ+Afwa6HMMRWt8N84/lMkmf9+2AJKSabA9UxI4RLm6FPtpvE5DKjRVKjm
         a1xV38GTIFGbqwPvmrYLoGCW3gXCbWNrTHsQbmHthKJkEGOklwaGdW2fER33YxLPin0K
         45zTNk23gzReKr3Cmn6XguQEETPkJJeZ52fDpdoT61zHEtTgcwDQGxB92/bz3/94aotn
         BKLXX6CLgs7eLxxkbHK0xADMWMAvMpsoC4wsHtUpD1t7T70q4cnBbN2Aj/xqoi9+OS7V
         3HhI9frnjT2OkRVB1izxNyHDHVAbEcaNL/b4EuGm0FhbKp9U8igb3BwUZ9bF4jUUrSIo
         t7oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfOFtpUO1cdoSzooW+00N3FxzB8Xth72rxL4KC1UVrLe+mkFiXVvlXZ8W/MBlFOXDwmcvjgO+E3lQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBDvsCXLj0BneAqRtufdAFWMOlXJ6qYbF1lqiSLlJeHzB7TZgi
	BFP1qQdRCptGyaT9DeaGnu0gKYzL9rJ2ddApNFWSNTaSxh9xkRK7YulFK0S7427KdQ==
X-Gm-Gg: ASbGncvXyhgPFig+vBiXUTirJiddQ9CoShRwR+nhbPzY12mZhzFLfIe0YKzF2Bp1btU
	6JVTYsbnBvJzUyi4AwiCFCwDdJNgE583LlTcddj/O+fMDVmnUs+hsR1dAWOl7a86Nxy2wAm2ivF
	Zoe26pK2FCXphdYsl314aqX5zIQhkafTU2U+XyfsT8ZTIW1zjAu6Rn0uNn+lncFKxCbc53uyo/6
	wTX4htyh5Tycfa9B4uob6jcYlPVYUd+RPeZgtRYNW2CXzXbXZx4zJGvYWhOmOXBqluMWeRiflGP
	Ll6My7aK+h2pzLP5kikmJfKrgPziggKD3r4CUJYWp0x/hPGUCVlnn9nQ9iZMIId2RZFJbxGzG7c
	MW00YyGgcKHwf90UK8plkz4oraoVq8QnAPulJyLpWOu4k/5c6ugF5
X-Google-Smtp-Source: AGHT+IHNjl6+VXDq55mI2iLpt5yQHDG8LWznTFy16ycII1FKUcMN7wBwyIwufPTVyUH4m6LL8m4d2A==
X-Received: by 2002:a05:6214:2a4f:b0:70d:aefc:359f with SMTP id 6a1803df08f44-767c3771fc7mr157165606d6.48.1757945997437;
        Mon, 15 Sep 2025 07:19:57 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-763bdd36cfasm76812886d6.34.2025.09.15.07.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 07:19:56 -0700 (PDT)
Date: Mon, 15 Sep 2025 10:19:55 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Lizhi Xu <lizhi.xu@windriver.com>
Cc: syzbot+205ef33a3b636b4181fb@syzkaller.appspotmail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] usb: mon: Make mon_bus::lock a raw spinlock
Message-ID: <4f7805f7-805a-4678-8844-c38a97650dda@rowland.harvard.edu>
References: <68c4cfc8.050a0220.2ff435.0369.GAE@google.com>
 <20250915012914.361334-1-lizhi.xu@windriver.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915012914.361334-1-lizhi.xu@windriver.com>

On Mon, Sep 15, 2025 at 09:29:13AM +0800, Lizhi Xu wrote:
> Interrupts are disabled before entering usb_hcd_giveback_urb().

This needs to be fixed in the usbip driver.  There is no need to change 
usbmon.

> A spinlock_t becomes a sleeping lock on PREEMPT_RT, so it cannot be
> acquired with disabled interrupts.
> 
> Make mon_bus::lock a raw spinlock so it can be used with interrupts disabled.

See commit 8d63c83d8eb9 ("USB: gadget: dummy-hcd: Fix locking bug in 
RT-enabled kernels") for an example of how to avoid disabling 
interrupts before calling usb_hcd_giveback_urb().

Alan Stern

