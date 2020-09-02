Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A74825AC08
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 15:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbgIBN2S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 09:28:18 -0400
Received: from zproxy110.enst.fr ([137.194.2.192]:33580 "EHLO
        zproxy110.enst.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgIBN14 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Sep 2020 09:27:56 -0400
X-Greylist: delayed 6018 seconds by postgrey-1.27 at vger.kernel.org; Wed, 02 Sep 2020 09:27:55 EDT
Received: from localhost (localhost [IPv6:::1])
        by zproxy110.enst.fr (Postfix) with ESMTP id 660648201B;
        Wed,  2 Sep 2020 15:27:30 +0200 (CEST)
Received: from zproxy110.enst.fr ([IPv6:::1])
        by localhost (zproxy110.enst.fr [IPv6:::1]) (amavisd-new, port 10032)
        with ESMTP id DNYJSWYy-wrZ; Wed,  2 Sep 2020 15:27:29 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
        by zproxy110.enst.fr (Postfix) with ESMTP id D710D82018;
        Wed,  2 Sep 2020 15:27:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy110.enst.fr D710D82018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imt-atlantique.fr;
        s=50EA75E8-DE22-11E6-A6DE-0662BA474D24; t=1599053249;
        bh=QypbK9czyFD/3Lc3dZeQgKu58PrANwcejXRsQi8O1D4=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=L/lpQ9WVRMWy2hjXkKUQPZ/+dK3j/ju+U9GGxe9UjgmjqwHrYGef8MXdvC/dnS8jZ
         aD7G3NqVNvyjfFtZJDuJzSwVZTKRpT6uZlmJ/O/OAxNFF3SvyJglZU3GpnAH207v1D
         U8/OH+6Q3hfcRhzSGClLf1ixQPlQZunkFErnzEPQ=
X-Virus-Scanned: amavisd-new at zproxy110.enst.fr
Received: from zproxy110.enst.fr ([IPv6:::1])
        by localhost (zproxy110.enst.fr [IPv6:::1]) (amavisd-new, port 10026)
        with ESMTP id JwDnF2j-qWSU; Wed,  2 Sep 2020 15:27:29 +0200 (CEST)
Received: from localhost (unknown [10.29.225.220])
        by zproxy110.enst.fr (Postfix) with ESMTPSA id 68CF481FA4;
        Wed,  2 Sep 2020 15:27:29 +0200 (CEST)
Date:   Wed, 2 Sep 2020 15:27:28 +0200
From:   Santiago Ruano =?iso-8859-1?Q?Rinc=F3n?= 
        <santiago.ruano-rincon@imt-atlantique.fr>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Oliver Neukum <oneukum@suse.de>,
        miguel@det.uvigo.es, 965074@bugs.debian.org
Subject: Re: Patches to make multicast proccesing on CDC NCM drivers
Message-ID: <20200902132728.GC242939@bartik>
References: <20200730135334.GN1496479@bartik>
 <1596118042.2508.6.camel@suse.de>
 <20200902114718.GB242939@bartik>
 <20200902120546.GA2008696@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QRj9sO5tAVLaXnSD"
Content-Disposition: inline
In-Reply-To: <20200902120546.GA2008696@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--QRj9sO5tAVLaXnSD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

El 02/09/20 a las 14:05, Greg KH escribi=C3=B3:
> On Wed, Sep 02, 2020 at 01:47:18PM +0200, Santiago Ruano Rinc=C3=B3n wrot=
e:
> > El 30/07/20 a las 16:07, Oliver Neukum escribi=C3=B3:
> > > Am Donnerstag, den 30.07.2020, 15:53 +0200 schrieb Santiago Ruano
> > > Rinc=C3=B3n:
> > > > Hi,
> > > >=20
> > > > Miguel Rodr=C3=ADguez sent this set of patches two years ago to fix=
 the lack
> > > > of multicast processing on CDC NCM driver:
> > > >=20
> > > > https://www.spinics.net/lists/linux-usb/msg170611.html
> > > > https://www.spinics.net/lists/linux-usb/msg170603.html
> > > > https://www.spinics.net/lists/linux-usb/msg170567.html
> > > > https://www.spinics.net/lists/linux-usb/msg170568.html
> > > >=20
> > > > I've using a DKMS version of them, available in
> > > > https://github.com/stbuehler/fixed-cdc-ether-ncm/tree/wip/patches
> > > > since more than a year ago, and they are working fine with my Dell =
D6000
> > > > docking station. IPv6 connectivity is broken without them.
> > > >=20
> > > > Is there any chance to consider those patches (or what would be nee=
ded
> > > > to make it happen)?
> > > > It would be great to have them upstream!
> > >=20
> > > Hi,
> > >=20
> > > they have been merged on Wednesday.
> > =E2=80=A6
> >=20
> > Great, thanks!
> >=20
> > It would be possible to apply/backport Miguel's patches (along with
> > 5fd99b5d9950d6300467ded18ff4e44af0b4ae55) to stable versions please?
>=20
> I don't see that git commit id in Linus's tree, are you sure it is
> correct?

I should had mention it is found in linux-next, sorry. Please see
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D969365#10

> > FWIW, in the context of Debian, I'm personally interested in 4.19.y.
>=20
> What specific list of commits are you wanting to see backported?

This:

37a2ebdd9e597ae1a0270ac747883ea8f6f767b6
e10dcb1b6ba714243ad5a35a11b91cc14103a9a9
e506addeff844237d60545ef4f6141de21471caf
0226009ce0f6089f9b31211f7a2703cf9a327a01

Thanks,

 -- santiago

--QRj9sO5tAVLaXnSD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRZVjztY8b+Ty43oH1itBCJKh26HQUCX0+dvQAKCRBitBCJKh26
HZUtAQDVcsBhMssX2wXXH5Lc8RVTTiZT1dOWWb57cUKxEmRevwEAlDLbzUIMQZjN
IJOvDkvqzOxdcX12a1JgCMWwjeI5UAA=
=AsC+
-----END PGP SIGNATURE-----

--QRj9sO5tAVLaXnSD--
