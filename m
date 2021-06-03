Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D409239A33B
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jun 2021 16:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbhFCOdj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Jun 2021 10:33:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:40980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230138AbhFCOdj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Jun 2021 10:33:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 85F27613D6;
        Thu,  3 Jun 2021 14:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622730714;
        bh=UBGXyk7ndE1fjGtd1mk2Nb/rz7PShvOAUKYBA1ioxAk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=O85rqZ7VNFYMK64oa4F4keq3dXEYTMJS/DERypZpETQ2uI1E9BFlhS16jkYjZCLnx
         fN2zaYVHeHuMYSyTnE06SaqF218lpnmWxzF0rAqUvIOw069ZyZA6TlgY7RI2vXUwWA
         SXK0jtDCF20CkN8k5Yk/6sAt8m49TksQLVz2N00NrwL9EbQwTgg9ifPWPZ+3A3MJg9
         p8ixzKvwrz0iP00/7RRDDnfGsw3XmvG9daBObc37km2N4IcHjjnOoTDU1AVJNnEKdj
         Ivi9w6dnT9CRPSYsxCapH9QIQXOHBtPSLc3bjlOLPNDtaJsDN//hJYZxjBpQwx2z4G
         xMRLdNXe6NAAg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Cernekee <cernekee@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH] USB: gadget: bcm63xx_udc: remove dentry storage for
 debugfs file
In-Reply-To: <20210525171508.758365-1-gregkh@linuxfoundation.org>
References: <20210525171508.758365-1-gregkh@linuxfoundation.org>
Date:   Thu, 03 Jun 2021 17:31:43 +0300
Message-ID: <87fsxzc94g.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

> There is no need to store the dentry pointer for a debugfs file that we
> only use to remove it when the device goes away.  debugfs can do the
> lookup for us instead, saving us some trouble, and making things smaller
> overall.
>
> Cc: Kevin Cernekee <cernekee@gmail.com>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmC4588RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUgpGgf8DbcQpPZ1fLAvCTQqsZBSFThA6ZNbkq+f
nw70XCpLWu3MTKaxTGTP8zG397Yaiv+RiVTx+t7xfvqSY3HJyJ/WKruLerXI/k5d
wEXxsQo4rjFQiS5zgRGkLBWL5Kwi9IGnb7/NNRDuNp1Z/iRUi3YGhHqRLxnqgdkC
B6S2gcL7J/pUvhZj5vV1LEf4YsZ9PPAyQscpKvZngVeEbRE9QdfN0bck48wC+Eix
HQhMh/Ie0vIbrmWuMBBORQwYdf7mSkyW87DN1C3D6k/TTZgSrv8V2BZSFFQKYx/8
kzhixzolRQLf29EbIx30JOiumvjSQsjuaQo/D0rhglnZQ10kbnZEUg==
=ot3V
-----END PGP SIGNATURE-----
--=-=-=--
