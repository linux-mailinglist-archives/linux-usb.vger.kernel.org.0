Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A13C8143C8D
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2020 13:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729417AbgAUMHc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jan 2020 07:07:32 -0500
Received: from mail-lj1-f174.google.com ([209.85.208.174]:39271 "EHLO
        mail-lj1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728655AbgAUMHc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jan 2020 07:07:32 -0500
Received: by mail-lj1-f174.google.com with SMTP id o11so2187881ljc.6
        for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2020 04:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=Wd97ApCMq9YnOpmEqy/zE4CSB9Sp+Pu4E0SRyEg0Dus=;
        b=k+rpjBddSANnldgzAM1z9pXNye/AL1v4FOkSLRmATIykm63cdh/K0AtMqiGJYbisgy
         e9OsbLcpljfv3/vV7J6ZeNvfopPynFtJUrvcbWWO0+2x+1cPplCHF4B19g9YhBeNI85y
         6a8y4tqnHx/Kzr/CPoWiyQjsO19BYBtR8n32wbfjf1r3yJMdhOA6DNocvfu1yg7d1SHa
         PU/8ldnr1OAVelQJXLSwBG9FK1++WQpERAPINAgB2gXy85aFI+C1h3jjth0jJiR/mqkd
         ZaEn7b+DaPhClAeZrwf8A60qHK8miSULeSc19Pg7Bvo/4S8SgoP13IcqdkVHJSnwRyHt
         vejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=Wd97ApCMq9YnOpmEqy/zE4CSB9Sp+Pu4E0SRyEg0Dus=;
        b=Vv+5IVEkz9peY/C2Lr4YHFm0L2KRcQTotvIonzA3vzeFpgoil+qDzAR+eIA0poTl/T
         Aw80PbdXhLLSSLdKOsvz5dilatC2AgrVDhMe8nP789sqo7Rsa8P43mjnCjFAJZpIAg3e
         FVf7V6mJkRImLgfEY6z5FTrAsCNbx27gtGUM4BTE6NbELWIn3ZEghEaANXzZVOHACMQH
         RCitT3NRfOg8+SMAyfr0OSZYY16Fb/nEhIciUG2gqUsbidWdNRXGfcjzlyeTRo6TRg8/
         k5f3Jt7niWX7USKpclMfTuMjSDqJxXVcuxfGUBK+r0oKUFzWgg29eC5612aS1f00F15P
         SvnA==
X-Gm-Message-State: APjAAAV193riZ+2eMBOuBf0c1oyu4kOP3IxIDMzXISFBFwybg1GcXKzS
        kO3ByKWAfv/hVF7rZxnm7eIYHCSM
X-Google-Smtp-Source: APXvYqwMfVcKIU7Hyy78n1SQLppL11jXSEFhMO1WsZtemc33QJOr+3XOgoOjtlxqTEQjTrk9fiHp7A==
X-Received: by 2002:a2e:b4e7:: with SMTP id s7mr16619649ljm.58.1579608449732;
        Tue, 21 Jan 2020 04:07:29 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id q24sm4718083lfm.78.2020.01.21.04.07.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2020 04:07:28 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: No message is showed after USB gadget has configured
In-Reply-To: <VI1PR04MB53273947E7B3DE9949DBB94D8B0D0@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20200120090357.GB19938@b29397-desktop> <20200120092934.GA382520@kroah.com> <VI1PR04MB53272657D56EE193CEB29CC68B320@VI1PR04MB5327.eurprd04.prod.outlook.com> <20200120104801.GA421434@kroah.com> <VI1PR04MB53273947E7B3DE9949DBB94D8B0D0@VI1PR04MB5327.eurprd04.prod.outlook.com>
Date:   Tue, 21 Jan 2020 14:08:20 +0200
Message-ID: <8736c957wr.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Peter Chen <peter.chen@nxp.com> writes:
>> On Mon, Jan 20, 2020 at 09:48:24AM +0000, Peter Chen wrote:
>> >
>> > > On Mon, Jan 20, 2020 at 09:03:59AM +0000, Peter Chen wrote:
>> > > > Hi all,
>> > > >
>> > > > >From commit 1cbfb8c4f62d ("usb: gadget: Quieten gadget config
>> > > > >message"),
>> > > > there is no any message from gadget side after it connects to host
>> > > > and works correctly. Although we could cat "state" under
>> > > > /sys/class/udc/$CONTROLLER/ to know its state, we can't easily
>> > > > know if the gadget works or not from console, USB host could have
>> > > > many messages after one device has connected, why we can't keep
>> > > > one for USB gadget?
>> > >
>> > > Why not make "normal" USB devices quieter too? :)
>> > >
>> > > Surely you do not have tools that watch syslog to determine if a
>> > > device is working properly or not, right?  That's what sysfs is for,=
 not syslog
>> entries.
>> > >
>> >
>> > Yes, we use our eyes during the hot plug test for device or count the
>> > number of messages for it, with this change, it may cause difficult
>> > for hot plug test. For other tests, we could judge sysfs before later =
tests.
>> >
>> > Since this message in there many years, we (and tester) may need time
>> > to adapt for this change.
>>=20
>> Can you just turn on dynamic debugging for that one line with a simple e=
cho to the
>> debugfs file so that you still see this in your test framework?
>=20=20
> No, most released kernel or end user's kernel doesn't enable dynamic debu=
g.
> In fact, we use this message in formal release product to quick judge if =
the
> device function is ok, not just in development periods.

While I agree that dynamic debug is usually disabled, almost 100% of all
product kernels have sysfs enabled. The only exception I know of is
Microsoft Azure Sphere (downloadable from
https://3rdpartysource.microsoft.com/), but that doesn't support USB
anyway.

It should be very easy to figure out if a new device was attached and is
working, no?

From=20a peripheral stack point of view, at least dwc3 prints *nothing*
unless there's an error. And that's okay since I only want to see
messages if I get an error condition or a bug report, which case I'll
enable trace events.

I agree with Greg here, we should actually make Host stack quieter too,
including HCD drivers.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4m6bUACgkQzL64meEa
mQZT9xAAvAS1VwG1xsmszRnPYWwdsdSvexIcwPVJOoZTR0RUrPwgdngBhuSwkP/c
B1/M8orkiA946Dd96CrMNao1NX2VY5c2VwSrf6yCBseSCrRBI6mOTvZ1db6paBlF
E9n/Bvz2jtYyWeoru16VX5i7TzB4RuHtf+4jIczd54+VJlaV18OocLTMmkrsZUs1
q7m5j+e++9GJLkR8mFkHOMjIe38JVs/DQvCbGPKsVfzJSFuXMRsiNTTicF4EHmsI
5ScJW42gTjv7xNxJHpeByE9XHbd/Q1aDYSukhggtcQ/3WWaoXUhwqXVslZ9+ff4E
j0vf7yawIFISztUYR90nghC2Ray/fW75shAxZzIiyyFWONs9foknw7tjtTMT87rk
3k1RshDZOaeYwFnvAmmZhz+5IEYj0tTHBn63Y3jX4t1XTnvhpU5LHO72UuDnaBYy
+fTuXFuvBsaAKzCSkrJIq4oswYFCYCz7gozSq03TzAPQfeN52tmWzKktIUFijT8u
pzyaokXvdN3/mfqjq6uKMm5OgrsFRQ1VC9HvSr27AqczYRlPJNb24BMWYk5VE6jZ
CoWjhyqpxgX1EDkffn2rvwA9xD9Qa5aQLWfOW+COR9dZyhu8E5jFvJTLXjgh5gd0
/dd4VGRcPpOIkD+ZtYDVdPM/FQBX9l/wBQfpDisoUBVuV/hpl1E=
=Z2c5
-----END PGP SIGNATURE-----
--=-=-=--
