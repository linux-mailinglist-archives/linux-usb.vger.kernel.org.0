Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41E1E3A2904
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 12:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbhFJKJY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Jun 2021 06:09:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:47850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229770AbhFJKJW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Jun 2021 06:09:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D78C560FDA;
        Thu, 10 Jun 2021 10:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623319646;
        bh=8Kk9bXBe1HeV4GH7mWJmBocxGU96cRUrgjwQZV3Kp9s=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=e+hSSo9+QrdNgT/xLG8o9y4h6A27RyXO4pyI1fTg3W45oXeBJOdTAr6IbueDfLP1s
         3rbBQpstTxR24XvjCobUuoIBt9XMkkvgDokAca/thTAUPLa3t7ByhajnvvxaTtNmtN
         tHEZZhEyKIK/Oo4cw8vioh8jqizkSt505aic/Bb13wbeFTy8H/wIU7EuXO+PNVQtX4
         NjDIUrn6X5BczLRyYKVIwiMkoMZw1mm3I6dFupsUvh8x1QlE27To4lhIFlBnEhFh/l
         naPvUILHZtOb+WZf9sTqehH6E0DgJ/XLb5jSSW+QS/V7OY81+kBnvcQWss9AK+nLbd
         lUwWxj+Twqgbw==
From:   Felipe Balbi <balbi@kernel.org>
To:     kun peng <kunpeng0891@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: usb3.0: dwc3: isoc: missisoc while setting the USB transfer UVC
 data
In-Reply-To: <CAJa5FiHh3oWGt3qMRWTBRorENhsKNODTRd+0meK2qpYnMk6U8g@mail.gmail.com>
References: <CAJa5FiHh3oWGt3qMRWTBRorENhsKNODTRd+0meK2qpYnMk6U8g@mail.gmail.com>
Date:   Thu, 10 Jun 2021 13:07:16 +0300
Message-ID: <87v96m119n.fsf@kernel.org>
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
> Hi =EF=BC=8C I'm using the 4*A53 with DWC3 USB controller, my hardware to=
 work
> like a USB camera and so make use of the USB 3.0 UVC gadget driver=E3=80=
=82
> usb3.0 isoc transfer with  missisoc -18=EF=BC=8Clarger maxburst is set, t=
he
> more -18 appears=E3=80=82
> but from trace info, the trb has been put in advance=E3=80=82
>
> test setting:
> dwc3 driver version=EF=BC=9A5.12
> PC=EF=BC=9A potplayer
>
> maxpacket : 3072
> maxburst : 15
> interval : 1
> UVC_NUM_REQUESTS: 8

sorry, you're running 4.14.74 kernel. That's far too old for this forum
to help you. Try reproducing with the latest v5.13-rc kernel.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmDB5FQRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUiXBAf+M5IlT82PyIF4/UZjSEw7Z633S2tWO1MQ
+VcwCeUbN6KEjwBNlkQeY7uUBCjdFeEdfROyChfp8vAStRm6AQE6pnaqYBNCLmUo
fibTeThi8IwYmZYG9z+cQJdjc8bElJZWKw8LQszOZOJa32YMSBY4szNE3HUdXS1/
YWKSaPGp96VZpos8QZLD/KsWGVFXqIN79OfPE8Hc/k7EzqjvArdM03IQZ1dv+YOI
nD7ipLBIBGCCpMy2Av3NKu3obj4s/8O887jYYfFmKyxtsTrCpBkxehh+CIKtmxuV
1iZWZr8YFoVtgQKYB/o+2ZU/QeOP51sl0/iV7Gfgk/F1Npnx3hddsA==
=uiPb
-----END PGP SIGNATURE-----
--=-=-=--
