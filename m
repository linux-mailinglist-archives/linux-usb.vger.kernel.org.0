Return-Path: <linux-usb+bounces-8112-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA0088175E
	for <lists+linux-usb@lfdr.de>; Wed, 20 Mar 2024 19:39:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38DCB1F2212F
	for <lists+linux-usb@lfdr.de>; Wed, 20 Mar 2024 18:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161E185624;
	Wed, 20 Mar 2024 18:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQf0VZGS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F4285285
	for <linux-usb@vger.kernel.org>; Wed, 20 Mar 2024 18:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710959935; cv=none; b=ojKr2PrwSyuk9l0JrYZIqYcQtq5AWBw85d3DH4lKew41rTF+GlLBGKjMsiiKUKjTpJd79YNnI+ITs7gz+wXfgJmFVlZHfdtxZ1hAkaE0gsD1NY3kVd9rny/LJxxptYvhzRK8nOWVyh6IlhpP1Nv0rZnDnbwpN8D6rdVWIi6F0Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710959935; c=relaxed/simple;
	bh=Rx8dQSexs9gkntm3zfKWlFAvU1UjpkrC9hbdYwWdUPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ByiQS5f31jAqO03vwhjfA8VZYPmMWKCFU1fl7FyQI89ju9HDoY5QJ9pC8tKpTeV4XmZTlUSB81AP+CKdUQ+Jjy2C4cUtdubh0FpmfxKvaH+egGNW1s95QGXmCV/MEUfrm51EgI5cHtQsoG+qgZvcySEbBjd+PDtn+R6EaeTb6xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQf0VZGS; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56ba73c02b2so138467a12.0
        for <linux-usb@vger.kernel.org>; Wed, 20 Mar 2024 11:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710959932; x=1711564732; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63/0xALUqLm64q8KfqcdrXWsSKjHlpezE7MEqgcaars=;
        b=BQf0VZGSiJe5acAqWH6BZ+WwFGy2BtkFvAqQkk2jtfCAqhUuzqS8FJsjDuV8esb2NW
         HcMejcq+l2vtEhHiOWwhMYF53wnA8+S0BeY2MpKqb0SX0DNDxS85kTFNjNADdw0f9zqQ
         BDGg25DwIGd8nAs5xjNpgI/C2jUOx7oBhnKB1SiqY1ixaGI7/hO5uWHyohrYy9UMupDM
         9JsZIjNeKpsKu/mKJ9u20ZQJq4jZck3TpFDr5jaOHbOrA64kRtwFbSZD3U78BN6nMyrI
         0mYNrEJkR//Tk4KWtjM9cY+zPMYfQ3RqT4XiCxEHBWBoy7NwKZ+VWeffArURHBWpr3On
         30+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710959932; x=1711564732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63/0xALUqLm64q8KfqcdrXWsSKjHlpezE7MEqgcaars=;
        b=h45YfgvWTY634PKISV49wowObdW+Q2fhtyMvg60EUmClxaQwOnK2p+QFamy42MB0Ds
         IHiRpdOvQTnCSX083bqPMN/nd/quNBJTGd3LjCzqxBnFVFtBYsb4DlrYuU3pvzwFUDPu
         gyN+1xkSchMPKo/vnQnyqWeBfIeKyD4vLrvNHS7St0xcXvJeQ1dtpPBwG27YgCf1+S+V
         5hLV9aHFUJEdFmGuCsxRatWK94WnLM1QXzKWOtMjfdYlemDbt4oiM3rmp4vuQ1hSo2d1
         GmNGIkPgNghtlEc3TrYSXYzwmk71d3ZnKDhiuZYAIiq/2+9jT0sQ+Dc3Uyy/v7+YYd11
         9e0A==
X-Forwarded-Encrypted: i=1; AJvYcCVVVq4CuOAXU09+bu2OrHTIoHG4ZIfnf5cLLmxnd04Bl5OhL7tk0BN6Pb041Sv5zd0FG6JQ+CRY5bQQjOiluzpFYtg1O7HRgk0K
X-Gm-Message-State: AOJu0YwthegW8a6N40sjlGVYAFSHL91nln4Olg+GfOjVRCXdGu7zhhWl
	q/vghecQUWcAocwlpoZhC+I0ZePfOB1OS3DVTfX6TMNVzWUY5eqN/XZSm5AWr3evS+Uf7V9pihs
	xfcyiiZNHBgckvZ+ip9DuwN3RZ3xLlWcBBiU=
X-Google-Smtp-Source: AGHT+IH1uL8OUTF76oxWKlkpd3OlZW6JihU6NsX8JOLaqbN9CUFFAJuWDeGBfpffZZvskVbujtG1d3hEveNHLhXf+8A=
X-Received: by 2002:a05:6402:3607:b0:56b:a7e3:7426 with SMTP id
 el7-20020a056402360700b0056ba7e37426mr2514587edb.34.1710959932015; Wed, 20
 Mar 2024 11:38:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADS+iDWFVZp81Ck48wQjzh--n_7Z-bV2u0SR4Z6-OZOMBLeMKw@mail.gmail.com>
 <520bd89d-b6e4-4654-adcd-8bb884802f56@interlog.com> <CADS+iDVhNzAHfbW+Nks_29rgJXwFTCsTU93XHQpCYBCW6cvxzQ@mail.gmail.com>
 <e7257a7a-1391-47e7-9702-d7c9ec3ff338@interlog.com> <CADS+iDWM8czf-D8D8H1gx2YBPCYbO4cexO83dUQ6-H8KKQSx4g@mail.gmail.com>
 <CADS+iDWSsLA+HrFLsD4nvo5KCRJTdiuZKp5cYVkXBnkC_nTfRw@mail.gmail.com>
 <eff9a939-cd38-4cbd-89a4-faebc0de67e6@interlog.com> <CADS+iDVAyUXQ-KXHgSgJkO=t3msGs5MhyVkBqcaV_N6SSw4EdQ@mail.gmail.com>
 <ZYFqS+QAl6ZKdPQ5@kuha.fi.intel.com> <b696742d-82a5-4882-8997-6acb8cec28e4@app.fastmail.com>
 <64479f78-4359-4eb5-9367-257b24f62ccd@app.fastmail.com> <CADS+iDWQxsgvAnkfu8Nukjw5E3d49pwBsWZScyc_HQLGKLwbgg@mail.gmail.com>
 <03dbee0a-09e3-4ef4-ad19-c8c4280f2707@app.fastmail.com>
In-Reply-To: <03dbee0a-09e3-4ef4-ad19-c8c4280f2707@app.fastmail.com>
From: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Date: Wed, 20 Mar 2024 19:38:40 +0100
Message-ID: <CADS+iDVSKJZUMSxWE=NOTtyRR8+VBj1mJ5LvaRLAO-yeZ2NBTA@mail.gmail.com>
Subject: Re: type-c subsystem is empty on Thinkpad T14 Gen 4 AMD
To: Mark Pearson <mpearson@squebb.ca>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, dgilbert@interlog.com, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, Mark!

=D0=BF=D0=BD, 18 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 20:42, Mar=
k Pearson <mpearson@squebb.ca>:
>
>
>
> On Mon, Mar 18, 2024, at 3:22 PM, Yaroslav Isakov wrote:
> > Hello, Mark!
> >
> > =D0=BF=D0=BD, 18 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 19:48,=
 Mark Pearson <mpearson@squebb.ca>:
> >>
> >> On Thu, Feb 22, 2024, at 9:30 AM, Mark Pearson wrote:
> >> > Hi,
> >> >
> >> Just to confirm that I've tested a trial BIOS from the FW team and it =
fixes the issue (shows up under /sys/class/typec
> > Great to hear, thank you!
> >
> >> If there's anything in particular you'd like me to confirm let me know=
.
> >
> > If /sys/class/typec is populated, I think it should be enough... Just
> > to double check, is /sys/class/usb_power_delivery populated, too, now?
>
> Yes. From my system:
>
> # ls /sys/class/typec
> port0  port0-partner  port1
> # ls /sys/class/usb_power_delivery
> pd0  pd1  pd2
>

Great! These are the ones I saw with my workaround, too.
> >
> > I also did not manage to see anything in /sys/class/usb_role or
> > /sys/class/typec_mux, even with my hack - is it expected on AMD,
> > because of lack of appropriate mux/role switch drivers?
>
> I'm not seeing anything under those with this BIOS either
>
> I checked on an Intel platform on my desk (P14s G3) and those aren't popu=
lated there either...so not sure this is AMD specific.
> I'm being lazy and not looking at the kernel code - what would we expect =
to see in those entries?

According to https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-cla=
ss-usb_role,
with /sys/class/usb_role, we can switch between host and device modes.
My main interest there is typec_displayport driver - to be able to see
altmode info (not sure, though, in which /sys directory). With my
workaround, I failed to see this driver detecting my dock, so, I was
wondering, if it's caused by wrong UCSI version reported, or some
other driver missing (DP altmode is working with the doc, just no info
from typec_displayport driver)

BTW, what is the version of ucsi reported from firmware? I wonder, if
it will work with this change
https://lore.kernel.org/linux-usb/20240209223824.622869-1-abhishekpandit@ch=
romium.org/

>
> Mark

