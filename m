Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A201F25BBF4
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 09:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgICHuk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 03:50:40 -0400
Received: from zproxy110.enst.fr ([137.194.2.192]:55210 "EHLO
        zproxy110.enst.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgICHuk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Sep 2020 03:50:40 -0400
Received: from localhost (localhost [IPv6:::1])
        by zproxy110.enst.fr (Postfix) with ESMTP id BCECE81F36;
        Thu,  3 Sep 2020 09:50:38 +0200 (CEST)
Received: from zproxy110.enst.fr ([IPv6:::1])
        by localhost (zproxy110.enst.fr [IPv6:::1]) (amavisd-new, port 10032)
        with ESMTP id cqEi368UuEUc; Thu,  3 Sep 2020 09:50:38 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
        by zproxy110.enst.fr (Postfix) with ESMTP id 7985281F5C;
        Thu,  3 Sep 2020 09:50:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy110.enst.fr 7985281F5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imt-atlantique.fr;
        s=50EA75E8-DE22-11E6-A6DE-0662BA474D24; t=1599119438;
        bh=gTbM9FaYqr03Th6pUHw6svkXYjQtCx/XPqtugSMa5Qc=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=ePcGX+35CAm9uOww9jmsgWCvyExkbvTeU8hjRHSfgVcc6jy5UG3LbYkCVVxzcj3J+
         cFGqp5UgByUxuMeaDXPzgHuo2Nj6SPqP5ziZG6dtFjcrv19RN2OAjRwaBwPmWvmZau
         1+rTqkMJYuzZDk1T7FjNeLJWNVtRAI9nEYPSAEL0=
X-Virus-Scanned: amavisd-new at zproxy110.enst.fr
Received: from zproxy110.enst.fr ([IPv6:::1])
        by localhost (zproxy110.enst.fr [IPv6:::1]) (amavisd-new, port 10026)
        with ESMTP id RXAL0LZB6oIB; Thu,  3 Sep 2020 09:50:38 +0200 (CEST)
Received: from localhost (unknown [10.29.225.220])
        by zproxy110.enst.fr (Postfix) with ESMTPSA id 330DF81F36;
        Thu,  3 Sep 2020 09:50:38 +0200 (CEST)
Date:   Thu, 3 Sep 2020 09:50:37 +0200
From:   Santiago Ruano =?iso-8859-1?Q?Rinc=F3n?= 
        <santiago.ruano-rincon@imt-atlantique.fr>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Oliver Neukum <oneukum@suse.de>,
        miguel@det.uvigo.es, 965074@bugs.debian.org
Subject: Re: Patches to make multicast proccesing on CDC NCM drivers
Message-ID: <20200903075037.GD242939@bartik>
References: <20200730135334.GN1496479@bartik>
 <1596118042.2508.6.camel@suse.de>
 <20200902114718.GB242939@bartik>
 <20200902120546.GA2008696@kroah.com>
 <20200902132728.GC242939@bartik>
 <20200902154517.GB2037986@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wULyF7TL5taEdwHz"
Content-Disposition: inline
In-Reply-To: <20200902154517.GB2037986@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--wULyF7TL5taEdwHz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

El 02/09/20 a las 17:45, Greg KH escribi=C3=B3:
> On Wed, Sep 02, 2020 at 03:27:28PM +0200, Santiago Ruano Rinc=C3=B3n wrot=
e:
> > El 02/09/20 a las 14:05, Greg KH escribi=C3=B3:
> > > On Wed, Sep 02, 2020 at 01:47:18PM +0200, Santiago Ruano Rinc=C3=B3n =
wrote:
> > > > El 30/07/20 a las 16:07, Oliver Neukum escribi=C3=B3:
> > > > > Am Donnerstag, den 30.07.2020, 15:53 +0200 schrieb Santiago Ruano
> > > > > Rinc=C3=B3n:
=E2=80=A6
> > > >=20
> > > > It would be possible to apply/backport Miguel's patches (along with
> > > > 5fd99b5d9950d6300467ded18ff4e44af0b4ae55) to stable versions please?
> > >=20
> > > I don't see that git commit id in Linus's tree, are you sure it is
> > > correct?
> >=20
> > I should had mention it is found in linux-next, sorry. Please see
> > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D969365#10
>=20
> Ah, nothing I can do with patches that are not yet in Linus's tree.
>=20

ACK.

> > > > FWIW, in the context of Debian, I'm personally interested in 4.19.y.
> > >=20
> > > What specific list of commits are you wanting to see backported?
> >=20
> > This:
> >=20
> > 37a2ebdd9e597ae1a0270ac747883ea8f6f767b6
> > e10dcb1b6ba714243ad5a35a11b91cc14103a9a9
> > e506addeff844237d60545ef4f6141de21471caf
> > 0226009ce0f6089f9b31211f7a2703cf9a327a01
>=20
> These do not look like bugfixes, but a new feature being added for this
> driver.  So why not just use a newer kernel version for this feature?

=46rom my point of view as user these are bugfixes, since IPv6 NDP or any
other protocol relying on multicast do not work without them. In other
words, my computer's networking is broken.

I want to have them in linux stable releases because that would make
easier to include them in Debian stable release.

Thanks!

 -- Santiago

--wULyF7TL5taEdwHz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRZVjztY8b+Ty43oH1itBCJKh26HQUCX1CgSgAKCRBitBCJKh26
HdYuAP98uZMI4JgsDWqDoS3uSUlfPkxndvM0NC/Vx0d80FuwkgEAvmxn2OkXhbn4
QkrkuhGDESbAypZH8HwtCOiMwERlBgs=
=7YpX
-----END PGP SIGNATURE-----

--wULyF7TL5taEdwHz--
