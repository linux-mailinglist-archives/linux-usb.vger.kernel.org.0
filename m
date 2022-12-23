Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D50C655646
	for <lists+linux-usb@lfdr.de>; Sat, 24 Dec 2022 00:51:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbiLWXvz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Dec 2022 18:51:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbiLWXvy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Dec 2022 18:51:54 -0500
Received: from relay17.mail.ox.ac.uk (relay17.mail.ox.ac.uk [129.67.1.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DDC1265B
        for <linux-usb@vger.kernel.org>; Fri, 23 Dec 2022 15:51:53 -0800 (PST)
Received: from smtp9.mail.ox.ac.uk ([129.67.1.206])
        by relay17.mail.ox.ac.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <dima.pasechnik@cs.ox.ac.uk>)
        id 1p8rpP-0004gO-3e; Fri, 23 Dec 2022 23:51:51 +0000
Received: from 245.red-88-25-31.staticip.rima-tde.net ([88.25.31.245]:41060 helo=hilbert.cs.ox.ac.uk)
        by smtp9.mail.ox.ac.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <dima.pasechnik@cs.ox.ac.uk>)
        id 1p8rpO-0005Be-TC; Fri, 23 Dec 2022 23:51:50 +0000
Received: by hilbert.cs.ox.ac.uk (Postfix, from userid 1000)
        id B4518741515; Fri, 23 Dec 2022 23:51:48 +0000 (GMT)
Date:   Fri, 23 Dec 2022 23:51:48 +0000
From:   dima.pasechnik@cs.ox.ac.uk
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Subject: Re: usb 1-3: Product: BBC micro:bit CMSIS-DAP not recognised
Message-ID: <Y6Y/FB1IS6BrKsCW@hilbert>
References: <Y6Bfx+Ksm/Qz3N8y@hilbert>
 <Y6B8jd7dHsa85Wny@kroah.com>
 <Y6CRbgwHzjr2KNxK@hilbert>
 <Y6CpKxZ4KsiYttbL@hilbert>
 <Y6Csfzqvy6GExhVB@kroah.com>
 <Y6DjwFAp4M8I+T4P@hilbert>
 <Y6D1j+AVp8YTJjCd@rowland.harvard.edu>
 <Y6Gz6wWb6bpz0rRb@hilbert>
 <Y6XAMmx7LjDn1J6R@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ozlq6XiIV36NLqtR"
Content-Disposition: inline
In-Reply-To: <Y6XAMmx7LjDn1J6R@kroah.com>
X-PGP-Key: http://keys.gnupg.net/pks/lookup?op=vindex&search=dimpase@cs.ox.ac.uk
X-Oxford-Username: coml0531
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--ozlq6XiIV36NLqtR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 23, 2022 at 03:50:26PM +0100, Greg KH wrote:
> On Tue, Dec 20, 2022 at 01:08:59PM +0000, dima.pasechnik@cs.ox.ac.uk wrot=
e:
> > On Mon, Dec 19, 2022 at 06:36:47PM -0500, Alan Stern wrote:
> > >=20
> > > It might help if you post the output of "lsusb -v" for this device.
> > Please see attached; I also attached the output for an older version of
> > this board (V1). The one we talk about is V2. Both versions have the
> > same VID, and, weirdly, the same PID (internally they aren't binary
> > compatible, even)
>=20
> That's horrible, someone should talk to the vendor here and get them to
> at least bump the device id.

The vendor is ARM (https://www.arm.com/) - I guess Linux Foundation is a go=
od "someone"
to talk to the vendor in this case.

Can PID be bumped up by a firmware update?


>=20
> Anyway, I don't see a "serial" device here, just use the cdc-acm driver
> and all should be ok, right?  Is there any missing functionality that
> you feel is required that only the usb-serial api can provide?
Not at this point, no. Perhaps I'll resurrect this if I find something
out.

Best,
Dmitrii

--ozlq6XiIV36NLqtR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEJVdDnfI7raAa4RJxoksLHjfJBTEFAmOmPxQACgkQoksLHjfJ
BTG9ugf+K9jivhQysq/fwTaL8ISeuSFZ9QGR7zUaBbC0i5fJdObRs+XEVzzbgrbW
szd/HTrOyo4UydEM1nCHT0ueY8apU21eqEHBX/DQtJr7a5GtG/qXcwXWdv+Nj18g
kSfb/iNyEaCt/8Z2umS/3TC8kmpVIbi/AM4o7GwcEQSpZwsXT5B6qkYWPdWmcGrD
vRglmPaIW3khLXCr3IUgPjUgUh/gxdtkwGpkUvJcniGKankRPXECVwuY42osNf9q
qEH8VOv+FEy27CC0NRuNUgYrHZOz0z+Jf5SViaZp54xV15N8w1mSVWjnKEZPH/yN
K+ZGIZhMTFigu6KsYOp0ZNjsnHLjkw==
=1lR8
-----END PGP SIGNATURE-----

--ozlq6XiIV36NLqtR--
