Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF1213A2B8C
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 14:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbhFJM3z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Jun 2021 08:29:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:52044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230467AbhFJM3u (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Jun 2021 08:29:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 888EB61406;
        Thu, 10 Jun 2021 12:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623328073;
        bh=lxrArhF4z0oJSwJjf2mvrkf0vD5KPp4G65uQjLcdVAI=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=WZsChQH5PTIz1h78eW8nozZ4fYWbTds8+JBhaUw9WwCtwV2TaIcN+AdyOAahyn7bU
         H3Rg48s+KfcjxzotTnuBPqZbrEODSTrhKT3QIR9mVtIKwmh5tyUh0y8H7cnEjVGo8y
         gTLaOrteRETATGqi5PIoTSfp1XVRdMtqcwisz8uDsx+yBls9ZojvVaeVVMON3Essaa
         yo2HASM3T9VCPrZQZtW4uIME/nYCygi9xq/rEJ6L9mv8FX0eBmPtpTYCW/cDrV7x49
         WKx2QG8YyCMUczRvvz1+UPgGV6kgbx4MEvGnnRIskSTPVAhcw62q3/uj8D/ZQhPpq0
         vN8UjB/In1Tlg==
From:   Felipe Balbi <balbi@kernel.org>
To:     "Fang, Yuan" <Yuan.Fang@verisilicon.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: =?utf-8?B?562U5aSNOg==?= [PATCH] driver/usb/dwc3: Add error
 handle for dwc3 get usb phy
In-Reply-To: <678AD2A4F5F78445B722FED0965FE327776E4011@SHASXM06.verisilicon.com>
References: <20210610113745.7710-1-yuan.fang@verisilicon.com>
 <87bl8e0wnc.fsf@kernel.org>
 <678AD2A4F5F78445B722FED0965FE327776E4011@SHASXM06.verisilicon.com>
Date:   Thu, 10 Jun 2021 15:27:46 +0300
Message-ID: <878s3h29bx.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

(please don't top-post. Also, make sure your email client breaks lines
at 80 columns

"Fang, Yuan" <Yuan.Fang@verisilicon.com> writes:
> I agree with you that some platforms don't require a PHY driver.
>
> But in the case I mentioned, in the platforms that do need a PHY
> driver and PHY driver is not bring up successfully, the driver code
> right now will return 0 and go on set the dwc->phys_ready=3Dture, which
> looks odd in this case, right?

Your new PHY driver shouldn't return -ENODEV. You can see dwc3 filters
only -ENOSYS (framework disabled) and -ENODEV (device doesn't exist).

Stop returning -ENODEV and you should get the error propagated to dwc3
properly.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmDCBUIRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUiPPAf8CSwe2v+uAhhu3iWEmJkGwfOQLh8I01Ep
gnpaJYpcmPUeFqSbZdsHDfVNa+Y04DsVk2GkIF1zYDddr8ASrBwEolfISqbadskA
KpgyZmuL8TM2GuBaLaZtJwFdPye+LhzEEdpGylpl8qnyn0xdDUIaFnoyYjlxcHk3
bqxAKBI6hoitrtSM+gkgeYyr6ixd0AW1z/UEpRe9X9xWSyI+8WqiC8l6pdZavvS5
5k2nt/o426Yu2TF+blfrgbKREOc2pQsEIYY1CE3hHC74uV6huJeYsgJfUiz4lws9
IVcrEsjCXbt+nkN0RNkas/DbG8NwOvAkf22Cx+lB5GRl/RnWAm1ang==
=Pxhy
-----END PGP SIGNATURE-----
--=-=-=--
