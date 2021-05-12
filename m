Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54B7837C074
	for <lists+linux-usb@lfdr.de>; Wed, 12 May 2021 16:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbhELOnL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 May 2021 10:43:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:33378 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230481AbhELOnL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 May 2021 10:43:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0361D61370;
        Wed, 12 May 2021 14:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620830522;
        bh=zoXrWdrhFqdeF8H24gQ4Bk6xz73k5SBh9T03FYjRc1s=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=p832TjypP1xlNSEVzTk+jNOPrr5s9fJZjiSFLMhrQVuv+WQS9F0Z4xsoi+cX012mI
         t2oWzEPDL0aQbmaB9ahLaqc7iGD8RG/y5LeshQdsgrQ8ceC+aYbWHrxOf2rlJkSFj1
         fP/++HqWbd5Dy77R/tkzgN2X8uW0IC8uJnfuaZBowy9sF4sj17/p86hpI+joLumZRO
         FMYAnuS5HdCwiqakkxEPTfTkEFcf5d3MPgIAgZeGyBpWpoeZdkH1+X0oSKcDcMMeW8
         6aY+/b3Vwl9W3tf9SdGNI9LxOveJ8X8OKrKOh22uVyzqiB1yW7tKGjYGh1K5xWl42f
         TQjvcr8UBbTMw==
From:   Felipe Balbi <balbi@kernel.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: pci: Fix DEFINE for Intel Elkhart Lake
In-Reply-To: <20210512135901.28495-1-heikki.krogerus@linux.intel.com>
References: <20210512135901.28495-1-heikki.krogerus@linux.intel.com>
Date:   Wed, 12 May 2021 17:41:53 +0300
Message-ID: <87zgx06mku.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Heikki Krogerus <heikki.krogerus@linux.intel.com> writes:

> From: Raymond Tan <raymond.tan@intel.com>
>
> There's no separate low power (LP) version of Elkhart Lake, thus
> this patch updates the PCI Device ID DEFINE to indicate this.
>
> Signed-off-by: Raymond Tan <raymond.tan@intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Acked-by: Felipe Balbi <balbi@kernel.org>

No functional changes whatsover, this can probably wait until the next
merge window.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCb6TERHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUjBPggAr8BMqgVoFynCvJ85rf9Q3uMP+H/dOvNy
0Mg7q+5ugJx1drFmeittQ2amp/JdvqtR/wFlMXYfjoYITjIArIee/eIY0H0hLdb6
qnbkLT7HXCTDgEWYGJ2Xp3EPPmHbXv/gZ4U+715cAOR1YzpswLkvpOUMkV9v8plJ
xApY/hAtphN2DmhHN7FgNr546ZDxbZl0qnJyg0bZ0oFuUYUQuq1gkKBq37e6zf+4
t7eepqTL2P7ZlJAoKjalmxrDsqFq3LHo2B1KUA46BW4RP2LgsEaUwRbaPKR6yZJd
DSuRwaJDz7owfBxJwUvBMP75r4EUMJKOfQiHJiQEiN0clLopeF+SlQ==
=c5mW
-----END PGP SIGNATURE-----
--=-=-=--
