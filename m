Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED19F655CE6
	for <lists+linux-usb@lfdr.de>; Sun, 25 Dec 2022 12:08:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbiLYLIg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Dec 2022 06:08:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiLYLIf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 25 Dec 2022 06:08:35 -0500
Received: from relay19.mail.ox.ac.uk (relay19.mail.ox.ac.uk [129.67.1.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EC1E5F88
        for <linux-usb@vger.kernel.org>; Sun, 25 Dec 2022 03:08:32 -0800 (PST)
Received: from smtp8.mail.ox.ac.uk ([163.1.2.204])
        by relay19.mail.ox.ac.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <dima.pasechnik@cs.ox.ac.uk>)
        id 1p9Orl-0007jn-9h; Sun, 25 Dec 2022 11:08:29 +0000
Received: from 183.red-88-24-108.staticip.rima-tde.net ([88.24.108.183]:40226 helo=hilbert.cs.ox.ac.uk)
        by smtp8.mail.ox.ac.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <dima.pasechnik@cs.ox.ac.uk>)
        id 1p9Orj-0000a4-Sx; Sun, 25 Dec 2022 11:08:28 +0000
Received: by hilbert.cs.ox.ac.uk (Postfix, from userid 1000)
        id 388D0741515; Sun, 25 Dec 2022 11:08:26 +0000 (GMT)
Date:   Sun, 25 Dec 2022 11:08:26 +0000
From:   dima.pasechnik@cs.ox.ac.uk
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        Mike.Spivey@cs.ox.ac.uk
Subject: Re: usb 1-3: Product: BBC micro:bit CMSIS-DAP not recognised
Message-ID: <Y6gvKlalZQGnIiuB@hilbert>
References: <Y6B8jd7dHsa85Wny@kroah.com>
 <Y6CRbgwHzjr2KNxK@hilbert>
 <Y6CpKxZ4KsiYttbL@hilbert>
 <Y6Csfzqvy6GExhVB@kroah.com>
 <Y6DjwFAp4M8I+T4P@hilbert>
 <Y6D1j+AVp8YTJjCd@rowland.harvard.edu>
 <Y6Gz6wWb6bpz0rRb@hilbert>
 <Y6XAMmx7LjDn1J6R@kroah.com>
 <Y6Y/FB1IS6BrKsCW@hilbert>
 <Y6aiAtZUd56VfS8i@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Q7+jHLoY2orbCZAf"
Content-Disposition: inline
In-Reply-To: <Y6aiAtZUd56VfS8i@kroah.com>
X-PGP-Key: http://keys.gnupg.net/pks/lookup?op=vindex&search=dimpase@cs.ox.ac.uk
X-Oxford-Username: coml0531
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--Q7+jHLoY2orbCZAf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 24, 2022 at 07:53:54AM +0100, Greg KH wrote:
> On Fri, Dec 23, 2022 at 11:51:48PM +0000, dima.pasechnik@cs.ox.ac.uk wrot=
e:
> > On Fri, Dec 23, 2022 at 03:50:26PM +0100, Greg KH wrote:
> > > On Tue, Dec 20, 2022 at 01:08:59PM +0000, dima.pasechnik@cs.ox.ac.uk =
wrote:
> > > > On Mon, Dec 19, 2022 at 06:36:47PM -0500, Alan Stern wrote:
> > > > >=20
> > > > > It might help if you post the output of "lsusb -v" for this devic=
e.
> > > > Please see attached; I also attached the output for an older versio=
n of
> > > > this board (V1). The one we talk about is V2. Both versions have the
> > > > same VID, and, weirdly, the same PID (internally they aren't binary
> > > > compatible, even)
> > >=20
> > > That's horrible, someone should talk to the vendor here and get them =
to
> > > at least bump the device id.
> >=20
> > The vendor is ARM (https://www.arm.com/) - I guess Linux Foundation is =
a good "someone"
> > to talk to the vendor in this case.
>=20
> I do not understand here, are you asking me to talk to someone?  If so,
> great, who?  If not, who are you asking?
>=20
> > Can PID be bumped up by a firmware update?
>=20
> Depends on how the hardware was designed.  Most can, some can not.  Is
> the hardware design and firmware source available anywhere?
As far I know, firmware comes from
https://tech.microbit.org/software/runtime/

As to why these V1 and V2 happened to get the same product ID, perhaps
my colleague Mike, in CC, who teaches a course using this board,  knows mor=
e.

Cheers
Dima

--Q7+jHLoY2orbCZAf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEJVdDnfI7raAa4RJxoksLHjfJBTEFAmOoLyoACgkQoksLHjfJ
BTEHXgf/a5qiRFWxOpKvkngU7lgzLQY6prAG3l1BPcSdEyHKEJlmZVE/BCvOiadr
qdoeGk7B0NOadJ+iVqW9TRMPP9E1NS/qm0OEr2h18YSIOrVtYgFp37bVqP5rrHU2
ZHXQ+EEtuMTI/wt7gP26LAx713m2kGzZCIrr4Dll4wr4XjJNi50LtfMjpyxFjYBB
Qavx+I3RgDFNcj9zXcys6V8fMaZMw6wGNpxWy2wppVAo2QucK6jEQS5L9XyBMfsj
pnn7dG1OIQ80nr1I05uK13YTNMqOvMFV1cLR4qF4n5r0Afe87W2DIXgmkkaEqglu
JsYO1UhmKyHNAUdNOCwcfpIDnKSGng==
=MDwh
-----END PGP SIGNATURE-----

--Q7+jHLoY2orbCZAf--
