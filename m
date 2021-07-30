Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FDE23DB865
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jul 2021 14:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238729AbhG3MM0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Jul 2021 08:12:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:47724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238687AbhG3MMZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Jul 2021 08:12:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 559CF60EE6;
        Fri, 30 Jul 2021 12:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627647141;
        bh=p1+kmCfg4mBydtgyCeyMRH0tmBVDkv46V/TuQGnBUPQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pB5SUc8FZ6w3A1MGDiA3efSM2Q2DtxkqtDXfpPSuBLThPTCB5oHCIHiUdzHg1KqLN
         jJMTMJ4MQYjdxuxZg8smuJb/xuS+QSRlPTvCwAyXy312BZMdBjbXU+bTXdFLwq6XTu
         UqELMQLjEM2gnzlRW+RhyHvPLK1mIrKXqnZTZi/YXGLOGOIxCpiH11PbjWXsZ3ZXhu
         9eeFISv/A4EkEW8r93O2pvXq7NZGSoixD2SZVbnajBc9lHN0WZ3/P8a7mnIAGktqcy
         JZfShqZmEStVYw5k9mu8Q77P/UAfOMcmkyK8nZwuN/ZBWVmMgeY+K123FgVtOEmC/a
         LF2Pt4thpQUWw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1m9RMe-0008U5-76; Fri, 30 Jul 2021 14:11:44 +0200
Date:   Fri, 30 Jul 2021 14:11:44 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Chris <chris@cyber-anlage.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: pl2303 : unknown device type
Message-ID: <YQPsgPey1V+7ccGq@hovoldconsulting.com>
References: <2560053.x2KRyp2eMa@cyber-bucket>
 <YQJ+pLPIGc4Qwrf8@hovoldconsulting.com>
 <4913832.LPSoa04KD1@cyber-bucket>
 <YQOq8+734fzFfq8U@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Yfr9BGlOmbVZB+fO"
Content-Disposition: inline
In-Reply-To: <YQOq8+734fzFfq8U@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--Yfr9BGlOmbVZB+fO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 30, 2021 at 09:32:03AM +0200, Johan Hovold wrote:
> On Thu, Jul 29, 2021 at 03:55:48PM +0200, Chris wrote:
> > On Thursday, July 29, 2021 12:10:44 PM CEST Johan Hovold wrote:
> > > Do you have any idea what kind of chip this is?
> >=20
> > No, sorry, I don't. Do I have to open the device to check? (I'd rather =
not...=20
> > I'd have to crawl into the attic to get to it)
>=20
> No, that's alright. It's most likely an HXD and the difference to HX is
> just the maximum line speed as far as we know currently.
>=20
> I'll add a special case for the bcdDevice of this device for now.

Taking a closer look at this I realised that your device is actually an
HX for which bcdDevice is configurable in EEPROM/OTPROM unlike for HXD
and later types. (The default HXD product string also has a "D" in it:
"USB-Serial Controller D").

So we need to assume any device with bcdUSB 1.10 and unknown bcdDevice
to be an HX.

Johan

--Yfr9BGlOmbVZB+fO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCYQPsdAAKCRALxc3C7H1l
COBHAP9M7dZYUzH+Yl/xFgDLlKkaVtITrnpendPAsNPESTEFegD/bKabfE2rC5JR
dD9dc9LHdd2uDE0nr2VUWNHhvFhuFQs=
=sI8M
-----END PGP SIGNATURE-----

--Yfr9BGlOmbVZB+fO--
