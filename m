Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF5BF36B545
	for <lists+linux-usb@lfdr.de>; Mon, 26 Apr 2021 16:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233755AbhDZOz2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Apr 2021 10:55:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:57904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233573AbhDZOz1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Apr 2021 10:55:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9EBC361166;
        Mon, 26 Apr 2021 14:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619448885;
        bh=b6zxemCzbZmVqmi3vVJAX30+n06g+c+Wmy8LKkFxnzI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=d4SmWadOGOMyijJJnUUN6Lco6a3oVMObFaMdrkgUHWwMB0Yi+fd3HL9EMVpK7b4Ox
         PQPUnp4zKDII3GavwBaTg2TvpeO50WAWFxRh5kxKNn0bsZWbuo+6QSyfZ4SgrqX9Vq
         jIFOlao5Cbu7nY9gSqywLxAfeM2dlWXX0YUaap5oxyTx4uzrxHy3X6kAKlLvUC/fWG
         Eyr362uHogMEEcG+cg07e8Vd/hI+aSdgVggpMZ8fnMl7GzGJRLWu+jfBizEFEYYpcn
         BXIlSGvQxYqM9GZxJdOZIiGgK720610jtoT6PJI7l7ihvqJH3xbfzAtdO5DMrPjc+G
         xgJYsyBVFv46g==
From:   Felipe Balbi <balbi@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Pawel Laszczak <pawell@cadence.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "ruslan.bilovol@gmail.com" <ruslan.bilovol@gmail.com>,
        "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Rahul Kumar <kurahul@cadence.com>,
        "peter.chen@kernel.org" <peter.chen@kernel.org>
Subject: Re: [PATCH v2 1/2] usb: gadget: f_uac2: Stop endpoint before
 enabling it.
In-Reply-To: <20210426145047.GB365717@rowland.harvard.edu>
References: <20210426044815.5393-1-pawell@gli-login.cadence.com>
 <878s55l50t.fsf@kernel.org>
 <BYAPR07MB53814E672CF41548418248C1DD429@BYAPR07MB5381.namprd07.prod.outlook.com>
 <8735vdky1t.fsf@kernel.org> <20210426145047.GB365717@rowland.harvard.edu>
Date:   Mon, 26 Apr 2021 17:54:37 +0300
Message-ID: <87zgxljdua.fsf@kernel.org>
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

Alan Stern <stern@rowland.harvard.edu> writes:
> On Mon, Apr 26, 2021 at 03:52:46PM +0300, Felipe Balbi wrote:
>> yeah, this is a requirement by the spec, IIRC. A SetAlt to the same
>> interface/altSetting means the host wants to reset that altSetting. From
>> the peripheral point of view that means disabling the endpoints and
>> reenabling them.
>>=20
>> I'm just not entirely sure if we should do this in u_audio or
>> f_uac[12].c. Arguably, composite.c could detect this and disable the
>> altSetting, but that would require a huge refactor on the framework.
>>=20
>> My gut feeling is that for the minimal bug fix, we should patch
>> f_uac[12].c, but all audio function drivers have the same exact bug, so
>> I don't know.
>>=20
>> If we follow the "standard" of patching the relevant set_alt functions
>> in the function drivers, the moment we decide to go for a refactoring,
>> it'll be easier to see common constructs.
>
> FWIW, f_mass_storage.c handles this in its do_set_interface() routine.=20=
=20
> That routine first deallocates any related request buffers and disables=20
> any enabled endpoints in the interface.  It then goes on to enable=20
> endpoints for the new alternate setting and allocate request buffers.
>
> The audio function drivers could follow this approach.

right, that's what all other drivers do, in fact. Only audio seems to be
different. The question here is whether to patch every f_uac*.c (there
are three of them) or patch it in the generic u_audio.c

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmCG1C4RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZlJA/+I31wnZkb6r1BL4itmpXq8udeU1doxdAU
qn0N/RlCLqNpqYJBGm1e6cBrgtKIZS9s0D6omSLcTR+NAKa5Uu7q4SgwbziUZKKL
y+wpmuoQlZI4n78hdohGIG1AAHUqrLz+cix6SJbcjoYWcSybyk9ws9RIypC9c2cY
B/OyWysQ6yYcQUBqyaVU8oZUqj5VHvsF+0EpZExBlAv7mP5u8RIs+tygg0g+yBWz
cfi1anOp/coeOG5KvdtmrNlzWpY2PCdXgsZa0IuPFsUbPmOJ9D1jZegr67eMeApd
nGsYY2SWiSiXHMuzHRIwEupE4+EY/4l6vt96gh8jgrpQhWH3R4KIXy8wKXDXETk2
bOJhqsTIM1HXuh7VRTJSTewoX/zhzNUwP0bCOAj6cO4D7RlfES5lnBPoEsoIcRkC
EK2sQ5TuqJ8F1YEtqhOBT/9o9iv0LQS81uzG4BzwgA0ZKVSmpI2/4jpfmDGHocgV
VwB30GrSw3WDpd+1qfuZO/VIWhEMaCeAsnz25sPmMeA8uINcS0uJPoozDSkb24z+
DY/AU8hd+oWB5hKVkseAEN9aupy2rlUbVb83Zon1qr010RKR6T0i5wt16pg6/DVZ
2y/13xstoKHcw2KvucaAHUOeeBWLLbv33RK7TiqlpRPcf/xM31XUyRNLNWM6GJWu
JUjqhon0rIA=
=C6Ue
-----END PGP SIGNATURE-----
--=-=-=--
