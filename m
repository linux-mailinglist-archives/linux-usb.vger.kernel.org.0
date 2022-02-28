Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE9BB4C650E
	for <lists+linux-usb@lfdr.de>; Mon, 28 Feb 2022 09:51:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232694AbiB1Iwf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Feb 2022 03:52:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbiB1Iwe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Feb 2022 03:52:34 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A2D65AA69
        for <linux-usb@vger.kernel.org>; Mon, 28 Feb 2022 00:51:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 19580B80E60
        for <linux-usb@vger.kernel.org>; Mon, 28 Feb 2022 08:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2F1C340E7;
        Mon, 28 Feb 2022 08:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646038310;
        bh=ZlDzDeMqwftUf+tqoqCDOF/B8/lsAIM5Vopg1fZ/yLs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P/GDhJrzkx+2LtYE3D3pjTcpjUv0GCNGtQAtgQX6Ok3ysh3w776ifzkFwAUM5jmJz
         B0Ay+51I80LeNlWSuo0f7gE8DaWFwKzUDQj1aMncJBykspOppE7vcSzv4X/DVO/488
         elKtBUcIEgHE4vxGoSE9M0kHYe52WZC5cEVeN2g6WO0aIqwsUCji8iHOd0hAl/I3W9
         zB77gyv9p/mo9GPk6xommFUug1rlZEO5TxpEfzyEWVX/5GXH+jBgcxaFWAX6/5uOGd
         zfovH1keW2gJRrvUhrvk71et2Zo20lBfnwYMNJ3czsgp5+jmoKCbV0uG1vGWyjqBH1
         iI+kSIBfa4jkA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1nObkx-0002oN-7k; Mon, 28 Feb 2022 09:51:47 +0100
Date:   Mon, 28 Feb 2022 09:51:47 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Felix Becker <linux.felixbecker2@gmx.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [usbserial] device 0421:069a is supported, in fact.
Message-ID: <YhyNIxUw3RGuG0CW@hovoldconsulting.com>
References: <20220208125958.295e8a0b@gmx.de>
 <YgKKQSOuwBy1cQ6H@kroah.com>
 <20220208201506.6c65834d@gmx.de>
 <YheJtJ/p5QIsphYd@hovoldconsulting.com>
 <20220226184732.42536060@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dr1kIQakZXyYTcq9"
Content-Disposition: inline
In-Reply-To: <20220226184732.42536060@gmx.de>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--dr1kIQakZXyYTcq9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 26, 2022 at 06:47:32PM +0100, Felix Becker wrote:
> Hej,
>=20
> On Thu, 24 Feb 2022 14:35:48 +0100, Johan Hovold <johan@kernel.org>
> wrote about "Re: [usbserial] device 0421:069a is supported, in fact.":
>=20
> > On Tue, Feb 08, 2022 at 08:15:36PM +0100, Felix Becker wrote:
> > > On Tue, 8 Feb 2022 16:20:33 +0100, Greg KH
> > > <gregkh@linuxfoundation.org> wrote about "Re: [usbserial] device
> > > 0421:069a is supported, in fact.":=20
> > > > Can you provide the output of `lsusb -v -d 0421:069a` for us? =20
> > >=20
> > > Attached (without `usbserial` loaded to specifically drive this
> > > phone): `lsusb_0421:069a.nodriver.log` =20
> >=20
> > [...] I've just sent you a patch adding a new
> > "simple" driver for Nokia phones that should allow you to use this
> > device without adding the device id manually.
> >=20
> > [...]
> >=20
> > Will you be able to test the patch and let us know if it works as
> > intended?
>=20
> It works, but different than when I loaded the `usbserial` driver (not
> `usb-serial-simple`) with the device ID manually:
>=20
> I now get 4 (instead of 2) USB interfaces.

Yeah, that's a mistake on my part. I didn't look closely enough at the
lsusb output when preparing the patch. Should be fixed in v2:

	https://lore.kernel.org/r/20220228084919.10656-1-johan@kernel.org

> `dmesg` output when I connect the phone:

> and in this case it is `/dev/ttyUSB2` which responds to `AT`-commands.
>=20
> Via this interface, I can sync contacts.

Thanks for testing.

Johan

--dr1kIQakZXyYTcq9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCYhyNHgAKCRALxc3C7H1l
CNmUAQCN70BH0cU6duh5xODZ0tQcN3WsRQISc5C+0LxJbV4tPwEA9ITuToB1+pAp
o1MOyekEZXJudlnoW+B8q83Jl5CHFAg=
=Zbvt
-----END PGP SIGNATURE-----

--dr1kIQakZXyYTcq9--
