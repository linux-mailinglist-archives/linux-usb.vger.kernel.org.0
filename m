Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4326335F0E1
	for <lists+linux-usb@lfdr.de>; Wed, 14 Apr 2021 11:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbhDNJgk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Apr 2021 05:36:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:36452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229914AbhDNJgj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 14 Apr 2021 05:36:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D4F961220;
        Wed, 14 Apr 2021 09:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618392978;
        bh=9CvBDOOp/snU5Np8LPno4R60T5G3WD+g+xXvtSMaGbw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=NOeRRVInED1c72oGIdzg4fPwaFIC/a515LieF2NTL7HMaiKTzYeyiIWLGJV3Q6f9t
         p8A2VplimRD8EzInzm31OVizITpzrm0PkqTnho6pW+i1plqWXJ7pkZLkiRkBTrnWHk
         BiR4rhmbna0VxQuj4pEQu03BnVWJf7CkFkc+kpcpy+onRKOSMjm2+F4Iv79g0I8vkD
         XFcoQ7+NGwVssOTcYxWifsV56smmjG/1xFTygyPpoN6fvtn1yP24/kRvt6/NBOQpga
         WkMe0YPMTQXu+78/KWfQJVTWcAR99Jh/jmU77uNmVfU36G2sTZ2BH0WceTfx2/NJmQ
         42e0t8DEELSgA==
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Check for disabled LPM quirk
In-Reply-To: <1b784826dfee46adaa65c42d33934339d0c1f2a7.1618364095.git.Thinh.Nguyen@synopsys.com>
References: <1b784826dfee46adaa65c42d33934339d0c1f2a7.1618364095.git.Thinh.Nguyen@synopsys.com>
Date:   Wed, 14 Apr 2021 12:36:11 +0300
Message-ID: <871rbdp5ro.fsf@kernel.org>
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

> If the device doesn't support LPM, make sure to disable the LPM
> capability and don't advertise to the host that it supports it.
>
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmB2t4sRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYTTw/9Fjo88hmenPtOgaoCxVQ6AAxgbwO/POv3
rIw39lzC3WC95FEYaRiaoMYDPWMNg2pFUgu0r8DeDwQUKoiYInrOfC4UfIeqa2x3
MNvzNudULf6ire0Own/cxH4aBKRJBh1kPGLaeXbVAtjbwCqIqjgq6sGGcW9eSWyo
5GlXRlayErS6iJAxBDnLemGF43aILoF2gQPXeDpkQKgFfRvEcqEwr6hry6mg2eeM
ZtYvY7Yf2/rvP393UHTKl3xSYLyfK/Jck4/n1IQpWVi3i+gk0kLGvB0Y2oCRJibc
XbRkcOgY3+O2VJ0f/Q/x11tXPlXM9hPsO0CSRah0f73MrDNeJ5Os+d588iElzOVM
4suE9IZU+3aL/0VBZ7T5Oo4tLcdZjVW3JJuHBYA4+Yf8+xZWZzfVBZzv7/L9AWW6
oVUPxMMwOncGZ1eW6aesVQaaxn3/kZsDBrLY1uke1yPWt1dMaCGhzyd1IEdIxxbY
tU4rspQN/e66UKInpJZXW3NBAvborKvaeM10sbtukubTZeZ02V61a2XSmT6YzaNa
aALVZDmAOVNjEd+f3kr0/GwZcS6f2ExgyCsgD4QAzR62zAn0+eEOcCTTU0Sa4crh
Ue8ghLqjkwG2SjWjmuVji5VAxVxkZM8jWqKQvDKCcp7BxckWYtLc0iMBqv1zAI4K
/qKwe5KJStw=
=2Ozp
-----END PGP SIGNATURE-----
--=-=-=--
