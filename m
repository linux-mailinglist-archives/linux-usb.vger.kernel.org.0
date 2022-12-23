Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15EC465563C
	for <lists+linux-usb@lfdr.de>; Sat, 24 Dec 2022 00:41:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbiLWXlM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Dec 2022 18:41:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbiLWXlL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Dec 2022 18:41:11 -0500
Received: from relay19.mail.ox.ac.uk (relay19.mail.ox.ac.uk [129.67.1.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC751BE0E
        for <linux-usb@vger.kernel.org>; Fri, 23 Dec 2022 15:41:08 -0800 (PST)
Received: from smtp9.mail.ox.ac.uk ([129.67.1.206])
        by relay19.mail.ox.ac.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <dima.pasechnik@cs.ox.ac.uk>)
        id 1p8rf0-0006A1-CJ; Fri, 23 Dec 2022 23:41:06 +0000
Received: from 245.red-88-25-31.staticip.rima-tde.net ([88.25.31.245]:43654 helo=hilbert.cs.ox.ac.uk)
        by smtp9.mail.ox.ac.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <dima.pasechnik@cs.ox.ac.uk>)
        id 1p8rez-00041D-Vw; Fri, 23 Dec 2022 23:41:06 +0000
Received: by hilbert.cs.ox.ac.uk (Postfix, from userid 1000)
        id D7909741515; Fri, 23 Dec 2022 23:41:03 +0000 (GMT)
Date:   Fri, 23 Dec 2022 23:41:03 +0000
From:   Dmitrii Pasechnik <dima.pasechnik@cs.ox.ac.uk>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: usb 1-3: Product: BBC micro:bit CMSIS-DAP not recognised
Message-ID: <Y6Y8j9pvgevaKd1l@hilbert>
References: <Y6CpKxZ4KsiYttbL@hilbert>
 <Y6Csfzqvy6GExhVB@kroah.com>
 <Y6DjwFAp4M8I+T4P@hilbert>
 <Y6Fc2Fz8w4KoX952@kroah.com>
 <Y6HLqYpxwT+v3BgX@hilbert>
 <Y6ITkWEb25Si4zts@rowland.harvard.edu>
 <35B854FE-1F32-47FD-8ED1-CDE033327531@cs.ox.ac.uk>
 <Y6TLJ94ubE4tOTev@rowland.harvard.edu>
 <Y6WmAXzpCd7Jj3rS@cs.ox.ac.uk>
 <Y6XAwjr96YKAMSt/@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uhg8WS98IZyUaSix"
Content-Disposition: inline
In-Reply-To: <Y6XAwjr96YKAMSt/@rowland.harvard.edu>
X-PGP-Key: http://keys.gnupg.net/pks/lookup?op=vindex&search=dimpase@cs.ox.ac.uk
X-Oxford-Username: coml0531
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--uhg8WS98IZyUaSix
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 23, 2022 at 09:52:50AM -0500, Alan Stern wrote:
> On Fri, Dec 23, 2022 at 12:58:41PM +0000, Dmitrii Pasechnik wrote:
> > On Thu, Dec 22, 2022 at 04:24:55PM -0500, Alan Stern wrote:
> > > A bit off to the side from the main point of this thread, but...
> > >=20
> > > On Thu, Dec 22, 2022 at 10:32:09AM +0000, Dima Pasechnik wrote:
> > > >=20
> > > >=20
> > > > On 20 December 2022 19:57:05 WET, Alan Stern <stern@rowland.harvard=
=2Eedu> wrote:
> > > > >> USB Interfaces: MSD, CDC, HID, WebUSB
> > > > >
> > > > >Which agrees with the information on the web site.  I have no idea=
 what=20
> > > > >WebUSB is supposed to be.
> > > >=20
> > > > WebUSB is a JavaScript API, supported by Chromium -derived browsers=
 (Firefox not there yet)
> > > >=20
> > > > https://en.wikipedia.org/wiki/WebUSB
> > >=20
> > > The Wikipedia article agrees with you that WebUSB is a JavaScript API=
=2E =20
> > > As such, it is used for communication between web browsers and=20
> > > JavaScript programs.
> >=20
> > No, it's used by browsers (which  run JavaScript code in them) to
> > communicate with USB hardware. Or, if you like,
> > standalone JavaScript programs to communicate with USB hardware.=20
> > Let me copy from the wiki here:
> >=20
> > ---------------------------------
> > A Universal Serial Bus, or a USB is an industry standard [...]
> > WebUSB is a set of API calls that enable access to these hardware
> > devices from web pages. WebUSB is developed by the World Wide Web
> > Consortium(W3C).[1] The webUSB API provides a safe, and developer
> > familiar means of communication to edges devices from web pages. The
> > webUSB API integrates into existing USB libraries and shortens the
> > development cycle for integrating new devices into the web environment
> > by not needing to wait for browser support for these devices.
> >=20
> > Early versions of webUSB came out around as an alternative to Flash,
> > Chrome Serial, and other custom approaches to connecting browsers to
> > hardware. WebUSB aims to solve the four goals of any interface being;
> > fast to make, cross platform, look good, accessibility.
> >=20
> > >  Not for communication between programs and USB=20
> > > devices.  So I don't understand why a USB device needs to be concerne=
d=20
> > > about it.
> >=20
> > I hope the above explains.
>=20
> Actually, it's ambiguous.
>=20
> The article says that WebUSB is an API used by JavaScript programs when=
=20
> they want to interact with a USB device.  Which means it is something=20
> that JavaScript programs can know about and interact with.  Fine.
>=20
> But the article doesn't say what happens on the device's side of the=20
> conversation.  Does the WebUSB framework use some special messages when=
=20
> communicating with a USB device, so it will only work with devices which=
=20
> support WebUSB's protocol, or does it use plain ordinary USB messages=20
> which any USB device will support?
>=20
> To put it another way, do USB devices need to have specialized firmware=
=20
> in order to be compatible with WebUSB, or will WebUSB work with all USB=
=20
> devices?  If the latter is true then why does the BBC micro:bit device=20
> have a special WebUSB interface?  Does the extra interface provide some=
=20
> sort of device-specific information which WebUSB can make use of but=20
> which isn't essential?

here is what I could find about the device side of WebUSB: https://web.dev/=
build-for-webusb/
Basically, WebUSB support offers some extras, e.g. one can get a
specific pop-up with a URL in it (supplied by the board) in the web browser=
 as
the device is plugged in the USB port.

Also, on the software side, this: https://developer.chrome.com/articles/usb/
is more informative than the Wikipedia article.
And here is how WebUSB-capable device is meant to talk ot the machine
it's plugged in: https://wicg.github.io/webusb/#webusb-platform-capability-=
descriptor

HTH,
Dmitrii

>=20
> Alan Stern

--uhg8WS98IZyUaSix
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEJVdDnfI7raAa4RJxoksLHjfJBTEFAmOmPIoACgkQoksLHjfJ
BTFrDwf/SUxLLldgNecvZXj3MFA8d0mKxolbjm4bl56CFKeS9CBaPrl23t/6ZTVe
/+bWlDm+7L4V5nJRUqjYzJt+qpPjcIWq9Z+PnzEShc6H6oYePiOS+IZDJcOKq9Lg
/N604S+F5mKP6EAS8Q73+mqCDE9f1A04Pq/GwIY9ccp010CJya0MF7JSz26afJcC
+nOSHbItf0LAYFLspAw1IlfaaGGzWbysedcpMF2tgXDGqvtdiuCgNWQbZX3y2sou
+9Bcm07HUG4BganrmGsROunNqshSm0X5iSWFvfAC6XzoCcCtMnho20BlOdPWCn+Q
aXAKXpyG3RRg28eDbHb1DuFcqRY4tA==
=SWBN
-----END PGP SIGNATURE-----

--uhg8WS98IZyUaSix--
