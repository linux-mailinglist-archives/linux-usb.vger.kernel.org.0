Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E79F388D7A
	for <lists+linux-usb@lfdr.de>; Wed, 19 May 2021 14:05:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353323AbhESMGq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 May 2021 08:06:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:42626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353318AbhESMGp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 May 2021 08:06:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E4C5611AE;
        Wed, 19 May 2021 12:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621425926;
        bh=iSCWZYWaw3uM3/QS5/rwwqvKkCKm8OAxVR4+lzlsz9s=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ZhNIuozipxhFsMUIdDY3UUwfd5FGu3OhFb8BrEB3o5berYfIbW2H1fJ2UV6W0XBBN
         Hik5uX167TXUHI1ULehJTJ4B4CVYRPR8wZw8K2Ms+wCKvJupPMbpRc6hKoC2PW1Jr1
         iX5JXbeLYF5vkLE5uuefgrF2CxkZNOv3+7rdnV9V6oBrWYH/pzXC9SQBNHyQXW77K0
         Y/GTZPsyuwaRPyyx0k+ZxdECfDKIEL8ykFEIsN/FhmLBdWdfnPFuhcjCCM+8ys5RVM
         RC1qmSwo/m4nkSSaIPBJASXRjUpiJADQIHcFUZ+rxDM0EXRS8lN2EtDwIKFtwrNYw7
         P0/8LWIqbK5Qg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH] USB: gadget: lpc32xx_udc: remove debugfs dentry variable
In-Reply-To: <20210518162035.3697860-1-gregkh@linuxfoundation.org>
References: <20210518162035.3697860-1-gregkh@linuxfoundation.org>
Date:   Wed, 19 May 2021 15:05:18 +0300
Message-ID: <87k0nv9bep.fsf@kernel.org>
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

> There is no need to store the dentry for a fixed filename that we have
> the string for.  So just have debugfs look it up when we need it to
> remove the file, no need to store it anywhere locally.
>
> Note, this driver is broken in that debugfs will not work for more than
> one instance of the device it supports.  But given that this patch does
> not change that, and no one has ever seemed to notice, it must not be an
> issue...
>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCk/v4RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUisVQf/bMj5L3hVzqUCdm3LORdJdzYELdm4Z6yR
FFvNlxR7ziqQaV5Lwdy9lgqVeCTnht4SusmIsCLTiWSI388KptQyrDkXIbffexn8
MXZien9Yy2yUO4HqNCT6XtyfGOCC+uXvOYBMxDblHttv41/e0UK95yGQjz7cCfbh
AtC9LdTtD6emwW3Ri09JtOqYi7eV3uFrRq+5d4w5bfw6hH2gaf/EhGatrxiyir84
VSu+K8WeDmxTyTEHNoNYheMZDD06vRSHmPnmy7I/ccu41W2XIJUZtS0WYxe+qb9A
2X6wmYVveLSpultTM7Rm9Ktn6rfqFhwaQqtEBE6dKaG+TKzKfmwGgg==
=kV26
-----END PGP SIGNATURE-----
--=-=-=--
