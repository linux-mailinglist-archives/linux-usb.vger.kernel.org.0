Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B763A2A6F
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 13:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbhFJLkM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Jun 2021 07:40:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:50720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230103AbhFJLkL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Jun 2021 07:40:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13DD8613F5;
        Thu, 10 Jun 2021 11:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623325094;
        bh=GywOsmJ5EgEoaZhIxv/SuubPjHaM4R5u0oKMoLVL/wY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=jb9K8AxhyKFbQD+kK56/w0ZwyIYvEWoRTh1AEwnik1YJqCQ0UVqzBatwJGRbUXgIA
         Tk87C+B7XEO7bE61e3bt2J7XIEvhz9HkQlWHojZeex4X5zBr8uiWRwtHhnxALIp/H1
         42z/sZCqOc3YTU07MAB+C+axI49WTqPee0i2rwE3CcSZMB4x9QBcyccPLaKP3IUsP/
         DpsSHGx8AqumfZ/9LQCkMo5vs7f6hvKRc5KcLp1k+CsjEAOwRlDi9XD0QiWVf1DwaG
         UsdqOOC5EN0d4vBKwf8dDQWLt11xjfG5uy6bWtsA4f6MvtlhO9PWXEva/5lNlo6pqB
         krbFlkbAc1KMg==
From:   Felipe Balbi <balbi@kernel.org>
To:     kun peng <kunpeng0891@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: usb3.0: dwc3: isoc: missisoc while setting the USB transfer UVC
 data
In-Reply-To: <CAJa5FiGTsM3+QS-+9P=8EZbNxZm+MqpPM3P4KU+=nD4KeA-qew@mail.gmail.com>
References: <CAJa5FiHh3oWGt3qMRWTBRorENhsKNODTRd+0meK2qpYnMk6U8g@mail.gmail.com>
 <87v96m119n.fsf@kernel.org>
 <CAJa5FiGTsM3+QS-+9P=8EZbNxZm+MqpPM3P4KU+=nD4KeA-qew@mail.gmail.com>
Date:   Thu, 10 Jun 2021 14:38:07 +0300
Message-ID: <87eeda0x28.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

kun peng <kunpeng0891@gmail.com> writes:
> On Thu, Jun 10, 2021 at 6:07 PM Felipe Balbi <balbi@kernel.org> wrote:
>>
>> Hi,
>>
>> kun peng <kunpeng0891@gmail.com> writes:
>> > Hi =EF=BC=8C I'm using the 4*A53 with DWC3 USB controller, my hardware=
 to work
>> > like a USB camera and so make use of the USB 3.0 UVC gadget driver=E3=
=80=82
>> > usb3.0 isoc transfer with  missisoc -18=EF=BC=8Clarger maxburst is set=
, the
>> > more -18 appears=E3=80=82
>> > but from trace info, the trb has been put in advance=E3=80=82
>> >
>> > test setting:
>> > dwc3 driver version=EF=BC=9A5.12
>> > PC=EF=BC=9A potplayer
>> >
>> > maxpacket : 3072
>> > maxburst : 15
>> > interval : 1
>> > UVC_NUM_REQUESTS: 8
>>
>> sorry, you're running 4.14.74 kernel. That's far too old for this forum
>> to help you. Try reproducing with the latest v5.13-rc kernel.
>>
>> --
>> balbi
>
> thanks for your reply.
>
> my kernel is 4.14, but usb and uvc related driver has been update to
> 5.12.0 linux main line.
> The problem mentioned above is after the update.

right, many other things happen in the framework. You could bisect and
try to find the offending commit, but this forum can't do much to help,
sorry.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmDB+Z8RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUioMgf/WqoLPQdVW2GulPDRJEKrVK/PPV7u/bN1
33+96FOLYlBdf9UiV3zBN5PSOzaSGSF+kpU4REU5xk8/hWC0bYh0cl/VNx4zaTvl
aTBBh49pR36vNm65ocA5S5ao8Zm906aapaORJQjtSNPfhFuMhD6BLyo5d41+ENvg
mcL+X3iYGhSuPK89WHEY4bmw5NDaigMMZWoFaU7HizXpvgy81XFLOJ2k5KXBkDXZ
tUDsr8Kj7K8Rdl3EOtuUk24vdAYVVIpNxT/V+GAnH8gD6CcR3jJV5DmU7Kesu/27
qvQvYkeRvhPtAPj1CZGUoM+K+z/29e0xQp/1bsW50p9hwu/IMoACRg==
=Ybe4
-----END PGP SIGNATURE-----
--=-=-=--
