Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1F736A947
	for <lists+linux-usb@lfdr.de>; Sun, 25 Apr 2021 22:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbhDYUx5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Apr 2021 16:53:57 -0400
Received: from mx.exactcode.de ([144.76.154.42]:45638 "EHLO mx.exactcode.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231318AbhDYUxw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 25 Apr 2021 16:53:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de; s=x;
        h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:Content-Type; bh=OUL/CalyBcMSfR8f+GSsyGkvIPqUdS0mhRF0+NxvX9s=;
        b=K82egPiq4xKDxyB4OyWA0Cri/NBeSNtJAyNjwNPyxvj8bdJIcLy2B9QTNatrvj3Vnq9Ypm8ymCluwZdgIIK4CmpXdZv7ax8DVraPlQbkV765M3RJk24StOpj5DfgPmqGfC9RtkqSzq1I+YwPR3Mgv3n3RbxnBs3HphhfJr6u1UM=;
Received: from exactco.de ([90.187.5.221])
        by mx.exactcode.de with esmtp (Exim 4.82)
        (envelope-from <rene@exactcode.com>)
        id 1lalki-0004oU-UU; Sun, 25 Apr 2021 20:53:17 +0000
Received: from ip5f5bd0cf.dynamic.kabel-deutschland.de ([95.91.208.207] helo=[192.168.0.14])
        by exactco.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.86_2)
        (envelope-from <rene@exactcode.com>)
        id 1lalgz-0000dC-1j; Sun, 25 Apr 2021 20:49:30 +0000
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through for SMART
From:   =?utf-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.com>
In-Reply-To: <0e698ca2-06e6-6ee7-1c39-a4352207a40e@redhat.com>
Date:   Sun, 25 Apr 2021 22:52:25 +0200
Cc:     Alan Stern <stern@rowland.harvard.edu>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Content-Transfer-Encoding: quoted-printable
Message-Id: <83FED4AF-2078-43BA-95A8-1EB44C13329D@exactcode.com>
References: <YIVZ2l9qUfkcyPpG@kroah.com>
 <20210425.141536.1295354861910527121.rene@exactcode.com>
 <20210425144531.GA336783@rowland.harvard.edu>
 <20210425.170224.894337589208455353.rene@exactcode.com>
 <0e698ca2-06e6-6ee7-1c39-a4352207a40e@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-Spam-Score: -0.5 (/)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

> On 25. Apr 2021, at 20:25, Hans de Goede <hdegoede@redhat.com> wrote:
>=20
> Hi Rene,
>=20
> On 4/25/21 5:02 PM, Rene Rebe wrote:
>> Alan Stern <stern@rowland.harvard.edu> wrote:
>>=20
>>> On Sun, Apr 25, 2021 at 02:15:36PM +0200, Rene Rebe wrote:
>>>> From: Greg KH <gregkh@linuxfoundation.org>
>>>> Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through =
for SMART
>>>> Date: Sun, 25 Apr 2021 14:00:26 +0200
>>>>=20
>>>>>> I would expect that more modern devices to work. Vendors usually
>>>>>> linearly allocate their product ids for new devices, and we could
>>>>>> allow list product ids higher than this Seven to unbreak more =
modern
>>>>>> devices by default and limit the amount of device quirks needed?
>>>>>=20
>>>>> Vendors do not allocate device ids that way at all, as there is no
>>>>> requirement to do so.  I know of many vendors that seemingly use =
random
>>>>> values from their product id space, so there is no guarantee that =
this
>>>>> will work, sorry.
>>>>=20
>>>> I did not say it is a requirement, just that they usually do =
speaking
>>>> of just this Seagate case. What is wrong with using that to
>>>> potentially significantly cut down the quirk list?
>>>=20
>>> You didn't read commit 92335ad9e895, did you?  It lists a large =
number=20
>>> of Seagate devices that don't work with ATA pass-through, and three =
of=20
>>> them have product IDs that are larger than 0xab03.
>>>=20
>>> Please check the facts before guessing about things that will cause=20=

>>> problems for other people.
>>=20
>> I really don't appreciate the unfriendly tone on the linux kernel
>> mailing lists (which is why for 20 years I never felt like =
contributing
>> here mo),
>=20
> I'm sorry to hear that the admittently sometimes unfriendly tone
> on the kernel mailinglists have stopped you from contributing.
>=20
> Note that I do believe that things have gotten better recently.
>=20
> As for this email-thread, I don't really see anything wrong with
> Alan's reply here. You have been quite argumentative in this entire
> thread about how things would be much better if they are done your
> way.
>=20
> I cannot speak for the others but I certainly have gotten annoyed by
> the tone of your emails so far, I apologize if any of that annoyance
> has bleed through in the tone of my emails. I do strive to always
> stay professional (but as all of us I'm only human).
>=20
> <snip>
>=20
>>>>> What is wrong with just allowing specific devices that you have =
tested
>>>>> will work, to the list instead?  That's the safest way to handle =
this.
>>>>=20
>>>> The problem is that out of the box it does not work for users, and
>>>> normal users do not dive into the kernel code to find out and =
simply
>>>> think their devices sucks. Even I for years thought the drive =
sucks,
>>>> before I took a closer look. If you long term want more new devices =
in
>>>> an allow list than the previous quirk list included (9 or 10 does =
not
>>>> sound that many to me), ... whatever you prefer ,-) I would rather
>>>> have 10 quirk disable list than potential many more white listed =
the
>>>> next years to come. Maybe we shoudl simply restore the prevoius
>>>> quirks.
>>>=20
>>> That's a possibility, and in the future we may do it.  But probably =
not=20
>>> until the enable list grows to a comparable length.
>>=20
>> Yeah, why future proof it now, ...
>=20
> Perhaps look in the mirror and start with improving the tone of your
> own emails ?

Thanks, I re-read them and find them pretty ok.

>> which is exactly what brought us
>> here from the original regression. The enable list will likely not
>> grow quickly as most users will just expect a broken device hw/
>> firmware and not bother looking into it and instead live w/o SMART.
>=20
> Right because people can happily live without SMART most users won't
> even know they're missing some optional functionality. Non working =
disks
> OTOH will lead to bug reports, bug reports of which Alan, Greg and I
> will be on the receiving end.
>=20
> Moreover the kernel has a very strong no regressions policy, and what
> you suggest would almost certainly break stuff for some of our users,
> so we can simply not do as you suggest.
>=20
> I notice that you call the lack of SMART support on your own disk
> a regression, but that has never worked with any recent kernel
> (due to the discussed code which has been present since 2017) so
> from the no-regressions kernel policy pov that is not a regression.

Well, it was working before, and does not since the quoted commit.
I call that a regression. Weather that was recently or some years
ago does not change the definition of regression IMHO.

On further internet searching that there are at least 4 more drivers
listed on the smartmontools page that should work:

	https://www.smartmontools.org/wiki/Supported_USB-Devices

Plus a dedicated page about this change and devices stopped working:

	https://www.smartmontools.org/wiki/SAT-with-UAS-Linux

Given this, I will not continue spending my time on implementing
what you suggested and instead simply reverted this for our Linux
SDE as I believe results in the best out of the box experience
for our users:

	=
https://svn.exactcode.de/t2/trunk/package/base/linux/uas-seagate.patch

Have a great day,
	Ren=C3=A9 Rebe

--=20
 ExactCODE GmbH, Lietzenburger Str. 42, DE-10789 Berlin, =
https://exactcode.com
 https://exactscan.com | https://ocrkit.com | https://t2sde.org | =
https://rene.rebe.de

