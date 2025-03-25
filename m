Return-Path: <linux-usb+bounces-22070-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F36A6ECF2
	for <lists+linux-usb@lfdr.de>; Tue, 25 Mar 2025 10:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE6991891C16
	for <lists+linux-usb@lfdr.de>; Tue, 25 Mar 2025 09:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB7C1DE4C2;
	Tue, 25 Mar 2025 09:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=proton.me header.i=@proton.me header.b="hRYYnqZ9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740BC1DE8A5
	for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 09:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742895987; cv=none; b=gLH/w+JE278ftJcwwqeRUP9rUGJ6/TUqnJYt5O3xJFecjUfSMmL5NB0fCPlHD/P3MLrO+PtAQrBdbrvG9zERGYwAYsPtFZImHcdCQTiwJr1jSjSvrF8wDS66vI6xo71Isd5VNm+Taj0ns6XAa+QEF88A2znKW/apsK4RdPVZIcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742895987; c=relaxed/simple;
	bh=7IlHKBSP+YJnutK1RHQgixPx8fX83YnoEOikGzR75Sk=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LBFQYjax2owwujr/BNQTtP5P61YAZut4o2s9a+mC5lo6W98DwFu7S7KyfH4SqJ7k8vp5pJy8oiNUwy6vlrF1h9WQKbfu5VogTkHWebswoebar5qqzZjE3mLkXhsXdHXPMqlbqn3S4YrsPl6zdaKpnXbcdvhb1NjGzRp8uyJ9v9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=hRYYnqZ9; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742895975; x=1743155175;
	bh=Q1m7P8QgNKCAz3jzDpH1ejWJ5C35xTGAjka2j5oIxJM=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=hRYYnqZ9BZhGnuOqZn1L77aPptKZQCje/6ZhHs1ww82pNkqRZPZRAH80ppzvOmFuQ
	 Fvtv1Ng84p06SnjFLHnOB8bE4K5ZXeTTa8nlsBHB87BlRuzJYpzylq0ks90aG+7M+W
	 QcE2YFugCZXz3gCh1Za+x7kJlFknjVwlwscm61W4YBg10WKs+1MbfwnXWsQjrmK0h4
	 kEwKru1G3yfhKJ94TULsEc4nJ2T36YXeVrGppmOctT7pmAQ23EUwe9GPAGskxOPMpE
	 erY7Xyi7rL/iBqFCl3RqK/i50fA870siV3qoPi68B7r0yATsDcx5DVDFCnVus2xbiE
	 kU5ZuXM+IcxFg==
Date: Tue, 25 Mar 2025 09:46:14 +0000
To: =?utf-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From: laycookie <laycookie@proton.me>
Subject: Re: USB device enumeration failure after a certain amount of uptime
Message-ID: <MNPMsZnv8AXRyS4mqWaolXZkblyzndGqRmVitU7e5Z4HakEyOse4qfahFpSuU0ApYetf8S34NF26rGgBbwKb-39FBI3Z8o6ElQnzozl_Fkk=@proton.me>
In-Reply-To: <20250325093251.4c5330d7@foxbook>
References: <20250325093251.4c5330d7@foxbook>
Feedback-ID: 83346434:user:proton
X-Pm-Message-ID: 7e48793027d6a2ef8902f3d155faabddaf0b16f2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> I would guess it's a PCIe-based USB 3.1 controller (ASMedia ASM3142?)
> and some USB chips permanently wired to it on the same board, you could
> investigate with 'lspci' and 'lsusb -t' (when everything is working).

Results of `lsusb -t` specifically for the capture card excluding the RGB c=
ontroller.
```
/:  Bus 004.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/2p, 1000=
0M
    |__ Port 001: Dev 002, If 0, Class=3DVideo, Driver=3Duvcvideo, 5000M
    |__ Port 001: Dev 002, If 1, Class=3DVideo, Driver=3Duvcvideo, 5000M
    |__ Port 001: Dev 002, If 2, Class=3DAudio, Driver=3Dsnd-usb-audio, 500=
0M
    |__ Port 001: Dev 002, If 3, Class=3DAudio, Driver=3Dsnd-usb-audio, 500=
0M
```
Related from what `lspci` is emitting.
```
08:00.0 USB controller: ASMedia Technology Inc. ASM2142/ASM3142 USB 3.1 Hos=
t Controller
09:00.0 USB controller: ASMedia Technology Inc. ASM2142/ASM3142 USB 3.1 Hos=
t Controller
```

> > When the computer boots up, or wakes up from hibernation, the capture
> > card spits out some errors but ultimately ends up connecting, and
> > functioning properly with the following being logged in to the dmesg.
> >
> > [73087.256972] usb usb4-port1: attempt power cycle
> > [73087.681433] usb 4-1: Device not responding to setup address.
> > [73087.887446] usb 4-1: Device not responding to setup address.
> > [73088.095031] usb 4-1: device not accepting address 67, error -71
> > [73088.580035] usb 4-1: new SuperSpeed USB device number 68 using xhci_=
hcd
> > [73088.649577] usb 4-1: LPM exit latency is zeroed, disabling LPM.
> >
> > However after some uptime since the boot/hibernation the capture card
> > ends up getting disconnected with the following being logged.
> >
> > [73491.691281] usb 4-1: Device not responding to setup address.
> > [73491.898772] usb 4-1: Device not responding to setup address.
> > [73492.106227] usb 4-1: device not accepting address 68, error -71
> > [73492.857630] usb 4-1: USB disconnect, device number 68
> > [73493.184176] usb 4-1: new SuperSpeed USB device number 69 using xhci_=
hcd
>
>
> Is this a complete log? And the device was really working during those
> six minutes before "setup address" failure? Usually, address setup
> happens once immediately after device connection, not sure what would
> lead to it being repeated later.
>
> Regards,
> Michal

Yes, the only thing I did is remove all logs that were not prefixed with `u=
sb 4-1:` during the boot/wake (there were no other events leading to discon=
nect at all), and the PC was on during those 6 minutes. Usually however it =
takes around 20 minutes to 3 hours for this behavior to occur. Not sure if =
it has any relevance but specifically in that session of testing my compute=
r had a fairly long uptime since boot, and the disconnect behavior was cons=
istently happening after approximately 6 minutes when I was waking up the c=
omputer from hibernation, however after a full power off, power on cycle it=
 went back to failing in 20 minutes to 3 hours.=20

I also discovered that apparently if I stream from the capture card to some=
 application it never disconnects, or at least I have never encountered it =
disconnecting.

Dennis Lonoshchuk

