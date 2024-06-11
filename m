Return-Path: <linux-usb+bounces-11139-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5ED903C20
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 14:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E45701F23C6F
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 12:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7485178CCF;
	Tue, 11 Jun 2024 12:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9oCw79F"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A5738DC0
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 12:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718109925; cv=none; b=Dn2Q1RDDV2VbZnI1xnnjXo5R8A/D0u5xWFrnpox51P/s2QVgU9djTGfGVJsE6Hn2o8UFONG867ogYIEKkltj/5Opz2jAYr1nde61ExUbhKFcoydzfoDKlpKAjccvGPCv2w5hRTtJUQJN9wlMyXH6aV+h29A9XkMbmcCWEeNkR7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718109925; c=relaxed/simple;
	bh=zLVO3/6HT7KfDEGDq8lLcsX/3ZqqLHN75+9rC4VH18E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IsXUvDjVReO0JfdaW2DbpjVxwpHSGopx5XQMyaRQNNZPmZchh8l3E2aFiauNsavtvBbcq4PPbAFzRsSYunO+iE0ZQETGVP9xKFNqH69zA2ByNeZw2vAMIPsAeV4fyst0V3sp0uzG5a0WNMkXNnKOEPnKOhN3ZKvLC37NOy+g4kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9oCw79F; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6f41045a69so8760566b.0
        for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 05:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718109922; x=1718714722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXi0m5S6r7HFWPqGg3ggQlqMkHOgvt3TouzvORlGg+c=;
        b=f9oCw79F4ryCXD3D9XHIRk0qHz7aF9lNLP5p2lJo3MJ3NwpCiBn4/k2Q5tEOb83Mq6
         3hpJqvjg5C4QzKteQ1RNgNeYFvj5XtNWFAEoSGsA449VW8aYUygQc+Cy8aeNfD/mO5Ss
         m38Xz5rOBZp4Ir/vz2D1bXPCkI3UbZUaLQkCPPCsV/p/8uf0USL0E+tRNDZaowNS6TEG
         OUUOfOlsO0/p0lo9z0EZIDIQsd5qeZjId0D7S2+5xK9zROyNmlrvuB7PBxCk/E7GggpD
         bMbWyqpaz/cwB9scrsI3Lx6RsL1K3UYCKux5y709cjL17LEIXyRYOPv2f7udppimgGFj
         ATXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718109922; x=1718714722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXi0m5S6r7HFWPqGg3ggQlqMkHOgvt3TouzvORlGg+c=;
        b=gLo6+/NnBOqI0CkBb/a/Z7K+XBDTiyl0JI5dQT1I0zErCAb/vILZF0Pe8DWdED7GI8
         Nvv7iPbMCVyUt/B6QQ6kzHJXy9xh2kJJ7zjLfBTwup3bZCFmZc0bOERjq16SCmNX1Tdb
         o64TXysfpij5MOQkyzN0eLkvv628rueGaJRIC7U7jfoeZZoPoVzZ/hhkjZDjRo5g6WXB
         tq4H1i2gY7UYe3RFwVGaTtp8xK9I3utfy8iYf7sEuJjIVabeojtiMp7OsXcyS2PgCT3x
         Uz/n0v0slsp7zIYePda5j9F1hP7mE0WJKaDaYeQCHPn6x1joxEhbm+2pCNweJrR6tu5i
         cRfw==
X-Forwarded-Encrypted: i=1; AJvYcCVJBj5TIJqnG7lSWtslrlCPOfdtMUcuCoJocuGJi0EHVS0z2sxhBw7nsEF46e75YJUfyRvmYC3u4ENCdGDOjVh+pmADjMNW1SU0
X-Gm-Message-State: AOJu0YwPvf66bApALrRkpL5N7DZ9gPk1ZtDvmXEG0UfRNDpixQy34jdZ
	1DvejnbNCQ7AmpBqLD9u7gWP9HUfL6G/3JUObp7hd+nQwUXYKVxeqLk/w0KrTBL048weci7+Q4f
	MEV47q/ehKcG01rmDTwu5lrmzLkGRq0nF
X-Google-Smtp-Source: AGHT+IEdlFtEOJp1rsi970l20eEIgJkgdEpFOcKMrOpWxu54tq9Dc+3/fbRNVk9C2jxNaEEHHOCZVlWlQu863OeX0gw=
X-Received: by 2002:a50:d591:0:b0:57c:6fdc:4cd7 with SMTP id
 4fb4d7f45d1cf-57c6fdc4f3bmr6002259a12.4.1718109921709; Tue, 11 Jun 2024
 05:45:21 -0700 (PDT)
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
 <03dbee0a-09e3-4ef4-ad19-c8c4280f2707@app.fastmail.com> <CADS+iDVSKJZUMSxWE=NOTtyRR8+VBj1mJ5LvaRLAO-yeZ2NBTA@mail.gmail.com>
 <e588d4ac-7acf-4b10-b368-93d01a2c4620@app.fastmail.com>
In-Reply-To: <e588d4ac-7acf-4b10-b368-93d01a2c4620@app.fastmail.com>
From: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Date: Tue, 11 Jun 2024 14:45:09 +0200
Message-ID: <CADS+iDU-nrGeHiQkzJDEch3mq+sH31Q7T=Xjy_CQxSvrhcX13Q@mail.gmail.com>
Subject: Re: type-c subsystem is empty on Thinkpad T14 Gen 4 AMD
To: mpearson@squebb.ca
Cc: heikki.krogerus@linux.intel.com, dgilbert@interlog.com, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, Mark!
=D0=B2=D1=82, 11 =D0=B8=D1=8E=D0=BD. 2024=E2=80=AF=D0=B3. =D0=B2 14:39, Mar=
k Pearson <mpearson@squebb.ca>:
>
> Hi
>
> On Wed, Mar 20, 2024, at 2:38 PM, Yaroslav Isakov wrote:
> > Hello, Mark!
> >
> > =D0=BF=D0=BD, 18 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 20:42,=
 Mark Pearson <mpearson@squebb.ca>:
> >>
> >>
> >>
> >> On Mon, Mar 18, 2024, at 3:22 PM, Yaroslav Isakov wrote:
> >> > Hello, Mark!
> >> >
> >> > =D0=BF=D0=BD, 18 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 19:=
48, Mark Pearson <mpearson@squebb.ca>:
> >> >>
> >> >> On Thu, Feb 22, 2024, at 9:30 AM, Mark Pearson wrote:
> >> >> > Hi,
> >> >> >
> >> >> Just to confirm that I've tested a trial BIOS from the FW team and =
it fixes the issue (shows up under /sys/class/typec
> >> > Great to hear, thank you!
> >> >
> >> >> If there's anything in particular you'd like me to confirm let me k=
now.
> >> >
> >> > If /sys/class/typec is populated, I think it should be enough... Jus=
t
> >> > to double check, is /sys/class/usb_power_delivery populated, too, no=
w?
> >>
> >> Yes. From my system:
> >>
> >> # ls /sys/class/typec
> >> port0  port0-partner  port1
> >> # ls /sys/class/usb_power_delivery
> >> pd0  pd1  pd2
> >>
> >
> > Great! These are the ones I saw with my workaround, too.
> >> >
> >> > I also did not manage to see anything in /sys/class/usb_role or
> >> > /sys/class/typec_mux, even with my hack - is it expected on AMD,
> >> > because of lack of appropriate mux/role switch drivers?
> >>
> >> I'm not seeing anything under those with this BIOS either
> >>
> >> I checked on an Intel platform on my desk (P14s G3) and those aren't p=
opulated there either...so not sure this is AMD specific.
> >> I'm being lazy and not looking at the kernel code - what would we expe=
ct to see in those entries?
> >
> > According to
> > https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-class-usb_ro=
le,
> > with /sys/class/usb_role, we can switch between host and device modes.
> > My main interest there is typec_displayport driver - to be able to see
> > altmode info (not sure, though, in which /sys directory). With my
> > workaround, I failed to see this driver detecting my dock, so, I was
> > wondering, if it's caused by wrong UCSI version reported, or some
> > other driver missing (DP altmode is working with the doc, just no info
> > from typec_displayport driver)
> >
> > BTW, what is the version of ucsi reported from firmware? I wonder, if
> > it will work with this change
> > https://lore.kernel.org/linux-usb/20240209223824.622869-1-abhishekpandi=
t@chromium.org/
> >
> Just as a note - BIOS 1.36 was released with the fix. Available on LVFS.
I tried 1.36 (R2FET56W) when it was released, but it did not fix my
issue. I have it installed, for sure:
sudo dmidecode | grep 1.36
    Version: R2FET56W (1.36 )
but kernel still sees result of ret =3D ucsi->ops->read(ucsi,
UCSI_VERSION, &ucsi->version, sizeof(ucsi->version)); as 0

I also have latest EC firmware, too (corresponding to BIOS version)
I'll try to reset BIOS to default setting, to check if it will help.
>
> Mark

