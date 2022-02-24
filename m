Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EDD94C2D3F
	for <lists+linux-usb@lfdr.de>; Thu, 24 Feb 2022 14:35:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234784AbiBXNgT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Feb 2022 08:36:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbiBXNgS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Feb 2022 08:36:18 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25641178694
        for <linux-usb@vger.kernel.org>; Thu, 24 Feb 2022 05:35:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BF12B61AEA
        for <linux-usb@vger.kernel.org>; Thu, 24 Feb 2022 13:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E16C340E9;
        Thu, 24 Feb 2022 13:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645709748;
        bh=cR7KWfCohF5Ohuuf2LCU+PaP4blOX5nl4Nrdojvqp9c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lvF30bocJ51Xnyfcd93utGQTMIZ9UnPcsnuAtDexWBDrYDenE3bEejLw6T3lYMGqr
         4CZRJp8aiDwLSxBo3CwxZH1ECEeWx8GaP5M1c6A/6CDROVYNnAlvs6L/pcfQtd7cwX
         C59nZCZSatux4Jh/O4/Fpp7/QNCQCf49vtNc5HCFANs4fE4G3AObQoHFgqsF+u9qK+
         W6oRBHM4Fp7t/WCGycLsrM9Q8E31Vku3dJThcFt9o+KzltJKQQKEb2k35Cc4wcjbuJ
         J9qyWJJBnPDt19fNy3tztBvfRuIRvu7ekngYKu40pprdXuKBkpIX65h2hohFNLnQw1
         znMp0HBhyvWBw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1nNEHc-0003mv-D9; Thu, 24 Feb 2022 14:35:48 +0100
Date:   Thu, 24 Feb 2022 14:35:48 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Felix Becker <linux.felixbecker2@gmx.de>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [usbserial] device 0421:069a is supported, in fact.
Message-ID: <YheJtJ/p5QIsphYd@hovoldconsulting.com>
References: <20220208125958.295e8a0b@gmx.de>
 <YgKKQSOuwBy1cQ6H@kroah.com>
 <20220208201506.6c65834d@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TwgG+bR4WevH1e11"
Content-Disposition: inline
In-Reply-To: <20220208201506.6c65834d@gmx.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--TwgG+bR4WevH1e11
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 08:15:36PM +0100, Felix Becker wrote:
> On Tue, 8 Feb 2022 16:20:33 +0100, Greg KH <gregkh@linuxfoundation.org>
> wrote about "Re: [usbserial] device 0421:069a is supported, in fact.":
>=20
> > Can you provide the output of `lsusb -v -d 0421:069a` for us?
>=20
> Attached (without `usbserial` loaded to specifically drive this phone):
> `lsusb_0421:069a.nodriver.log`

Thanks for reporting this. I've just sent you a patch adding a new
"simple" driver for Nokia phones that should allow you to use this
device without adding the device id manually.

You just need to remember to enable the USB_SERIAL_SIMPLE Kconfig
option in your kernel build.

Will you be able to test the patch and let us know if it works as
intended?

Johan

--TwgG+bR4WevH1e11
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCYheJrAAKCRALxc3C7H1l
CMlwAPsEpVQ+AnV2BCIficaE/letRsGoXZCIPfzIDVvTOYizAgD+N87gz02WK4xI
f3kYw8Ww29gbDuIHhPeJMFswrOD20w4=
=dFyY
-----END PGP SIGNATURE-----

--TwgG+bR4WevH1e11--
