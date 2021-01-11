Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFBAF2F1777
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jan 2021 15:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730226AbhAKOHB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jan 2021 09:07:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:59710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388476AbhAKOGz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Jan 2021 09:06:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 72A262071C;
        Mon, 11 Jan 2021 14:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610373974;
        bh=SVyoGsxgsyx3sjZbfsKtoTHspzMeS5/7axBuJTwpsLA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=EaDqD7/5WqWDCCvPFDZUB/Z2gjztwJfg5Bh7t6sf7GMsRkUTpty8Pks7/6s1AS9QS
         V5y1t5wu9qnJTjZr0qsvSxuZmMYieBGXkULPEd660uKCmMlU0LRmR/qDlagr7YME7w
         7lZI+m5sDWlBDCo8mD8SuhZud6f7xOwIANvZJ8V+wfPwwvLhduJwrKKipo/S97sv7N
         E4mIZjNY10Q7dFAMt0ej1oQlyuiXVXa92gBu/U4l2nS3n6lGrOdrg5OUnz/tgfkzNc
         DeXZlgh5rFNjRPpDNS4yAJQPmJkYv6M9DCzSED7WtqLWppJyaVmS79f0Ly5lc2dHfx
         pHp9i1rP74Xmg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [RESEND PATCH v1] usb: dwc3: Simplify with dev_err_probe()
In-Reply-To: <20210111135458.57084-1-andriy.shevchenko@linux.intel.com>
References: <20210111135458.57084-1-andriy.shevchenko@linux.intel.com>
Date:   Mon, 11 Jan 2021 16:06:08 +0200
Message-ID: <8735z7601b.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

> Common pattern of handling deferred probe can be simplified with
> dev_err_probe(). Less code and the error value gets printed.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl/8W1ARHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZEGhAAtVW1nkgKEedT0H2S0spU/zIU8ltaVEJL
ISmYzdjU8Fb3a032d0uY+d4Rg1qlDaKf7RJbCvHOL4O5NQ12lcIhE3Lf3MpCunt8
qlZKTFqjAqAVei2yTIzmTDjZ5oFwtzPmHHSlAS2KHcgHpOMCwQBu/E2UPFV1WgQ6
WjF2kwYLwUsMZ8dLXQlOSDRgAmTVmFYKgSstdqPVU+1HqNTPDHq6kdGf/SkLCgON
pqqz42mOJWolAXo6UA6JtUYOSI6wmPwyQZiblIrzheuhlAFYl0bFPQK7eE8mMfja
LWHQsYCewZClSyw3H8D8udyeu1L+dn2qNBt5KuM14izTjTqq4fFKeLQuL2fTQEoM
cgp0Fl8KP6kpd4UF+8x2ONJRFUD0NzPb/4TFXPAXkewAemZZexnPVcO3JxQZuSFq
oXys+KO7WItfPQu0bBLjNOFgMij2b9o9FDEyoQH+4p7wlS6aSs2pNNuNNhwXTBRx
YUYVSZKi0E9UhwCf0C4bgRw0lr5wKd9q6J0rolAoMPRiZi5k0ptl42BRtwcC++4s
D73cdt1A4JERtO2v5qdRCh+gainx00jn4rdtVQU5ZE+mypPI0eKVK6ovgcAeEmd8
7NksCmJSQoydmcoEd8+zDXTxjq/jRrR06h65kcJVvCTzdKW3/Qcv9IkdMl/6pLP6
CXoBXDdAFzo=
=oqTf
-----END PGP SIGNATURE-----
--=-=-=--
