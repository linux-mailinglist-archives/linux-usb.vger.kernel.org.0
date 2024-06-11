Return-Path: <linux-usb+bounces-11142-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0A4903E51
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 16:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D12791C24D3C
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 14:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031DE17C7BE;
	Tue, 11 Jun 2024 14:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B50H2vqZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15031DFF8
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 14:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718114548; cv=none; b=efz8jBqeWmXj5nTm7XSWl3Oxt11tXud8BsiKqyMZ6ZPb2Wf27nYUS8azZjskVSDGfmh9e1rXFnaTissh9lvGfg7X53niaC095/tv5D4BeRlXkOTzcpf+q1uzx1u9NaNqf905lwo4Mvx855+0RP4GTUdsF0xP/AWMms+bjGOLJF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718114548; c=relaxed/simple;
	bh=UQOcWuKdXlOJBwGw6i0PSx9BQtYveXuHtr8RKV6aNHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SCIoXs87ZZ/LPrrrIuOyixE2XGFRatZhH/tIKmmTeCoe58Ez8gFedEyK3O7J3rsphUt8Gn+w3ZtANKQ+DrvHBTe1OFo4hroNQLwv7zIkpYXHNRZgUHvMYDa5lPN2vtAe8Vu1g6oz+/L3zpMOOc3Ec9tR4Bgj4YnYK/zcP4YrYdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B50H2vqZ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57c60b13a56so4798276a12.0
        for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 07:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718114545; x=1718719345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83Rf53AgCK8HIpfKc+MBPryR4wOCX+EWHu8BoPgshDM=;
        b=B50H2vqZItebqFvsoSw/TJJdUYwq/qzMelPFIY+uAmDnU/zM4YzUYGlRy8DZLV1TCv
         tK9tVg0O8vexStsDvhDxzpJ7SfXGTx0YCg8m3nqM6jtKbvGdUdMK8knfubdlnZYKymxu
         uLEOXDFQOwZJu/WTPLq/f9pXnH69vNGDnAkitn5H4ZL7Axi23filrxTK84iGXVs8JrY8
         /YVatDEvVQSTPFXWjFWw/CkinLu077RUhFZSbkgyaxXFVSKgF3M7yJ7baRR1bpTT+GqC
         BMoze0aUPi5ox22LRfiHk8FhbyvHJYn4iAjTPdfYhgPow2IAMBaCISdm067Lj2uk/oAu
         1EmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718114545; x=1718719345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83Rf53AgCK8HIpfKc+MBPryR4wOCX+EWHu8BoPgshDM=;
        b=FuIPfAD1CWR1plZvI02/NKjoBFOxspceSMVMaLSQ0uS07v1zboIP6T1BS24EsalAWg
         LqYbuXW/6xWA9fjiV70xcgzE1SCq67YqSOeMflNr/8CMTfs80xga2aqCPExWv9KlA6O6
         x87ZvTKw3TaqPF2P2wyRH1RbbGInHif75BDse94rgYBC5KV6g6r2NSwKuSI0q0M5O+5V
         zH/sYrWJhN58v4n2o0ORvBqlvZ4zmvKlfRbm7v4NqXx3gLV/OIsYEkagove5s9doF0wo
         YMRb5FJr30NmjcqCdwD+bSZpRq9Rmp1WjvM8lBM+qNB7YGjmGLxCqBgHAst+MmJMwr3w
         xSFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU56cgDmuaOqu5n+Va8F0IITL8kSyoiIYWCMBbpRzmHxvH2h/MejU55X0mplBIG7OURv4MOSnaR10RLUFhi2eeU5qmCz8OfOB8Z
X-Gm-Message-State: AOJu0YyrOs3STj7jjEz1bgauNJoO+GJg0aSG0fIKWCYrSRFyj4Apna8v
	UCTuqR1yb6zJiIcayE3kA76InZjvHEu8NH9lJd5AXNEOaoyo002CFGjT+OitnOQlw/lOdAh3Dse
	6GZdgB88U/AyRi5VPWnyg+I64XVbEFU2dUC4=
X-Google-Smtp-Source: AGHT+IGeUzuQaVA0p7KXetlXjF/kAA40AtkJAxSLfwNTXcAKj1VD5KY7tqstSuV9OZa3sTUaIvhWkSOkZvEE6IcOjuU=
X-Received: by 2002:a50:aad1:0:b0:57c:7541:c6a9 with SMTP id
 4fb4d7f45d1cf-57c7541c6aemr3854607a12.24.1718114544851; Tue, 11 Jun 2024
 07:02:24 -0700 (PDT)
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
 <15c51516-5aaa-47d5-bce9-7b260f6562ed@app.fastmail.com>
In-Reply-To: <15c51516-5aaa-47d5-bce9-7b260f6562ed@app.fastmail.com>
From: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Date: Tue, 11 Jun 2024 16:02:12 +0200
Message-ID: <CADS+iDXYHwVxMceBu1tJ+=Cck3EqSp0bOVW1wnXX6v7iANcNWQ@mail.gmail.com>
Subject: Re: type-c subsystem is empty on Thinkpad T14 Gen 4 AMD
To: Mark Pearson <mpearson@squebb.ca>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, dgilbert@interlog.com, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 11 Jun 2024, 15:46 Mark Pearson, <mpearson@squebb.ca> wrote:
>
>
>
> On Tue, Jun 11, 2024, at 8:45 AM, Yaroslav Isakov wrote:
> > Hello, Mark!
> > =D0=B2=D1=82, 11 =D0=B8=D1=8E=D0=BD. 2024=E2=80=AF=D0=B3. =D0=B2 14:39,=
 Mark Pearson <mpearson@squebb.ca>:
> >>
> >> Hi
> >>
> >> On Wed, Mar 20, 2024, at 2:38 PM, Yaroslav Isakov wrote:
> >> > Hello, Mark!
> >> >
> >> > =D0=BF=D0=BD, 18 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 20:=
42, Mark Pearson <mpearson@squebb.ca>:
> >> >>
> >> >>
> >> >>
> >> >> On Mon, Mar 18, 2024, at 3:22 PM, Yaroslav Isakov wrote:
> >> >> > Hello, Mark!
> >> >> >
> >> >> > =D0=BF=D0=BD, 18 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 =
19:48, Mark Pearson <mpearson@squebb.ca>:
> >> >> >>
> >> >> >> On Thu, Feb 22, 2024, at 9:30 AM, Mark Pearson wrote:
> >> >> >> > Hi,
> >> >> >> >
> >> >> >> Just to confirm that I've tested a trial BIOS from the FW team a=
nd it fixes the issue (shows up under /sys/class/typec
> >> >> > Great to hear, thank you!
> >> >> >
> >> >> >> If there's anything in particular you'd like me to confirm let m=
e know.
> >> >> >
> >> >> > If /sys/class/typec is populated, I think it should be enough... =
Just
> >> >> > to double check, is /sys/class/usb_power_delivery populated, too,=
 now?
> >> >>
> >> >> Yes. From my system:
> >> >>
> >> >> # ls /sys/class/typec
> >> >> port0  port0-partner  port1
> >> >> # ls /sys/class/usb_power_delivery
> >> >> pd0  pd1  pd2
> >> >>
> >> >
> >> > Great! These are the ones I saw with my workaround, too.
> >> >> >
> >> >> > I also did not manage to see anything in /sys/class/usb_role or
> >> >> > /sys/class/typec_mux, even with my hack - is it expected on AMD,
> >> >> > because of lack of appropriate mux/role switch drivers?
> >> >>
> >> >> I'm not seeing anything under those with this BIOS either
> >> >>
> >> >> I checked on an Intel platform on my desk (P14s G3) and those aren'=
t populated there either...so not sure this is AMD specific.
> >> >> I'm being lazy and not looking at the kernel code - what would we e=
xpect to see in those entries?
> >> >
> >> > According to
> >> > https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-class-usb=
_role,
> >> > with /sys/class/usb_role, we can switch between host and device mode=
s.
> >> > My main interest there is typec_displayport driver - to be able to s=
ee
> >> > altmode info (not sure, though, in which /sys directory). With my
> >> > workaround, I failed to see this driver detecting my dock, so, I was
> >> > wondering, if it's caused by wrong UCSI version reported, or some
> >> > other driver missing (DP altmode is working with the doc, just no in=
fo
> >> > from typec_displayport driver)
> >> >
> >> > BTW, what is the version of ucsi reported from firmware? I wonder, i=
f
> >> > it will work with this change
> >> > https://lore.kernel.org/linux-usb/20240209223824.622869-1-abhishekpa=
ndit@chromium.org/
> >> >
> >> Just as a note - BIOS 1.36 was released with the fix. Available on LVF=
S.

BTW, I cannot see it in fwupdmgr, I have only 1.35 there (I had to
update via ISO from pcsupport.lenovo.com):

LC_ALL=3Den_US.UTF8 fwupdmgr get-releases
WARNING: UEFI ESP partition not detected or configured
See https://github.com/fwupd/fwupd/wiki/PluginFlag:esp-not-found for
more information.
0.    Cancel
1.    83cd12f4f179d6eb6964a74a006840294f7e9c4e (Embedded Controller)
2.    6c946da70cfcaaf4a1d4660f82906333c1c96b8d (System Firmware)
3.    362301da643102b9f38477387e2193e57abaa590 (UEFI dbx)
Choose device [0-3]: 2
LENOVO 21K3003RCK
=E2=94=82
=E2=94=9C=E2=94=80ThinkPad T14/P14s Gen 4 and T16/P16s Gen 2 AMD System Upd=
ate:
=E2=94=82     New version:        0.1.35
=E2=94=82     Remote ID:          lvfs
=E2=94=82     Release ID:         88330

>
> > I tried 1.36 (R2FET56W) when it was released, but it did not fix my
> > issue. I have it installed, for sure:
> > sudo dmidecode | grep 1.36
> >     Version: R2FET56W (1.36 )
> > but kernel still sees result of ret =3D ucsi->ops->read(ucsi,
> > UCSI_VERSION, &ucsi->version, sizeof(ucsi->version)); as 0
> >
> > I also have latest EC firmware, too (corresponding to BIOS version)
> > I'll try to reset BIOS to default setting, to check if it will help.
>
> Strange - let me check. I did test the trial FW on my system but haven't =
updated to the release version yet.
> Thanks for letting me know


BTW,

