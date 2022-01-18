Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48ADF492B38
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jan 2022 17:31:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242313AbiARQbQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jan 2022 11:31:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233718AbiARQbP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jan 2022 11:31:15 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D77C061574
        for <linux-usb@vger.kernel.org>; Tue, 18 Jan 2022 08:31:14 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id g81so57601542ybg.10
        for <linux-usb@vger.kernel.org>; Tue, 18 Jan 2022 08:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ALBUN8vRLlHiByKH1QxwRG2sNf2Mz64GgW8Wu6xET/I=;
        b=HUqe0M2XfMlyyBs+oWmpjDPkVW3eQxr6rT/WA+Af3HuvuHuKKeRO4DZ5IXFM/WCIWm
         MqU3IgsL3Z0nitjsXgSbbuNN24I5ps2x1NQGuiBV6ZdCyN8gXYktDntJNBU8vusgA59Y
         o6KEdKY1aR4ATszgcmkRa+nIaYCIEey6zCxbT/X8CezLvpvNAtOT+FXaFuNIM/MggJBi
         3vyMjPtOFselRdybOCr+2pAqy9r026aLcyvx9WMwpCsTzR+hBRW3N36nBe6lRzbIisFm
         Kq+3DXBaOkwDqKpXzlTMBe3GLumdqnb7cKdLC/pqp8MyVy2j9Q6jGSGCFKNiraFXCANZ
         mElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ALBUN8vRLlHiByKH1QxwRG2sNf2Mz64GgW8Wu6xET/I=;
        b=6iDHjacVdRn1gmBdTdMU1uZeky2QE9O7gcO72bGYG/NuKWpzvXbme+AsbGNcCYl0lQ
         JCfDcRO4mx+icj89FOuHTVEaYgzdBWjADJccU7sMBV4x+yd21oyNOguUUI5nq3uQFIv2
         /5uLhix1FjJLYQrBfzbwXVY0mhMBwe1css0U9rFdql4K8C3uXa5OOSAAu0Mc7Iv7M41E
         QUyAzC2IwY1BQkFuuE5MPBH8ikKPCC6Xj/1vNDEuQ43/qChyXGyhFGXsTuxB3u9gG0QQ
         wTeXfcJBP6rHSC6iPtM1SC0zxcWyup/O3toe04Xhou6CiaCSx7cvyZ5xWtj1nw94vAUH
         enGg==
X-Gm-Message-State: AOAM532f5fso/NgUPCsgqHqqu+9H1Vr0/1WUWiRll7sekxlblK4Ec/nd
        2elgRco2KiuufpNzj6y3kfq5dSJ1kOAF7Mp1tcY=
X-Google-Smtp-Source: ABdhPJyRVXRb/MHu48KJQQdWye21Zv/B7JW8OxArSMPgM8Uferx54rNCUNvjZo8ApWJVZOSv3FxpuTvqDyOoe+JNOsM=
X-Received: by 2002:a5b:68d:: with SMTP id j13mr35507066ybq.764.1642523473947;
 Tue, 18 Jan 2022 08:31:13 -0800 (PST)
MIME-Version: 1.0
References: <CAD039W71Hf06Bw4H_qjm7bRg__BjHfG=p-E7HXL62g0Yc7txBA@mail.gmail.com>
 <YeUYQB4neDz8Z0Tb@kroah.com> <CAD039W5ZmTcYErXsnSpdksc6k2L3fNwry1uP2Kr96Uo04fO9PQ@mail.gmail.com>
 <YeWNYUkOYBWXjBFw@kroah.com>
In-Reply-To: <YeWNYUkOYBWXjBFw@kroah.com>
From:   Rajaram Regupathy <rajaram.regupathy@gmail.com>
Date:   Tue, 18 Jan 2022 22:01:02 +0530
Message-ID: <CAD039W41ds-1xi0owBTRPCweB-tt=7gL7uH4FmUSOyEdgrq77g@mail.gmail.com>
Subject: Re: [ANNOUNCE] libtypec_0.1/lstypec_0.1 is released
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com,
        Benson Leung <bleung@google.com>,
        Prashant Malani <pmalani@chromium.org>, jthies@google.com,
        saranya.gopal@intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 17, 2022 at 9:08 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jan 17, 2022 at 08:07:58PM +0530, Rajaram Regupathy wrote:
> > On Mon, Jan 17, 2022 at 12:48 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Sun, Jan 16, 2022 at 08:49:47PM +0530, Rajaram Regupathy wrote:
> > > > HI
> > > >
> > > > libtypec
> > > > ++++++
> > > >
> > > > USB-Type C and USB Power Delivery systems are with multiple
> > > > specification versions, platform designs and microcontroller vendors
> > > > for managing  data, power and display.
> > > >
> > > > libtypec is aimed to provide a generic way for userspace System
> > > > Software on Linux, Android, Chrome OS or Other OSes to build developer
> > > > tools or
> > > > other management applications for USB-Type C and USB Power Delivery
> > > > class devices.
> > >
> > > Great, can we add this to the usbutils package, and `lsusb`?
> > Thanks. Yes, the goal is to have it in usbutils package.  The thought
> > to have  lstypec outside lsusb is as follows :
> >
> > "lsusb" displays USB device details based on the USB device's "descriptors'' .
> > lstypec is for displaying usb-c "port capability" and the usb-c
> > partner "port/plug capabilities' ' and
> > the information is agnostic to USB descriptor topology or USB bus.
> > Ex: usb-c power adapters or usb-c display dongle or a usb-c e-cable etc..
> >
> > Open to hear your recommendations.
>
> It's fine to keep it as a separate program to type, or you can make it
> an option for 'lsusb' to output "lsusb --ports" or something?
>
> As your code is pretty tiny, and only reads from sysfs, it shouldn't be
> hard to integrate.  But you do need to fix the license issue :)
>

Yes, I will add the license files separately and come back.

> > > > Features
> > > > ======
> > > > - libtypec - get method for port and port-partner capabilities
> > > > -  utils/lstypec -  displaying information about USB typec class
> > > > devices in the system and the devices connected to them
> > > >
> > > > Release:
> > > > =======
> > > >
> > > > Binary : https://github.com/Rajaram-Regupathy/libtypec/releases/download/libtypec_v0.1/libtypec_0.1.tar.xz
> > > > Source : https://github.com/Rajaram-Regupathy/libtypec/archive/refs/tags/libtypec_v0.1.tar.gz
> > >
> > > Like was pointed out, there is no license listed for this code, so no
> > > one can use it.
> > >
> > > Also, it doesn't build for me:
> >
> > Could you please follow  the Readme steps..?
> >
> > >         $ make
> > >          50%] Building C object CMakeFiles/lstypec.dir/lstypec.c.o
> > >         100%] Linking C executable lstypec
> > >         usr/bin/ld: /home/gregkh/tmp/libtypec/bin/liblibtypec.a(libtypec.c.o):(.bss+0x0): multiple definition of `__packed'; CMakeFiles/lstypec.dir/lstypec.c.o:(.bss+0x0): first defined here
> > >         usr/bin/ld: /home/gregkh/tmp/libtypec/bin/liblibtypec.a(libtypec_sysfs_ops.c.o):(.bss+0x0): multiple definition of `__packed'; CMakeFiles/lstypec.dir/lstypec.c.o:(.bss+0x0): first defined here
> > >         ollect2: error: ld returned 1 exit status
> > >         ake[2]: *** [CMakeFiles/lstypec.dir/build.make:98: lstypec] Error 1
> > >         ake[1]: *** [CMakeFiles/Makefile2:839: CMakeFiles/lstypec.dir/all] Error 2
> > >         ake: *** [Makefile:121: all] Error 2
>
> I did follow the readme steps, what did I miss?
>
> If I delete the one instance of "__packed" from the project, it does
> build for me.  Perhaps you need to make sure that is defined in your
> compiler flags?
>
I cloned and checked. Will double check and comeback

> > > Why does this need to be a library at all?
>
> Again, why does this have to be a library?
>
The aim of having a library is to abstract application(s) from OS,
platform, PD Controller or Embedded Controller protocols ambiguities
and provide common methods. The methods will be similar/closer to UCSI
standard.

> thanks,
>
> greg k-h
