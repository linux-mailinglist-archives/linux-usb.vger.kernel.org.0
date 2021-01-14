Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA752F5CB2
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 09:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727481AbhANI4y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Jan 2021 03:56:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:39916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726742AbhANI4y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 Jan 2021 03:56:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C846239A1;
        Thu, 14 Jan 2021 08:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610614573;
        bh=sv+9qVGO7egBfOkGjfzcpaTzrwk3mgzrhgB3qJS9h3Y=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=eHt4b/m0MHTnpFxAkA46FSm7JjfLFoR0M2RAvsI6KuNL1c3gISH4NYXkihZpEmPNm
         DRQclGy59WKzjq4Oj81RkDvMV/uJBupgjascbyWoBtamTAh66lUT5fv86sf1o0BN6U
         yWqYp+nJEvtqAR1u3J4kFjfkmKnr7TPCoDVuncRcEG64nrYB9GadUbnfwGQerRR5+c
         Pg5EtMsVx+NvY9nsej77Ko71Ju4gjvd3GdmIAfw57jUvhjaQ4R/nJn6Kkia/AwbuzN
         PErwt8TlFNgbC5Xx7BG3xBcPJSBywMLFdI404V1w7+XCJhyv0VGWqqzalYVepehXUT
         7VuHg8zJUi0OA==
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Disable Vendor Test LMP Received event
In-Reply-To: <4e785ba5d5e95801b6fcf96116f6090216e70760.1610596478.git.Thinh.Nguyen@synopsys.com>
References: <4e785ba5d5e95801b6fcf96116f6090216e70760.1610596478.git.Thinh.Nguyen@synopsys.com>
Date:   Thu, 14 Jan 2021 10:56:06 +0200
Message-ID: <87mtxb3nix.fsf@kernel.org>
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

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> Some users questioned why Vendor Test LMP Received event was enabled.
> The driver currently doesn't handle this event. Let's disable it to
> avoid confusion.

in case you're curious, it's left-over from early development where we
thought we should "enable everything and add code for each one" ;-)

> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmAAByYRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQY34w//UEYSTDYCgpkdoil/iFcrPg5gPEy3zRvz
DdLc8UAAQvd7MLhfypMS6Q9/aHj9ZkN+ZnjMkf5qYt0yOLUuK/R/biY9Vz6YH6F3
B2gglnXwVgDgiKjKN7ncH+XutNruc0xgHSqxwW6hZdN3QZInLw7F2l4PsjxWejyF
NTRdOUX8XStnoFB3GU+otpBXDJ6m4O6EfYe2SE35wE7xOYD2TeDTGjt4Yjrx3MO5
PZAIRmYCfumUfqe1h3s1/Q3+iVU5ULYcIv+iC45Y+wSEIHL2N7fiXnKVQO4ZNjm0
2rjtI/IaFXDBUh1MzuROxj8b9OCx8fXPU7njjebKatjBciGmsV+O7+bMSNs3muZw
T1RrzyuV5UDyKtEMl4SXrnsgnoQD8WEuCJ1I7PSAmC8VnMuevKqYfmVha6BKRtvx
DwnupBwe3tfHBTvd6yXxN7m4PRTc7kwzWBgmVmnWlawXlRL2xaOxFnucdiWTbnkY
PSgq2ghc3kSJI5c7cjBDfOUVAhqwGcEIa9rkuAQjNtN1RtUqkRX0G655vvKh7FVg
qvi2i1TQZ/ytbhAcyR/5gAJfa6PBnSskqQkerkWvDw9DnbsxJEoL8EytdmV/3/0i
N9dc/QTAWRvPaNJAo37GMZPYV/UsFFqqt9julEtbYIQPoMKzwcgk1N2uM146fFFS
mhYADqGoJU4=
=twKJ
-----END PGP SIGNATURE-----
--=-=-=--
