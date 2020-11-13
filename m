Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A02722B1EE3
	for <lists+linux-usb@lfdr.de>; Fri, 13 Nov 2020 16:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgKMPf3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Nov 2020 10:35:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgKMPf3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Nov 2020 10:35:29 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BECE4C0613D1
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2020 07:35:28 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id j205so14420704lfj.6
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2020 07:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QgEelvqepj7dJn97Ypu8skbF6Wbs3DPU03jJjGKjLQI=;
        b=rxNxNaDG/DslSA8vY9XQLwfQpU1ESdQ9TYvLmPoOuB85iYA+TLppaXmRbcd8x5TDq0
         ttz8Ao8REPHeUxfUvP6quKzeH01LbUwcCFOM1r/UmQzuqdfy+0BoMJk6NmobVRSREfo3
         LB8mLcuJBHPJpyODkIZ8vk+k7xFvmz8kRqXFC18AwV4fs9QEqoXV3f/V8ntVJNcwVA2u
         d4/hwL2HxdxIqVVhMT1BpiwgMSR5CWAbbekVlunZC2BGHaGNdMSmJqao0I4ZgJXVqTwX
         yWHiCVoDRoRufaO59gIydrrR/fwAdL4WbAMr0VxpRtjA9J1laDG921ta4K6uqT2Bej/c
         h3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QgEelvqepj7dJn97Ypu8skbF6Wbs3DPU03jJjGKjLQI=;
        b=Ar5lu7/T2TFrpV84CO2mfLX/9kGw5cOh9oZ6e8Q10TbIlfoh4Q4FsEn+4wA1WhBigZ
         fZoclA4QiRuqNkQTMXoduMCDUi/Ulq1jXcmwc9Rf6G/C39AAegg7Iy4RbPZA56UOsDlV
         6iGS/FBqI6MLDtMfrrwwDgyxQnZ8blDKyOAJUi7MlVnI+6WTFbjfUgQmzGdJRFTBU/Gm
         yTVH4RdFtlrDVMtQ1NklhmiA8IurE0LoHqpo6H7BGfGjaVcY9nFbglAr34/MlmaKUXFS
         7cxh1lVC6k4GNjkmpwZgYEDC9J+W8ymdwh3h6avoAS16YvlTnsMDUm0Yf9UDbfvkFSWd
         w/0A==
X-Gm-Message-State: AOAM533Zj1ZvycPySQMPwCo/xhD4YFuUBlq6TVJJs2bUHn1R6cWDvAoi
        urRGJ/ZNI9KDt+Ssn5Ro5LxY7HAQSZjFB6ovZSA=
X-Google-Smtp-Source: ABdhPJxOhiaZYJgzuTGkDNub+4N+P1YDG9ZuxquZEOVoREQEM1Db7i4hzb7Ig/8qb7eT7QOZCLzHK3gk7w13vVzX34c=
X-Received: by 2002:a19:418d:: with SMTP id o135mr1172622lfa.329.1605281722300;
 Fri, 13 Nov 2020 07:35:22 -0800 (PST)
MIME-Version: 1.0
References: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
 <20201111092941.GJ14896@b29397-desktop> <CAB=otbSAGhDYxim9_fsyH4pZCLqgq+bxNJfv5hXqgQRVngVaig@mail.gmail.com>
In-Reply-To: <CAB=otbSAGhDYxim9_fsyH4pZCLqgq+bxNJfv5hXqgQRVngVaig@mail.gmail.com>
From:   Glenn Schmottlach <gschmottlach@gmail.com>
Date:   Fri, 13 Nov 2020 10:35:10 -0500
Message-ID: <CAMS2kBF5Gvhnf7AzdeSFeVeWBLhtHM_hHfTvMLTN-3Jkh=BwHw@mail.gmail.com>
Subject: Re: [PATCH 0/3] UAC2 Gadget: feedback endpoint support
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 12, 2020 at 6:20 PM Ruslan Bilovol <ruslan.bilovol@gmail.com> wrote:
>
> On Wed, Nov 11, 2020 at 11:30 AM Peter Chen <peter.chen@nxp.com> wrote:
> >
> > On 20-11-08 02:18:28, Ruslan Bilovol wrote:
> > > Current UAC2 gadget implements capture/sync paths
> > > as two USB ISO ASYNC endpoints (IN and OUT).
> > >
> > > This violates USB spec which says that ISO ASYNC OUT endpoint
> > > should have feedback companion endpoint.
> > > See USB2.0 spec  "5.12.4.1 Synchronization Type": asynchronous
> > > sink provides explicit feedback (isochronous pipe).
> > > Interesting that for ISO ASYNC *IN* endpoint respective
> > > feedback isn't required since source provides implicit
> > > feedforward (data stream).
> > >
> > > While it's not an issue if UAC2 Gadget is connected to
> > > Linux host (Linux ignores missing feedback endpoint),
> > > with other hosts like Windows or MacOS the UAC2 Gadget
> > > isn't enumerated due to missing feedback endpoint.
> > >
> > > This patch series adds feedback endpoint support to
> > > UAC2 function, new control to UAC2 mixer which can
> > > be used by userspace tools (like alsaloop from alsa-utils)
> > > for updating feedback frequency reported to the host.
> > > This is useful for usecases when UAC2 Gadget's audio
> > > samples are played to another codec or audio card
> > > with its own internal freerunning clock so host can
> > > be notified that more/less samples are required.
> > >
> > > The alsaloop tool requires some (relatively small)
> > > modifications in order to start support driving
> > > feedback frequency through UAC2 mixer control.
> > > That change will be sent as a separate patch
> > > to ALSA community.
> > >
> > > Also added ability to switch ISO ASYNC OUT endpoint into
> > > adaptive endpoint which doesn't require feedback endpoint
> > > (as per USB spec).
> > >
> > > Ruslan Bilovol (3):
> > >   usb: gadget: f_uac2/u_audio: add feedback endpoint support
> > >   usb: gadget: f_uac2: add adaptive sync support for capture
> > >   usb: gadget: u_audio: add real feedback implementation
> >
> > Hi Ruslan,
> >
> > I applied your patches, but WIN10 still can't recognize it well.
> > The UAC1 is OK for WIN10 with the below same configuration.
> > Any debug information you would like to know to check it?
> >
> >
> > if [ "$FUNC" == "uac2" ]; then
> > mkdir functions/$FUNC".0"
> > echo 2 > functions/$FUNC".0"/p_ssize
> > echo 48000 > functions/$FUNC".0"/p_srate
> > echo 3 > functions/$FUNC".0"/p_chmask
> >
> > echo 2 > functions/$FUNC".0"/c_ssize
> > echo 48000 > functions/$FUNC".0"/c_srate
> > echo 3 > functions/$FUNC".0"/c_chmask
> > #echo 4 > functions/$FUNC".0"/req_number
> > ln -s functions/$FUNC".0" configs/c.1
> > echo high-speed > /sys/kernel/config/usb_gadget/g1/max_speed
> > fi
> >
>
> Hmm... I just tested below config and it works fine with my Win10.
> The only thing I noticed is Windows doesn't enable UAC2 gadget
> by default, but this can be done from Win10 sound settings
>
> --------------------------------->8--------------------------------------
> mkdir cfg
> mount none cfg -t configfs
> mkdir cfg/usb_gadget/g1
> cd cfg/usb_gadget/g1
> mkdir configs/c.1
> mkdir functions/uac2.0
>
> # 44.1 kHz sample rate
> echo 44100 > functions/uac2.0/c_srate
> echo 44100 > functions/uac2.0/p_srate
>
> mkdir strings/0x409
> mkdir configs/c.1/strings/0x409
> echo 0x0101 > idProduct
> echo 0x1d6b > idVendor
> echo my-serial-num > strings/0x409/serialnumber
> echo my-manufacturer > strings/0x409/manufacturer
> echo "Test gadget" > strings/0x409/product
> echo "Conf 1" > configs/c.1/strings/0x409/configuration
> echo 120 > configs/c.1/MaxPower
> ln -s functions/uac2.0 configs/c.1
> echo musb-hdrc.0 > UDC
> --------------------------------->8--------------------------------------
>
> Thanks,
> Ruslan

Hi Ruslan -

With your configuration (above) Win10 was able to recognize and load
the driver. What appears to prevent my configuration from loading is
the fact that I selected 48K as my sample rate and my capture/playback
channel mask includes more than two (2) channels. If I take your
configuration and change the sample rate (c_srate/p_srate) to 48000
Windows will fail to load the driver. Likewise, setting the
c_chmask/p_chmask to 7 (three channels) will also cause the driver to
fail to load.

You mentioned there is an option in Win10 Sound Settings to "enable"
UAC2 by default. I cannot find that option and I wonder if this is
what is preventing me from changing the sample rate or channel mask?
Could Windows be treating my audio gadget as a UAC1 device rather than
a fully multi-channel audio device (even though the usbaudio2.sys
driver is loaded)? Have you tried other configurations to verify your
Win10 box supports more than two channels and a 44.1K sample rate? I
look forward to your feedback and any suggestions you might offer.

Thanks,

Glenn
