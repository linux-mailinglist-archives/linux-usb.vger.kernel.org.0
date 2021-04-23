Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD4E368CF3
	for <lists+linux-usb@lfdr.de>; Fri, 23 Apr 2021 08:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236919AbhDWGKl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Apr 2021 02:10:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:52266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236802AbhDWGKk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 23 Apr 2021 02:10:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ACF746128B;
        Fri, 23 Apr 2021 06:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619158204;
        bh=IxtFWimZhHGKZkwX1fPMR/16QmyvCpnaerzLucW5h7o=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=YFzaYVUPS2H5orjgmkc+n/7ij6k74vmGnEnXDNzjrDhdCdcVaEwODY671EnHeI0Yz
         8gxDfCYnDbS2ZGur6V15RsO0jAl0d3gxjoV5isZZSXsCPrDvKZM2AYOX+yTEKTYWer
         dk5HsUicNwlvOav1NnxfrG3FXkJaZEM+wuD4XfUMEK/fEitvLYa5B5Hvko3cYNZ7Wx
         ckuTr5dmKZFMdVILJk5Z9x/Jv4Ntny7fpkSei8Y48pzK1nmeOOUmDqk5bc1ZL1/sbc
         3nqBvU94ZWORhjzV9FFt4Ph+qQHq/knSzkksGoSfEz4Khw+CBjzeJlCFk5EMI+DkFR
         vYjQ78MqjkWag==
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 2/2] usb: dwc3: gadget: Handle DEV_TXF_FLUSH_BYPASS
 capability
In-Reply-To: <65c3070c666cd6b8beeee62d7f8e3e704ebf2d32.1619134559.git.Thinh.Nguyen@synopsys.com>
References: <cover.1619134559.git.Thinh.Nguyen@synopsys.com>
 <65c3070c666cd6b8beeee62d7f8e3e704ebf2d32.1619134559.git.Thinh.Nguyen@synopsys.com>
Date:   Fri, 23 Apr 2021 09:09:58 +0300
Message-ID: <874kfxmszt.fsf@kernel.org>
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

> DWC_usb32 IP introduces a new behavior when handling NoStream event for
> IN endpoints. If the controller is capable of DEV_TXF_FLUSH_BYPASS, then
> the driver does not need to force to restart stream for IN endpoints.
> The controller will generate ERDY and restart the stream periodically.
>
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

so we still need to force restart for RX? Just making sure. Other than
that:

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmCCZLYRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQbXlQ/6AnMo7YhFjTxy0lcBD6QlCnnb0VvqZDk0
Pfhq/3Z7mRFhS+cB89RWek9crhsOm2x+mg2meiOC1aSqLztdlfhOwGV+7l75+7wV
J2f4x4JCKzsl7YYHGKXCU9mNSoAOsXhfsuyL5MrXzzwOe6dULC4iY2SnyLipfeQM
euW0J/7mECfYez5be7+dQ5Sq3HGgXCmSjRK3p3r5k+KN/HbIoGOOKU0RZQj/Jul/
8rhg3vfe3th9KzQZ3WXa5S3cClIeM//hDFTTCPX6OcBlvVqV2aG39lcZD3F9IuES
fXi/RxI3xO29JdsMG+FqbnXFGkEwUBKl2hS69gqAOKekleSeg6PVsl+62ySgpJGS
tMv+zfeNmyIIsEq2siA+Q8wAEj+maeeUahKgETiRXYwZf5Nblpp82/MArj0wKgh6
uUBrxJnoAsf4Nkn+JlhJ2+Q0/Sb2DqL7mx7g8gLP6YglAC52EDNtvN8994aDJYCe
brs1JtkMLll+Ucx0D5kPkJVIiZPiuzVr3VFLN2E3TBqUYJ9/5awv4dxHLkFCn2K9
upGwd82JHwHRzGqcdX+BSTyK+jDrnZ4klP0acyaRDn/s3pKQjHzNseALS2QxdAjh
7ENCMrZQyL5GPAjZc0858IKB878yHWtWRG5XIhMiVKDV1GAflGp3prR9lBKVK933
agrPHW2MMf0=
=S8iT
-----END PGP SIGNATURE-----
--=-=-=--
