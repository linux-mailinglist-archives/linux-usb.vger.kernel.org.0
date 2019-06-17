Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20486482AF
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2019 14:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727789AbfFQMkM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jun 2019 08:40:12 -0400
Received: from mga18.intel.com ([134.134.136.126]:44443 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727394AbfFQMkL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Jun 2019 08:40:11 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Jun 2019 05:40:09 -0700
X-ExtLoop1: 1
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2019 05:40:08 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Lianwei Wang <lianwei.wang@gmail.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        lianwei.wang@gmail.com
Subject: Re: [PATCH] usb: gadget: avoid using gadget after freed
In-Reply-To: <20190614070243.31565-1-lianwei.wang@gmail.com>
References: <20190614070243.31565-1-lianwei.wang@gmail.com>
Date:   Mon, 17 Jun 2019 15:40:04 +0300
Message-ID: <87tvcogzbv.fsf@linux.intel.com>
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

Lianwei Wang <lianwei.wang@gmail.com> writes:

> The udc and gadget device will be deleted when udc device is
> disconnected and the related function will be unbind with it.
>
> But if the configfs is not deleted, then the function object
> will be kept and the bound status is kept true.
>
> Then after udc device is connected again and a new udc and
> gadget objects will be created and passed to bind interface.
> But because the bound is still true, the new gadget is not
> updated to netdev and a previous freed gadget will be used
> in netdev after bind.
>
> To fix this using after freed issue, always set the gadget
> object to netdev in bind interface.
>
> Signed-off-by: Lianwei Wang <lianwei.wang@gmail.com>

I can't actually understand what's the problem here. The gadget is not
deleted when we disconnect the cable.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl0HiiQACgkQzL64meEa
mQbmGA//SqgsjniUbKalHyeBos8uvfm8yEKROHCgc80C1JV1yQO9ZrgZgEn6Bvp6
Og22h0qTcbK0xF8vAmIUm84n+YdlfUPHB+wZ1puvHwXlLaUpslDsdDC8HejIEjWw
xHhnBaEHaD8YKQD9g6T2P1X5r4nJdm2oSePaUTEGt2+oDiVPD8++fzaKka8euVfs
4QX9ry+SFfLxEkIdCt0VyVg/FCk5tGROL+UAG9MQuc+grbveAEykojJiE4GG8gqG
9VEA8fpmfY/b/NiVkLcOaOccd55zp/yJMdJl5C6nyBzx+s+lS81Z2XTgSJIm0dBu
4GfD+nSr6QSFQKTRNbyyix0+hdnLrIwnuSaTo+nTisRkea7u05PCUcLT2N0Zjm7x
j/JX5rrrAy3fSes2gM/wAMsLs6PO/GFWd6qMMttzqvrKDvtccV0QQY/gRn3xnz6p
8jHHjJJ+JgalBo20p8tG8+Oq4Rbmr8R69qkS3DdopROTSn3Jdgr2SbSFpn1CAE00
u2SOhj3YvD4MGKaXC9c7WS/jDeQHvNmF+JUmrEJ838HtewQ20K6dGmAtGIEAFTWu
D2BYDN3rZ4c2j7CSEocV0Dze/5QnOpNu5UupsVlI3+5Rkz3TEmp356yut2Y1KsJR
Sdi+gR3RqKu/Bp7r1g5XSIx8mBPHZ7kis2OspD8o7lIUrmbq68E=
=tG5C
-----END PGP SIGNATURE-----
--=-=-=--
