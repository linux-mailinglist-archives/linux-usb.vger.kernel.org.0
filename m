Return-Path: <linux-usb+bounces-4291-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F0781622D
	for <lists+linux-usb@lfdr.de>; Sun, 17 Dec 2023 21:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D57B61C22022
	for <lists+linux-usb@lfdr.de>; Sun, 17 Dec 2023 20:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E91A481C0;
	Sun, 17 Dec 2023 20:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYEB7RVo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37845481B7
	for <linux-usb@vger.kernel.org>; Sun, 17 Dec 2023 20:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5533ca9cc00so572873a12.2
        for <linux-usb@vger.kernel.org>; Sun, 17 Dec 2023 12:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702846150; x=1703450950; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hg0/YgFpXZMrY7kcG3PjR5hrdFBMrsxejcOyhmoYfho=;
        b=bYEB7RVoXBcnOiT+P31ly5jUtw1gUKLBsorWDCMEFR/1pO72jYJGnpHQqtW5SDURc5
         09M2cPFcRrbbv7aMY7lGOxuiAKRvS78kT4zDxqkDtExeLo/dULDGqT+uNARui1HhDlHa
         pf+N867VFwDK9eYWxSZQF/EbZYz9Z8YrwjP6MQTxCnnaT97rJPYmR8N6L5JfocvsUfiJ
         guCJgAWExyFY7KSqjXKh9I7pDv/qVxL3UpnjWGj5nYHbfAcfJ6zpW++rFu+69qKCVsIK
         wXjKIvmvBHtkYKc4bvWrhlbWDtQ4O/Y4C5cOGAJnqGqlNy2FYSRv6iZnx7RwOkxWn7Lt
         O+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702846150; x=1703450950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hg0/YgFpXZMrY7kcG3PjR5hrdFBMrsxejcOyhmoYfho=;
        b=jYOGQNAyH+jA1hUkc6yQHzDpBPIyWqdXtH53w8/ugdsZT4IMmcsk7+i0I3p5J51gnk
         IRpOEK7NoDis0nVo/WCAAzClfKXR0wHEneiMNISpTURXMtj+8EFyT5S/Z4aOp1zXDuRw
         1mUqyA6dSd0YAHHzQMGnpzXfSyNgOAm8iyV2Vvc+pzJvEtWJ73oHql/fqOQE9gPZ65rH
         OcVzQoP9ygOBr0L0esCc0473eoTepUknPIl/LMIWySZWWaXUz7Q+VKfSqtCUPZdu1lvh
         KUZsaoCjPS2ubz6TVmz0hBwm/Qr2k4BLaJYdYoLTLnPI/bBa/rK8KfZ5oEgEyokB4IJL
         sVBA==
X-Gm-Message-State: AOJu0YwRcX3PzwmA4msrTbS4hIjCpXZjb0xPCATrG2etd0xOP3IR1mHE
	dPo2QsHYr3H41UgQS06H3EyBbhy5yzJtvEUbBEQpSWYxYSlVbQ==
X-Google-Smtp-Source: AGHT+IFQ9GjoMoPBG4IDop1KWH/6IUgqXW/8eHyDQKP/+NdRr+lhYGCQ0L+L8kM5ZFz43biVgJyiqCAj+B7uHZflaJM=
X-Received: by 2002:a50:d649:0:b0:552:d986:48c0 with SMTP id
 c9-20020a50d649000000b00552d98648c0mr3077153edj.60.1702846150272; Sun, 17 Dec
 2023 12:49:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADS+iDWFVZp81Ck48wQjzh--n_7Z-bV2u0SR4Z6-OZOMBLeMKw@mail.gmail.com>
 <520bd89d-b6e4-4654-adcd-8bb884802f56@interlog.com> <CADS+iDVhNzAHfbW+Nks_29rgJXwFTCsTU93XHQpCYBCW6cvxzQ@mail.gmail.com>
 <e7257a7a-1391-47e7-9702-d7c9ec3ff338@interlog.com>
In-Reply-To: <e7257a7a-1391-47e7-9702-d7c9ec3ff338@interlog.com>
From: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Date: Sun, 17 Dec 2023 21:48:58 +0100
Message-ID: <CADS+iDWM8czf-D8D8H1gx2YBPCYbO4cexO83dUQ6-H8KKQSx4g@mail.gmail.com>
Subject: Re: type-c subsystem is empty on Thinkpad T14 Gen 4 AMD
To: dgilbert@interlog.com
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=81, 17 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 20:15, Dou=
glas Gilbert <dgilbert@interlog.com>:
>
> On 12/17/23 12:24, Yaroslav Isakov wrote:
> > =D0=B2=D1=81, 17 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 18:08,=
 Douglas Gilbert <dgilbert@interlog.com>:
> >>
> >> On 12/17/23 11:21, Yaroslav Isakov wrote:
> >>> Hello! I recently bought Thinkpad T14 Gen 4 AMD laptop, and I
> >>> installed Gentoo on it, with kernel 6.6.4.
> >>>
> >>> Even though type-c ports seems to be working (I checked usb3 flash
> >>> stick, lenovo charger, Jabra headset, Yubikey), I cannot see any
> >>> devices in /sys/class/(typec,typec_mux,usb_power_delivery).
> >>>
> >>> There are no messages in dmesg at all, mentioning typec. I can see
> >>> that modules typec_ucsi, ucsi_acpi, thunderbolt are loaded. I can see
> >>> that device TYPEC000 is present on acpi bus, there are files in
> >>> /sys/bus/acpi/devices/USBC000:00, but, there is no driver linked in
> >>> it.
> >>>
> >>> I tried to recompile module ucsi_acpi, with adding { "USBC000", 0 }
> >>> to ucsi_acpi_match, but it did not change anything (except that in
> >>> modinfo of this module, USBC000 is now seen.
> >>>
> >>> I tried to decompile SSDT1 table, which has definition of USBC, but
> >>> there is nothing in it, which is supicious.
> >>>
> >>> What else can I check, to understand, why can't I see anything in
> >>> typec/PD subsystems?
> >>>
> >>
> >> I have a X13 Gen 3 [i5-1240P] which is about 18 months old. Everything=
 you
> >> mention is present plus the typec ports and the associated pd objects:
> >>
> >> $ lsucpd
> >>    port0 [pd0]  <<=3D=3D=3D=3D  partner [pd2]
> >>    port1 [pd1]  <
> >
> > I guess, it makes no sense to install lsucpd, if it checks /sys/class/t=
ypec etc?
> >
> >>
> >> A power adapter is connected to port0. Here are the modules loaded:
> >>
> >> $ lsmod | grep typec
> >> typec_ucsi             57344  1 ucsi_acpi
> >> roles                  16384  1 typec_ucsi
> >> typec                 114688  1 typec_ucsi
> >> usb_common             20480  4 xhci_hcd,usbcore,uvcvideo,typec_ucsi
> >> $ lsmod | grep ucsi
> >> ucsi_acpi              12288  0
> >> typec_ucsi             57344  1 ucsi_acpi
> >> roles                  16384  1 typec_ucsi
> >> typec                 114688  1 typec_ucsi
> >> usb_common             20480  4 xhci_hcd,usbcore,uvcvideo,typec_ucsi
> >>
> > I have exact same modules.
> >
> >> $ ls /sys/bus/acpi/devices/USBC000:00
> >> device:ac  device:ad  hid  modalias  path  physical_node  power  statu=
s
> >> subsystem  uevent  uid  wakeup
> > Under /sys/bus/acpi/devices/USBC000:00 I have the similar files:
> > adr  device:48  device:49  hid  modalias  path  physical_node  power
> > status  subsystem  uevent  uid
> > As you don't have driver symlink there, too, then it's a red herring,
> > that lack of driver file is symptom of this issue.
> >
> >>
> >> Strange that the Thunderbolt module is loaded since I thought only the=
 Intel
> >> variants supported Thunderbolt.
> > thundebolt module is now shared with USB4 subsystem, and T14 started
> > to have USB4 from Gen 3, for AMD variant.
> >>
> >> The only thing that I can think of is some BIOS setting. When I poked =
around
> >> in the X13 BIOS I don't remember any setting that would cause what you=
 are
> >> seeing.]
> > I checked BIOS settings, but I cannot find anything related
> >
> > Could you please show, what drivers are used for device:ac and
> > device:ad, under /sys/bus/acpi/devices/USBC000:00? It seems that if I
> > have such entries in my /sys/bus/acpi/devices/USBC000:00, at least
> > ucsi_acpi works properly.
>
> dougg@treten:/sys/bus/acpi/devices/USBC000:00/device:ac$ ls -l
> total 0
> -r--r--r-- 1 root root 4096 Dec 16 19:11 adr
> -r--r--r-- 1 root root 4096 Dec 16 19:11 path
> lrwxrwxrwx 1 root root    0 Dec 16 19:11 physical_node ->
> ../../../../platform/USBC000:00/typec/port0
> drwxr-xr-x 2 root root    0 Dec 16 19:11 power
> lrwxrwxrwx 1 root root    0 Dec 16 16:45 subsystem -> ../../../../../bus/=
acpi
> -rw-r--r-- 1 root root 4096 Dec 16 16:45 uevent
>
> dougg@treten:/sys/bus/acpi/devices/USBC000:00/device:ac$ cd ../device\:ad
> dougg@treten:/sys/bus/acpi/devices/USBC000:00/device:ad$ ls -l
> total 0
> -r--r--r-- 1 root root 4096 Dec 16 19:11 adr
> -r--r--r-- 1 root root 4096 Dec 16 19:11 path
> lrwxrwxrwx 1 root root    0 Dec 16 19:11 physical_node ->
> ../../../../platform/USBC000:00/typec/port1
> drwxr-xr-x 2 root root    0 Dec 16 19:11 power
> lrwxrwxrwx 1 root root    0 Dec 16 16:45 subsystem -> ../../../../../bus/=
acpi
> -rw-r--r-- 1 root root 4096 Dec 16 16:45 uevent
>
>
> >
> > In my /sys/bus/acpi/devices/USBC000:00/device:(48,49), there are only
> > adr, path and uevent files, and power and subsytem folders. Subsystem
> > links to bus/acpi, and path has \_SB_.UBTC.CR01, \_SB_.UBTC.CR02
>
> Mine has the extra physical_node symlinks to typec/port0 and typec/port1
Yes, I have the same as on T14 Gen 3 (Intel). Looks like they have no
driver symlinks, too, but they're working on Intel.
>
> > P.S. I tried latest live Fedora, just to see if I forgot to compile
> > some drivers for custom-built Gentoo kernel, but same issue on Fedora
>
> Below is a fragment of a post from Heikki Krogerus about turning on ucsi =
debug:
>
> If you want to see the actual UCSI notification in user space, then
> that is not possible, but the driver does produce trace output, and I
> would actually like to see what we got there. You need debugfs to be
> mounted. Then try the following:
>
>          # Unload all UCSI modules
>          modprobe -r ucsi_acpi
>
>          # At this point you should plug-in the problematic device
>
>          # Reload the UCSI core module
>          modprobe typec_ucsi
>
>          # Enable UCSI tracing
>          echo 1 > /sys/kernel/debug/tracing/events/ucsi/enable
>
>          # Now reload the ACPI glue driver
>          modprobe ucsi_acpi
>
>          # Unplug the problematic device so that you see the error
>
>          # Finally dump the trace output
>          cat /sys/kernel/debug/tracing/trace
>
> So if that works, please send the trace output to me.
> [Heikki]
I tried provided commands, both in Gentoo and Fedora - nothing in
trace at all. I guess, it's because ucsi on AMD can see two devices,
but cannot work with them, for some reason. I also checked same
commands on T14 Gen 3 (Intel), and I can see many ucsi_register_port
and ucsi_register_altmode events.
>
>

