Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB70539C3C6
	for <lists+linux-usb@lfdr.de>; Sat,  5 Jun 2021 01:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbhFDXSz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Jun 2021 19:18:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbhFDXSy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Jun 2021 19:18:54 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EB22C061766
        for <linux-usb@vger.kernel.org>; Fri,  4 Jun 2021 16:16:51 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id o9so6213172pgd.2
        for <linux-usb@vger.kernel.org>; Fri, 04 Jun 2021 16:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=i9D/4Aiify/9/oqQ2RqPZiMT7lqddk5BVQL44kWDvxk=;
        b=NS+ZmUi2499Ul1no5ZqkaxZA3wk4kDkg/sPsruUa2z6b1JcNxsAc4TQfINX2taR4Yr
         9uJZxrID5kjTddD+9LVslN5NGYkc8a2pU6Wz2Y+FbsHd4mGeY+fxDbDNx+eSygOuV+jD
         uMlhkRtX5cb/EFOhTg3FasaoHX7ttNZ2MprEzP+OoBgIjRXXBtx6AkvqzOq/RVFARcEN
         x07lRAKS9msmKSfa7yAk4OXKbrTkval0QB5TyA4XooLVam0HG0MCR4EgeR58WCinNWVd
         VK49685o/HQv+IaYwxQPblEP6IHRlmLhoZFL+qFx/cm6SlYZsmJ3Y3CRYsEdrcf1s3PM
         yz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=i9D/4Aiify/9/oqQ2RqPZiMT7lqddk5BVQL44kWDvxk=;
        b=iPsCQK2kyUYnzl1mzvqNpeJRaKeF5kq2wacPNBPqyhFyhvLuhfj0j5R7czmoONRmEp
         SwpxSBP1VguEBSl+FyFH1vE58yNO3qUb8CAdFSRIoRbCdnEYxha5OJV4hebFmM/JI7sm
         dnDeNnGHGc4HOvzXOR0lh8v3XFAvDAeHKoTtxzUQceloJmO0tOD9qpXo7jAq+0ADZJH/
         BVJega2CcNNzmKpw0sinU6l/nvNwSMI3d/Wwmoiez/ff99m6YcAYkI3bs7tZ9+7LSAKz
         wt5Uv5L+XtamrZJr6YvBUndnNDC2EFqS6aCyA6Hl8WwbeHrQz3iBppyjGYTSwkyGa6Er
         S1LA==
X-Gm-Message-State: AOAM533Qg2tpK35LikjCt9ZOJHJyj0GxxFMiKjg09vYiswlVroQI30w0
        h1jTfeLLKytUBVJZmFWV715C1T3NN3ASZ6Flopw=
X-Google-Smtp-Source: ABdhPJwvXg1aogiBTC3/VIAyJ7tWwsRVx7Pz0Kt2m24a6MF8oUevvC9I8Y8g84EFqgGkFNYhonL4mGfAibkPAlwjWT4=
X-Received: by 2002:a62:51c2:0:b029:2e9:e4c5:2a74 with SMTP id
 f185-20020a6251c20000b02902e9e4c52a74mr6993815pfb.51.1622848610997; Fri, 04
 Jun 2021 16:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <465ef3ac-4291-6392-e52b-26cc0c34dd7c@palosanto.com>
 <YLXmrmW9/fB1WbzR@hovoldconsulting.com> <2881bd97-f790-c4d6-aed6-de9ab8cd1a9e@palosanto.com>
 <YLZVAmYxFZ1Q/nrH@hovoldconsulting.com> <60705932-860a-701c-1019-16f9e16c39dd@palosanto.com>
 <YLeapcNbvExeGKuE@hovoldconsulting.com> <cb99a25e-5758-051c-afb6-29d8ef26ee0b@palosanto.com>
 <YLpJzTmAnfsrE7UP@hovoldconsulting.com>
In-Reply-To: <YLpJzTmAnfsrE7UP@hovoldconsulting.com>
From:   David Frey <dpfrey@gmail.com>
Date:   Fri, 4 Jun 2021 16:16:26 -0700
Message-ID: <CAAvkfd-vmi_VJrCQg-ktF+sZZUfb5J+DJfjHv=TdVafyj1m1Ew@mail.gmail.com>
Subject: Re: cp210x module broken in 5.12.5 and 5.12.6, works in 5.11.21 (with bisection)
To:     Johan Hovold <johan@kernel.org>
Cc:     =?UTF-8?Q?Alex_Villac=C3=ADs_Lasso?= <a_villacis@palosanto.com>,
        linux-usb@vger.kernel.org, Pho Tran <pho.tran@silabs.com>,
        Tung Pham <tung.pham@silabs.com>, Hung.Nguyen@silabs.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I'm not sure if this matters, but I have been told that the failing
boards have CP2102N chips with"A01" firmware.  I tried to install
SIlicon Labs Simplicity Studio on Windows because I read that it would
be able to identify the firmware version of the device, but I couldn't
actually figure out how to find the information. If someone can tell
me a way to get the firmware version, I can check to see if it's
different between the device that does exhibit this failure and the
one that doesn't.

Thanks,
David

On Fri, Jun 4, 2021 at 8:42 AM Johan Hovold <johan@kernel.org> wrote:
>
> [ +CC: the Silabs team and David who reported the same issue ]
>
> Quick summary: Some CP2102N devices cannot use SET_MHS when ulXonLimit
> and ulXoffLimit are set to 128/128 even when auto-RTS is disabled.
> Leaving the default limits at 0/0 seems to work.
>
> Tung, Hung and Pho, do you have some idea of what might be going on
> here?
>
> The full thread is here:
>
>         https://lore.kernel.org/r/465ef3ac-4291-6392-e52b-26cc0c34dd7c@pa=
losanto.com
> On Wed, Jun 02, 2021 at 10:54:14AM -0500, Alex Villac=C3=ADs Lasso wrote:
> > El 2/6/21 a las 09:50, Johan Hovold escribi=C3=B3:
>
> > > This may be a little far-fetched but can you send me the logs (debugg=
ing
> > > again enabled) from when:
> > >
> > >     1. plugging the device in
> > >     2. stty -F /dev/ttyUSB0 ixon ixoff
> > >     3. stty -F /dev/ttyUSB0 crtscts -ixon -ixoff
> > >     4. cat /dev/ttyUSB0     # + CTRL-C
> > >
> > > No need to run the terminal program.
> > >
> > > If you could also apply the below debugging patch (on top of the
> > > previous one) which will dump some device settings during probe befor=
e
> > > doing the above that would be great.
> > >
> > > Hopefully this will gives some more clues but otherwise I'll probably
> > > just leave the default IXOFF limits for CP2102N to fix the regression=
.
>
> > >  From 65b53f408b5d6b6408420ed9d1c827f80401796e Mon Sep 17 00:00:00 20=
01
> > > From: Johan Hovold <johan@kernel.org>
> > > Date: Wed, 2 Jun 2021 16:23:21 +0200
> > > Subject: [PATCH] USB: serial: cp210x: dump communication properties
>
> > Tests with *both* patches applied:
>
> Thanks again for running the new tests.
>
> > <device plugged in>
>
> > jun 02 10:44:29 karlalex-asus kernel: usb 1-9: New USB device found,
> > idVendor=3D10c4, idProduct=3Dea60, bcdDevice=3D 1.00
>
> > jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: wLength =3D 66
> > jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulMaxTxQueue =3D =
640
> > jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulMaxRxQueue =3D =
640
> > jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulProvSubType =3D=
 1
> > jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulProvCapabilitie=
s
> > =3D 0x13f
> > jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulSettableParams =
=3D
> > 0x7f
> > jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulCurrentTx-Queue
> > =3D 640
> > jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulCurrentRx-Queue
> > =3D 640
>
> This all matches the CP2102N I've got here and which can set RTS just
> fine also with the IXOFF limits set (unlike your device).
>
> Unless there's some other configuration setting causing it would seem
> your device firmware is just buggy (and bcdDevice was not updated when
> it was fixed, which seems unlikely).
>
> > $ stty -F /dev/ttyUSB0 ixon ixoff
> >
> > jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0:
> > cp210x_change_speed - setting baud rate to 9600
> > jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0:
> > cp210x_set_flow_control - ctrl =3D 0x00, flow =3D 0x00
> > jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0:
> > cp210x_set_flow_control - xon_limit =3D 0, xoff_limit =3D 0
> > jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0:
> > cp210x_set_flow_control - ctrl =3D 0x00, flow =3D 0x01
> > jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0:
> > cp210x_tiocmset_port - control =3D 0x0303
> > jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: failed set reques=
t
> > 0x7 status: -32
> > jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0:
> > cp210x_set_flow_control - ctrl =3D 0x00, flow =3D 0x01
> > jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0:
> > cp210x_set_flow_control - xon_limit =3D 128, xoff_limit =3D 128
> > jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0:
> > cp210x_set_flow_control - ctrl =3D 0x01, flow =3D 0x43
>
> Here IXOFF is enabled.
>
> > jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0:
> > cp210x_tiocmset_port - control =3D 0x0300
> > jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: failed set reques=
t
> > 0x7 status: -32
>
> And setting the IXOFF limits only when software flow control is enabled
> would not work either.
>
> > $ stty -F /dev/ttyUSB0 crtscts -ixon -ixoff
> >
> > jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0:
> > cp210x_change_speed - setting baud rate to 9600
> > jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0:
> > cp210x_set_flow_control - ctrl =3D 0x01, flow =3D 0x43
> > jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0:
> > cp210x_set_flow_control - xon_limit =3D 128, xoff_limit =3D 128
> > jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0:
> > cp210x_set_flow_control - ctrl =3D 0x00, flow =3D 0x03
> > jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0:
> > cp210x_tiocmset_port - control =3D 0x0303
> > jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0: failed set reques=
t
> > 0x7 status: -32
> > jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0:
> > cp210x_set_flow_control - ctrl =3D 0x00, flow =3D 0x03
> > jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0:
> > cp210x_set_flow_control - xon_limit =3D 128, xoff_limit =3D 128
> > jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0:
> > cp210x_set_flow_control - ctrl =3D 0x09, flow =3D 0x80
>
> Here hardware flow control is enabled.
>
> > jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0:
> > cp210x_tiocmset_port - ctrl =3D 0x08, flow =3D 0x00
>
> And then RTS can still be changed using the SET_FLOW command.
>
> I just ran a quick test here and and leaving the ixoff_limit at zero
> essentially breaks software flow control since XOFF will be sent when
> there are only 7 characters in the receive buffer.
>
> Since software flow control support was only recently added, we may have
> to accept that for CP2102N to fix the regression, but I'd really like to
> understand why your devices behave the way they do first and see if
> there's some other way to work around this.
>
> Hopefully Silabs can provide some insight.
>
> Also, could you try setting those limits to some other values and see if
> the SET_MHS (request 0x7) errors go away?
>
> Setting both to 513 is supposed to give us 192/64 according to the
> datasheet which would be good enough, for example. Seems to work as
> documented here (at least for XOFF).
>
> Johan
