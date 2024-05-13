Return-Path: <linux-usb+bounces-10251-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEAA8C4665
	for <lists+linux-usb@lfdr.de>; Mon, 13 May 2024 19:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9C5BB23C1B
	for <lists+linux-usb@lfdr.de>; Mon, 13 May 2024 17:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB1922638;
	Mon, 13 May 2024 17:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6U48JMS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0BF20335
	for <linux-usb@vger.kernel.org>; Mon, 13 May 2024 17:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715622322; cv=none; b=SXLJFnJ4t+HkX5XNAEASll7U7XLKrEKnBLpG5O65ZOIaN73UsCLAWHpwPeNIzgjcN0TpyU+ibS6qPiUJj6dO633bbgJBz9ok1CKpCLcCbdl6ELcu9WqQ3VA+bV7Gcnnsy1BEIZzi2/LnxGWADrhoIOKA1hEoZattu/9XMcbJ24o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715622322; c=relaxed/simple;
	bh=u6dyY0Esczid/J+iSiD/H2xV9I0N2rsbsccVKFD1lKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HIC18UgZ44eQr9rI7WUkfs1BNHHzmhWLzGtPLnsU0hG2jueJPWAtA9yO3dDHSAhApZlSMqHKU0LaCUbsi2BbVjSTGV1IViO6WlfdWcuAaZPxC2R+Kg2AGFt3xA1kMGKIyiXRs7n5f8ZU4UKYZpGbfER4oktOBoZbxhd2Czl4PoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6U48JMS; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-de610800da0so4095583276.2
        for <linux-usb@vger.kernel.org>; Mon, 13 May 2024 10:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715622320; x=1716227120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAQ4Xgkfkela0U1QGK8ltkoXhu6nLvASgLcUGNtXRw8=;
        b=g6U48JMS6RqhdA1lPpxFppk4D/i5Rx43BeTUxx6vSDY5JjP6btgHItH4z87x75Us/a
         49jQcle28H10IG+qslj36VSNNSKWEVC7DiqkvNdBp1tz1xPO1hboXsrLZgKyZ9Fr8boG
         GyLElS9s4/4XmikdxcuQqaKmymdfPcaPU+CT7eH/kB6QSCY69PzlOXqgZ510vF7Bh+FF
         zgiYKBni/5qeMAZDnyyLoiWCQGzOECOAsTBjJLoqMEnlM9Ry5PQiuO6sCmR//BVFDhyp
         tD7IG2BxbF5+/WJzg0OpKPvtKgAcX9Ij7wO4Gop9yH3Txdc5AcHEyg/l9ZgZi13d70+F
         dbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715622320; x=1716227120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zAQ4Xgkfkela0U1QGK8ltkoXhu6nLvASgLcUGNtXRw8=;
        b=PwK5E3+RCJ4TV56duurqUlZYUSiXNNkz9ooYNX3HVmCrcN82UIhxyPLLURr4kHsft8
         xg8Z93vsIJVjNIbP8weNFagaYHsttZgt7c1v8Cr6hFu3d5fWpjaQZDfUayYPYB++k2Ch
         a1jlTkWFEMxkAz8fW6aS7Ai5FE53lpmpEitKRySlikBbzSG6JdldPDC6i+GYysLkpwjD
         Qh0fgPOCCpBV+LJVG7l98lFWhRdDNTBJwoaiWiAljNp+9yRq3M0Txa3SY3dNhJ+I78dr
         FEt4xvrN4L1z/cXQhd3quaGeXZFyS5PRIdC06RMNPS27IiLv6OyPYAXjpHe458k3qfNz
         eOEw==
X-Gm-Message-State: AOJu0YwBM+R8r9XutJRnp7NXQXmCjCUD5umc8lUFwSsZgM+8Rerweog1
	tB7+fT8di3zROtIna0xv4bBwsQ8ijDPmu+VDcv1/VVIr0ttmToCb1xE9ZYv9QYNz7rv4mkA765v
	3t7CK89LC+BGW2PgIm0hNYFNwykAKz7Zy
X-Google-Smtp-Source: AGHT+IFFtgnncBj20JcK+VbbwEmKJG9QPSySNR7bEetsee89kR0Ip9iUJkAzppBwOBN6GAPopLqXcujLYorK/rmj+hI=
X-Received: by 2002:a5b:3d1:0:b0:de5:9ef9:8baf with SMTP id
 3f1490d57ef6-dee4f1b8bd1mr9037402276.4.1715622320013; Mon, 13 May 2024
 10:45:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHhAz+g=7pocghMX-Yu=jg0jxnpfwa3+ZmmdLP_pVuXmWLJ=aw@mail.gmail.com>
 <ea450e31-8f71-4726-91f6-ada79e0b3a9a@rowland.harvard.edu>
 <CAHhAz+gRvah++Hv4k5+Ec0epNbmet0=JZ6tJ3R8zjZmiKACaQA@mail.gmail.com>
 <c309b037-50db-4ca1-8f86-60131cb84564@rowland.harvard.edu> <CAHhAz+i9TLCb3hKpzWAL2DkH9Y25XszJO5kgbRGzsut1zCzrJw@mail.gmail.com>
In-Reply-To: <CAHhAz+i9TLCb3hKpzWAL2DkH9Y25XszJO5kgbRGzsut1zCzrJw@mail.gmail.com>
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Mon, 13 May 2024 23:14:44 +0530
Message-ID: <CAHhAz+jWrJBgAkZ6XmyEMdR-BT0GUmew0RqBGVsrenOVo5vcaw@mail.gmail.com>
Subject: Re: Seeking Assistance: Implementing USB Device Suspend/Resume in
 User Space Driver
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 5:14=E2=80=AFPM Muni Sekhar <munisekharrms@gmail.com=
> wrote:
>
> On Tue, May 7, 2024 at 1:20=E2=80=AFAM Alan Stern <stern@rowland.harvard.=
edu> wrote:
> >
> > On Mon, May 06, 2024 at 09:44:52PM +0530, Muni Sekhar wrote:
> > > On Mon, May 6, 2024 at 7:59=E2=80=AFPM Alan Stern <stern@rowland.harv=
ard.edu> wrote:
> > > >
> > > > On Mon, May 06, 2024 at 04:44:30PM +0530, Muni Sekhar wrote:
> > > > > While we have successfully converted most of the USB device drive=
r
> > > > > functionality from kernel space to user space using libusb, we ar=
e now
> > > > > seeking guidance on how to implement USB device suspend/resume in=
 user
> > > > > space. Specifically, we would like to know if libusb provides sup=
port
> > > > > for achieving the suspend/resume functionality mentioned above.
> > > > > Additionally, any insights or suggestions on how to accomplish th=
is
> > > > > task would be greatly appreciated.
> > > >
> > > > Your question is about libusb, right?  So you'll get better answers=
 if
> > > > you post it on the libusb mailing list rather than the linux-usb ma=
iling
> > > > list.
> > > Can USB device suspend\resume  be implemented in user space driver
> > > using software other than libusb?
> >
> > Yes, a userspace driver can use the usbfs interface and can employ the
> > ioctl commands listed in /usr/include/linux/usbdevfs.h.  It's possible

In the context of the Linux kernel and USB devices, what are the
similarities and differences between usbfs and sysfs?
Before invoking the ioctl() system call, we need to obtain a file
descriptor by invoking the open() system call. How do we identify the
device node in the usbfs interface?
For example, can you please explain how to identify the device node
location of a Human Interface Device(shown below in lsusb -t output)
as the first argument in the open() system call.

$ lsusb -t
/:  Bus 001.Port 001: Dev 001, Class=3Droot_hub, Driver=3Duhci_hcd/2p, 12M
/:  Bus 002.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dehci-pci/3p, 480M
    |__ Port 001: Dev 002, If 0, Class=3DHub, Driver=3Dhub/8p, 480M
/:  Bus 003.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dehci-pci/4p, 480M
/:  Bus 004.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dehci-pci/3p, 480M
    |__ Port 001: Dev 002, If 0, Class=3DHub, Driver=3Dhub/6p, 480M
        |__ Port 002: Dev 003, If 0, Class=3DHuman Interface Device,
Driver=3Dusbhid, 1.5M
/:  Bus 005.Port 001: Dev 001, Class=3Droot_hub, Driver=3Duhci_hcd/2p, 12M
/:  Bus 006.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/15p, 480=
M
/:  Bus 007.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/6p, 5000=
M


> > that libusb also provides facilities for controlling suspend and resume=
;
> > I don't know whether it does.
> >
> > > If so, what are those methods or techniques to achieve USB device
> > > suspend\resume , can you please provide clarity on this.
> >
> > As far as I know, these usbfs ioctl commands are not documented
> > anywhere.
> >
> > The USBDEVFS_FORBID_SUSPEND ioctl prevents the device from being
> > suspended, and wakes it up if it is currently suspended.
> >
> > The USBDEVFS_ALLOW_SUSPEND ioctl allows the device to be suspended.  Th=
e
> > suspend may not happen immediately; it is controlled by the settings in
> > the device's power/control and power/autosuspend (or
> > power/autosuspend_delay_ms) sysfs attribute files.
> >
> > The USBDEVFS_WAIT_FOR_RESUME ioctl waits until the device resumes,
> > whether because of a remote wakeup or because another process has
> > resumed it, and then forbids the device from suspending again until
> > you perform another USBDEVFS_ALLOW_SUSPEND ioctl.
> >
> Thank you, it is very helpful.
>
> To verify the USB device suspend\resume functionality, I configured
> the USB Power Management variables as follows:
>
> # cat /sys/bus/usb/devices/2-1.7/power/wakeup
> enabled
>
> # cat /sys/bus/usb/devices/2-1.7/power/control
> on
>
> # cat /sys/bus/usb/devices/2-1.7/power/autosuspend_delay_ms
> 0
>
> # cat /sys/module/usbcore/parameters/autosuspend
> 2
>
>
> So, I configured the system to autosuspend the USB device as soon as
> it becomes idle, with no transactions running through the USB device.
> Now, how can I verify that the USB device has entered suspend mode
> from user space? When checking /var/log/kern.log, there are no
> relevant print statements. Are there any other log files related to
> power management or USB subsystems?
> Please correct me if anything in the test procedure mentioned above is
> incorrect.
>
> > Alan Stern
>
>
>
> --
> Thanks,
> Sekhar



--=20
Thanks,
Sekhar

