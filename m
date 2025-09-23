Return-Path: <linux-usb+bounces-28569-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC29B978D1
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 23:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6ABA2A3928
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 21:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5DE930C34F;
	Tue, 23 Sep 2025 21:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=it-loops.com header.i=@it-loops.com header.b="SIbVlloj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFD827F732
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 21:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758661822; cv=none; b=R4NTEc/ZBOHOIy0hxMzvZY0LbjJtESUtwwD0NoWM+Ks/idKQ/4Z/onXqzSxJua3A3E2+T/fhOXpkVV6UFVGs+eQ7ktAaOR8DYRho5wQ5FUkqnyPxUsHGgMMZnVIpx1wLjakheU6343KpFKclxQzaUdJdiZslfQwXtH6swT6l4z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758661822; c=relaxed/simple;
	bh=4DBhNieSh6MnSOzuWI7MxFkf0JzgYB9S0XgyIRG3zwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=M6tG4ets9jsxBxmpDO9g4j+hoUmnUzQp5EukDXGAJwUKbLUsXkLZKRr4in3EVH6t17dotPmcDTZixcOx5UKiSJMxY3kXeTAWL9fROiogPNd0GD4JdjSzq82ftARJb/txFXa6gCbvCvVQ4murAUiy7YbaGoWc2GqduWqSPzZz/ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=it-loops.com; spf=pass smtp.mailfrom=it-loops.com; dkim=fail (0-bit key) header.d=it-loops.com header.i=@it-loops.com header.b=SIbVlloj reason="key not found in DNS"; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=it-loops.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=it-loops.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-62fa0653cd1so7136018a12.0
        for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 14:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=it-loops.com; s=google; t=1758661818; x=1759266618; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w8DhNBGJeEd5eZQtjUc8REqTgihYEv59/vmaSGDLA5Y=;
        b=SIbVllojZBmc2jMhfVM/SMn8NAsXkl5uHe9O+rOotP5jHejodyamoZnNjNxxt33mQ2
         DKQjloe6spjF/wJ6saSsDNH6auKRYFLOk41YOrG4owH2JcMA8Xf8jOepl0q0cdQwrmv/
         P+6k9TzZb5zCiAn4YVgP/SfZ1hTjZUWz530bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758661818; x=1759266618;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w8DhNBGJeEd5eZQtjUc8REqTgihYEv59/vmaSGDLA5Y=;
        b=dXNAHQ5nwLAaTo/Uk5r0O4Nn6dCC1mFDFIbxt3UEXREPa7EKTM2I6wFbwDHZSrzJKh
         pHqtOuFJ7XNo83FTYcQeOXAYzZ3s0iRo/G7pJo2z7+0cPqKCRuFhxlFHnjb1O5dI9BjE
         8J1mmR1kEZWwfN0eMagSPo7Chd/jKHoUwiuCzd5Gp8pnGDJuxbjkDnYRyMYorvp0xvrX
         En/d9hIYV5GGuOrA+6uyh+t/5H//QE8koPwG10iaHNEPGdXgoW6b4p2N4NaLfx06/XMr
         A4uqCFjYKv6u603HZB0/4SkJUxU8GljRo3jeC+RQpNjd728E82QFYdnPcApriODHCVb0
         ongg==
X-Gm-Message-State: AOJu0YzhMWlQNyTmOWNxbmvDUPv756Hdye2yTRGHaasQNEtQ+ITq3M/I
	1f32m37aQoZ/KGjXulsOVaXAzoq7fXWdEaiIXT/gZOLfupUZBodUA3otnYgMBdW6uHRxphd+Eto
	zEPPTwExNzWfjF2Iv+2dSq6H23x2BVMivhZzlpqFWQQa+hOldpbZS
X-Gm-Gg: ASbGncvRA5Ym0d+gWoMQ9ZiK6j9POmJkAF/xnLVT6pJgo+ai/MJOQf5SatXDlT/CrJo
	i755lnsuZUkoZuqzfCoJMUpRGZrPStdFgcj+i69tzAja2d12YNHIqAGB9vVBu3CnlrbEfmnalit
	uCRtB1eAVnwlWKQPGPJX4At6FTgzflHbgiHcj1/o5FmSb/lWxALYdt4M1DCtpooB15nns7Porsj
	/K1Q6jc
X-Google-Smtp-Source: AGHT+IGo2LZPRIXmlmqVEZfbC4FLLsAdYAXSRZGsviE16Va3LNljG91qiyuXUWrrj2KD9TJXsvJL2U/Qd+mQY6V4zLw=
X-Received: by 2002:a05:6402:42ce:b0:633:642d:ac16 with SMTP id
 4fb4d7f45d1cf-6346767c471mr3360025a12.3.1758661818224; Tue, 23 Sep 2025
 14:10:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALG0vJtX5EdNYJ6=Fiz=uiAN6ur=BDj39UpYnj0OWSSLQdDgxg@mail.gmail.com>
 <CALG0vJv5ExA=ricY52-jL0GhkZZAbQEqTu476aC6C4ApxoYQ9g@mail.gmail.com>
In-Reply-To: <CALG0vJv5ExA=ricY52-jL0GhkZZAbQEqTu476aC6C4ApxoYQ9g@mail.gmail.com>
From: Michael Guntsche <michael.guntsche@it-loops.com>
Date: Tue, 23 Sep 2025 23:10:07 +0200
X-Gm-Features: AS18NWBPKuzx4RBdFDLajDMFN2iUit6KmvStsVIUCgOF4Vu50_GQpF-1b23Rk1A
Message-ID: <CALG0vJuSen3WatyGt-x_h8A8XH+HYOkR96qWPqbKHdKNOZKJVA@mail.gmail.com>
Subject: Re: Kernel panic after return from hibernate if thunderbolt state change
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello again,

> I just tested this with 6.17-rc7 and got the same results.
> After "Suspending console....", the screen turns off and caps-lock
> starts blinking.

I spent the last 2 hours trying to figure out what is causing this
issue and made some little progress.

It is not necessarily the thunderbolt code since I completely removed
the module and was still able to trigger the panic.
I also removed the i915 driver and while I still got  Kernel Panic I
could now see it on the screen.

   KERNEL PANIC!
   Please reboot your computer
   Fatal exception in interrupt

Furthermore I noticed the following.
With the thunderbolt module removed I sometimes still saw something on
the screen attached to the dock, I guess this is the passthrough mode.
If this happened and I put the machine in hibernate, removed the cable
and started again the machine would panic.
If the screen was not detected I could unplug the cable and the
notebook would start without any issues.

As a cross check I booted this setup 5 times in a row without any
issues with 6.14. doing the same hibernate-unplug-restart dance.

I really do not want to bisect the whole tree between 6.14 and 6.15
since this will take ages, so I am very grateful for any pointers on
how to debug this issue further.

Kind regards,
Michael

