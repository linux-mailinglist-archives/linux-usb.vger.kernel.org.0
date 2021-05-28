Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABD0F3940A2
	for <lists+linux-usb@lfdr.de>; Fri, 28 May 2021 12:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235876AbhE1KIH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 May 2021 06:08:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:43450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235361AbhE1KIH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 28 May 2021 06:08:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A07C96113E;
        Fri, 28 May 2021 10:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622196392;
        bh=FSmE0n6zis93vj/8pvAs3cEogx10ogp//zjZrNb+CFc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=KuJ2kf5+3ROlNzpBlH9AW+INU9Vw9QfzPxCbbA1WKTcGEeEsn0k7RHiUQzSu21wSG
         fNfzgHqIRKGJYn+jwqb1lF6cLrMjuHZ5lsrthLf1udIuutAnOxFNaOwYPXkjWlBo7m
         FT22vhWdjaIhPMI+92c9LwG6x25CXwGRNm5p7iq0lETSarM5MaHylLLCvxjn2vaHQe
         J0lq+7phOLI3qY0Xbr4WlzHu4YY7bxT6Un5op2aqUjOl6Z3t/n9BUfWHTXaq4H0FXZ
         OI+7mSsQy+LnjntWM0Dj8RbTZ+rFZfPN/0g8W6QdFE1Asi/+p9S+naJi9zgbGB1ZTx
         +gSwMTY/O+NiQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     linux-usb@vger.kernel.org, Mayank Rana <mrana@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>
Subject: Re: [PATCH] usb: dwc3: trace: Remove unused fields in dwc3_log_trb
In-Reply-To: <20210527012924.3596-1-jackp@codeaurora.org>
References: <20210527012924.3596-1-jackp@codeaurora.org>
Date:   Fri, 28 May 2021 13:06:21 +0300
Message-ID: <87y2bz9nqa.fsf@kernel.org>
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

> From: Mayank Rana <mrana@codeaurora.org>
>
> Commit 0bd0f6d201eb ("usb: dwc3: gadget: remove allocated/queued request
> tracking") removed the allocated & queued fields from struct dwc3_ep
> but neglected to also remove them from the dwc3_log_trb event class's
> TP_STRUCT definition which are now unused. Remove them to save eight
> bytes per trace event entry.
>
> Signed-off-by: Mayank Rana <mrana@codeaurora.org>
> Signed-off-by: Jack Pham <jackp@codeaurora.org>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCwwJ0RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUhlVgf/XOcgmXWRezBMkF3xuTk4WsKFDt9nBst0
1GLZB6M/qXg+n4Nvoa7iv4C4Md5nJFROpZChGxARXyJusK1FNXY5y/teaRWQAO5e
ISyM6q26+9rumu0WYkHqXWSqVpMzwDp2595yr8kiDCBlGa2zmnVys7n/173B78Q0
jkzXnvha5YS7+lN6X4298DpoRbT7wPQAYoDB3BxL+RpqYaMthdOP9FBJw2tUUmNg
gXN2SwMVV9Eva2PdaHxobYNidjpe/RFkdYjnZsoureHiAACxhO4h1l7fvd25apaK
MYo1kw/g9FGSOP13+8LAgmVvn+ONBgDsW1V0byFUwrMaHRpwr/vPDg==
=QVQU
-----END PGP SIGNATURE-----
--=-=-=--
