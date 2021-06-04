Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4AE039B1F6
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 07:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbhFDFYX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Jun 2021 01:24:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:38844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230142AbhFDFYU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Jun 2021 01:24:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 832476140C;
        Fri,  4 Jun 2021 05:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622784155;
        bh=dwnco+4LmfdzFbjr+OlDmI30GzduFSE+Bt+qz5LGph4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=UasAq3vKDX3WmCoK0XbJeTzR3spodY0lJ4Rc5o3sFA41xhlv0WIjPZFUy2p9f4AlZ
         sx5CGXHw2nUYAdcL0SFY+xeF/LvFdPn/scn5b/c9EtUTbfPZD768CQFJ2gaoLmcUy/
         I8e+PSx8AKoujbnIm5KizfqB//EsISyFG8ODO6xPEcUAGOlCxKonjQn1xkUbfbYeZ2
         YhOvtVMBflKAEpj/qXFdAyRiVriPPjHKAPipKfXws95yZ4/rEpzwNd+go/R48RO0XW
         /p5NlFBqj1lOpMHk476WHU8y3wq40oe0LeXhOrfGnJunsTTpLIqdO7eUTbHjxxiPV9
         uUiud1vj+AwfQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 3/4] USB: UDC: Implement udc_async_callbacks in net2280
In-Reply-To: <20210520202200.GE1216852@rowland.harvard.edu>
References: <20210520202200.GE1216852@rowland.harvard.edu>
Date:   Fri, 04 Jun 2021 08:22:28 +0300
Message-ID: <87sg1yb3vv.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Alan Stern <stern@rowland.harvard.edu> writes:

> This patch adds a udc_async_callbacks handler to the net2280 UDC
> driver, which will prevent a theoretical race during gadget unbinding.
>
> The net2280 driver is sufficiently complicated that I didn't want to
> mess around with IRQ settings.  Instead, the patch simply adds a new
> flag to control async callbacks, and checks the flag before issuing
> any of them.
>
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmC5uJQRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUh54Qf+JnvlDRRl9jwhIszmBdBx7+Y3sYsIZjdS
UFWjNXK73/V/p0P8ck5ARjOux+YCoq1Y/pmw3ySh/c/xDKqc3mbGoOlMkZUe4Jsu
GHCm19RY70MdCnqyMjAe0aJQSbIcVed0kBiujr05lRqirbfRxw2OVFjv7Ysb7WRU
VHBYdhQ/Pkp56Y6BOGKABG/o5zRuduZPnC0n3rWIBBSAZC6RcPQUpSXZJxTaGGeE
OTTBRCr2MYYOaNcheReOu+X+cVa9yjc0oXKGviGDDjnph1NkPdKOjo7i2SiS/bWx
sqJw+28X49SRj8BEId8HQR7LxawTc1eH/I4N39ylCiD/1R6n9F9RXg==
=EAy1
-----END PGP SIGNATURE-----
--=-=-=--
