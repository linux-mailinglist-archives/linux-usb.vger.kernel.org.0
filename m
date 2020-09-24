Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 407E6276B20
	for <lists+linux-usb@lfdr.de>; Thu, 24 Sep 2020 09:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbgIXHry (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 03:47:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:48136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727109AbgIXHry (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 24 Sep 2020 03:47:54 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 15CF1206B2;
        Thu, 24 Sep 2020 07:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600933673;
        bh=RipydBQAFTrz/H7ANHjPDKtiqA0VLRLX86lp6sIpnP0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=CWs6SMjMhPKXUKw+qQtrgAe82ITE1Wv7EJwYf966lSpjp9cmB1S/ZeSPDe+fl8Cvd
         OC3DS1FjMu8/Ef5sHe+1/zdQmNVVhd+q85QJPaM4OJUDc30pQWe/2f6eDSdPtgSQ82
         HZcfDX7pe9zmCLFYd0aP5cgcoDEoq2nglRPgEV64=
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v2 6/7] usb: dwc3: gadget: Rename misleading function names
In-Reply-To: <554c6d34c5936630bbe292114fad9c3322a7161e.1596767991.git.thinhn@synopsys.com>
References: <cover.1596767991.git.thinhn@synopsys.com>
 <554c6d34c5936630bbe292114fad9c3322a7161e.1596767991.git.thinhn@synopsys.com>
Date:   Thu, 24 Sep 2020 10:47:46 +0300
Message-ID: <874knnehul.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:

> The functions dwc3_prepare_one_trb_sg and dwc3_prepare_one_trb_linear
> are not necessarily preparing "one" TRB, it can prepare multiple TRBs.
> Rename these functions as follow:
>
> dwc3_prepare_one_trb_sg -> dwc3_prepare_trbs_sg
> dwc3_prepare_one_trb_linear -> dwc3_prepare_trbs_linear
>
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>

Tried to apply on top of -rc6:

checking file drivers/usb/dwc3/gadget.c
Hunk #1 FAILED at 1161.
Hunk #2 FAILED at 1231.
Hunk #3 FAILED at 1266.
Hunk #4 FAILED at 1294.
4 out of 4 hunks FAILED

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9sTyIRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQbybA/+MIwn11R3GbMPTVPwkZ0H7QN8Nyln+qmk
0JBCPZk6oANmXVDnT9LcrpqkZYLormJaP6LGRyQWntniUVai46Q8PgH/29Zu88y4
Hcwi+z2bAVBVBHXX+gt9hGhTU7nq15q5eGMIO9xmeqP9nZ1fyhtx0Y+mIWTTx1me
B3SH++tpvcThht5Rtdwxs5OFbj4vdFiuYRi7zbhLH/84/3hBqqLnwkgrLVxnW7En
e5Caqgar5weryCMNIlJuri76mI68LEKLlVJu3E+J0LYK7U4DlsXzL6Wup8MMoiDi
0YVDXrKuUD9x1FdJH3q1aTtnoC15z8FCdUK3M1laP5OE8htyHAw1VrJRPwz/xWHf
28MQ43bfWiOrhDXWQGhk/aGyiDUUn4utZJdqW1KhA27bfp1ylVjP6hfelOjp0bem
CRFyIgJr6cHGNfN+VDMq5XlRp9nGuzos6FrZRT/zTJtlVxUrhPhT8MpdkeS0hZN+
iNvIkOImueG5tsIzOQgdiPUeEHancaTE/IXK0a0LmnOuzvWgfGmx+mhqYNzfm4Ap
Z77PT/Ax0PHM5JOvuVaS20eTQDjfQGOdkE8btxJTVTx7f3F+bSrGxnJbDllG1rQ9
z6DwWZb1BDxI//x6GaCCwtQYZvN3UfK+GQTSpr4TlfpFIQLdKlY4cCnzzZOd1Q1O
8d42nApyt5s=
=TZ2c
-----END PGP SIGNATURE-----
--=-=-=--
