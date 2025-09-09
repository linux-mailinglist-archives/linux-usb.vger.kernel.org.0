Return-Path: <linux-usb+bounces-27829-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B75F5B50758
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 22:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 610CD16D78F
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 20:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A9A35E4D9;
	Tue,  9 Sep 2025 20:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aln3b+ZW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1592935CEB6
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 20:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757450665; cv=none; b=LoPtKqgJ9GFwtkJdh9JY6yZjnp9SJcyP49GqJI4W7JX7f+T+9q/DEtD+tGPkqezG3FoGw557wVJQSWvBESxonpAwZm1BHAzDrUXB49hXzFfna1cY0djXpYEPXPtSIKkiH4iuj0a5Za91hozvTHWiCYok+cxm2gW/UdzgyfztCd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757450665; c=relaxed/simple;
	bh=4Rb1yEm46kYBDaw1DBgu4gZefKn3DY0kxe6RsvnZ0Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uZkkeoigNZ2D3AKK/usriFJFADF0XHrCqFYKOJ2/tMKvyHuQ7++TRbAUg5plla7SzieEwdcxh+ptwEVc/j2Olz9dpVY7MGo68e9EdjMnRoKX60WLoqhG1RnPWWW0jD2Mg2z96+eiDB257jcFFzT7zEQrIGp1bjFj+0MJyxTI6jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aln3b+ZW; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so5655147e87.0
        for <linux-usb@vger.kernel.org>; Tue, 09 Sep 2025 13:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757450662; x=1758055462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzBRzvKW2zdhXk7uB4HX6mdUtJFNu392EQuszh5zjhE=;
        b=aln3b+ZW92Dyn0gbojk0kAf5oyOveA7RstXyq5RNFA4F5qWoZpTG/pph87Y1s/YcFU
         9OXfH747u1Xbe4XQDOSFazW9eqIyfx01h2KQpI4kjG3wlaNHwyB+iGS6b9fP+7L/+wQK
         RPazEG9Pzt5g9RGdHIUK7V1Ycs7rzs1tEqoykbioXwJpcaYoI9IJN+z36qW8BRfHxoBP
         lsZodMiUOz+M2NGbJghmqwvivVQfIShl4wxzidDGZjuzapk6nD/Ym6Qqm4UqLOeJAp/A
         FP6ogEqUkYOydRludpWZ2zaNbvO80E3w0LTSlOnVsoRnKfP1j2ikI6AspY+RIH9oYOcV
         1ZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757450662; x=1758055462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzBRzvKW2zdhXk7uB4HX6mdUtJFNu392EQuszh5zjhE=;
        b=Z3xEkJY8KEomjL5SMQeWv2Qz4l21+vPUnpwqWLE71nH9A2GL2GeFg6dYcrzu/z/ZUT
         RO1danrQENewhKayZ43OT+i0G8Bfg+sdtcXqWlw9i/+ze1vlw5yqXbv5v0julht1nxKZ
         SJkkVYtfuDBv1elFNzXRPGO+olIDcIvZMkqIJww6dDKO8LW6XGbXf1qd+Xx6O1j/bWEb
         8pgS8d50dEYM1As6QFH876LSFofNiiI3GlhCBdRMVuPlr4JZt8ZWQZsoXv5GizlMXv7i
         iaQDjyYsVgqWlESMAZYQD08X/J4ElBWCvsZPukPu3FnDOUt3RVMNirGWSovT33I84A90
         U9Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVI1oJuLd5riVuO0xljoPxte1LuLBHmnCfQk3Bop0uzStgYAmTjJzPSQK224G+mzcmyhjvNfiNmhdA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTO6GeY7PeI9wFjSL61/jmK7Vlclel7B+mIzkB2eA/QykLIfwN
	SfS5tHbfFhQZKbh6lmweNBOku3wedXtvMcj5WjOY0S36nvndztm5yboR6xELSA==
X-Gm-Gg: ASbGncsM0jSauLQeLj4bF40ZbBPwDflIcg/eENRXQbtnj7/kTIu2U8lRLMg42P1DRWn
	pJtRtJY5yXSY9nqk876EgYK+vhhwWlMV9KHmQpmGBFNcaRsLxXBajIGUi3SRT2+eus9xKiIsa5I
	OuUGMUB8NHNg5/WniR59BCTfSJXEX9wkixBt3Yr7L6rQ1hlPHH9ztxCBCMQBS5HCH2voOipzo/2
	S9wuysPtAQ/MCYSX+reMJLMiGpR6vk89I6MlIDrcvYaL35DdLZG/WytX1pNoL8jet+7M5E7xxmM
	cDbPPOPD+oGFO3OZ+TU1ygnEcWhTWaVzBnUcIDuAqhv0rvl80hDfMSoedxQLxIxj+/io7Vw3l8k
	atwFXO3z54QXX9tE9V0d/InK+9yXonle/u3UXLvJ+p0aUNY0iq8YCxtCt
X-Google-Smtp-Source: AGHT+IGtfmecFTDLgx5CmLdQpYU0Hps7t+OGk6514SR36ZxUpu3kbmPe6mlwuJxKopKqb+ducmuA2A==
X-Received: by 2002:a05:6512:158a:b0:55f:6cec:2890 with SMTP id 2adb3069b0e04-5626247911emr4333491e87.38.1757450661576;
        Tue, 09 Sep 2025 13:44:21 -0700 (PDT)
Received: from foxbook (bfg216.neoplus.adsl.tpnet.pl. [83.28.44.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-568190f828fsm731178e87.147.2025.09.09.13.44.20
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 09 Sep 2025 13:44:21 -0700 (PDT)
Date: Tue, 9 Sep 2025 22:44:16 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
 mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/7] usb: xhci: use '%pad' specifier for DMA address
 printing
Message-ID: <20250909224416.691e47c9.michal.pecio@gmail.com>
In-Reply-To: <aMAPkH5-4rLdmx_9@smile.fi.intel.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
	<20250903170127.2190730-3-niklas.neronin@linux.intel.com>
	<20250909115949.610922a3.michal.pecio@gmail.com>
	<aMAPkH5-4rLdmx_9@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 9 Sep 2025 14:29:20 +0300, Andy Shevchenko wrote:
> On Tue, Sep 09, 2025 at 11:59:49AM +0200, Michal Pecio wrote:
> > Old %llx with (long long) cast also prints it corretly.  
> 
> Not really. It prints unnecessary long values on 32-bit machines
> making an impression that something works somewhere in 64-bit
> address space.

The %016llx format you are alluding to is used in two error messages
actually seen by users, that's an issue. My crazy personal preference
would be %08llx, but I concede it's unprofessional, so %pad it seems.

But it's the exact function I have shown where three otherwise useless
dma_addr_t are introduced to get around pass-by-reference limitation.

Maybe there would be a way to limit their scope at least?

In these messages, all values are indeed known-good DMA pointers or
truncated to dma_addr_t by the time they are printed (but ep_trb_dma
is truncated silently, not ideal).


Elsewhere, HW-originated DMA pointers are handled as u64 and dynamic-
debugged as %08llx. Call it messy or sloppy, but it's automagic and
convenient - with no leading zeros, significant digits stand out more.
A nonzero top DWORD on a 32 bit system sticks out like a sore thumb.

The exact same *value* may be handled as dma_addr_t before it passes
through HW and as u64 after it comes out. It would be nice if both
copies looked the same in the log.

> > Secondly, padding is not optional with %pad. Maybe not a big deal, but
> > on 64 bit systems with comparatively little RAM it adds clutter.  
> 
> I don't get this, can you elaborate what's the problem in using _standard_
> way of printing pointers / addresses?

I simply find that leading zeros are distracting and make it harder
to visually scan for equal or similar numbers in a wall of text,
which is what dynamic debug is about.

Regards,
Michal

