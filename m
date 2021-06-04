Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 048A239B1FB
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 07:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhFDFZT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Jun 2021 01:25:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:39148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229751AbhFDFZT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Jun 2021 01:25:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D89186140F;
        Fri,  4 Jun 2021 05:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622784213;
        bh=Ln6Mia1a4/2OwhOP0u4Qgk9UwKWug2OFvOywuFpkLAg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ALoRWkuz7Kp2W5yYyou71Nb0zrj7zg9eAyTuLGZnFe4AkJIAj61Sq7VedPd3VOoh+
         BeD/bpbBIk9XFcc2UknSxNHwmAQCXkUqz9dAbDFw9MeFWMxgus1RILawipfMEejSSK
         USHDU0A6NpZD1ZObelM+J8/dKBXL0KNP+xi6mel5YWgzBvqn/fJwDrtLHMywpKX28z
         pTe5nskbBTOVX41SUAGCujn02Do0RACWci6XHVyFyRfAd/CydgD7BGeMWAnhDKE9Fr
         27r6UQWB/6lEuHkHWk+VCegJ+OFjoTIE+FQuuAJOHkCxsN/97KIn/jkTiQhzL0rNah
         BYhpjSYMxJm/g==
From:   Felipe Balbi <balbi@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 4/4] USB: UDC: Implement udc_async_callbacks in net2272
In-Reply-To: <20210520202206.GF1216852@rowland.harvard.edu>
References: <20210520202206.GF1216852@rowland.harvard.edu>
Date:   Fri, 04 Jun 2021 08:23:25 +0300
Message-ID: <87pmx2b3ua.fsf@kernel.org>
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

> This patch adds a udc_async_callbacks handler to the net2272 UDC
> driver, which will prevent a theoretical race during gadget unbinding.
>
> The net2272 driver is sufficiently complicated that I didn't want to
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

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmC5uM0RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUg/iwf/R5DXiEsav6Q0HpAK2kEwvHTs3KBiiGyf
pJv8hA7aQvnx8ELrNwkvzJf5yCWihGRAPdgRMyqCE9k7xpXR+pO2mFrcaXuFRGhh
PLtrxlNxEtjiqp/6mWVDlsjHY3tnUWeyx3NK1PjU22AknHHNzcF+kkI/N92fnbmy
9ow2Aon02d8t9zSGDm2w43QUAx05uJTwA0vTnqwcilVUBq/ITTPRwiF5s3DLu5G8
vv0yHum87c/JtV26VNTacZ6p/5HPY5hHsPo7xpwyAZ7L5aPqeLRrT3KIzydO7bJj
2A2wbPUDrmu48esSahDrrQ2obTwIa4uMLhfxKIqy1RiDFM+7+h/r6Q==
=5+HG
-----END PGP SIGNATURE-----
--=-=-=--
