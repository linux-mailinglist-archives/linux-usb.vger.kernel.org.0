Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61CE42AB73C
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 12:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729724AbgKILgv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Nov 2020 06:36:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46971 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729956AbgKILgu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Nov 2020 06:36:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604921808;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=AG/JjvSWgiu1h7jtGSppsn7bH14OQ5r5mGepNHuPYlM=;
        b=a9lYtaz/qeQj4wa1yWUqIoXzD4QB4GP+wQ4W+HB2xp32CcLyZNW2JGgh17fQmFJ6czIfIQ
        l7CMxb0nbLiemJW1tykDvLmx9gq7KB3/toDAdQv6yoGftScvrbxlladEnoR6srMhh3AblQ
        5sOUU7nOBa4djigZJdYAn2rXMw/iYEA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-k_j2T0mnMeuesdEtzjerlg-1; Mon, 09 Nov 2020 06:36:46 -0500
X-MC-Unique: k_j2T0mnMeuesdEtzjerlg-1
Received: by mail-wm1-f72.google.com with SMTP id 3so1860332wms.9
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2020 03:36:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=AG/JjvSWgiu1h7jtGSppsn7bH14OQ5r5mGepNHuPYlM=;
        b=JtJOJSvbatcD09MQjJ1zDCF3ce1dTf5XqOZP+IyiohD0ssSBWkKwHiu2o35dgYsk3X
         EZtEd/X0QqS1ojfrBBFmM8GxPfscnlYCnB9rfIiMHnQggg+xKpTPwwris79gHkt6RfnA
         S6qUUrs4DHHmbzE0rPfFkUJduzyAE/LI0z0AegNWsd43+FPBUVOriMVLPtcG132vwOuZ
         tlssojqJx9DSANgE9YuumWdQlrvxdBroZEadPJXsby8GlsCSqpgWbcuxkTof1LyxfTR5
         WPTOMGjXG+jFnhcaMWSf/eQ5bY5QbDRVRE8CARKGUkPsQQLbYRVnjSJrnAoVYXSsYng8
         Q7Nw==
X-Gm-Message-State: AOAM533pHlsnRIfrt8OarreYnw1MBWNU+78uQUChQNl/ncHDQ0Qkxm1w
        KQj70Yp5bubrvVfMu9FHMZ0YAYfHC/vNLMR93qCc/UWJlQV+k/tdVP5R/82Q1jVGmXGDg77w8Tw
        zfjxGj0eSmhawHqDNd4Nm
X-Received: by 2002:a7b:c5c6:: with SMTP id n6mr14605037wmk.131.1604921804311;
        Mon, 09 Nov 2020 03:36:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuHkN9Mews4C//dvt0qEqmwvO0MbyvgtCZR8bErvr9AmidoANtwldJXyOv5SFWrge6eGxNwA==
X-Received: by 2002:a7b:c5c6:: with SMTP id n6mr14605016wmk.131.1604921804111;
        Mon, 09 Nov 2020 03:36:44 -0800 (PST)
Received: from ben-x1c7.lan (200116b826c04af00000000000000185.dip.versatel-1u1.de. [2001:16b8:26c0:4af0::185])
        by smtp.gmail.com with ESMTPSA id w21sm11681830wmi.29.2020.11.09.03.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 03:36:43 -0800 (PST)
Message-ID: <dab0302c9156a845923ee7fbefad7dd4305eedb3.camel@redhat.com>
Subject: Re: Power supply detection issue caused by ucsi_psy?
From:   Benjamin Berg <bberg@redhat.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Vladimir Yerilov <openmindead@gmail.com>
Cc:     linux-usb@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Date:   Mon, 09 Nov 2020 12:36:37 +0100
In-Reply-To: <20201109112051.GL4062920@kuha.fi.intel.com>
References: <CAB31r6UbF_Q-APvfmxanvMZOYJZwr0eEPwMQ8EGWw3-VkJtHhQ@mail.gmail.com>
         <20201109112051.GL4062920@kuha.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-gTP5k6aZYaMsYU89R2j8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-gTP5k6aZYaMsYU89R2j8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 2020-11-09 at 13:20 +0200, Heikki Krogerus wrote:
> On Mon, Nov 09, 2020 at 08:48:06PM +1000, Vladimir Yerilov wrote:
> > Since linux 5.8 I'm experiencing a problem related to power source
> > detection on my laptop. My machine is equipped with 2 typec ports, one
> > of them has power delivery and is used for charging, another one has
> > only data transfer capability. The issue is, when I unplug the power
> > cable, the OS is reporting something like "Battery at 100%, plugged in
> > but still discharging" (KDE Plasma notification) - whether another
> > port is used or not. I checked with upower, you can see the output for
> > kernel 5.4 and 5.10 attached. In brief, on 5.8 onwards I have some
> > "line_power_ucsi_source_psy_USBC000o001" device which is considered a
> > power supply and that prevents OS to switch to "battery mode" when
> > unplugging the cable, instead it thinks there's a power source but not
> > powerful enough to charge the battery, upower says this: "on-battery:
> >     no", but actually no ac power source is connected.
> > I did some research with git bisect up to the merge commit
> > `e611c0fe318c6d6827ee2bba660fbc23cf73f7dc` ("Merge tag 'usb-5.8-rc1'
> > of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb"), and
> > looked through its content. My wild guess based on upower output is
> > that a new driver introduced there, /drivers/usb/typec/ucsi/psy.c, is
> > responsible for this wrong behavior.
> >=20
> > Could you please look into that based on info I'm providing?
> > Thank you!
>=20
> This sounds a bit like the issue that was reported and fixed here:
> https://lore.kernel.org/lkml/20201009144047.505957-1-benjamin@sipsolution=
s.net/

I agree, sounds very much like the issue I was seeing.

What machine/model are you seeing this on? The PPM is implemented in
Firmware, so the behaviour will depend on the Vendor or even model. I
observed it on a Lenovo laptop, but would be curious to know if similar
issues happen elsewhere.

I only observed an issue when using a thunderbolt dock and not with a
plain USB-C charger.

> Can you try the two patches from that series?

Yeah, that would be a good data point.

Benjamin

> +Bejamin, who prepared those patches.
>=20
> > Device: /org/freedesktop/UPower/devices/line_power_ADP0
> >   native-path:          ADP0
> >   power supply:         yes
> >   updated:              Sun 08 Nov 2020 15:27:39 +10 (97 seconds
> > ago)
> >   has history:          no
> >   has statistics:       no
> >   line-power
> >     warning-level:       none
> >     online:              yes
> >     icon-name:          'ac-adapter-symbolic'
> >=20
> > Device: /org/freedesktop/UPower/devices/battery_BAT0
> >   native-path:          BAT0
> >   vendor:               SUNWODA
> >   model:                R15B01W
> >   serial:               ACFA
> >   power supply:         yes
> >   updated:              Sun 08 Nov 2020 15:27:39 +10 (97 seconds
> > ago)
> >   has history:          yes
> >   has statistics:       yes
> >   battery
> >     present:             yes
> >     rechargeable:        yes
> >     state:               charging
> >     warning-level:       none
> >     energy:              46.198 Wh
> >     energy-empty:        0 Wh
> >     energy-full:         46.664 Wh
> >     energy-full-design:  60.04 Wh
> >     energy-rate:         2.059 W
> >     voltage:             8.672 V
> >     time to full:        13.6 minutes
> >     percentage:          99%
> >     capacity:            77.7215%
> >     technology:          lithium-ion
> >     icon-name:          'battery-full-charging-symbolic'
> >   History (charge):
> >     1604813259	0.000	unknown
> >   History (rate):
> >     1604813259	0.000	unknown
> >=20
> > Device:
> > /org/freedesktop/UPower/devices/line_power_ucsi_source_psy_USBC000o
> > 001
> >   native-path:          ucsi-source-psy-USBC000:001
> >   power supply:         yes
> >   updated:              Sun 08 Nov 2020 15:27:39 +10 (97 seconds
> > ago)
> >   has history:          no
> >   has statistics:       no
> >   line-power
> >     warning-level:       none
> >     online:              yes
> >     icon-name:          'ac-adapter-symbolic'
> >=20
> > Device: /org/freedesktop/UPower/devices/DisplayDevice
> >   power supply:         yes
> >   updated:              Sun 08 Nov 2020 15:27:39 +10 (97 seconds
> > ago)
> >   has history:          no
> >   has statistics:       no
> >   battery
> >     present:             yes
> >     state:               charging
> >     warning-level:       none
> >     energy:              46.198 Wh
> >     energy-full:         46.664 Wh
> >     energy-rate:         2.059 W
> >     time to full:        13.6 minutes
> >     percentage:          99%
> >     icon-name:          'battery-full-charging-symbolic'
> >=20
> > Daemon:
> >   daemon-version:  0.99.11
> >   on-battery:      no
> >   lid-is-closed:   no
> >   lid-is-present:  yes
> >   critical-action: HybridSleep
> > Device: /org/freedesktop/UPower/devices/line_power_ADP0
> >   native-path:          ADP0
> >   power supply:         yes
> >   updated:              Sun 08 Nov 2020 15:29:25 +10 (18 seconds
> > ago)
> >   has history:          no
> >   has statistics:       no
> >   line-power
> >     warning-level:       none
> >     online:              no
> >     icon-name:          'ac-adapter-symbolic'
> >=20
> > Device: /org/freedesktop/UPower/devices/battery_BAT0
> >   native-path:          BAT0
> >   vendor:               SUNWODA
> >   model:                R15B01W
> >   serial:               ACFA
> >   power supply:         yes
> >   updated:              Sun 08 Nov 2020 15:29:25 +10 (18 seconds
> > ago)
> >   has history:          yes
> >   has statistics:       yes
> >   battery
> >     present:             yes
> >     rechargeable:        yes
> >     state:               discharging
> >     warning-level:       none
> >     energy:              46.198 Wh
> >     energy-empty:        0 Wh
> >     energy-full:         46.664 Wh
> >     energy-full-design:  60.04 Wh
> >     energy-rate:         1.998 W
> >     voltage:             8.44 V
> >     time to empty:       23.1 hours
> >     percentage:          99%
> >     capacity:            77.7215%
> >     technology:          lithium-ion
> >     icon-name:          'battery-full-symbolic'
> >   History (charge):
> >     1604813365	99.000	charging
> >   History (rate):
> >     1604813365	1.998	charging
> >=20
> > Device:
> > /org/freedesktop/UPower/devices/line_power_ucsi_source_psy_USBC000o
> > 001
> >   native-path:          ucsi-source-psy-USBC000:001
> >   power supply:         yes
> >   updated:              Sun 08 Nov 2020 15:27:39 +10 (124 seconds
> > ago)
> >   has history:          no
> >   has statistics:       no
> >   line-power
> >     warning-level:       none
> >     online:              yes
> >     icon-name:          'ac-adapter-symbolic'
> >=20
> > Device: /org/freedesktop/UPower/devices/DisplayDevice
> >   power supply:         yes
> >   updated:              Sun 08 Nov 2020 15:29:25 +10 (18 seconds
> > ago)
> >   has history:          no
> >   has statistics:       no
> >   battery
> >     present:             yes
> >     state:               discharging
> >     warning-level:       none
> >     energy:              46.198 Wh
> >     energy-full:         46.664 Wh
> >     energy-rate:         1.998 W
> >     time to empty:       23.1 hours
> >     percentage:          99%
> >     icon-name:          'battery-full-symbolic'
> >=20
> > Daemon:
> >   daemon-version:  0.99.11
> >   on-battery:      no
> >   lid-is-closed:   no
> >   lid-is-present:  yes
> >   critical-action: HybridSleep
> >=20
>=20
> thanks,
>=20

--=-gTP5k6aZYaMsYU89R2j8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEED2NO4vMS33W8E4AFq6ZWhpmFY3AFAl+pKcYACgkQq6ZWhpmF
Y3BuKA//SlzFa17C0tRLUkq6ZzEdkxGeovyasUowHJtCwQvVg6fJAJERfusnHVz+
qBjaTY1fZ6Nsue9OghK1rBqJGOLqz02RLQ7BffhzkMfkKYql11Z1E0cz9ZAoaQBN
SVOA4IM7BH+wX5+w4JJq7fh+aOtirpBSIO8myB25WqrBtZ9KByPP1/bDB6s9tYZg
+0D2pTyRfXNI/71GKGC3YsL6YeoNxJNQ2Ok+rkShAD+zg/8o215FXCCnMQj7t7s4
4d2VnMd0g867YuM5B6s6CMVcPmADTzqs2lsgRVXHaZpneoztOiTKt9IRIyOWznct
DeLiAxwQsGu2D89Ms0kx4GVRztrU8wXglHjJFoI+z7Zd1aYKZmfKTqTy6w1bbOn2
/dYurmdLACsAd0ThJVOMp4ou07xGWm5cwNPXw6A4k1Tp7XpG6XR3wwnCKdqiEHi1
RSQZ2wT5/73cCy+PU/f/aegjhESfMPrwu6l3WD8mFALCMNAGs8k+OeTZpz4qgpaw
LtrJoTL/OJqOhP+EonGWZr7FV4vrsSRGTUg+RODH8GTJLWWsmwOi4faxGyDiImjC
C/zAJyOKEpjM83+L/TtP20pTPjX9+N4sUuSI0/NXTRnS/u67d+aC6fRad7Y2s82F
Bpg+oWa+jnIZslXnQLiYUSypoPIW9x7EN8wnUuGDDyPGAtXVvHo=
=6TyA
-----END PGP SIGNATURE-----

--=-gTP5k6aZYaMsYU89R2j8--

