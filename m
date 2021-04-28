Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ADD836D5A9
	for <lists+linux-usb@lfdr.de>; Wed, 28 Apr 2021 12:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238227AbhD1KUo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Apr 2021 06:20:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:40756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230248AbhD1KUn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Apr 2021 06:20:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C63A61428;
        Wed, 28 Apr 2021 10:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619605198;
        bh=jbkHIHx1DWXxEEcsBljQr2fn3r/+D6aBwbDJO+PvR4Y=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=NFe2zg1oE7spN9A4Ph0eYVX6KvQp2IwQ+xVLzXm2jIVgqcNS1uRF0MDFSgVDCcgkg
         wiJKF9QzhSjasE6k+TO1v3mfUx6RVWr8DbnUnpjJ8B3bzAQYKCNnzEb0YMsL93sVQw
         n9IapThD6qbZNdgFOShILdH5cGaSxAVe/Sn87mqRSk8Z7ntIbBmWGd7+LYjuJ7J3iO
         FcGPxjvf+uaUdeI/g+X1nQgyqEwMSWR6bg8aohrxnYo2e2SVp0Bg83lubc/edIoh50
         tU2X/a2ua3rcOcMuJWzpxoOqTnP56l2DvdsTRWhHIT68HuiCbJwTAcHTAwhZFAgoDs
         L1sc0QEb9a6Ew==
From:   Felipe Balbi <balbi@kernel.org>
To:     Jack Pham <jackp@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     linux-usb@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Jack Pham <jackp@codeaurora.org>
Subject: Re: [PATCH 1/2] usb: dwc3: gadget: Enable suspend events
In-Reply-To: <20210428090111.3370-1-jackp@codeaurora.org>
References: <20210428090111.3370-1-jackp@codeaurora.org>
Date:   Wed, 28 Apr 2021 13:19:51 +0300
Message-ID: <87h7jqk8xk.fsf@kernel.org>
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

Jack Pham <jackp@codeaurora.org> writes:
> commit 72704f876f50 ("dwc3: gadget: Implement the suspend entry event
> handler") introduced (nearly 5 years ago!) an interrupt handler for
> U3/L1-L2 suspend events.  The problem is that these events aren't

look deeper. They *were* enabled. We've removed because, as it turns
out, they just add a TON of interrupts and don't give us much extra
information. The only reason why the state change interrupts are still
there is because of a known silicon bug in versions < 2.50a. That's all
documented in the driver itself.

For anything that works, we *don't* want link state change interrupts.

> currently enabled in the DEVTEN register so the handler is never
> even invoked.  Fix this simply by enabling the corresponding bit
> in dwc3_gadget_enable_irq() using the same revision check as found
> in the handler.

More importantly, *why* do you think you need these interrupts?

> Fixes: 72704f876f50 ("dwc3: gadget: Implement the suspend entry event han=
dler")
> Signed-off-by: Jack Pham <jackp@codeaurora.org>
> ---
>  drivers/usb/dwc3/gadget.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index dd80e5ca8c78..cab3a9184068 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -2323,6 +2323,10 @@ static void dwc3_gadget_enable_irq(struct dwc3 *dw=
c)
>  	if (DWC3_VER_IS_PRIOR(DWC3, 250A))
>  		reg |=3D DWC3_DEVTEN_ULSTCNGEN;
>=20=20
> +	/* On 2.30a and above this bit enables U3/L2-L1 Suspend Events */
> +	if (!DWC3_VER_IS_PRIOR(DWC3, 230A))
> +		reg |=3D DWC3_DEVTEN_EOPFEN;

look at cpu usage for dwc3's interrupt before and after this
IRQ. Specially when connected to a host that fully supports LPM. IIRC,
recent xhci should trigger state changes fairly often.

Still, why do you think you need these events?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmCJNscRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZWVA//ZV0U+Zr6lt4RHbE2chH3bpUu5GxV7E48
Z3Pq5FeLFgAoHDuBKj3HNGqBAOu+hyKG7FLpxVczgk3k+4yWVw0YQAbvFJToakuK
95dWqMuRw1S3eWPNjgZkg6+fA6BVDcGFFWX9Thd9VUWg/pzJ3tu6ybdX0j+1UFdv
GBpbazO79erg9fLXXTSayk1lQH+D1+DSlxf4+yz+iKFyechhZO+Ac5z9rEw1t1Sz
1G8B8GqVv7MBCJDAq52IKxEHL70KnJPt4W3qVx5D9b8TYYi8XGIGlaGlBx6S6zXh
cmhj4YubTwHJ0J/r5GBMz9rJsb6rZQuQo1d6f9hYi1Spftr+xXqJuCeNasimkqDL
D5sTgzyvutbRaVCZw3EnFrJC0EydZXA9CmOK94cAjqCE1HmL8vz8dXEWwlfCT72Q
6uh/hp35fxSkMFOm5JsA5zbdAozJbMyEzEKRo8jet3vpiuqL+QgT2nPIyPA8f/lX
iHquD6utWN+0JYq+SyZoxb1MpPOzarKTCzx0QseKHaI3iFsTN6fQhQpRd5TePNiy
+Xxj611Y9oHuOh4wUjX+3Y8jlDsqivMtrwEIONSV1r8M0oVEBeJXS67z/f2U+VY4
bnfTctkJ9AVMfJvbb4DNn0L3qKsqCL6mT7ZCs27QZdnzfC3h3yKNv9HCaUchANkD
/47SiKNurXM=
=CeLd
-----END PGP SIGNATURE-----
--=-=-=--
