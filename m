Return-Path: <linux-usb+bounces-8633-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AE5891082
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 02:45:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59CC61F23F3D
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 01:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEEFB182CC;
	Fri, 29 Mar 2024 01:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=one-eyed-alien.net header.i=@one-eyed-alien.net header.b="PG6ztL9b"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF8CA3D
	for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 01:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711676751; cv=none; b=S7Wua+0fXdXdFABm51ooNGOuQZ5cjrVvjGXIwUPRSx7v7fs9JCJiG1jkAaL481YuCf2Ql0pTFsd2WlopwXJ8HAmU/4nF0LWj1BMJCbW/thhpOefpYQw839dLJz/6E0k4LrvvUY6T1KoPx4mrrmnnNmSnMWsvbszGUbIGV4qvfw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711676751; c=relaxed/simple;
	bh=Q1oy6UwJ/0y51Mvon2Pvha2O88+IwX7Uo1VOfJ8TRkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FwKdcWJYCdaJPkkh6c45YxSqnCvR42KUvQK5kpet9JoPJX0B4/WtFBY86qSdCUHyfPxwMLBDWAiPhikXLoc7a3Y78ZWsfaekoYFw41CJqPN1LNafKFJKmNJOh6UiL6iMDuJsvRA6Ia8mImxSlZieJe9m/cDjVi/j6T01/4bZ9IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=one-eyed-alien.net; spf=pass smtp.mailfrom=one-eyed-alien.net; dkim=pass (1024-bit key) header.d=one-eyed-alien.net header.i=@one-eyed-alien.net header.b=PG6ztL9b; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=one-eyed-alien.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=one-eyed-alien.net
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-609f1f97864so18126777b3.0
        for <linux-usb@vger.kernel.org>; Thu, 28 Mar 2024 18:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=one-eyed-alien.net; s=google; t=1711676748; x=1712281548; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vo2THDAmcgguZrArlqRwMiyipMqDod7x18NpKsBJsas=;
        b=PG6ztL9bkhMWhh7ZBSTzXS82Vn3Kzn29CMI7TUc449AfODUYyZiScLjykMk65Bbhm9
         rvrn0atcEEwK+5NhvEbQyVxEiJs/D1c8jE+ABMB4YDWw3XptQgrNvHoQBjjk66LgA6LI
         KyFKjO3rQo3yzaAeIJtcHahKsWxdYpIYvtMpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711676748; x=1712281548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vo2THDAmcgguZrArlqRwMiyipMqDod7x18NpKsBJsas=;
        b=wTdniHOSfWSt4RzP4hmCyrkDKn96jeaOU24f9o7qN2ayoyZvB0QS0w9gNj5U68m+uo
         d+MEC9I6NfjOpF5rmRYStmT668pkt6WTxjMJybx9DOzqtej0MxPgZ9WoUfeVAa3twq3g
         gykIfIys5qrwfZZGAAIVtooaVA5AzHPuj4Vg+yeeT8VUZB8wugKpxGkc+IYEJ/Rn5yq0
         lKbfDM5wgrToH152r+dHhDWyEoxXnVtTgGKBEZYqJRE0TOBZdJ7rO8PPyjmWyT7FfvTY
         KgHAOMenYt0YNUCdX0Sp0AtPelQCC2gc5gRiH4oZS3ptrqWwTQldxdU5Br0vA1BEuuZ7
         YJRw==
X-Forwarded-Encrypted: i=1; AJvYcCU4A0wdAJysoNKfQShXXBqObO9TzfqFK0xz2VuIgCP88EDnjWPaluN7z/PmLVCQmj4OlDgNo1nNWu9f4kJhgXx+bmI4Mm04vPwI
X-Gm-Message-State: AOJu0YxcYOKAmZkGQP4obkmwcWJ5tf6TJgtOZzYqnkzJRFC+HwrsqE5B
	qQQ8/DQSf9ipWaz8UpbVOZRMIsvCujbAUrEeBXZk5pkH1YRRDlxiWfl/PMCmyNR5HQdOOWkVynu
	hMgE5Pg8oVrzY6XlrxipRyJ7OI0oHJ6Xn93JBuA==
X-Google-Smtp-Source: AGHT+IFvTzasW4pLTN9fpnky1kEP+DtjjFBai52w5qhSNRp5JxEKC9455PGC2EF+lQ+XoeTSH1JIIlYRVYKBS/GTV2s=
X-Received: by 2002:a0d:f706:0:b0:610:b930:816a with SMTP id
 h6-20020a0df706000000b00610b930816amr1227020ywf.49.1711676748277; Thu, 28 Mar
 2024 18:45:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327055130.43206-1-Norihiko.Hama@alpsalpine.com>
 <2024032757-surcharge-grime-d3dd@gregkh> <TYVPR01MB107814D7A583CB986884AD4B290342@TYVPR01MB10781.jpnprd01.prod.outlook.com>
 <a446cdf4-3a9b-43d8-b22b-78c20cce2b4f@rowland.harvard.edu>
 <TYVPR01MB10781AA8B37E147E318597B46903B2@TYVPR01MB10781.jpnprd01.prod.outlook.com>
 <0c99daaf-c727-467f-b8c1-ba8846d8a9ab@rowland.harvard.edu>
 <CAA6KcBBcpug-rOytgnbb=c4O54m-Pfy=divqp12qOMrgmQrz7w@mail.gmail.com> <2483fb37-8939-4723-ae8d-7a7a7dba3322@rowland.harvard.edu>
In-Reply-To: <2483fb37-8939-4723-ae8d-7a7a7dba3322@rowland.harvard.edu>
From: Matthew Dharm <mdharm-usb@one-eyed-alien.net>
Date: Thu, 28 Mar 2024 18:45:36 -0700
Message-ID: <CAA6KcBC0JHMtKj=35TQgtbnoJQQDAmcxp=NKJ8bBxbJPCNNadQ@mail.gmail.com>
Subject: Re: [PATCH] usb-storage: Optimize scan delay more precisely
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Norihiko Hama <norihiko.hama@alpsalpine.com>, Greg KH <gregkh@linuxfoundation.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"usb-storage@lists.one-eyed-alien.net" <usb-storage@lists.one-eyed-alien.net>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 9:18=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Thu, Mar 28, 2024 at 08:21:18AM -0700, Matthew Dharm wrote:
> > On Thu, Mar 28, 2024 at 7:51=E2=80=AFAM Alan Stern <stern@rowland.harva=
rd.edu> wrote:
> > >
> > > On Thu, Mar 28, 2024 at 03:04:47AM +0000, Norihiko Hama wrote:
> > > > > On Wed, Mar 27, 2024 at 07:39:55AM +0000, Norihiko Hama wrote:
> > > > > > > Sorry, but module parameters are from the 1990's, we will not=
 go back to that if at all possible as it's not easy to maintain and will n=
ot work properly for multiple devices.
> > > > > > >
> > > > > > > I can understand wanting something between 1 and 0 seconds, b=
ut adding yet-another-option isn't probably the best way, sorry.
> > > > > > 1 second does not meet with performance requirement.
> > > > > > I have no good idea except module parameter so that we can main=
tain backward compatibility but be configurable out of module.
> > > > > > Do you have any other better solution?
> > > > >
> > > > > Can you accomplish what you want with a quirk flag?
> > > >
> > > > I think that it's hard to do that because 'quirk' is specified for =
a device
> > > > but it's difficult to identify the devices to make quirk, especiall=
y for future introduced devices.
> > > >
> > > > Can we change the design of existing 'delay_use' ?
> > > > For example, 'delay_use' is 32-bit value and the value "1000 secs" =
does not make sense to set it,
> > > > So if it's set to '1100', it's treated as "100 / 1000 =3D 0.1 sec".=
 Is this possible?
> > >
> > > Here's an approach that Greg might accept.
> > >
> > > Since we already have a delay_use module parameter, we could add a
> > > delay_use_ms parameter.  The two module parameters would display the
> > > same value, but delay_use_ms would be in milliseconds instead of in
> > > seconds.  (This is similar to what we did for the autosuspend and
> > > autosuspend_delay_ms sysfs attributes.)
> >
> > What about just changing the parser on the currently delay_use
> > parameter to accept an optional suffix?  If it's just digits, it is in
> > seconds.  If it ends in "ms", then interpret it as milliseconds.  This
> > would be backwards compatible with existing uses, give you the
> > flexibility you want, avoid adding another modules parameter, and
> > potentially be expandable in the future (if, for some reason, someone
> > wanted microseconds or kiloseconds).
>
> A little unconventional, I think (at least, I don't know offhand of any
> other module parameters or sysfs attributes that work this way), but it
> would work.

Actually, I got the idea from the existing parameters such as "mem=3D"
and similar, which accept K, M, or G as suffixes to denote the units
for the number.  Credit where credit is due.

Matt


--=20
Matthew Dharm
Former Maintainer, USB Mass Storage driver for Linux

