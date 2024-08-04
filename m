Return-Path: <linux-usb+bounces-12926-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E7F946E5F
	for <lists+linux-usb@lfdr.de>; Sun,  4 Aug 2024 13:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B29C32820FF
	for <lists+linux-usb@lfdr.de>; Sun,  4 Aug 2024 11:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3363F28DBC;
	Sun,  4 Aug 2024 11:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lx8d+U5W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3512C1D545
	for <linux-usb@vger.kernel.org>; Sun,  4 Aug 2024 11:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722769872; cv=none; b=K5wFMaAGdEujuzupIpAoYVycUpDTQZzDR/+yg1WN7s/pVVRLzOxkdLh1qsvhW7stl8RNC2lm3YjYV1NXW0u4JS7heXUcbGNd3AGZrsOhFhy9s4TAWlxmf0nSSNcgZ8s7nBN+WTcgp8vg6rItPx/SWNbyZC8tLxSZDivyjApFmW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722769872; c=relaxed/simple;
	bh=5zH98SWKNfjV1Z4jmfqpi4xwDXkRkJNnTKTMsBBk+h4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mP/3wZpD/35cq1GffnVjkPZByeZS8dUNIKgmkL2fSi+K/PmZDaYJrlJ0l75+Jcr5rDX5D0Wx3TigmhDJQ0nSpNnw0kn+Jdw3OiUu3KLJxIdfagGA5dyg8Pre+i03uCawN4ucwYSnrZQG7xmPs7k7uT43rSIJN169PvFMCS/1dj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lx8d+U5W; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7a23fbb372dso6010507a12.0
        for <linux-usb@vger.kernel.org>; Sun, 04 Aug 2024 04:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722769870; x=1723374670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lD5yh5HmQbYO4pRHvlxCFk7QuVPvrL+DddhnrV7QQCA=;
        b=Lx8d+U5WVWK8DeoPQi2UtXliAwaumOCqLzuhbymjGxMCuymBxGUQ0aolvnVTPzBLsK
         +RAU678rp2t1yyoOeJ3WVZsiCdJ574W7CfVl9v6LYNaroSPQ5kvMzHpAhGz3Nr+AOSGS
         6IUmpgzBJsvDhhA0O0/lxHKyZbn4Fnlb8vA5vU61EuLdqcchhyaee7jjxPXALCCNKqvl
         RN5qYgxL6ur3c24eeS7Egk2WRGnUoD7yr2rj8GHhdyIdI7DZIpuVvA52aaICvX9rTptn
         fRB0AkelXs5zUtoeutY5Oet6HwbqVAhVp02Yr3NBOCP/EideU6+B++OCZMXw9pzjQJBA
         YITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722769870; x=1723374670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lD5yh5HmQbYO4pRHvlxCFk7QuVPvrL+DddhnrV7QQCA=;
        b=GH/rPY/Mt5ORUZRL7vUCKfVGyFFVsCHmju20MlybSprMAN0tCK4/CNDQIDpLtjq8EV
         lAQi6eDhyQBRp4WBQ+vb8jNgp0E83wVTGrqMr0mUdnIAw9OnHlE1pc5sIOL/3sYsDjJs
         gZy5yvLk6PDMPhHM6yaXcr2lwF4Eoz+O/GqZcDT9rKYRPZq89ta67pzjE1F5lRB5hCZ1
         Y0HmX7jUSz5So02o/bx08nxosWL+rtrFiuaci/Pi9I+iYAt6Fdy8idywlbDwREAo4Vrg
         Mc4AW5Sf/RTqTTEnCkIUgHwkw5UEl9L7Kc+vUHHXb7h35o5bhzHsnHe0/5L8bvporZ0V
         cXLw==
X-Forwarded-Encrypted: i=1; AJvYcCXey4sIXePsiSnDGTn3BrqUTFauXgtNkhh7aD+vEDTYTmOjy1WPRUADqPnzixorhvPQT8826VnT30NI1QbnhAQSUuMQbvWF/XPb
X-Gm-Message-State: AOJu0YxMf+fjTExxnKetRt13ggmRVvgDmyf3Ia4isy4Srpiji4VuFNL2
	ZJj7+ozszYlCJbF71QoCwLv618Fe9CYAej5QrQ15ta/es0yJgFk3LuMha9hCPgwdzWu+DOgQs05
	oFLilmtajClgvAq0HVSEKjK5sq1Q=
X-Google-Smtp-Source: AGHT+IHko+R4welhLdTFabScnVk9pB5Idm3v8PH/QZqDXnp/90ZHF2zyFMVgUiOdf5eWB24ztHh2pTR9r/jEr85l8aQ=
X-Received: by 2002:a05:6a20:7346:b0:1c4:986a:de71 with SMTP id
 adf61e73a8af0-1c69960e1a1mr9888627637.35.1722769870272; Sun, 04 Aug 2024
 04:11:10 -0700 (PDT)
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
 <e588d4ac-7acf-4b10-b368-93d01a2c4620@app.fastmail.com> <CADS+iDU-nrGeHiQkzJDEch3mq+sH31Q7T=Xjy_CQxSvrhcX13Q@mail.gmail.com>
 <15c51516-5aaa-47d5-bce9-7b260f6562ed@app.fastmail.com> <CADS+iDXYHwVxMceBu1tJ+=Cck3EqSp0bOVW1wnXX6v7iANcNWQ@mail.gmail.com>
In-Reply-To: <CADS+iDXYHwVxMceBu1tJ+=Cck3EqSp0bOVW1wnXX6v7iANcNWQ@mail.gmail.com>
From: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Date: Sun, 4 Aug 2024 13:10:59 +0200
Message-ID: <CADS+iDWnT_gvQ-0bP1RtuQR8GUKYtWkErx_CppMJSC+zPdW11g@mail.gmail.com>
Subject: Re: type-c subsystem is empty on Thinkpad T14 Gen 4 AMD
To: Mark Pearson <mpearson@squebb.ca>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, dgilbert@interlog.com, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!
After updating system firmware to 1.37, /sys/class/typec and
/sys/class/usb_power_delivery are populated. Thank you!

=D0=B2=D1=82, 11 =D0=B8=D1=8E=D0=BD. 2024=E2=80=AF=D0=B3. =D0=B2 16:02, Yar=
oslav Isakov <yaroslav.isakov@gmail.com>:
>
> On Tue, 11 Jun 2024, 15:46 Mark Pearson, <mpearson@squebb.ca> wrote:
> >
> >
> >
> > On Tue, Jun 11, 2024, at 8:45 AM, Yaroslav Isakov wrote:
> > > Hello, Mark!
> > > =D0=B2=D1=82, 11 =D0=B8=D1=8E=D0=BD. 2024=E2=80=AF=D0=B3. =D0=B2 14:3=
9, Mark Pearson <mpearson@squebb.ca>:
> > >>
> > >> Hi
> > >>
> > >> On Wed, Mar 20, 2024, at 2:38 PM, Yaroslav Isakov wrote:
> > >> > Hello, Mark!
> > >> >
> > >> > =D0=BF=D0=BD, 18 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 2=
0:42, Mark Pearson <mpearson@squebb.ca>:
> > >> >>
> > >> >>
> > >> >>
> > >> >> On Mon, Mar 18, 2024, at 3:22 PM, Yaroslav Isakov wrote:
> > >> >> > Hello, Mark!
> > >> >> >
> > >> >> > =D0=BF=D0=BD, 18 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=
=B2 19:48, Mark Pearson <mpearson@squebb.ca>:
> > >> >> >>
> > >> >> >> On Thu, Feb 22, 2024, at 9:30 AM, Mark Pearson wrote:
> > >> >> >> > Hi,
> > >> >> >> >
> > >> >> >> Just to confirm that I've tested a trial BIOS from the FW team=
 and it fixes the issue (shows up under /sys/class/typec
> > >> >> > Great to hear, thank you!
> > >> >> >
> > >> >> >> If there's anything in particular you'd like me to confirm let=
 me know.
> > >> >> >
> > >> >> > If /sys/class/typec is populated, I think it should be enough..=
. Just
> > >> >> > to double check, is /sys/class/usb_power_delivery populated, to=
o, now?
> > >> >>
> > >> >> Yes. From my system:
> > >> >>
> > >> >> # ls /sys/class/typec
> > >> >> port0  port0-partner  port1
> > >> >> # ls /sys/class/usb_power_delivery
> > >> >> pd0  pd1  pd2
> > >> >>
> > >> >
> > >> > Great! These are the ones I saw with my workaround, too.
> > >> >> >
> > >> >> > I also did not manage to see anything in /sys/class/usb_role or
> > >> >> > /sys/class/typec_mux, even with my hack - is it expected on AMD=
,
> > >> >> > because of lack of appropriate mux/role switch drivers?
> > >> >>
> > >> >> I'm not seeing anything under those with this BIOS either
> > >> >>
> > >> >> I checked on an Intel platform on my desk (P14s G3) and those are=
n't populated there either...so not sure this is AMD specific.
> > >> >> I'm being lazy and not looking at the kernel code - what would we=
 expect to see in those entries?
> > >> >
> > >> > According to
> > >> > https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-class-u=
sb_role,
> > >> > with /sys/class/usb_role, we can switch between host and device mo=
des.
> > >> > My main interest there is typec_displayport driver - to be able to=
 see
> > >> > altmode info (not sure, though, in which /sys directory). With my
> > >> > workaround, I failed to see this driver detecting my dock, so, I w=
as
> > >> > wondering, if it's caused by wrong UCSI version reported, or some
> > >> > other driver missing (DP altmode is working with the doc, just no =
info
> > >> > from typec_displayport driver)
> > >> >
> > >> > BTW, what is the version of ucsi reported from firmware? I wonder,=
 if
> > >> > it will work with this change
> > >> > https://lore.kernel.org/linux-usb/20240209223824.622869-1-abhishek=
pandit@chromium.org/
> > >> >
> > >> Just as a note - BIOS 1.36 was released with the fix. Available on L=
VFS.
>
> BTW, I cannot see it in fwupdmgr, I have only 1.35 there (I had to
> update via ISO from pcsupport.lenovo.com):
>
> LC_ALL=3Den_US.UTF8 fwupdmgr get-releases
> WARNING: UEFI ESP partition not detected or configured
> See https://github.com/fwupd/fwupd/wiki/PluginFlag:esp-not-found for
> more information.
> 0.    Cancel
> 1.    83cd12f4f179d6eb6964a74a006840294f7e9c4e (Embedded Controller)
> 2.    6c946da70cfcaaf4a1d4660f82906333c1c96b8d (System Firmware)
> 3.    362301da643102b9f38477387e2193e57abaa590 (UEFI dbx)
> Choose device [0-3]: 2
> LENOVO 21K3003RCK
> =E2=94=82
> =E2=94=9C=E2=94=80ThinkPad T14/P14s Gen 4 and T16/P16s Gen 2 AMD System U=
pdate:
> =E2=94=82     New version:        0.1.35
> =E2=94=82     Remote ID:          lvfs
> =E2=94=82     Release ID:         88330
>
> >
> > > I tried 1.36 (R2FET56W) when it was released, but it did not fix my
> > > issue. I have it installed, for sure:
> > > sudo dmidecode | grep 1.36
> > >     Version: R2FET56W (1.36 )
> > > but kernel still sees result of ret =3D ucsi->ops->read(ucsi,
> > > UCSI_VERSION, &ucsi->version, sizeof(ucsi->version)); as 0
> > >
> > > I also have latest EC firmware, too (corresponding to BIOS version)
> > > I'll try to reset BIOS to default setting, to check if it will help.
> >
> > Strange - let me check. I did test the trial FW on my system but haven'=
t updated to the release version yet.
> > Thanks for letting me know
>
>
> BTW,

