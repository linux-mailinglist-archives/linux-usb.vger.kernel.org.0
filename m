Return-Path: <linux-usb+bounces-10123-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B305A8BF59A
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2024 07:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 407D31F248F2
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2024 05:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8575717597;
	Wed,  8 May 2024 05:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GChKc7zE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D4514273
	for <linux-usb@vger.kernel.org>; Wed,  8 May 2024 05:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715146705; cv=none; b=Oxeep3HfzZT8oav9Ny+heO/xxxAwaHf62VMrXoTUh2+RfVDJLy4EKYs98nezCczIGGgfmYJ3z3Gt0DDCdqeIofseJ7Kd9wYezDqxxmYalyuVgfFtyh6ye5WBqd/p5F36Rb6kiqtX/eZwqNGWdOaFWp0RIimwsLM1a4ICj2PRRUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715146705; c=relaxed/simple;
	bh=n+WIdgWMymBECCe9sFUPyXMAbx0h8Bchr72akuqSI7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EqDovuY9YUluLCU1vT/RzziKJLDrYQ1oqfPclIUC+9TM+31tpQ8YqiJIjhTKUtMqt1MMlVCbxaKVdiWxLXS5RFE8zhWfWin36wST/+d9E1p3nG90dXiG0CcRnOUaqwTsdKttmlHSG1wt3QuuQ1Q8ydwJM+ZtZS8BbiYHbCGbEY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GChKc7zE; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-61816fc256dso40302767b3.0
        for <linux-usb@vger.kernel.org>; Tue, 07 May 2024 22:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715146702; x=1715751502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUCH4w5xhf6WNmkLKgkVs94040IMjqTIsk9Xg2i4AVg=;
        b=GChKc7zEso/llyBVSADvPfPzWwqGsRx4579S5GGkLsoupSj9iFALLnwLAaEs1KWwhE
         TKMqB4K+GGPTA8YJ9yaeLFFCHWrPbVtdVr+hL0WNLdKj/Mh7db9d0e7gXFWZ7TlM4Q06
         kfr/OGMM/+BTHSR1DVJD6aEtSKwqXFPtd00QVrNRKD51dmEehcCZ+2YH5DnElcev8w8R
         YCvhrnKhif9GuGzsUkUAeupZ5dhvYjV/h+HzhScV8V7Clzeit3iAxDwAHWiDvjEZGOue
         yhN9T2exU6wFUTlRVo8/qMqNpODHhXD30SWnt30wMHGcQqMky+B1mztDO7FiqIVTUkEo
         UAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715146702; x=1715751502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lUCH4w5xhf6WNmkLKgkVs94040IMjqTIsk9Xg2i4AVg=;
        b=dKKqgNky30pDcEGjXh501ewoYpg0B8D1h2czJ6z6DfujDX53zN4uu4xKmFQpRM1F7E
         FjTfxtlMVvXUoLByLFBrJ97JJh3vdjXUMdEXpqig2IqKqjp26n3GKPkVL1i99qxf6oEN
         kVpc46PlIAEYr9oGZ1bogd/SDFxwjZyqzWjyrfK3tSRIcERjgbOZv3pRd9NC/fViSlpi
         9qCGQmMuWCjI+q81UXGh+V9X/Gpn1TrE3QH9hp4OQMQhkL7NjHYM+8TsxBDZlPHTTcwI
         5QDzzcD0PWP4Tq67bpN48dqN7evdvH2xwQAHaKew9eu1kkjIVLgKDZ0tLVoW2FkXYEq2
         PM6Q==
X-Gm-Message-State: AOJu0YzT9xAfHJu1205LBjIp3muH/cPEIP2X4cIHP7MgrWzyQ857JP3c
	gEH6wPa+o91mGppd7xDrqrmIuNu5kEzL/MSoJbsl2iURoRnmRAcHffDFriYijnA82dcTR5jtlOH
	7YM2kEJSfYm9BnOMPzqoYwmmUeta3QaKV
X-Google-Smtp-Source: AGHT+IE+W71RBa/xWpdQYBR3fCL7I06JKPVmapO033yGD7d/S9YhMV7E3nOAf0pGDOZVmvJ4TdDa/+PbeWQrgOopIO4=
X-Received: by 2002:a0d:eb91:0:b0:618:5b27:e12b with SMTP id
 00721157ae682-62085a44789mr20615917b3.7.1715146702368; Tue, 07 May 2024
 22:38:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHhAz+g=7pocghMX-Yu=jg0jxnpfwa3+ZmmdLP_pVuXmWLJ=aw@mail.gmail.com>
 <ea450e31-8f71-4726-91f6-ada79e0b3a9a@rowland.harvard.edu>
 <CAHhAz+gRvah++Hv4k5+Ec0epNbmet0=JZ6tJ3R8zjZmiKACaQA@mail.gmail.com>
 <c309b037-50db-4ca1-8f86-60131cb84564@rowland.harvard.edu>
 <CAHhAz+i9TLCb3hKpzWAL2DkH9Y25XszJO5kgbRGzsut1zCzrJw@mail.gmail.com>
 <8a8edaba-670b-47ad-a123-2077e2e0644d@rowland.harvard.edu>
 <CAHhAz+iywarnsNmt0mbuyPV+mNYQ+OwqoDMaymTGAEv6KBcLnA@mail.gmail.com> <9a89ba8d-c406-4ff1-98f0-080c77390efe@rowland.harvard.edu>
In-Reply-To: <9a89ba8d-c406-4ff1-98f0-080c77390efe@rowland.harvard.edu>
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Wed, 8 May 2024 11:08:11 +0530
Message-ID: <CAHhAz+hGD95zoVbEQTvCq4jquBu+x-kv3n=x5Tb4V0mtQDXv7w@mail.gmail.com>
Subject: Re: Seeking Assistance: Implementing USB Device Suspend/Resume in
 User Space Driver
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 11:21=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Tue, May 07, 2024 at 10:08:13PM +0530, Muni Sekhar wrote:
> > Now, I can verify USB device auto-suspend and auto-resume through the
> > kernel log.
> >
> > In my test system, I found three buses "Bus 001, 002, and 003" using
> > the lsusb command.
> >
> > The USB device I want to test is located on "Bus 002".
> >
> >
> > # lsusb | grep "Bus 002" | wc
> >       4      37     224
> >
> > As per the output of the above command, there are 4 USB devices on
> > "Bus 002" in my test system.
> >
> >
> > # ls -l /sys/bus/usb/devices/2*
> > lrwxrwxrwx 1 root root 0 Feb 14 14:48 /sys/bus/usb/devices/2-0:1.0 ->
> > ../../../devices/pci0000:00/0000:00:14.0/usb2/2-0:1.0
> > lrwxrwxrwx 1 root root 0 May  7 13:16 /sys/bus/usb/devices/2-1 ->
> > ../../../devices/pci0000:00/0000:00:14.0/usb2/2-1
> > lrwxrwxrwx 1 root root 0 May  7 13:16 /sys/bus/usb/devices/2-1.1 ->
> > ../../../devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1.1
> > lrwxrwxrwx 1 root root 0 May  7 13:16 /sys/bus/usb/devices/2-1:1.0 ->
> > ../../../devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1:1.0
> > lrwxrwxrwx 1 root root 0 May  7 13:16 /sys/bus/usb/devices/2-1.1:1.0
> > -> ../../../devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1.1/2-1.1:1.0
> > lrwxrwxrwx 1 root root 0 May  7 13:16 /sys/bus/usb/devices/2-1.7 ->
> > ../../../devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1.7
> > lrwxrwxrwx 1 root root 0 May  7 13:16 /sys/bus/usb/devices/2-1.7:1.0
> > -> ../../../devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1.7/2-1.7:1.0
> >
> > # ls -l /sys/bus/usb/devices/2* | wc
> >       7      77     892
> >
> >
> > The above command shows seven nodes in /sys/bus/usb/devices/2* director=
y.
> >
> > The wakeup, control, and autosuspend_delay_ms attribute files are
> > controlled via /sys/bus/usb/devices/.../power/, where "..." represents
> > the device's ID.
> >
> > I identified my test device in /sys/bus/usb/devices/.../power/ by
> > iterating through all the directories, reading the idVendor attribute
> > file, and then manipulating the power management attribute files.
> >
> > Is there a way to manually map /sys/bus/usb/devices/.../power/ from
> > the lsusb output? Can this mapping be done from a user space program
> > as well? Do you have any reference examples for this? If so, could you
> > share their GitHub location?
>
> libusb already can do this for you.
>
> However, if you want to do it by hand then you can match up devices
> based on the devnum attribute file in the devices sysfs directory.  For
> example, if you were trying to identify which device corresonds to the
> lsusb entry for device 003 on bus 002, you should look through all the
> directories in /sys/bus/usb/devices/2-* and see which one has "3" in its
> devnum file.
>
> There's another way of doing it more directly, using the output from
> "lsusb -t".  For example, on my system:
>
> $ lsusb -t
> /:  Bus 001.Port 001: Dev 001, Class=3Droot_hub, Driver=3Duhci_hcd/2p, 12=
M
> /:  Bus 002.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dehci-pci/3p, 48=
0M
>     |__ Port 001: Dev 002, If 0, Class=3DHub, Driver=3Dhub/8p, 480M
> /:  Bus 003.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dehci-pci/4p, 48=
0M
> /:  Bus 004.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dehci-pci/3p, 48=
0M
>     |__ Port 001: Dev 002, If 0, Class=3DHub, Driver=3Dhub/6p, 480M
>         |__ Port 002: Dev 003, If 0, Class=3DHuman Interface Device, Driv=
er=3Dusbhid, 1.5M
> /:  Bus 005.Port 001: Dev 001, Class=3Droot_hub, Driver=3Duhci_hcd/2p, 12=
M
> /:  Bus 006.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/15p, 4=
80M
> /:  Bus 007.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/6p, 50=
00M
>
> Let's say we want to locate the Human Interface Device in sysfs.
> According to the listing, it is on port 002 below port 001 below bus
> 004.  You reverse the numbers, put a '-' after the bus number,
> and separate the port numbers with a '.', which gives "4-1.2":
>
> $ cat /sys/bus/usb/devices/4-1.2/product
> Microsoft 5-Button Mouse with IntelliEye(TM)
Thank you for the clear explanation on how to identify devices
associated with root hubs.
Could you please provide clarity on whether the root hub devices have
attribute files in the devices sysfs directory? Upon checking the
sysfs directory, I couldn't find any relevant information about these
attribute files.
Thank you again for your assistance.

>
> Alan Stern



--=20
Thanks,
Sekhar

