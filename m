Return-Path: <linux-usb+bounces-29228-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E2590BD5179
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 18:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 271F6581634
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 16:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34329314A9D;
	Mon, 13 Oct 2025 15:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPXDn8JT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E471213E6D
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 15:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370199; cv=none; b=BCDWDo8pSo4lpjzrx/VN44dJOEXuR6sEXcHL/XJXHrGXDkJUahnTywrNQlVInY6GRBixevp+Cqek+Wb2Rwpkn5W0Afp1/lOsiyEdjYWfsY2Y/cuLqtNJ5r8cAc9mUfX9UIPdz4heSuzerZianFVMtdjgzinK7e9vtU9c9dtQo1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370199; c=relaxed/simple;
	bh=rIkJZkEluyPo2VWs/yksi6k4Tjq+6xbPUN1bXP0l8SM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K0VzooQOREL5w/gCMAnTVXfxnNFT6E3ItdHk/R/tAmF18RgoXw0/At/tCO0eFMCoP6MBd64LFLDqIb0u9FhnwC0MEdZRDTgI4xu9DgQG+k42e2t7xrNdaIxBvPqOgXi7XeprhpN2H9e4hK5L13zAj69NRwmKB29f17b8lv98ka8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPXDn8JT; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-63b710f276fso4410497d50.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 08:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760370195; x=1760974995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIkJZkEluyPo2VWs/yksi6k4Tjq+6xbPUN1bXP0l8SM=;
        b=nPXDn8JTtlzS1VPH0beF1zDGPw/Kn/bysoOmiKJf8qulbZqoRgrZsJL02D8ohtUb+8
         UJIxuKTfjTS/u2CKZgWvMC5cowGark17akuK6iAkcVHHJaWHoRgfkkwpGAReqEXnQh31
         YO7wT5Jrb1HABteWS4E35NNlGvwZ2QCledBcxAEyAbBTDZy9jYx1hv/PeNgQx3omCpdb
         IVF/wuuk/B9dJ+2sRGjlcgTwHf2DGBrfPNG14A8UpySscSSrp8IgZ/aWR+9KBry0K1YK
         afwGGBZX5DKIIF5uqMq5ncRRJTA7lEgZBrKQnLEPsmZ0vtzQbWsUKDhWV/CeErldpAsI
         /HeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370195; x=1760974995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rIkJZkEluyPo2VWs/yksi6k4Tjq+6xbPUN1bXP0l8SM=;
        b=TXcsQvHX9H5a1PZxExxRBjgZ8UmceZuitzhTM9a8xK5hnusznLBt1rl0T1MFwEn9eL
         6zTHYlQXZziH5PmNA0AOA1q0e+CiVvlsvUMnlbxfejqErBft5EW1JQRVg/Gzc3xKGt6q
         7OI12Oxebqk3YndIOx1HrgZEX4BvV43/41+Wpyc+z73ArlSalF050byIzi65z0VzQZ2W
         8jd4QvKAEEh0yGy3yo1wYVc7eEDoF5hBLZ47V78H8j2FnDLr3hp6gtFqB8uuivTadJKb
         xSbT7CZyWItwBGEhF+/LUKAw2sx9dV4que9oH2Poje27hbHTQsz2tFogg3aZ7LCz+QiM
         HvYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6Hj96tJywieFdPHGZhFuAKrwnIYBmPj5OTjrqq1Gs4pwnJtRLoc+vv3uRIwWQ1Fh9tax3dIpv14o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1BQ8eljMbQVmClXEx1myQrr7EWgxH3mRr3+OKteVw1gxCz1Oq
	ncWgICkNszsnWhvpCaatOs7kikLndnZgXu6HIEBf3YhuaZENwcn9gqscIWmJ6+tJwAgBd1PgnmR
	Hnr2Rnup5ajs1yTW3sA/nW84JSQA166E=
X-Gm-Gg: ASbGncsQkdzRs51czSqzT9na8SbVlBAJhOVUWRVcFDkH0KVQQIfAQ6KXBFQA5OUlZL1
	KStR8Mwp/mSmOeEF8P9v7B9SMt17iYx1TXQvu0rS7aWhaniUR8pIlGTxGppHHBSFUTa3EDHc4Ya
	FPuH7xfh3xw5ld+q+dvvva9rMl7VDV2IM+ZLp8hiD2rPAoGhEua3xN/XEjBAjCaoU++jvJhdYGp
	ROOCCQA293+qMFPScl7f1m93IMJNrzqT3o6iZ40hMhcF7JcL8zVqVuv7JSlmRwJDIis2Ib8/F2O
	9cySPcmmnjh29rQDtUqQc73FQo6E1hmsz6zt
X-Google-Smtp-Source: AGHT+IGvkl8C+OsIAcsnhtLiNAfhYmbVvPmpSMn5KlkC4kFXG36BsQ2KQosEGuyT5OsgvgqKqwcwRx/Tpr5F2BY/eDM=
X-Received: by 2002:a05:690e:250f:10b0:63c:eef0:221d with SMTP id
 956f58d0204a3-63ceef047camr8693129d50.48.1760370195420; Mon, 13 Oct 2025
 08:43:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMMLpeRU72CMxHdF-rO9y1Nvzj9nPnuQTOZWcCrM4fOJ1byacw@mail.gmail.com>
 <2025101243-ongoing-truce-3aa5@gregkh> <CAMMLpeRrO_E3_c98OB9XvpiGNjhTetrw2ucFyaq5BByPWh58SA@mail.gmail.com>
 <2025101238-mastiff-decibel-4b4f@gregkh> <CAMMLpeQvb1SJ=_kC+N1pGHkh36yrORJq+Der7fDzPj_urzefow@mail.gmail.com>
 <194258bf-e78c-46b8-8229-3b019f2b8ab0@suse.com> <aOzYzH01b39gjIDP@suse.com>
In-Reply-To: <aOzYzH01b39gjIDP@suse.com>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Mon, 13 Oct 2025 09:42:38 -0600
X-Gm-Features: AS18NWCZwaElDN_UEYWWWGmhU1JzZGoSUtF7qwa3kbe_oUZxG4pbzS-nVeKLmbU
Message-ID: <CAMMLpeTZxLCK2sh0qpHoFzHCrntc-vLSWqJJUjicS2xRR2AdNw@mail.gmail.com>
Subject: Re: ttyACM versus ttyUSB
To: Vojtech Pavlik <vojtech@suse.com>
Cc: Oliver Neukum <oneukum@suse.com>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 4:47=E2=80=AFAM Vojtech Pavlik <vojtech@suse.com> w=
rote:
>
> On Mon, Oct 13, 2025 at 11:28:59AM +0200, Oliver Neukum wrote:
> > On 12.10.25 21:01, Alex Henrie wrote:
> >
> > > I did notice that the ACM protocol has no way to set the baud rate or
> > > read the CTS line and I wondered if those limitations were the reason
> > > for keeping its driver separate. Today there are ttyUSB drivers that
> > > likewise have limitations on the baud rate and the flow control lines
> > > (some are even based on ACM), but they weren't around in 1999, so I
> > > can see how the difference in capabilities would have been another
> > > motivation for the difference in naming conventions.
> >
> > You could argue that ACM is intended to be a driver for a _modem_ ,
> > not a serial line. In principle we are trying to propagate a layering
> > violation that is so old that we no longer see it as a violation.
>
> The ttyACM driver is also older than the ttyUSB driver.
>
> And yes, indeed, USB CDC ACM was intended as a class for USB modems, not
> for serial ports, so it doesn't directly support pin twiddling.
>
> One would assume that baud rate setting would also be unnecessary in
> this usecase, yet, surprisingly enough, many of the early USB modems
> absolutely failed to work unless a baud rate was explicitly set.
> (USB_CDC_REQ_SET_LINE_CODING)

Oh, so there is a way to set the baud rate in ACM after all! I'm
flabbergasted that I missed that. What exactly are the limitations of
the ACM protocol compared to the vendor protocols then? It looks to me
like there's no way to turn hardware flow control on or off, and
there's no way to query the state of the CTS line. If the only
differences in capabilities have to do with hardware flow control,
that seems really minor in light of the fact that many serial devices
don't have hardware flow control lines at all.

> Today, some USB-serial chips have the ACM protocol, so perhaps it would
> make sense to merge the drivers, I certainly would not object.

It is definitely confusing to have to think about whether your USB
serial device is going to appear as /dev/ttyUSB* or /dev/ttyACM*. On
the other hand, if we renamed the ttyACM device nodes to ttyUSB to
reflect the fact that ACM is just another USB serial protocol, how
many things would that break? In general I like making things make
sense, but I'm hesitant to be the one to pull the trigger.

-Alex

