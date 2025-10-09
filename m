Return-Path: <linux-usb+bounces-29085-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67517BC8F90
	for <lists+linux-usb@lfdr.de>; Thu, 09 Oct 2025 14:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 567FD19E6C1C
	for <lists+linux-usb@lfdr.de>; Thu,  9 Oct 2025 12:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 110712C326D;
	Thu,  9 Oct 2025 12:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJs8Ov1N"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0A6274652
	for <linux-usb@vger.kernel.org>; Thu,  9 Oct 2025 12:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760012210; cv=none; b=h8t209KzNyd6ru3fe8mKhHe+kXnXumyJ2Xytpysp6vkPheFpKymw2v+K6pmwda/uDVJnysjdOGvJUqDyFdF5UJu0NhrQT4r+wdwAkik/Z6JQGJJYlbmiTYQugEHdk6aMOLQzNW3jwLlK8wRpjiv6kvgYZxqrMl/IX4SbeYWj3mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760012210; c=relaxed/simple;
	bh=ERzAXgXOZR7nhWHXRWiaHvI0m7/fpiSEFN6w/sNDYA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cBtW6B4TUhS98j7K2efxnbWNou8vwzMjzeZc+DUwcvaYhsIFxWOvS70EYQ5W7rS9bje+RUbtt/zggNQw1YZY7sbCSshM9Kh9Zp/xHWAYvnU4ZUlKVZ2FzI6GGME1+k+1awy5SPjs8ITxLp5ZygyVViFkSI5doydPQHGQ93aqfMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJs8Ov1N; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-54a7bf06edfso526263e0c.0
        for <linux-usb@vger.kernel.org>; Thu, 09 Oct 2025 05:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760012207; x=1760617007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIzWNqPafaDiQy3O44j6iD26U8n5IpZZY5s3HIzTHMA=;
        b=lJs8Ov1NVM/gRSZaPmq1PNuoHh6qcmAcFJjbJ9J+kwmcEXpF+XOJTThIKOIS0MMmAq
         8tc40Feg/OY13zzPf/nxIJkJ1/7GhyJ+9786tMRsjqr1A+4aPsgoR0NOq2AMY5X5XPNN
         rrTuVz+r98bvtxtK2qRLFIedDE8WSyBwPau2Qt4c1nlje2VYJ4sGUy3nq4zknWRqo7m1
         +hmjNQJW/vJa3BvAZJ6nAifL9M+3Wh3y1KFpthrYzaC4+iv/WPQfCTl9Vipkk5ZPiT/S
         YDOfXmgGXBQtamb4GQvYADfrRzzK803k4JIl+1idWSf9E0fzRqmyaeMgULXeuMw57hgU
         OOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760012207; x=1760617007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIzWNqPafaDiQy3O44j6iD26U8n5IpZZY5s3HIzTHMA=;
        b=bLb4FCMxO66QufBGGGSNmz0k4aV+9+T2Yydwj/DAXIobueMxwTXHlUw+QDO8020JaX
         WWf5cKhCrDKFxccZL8rd4AcucjuI9sApKGg0l37XhujK6eiHdU9Wk7TEEoRqB/wrOQsb
         oumM337QJXvrOpHLDjhdil/3+pySStz1abnO2j7SXBxeGutlwzA1iT5aJMRx8qPkeZR7
         y0fnGYTQIRD069fQJgljZp2RDhorr85vv2ZeLx0cKLJ6pkJ7n2wtHtTSONYSLLILAk0m
         9b9rtzLlya4eUlZ8X7XvdQ9It5DFbDfqqTu56codaQU9yGl3YMnnKTT5EtymiedrkKIU
         EyVw==
X-Gm-Message-State: AOJu0YxFckYlWN/Ivtw8u9cBXEjnmvtXdkngBdgpMUBDwj0aGHRb4Ctl
	q+BD2qDhtMl6ZM+pTv+4NycjxCdTotkP6pbytSj5E+ug5IqZmY4lt2oUNrZMdd5Ih//q9abKQbY
	AdoaG076i53gFKpHEwtW7j988D40aPng=
X-Gm-Gg: ASbGnctLcH8u09jzcwEOMEIBNKb32kPhv9Kn7LIw7DVPlzJAtIvQsGOdDpvEzI1I7QH
	rQkTy0btEPsBczRX9Z4/nVIi97u8FUeiRzjIXao3SCFwkMWVVpzOgdcOtMUKTjqCPwo3IvpnC/A
	ylslP5jmzHMKfVO5u5VUNy1ai7XLXOaS0KAbDopaq/tgSSLqU3p1FHp8VukAYaa00x6Jk6grb1M
	hLCMBauj+K7AsqMTXeg3DhfzQuKUaA=
X-Google-Smtp-Source: AGHT+IFIJ/9BZfp8gwr6xofJHTQ7MouFF6fCDUYp0FjoxURhrvvl+/ubhVW1jtJ8AV8/uUwMKeYNUzbWlwi3H3WNPD0=
X-Received: by 2002:a05:6122:e002:10b0:554:b928:6f with SMTP id
 71dfb90a1353d-554b9280175mr2336073e0c.0.1760012206811; Thu, 09 Oct 2025
 05:16:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
 <20251007231709.6c16802e.michal.pecio@gmail.com> <CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
 <CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
 <20251008082055.5646dadc.michal.pecio@gmail.com> <CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
 <20251008130532.49922d58.michal.pecio@gmail.com> <CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com>
 <20251008223406.13f16f19.michal.pecio@gmail.com> <CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com>
 <CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com> <20251009131444.2c221922.michal.pecio@gmail.com>
In-Reply-To: <20251009131444.2c221922.michal.pecio@gmail.com>
From: Arisa Snowbell <arisa.snowbell@gmail.com>
Date: Thu, 9 Oct 2025 14:16:35 +0200
X-Gm-Features: AS18NWAF31eFE1up9GiEj4RHhIbRq0YZZzBP_JFLGCWbxoH-A4-CI_XirfFeEvg
Message-ID: <CABpa4MC-pij0Fczh-mH3zc+Ey2ALX70OfxX=cG4om7R6WMdRBg@mail.gmail.com>
Subject: Re: [REGRESSION] [REPRO] USB-A devices not working on boot after
 recent USB merge
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev, 
	Niklas Neronin <niklas.neronin@linux.intel.com>, 
	Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch fixes it

- Arisa

On Thu, Oct 9, 2025 at 1:14=E2=80=AFPM Michal Pecio <michal.pecio@gmail.com=
> wrote:
>
> On Thu, 9 Oct 2025 00:25:55 +0200, Arisa Snowbell wrote:
> > This is what I get when I use good kernel:
> >
> > kernel: xhci_hcd 0000:7a:00.0: xHCI Host Controller
> > kernel: xhci_hcd 0000:7a:00.0: new USB bus registered, assigned bus num=
ber 9
> > kernel: xhci_hcd 0000:7a:00.0: USB3 root hub has no ports
> > kernel: xhci_hcd 0000:7a:00.0: hcc params 0x0110ffc5 hci version 0x120
> > quirks 0x0000000200000010
> > kernel: xhci_hcd 0000:7a:00.0: xHCI Host Controller
> > kernel: xhci_hcd 0000:7a:00.0: new USB bus registered, assigned bus num=
ber 10
> > kernel: xhci_hcd 0000:7a:00.0: Host supports USB 3.0 SuperSpeed
> > kernel: usb usb9: New USB device found, idVendor=3D1d6b, idProduct=3D00=
02,
> > bcdDevice=3D 6.17
> > kernel: usb usb9: New USB device strings: Mfr=3D3, Product=3D2, SerialN=
umber=3D1
> > kernel: usb usb9: Product: xHCI Host Controller
> > kernel: usb usb9: Manufacturer: Linux
> > 6.17.0-1-mainline-12298-gf5bd2142c274 xhci-hcd
> > kernel: usb usb9: SerialNumber: 0000:7a:00.0
> > kernel: hub 9-0:1.0: USB hub found
> > kernel: hub 9-0:1.0: 1 port detected
> > kernel: usb usb10: We don't know the algorithms for LPM for this host,
> > disabling LPM.
> > kernel: usb usb10: New USB device found, idVendor=3D1d6b,
> > idProduct=3D0003, bcdDevice=3D 6.17
> > kernel: usb usb10: New USB device strings: Mfr=3D3, Product=3D2, Serial=
Number=3D1
> > kernel: usb usb10: Product: xHCI Host Controller
> > kernel: usb usb10: Manufacturer: Linux
> > 6.17.0-1-mainline-12298-gf5bd2142c274 xhci-hcd
> > kernel: usb usb10: SerialNumber: 0000:7a:00.0
> > kernel: hub 10-0:1.0: USB hub found
> > kernel: hub 10-0:1.0: config failed, hub doesn't have any ports! (err -=
19)
> >
> > where the 2.0 USB's work, mice is powered on, with the bad kernel the
> > mice doesn't even power the LED's on.
> > In the bad kernel its missing the New USB and all.
>
> Okay, thanks. I now see what's going on.
>
> I have successfully reproduced it on a normal controller by patching
> the driver to simply ignore any USB3 ports. With this patch, no root
> hubs are registered at all until I revert the "bad" commit.
>
> In my case it's an idiotic little problem:
>
> xhci_pci_common_probe()
> {
>         usb_hcd_pci_probe() {
>                 // allocate xhci
>                 xhci_run(xhci);
>         }
>
>         xhci->allow_single_roothub =3D 1;
> }
>
> The thing is that xhci_run() needs allow_single_roothub to already
> be set when it executes, but we can't do it before xhci is allocated.
> And some non-PCI drivers don't want it to be set.
>
> Can you check if this patch fixes things for you?
>
> It is obviously not a real solution, but it's good enough for xhci_pci
> and sufficient to check if no other problems remain in your case.
>
> ---
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 485ea7fc0433..354443316bfb 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1735,8 +1735,7 @@ static inline bool xhci_hcd_is_usb3(struct usb_hcd =
*hcd)
>
>  static inline bool xhci_has_one_roothub(struct xhci_hcd *xhci)
>  {
> -       return xhci->allow_single_roothub &&
> -              (!xhci->usb2_rhub.num_ports || !xhci->usb3_rhub.num_ports)=
;
> +       return (!xhci->usb2_rhub.num_ports || !xhci->usb3_rhub.num_ports)=
;
>  }
>
>  #define xhci_dbg(xhci, fmt, args...) \
>

