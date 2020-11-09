Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA7022ABDAF
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 14:48:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731839AbgKINsO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Nov 2020 08:48:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729672AbgKIM4H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Nov 2020 07:56:07 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8A5BC0613CF
        for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2020 04:56:05 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id z1so4687238plo.12
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2020 04:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=G4xKjJj5HtSpKY86g0uLApnrIEMRxOu5WyaFXzUb0uA=;
        b=iNHaIWkAxyklFM6T5HiI4XkCfaTzvkF/2obOPJDw0OnxG4kyUbiwIEixE2oVzBAT/m
         Ywbu2bfrRNz0+3rISIxD/8U3Vtwqwld1MCs3ApoxwYuM7qNv7k2XqXpFBDV0cFQZnOgK
         +hYvzv5ZOeI3InSwLLdMGX//q4BZZ5ErIO0zkMYYZnotatlidYjfjIjWJU/ozXC/t4b7
         jrsMw/JKaiRwVdFXLgJGah6YTfZAEQ3wJVYO2Q/Xm741z3ZpHIq/bROl3s01+xTK5982
         RVTDMl6ru8LuvDuzXACbDLy/nd38PWMUFX7GMQ8QESMSa5iFWf8LHxqKRH4e7+8zlA0W
         1kmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=G4xKjJj5HtSpKY86g0uLApnrIEMRxOu5WyaFXzUb0uA=;
        b=OACxzXUf/iNtbIyegXL2upM8YST7EESWKVrQa3VQVfKkJO0wLodm1gaZ/pIRes6Ga9
         30niKX9nZj8AB18NFI1inI0vagaHHoHPlbMcn4vNiz2/baH0n1PgPzbYWbNG1eLYcWcm
         p3f1823uZh2KgHPIkmg7l4Uam3dgcDzGR2PoPk2A+TjYYXopobxaaBYM6tAv0AYXqvaX
         cl4junVdbvxd+6xlY26d9sL+nf+q5PWeRgpnIS5c+aqUge274rCjGRuhPKDutjTUcKDJ
         13ZVPlpUsjEhgOm7iAevVBOw9h7EOlc+bur/6m4KfizXdUfTtO6vxSudkeKNickGI9eJ
         lpeg==
X-Gm-Message-State: AOAM532nDs/afTaVLIBrSb6qHptrVUS3my6PEHyoJgOCyKGHA2Scxx8+
        s/xn9AgyNNXsL1WX7ZmpW/JMcsVsVo89o+PEOy4=
X-Google-Smtp-Source: ABdhPJxCsc4AQHUCUGWuU/aN/8pAuUnswyr4HsVAqh1VD35uBl3S3R1wsweiSdeNKDSVZ64RKWVIdE8+BuxXx962PxQ=
X-Received: by 2002:a17:902:d3d4:b029:d7:e936:7651 with SMTP id
 w20-20020a170902d3d4b02900d7e9367651mr2523915plb.57.1604926565382; Mon, 09
 Nov 2020 04:56:05 -0800 (PST)
MIME-Version: 1.0
References: <CAB31r6UbF_Q-APvfmxanvMZOYJZwr0eEPwMQ8EGWw3-VkJtHhQ@mail.gmail.com>
 <20201109112051.GL4062920@kuha.fi.intel.com> <dab0302c9156a845923ee7fbefad7dd4305eedb3.camel@redhat.com>
In-Reply-To: <dab0302c9156a845923ee7fbefad7dd4305eedb3.camel@redhat.com>
From:   Vladimir Yerilov <openmindead@gmail.com>
Date:   Mon, 9 Nov 2020 22:55:53 +1000
Message-ID: <CAB31r6UifobJvpUQA7e1M4SK8nWuNbMKPY19EiVdbUM_HaHkvg@mail.gmail.com>
Subject: Re: Power supply detection issue caused by ucsi_psy?
To:     Benjamin Berg <bberg@redhat.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks!
Will test as soon as I can.

The machine is Xiaomi laptop, made by Timi Computing, model is TM1701,
firmware is made by Insyde company.

=D0=BF=D0=BD, 9 =D0=BD=D0=BE=D1=8F=D0=B1. 2020 =D0=B3. =D0=B2 21:36, Benjam=
in Berg <bberg@redhat.com>:
>
> Hi,
>
> On Mon, 2020-11-09 at 13:20 +0200, Heikki Krogerus wrote:
> > On Mon, Nov 09, 2020 at 08:48:06PM +1000, Vladimir Yerilov wrote:
> > > Since linux 5.8 I'm experiencing a problem related to power source
> > > detection on my laptop. My machine is equipped with 2 typec ports, on=
e
> > > of them has power delivery and is used for charging, another one has
> > > only data transfer capability. The issue is, when I unplug the power
> > > cable, the OS is reporting something like "Battery at 100%, plugged i=
n
> > > but still discharging" (KDE Plasma notification) - whether another
> > > port is used or not. I checked with upower, you can see the output fo=
r
> > > kernel 5.4 and 5.10 attached. In brief, on 5.8 onwards I have some
> > > "line_power_ucsi_source_psy_USBC000o001" device which is considered a
> > > power supply and that prevents OS to switch to "battery mode" when
> > > unplugging the cable, instead it thinks there's a power source but no=
t
> > > powerful enough to charge the battery, upower says this: "on-battery:
> > >     no", but actually no ac power source is connected.
> > > I did some research with git bisect up to the merge commit
> > > `e611c0fe318c6d6827ee2bba660fbc23cf73f7dc` ("Merge tag 'usb-5.8-rc1'
> > > of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb"), and
> > > looked through its content. My wild guess based on upower output is
> > > that a new driver introduced there, /drivers/usb/typec/ucsi/psy.c, is
> > > responsible for this wrong behavior.
> > >
> > > Could you please look into that based on info I'm providing?
> > > Thank you!
> >
> > This sounds a bit like the issue that was reported and fixed here:
> > https://lore.kernel.org/lkml/20201009144047.505957-1-benjamin@sipsoluti=
ons.net/
>
> I agree, sounds very much like the issue I was seeing.
>
> What machine/model are you seeing this on? The PPM is implemented in
> Firmware, so the behaviour will depend on the Vendor or even model. I
> observed it on a Lenovo laptop, but would be curious to know if similar
> issues happen elsewhere.
>
> I only observed an issue when using a thunderbolt dock and not with a
> plain USB-C charger.
>
> > Can you try the two patches from that series?
>
> Yeah, that would be a good data point.
>
> Benjamin
>
> > +Bejamin, who prepared those patches.
> >
> > > Device: /org/freedesktop/UPower/devices/line_power_ADP0
> > >   native-path:          ADP0
> > >   power supply:         yes
> > >   updated:              Sun 08 Nov 2020 15:27:39 +10 (97 seconds
> > > ago)
> > >   has history:          no
> > >   has statistics:       no
> > >   line-power
> > >     warning-level:       none
> > >     online:              yes
> > >     icon-name:          'ac-adapter-symbolic'
> > >
> > > Device: /org/freedesktop/UPower/devices/battery_BAT0
> > >   native-path:          BAT0
> > >   vendor:               SUNWODA
> > >   model:                R15B01W
> > >   serial:               ACFA
> > >   power supply:         yes
> > >   updated:              Sun 08 Nov 2020 15:27:39 +10 (97 seconds
> > > ago)
> > >   has history:          yes
> > >   has statistics:       yes
> > >   battery
> > >     present:             yes
> > >     rechargeable:        yes
> > >     state:               charging
> > >     warning-level:       none
> > >     energy:              46.198 Wh
> > >     energy-empty:        0 Wh
> > >     energy-full:         46.664 Wh
> > >     energy-full-design:  60.04 Wh
> > >     energy-rate:         2.059 W
> > >     voltage:             8.672 V
> > >     time to full:        13.6 minutes
> > >     percentage:          99%
> > >     capacity:            77.7215%
> > >     technology:          lithium-ion
> > >     icon-name:          'battery-full-charging-symbolic'
> > >   History (charge):
> > >     1604813259      0.000   unknown
> > >   History (rate):
> > >     1604813259      0.000   unknown
> > >
> > > Device:
> > > /org/freedesktop/UPower/devices/line_power_ucsi_source_psy_USBC000o
> > > 001
> > >   native-path:          ucsi-source-psy-USBC000:001
> > >   power supply:         yes
> > >   updated:              Sun 08 Nov 2020 15:27:39 +10 (97 seconds
> > > ago)
> > >   has history:          no
> > >   has statistics:       no
> > >   line-power
> > >     warning-level:       none
> > >     online:              yes
> > >     icon-name:          'ac-adapter-symbolic'
> > >
> > > Device: /org/freedesktop/UPower/devices/DisplayDevice
> > >   power supply:         yes
> > >   updated:              Sun 08 Nov 2020 15:27:39 +10 (97 seconds
> > > ago)
> > >   has history:          no
> > >   has statistics:       no
> > >   battery
> > >     present:             yes
> > >     state:               charging
> > >     warning-level:       none
> > >     energy:              46.198 Wh
> > >     energy-full:         46.664 Wh
> > >     energy-rate:         2.059 W
> > >     time to full:        13.6 minutes
> > >     percentage:          99%
> > >     icon-name:          'battery-full-charging-symbolic'
> > >
> > > Daemon:
> > >   daemon-version:  0.99.11
> > >   on-battery:      no
> > >   lid-is-closed:   no
> > >   lid-is-present:  yes
> > >   critical-action: HybridSleep
> > > Device: /org/freedesktop/UPower/devices/line_power_ADP0
> > >   native-path:          ADP0
> > >   power supply:         yes
> > >   updated:              Sun 08 Nov 2020 15:29:25 +10 (18 seconds
> > > ago)
> > >   has history:          no
> > >   has statistics:       no
> > >   line-power
> > >     warning-level:       none
> > >     online:              no
> > >     icon-name:          'ac-adapter-symbolic'
> > >
> > > Device: /org/freedesktop/UPower/devices/battery_BAT0
> > >   native-path:          BAT0
> > >   vendor:               SUNWODA
> > >   model:                R15B01W
> > >   serial:               ACFA
> > >   power supply:         yes
> > >   updated:              Sun 08 Nov 2020 15:29:25 +10 (18 seconds
> > > ago)
> > >   has history:          yes
> > >   has statistics:       yes
> > >   battery
> > >     present:             yes
> > >     rechargeable:        yes
> > >     state:               discharging
> > >     warning-level:       none
> > >     energy:              46.198 Wh
> > >     energy-empty:        0 Wh
> > >     energy-full:         46.664 Wh
> > >     energy-full-design:  60.04 Wh
> > >     energy-rate:         1.998 W
> > >     voltage:             8.44 V
> > >     time to empty:       23.1 hours
> > >     percentage:          99%
> > >     capacity:            77.7215%
> > >     technology:          lithium-ion
> > >     icon-name:          'battery-full-symbolic'
> > >   History (charge):
> > >     1604813365      99.000  charging
> > >   History (rate):
> > >     1604813365      1.998   charging
> > >
> > > Device:
> > > /org/freedesktop/UPower/devices/line_power_ucsi_source_psy_USBC000o
> > > 001
> > >   native-path:          ucsi-source-psy-USBC000:001
> > >   power supply:         yes
> > >   updated:              Sun 08 Nov 2020 15:27:39 +10 (124 seconds
> > > ago)
> > >   has history:          no
> > >   has statistics:       no
> > >   line-power
> > >     warning-level:       none
> > >     online:              yes
> > >     icon-name:          'ac-adapter-symbolic'
> > >
> > > Device: /org/freedesktop/UPower/devices/DisplayDevice
> > >   power supply:         yes
> > >   updated:              Sun 08 Nov 2020 15:29:25 +10 (18 seconds
> > > ago)
> > >   has history:          no
> > >   has statistics:       no
> > >   battery
> > >     present:             yes
> > >     state:               discharging
> > >     warning-level:       none
> > >     energy:              46.198 Wh
> > >     energy-full:         46.664 Wh
> > >     energy-rate:         1.998 W
> > >     time to empty:       23.1 hours
> > >     percentage:          99%
> > >     icon-name:          'battery-full-symbolic'
> > >
> > > Daemon:
> > >   daemon-version:  0.99.11
> > >   on-battery:      no
> > >   lid-is-closed:   no
> > >   lid-is-present:  yes
> > >   critical-action: HybridSleep
> > >
> >
> > thanks,
> >



--=20
----
Best regards,
Vladimir Yerilov
