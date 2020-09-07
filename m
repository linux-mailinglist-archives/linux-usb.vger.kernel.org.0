Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B36225F327
	for <lists+linux-usb@lfdr.de>; Mon,  7 Sep 2020 08:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgIGGZB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Sep 2020 02:25:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:52402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725823AbgIGGZB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Sep 2020 02:25:01 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4ACF721582;
        Mon,  7 Sep 2020 06:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599459900;
        bh=N/uJPTSaJnCC/iKMCzuMKFeVts2Yw/s4TN7JSR5nJFA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=cuNbbYGJ0Q9CJjAKjR16Xxjnsu5WqCVHGvGfXFTbr20k1pXxI1yFLFu7A5sle1tmb
         /ztvPTSGpfWUm80e9VmsHnhS0XxUX9gB6wBX4+ios/oAiRFOe2kE0dUmtrKW5sgoAG
         zHP9cCk1URj5LO2CfRDKIRCFCWXBIkXICrVHiOqM=
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v3 1/4] usb: dwc3: gadget: Refactor preparing TRBs
In-Reply-To: <66fa061307b6f4eff00fb279ae5130c3bd8720f7.1599098161.git.thinhn@synopsys.com>
References: <cover.1599098161.git.thinhn@synopsys.com>
 <66fa061307b6f4eff00fb279ae5130c3bd8720f7.1599098161.git.thinhn@synopsys.com>
Date:   Mon, 07 Sep 2020 09:24:53 +0300
Message-ID: <87lfhm14ui.fsf@kernel.org>
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

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:

> There are a lot of common codes for preparing SG and linear TRBs. Let's
> refactor them for easier read. No functional change here.
>
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>

email here doesn't match author's ;-)

> @@ -1091,6 +1091,65 @@ static void dwc3_prepare_one_trb(struct dwc3_ep *d=
ep,
>  			stream_id, short_not_ok, no_interrupt, is_last);
>  }
>=20=20
> +/**
> + * dwc3_prepare_last_sg - prepare TRBs for the last SG entry
> + * @dep: The endpoint that the request belongs to
> + * @req: The request to prepare
> + * @entry_length: The last SG entry size
> + * @node: Indicates whether this is not the first entry (for isoc only)
> + */
> +static void dwc3_prepare_last_sg(struct dwc3_ep *dep,
> +				 struct dwc3_request *req,
> +				 unsigned int entry_length,
> +				 unsigned int node)

I think some of these can be combined into a single line. Also, why so
far to the right on the line breaks? Could you keep the existing style?

> +{
> +	unsigned int maxp =3D usb_endpoint_maxp(dep->endpoint.desc);
> +	unsigned int rem =3D req->request.length % maxp;
> +	unsigned int num_extra_trbs =3D 0;
> +	unsigned int i;
> +	bool do_zlp =3D false;
> +
> +	if (!usb_endpoint_xfer_isoc(dep->endpoint.desc) &&
> +	    req->request.zero && req->request.length && !rem) {

spaces for indentation?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9V0jURHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQb8yA//UMGNytSvQ05R+hfN4giM45+zondS9M6r
s5Y5DyVOHQVK1jmPPE/s9NTOvlP56iqu2/game//B8JqAhTmg61wsXqHxXZX6IDs
tT1DdiNcEJw42ze482HiF/GRPPXOrWEtpy9TGXYMMzX1aEUuYNt/XqwpgX3F/Y+s
HNTk/+liSUOMV+lm3Js0nhRpZMtC5iV9jfSH2TZq+joWwDRITzwIbvX7E+BLa+69
cuYCRk4UbjWW98NdWpCi+yVHLjnlgZVT6kDXwjcUISVONNtsyC2jTGuz+6YskJkV
aYWdjxERtqUD9G2ONJfLK2gOqaF7ivF5b+PBtYNSaIE41Cr+BZh5DogmtTo5SMjD
YA8WLVPOpbkis90qEYBKdZjI4FlEmDX3UlSWlQhjsAr3gCGK+lKMSH9McFySexxM
9NNAvsY+ZiS6dFl6r07arQRzjlEgOvR5urhm3azBRB/s1fCO2qpyLfFmKHlyQlEi
jUt36tEZOJgKLIk/Npx21VaWcnN4AtLXGHWxNQIDUA38hAFy6V74uzPz+/Opkxhx
hEyRJ3niEosrGCmfAIcEb707fJcUHv4mkJstOyFbc8PDMRhc38jYOocvoTLgdsjC
Zv8Z2W9IZbjHA/tKEYcj6xThrES7pyzJvMbh4GplDGhNY3lnQi/u7aeb11kkXOAC
3/pMZgInXsE=
=+wrh
-----END PGP SIGNATURE-----
--=-=-=--
