Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3E625771F
	for <lists+linux-usb@lfdr.de>; Mon, 31 Aug 2020 12:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbgHaKGP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 06:06:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:49874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726048AbgHaKGO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 Aug 2020 06:06:14 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 79BF120693;
        Mon, 31 Aug 2020 10:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598868374;
        bh=7D3fKtFSrxBpLlrdB8ll5kQf5UJsTRkMRYBE7jloVeg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=rOyEi4oFd8EWl3D2gWb1prCUVP6HzlKkYJmnStpRe53Yh0dRNzzhkXIG3GJwKZyql
         U9i64S1mqypho05O1fo7U/faSjjCThSpq+7xJ61SCW+2ZOJhcWm/Wuic5U1FkPRlsy
         y4mCsbifYfkmbyHzn8woE430jOxiejkzc0QSlxEQ=
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 4/8] usb: host: xhci-plat: add .suspend_quirk for struct
 xhci_plat_priv
In-Reply-To: <20200522103256.16322-5-peter.chen@nxp.com>
References: <20200522103256.16322-1-peter.chen@nxp.com>
 <20200522103256.16322-5-peter.chen@nxp.com>
Date:   Mon, 31 Aug 2020 13:06:07 +0300
Message-ID: <87lfhv9lkg.fsf@kernel.org>
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

Peter Chen <peter.chen@nxp.com> writes:

> Some platforms (eg cdns3) may have special sequences between
> xhci_bus_suspend and xhci_suspend, add .suspend_quick for it.
                                                  ^^^^^
                                                  quirk?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9My48RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQakoQ//QgJ8IOYK8RUdhWkNRR524F6TUXRv4sMU
vonnZl+DOHB1vzIS9Uo/bXu8om3EjYogkbTlx7HedJxhPh/+L8yZDktYg6RpuHHy
ZF/Vda6voJ9sSDoatHpr4l+PpB4BW3OqpLf9qsaoTcv5vL1Ums4hlRJO7CO+kwJn
2N+4KsET+3odubyRV6cFViptPuIeA0UwQUwWd1qV5sDKvH3FacfffUGz9TTUnVgp
VTdtEGH2RCgDXFIb3qwzWXh46TCh5HHCau4X13aXpmA32HIa6BeMF7YIGMHLdljI
uS/drd53V3SWCUP1SKKl1HKETTv5lHl8H4c80bFlqBNxEhE1c8Qq+Uh8P03obaLy
7VAOIdL8gmIJifMrXClTmMPJa3AyrdAIGG6Jzcuf9DR/7mcar9yG1L2KVrKIz+lC
78ZG6NQYg/YAeP4vYjl1/x189sXpZ0BRwo1UO3zziQ54MHzZARx+tSUnNamOkxZ/
tNZf6uKKiTCgqDS2AdSbrfxJy3p2OqsD4cUP4Lf54F8WGh8v4KpvSnsXS/ZV4kBq
f4TtTSt0Ml6iP4ZOgSfY2skr2+tNT7UPJuGePTpkecz2BZX3Vof9J60jfo/VFu4h
RXwvVDGEMqY3PGbD/j91cawmrLHhHtCc6+tDRRPAdEfIp5rf+birp0oR1labSFkV
9YwTDZwElFc=
=Yy+T
-----END PGP SIGNATURE-----
--=-=-=--
