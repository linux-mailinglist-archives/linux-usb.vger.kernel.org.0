Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5E0490B88
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jan 2022 16:38:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237341AbiAQPiQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jan 2022 10:38:16 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:36792 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237314AbiAQPiP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jan 2022 10:38:15 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 48616B80E04
        for <linux-usb@vger.kernel.org>; Mon, 17 Jan 2022 15:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3CFC36AE3;
        Mon, 17 Jan 2022 15:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1642433893;
        bh=vHJbfdsPkZj3zRvbHmSd/L5tpIuulctGxfutmXnMCQY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xh5miUstIUmzgAaRLHGyJN/NSodIbgZdUrhDCG2Jzn46cE5GrIwB/qQjMOq/90WRJ
         qM8v0ox8gF57V8NhipocYA/D6auDUgh613BgAS3XZxo720p/H8ZCJ7/+LETcqBMGx3
         d32yuDDCthrJ9pbQMqqXnzCejIlW3aZZXMU+wSxg=
Date:   Mon, 17 Jan 2022 16:38:09 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rajaram Regupathy <rajaram.regupathy@gmail.com>
Cc:     linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com,
        Benson Leung <bleung@google.com>,
        Prashant Malani <pmalani@chromium.org>, jthies@google.com,
        saranya.gopal@intel.com
Subject: Re: [ANNOUNCE] libtypec_0.1/lstypec_0.1 is released
Message-ID: <YeWNYUkOYBWXjBFw@kroah.com>
References: <CAD039W71Hf06Bw4H_qjm7bRg__BjHfG=p-E7HXL62g0Yc7txBA@mail.gmail.com>
 <YeUYQB4neDz8Z0Tb@kroah.com>
 <CAD039W5ZmTcYErXsnSpdksc6k2L3fNwry1uP2Kr96Uo04fO9PQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD039W5ZmTcYErXsnSpdksc6k2L3fNwry1uP2Kr96Uo04fO9PQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 17, 2022 at 08:07:58PM +0530, Rajaram Regupathy wrote:
> On Mon, Jan 17, 2022 at 12:48 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Sun, Jan 16, 2022 at 08:49:47PM +0530, Rajaram Regupathy wrote:
> > > HI
> > >
> > > libtypec
> > > ++++++
> > >
> > > USB-Type C and USB Power Delivery systems are with multiple
> > > specification versions, platform designs and microcontroller vendors
> > > for managing  data, power and display.
> > >
> > > libtypec is aimed to provide a generic way for userspace System
> > > Software on Linux, Android, Chrome OS or Other OSes to build developer
> > > tools or
> > > other management applications for USB-Type C and USB Power Delivery
> > > class devices.
> >
> > Great, can we add this to the usbutils package, and `lsusb`?
> Thanks. Yes, the goal is to have it in usbutils package.  The thought
> to have  lstypec outside lsusb is as follows :
> 
> "lsusb" displays USB device details based on the USB device's "descriptors'' .
> lstypec is for displaying usb-c "port capability" and the usb-c
> partner "port/plug capabilities' ' and
> the information is agnostic to USB descriptor topology or USB bus.
> Ex: usb-c power adapters or usb-c display dongle or a usb-c e-cable etc..
> 
> Open to hear your recommendations.

It's fine to keep it as a separate program to type, or you can make it
an option for 'lsusb' to output "lsusb --ports" or something?

As your code is pretty tiny, and only reads from sysfs, it shouldn't be
hard to integrate.  But you do need to fix the license issue :)

> > > Features
> > > ======
> > > - libtypec - get method for port and port-partner capabilities
> > > -  utils/lstypec -  displaying information about USB typec class
> > > devices in the system and the devices connected to them
> > >
> > > Release:
> > > =======
> > >
> > > Binary : https://github.com/Rajaram-Regupathy/libtypec/releases/download/libtypec_v0.1/libtypec_0.1.tar.xz
> > > Source : https://github.com/Rajaram-Regupathy/libtypec/archive/refs/tags/libtypec_v0.1.tar.gz
> >
> > Like was pointed out, there is no license listed for this code, so no
> > one can use it.
> >
> > Also, it doesn't build for me:
> 
> Could you please follow  the Readme steps..?
> 
> >         $ make
> >          50%] Building C object CMakeFiles/lstypec.dir/lstypec.c.o
> >         100%] Linking C executable lstypec
> >         usr/bin/ld: /home/gregkh/tmp/libtypec/bin/liblibtypec.a(libtypec.c.o):(.bss+0x0): multiple definition of `__packed'; CMakeFiles/lstypec.dir/lstypec.c.o:(.bss+0x0): first defined here
> >         usr/bin/ld: /home/gregkh/tmp/libtypec/bin/liblibtypec.a(libtypec_sysfs_ops.c.o):(.bss+0x0): multiple definition of `__packed'; CMakeFiles/lstypec.dir/lstypec.c.o:(.bss+0x0): first defined here
> >         ollect2: error: ld returned 1 exit status
> >         ake[2]: *** [CMakeFiles/lstypec.dir/build.make:98: lstypec] Error 1
> >         ake[1]: *** [CMakeFiles/Makefile2:839: CMakeFiles/lstypec.dir/all] Error 2
> >         ake: *** [Makefile:121: all] Error 2

I did follow the readme steps, what did I miss?

If I delete the one instance of "__packed" from the project, it does
build for me.  Perhaps you need to make sure that is defined in your
compiler flags?

> > Why does this need to be a library at all?

Again, why does this have to be a library?

thanks,

greg k-h
