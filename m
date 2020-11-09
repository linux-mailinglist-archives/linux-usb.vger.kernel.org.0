Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 327E72AC1A4
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 18:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730103AbgKIRCx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Nov 2020 12:02:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729432AbgKIRCw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Nov 2020 12:02:52 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B95FCC0613CF
        for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2020 09:02:52 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id i26so7656774pgl.5
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2020 09:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=U08X1PpeHgPB6DiBMLe80sfCl9H6CeWMStVC4Xy15Tg=;
        b=gGz7c6jRtFi8TGt7oRxXFU0KkK7WqS6WeKlOkI8lKiAMucaFlzIyrremS7fn4flVW4
         O2ckHNRflryUow8dOAzLddobn/zp/s5JAxNlMxl0CHYsWAU5gO4UpbK6a8yJ9d4qkazE
         Mn02PVDNHtFc1LbqITn4TVAwVDXknhk6EI5tRt88A9RK7DaVwMleSDSybHXv8VUUjsIo
         iuuA5XDBUIW4GhlOxuRkijMX4WMzS+zYMZYfSpbjQnOR7SIfpaFiYWCsaOmire1vf8Ns
         X+O0rUI+ZPWfZ8/1UiimR9e8bHSrJzGvhoHkHCea+5Bg54Xb1idFXE1jnpnYeEL4Qybi
         fnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=U08X1PpeHgPB6DiBMLe80sfCl9H6CeWMStVC4Xy15Tg=;
        b=asM7jtiHLyBnLquz7NEh0zqgm27GHDMUiz0zmMbH9VmT+cT7U/Bu8MX+hvVWUXC7em
         hVqa4ciqHXe3I3JDfcgwjHShOFNCJOlgBBKtTkCthdwhIE+hw8ZTI2YS/c7sHvfpKzn3
         kIev6ATaNUnrIo1YQzkvmvJIb4QAbWhoSLimCgzuTHCYtd8QVmeuuhSBANzlPeCeGiY6
         UJWFHbChpUc6qsr3+uB10SxLVUgUDAk47Rm3jh1BDjOm+LSIPEhWZ3yIslwgWFGNsYZT
         ldgRRJ2q8jyKh/Jn/w7c3wUKpyutXxyVG+FmkZDdd8ldaDfuL6c8OsLq3AFDUIYX6cjx
         35gA==
X-Gm-Message-State: AOAM530/E4hhSveu9yTDmdLQJfR8zLXhYNw24RD0Cw/t4u4OFg4IBwPO
        +UmJl/uhN/vyrMivGpmHB+9p0/gWqMPKIN1OoqplhHiv7mTHSmIU
X-Google-Smtp-Source: ABdhPJyBE1/nuhztPuKrFdKgoxdMvN6XsSTEV0cyZ+86KcjuM0vv0CZ7w7V2YW3SAuaA5Ta5b4yFanjhXCtPP/5tBOM=
X-Received: by 2002:a65:5c4c:: with SMTP id v12mr13750803pgr.119.1604941372183;
 Mon, 09 Nov 2020 09:02:52 -0800 (PST)
MIME-Version: 1.0
References: <CAB31r6UbF_Q-APvfmxanvMZOYJZwr0eEPwMQ8EGWw3-VkJtHhQ@mail.gmail.com>
 <20201109112051.GL4062920@kuha.fi.intel.com> <dab0302c9156a845923ee7fbefad7dd4305eedb3.camel@redhat.com>
 <CAB31r6XWQqM-kLYm4vb8H=45grhuwsHDYT94y5QJZVtP8w_sXg@mail.gmail.com>
In-Reply-To: <CAB31r6XWQqM-kLYm4vb8H=45grhuwsHDYT94y5QJZVtP8w_sXg@mail.gmail.com>
From:   Vladimir Yerilov <openmindead@gmail.com>
Date:   Tue, 10 Nov 2020 03:02:40 +1000
Message-ID: <CAB31r6XpFRPkMcrU+os6VbkdNiQty+s8a_MWhZXY=cjK3yXvmw@mail.gmail.com>
Subject: Fwd: Power supply detection issue caused by ucsi_psy?
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000060d14f05b3af8841"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--00000000000060d14f05b3af8841
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Forwarding to y'all.

Just some extra info:
`cat /sys/class/power_supply/ucsi-source-psy-USBC000:001/online` shows
zero when the cable is unplugged, same for
`/sys/class/power_supply/ADP0/online` status, but that means nothing
for upower and all system services considering that there a power
source available and not setting display brightness and other
parameters due to that.
Checked in Ubuntu as well, same situation with their kernel 5.8.


---------- Forwarded message ---------
=D0=9E=D1=82: Vladimir Yerilov <openmindead@gmail.com>
Date: =D0=B2=D1=82, 10 =D0=BD=D0=BE=D1=8F=D0=B1. 2020 =D0=B3. =D0=B2 01:23
Subject: Re: Power supply detection issue caused by ucsi_psy?
To: Benjamin Berg <bberg@redhat.com>


Hi Benjamin and all,

Unfortunately, these patches had no effect on my side. The OS still
thinks there's some power source called
"/org/freedesktop/UPower/devices/line_power_ucsi_source_psy_USBC000o001"
when there's actually no cables attached.
I used 5.10-rc3 as base with your patches applied on top of it.

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



--
----
Best regards,
Vladimir Yerilov


--=20
----
Best regards,
Vladimir Yerilov

--00000000000060d14f05b3af8841
Content-Type: text/plain; charset="US-ASCII"; name="upower_5.10_bat.txt"
Content-Disposition: attachment; filename="upower_5.10_bat.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_khap1pfj0>
X-Attachment-Id: f_khap1pfj0

RGV2aWNlOiAvb3JnL2ZyZWVkZXNrdG9wL1VQb3dlci9kZXZpY2VzL2xpbmVfcG93ZXJfQURQMAog
IG5hdGl2ZS1wYXRoOiAgICAgICAgICBBRFAwCiAgcG93ZXIgc3VwcGx5OiAgICAgICAgIHllcwog
IHVwZGF0ZWQ6ICAgICAgICAgICAgICBUdWUgMTAgTm92IDIwMjAgMDE6MjA6NTggKzEwICg0MCBz
ZWNvbmRzIGFnbykKICBoYXMgaGlzdG9yeTogICAgICAgICAgbm8KICBoYXMgc3RhdGlzdGljczog
ICAgICAgbm8KICBsaW5lLXBvd2VyCiAgICB3YXJuaW5nLWxldmVsOiAgICAgICBub25lCiAgICBv
bmxpbmU6ICAgICAgICAgICAgICBubwogICAgaWNvbi1uYW1lOiAgICAgICAgICAnYWMtYWRhcHRl
ci1zeW1ib2xpYycKCkRldmljZTogL29yZy9mcmVlZGVza3RvcC9VUG93ZXIvZGV2aWNlcy9iYXR0
ZXJ5X0JBVDAKICBuYXRpdmUtcGF0aDogICAgICAgICAgQkFUMAogIHZlbmRvcjogICAgICAgICAg
ICAgICBTVU5XT0RBCiAgbW9kZWw6ICAgICAgICAgICAgICAgIFIxNUIwMVcKICBzZXJpYWw6ICAg
ICAgICAgICAgICAgQUNGQQogIHBvd2VyIHN1cHBseTogICAgICAgICB5ZXMKICB1cGRhdGVkOiAg
ICAgICAgICAgICAgVHVlIDEwIE5vdiAyMDIwIDAxOjIwOjU4ICsxMCAoNDAgc2Vjb25kcyBhZ28p
CiAgaGFzIGhpc3Rvcnk6ICAgICAgICAgIHllcwogIGhhcyBzdGF0aXN0aWNzOiAgICAgICB5ZXMK
ICBiYXR0ZXJ5CiAgICBwcmVzZW50OiAgICAgICAgICAgICB5ZXMKICAgIHJlY2hhcmdlYWJsZTog
ICAgICAgIHllcwogICAgc3RhdGU6ICAgICAgICAgICAgICAgZGlzY2hhcmdpbmcKICAgIHdhcm5p
bmctbGV2ZWw6ICAgICAgIG5vbmUKICAgIGVuZXJneTogICAgICAgICAgICAgIDQ2LjE5OCBXaAog
ICAgZW5lcmd5LWVtcHR5OiAgICAgICAgMCBXaAogICAgZW5lcmd5LWZ1bGw6ICAgICAgICAgNDYu
NjY0IFdoCiAgICBlbmVyZ3ktZnVsbC1kZXNpZ246ICA2MC4wNCBXaAogICAgZW5lcmd5LXJhdGU6
ICAgICAgICAgMi41IFcKICAgIHZvbHRhZ2U6ICAgICAgICAgICAgIDguMzYgVgogICAgdGltZSB0
byBlbXB0eTogICAgICAgMTguNSBob3VycwogICAgcGVyY2VudGFnZTogICAgICAgICAgOTklCiAg
ICBjYXBhY2l0eTogICAgICAgICAgICA3Ny43MjE1JQogICAgdGVjaG5vbG9neTogICAgICAgICAg
bGl0aGl1bS1pb24KICAgIGljb24tbmFtZTogICAgICAgICAgJ2JhdHRlcnktZnVsbC1zeW1ib2xp
YycKICBIaXN0b3J5IChjaGFyZ2UpOgogICAgMTYwNDkzNTI1OAk5OS4wMDAJZnVsbHktY2hhcmdl
ZAogIEhpc3RvcnkgKHJhdGUpOgogICAgMTYwNDkzNTI1OAkyLjUwMAlmdWxseS1jaGFyZ2VkCgpE
ZXZpY2U6IC9vcmcvZnJlZWRlc2t0b3AvVVBvd2VyL2RldmljZXMvbGluZV9wb3dlcl91Y3NpX3Nv
dXJjZV9wc3lfVVNCQzAwMG8wMDEKICBuYXRpdmUtcGF0aDogICAgICAgICAgdWNzaS1zb3VyY2Ut
cHN5LVVTQkMwMDA6MDAxCiAgcG93ZXIgc3VwcGx5OiAgICAgICAgIHllcwogIHVwZGF0ZWQ6ICAg
ICAgICAgICAgICBUdWUgMTAgTm92IDIwMjAgMDE6MTU6MTMgKzEwICgzODUgc2Vjb25kcyBhZ28p
CiAgaGFzIGhpc3Rvcnk6ICAgICAgICAgIG5vCiAgaGFzIHN0YXRpc3RpY3M6ICAgICAgIG5vCiAg
bGluZS1wb3dlcgogICAgd2FybmluZy1sZXZlbDogICAgICAgbm9uZQogICAgb25saW5lOiAgICAg
ICAgICAgICAgeWVzCiAgICBpY29uLW5hbWU6ICAgICAgICAgICdhYy1hZGFwdGVyLXN5bWJvbGlj
JwoKRGV2aWNlOiAvb3JnL2ZyZWVkZXNrdG9wL1VQb3dlci9kZXZpY2VzL0Rpc3BsYXlEZXZpY2UK
ICBwb3dlciBzdXBwbHk6ICAgICAgICAgeWVzCiAgdXBkYXRlZDogICAgICAgICAgICAgIFR1ZSAx
MCBOb3YgMjAyMCAwMToyMDo1OCArMTAgKDQwIHNlY29uZHMgYWdvKQogIGhhcyBoaXN0b3J5OiAg
ICAgICAgICBubwogIGhhcyBzdGF0aXN0aWNzOiAgICAgICBubwogIGJhdHRlcnkKICAgIHByZXNl
bnQ6ICAgICAgICAgICAgIHllcwogICAgc3RhdGU6ICAgICAgICAgICAgICAgZGlzY2hhcmdpbmcK
ICAgIHdhcm5pbmctbGV2ZWw6ICAgICAgIG5vbmUKICAgIGVuZXJneTogICAgICAgICAgICAgIDQ2
LjE5OCBXaAogICAgZW5lcmd5LWZ1bGw6ICAgICAgICAgNDYuNjY0IFdoCiAgICBlbmVyZ3ktcmF0
ZTogICAgICAgICAyLjUgVwogICAgdGltZSB0byBlbXB0eTogICAgICAgMTguNSBob3VycwogICAg
cGVyY2VudGFnZTogICAgICAgICAgOTklCiAgICBpY29uLW5hbWU6ICAgICAgICAgICdiYXR0ZXJ5
LWZ1bGwtc3ltYm9saWMnCgpEYWVtb246CiAgZGFlbW9uLXZlcnNpb246ICAwLjk5LjExCiAgb24t
YmF0dGVyeTogICAgICBubwogIGxpZC1pcy1jbG9zZWQ6ICAgbm8KICBsaWQtaXMtcHJlc2VudDog
IHllcwogIGNyaXRpY2FsLWFjdGlvbjogSHlicmlkU2xlZXAK
--00000000000060d14f05b3af8841--
