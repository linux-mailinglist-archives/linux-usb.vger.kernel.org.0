Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E048E29DED6
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 01:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgJ2A4u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Oct 2020 20:56:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:60510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731632AbgJ1WRg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:36 -0400
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F102824198;
        Wed, 28 Oct 2020 09:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603876689;
        bh=5/QVRctLr+h1zemQtxbN0N6j6IsxOIoAxnQpXPdLGZc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Tmh6YTH61muPM2qWbAojELJ2xPMG+QFoLG3epgPsUHogqSAhC7S5dbGasslsdwXqF
         Zx9akCyKmEw7OnTeuuraIhSkrynUaRNUxthjPpVpf8UctNdXgHjDtpkZPSdeeWUm79
         5sGkZRf9/ir/2/R9SOCC9nq20fwgg1ETUecvHOtg=
From:   Felipe Balbi <balbi@kernel.org>
To:     Ferry Toth <fntoth@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Jack Pham <jackp@codeaurora.org>
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
In-Reply-To: <30ab00e4-53ae-fd9e-1689-c94078a31625@gmail.com>
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
 <87a6wig461.fsf@kernel.org>
 <a565dc52-27ab-f5be-4fee-5a8f96d66456@gmail.com>
 <874kmpf583.fsf@kernel.org>
 <d0aca346-353c-d74e-6f00-ccd2a4ed26ef@gmail.com>
 <976cea12-e54e-fbca-6c53-e6ef5c554094@synopsys.com>
 <645b6ddc-d4f5-3f5b-b85f-b3d27fc365f5@synopsys.com>
 <2b6586e6-528c-86e8-9d92-0061bc44866d@gmail.com>
 <aad327a8-95bc-40ec-abf7-ad216a02fad0@synopsys.com>
 <2cc783ac-6b71-190b-49fc-9e2bceeacd4b@gmail.com>
 <920590dc-5430-7f8b-b2e1-1a4c37f4dfbe@synopsys.com>
 <CAHp75Vfs9AoOYSVGTpw30h11ptPOSPNf1AsWBKdiVrDL=9X3PQ@mail.gmail.com>
 <0089306e-e2ca-9a53-6ffb-202d028050ce@gmail.com>
 <CAHp75Vc0P746FhhohJ=wRccsQL4ewn+AECMw3yTD6cuGxHCG9Q@mail.gmail.com>
 <30ab00e4-53ae-fd9e-1689-c94078a31625@gmail.com>
Date:   Wed, 28 Oct 2020 11:18:02 +0200
Message-ID: <871rhin1yt.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Ferry Toth <fntoth@gmail.com> writes:
> Op 27-10-2020 om 22:16 schreef Andy Shevchenko:
>> On Tue, Oct 27, 2020 at 10:13 PM Ferry Toth <fntoth@gmail.com> wrote:
>>> Op 22-10-2020 om 15:43 schreef Andy Shevchenko:
>>>> On Thu, Oct 22, 2020 at 4:21 PM Thinh Nguyen <Thinh.Nguyen@synopsys.co=
m> wrote:
>>>>> Ferry Toth wrote:
>> ...
>>
>>>>> There are some fixes to dwc3 in kernel mainline. Is it possible to te=
st
>>>>> this against linux-next?
>>>> I think the best is to wait for v5.10-rc1 and retest.
>> Can you give a try of v5.10-rc1?
>
> Yes, I just tried:
>
> I booted in host mode, then flip the switch. Gadget come up, go down=20
> once, then come up again and stay up.

please collect trace events. It's important to figure out why it's going
down, even if only once. Make sure to collect trace *and* dmesg so we
can correlate trace with the reenumeration that should show up in dmesg.

thanks

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl+ZN0oRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZXhg/9EBxzFRUCm/PWBDYXkBGLjiKBX5ymHKi+
P2zZIcU5aM4EkSfv/yPqwkA0bz0U+cFJpJ/Vkpjm5zJoWauBrpiSWm2wsPW5dL3C
gSfNVFqKCBFkG7BMLyWeBvza9LAu3ph0FGJoQbeV3uWjDB1glHqZUi9u5QHp1wbC
HADulfbIlytYly60BVZ/tRu+WDcQP6+qkTEyt81ln2FLdl8aIk2CZxtqOilWXkL6
KrHauD9z7tHeUoTnywSTTPDBz+A9zjJMfWXS/C7JUjx4CETvupzTrxG9fewnsdNf
Dnp16RA33tcpa22pigVD8ruPFESIXLt0LSSTqRniH0llZIhXg2dPgQoonFy2JuRe
VjtzKTO2czT9Pwxhh/XpPLCG/Nd1hs/ELrd4tT6jzAW4QKJ299t/CKPmKJecK2bT
RmTt3pmjk3CI8Re6BKWqZbAyrUElud9vYdVRkkVxb/ynhNN+OjX2F0L7Jf9iON9Z
roXXvVyKnj/+N3YysCQ+sr8UEFscSGBwmYZc5RCGcSK3xIuiMiSd4/W15MDboP91
UZn9dlPV83iNMLv0qFK/wamSDy+Ti+EN2hR+lb/90GSKgfKOmk0QrrsH4/vSJHVe
t/OF645FTKg7cKxBk0umVOY7z/lnFZvhl21BcBz21LaEgaqLt1HWjqge5qXF56wy
yO27zSwEOvM=
=ccgp
-----END PGP SIGNATURE-----
--=-=-=--
