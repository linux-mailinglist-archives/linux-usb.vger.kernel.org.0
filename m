Return-Path: <linux-usb+bounces-10069-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 959378BE975
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2024 18:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47654292B2F
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2024 16:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BECFE16EBFA;
	Tue,  7 May 2024 16:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgPol4bz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C60200D2
	for <linux-usb@vger.kernel.org>; Tue,  7 May 2024 16:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099907; cv=none; b=udJG+R/yA3+2buZr5RAeqM5EEgl6eFdGn5Gj4Si//fx4nLeqCxuX3zwALv+Gor6L8Db/EHCcIg4HtYuWvPMH31JVS4nFyCy5+y082VvOlQnEEtwUIE5i9oS5AWW3fR3kxGV/n3EeEDSxQFu2utmA4zki1iBghWdiURerYCyspto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099907; c=relaxed/simple;
	bh=vjzjLlV+h3ooD2Ke8iOpyMRpgEQjP8m0HSLWxVdVsc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BYTNcKMQ1TV0csLyxprQ0WoxEAsUZN51bWyacwwjU+JhhRaQc81nWqE7WX3tgE8QNDhKzvwx1GHOpk9ojxflKzB89ZNSzymm3eWFbP7M6PUgIXmAKI/yYXRv+FJuHyhHVGmxmy3Bc9NnyLDkWdkRBfYrxrk1gmm2h4HNZSlEFt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgPol4bz; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-62027fcf9b1so26804377b3.0
        for <linux-usb@vger.kernel.org>; Tue, 07 May 2024 09:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715099905; x=1715704705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZ/UiD6sm+4LHgYLjSe0XxUcZGEyAtRR+lu5IknlwkQ=;
        b=DgPol4bz8lFvpUaCMV46/f4jlecWYAQJDwv6T9kD9BtprbV6qaVUgYzkketwC+IJ0M
         bEZrkx5CYefd7kvKd6emSEPE7260oFNhl7Sj5oWLXbSfViLiclc5trQE0qXSQwn6aVI4
         DxXNkbEe3B7gvYyfSPltDhChjQbVrsF81Aai1/UNJbw6osAG3ZDA2/0cTxIg0X5pQaPk
         RebpbYv/Y/4xVPZ4WCWROOFo7EbLtP87kIex73OYmrSRTZezmC9qErovISzbcQw4zJVS
         M/2Vrgek2qAbECp8gSgjMrLbF+Lh6/hxHfJpZYdXSjfxt8So8/msaOVMjQGx3YHCrCXI
         +pLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099905; x=1715704705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZ/UiD6sm+4LHgYLjSe0XxUcZGEyAtRR+lu5IknlwkQ=;
        b=QOzmGE4X6z13f/E132WRyYpdWvZQSlwDoIuFRwJ3L4NI2D3NRnYMxncvWmr2or5/41
         0L4zUzr/vyfuW6gAIilibtcSb6oYVmgPjHt0oKG9zPZw8Uho9h17O+ANCGCWyI6L1JUY
         y8vpnHgGlPLDLgBFf6QCRVgaCUR67x5bvdZcQTgpr+70djqkfsXVh0PF11ZBv+Mm1Jn3
         OwGE7fM6VHDy6wcG5ezVuAv4/+dvcUSLKth112DLIJTg+mRt6ku+bUlRGYvuf+6Pg00F
         ELullv0TSPApzO2oZPBnl50/PjsVGbOHi78ujKum03lCYjVM6yPCgRjTRfb8MoyQTqu7
         zSng==
X-Gm-Message-State: AOJu0YxzCVaDgbKJyqHG/xdtv5rcGiMbPl1ueccF42+Ldv3FwI3COtrd
	HTbk7dhp+AP55wSBGoe0uQhf9fl+t26n0AkXY293h+ILkB7j3it8L3j3XAGjnCZZ32ZqdcVDNcR
	oHVzYMMSYTHCku6CoeknthC8DQHNjkMpW
X-Google-Smtp-Source: AGHT+IHtTz93nN9VsBAhtvcPcPWIApBaC6tK0MurSGUEuMg0S92Fv4kl+o9pV7nY+iPd6x7hfTdV1V7GCk0Wo3aPeHw=
X-Received: by 2002:a81:4803:0:b0:61a:e24d:186e with SMTP id
 00721157ae682-62085ac414dmr3642137b3.14.1715099904816; Tue, 07 May 2024
 09:38:24 -0700 (PDT)
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
 <CAHhAz+i9TLCb3hKpzWAL2DkH9Y25XszJO5kgbRGzsut1zCzrJw@mail.gmail.com> <8a8edaba-670b-47ad-a123-2077e2e0644d@rowland.harvard.edu>
In-Reply-To: <8a8edaba-670b-47ad-a123-2077e2e0644d@rowland.harvard.edu>
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Tue, 7 May 2024 22:08:13 +0530
Message-ID: <CAHhAz+iywarnsNmt0mbuyPV+mNYQ+OwqoDMaymTGAEv6KBcLnA@mail.gmail.com>
Subject: Re: Seeking Assistance: Implementing USB Device Suspend/Resume in
 User Space Driver
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 7:50=E2=80=AFPM Alan Stern <stern@rowland.harvard.ed=
u> wrote:
>
> On Tue, May 07, 2024 at 05:14:25PM +0530, Muni Sekhar wrote:
> > Thank you, it is very helpful.
> >
> > To verify the USB device suspend\resume functionality, I configured
> > the USB Power Management variables as follows:
> >
> > # cat /sys/bus/usb/devices/2-1.7/power/wakeup
> > enabled
> >
> > # cat /sys/bus/usb/devices/2-1.7/power/control
> > on
>
> This means that the device will be permanently on, and so it will never
> be suspended.  If you want to allow the device to be suspended, you
> have to write "auto" to the file.
Thanks a lot for these inputs.
Now, I can verify USB device auto-suspend and auto-resume through the
kernel log.

In my test system, I found three buses "Bus 001, 002, and 003" using
the lsusb command.

The USB device I want to test is located on "Bus 002".


# lsusb | grep "Bus 002" | wc
      4      37     224

As per the output of the above command, there are 4 USB devices on
"Bus 002" in my test system.


# ls -l /sys/bus/usb/devices/2*
lrwxrwxrwx 1 root root 0 Feb 14 14:48 /sys/bus/usb/devices/2-0:1.0 ->
../../../devices/pci0000:00/0000:00:14.0/usb2/2-0:1.0
lrwxrwxrwx 1 root root 0 May  7 13:16 /sys/bus/usb/devices/2-1 ->
../../../devices/pci0000:00/0000:00:14.0/usb2/2-1
lrwxrwxrwx 1 root root 0 May  7 13:16 /sys/bus/usb/devices/2-1.1 ->
../../../devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1.1
lrwxrwxrwx 1 root root 0 May  7 13:16 /sys/bus/usb/devices/2-1:1.0 ->
../../../devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1:1.0
lrwxrwxrwx 1 root root 0 May  7 13:16 /sys/bus/usb/devices/2-1.1:1.0
-> ../../../devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1.1/2-1.1:1.0
lrwxrwxrwx 1 root root 0 May  7 13:16 /sys/bus/usb/devices/2-1.7 ->
../../../devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1.7
lrwxrwxrwx 1 root root 0 May  7 13:16 /sys/bus/usb/devices/2-1.7:1.0
-> ../../../devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1.7/2-1.7:1.0

# ls -l /sys/bus/usb/devices/2* | wc
      7      77     892


The above command shows seven nodes in /sys/bus/usb/devices/2* directory.

The wakeup, control, and autosuspend_delay_ms attribute files are
controlled via /sys/bus/usb/devices/.../power/, where "..." represents
the device's ID.

I identified my test device in /sys/bus/usb/devices/.../power/ by
iterating through all the directories, reading the idVendor attribute
file, and then manipulating the power management attribute files.

Is there a way to manually map /sys/bus/usb/devices/.../power/ from
the lsusb output? Can this mapping be done from a user space program
as well? Do you have any reference examples for this? If so, could you
share their GitHub location?


>
> > # cat /sys/bus/usb/devices/2-1.7/power/autosuspend_delay_ms
> > 0
> >
> > # cat /sys/module/usbcore/parameters/autosuspend
> > 2
> >
> >
> > So, I configured the system to autosuspend the USB device as soon as
> > it becomes idle, with no transactions running through the USB device.
> > Now, how can I verify that the USB device has entered suspend mode
> > from user space? When checking /var/log/kern.log, there are no
> > relevant print statements. Are there any other log files related to
> > power management or USB subsystems?
> > Please correct me if anything in the test procedure mentioned above is
> > incorrect.
>
> You can see the device's current state by reading the
> power/runtime_status attribute file in sysfs.  There are lots of other
> informative files in that directory; you should look at them.
>
> If you want to get more debugging information in the kernel log, you can
> enable dynamic debugging for usbcore:
>
>         echo module usbcore =3Dp >/sys/kernel/debug/dynamic_debug/control
>
> Alan Stern



--=20
Thanks,
Sekhar

