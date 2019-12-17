Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4973B1226CE
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2019 09:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfLQIh3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Dec 2019 03:37:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:40900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726402AbfLQIh2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 17 Dec 2019 03:37:28 -0500
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5C1B9207FF;
        Tue, 17 Dec 2019 08:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576571847;
        bh=r3ptfJb3sD1f3kPMFSXcZSbpqwaMLKgnCG8vqFdH40I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pGyVvcxgw7K4EJ86MNOFfl3Ex9Igjw7KGmh1LxAHAbTbTaxVbXG5Qw8K+Yt+lPds3
         XLyoU5w7PGseGXlJY2v0UYls0xCgqSo6mKX7ZhD0CmpicsHHIFUpVcuL+QSPRbZJtd
         cHvxz35MmDoDvcdUWdEE/33HQKBmH424Y90Pk66c=
Date:   Tue, 17 Dec 2019 09:37:24 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stefan Agner <stefan@agner.ch>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2 3/4] ARM: dts: sun8i: a83t: Correct USB3503 GPIOs
 polarity
Message-ID: <20191217083724.6hva5rzvblrsrvlr@gilmour.lan>
References: <20191211145054.24835-1-m.szyprowski@samsung.com>
 <CGME20191211145222eucas1p1d761af59e04017ddadbdbd1cceb59b1f@eucas1p1.samsung.com>
 <20191211145217.25025-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="37sxn2mbr4dhx5yw"
Content-Disposition: inline
In-Reply-To: <20191211145217.25025-1-m.szyprowski@samsung.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--37sxn2mbr4dhx5yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 11, 2019 at 03:52:17PM +0100, Marek Szyprowski wrote:
> Current USB3503 driver ignores GPIO polarity and always operates as if the
> GPIO lines were flagged as ACTIVE_HIGH. Fix the polarity for the existing
> USB3503 chip applications to match the chip specification and common
> convention for naming the pins. The only pin, which has to be ACTIVE_LOW
> is the reset pin. The remaining are ACTIVE_HIGH. This change allows later
> to fix the USB3503 driver to properly use generic GPIO bindings and read
> polarity from DT.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Applied, thanks

Maxime

--37sxn2mbr4dhx5yw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfiTxAAKCRDj7w1vZxhR
xcWTAQDDHYrUUmf3Bv5q4dBtplu5iG6rQLy1lGxBQ+bI4Rg//AEAya5NBPixtgql
ctYP1dwe0l9O3OcFDTjIvoQcg6KsuQI=
=i22t
-----END PGP SIGNATURE-----

--37sxn2mbr4dhx5yw--
