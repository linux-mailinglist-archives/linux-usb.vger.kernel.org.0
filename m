Return-Path: <linux-usb+bounces-29174-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD9DBD0697
	for <lists+linux-usb@lfdr.de>; Sun, 12 Oct 2025 17:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BC0F3B3D8C
	for <lists+linux-usb@lfdr.de>; Sun, 12 Oct 2025 15:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1600528726A;
	Sun, 12 Oct 2025 15:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ek33kTzQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C54121B9E0
	for <linux-usb@vger.kernel.org>; Sun, 12 Oct 2025 15:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760284567; cv=none; b=u7C8s+Pq4bIzYFap1/xu9u8enEMWUfOeyVuR2pGOZEeiXj7IxaI1gzo71clSvRPRGNRqt3H9ljSjFfW3hxI1tKlrvb/h7Kmj1NzH5yBl8FBbBRVYQv7KVMNS+xkRxIUMln8o35Xa5MjOyZvXUtFf7Mh6ufeHUYYwTB6rPtsD6qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760284567; c=relaxed/simple;
	bh=881w1dV+fTCmq2ZGJN0cDCW4pU1HgfoazInvGBlJmQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FNeqowTASXw0Clh6hn0RozgkDR+rO97eMaG/LkdTjTndJKNi/crsnhjnIH+B8RBz59P6i4VPmlYAAU0Q2vc5tUp7LP+IIUmnHQZcBz9RUbamnpPb6xkXdHtH4uDbTt3JiQ5xokY3oPIju+Sd87RT3xuyNJO8YlH1ABE3uU7ftT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ek33kTzQ; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-635c9db8a16so3292381d50.0
        for <linux-usb@vger.kernel.org>; Sun, 12 Oct 2025 08:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760284564; x=1760889364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CPfsQ4v0BF8O0V4JNKXZMUT9fcwmiKkJW6gXrGA0vg=;
        b=Ek33kTzQxC6qHXvz4P/QWfa9ht3V5bE5o2fXuX9P2VXw2MUXwqjpDg3kd8SUiyP86z
         nL7Mq9jCozX6ukugubIlwryxkm4u5kxl4StfQoigqDZSaamwGJmDiBSWmCCxBYNT4wyk
         QpyJkj/A5EKagy3D+rT0BDPWgqRSss0nOREREXlEd8WcPJpmHrVzk0hZX9arc5mu0SfL
         VybHR3l1fVXdsmZ37I6hX2xxd/uX71/wSbYq0+9PaXXbtvx7aqXFquuSzls+xF+Z7MwZ
         y5B5ukymH6me5Tnuhu+lUROASVo+H6r9lUM1VbQmk1Eg2Isly+7bnyNo200rbcc5igWa
         JccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760284564; x=1760889364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CPfsQ4v0BF8O0V4JNKXZMUT9fcwmiKkJW6gXrGA0vg=;
        b=Lcii6ArYs/vnmnJwiKeBW18PmLpgcVG5CNu10PnIYtePboyM3bL/1H+Y7QOdCsMuJU
         uZuiMtzikcV8Vh1x4MFXvCfq16QgmiPsHPz1/+XlP6io8tJM67wyxR8pZ/qAHZRZcOkx
         89t9am6A2TiFZzyxLhFzt51ck2n8OvBcSZU4u0q6xC9K2UbJesNZpIPDGMP/DMUgyucV
         c650FcwbtUSTGNTJ2Xl9Qh/k4LDEIE3jNrFJbXzHuHaqeihq6ubtMTbHzq3YQidiV7Ls
         XTkamqLbbqdxOCzBybY1/uc7oUxbOh/5t23fssI4d6yz6we3u4/SSabo7eFzQlzLEoNK
         iYnA==
X-Gm-Message-State: AOJu0Ywmsf0aXFDWuVWRrqJw2Yc+F2Gao8M4RzfqlfOZsfmc+cuOCQGA
	U/f3q0vZHFkxewaMdGHMQWpehvRp1/XfDICOQPZV+QN1EGlEkZt3ihW+2OJTKDF2T6XddpzObdP
	xnbp+BV/Y9opgsrBujHGMEhKRTXvYoZw=
X-Gm-Gg: ASbGnctJlFc59R+tfwiyJx8Fc912j/XVa+ZIvrJUOdiB2PA7iu4S250Qozh2/t1DKz2
	IfoTyaWBTH+lWoX6PMWIFiVqHgn9E8jmpRHaQK7PCMpTjxnVr4xJt3KyC3+wErxb76bMR1Uq/Up
	rYJAK49c1FyMw0BIjPY6OtCU5N9VX0lvqdPJTxKiyAv06fa9CaFFtgHM0mITqcEjAddVuEk8o03
	0T11Slbsl2HYfAEoyrHkD1C8K08h8vMn4AkrIJoB++AgYTT/Ri4I8S8ce6sV+2Vi6c=
X-Google-Smtp-Source: AGHT+IGIhCRGA4euc6Hyi9xvflx9VFNa6FbkstrA1LxU8Nx2WVbQRPJ5Mj992kf+sVzMSS700dA+bMHjC7geb/lpT6g=
X-Received: by 2002:a05:690e:1587:10b0:63c:e930:e31 with SMTP id
 956f58d0204a3-63ce9302089mr8326808d50.37.1760284563828; Sun, 12 Oct 2025
 08:56:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMMLpeRU72CMxHdF-rO9y1Nvzj9nPnuQTOZWcCrM4fOJ1byacw@mail.gmail.com>
 <2025101243-ongoing-truce-3aa5@gregkh>
In-Reply-To: <2025101243-ongoing-truce-3aa5@gregkh>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Sun, 12 Oct 2025 09:55:27 -0600
X-Gm-Features: AS18NWCfBikNPsC1ov_UvWHcoKFAZG2Dvkiaodb5y1im8CRsHB5WlQcutsuheo8
Message-ID: <CAMMLpeRrO_E3_c98OB9XvpiGNjhTetrw2ucFyaq5BByPWh58SA@mail.gmail.com>
Subject: Re: ttyACM versus ttyUSB
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, oneukum@suse.com, 
	Johan Hovold <johan@kernel.org>, vojtech@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 12, 2025 at 12:07=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Sat, Oct 11, 2025 at 11:00:00PM -0600, Alex Henrie wrote:
> > Dear kernel developers,
> >
> > I am very curious and I haven't been able to find a definitive answer
> > anywhere: Why is the cdc-acm driver separate from the general
> > usbserial driver? There are lots of drivers that use usbserial, each
> > with its own unique protocol. What makes ACM so special that it needs
> > to be separated out as /dev/ttyACM* instead of going with everything
> > else in /dev/ttyUSB*?
> >
> > I can think of several possible reasons, but I'd really like to know
> > what reasons matter to the kernel architects/maintainers.
>
> cdc-acm implements the USB specification for that protocol, which is
> defined by the USB group.  All of the usb-serial drivers do NOT follow
> that protocol and use their own vendor-specific ways of talking to the
> device.

OK, so it's just a matter of policy that drivers for standard USB
protocols name the device nodes differently than drivers for
vendor-defined USB protocols do?

-Alex

