Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F32D3D352C
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jul 2021 09:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232850AbhGWGkD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Jul 2021 02:40:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:34526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229774AbhGWGkD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 23 Jul 2021 02:40:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B84C160EAF;
        Fri, 23 Jul 2021 07:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627024836;
        bh=bQh8M7TpD+pNf181uEcSVStCFCS4QULBmpH2FjgNdWU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=mFf7hDScnIXDZSHsooaPEnurUrLjwWCbUxG/hMp3vptBBuTeOm6OvmoyzH/jeZ201
         vCLHf5onvBJdTFGC+/CGejMPrgb0N2T0RicxRyFJrJH4jWIrW1Q/qt6OcdgdoBvGdQ
         stkqdQnowiEO3aQChwL7imYvNO5OOwE58dguP1+crK/gOoSTAEYwEbLZdJ6XR4TYU3
         vH/7mH6ox90sPykghUxOChut6QFcVn/ZvhO/KZo809IREfcNHDD5J8ki+aBKqU0oJu
         TS77YO3CU3iL9lj8KJN+pyC96vmOgokg8ZmOUwKuUd1VQlYp1uJktvrAKFNDuzmI3C
         5wptDgxrBUBJw==
From:   Felipe Balbi <balbi@kernel.org>
To:     Maxim Devaev <mdevaev@gmail.com>
Cc:     gregkh@linuxfoundation.org, sandeen@redhat.com,
        linux-usb@vger.kernel.org, mdevaev@gmail.com
Subject: Re: [PATCH] usb: gadget: f_hid: added GET_IDLE and SET_IDLE handlers
In-Reply-To: <20210722205132.7a168041@reki>
References: <20210721180351.129450-1-mdevaev@gmail.com>
 <87y29ylga5.fsf@kernel.org> <20210722205132.7a168041@reki>
Date:   Fri, 23 Jul 2021 10:20:29 +0300
Message-ID: <87sg05lcn6.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Maxim Devaev <mdevaev@gmail.com> writes:

>> Felipe Balbi <balbi@kernel.org> writes:
>>=20
>> yeah, I don't see any issues with this. If you have access to the tool,
>> mind running USBCV on the f_hid gadget? Would be cool to get some
>> confirmation that we're within spec.
>
> Thanks for pointing to USBCV. I used a hardware USB protocol analyzer
> to understand what was wrong with f_hid, and my hosts only sent idle=3D0.
> Thanks to the test, I realized that I should only use the upper byte
> that contains duration. Here a fixed version of the patch,
> which successfully passes all HID tests. The idle part:
>
>     Now Starting Test: HID Class GET/SET Idle Test (Configuration Index 0)
>     Start time: Jul 22, 2021 - 20:29:40
>     No report IDs found in report descriptor for Interface : 0x0
>     GET/SETIdle test for report ID 0. Setting Idle rate to : 0x7F
>     No report IDs found in report descriptor for Interface : 0x1
>     GET/SETIdle test for report ID 0. Setting Idle rate to : 0x7F
>=20=20=20=20=20
>     Stop time: Jul 22, 2021 - 20:29:41
>     Duration:  1 second.
>     Stopping Test [ HID Class GET/SET Idle Test (Configuration Index 0):
>          Number of: Fails (0); Aborts (0); Warnings (0) ]
>
>
> From ac56ddc1ab2dfa599a12a3bf064e520d587e89fe Mon Sep 17 00:00:00 2001
> From: Maxim Devaev <mdevaev@gmail.com>
> Date: Wed, 21 Jul 2021 20:48:28 +0300
> Subject: [PATCH] usb: gadget: f_hid: added GET_IDLE and SET_IDLE handlers
>
> The USB HID standard declares mandatory support for GET_IDLE and SET_IDLE
> requests for Boot Keyboard. Most hosts can handle their absence, but othe=
rs
> like some old/strange UEFIs and BIOSes consider this a critical error
> and refuse to work with f_hid.
>
> This primitive implementation of saving and returning idle is sufficient
> to meet the requirements of the standard and these devices.
>
> Signed-off-by: Maxim Devaev <mdevaev@gmail.com>

Great, thank you.

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmD6bb0RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUjergf7B4T9jP8RFLZG9KmVza1mEgOPXQnMjdqG
Wi5ht1zb6FO+2v0iUBu7bI6Y5dy+ujS9uJfSgqqIMlY4FnEWbFvKXHcYPyRCdWQn
m8AwZXLNJWW0K8dVBIAGHXel0UncVBcZGQQdvW+9qPjvMyLjEivOVvy5gDuhRMEn
i31vKO88mu03wfz7hXxF+tK3o0HJ9ZpvDUrKlRl/pDTencj+d2fN9spTEJV1YZKX
G1NNSoAoQXbVGDWeMp3MiwbqxgOfAS+oLS7o22ZEoogbAr4NwtZzNGUUCYhr34eC
0vbg1tdTj4SVoft8RPQBIXpSLn66jiBKTZwlY5GhPCq2XhnOLZM1jg==
=MlhL
-----END PGP SIGNATURE-----
--=-=-=--
