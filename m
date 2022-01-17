Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD13490A9C
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jan 2022 15:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237144AbiAQOiR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jan 2022 09:38:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234918AbiAQOiP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jan 2022 09:38:15 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1016EC061748
        for <linux-usb@vger.kernel.org>; Mon, 17 Jan 2022 06:38:11 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id p5so46300861ybd.13
        for <linux-usb@vger.kernel.org>; Mon, 17 Jan 2022 06:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4yoG+tbPsXSpDMKDwUX8KZJBB8Ohp9SGfL/6SEVjgzg=;
        b=W3mDa6sjEPOJx5QAxtMq0Z44zj/Y5nm3IhtmFPnUgFZtPRAezL77AA7awZUdFR0LmO
         0CITY8OV2OQRUvczsyeYtZWJhlfBI+JxiNatpsQzkyuRPYNseWTjVS1MFyJgLsGy3AUe
         0MRUHIw/ot3/R782/LJcPOs4B+Knh+8eaLR/JaX5YHsjJRPxlSWwm+GmFdlvOe+8qQBU
         lWnagOXyfRKPN6GA9pDN5iSDfvlqWNJ8/O3j+h9TSCNZQr9ZuOqEUHtBKKDQHWv+les6
         uWv/alCwfDtH31QFO8eKFhbWMG4QjZ4uNTPoeaduqJrA5l1OupNo3rDqW/TvQJgC36rH
         M6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4yoG+tbPsXSpDMKDwUX8KZJBB8Ohp9SGfL/6SEVjgzg=;
        b=eacDKH1+BCD4R1QT99lUqERzcPY11mUzS/4zudnJCAi3YyGGc4Uapd5KluF4qzWSEu
         IblLChcpgJ2BXwUJVFjq7CzgFx7xTDpaJT3Hj4dBorbiGAdF8BMefEq5ySWOh/vBgXm6
         SyqoyeN8JXbOFMQkeJo/0O4GKREJo3tNOnWfBNiqisgFplOv85sp2KGyOyj/ok9wVmuz
         UZCxkogaSIlRBT7WHBe9fI1L3RtydY+nHATddinSOn4Kvn+Js5JwEOzHtkwymJES2BOv
         3VmekMSwM/C8oOLIBZ1OcFWbRqFalijoMNb9kNJ+ypoOKxAjsHliH3hr982K9RDcLou4
         6oQQ==
X-Gm-Message-State: AOAM530WORttQ0gigvvWwWWqlfK7QACh//4QdXaAlHq3H+LX+C8bZ/q1
        KYvIBdtJOtxS6z5DOBPeyvnq0nMZkfw1E7QgLvDXD0n/
X-Google-Smtp-Source: ABdhPJzYHuqylkQE/ANp7RELXEbMvM89ZekusEkI0yu3SvE2MlAGIlVP+yPQbaR+b8v9+Ow5rYFOGqTauM9XmpURA3I=
X-Received: by 2002:a05:6902:1c5:: with SMTP id u5mr7167400ybh.555.1642430290130;
 Mon, 17 Jan 2022 06:38:10 -0800 (PST)
MIME-Version: 1.0
References: <CAD039W71Hf06Bw4H_qjm7bRg__BjHfG=p-E7HXL62g0Yc7txBA@mail.gmail.com>
 <YeUYQB4neDz8Z0Tb@kroah.com>
In-Reply-To: <YeUYQB4neDz8Z0Tb@kroah.com>
From:   Rajaram Regupathy <rajaram.regupathy@gmail.com>
Date:   Mon, 17 Jan 2022 20:07:58 +0530
Message-ID: <CAD039W5ZmTcYErXsnSpdksc6k2L3fNwry1uP2Kr96Uo04fO9PQ@mail.gmail.com>
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

On Mon, Jan 17, 2022 at 12:48 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sun, Jan 16, 2022 at 08:49:47PM +0530, Rajaram Regupathy wrote:
> > HI
> >
> > libtypec
> > ++++++
> >
> > USB-Type C and USB Power Delivery systems are with multiple
> > specification versions, platform designs and microcontroller vendors
> > for managing  data, power and display.
> >
> > libtypec is aimed to provide a generic way for userspace System
> > Software on Linux, Android, Chrome OS or Other OSes to build developer
> > tools or
> > other management applications for USB-Type C and USB Power Delivery
> > class devices.
>
> Great, can we add this to the usbutils package, and `lsusb`?
Thanks. Yes, the goal is to have it in usbutils package.  The thought
to have  lstypec outside lsusb is as follows :

"lsusb" displays USB device details based on the USB device's "descriptors'' .
lstypec is for displaying usb-c "port capability" and the usb-c
partner "port/plug capabilities' ' and
the information is agnostic to USB descriptor topology or USB bus.
Ex: usb-c power adapters or usb-c display dongle or a usb-c e-cable etc..

Open to hear your recommendations.

>
> > Features
> > ======
> > - libtypec - get method for port and port-partner capabilities
> > -  utils/lstypec -  displaying information about USB typec class
> > devices in the system and the devices connected to them
> >
> > Release:
> > =======
> >
> > Binary : https://github.com/Rajaram-Regupathy/libtypec/releases/download/libtypec_v0.1/libtypec_0.1.tar.xz
> > Source : https://github.com/Rajaram-Regupathy/libtypec/archive/refs/tags/libtypec_v0.1.tar.gz
>
> Like was pointed out, there is no license listed for this code, so no
> one can use it.
>
> Also, it doesn't build for me:

Could you please follow  the Readme steps..?

>         $ make
>          50%] Building C object CMakeFiles/lstypec.dir/lstypec.c.o
>         100%] Linking C executable lstypec
>         usr/bin/ld: /home/gregkh/tmp/libtypec/bin/liblibtypec.a(libtypec.c.o):(.bss+0x0): multiple definition of `__packed'; CMakeFiles/lstypec.dir/lstypec.c.o:(.bss+0x0): first defined here
>         usr/bin/ld: /home/gregkh/tmp/libtypec/bin/liblibtypec.a(libtypec_sysfs_ops.c.o):(.bss+0x0): multiple definition of `__packed'; CMakeFiles/lstypec.dir/lstypec.c.o:(.bss+0x0): first defined here
>         ollect2: error: ld returned 1 exit status
>         ake[2]: *** [CMakeFiles/lstypec.dir/build.make:98: lstypec] Error 1
>         ake[1]: *** [CMakeFiles/Makefile2:839: CMakeFiles/lstypec.dir/all] Error 2
>         ake: *** [Makefile:121: all] Error 2
>
> Why does this need to be a library at all?
>
> thanks,
>
> greg k-h
