Return-Path: <linux-usb+bounces-29178-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D42BD0A51
	for <lists+linux-usb@lfdr.de>; Sun, 12 Oct 2025 21:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DE4474E7CAB
	for <lists+linux-usb@lfdr.de>; Sun, 12 Oct 2025 19:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B372ED15F;
	Sun, 12 Oct 2025 19:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqgKfnSV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925D51A275
	for <linux-usb@vger.kernel.org>; Sun, 12 Oct 2025 19:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760295771; cv=none; b=Z0fgKTznabMXPh53ZIj/Lw27WU8gHfgErVomxovlSA2uGPJm7kwVgqKGCh8bzpHctmpn1noJ8WF1WpJzCyea01H5Lut1brJ3i8T+6p4UU5Ifv34TgazebdeyNu9p8J9p6WP1pF5wakRmtvmKq0YZbLdbJOW8DPJLDl5qiy2ykog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760295771; c=relaxed/simple;
	bh=CGN8WFFGKuvYrRaoYBmrD2eRNNHJlJ+ITS/8mxXnF1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hVfpnscd8v3FaIhFVskJq5HKOejyFekg/fqhG6aX/eL97J4mRC1ESC1ZxH+NDrUGJLRhktuT/seywLe/zWVzYcKHpvahh73KuA8KeKC8qyM88DY9GpNdyKPyJGZAN5/fqmnjxvfCmmKOQrMUzcqxDL1vofy0Q5kNyfqMihZGWTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqgKfnSV; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-635fde9cd06so3667535d50.0
        for <linux-usb@vger.kernel.org>; Sun, 12 Oct 2025 12:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760295767; x=1760900567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uefAI0IyCJ70SwIUEzFMDqvHmiMuk705OE2BDW05AS8=;
        b=aqgKfnSVfARGyTI8537I7O99HymlGD/tTv7Qk2PEygVXZ28JMji0UyU/kSEG62MwOK
         kFUaeN5Y8wkFZtWAaRAHMcSrhcUoNrN2l4r77T+4KYRmOgflgAubNr4LE8Y0CXjFEmHG
         9AfvMiqsbn9SdvrnwDgKMjGkUZAgRfVdThZGCemAEXmToLkLdHvBsbimbi+QQU3KvKUp
         cbFo2WAuwWH+QWgwdoQt4iMhk7PIuCWR1a/IRklwy5RF14IN7tMM6/jSPxWEw3H0ixPS
         YuNrTXX9XX654cmsMHCyUEuhfFM4CZCqG80Kh+YWH/8PsC6d07ywoHqPVeU6UN51AiXL
         k2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760295767; x=1760900567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uefAI0IyCJ70SwIUEzFMDqvHmiMuk705OE2BDW05AS8=;
        b=ZLR+DiBt2biX18E8ayMNGp5aa3PPWyK0V/to56wymlZ5bcHaQGyophdP7dNxjQ/ed0
         J4lyce+t1f5IfvnGsTYF14MH5PO4Ltc7SIQXAVjaXijliMnuMthgjiPINOSQ0s2g1xtB
         nEab4eXbYWKD1GwdfpqxVcTXUqRAg9n8Q7fmkWV2jyshqJVGcSxoIwuhglJB8Bd5mnN8
         2GkcpJS8ARXfrQ8D/0N1Mf1Z8qk3HTB2aNbyAI6n3dXhYzIPFHf0yEBwWyEeCtArZJie
         aNza9eCx+Slk+nt2OcPKTJVSDw0b14JyrqF4pt58l8iKLxjhqjMLiQfCZVrFdmg8eS+u
         UN1A==
X-Gm-Message-State: AOJu0YyKmgWdEzP3xt6hOpwQ1HsvyisNeo+JKAWF46OO6TxAxvORObn8
	wcY5GEdUiUuDX/bv7tgxOty6mVfFUWqFnxFqjRkFgNaKRa4cbYJe+dMvXFoVi+UyuQ09b0acS4B
	Vv0rTETjuJIMDHKoJUyG006pDG7WFbmE=
X-Gm-Gg: ASbGnctk6gKi8Z3fOthZAZevPzcC/XPMLfvVvtur8h++/ktDriyHazO4f5SsNnTS3c1
	9hNb1pKY6LOA+cQbQA/QaXayWsZhUkfRpVPrBA5BJ0oP7cBJmTLyPAHe4sbyp4FaILk7eMMeaB+
	3mXU24X2cHcJLb6awBJjzJfSygLj+liNW/KeN3l/1q7+Q/U3YtpfcQbzTWfZRZukVesh9Pfvvm3
	yERVNyo5ocPoXWZYn66Az/g3SatWripEySmod4UZgilIu6zwlfH6tyn4bTzfETm0Y8=
X-Google-Smtp-Source: AGHT+IGxcWEA8+qCtQfrRyZhDJizIfy2Tn0wQqp/5xvZyAH2cW13GZu1BCKfkgIdrZ0XSRwHprjb6sq0JH4h51RQMw4=
X-Received: by 2002:a53:d98b:0:b0:635:4ecd:5fcf with SMTP id
 956f58d0204a3-63ccb8eeafemr14872561d50.44.1760295767385; Sun, 12 Oct 2025
 12:02:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMMLpeRU72CMxHdF-rO9y1Nvzj9nPnuQTOZWcCrM4fOJ1byacw@mail.gmail.com>
 <2025101243-ongoing-truce-3aa5@gregkh> <CAMMLpeRrO_E3_c98OB9XvpiGNjhTetrw2ucFyaq5BByPWh58SA@mail.gmail.com>
 <2025101238-mastiff-decibel-4b4f@gregkh>
In-Reply-To: <2025101238-mastiff-decibel-4b4f@gregkh>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Sun, 12 Oct 2025 13:01:00 -0600
X-Gm-Features: AS18NWBbnO5xVVlXS7hmbTEZiPbip76ysXpji3ZkQwciO2Um3XoggktzhrxppbQ
Message-ID: <CAMMLpeQvb1SJ=_kC+N1pGHkh36yrORJq+Der7fDzPj_urzefow@mail.gmail.com>
Subject: Re: ttyACM versus ttyUSB
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, oneukum@suse.com, 
	Johan Hovold <johan@kernel.org>, vojtech@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 12, 2025 at 10:21=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Sun, Oct 12, 2025 at 09:55:27AM -0600, Alex Henrie wrote:
> > On Sun, Oct 12, 2025 at 12:07=E2=80=AFAM Greg KH <gregkh@linuxfoundatio=
n.org> wrote:
> > >
> > > On Sat, Oct 11, 2025 at 11:00:00PM -0600, Alex Henrie wrote:
> > > > Dear kernel developers,
> > > >
> > > > I am very curious and I haven't been able to find a definitive answ=
er
> > > > anywhere: Why is the cdc-acm driver separate from the general
> > > > usbserial driver? There are lots of drivers that use usbserial, eac=
h
> > > > with its own unique protocol. What makes ACM so special that it nee=
ds
> > > > to be separated out as /dev/ttyACM* instead of going with everythin=
g
> > > > else in /dev/ttyUSB*?
> > > >
> > > > I can think of several possible reasons, but I'd really like to kno=
w
> > > > what reasons matter to the kernel architects/maintainers.
> > >
> > > cdc-acm implements the USB specification for that protocol, which is
> > > defined by the USB group.  All of the usb-serial drivers do NOT follo=
w
> > > that protocol and use their own vendor-specific ways of talking to th=
e
> > > device.
> >
> > OK, so it's just a matter of policy that drivers for standard USB
> > protocols name the device nodes differently than drivers for
> > vendor-defined USB protocols do?
>
> These drivers are decades old, originally written in 1999 and handled
> different hardware types so they got different device nodes.  Just like
> many different serial drivers today have different named device nodes,
> it was just following that well-known practice at the time.
>
> And that practice continues today, when people write new serial/tty
> drivers, they usually name the device nodes something new, much to many
> of us arguing that maybe they shouldn't do that and they should learn
> from our past history :)
>
> Also, cdc-acm does not support as wide of a range of devices as the
> usb-serial driver does, which can handle multiple-port devices and full
> hardware line controls, which cdc-acm can not as it's not part of the
> spec for that protocol.
>
> There was a time that cdc-acm almost did not become a specification due
> to internal arguments at USB-IF, which is why the usb-serial devices all
> were using custom vendor protocols first, before cdc-acm eventually got
> ratified.

Ah, so the name ttyACM is a historical accident, from the time when it
was the norm to use different device node names in different serial
drivers.

I did notice that the ACM protocol has no way to set the baud rate or
read the CTS line and I wondered if those limitations were the reason
for keeping its driver separate. Today there are ttyUSB drivers that
likewise have limitations on the baud rate and the flow control lines
(some are even based on ACM), but they weren't around in 1999, so I
can see how the difference in capabilities would have been another
motivation for the difference in naming conventions.

I did not know that there was controversy over including ACM in the
USB specification in the first place. An unsettled specification
combined with the limitations of the ACM protocol explains why FTDI
and others developed their own protocols.

Thank you very much for the history lesson!

-Alex

