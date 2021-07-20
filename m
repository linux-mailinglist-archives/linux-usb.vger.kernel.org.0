Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 993593CF6DD
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jul 2021 11:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234987AbhGTIvk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Jul 2021 04:51:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:50082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235221AbhGTIvb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Jul 2021 04:51:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32E4A6120E;
        Tue, 20 Jul 2021 09:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626773524;
        bh=NulRQ3zUKR8aAwexOGlaRx3orh8S6asBHeLvBNkiWbw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=LMFEAJVRLgSZNOLKuQnrP85tu50JQrbhxl+2kWrVFPgyZhnOIak35QlEoDcc8fWhR
         0j3s7bkg1+ReYHysTiyY9LfL9f9J6UtF96KcsIdegX1+w4/iseNnXYLvQwyGXaKlsm
         y3/kKWQUO/z4iGEEALu1LEQgKDWRi7XCp2H3b326Ps53fyfNAaTtZ16eaBfkrFXfrv
         so146hoNoOCAVyQJ8RoOnEmdGBMQOxqOfntEFq/FgnxaXXFWqPHDsw7U181XrcC0Vy
         HLqVbjUtO4rvF4N+fS6IV5526gauoMbOfEfLjmjy/VVZsyAL730pb5KrGk1cwtPSq1
         ceLiJHiPR3geQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Jack Pham <jackp@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Jack Pham <jackp@codeaurora.org>,
        Ronak Vijay Raheja <rraheja@codeaurora.org>
Subject: Re: [PATCH] usb: gadget: composite: Allow bMaxPower=0 if self-powered
In-Reply-To: <20210720080907.30292-1-jackp@codeaurora.org>
References: <20210720080907.30292-1-jackp@codeaurora.org>
Date:   Tue, 20 Jul 2021 12:31:56 +0300
Message-ID: <87y2a1xreb.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Jack Pham <jackp@codeaurora.org> writes:

> Currently the composite driver encodes the MaxPower field of
> the configuration descriptor by reading the c->MaxPower of the
> usb_configuration only if it is non-zero, otherwise it falls back
> to using the value hard-coded in CONFIG_USB_GADGET_VBUS_DRAW.
> However, there are cases when a configuration must explicitly set
> bMaxPower to 0, particularly if its bmAttributes also has the
> Self-Powered bit set, which is a valid combination.
>
> This is specifically called out in the USB PD specification section
> 9.1, in which a PDUSB device "shall report zero in the bMaxPower
> field after negotiating a mutually agreeable Contract", and also
> verified by the USB Type-C Functional Test TD.4.10.2 Sink Power
> Precedence Test.
>
> The fix allows the c->MaxPower to be used for encoding the bMaxPower
> even if it is 0, if the self-powered bit is also set.  An example
> usage of this would be for a ConfigFS gadget to be dynamically
> updated by userspace when the Type-C connection is determined to be
> operating in Power Delivery mode.
>
> Co-developed-by: Ronak Vijay Raheja <rraheja@codeaurora.org>
> Signed-off-by: Ronak Vijay Raheja <rraheja@codeaurora.org>
> Signed-off-by: Jack Pham <jackp@codeaurora.org>

Nice catch!

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmD2mAwRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUiokwgAnHj872h/9d9BMtX+CfnZXnsqlqG4S68c
qml8WdroPJaLGBMUQtIZi6SGOkfM5rKxZr7wZIqEk4QcmT/r3QZID/SiBET6kqWa
Z6ZzUX3xX+U5LHaRerYP69Rq3sUXpfHDHaYLV/qP/GC1pNT/Z9MPiAnYMV/OvQYS
CO1xVeq0wC2crXCfO+Lm63dHiXRj1IZtRDTPfQnD1PuWJgOgfGzpx31/y2rDzZz8
q3b+YBHpqlDeLaXPo8tVYezPGbTOYKsUp6vBeCThSHh8gUfFTa3zMJcYME5G+yTY
UzLjDlNH+L9DFNJvow6fAiVNsO2ZvbIFq7jd0c2whCeBIM4NIlJmlA==
=eDWD
-----END PGP SIGNATURE-----
--=-=-=--
