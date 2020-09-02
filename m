Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5BB25AA86
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 13:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgIBLuD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 07:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbgIBLr7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Sep 2020 07:47:59 -0400
Received: from zproxy130.enst.fr (zproxy130.enst.fr [IPv6:2001:660:330f:2::c2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACF34C061244
        for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2020 04:47:53 -0700 (PDT)
Received: from localhost (localhost [IPv6:::1])
        by zproxy130.enst.fr (Postfix) with ESMTP id E8466120A7B;
        Wed,  2 Sep 2020 13:47:19 +0200 (CEST)
Received: from zproxy130.enst.fr ([IPv6:::1])
        by localhost (zproxy130.enst.fr [IPv6:::1]) (amavisd-new, port 10032)
        with ESMTP id ggx5qKN8hUrw; Wed,  2 Sep 2020 13:47:19 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
        by zproxy130.enst.fr (Postfix) with ESMTP id 6E786120D4D;
        Wed,  2 Sep 2020 13:47:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy130.enst.fr 6E786120D4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imt-atlantique.fr;
        s=50EA75E8-DE22-11E6-A6DE-0662BA474D24; t=1599047239;
        bh=lgqI3BHiaCdFjF9DUgHtSQr46rLPna1Dx5J8GFjgG68=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=iOTtx8Tkcda7LaxgjUMnbJtKA5tYsSL0oDXTR/WTyieYQ2+gGXoQQJvkmcRp64kRU
         hBFT5TQqLVNLrqTvW0lnRZymWWy/i7LRsS5Psuq/2duAMQBSgi7CnJOa31Smtk1EX5
         FsVOxRoELDI4pEGE/yYHDB5inag83nYXUXUsVFB0=
X-Virus-Scanned: amavisd-new at zproxy130.enst.fr
Received: from zproxy130.enst.fr ([IPv6:::1])
        by localhost (zproxy130.enst.fr [IPv6:::1]) (amavisd-new, port 10026)
        with ESMTP id e-3VPomxjFA8; Wed,  2 Sep 2020 13:47:19 +0200 (CEST)
Received: from localhost (unknown [10.29.225.220])
        by zproxy130.enst.fr (Postfix) with ESMTPSA id 39A7F120A7B;
        Wed,  2 Sep 2020 13:47:19 +0200 (CEST)
Date:   Wed, 2 Sep 2020 13:47:18 +0200
From:   Santiago Ruano =?iso-8859-1?Q?Rinc=F3n?= 
        <santiago.ruano-rincon@imt-atlantique.fr>
To:     linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.de>, miguel@det.uvigo.es,
        965074@bugs.debian.org
Subject: Re: Patches to make multicast proccesing on CDC NCM drivers
Message-ID: <20200902114718.GB242939@bartik>
References: <20200730135334.GN1496479@bartik>
 <1596118042.2508.6.camel@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Content-Disposition: inline
In-Reply-To: <1596118042.2508.6.camel@suse.de>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

El 30/07/20 a las 16:07, Oliver Neukum escribi=C3=B3:
> Am Donnerstag, den 30.07.2020, 15:53 +0200 schrieb Santiago Ruano
> Rinc=C3=B3n:
> > Hi,
> >=20
> > Miguel Rodr=C3=ADguez sent this set of patches two years ago to fix the=
 lack
> > of multicast processing on CDC NCM driver:
> >=20
> > https://www.spinics.net/lists/linux-usb/msg170611.html
> > https://www.spinics.net/lists/linux-usb/msg170603.html
> > https://www.spinics.net/lists/linux-usb/msg170567.html
> > https://www.spinics.net/lists/linux-usb/msg170568.html
> >=20
> > I've using a DKMS version of them, available in
> > https://github.com/stbuehler/fixed-cdc-ether-ncm/tree/wip/patches
> > since more than a year ago, and they are working fine with my Dell D6000
> > docking station. IPv6 connectivity is broken without them.
> >=20
> > Is there any chance to consider those patches (or what would be needed
> > to make it happen)?
> > It would be great to have them upstream!
>=20
> Hi,
>=20
> they have been merged on Wednesday.
=E2=80=A6

Great, thanks!

It would be possible to apply/backport Miguel's patches (along with
5fd99b5d9950d6300467ded18ff4e44af0b4ae55) to stable versions please?

FWIW, in the context of Debian, I'm personally interested in 4.19.y.

Best regards,

 -- Santiago

--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRZVjztY8b+Ty43oH1itBCJKh26HQUCX0+GLAAKCRBitBCJKh26
HVoxAQC/u2K6ZbVv6h6JH5iLIwf898TveKClRkHECoHfFIlbFAEA/zzWGPo0JtH3
+xivsR9kn0WuW8xkfLKl0Sxh6UBdcQk=
=idff
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--
