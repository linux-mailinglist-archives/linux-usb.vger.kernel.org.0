Return-Path: <linux-usb+bounces-31047-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1892EC941CC
	for <lists+linux-usb@lfdr.de>; Sat, 29 Nov 2025 16:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4C01D4E2702
	for <lists+linux-usb@lfdr.de>; Sat, 29 Nov 2025 15:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D2E1FBC8E;
	Sat, 29 Nov 2025 15:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="gMbhgEOY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCAC4A23
	for <linux-usb@vger.kernel.org>; Sat, 29 Nov 2025 15:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764431989; cv=none; b=U0e9feQGNB04do1XcFlFYKBBnWLtjH4izxBwJshYl8m63xO7O246wXsHuHf5t2nmP3N59l5HqhgW5KsuTc16hcfAtJbxtU917kBpvi4LVH8VpTxzQVn64zcd7exC2go/0Ex4yIhX0oDjXzvraSu5pS3+BvDEao6WGAo4fkSSfNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764431989; c=relaxed/simple;
	bh=lUCxnfxW4DZ7+olRSGEMhYgZNEQ4RGDcmW9TI2ERu10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DOzMyXwBN0OYF2yjR2j7kaF8qHtkcEorY2Cwj/19OTQ3CPJeC0g2aBJ0Ti8zmDi0j6N/80opJePaW5TmnTaxRE9pdk1Ch+TWVshc6gvt+4GAapCWy5xDCRDphFXPAZvlr+uYbl1e0QpCuTTfDB/mClKt8pN/+dwWUQgdpf+WpEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=gMbhgEOY; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-295548467c7so32561925ad.2
        for <linux-usb@vger.kernel.org>; Sat, 29 Nov 2025 07:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1764431987; x=1765036787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TZikJdiGgMF14AqGinXD4+5kyijd1Sf0w2Mc4AUXcE=;
        b=gMbhgEOY1TiuUy273vycU4JdcVDuaWg02U8ReX5DQXjQymFsH+lV/YR5icb9hjNBX6
         vX3mRXgbxlkgsO/8OqUskQmQ6TW4rr7XpgLF7Zd9IW3G9loE7B5jr2ml+X5Xc+LncJSY
         7M1kC89tIrdwHxGoYB4OgcDdNmFFxgfp/E5iJljYEBLZsCvAI05gJEyVK7wFy0ccbmAw
         DsWkTnRL3nUuFT4i9iiTKyCIzjTS3LE4fQhb3FvJOK8/dG0dmJK5d7X+TaMRyRZ93Nbs
         tFZMJjESu6GIUIr+bbeaf0ftdRLny1Idbh0ruXdv4UD8gI24QSvrn1EzJpQn40P1Dish
         RRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764431987; x=1765036787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9TZikJdiGgMF14AqGinXD4+5kyijd1Sf0w2Mc4AUXcE=;
        b=EXPhRE6jljO1lJUJ5wRr6tC3kkAXMlHxI52AY1qKLCg3V0bPebNcFChC3Ksiq0Ptdx
         vTI/NR18yapkUHsD3q9yZfha8R/2zc71aRpZqtKgVoSMcVEX9tUtYzqLEw2TJ5RMzpyi
         bCJrmuVtbZ2ad+S1AnjlE+eHFNX/+sVeZpaeQxOagcJhlpQ98seXG87IX8vFWCXpoNl/
         kwqMtEmbiPS9JTLCa7fafI6264dbBIQf07aaJhkyNNEN0V35hWqbBupjVU27VzJQ3TaG
         LcwnvbGav55jSxAyufORAbbpZS8woqm2DYOzumHGZ23HyREl/x5k4PU+7vhX6Y5ENWlg
         hWfA==
X-Forwarded-Encrypted: i=1; AJvYcCW9bjknzitu7oRwtKa1SpLanjbDBEJqibJZqgnV1A5lAOJW4PcFOc1ot/tYY3KQUz5Ld9ZJXkvWtrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhZXrZhoaLfzZMejhwEsMneS59vYlVo4EIuDR+nMqDRCthmmEv
	kE0YCvVWxqx+ylnS2KgiRaH7lw/wW4oVHCqDHfOwNYRHEvQb/Ho9gsLu/xuIbtsJ14N9RO++tEw
	ykYNJPRlpml7cMjmb9FOVw2vt6NSIUPw=
X-Gm-Gg: ASbGncs+h2XhkMKaGzAR7I8xMM2vAQfnwK+ghrvYhKFc6ir3Du4pBkh80qMwqeoy0B8
	8xp3z5n9l2OzePwjwdhnUkpPwXva5yScxkOfYwqSNODMkGcQduVaHVXwg0oxg9o+l+Anmsf7Zcf
	IQDKXpvsgQd2QQSMpkgrxruCHIDRGorQAcvedLwBqEiQ7RhCKjoWG3wHoGSDrCakZfsVyIwjSAp
	/AxkfdaOk0sC9JimT9eaEW9z5vGrnl+ZM63Xt4p33BqKR4FdTWm0bUQbzwnJKlMpcBrsibInaFN
	FZ5xdG9TUVT7YerZZVPvHJ0+L7LP
X-Google-Smtp-Source: AGHT+IFl8gwtMu07n/A1aLKJxBLYXFQ8b7LX0QsYh0VDEUHPCCS4kOuhgMnVj/cSDzLrERJ0DgTLoo3f5ZhVH1CThI4=
X-Received: by 2002:a17:903:1b08:b0:295:2cb6:f498 with SMTP id
 d9443c01a7336-29b6be8c78cmr343812045ad.7.1764431987374; Sat, 29 Nov 2025
 07:59:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204135842.3703751-1-clabbe@baylibre.com> <20250204135842.3703751-2-clabbe@baylibre.com>
 <aCHHfY2FkVW2j0ML@hovoldconsulting.com> <CAFBinCAUNNfOp4qvn2p8AETossePv2aL7jBkFxVZV_XzzULgVg@mail.gmail.com>
 <aINXS813fmWNJh3A@hovoldconsulting.com> <CAFBinCBMTOM-FMgENS-mrnV17HbKzhtPUd44_dDiwnD=+HVMWQ@mail.gmail.com>
 <aIiXyEuPmWU00hFf@hovoldconsulting.com> <CAFBinCBZhjs7DGEgxhz54Dg8aW3NX9_LdnoZeUZpm5ohaT_-oQ@mail.gmail.com>
 <aJCoRFe-RFW1MuDk@hovoldconsulting.com> <CAFBinCCYsWHsNwi99kFqvLv+xOYtp9u3omhrPdV-hdH+5Cfyew@mail.gmail.com>
 <aK7Y9rRIsGBKRFAO@hovoldconsulting.com>
In-Reply-To: <aK7Y9rRIsGBKRFAO@hovoldconsulting.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 29 Nov 2025 16:59:36 +0100
X-Gm-Features: AWmQ_bliYa3gc0anvQ0xsUF_LE36Lett_OnuRRgryLFJY0EHH7Ozn6M0le6CkK0
Message-ID: <CAFBinCD19CVc0kX-aqa8pw71O2F3Nwy9ght+2TCn9B4PbOCBfw@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] usb: serial: add support for CH348
To: Johan Hovold <johan@kernel.org>
Cc: Corentin Labbe <clabbe@baylibre.com>, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, david@ixit.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan,

On Wed, Aug 27, 2025 at 12:08=E2=80=AFPM Johan Hovold <johan@kernel.org> wr=
ote:
>
> On Mon, Aug 04, 2025 at 11:35:35PM +0200, Martin Blumenstingl wrote:
> > On Mon, Aug 4, 2025 at 2:32=E2=80=AFPM Johan Hovold <johan@kernel.org> =
wrote:
> > > On Tue, Jul 29, 2025 at 10:45:20PM +0200, Martin Blumenstingl wrote:
>
> > > > My general flow is:
> > > > - check if we have received THRE - if not: don't transmit more data=
 on this port
> > > > - submit up to two URBs with up to 512 - 3 (CH348_TX_HDRSIZE) bytes=
 to
> > > > not exceed the HW TX FIFO size of 1024 bytes (page 1 in the datashe=
et)
> > > > if the kfifo has enough data
> > >
> > > If you're going to wait for the device fifo to clear completely you c=
an
> > > just use a single urb with larger (1k) buffer too.
>
> > I set .bulk_out_size =3D 1024 in struct usb_serial_driver. Writing a 1k
> > buffer immediately results in:
> >    ch348 1-1:1.0: device disconnected
> >
> > I don't know if I need to set some kind of flag on the URB to have it
> > split or whether the kernel / USB controller does that automatically
> > (as you can tell: I'm not familiar with USB).
> > If not: 512 byte transfers at a time it is.
>
> The host controller should split the buffer, but apparently this crashes
> the device firmware.
I think having a 512 - 3 (TX header) byte limitation for the TX buffer
is acceptable for the first upstream version of this driver.

> > > > > > On my test board the CFG pin is HIGH. From how I understand you=
, RTS
> > > > > > should at least change (even if DTR is in TNOW mode).
> > > > > > No matter what I do: both pins are always LOW (right after modp=
robe,
> > > > > > after opening the console, closing the console again, ...).
> > > > > > I even set up the vendor driver to test this: it's the same sit=
uation there.
> > > > >
> > > > > I don't think the console code will assert DTR/RTS, you need to o=
pen the
> > > > > port as a regular tty.
> > >
> > > Yes, even if the device is configured in hardware for TNOW mode (inst=
ead
> > > of DTR function) you should still be able to control RTS (at least as
> > > long as the device is not configured for automatic hardware flow cont=
rol).
>
> > I think I made it work, sort of.
> > It's a bit annoying because of code I don't understand. It seems that
> > R_4 has the following settings:
> > 0x00 DTR off
> > 0x01 DTR on
> > 0x10 RTS off
> > 0x11 RTS on
> > 0x08 activate (used during port initialization)
> > 0x50 HW flow on
> > 0x51 no RTS / HW flow off
> >
> > That said, poking 0x00, 0x01, 0x10 and 0x11 by themselves didn't do muc=
h.
> > One also has to write 0x06 to the per-port VEN_R register.
> > The vendor driver only does that in .set_termios, which I call
> > questionable until someone calls me out on this and is willing to
> > share a good reason why that's a good idea ;-)
> >
> > However, I'm unable to control the RTS line of port 1. It works for
> > port 0, port 2 and 3 but not for port 1.
> > Ports 4-7 don't have the TNOW/DTR and RTS lines routed outside the
> > package, so I can't test these.
>
> Sounds like good progress. Have you made sure HW flow isn't just enabled
> by default on port 1 or similar?
Unfortunately I don't know how to read the HW flow control state from
the hardware.
Do you have any suggestions, how I can test HW flow control (after
manually enabling it for a port)?
I have a logic analyzer and second device (that also supports RTS/CTS)
ready so I can measure signals. Maybe there's also software that can
help me test (e.g. to trigger CTS yes/no conditions).
In case I can't easily figure it out: would you also accept a driver
that doesn't support RTS/CTS for its initial version?

On another note: after walking away from the driver for some time I
came back to day and spotted a comment in usb serial core's
usb-serial.c:
> /* we don't use num_ports here because some devices have more endpoint pa=
irs than ports */
With that I'm now setting num_bulk_out to 8 (number of ports) + 1 (for
the config endpoint).
This, together with delaying the call to
usb_serial_generic_write_bulk_callback() until we receive
UART_IIR_THRI allowed me to get rid of the workqueue and re-use a lot
more code from the USB serial core.
In case you're interested what I came up with, you can find the
current code here: [0]


Best regards,
Martin


[0] https://github.com/xdarklight/ch348/blob/90a773410078657c11718821aa4599=
4a7d96712f/ch348.c

