Return-Path: <linux-usb+bounces-2752-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 282997E71CE
	for <lists+linux-usb@lfdr.de>; Thu,  9 Nov 2023 19:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5883B1C20C74
	for <lists+linux-usb@lfdr.de>; Thu,  9 Nov 2023 18:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570A4208A8;
	Thu,  9 Nov 2023 18:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ApOW6JNh"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5C32032C
	for <linux-usb@vger.kernel.org>; Thu,  9 Nov 2023 18:56:03 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1554F3C14;
	Thu,  9 Nov 2023 10:56:03 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-507975d34e8so1687748e87.1;
        Thu, 09 Nov 2023 10:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699556161; x=1700160961; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0yS/15IkqWuUSG1X/AHev/4WvQOJcE2lKWPbhHNQChQ=;
        b=ApOW6JNhA7XQzE4vCH8pxAg80CaN+1gsni2fJFM4ncyhafvaTnTUZ2xONYPOgYLlol
         /BgOh55+0npluUMv0q38n3vF94u1f2cXRYVh4HIxQJP+NXcRFgK8lLF+FHFcrWYRFBQt
         NRKSgopEDaf2w6asqYeDwNACGQqVoqGqgBs/zF9R+Mk6ycOhy0ebW4uXAbQL0eJ5IwJS
         NZVZ3EspVJ078jXqXFalKjbTxGJDEvh6Ecyg06N9j73cP6LPJMVi4SjnV5momp2k8LIF
         7w9iQwxOwlu6VRW0LsT7aonaEYMkE6YJNaBLg4J/+crUnLbXFqUH3UIUeJ3CRL8yPAdu
         Ei4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699556161; x=1700160961;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0yS/15IkqWuUSG1X/AHev/4WvQOJcE2lKWPbhHNQChQ=;
        b=w3r4x4AqV/muEHl/pI50KxOfoUCk3s8uJgveXhiKUhPivSuTyPXW0+ml22enI9s4E+
         gOCAoTlgGe45UUS14QPPLmWLB6Zgf6as6DvCLEQIx8xU69aLhKBGJ+Vj5bDkdz5evOfG
         ZNgtdPXrsYwAYX1dIUSZdZQN4enJB5o9FARwnOujt8yy6QqQ3C9uAr/EMSdvs2USRxj2
         nYDqLQumMZzHFKv5hIU+8T5FHwDYtMYLAmsanOXbaritD5UqnMX8L4H956bUZrJF0Cw5
         AJNAXt31EVyiSIQjMziUkZG2V2otvsHwZIqxUPfPQQXZnz5WD32nxdZl8oUYzsifaIhF
         6dYg==
X-Gm-Message-State: AOJu0YxTEBzzjlgetbrwT4rfcZCenxn+hEKFsZOxAkNINwCcsOlQGT6o
	1nyWttiGO+eu/d+v6j9o/AdXsEatm9j2cZORbQKwhpTw
X-Google-Smtp-Source: AGHT+IEFCKWxkPv4AGf881Ib3bqOSjVbFC4HWSZ/qsQJTfd/KTafKrYnecJo/D+TsvR32Xg0EFTfPuaL6bAZHwfwHnI=
X-Received: by 2002:a05:6512:703:b0:508:1aa7:dfeb with SMTP id
 b3-20020a056512070300b005081aa7dfebmr2062305lfs.27.1699556160986; Thu, 09 Nov
 2023 10:56:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFGKuwoFUaXMsOOWJNBenQDG6+syt80Z9pvQQK1XSZFztC2_SQ@mail.gmail.com>
 <2023103052-unpeeled-calibrate-ae48@gregkh> <CAFGKuwp7JH8H9vjz8iJ24R9TRW0GDE-O96VBAG4L8X4DhTabXg@mail.gmail.com>
 <2023103003-defection-recess-cf49@gregkh>
In-Reply-To: <2023103003-defection-recess-cf49@gregkh>
From: ariel marcovitch <arielmarcovitch@gmail.com>
Date: Thu, 9 Nov 2023 20:55:49 +0200
Message-ID: <CAFGKuwpSEW4G6CFY10x29a5L53je2mQDO=dm1Tw3gtzqTVky3A@mail.gmail.com>
Subject: Re: Gaps in logs while using usb-serial as a console
To: Greg KH <gregkh@linuxfoundation.org>
Cc: johan@kernel.org, linux-usb@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello and sorry for the delay

On Mon, 30 Oct 2023 at 10:30, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Oct 30, 2023 at 10:15:30AM +0200, ariel marcovitch wrote:
> > > Please realize that usb-serial console was the result of me loosing a
> > > drunken bet.  It's amazing it works at all.  For "fake" devices like
> > LOL your drunken bet was quite helpful to some people
> > Because modern PCs come without a serial port, I wanted to use it to
> > see early logs on my crashing kernel without having to use printk
> > delay and things like that.
> > I'm curious as to how kernel people debug PCs in general...
>
> We use a usb debug port connection (it's a special cable).
Interesting
What makes it work well as opposed to usb-serial? Is it a less
complicated format?
What code is responsible for this feature?
>
> > In any case, the usb-serial setup was quite weird as it required two
> > usb-serial and a gender changer
>
> Yes, that's normal.
>
> > > this, that use the generic usb-serial code, yes, you will have overruns
> > > and other problems, that's just part of how it works (i.e. not well.)
> > >
> > > For something like qemu, please use a real console, like the serial port
> > > (i.e. a fake serial port), not the fake usb-serial port.
> > Yeah I was just using it to demonstrate the problem (I agree it is
> > quite weird to use usb-serial as a console for qemu)
> > I experienced the same problem with a real usb-serial device, then I
> > tried to use emulation so I can debug it more easily
>
> Which real usb-serial device?  That matters as it's up to the individual
> driver to handle the flow control properly.
Oh sorry I really thought I mentioned but it seems I missed it: pl2302
Isn't the problem generic, though? (The speed of the device may make some
difference probably)
>
> > > So this is "working as designed" in that it wasn't designed at all and
> > > again, it is a miracle any data is flowing there at all :)
> > I see...
> > However it may be possible to fix it without much effort, so why not?
> > Something like checking the return value for the console's write
> > function seems reasonable to me anyway...
>
> But overflows for buffers can not be handled by consoles like this
>
> > Besides, don't other types of consoles have the same problem (being
> > initialized late, getting a lot of data, losing some of it)?
>
> Yes, they do have that problem, this is not unique.  You can just see it
> very easily when using the generic usb-serial driver as there is almost
> no buffering at all in it other than what the tty layer provides.
>
> Adding larger buffers can help with this, but where do you stop?  What
> is the proper buffer size to always use?
Specifically, since we are talking about data coming from the console,
and it saves the full log anyway (or at least buffers a lot of it, in
a configurable manner),
why can't it make the per-console seq track the actual data that was
able to be sent?
It sound reasonable for me, is it really that bad?
>
> Overall, if you are going to be doing lots of debugging of early-boot
> and console logs, I recommend getting a usb debug cable instead, sorry.
> usb-serial console is just "best effort" and we're happy that any data
> flows out of the thing at all :)
>
> thanks,
>
> greg k-h
Thanks,
Ariel Marcovitch

