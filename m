Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED5B3368211
	for <lists+linux-usb@lfdr.de>; Thu, 22 Apr 2021 16:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236939AbhDVOCh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Apr 2021 10:02:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:46234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236904AbhDVOCg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Apr 2021 10:02:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E9F1608FE;
        Thu, 22 Apr 2021 14:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619100121;
        bh=uwamKFZXuV2UAWzgczHSeB2NS3jfT5Grt9vZszsyoRM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=JonE4GMA/5tmk7j8wXNCR8INjQRc3E6HhyRkBajZf5m8eYyOUc3amDv8ab2a+fSEx
         KyJnuxAZlnMiTBzyDULYGYLvy3WbfqOW9VQEE0AVVP2mYuNnBjpXFi64vbCpOmUp/y
         YWmWH66UsGJX0M/1PuAaFn4dgPsceLd4ojwZbOvYBtwmgOb1uy+vuqOpEZUd2wCm54
         zToNdo19ozOXlAFlw/7FePmH26F+LMJ3ozBzcqJxPTL1QkeLTqx620yihp6pQCPgQW
         zsckw+alhErDuU2AfH4+9IU2tmNJI670BQ4eHyIQ9I1lfMzmZh5POqY497X62xK7y1
         qCV4pT4muJiRQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>, gregKHusb@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH] cdc-wdm: untangle a circular dependency between
 callback and softint
In-Reply-To: <20210422134555.6510-1-oneukum@suse.com>
References: <20210422134555.6510-1-oneukum@suse.com>
Date:   Thu, 22 Apr 2021 17:01:54 +0300
Message-ID: <87a6pqmn8t.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi Oliver,

Oliver Neukum <oneukum@suse.com> writes:

> We have a cycle of callbacks scheduling works which submit
> URBs with thos callbacks. This needs to be blocked, stopped
            ^^^^
            those

> and unblocked to untangle the circle..
                                      ^^
                                      .

that's all, just minor nitpicking in the commit log :)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmCBgdIRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQa16xAAnK8umxklraJZVC8NeBZhrw1kIWbzvpIi
AKzlyMmYSHyIew6JW3C/NgEfS5JSu7UQl8mFUX+kJSvDE2UTlhJYkLENShz5yIP7
/avHpH7K+d2IzNJMIk/J85tPXFPyHyRVgbBOfMQFjljcoBQtAPO3UrD1BV674oUN
hjAKv1L9Sh7I/sHlE/nwZVa7b6FyGHkQQgQgBJorTU0N+0EHZX1Hc5ux0X0xzAsD
7tnHO0D8aO9uXd/DDlxlF36QsALLs28XJsHKYa7paSTC89TNWl1bpbB/FnuzBccR
KSYGC9ntRwltrwoCJvySr2hYgyqFsqwjbh6t0m6W6DUARKPDCAW2C4f31tpTinPI
BQq1EA9d5B/M62vFIsw8dXWbiPJHL39VXOg90ieyQMGDJSKw9rxOy4jJu/PUGmw4
dtHIJi3r1oFJ7F/NWwIb1Qp7ffF8ri9SxajGTMEBPiyCVD7VcWggAMsi6uAC8EXZ
Bvpn4o/CAMzS0uSJVWDlQq8FP5QzmcRGmXhFyUbDv89MGexdqVu3pwe8Mhepb7o/
UmQ74xHSOBRdhL3Jk5MtDBzFnziz+PxahLMyqX11pZ63iMpJU3loFIUev7n1bEh1
5HObv0AcHgE5N4xXbm9Vm33GtGUSndPkXHnqI+bOIDYpKaWMcClBalrQzmCoXehW
EzTNftoyDV8=
=88uw
-----END PGP SIGNATURE-----
--=-=-=--
