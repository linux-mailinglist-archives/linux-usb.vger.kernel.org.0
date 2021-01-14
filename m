Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 243C72F5E40
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 11:03:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727265AbhANKDV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Jan 2021 05:03:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:54766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726893AbhANKDS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 Jan 2021 05:03:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 613BE23A22;
        Thu, 14 Jan 2021 10:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610618558;
        bh=jU9Kx+SAyNRUMqcNs55vc7+Ly8dOmlGsSqJSE2JyKzM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Kef4hxpAHmkBqYvdjp7ixctbyFWoHqvvt5i8ubExMjEO9S6jRC0dMMs0/PEdO7a74
         MO4wKRrZWeIHCmbk1Pgjx/bktMIVF3+rNwHDIl+m4Zl7UTILvnAqLvwf/mCAHxh/9E
         Dw6dmwSH7KYjAuw0lBkgPKi25yjblVo32GBjplEtZ72l6oCu/waSQt6a27qVnA62w9
         6Sz8YKt4l5NDPVRuxU6DSrj2zh/NvKqF9ecp5f3qCF7MYjb/no9XU7IC+Q4/ZV3ltM
         GO/gewU9knYAtodCtm4jW67yuPNwDY2WafLCJttsmBfwf5IGh+FbQPKKr/b+M3/vpN
         Xq96Py9+b9ndw==
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v6 09/11] usb: dwc3: gadget: Implement setting of SSP rate
In-Reply-To: <1bbbb6cd0d80696c0b1c112a225dad0b0efe8b91.1610592135.git.Thinh.Nguyen@synopsys.com>
References: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
 <1bbbb6cd0d80696c0b1c112a225dad0b0efe8b91.1610592135.git.Thinh.Nguyen@synopsys.com>
Date:   Thu, 14 Jan 2021 12:02:31 +0200
Message-ID: <871ren3kg8.fsf@kernel.org>
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
> @@ -2476,6 +2506,17 @@ static void dwc3_gadget_set_speed(struct usb_gadge=
t *g,
>  	spin_unlock_irqrestore(&dwc->lock, flags);
>  }
>=20=20
> +static void dwc3_gadget_set_ssp_rate(struct usb_gadget *g,
> +				     enum usb_ssp_rate rate)
> +{
> +	struct dwc3		*dwc =3D gadget_to_dwc(g);
> +	unsigned long		flags;
> +
> +	spin_lock_irqsave(&dwc->lock, flags);
> +	dwc->gadget_ssp_rate =3D rate;
> +	spin_unlock_irqrestore(&dwc->lock, flags);
> +}

it would be best to make this return a value. If udc_set_ssp_rate() is
called with invalid rate, UDC can notify core.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmAAFrcRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQbuGxAA00trg+RB7K29mVt2/Ber2BZuTZV1WwUR
ueBEvXpoJOWXoKKBUXyMUMw06XCCg2NeTVfrHXBMFft+6ZmAcIwDQyMYyVCjFp42
7q47eKNTs0Itys5JT9xI0JPWY1OFMjSwQt46jNb1Hzi2xpHCCZMvv7Ihwbnuw55e
Hddf5hktCIpGT9MeL55NJ8vymh2bw85O9kCCrE5cJA9VaBaUZCstiK5zYW6O3JxP
s236ajWdMM/8pJ8PMN1zXHKRW5qziGdRG1qCfxNeiq1ovpTC9ivF3YMWr4Es9yfB
13ws/lJzaRVsJ/ytkwc2K9dJvkz4RyScI4bOJR+maXX2ygzNwxRbACDdtcpc7nLY
A/e9PDghDhqLOXMgxBtwzBfB1ZmkiSToG+XAE/yI74CW+NJ90Ee9mQWXoZ7vjocB
p++QgtYxJl9XpGzXCGUDNc63YzBzuDEwWNxSgyr/JSkbMd+NeoHRiMRFLLNZw2Pj
6Qcsj0umNZ/rjsLXsxYZBYbcQF+hVv4eG0xLHzjtqCcwB3Fp7BZLHcv0EW0Z8OFl
0oa30BA9fU2rDUzyv1WFcMbiVgMZ9WB9IjVVJexvxw/fqbdzSBKujKEuyqIH9Og3
tiXXoyuqD1+hGwRNMXXUwZtVwAeSU3nJ4YLmJ8kOo1WmVxrE01A7gPYXX+UvPHr4
9xPsm1lInBk=
=Gewb
-----END PGP SIGNATURE-----
--=-=-=--
