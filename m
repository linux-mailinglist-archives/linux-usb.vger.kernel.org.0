Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37456296C7F
	for <lists+linux-usb@lfdr.de>; Fri, 23 Oct 2020 12:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S461866AbgJWKJH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Oct 2020 06:09:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:43410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S373889AbgJWKJG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 23 Oct 2020 06:09:06 -0400
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 155E720874;
        Fri, 23 Oct 2020 10:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603447746;
        bh=HkH6ujXhql2xMTjNYNOPAHLHPn8BLnfhnZWq39Hsn0I=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Y3RqlVLHayiCYCWdDDxPlOOG9SJNrDRAEFbuR4HDH3EwB7pBNfSxnw0Vv93yemmAg
         FigWbDzA3WZgV8zlRMkRMiDLxv6HjOKmwAHaveyGcMmFhyZIHLx1vS13TLOiFLBRaF
         cRcb9jsollzNfPN0qy372j3HD/p6Iuykwin32deo=
From:   Felipe Balbi <balbi@kernel.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Dmitry N. Mikushin" <maemarcus@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Any example of USB gadget for DRD device mode on Intel Gemini
 Lake?
In-Reply-To: <20201023064855.GR1667571@kuha.fi.intel.com>
References: <CAGR4S9HQiZCsA7Y5_47j-xBOkydKiT2Exam=36L=-vwRjt+UWA@mail.gmail.com>
 <20201019133607.GC1667571@kuha.fi.intel.com>
 <CAGR4S9F1wdUyywuBxcMYfH9wMa91xw1rL8dmZrhJrGSGbmgbzg@mail.gmail.com>
 <20201023064855.GR1667571@kuha.fi.intel.com>
Date:   Fri, 23 Oct 2020 13:08:59 +0300
Message-ID: <87lffxdzk4.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Heikki Krogerus <heikki.krogerus@linux.intel.com> writes:

> On Thu, Oct 22, 2020 at 11:06:59PM +0200, Dmitry N. Mikushin wrote:
>> Yes, AFAIK PCI_DEVICE_ID_INTEL_GLK_XHCI is actually 0x31a8, and I do hav=
e it:
>>=20
>> 00:15.0 USB controller [0c03]: Intel Corporation Device [8086:31a8] (rev=
 03)
>
> That is the xHCI controller, and it is not what you need if you want
> to use the connector in device mode. The xHCI and DWC3 IPs are
> separate IPs on GLK. That is why there is a mux between the two. The
> dwc3 USB device controller has device ID 31aa, so you want to see a
> PCI device with the device ID. It's not there.
>
> So the dwc3 PCI device is not enabled on your board, which means you
> do not have USB device controller to deal with. The connector is in
> host mode only. Sorry.
>
> If you can enter the BIOS menu, then you can try to find an option
> named XDCI (so that's "XDCI" not "xHCI"). It is usually somewhere
> under some USB menu. If you have that, then enable it, and you should
> see the dwc3 PCI device in the operating system.

Also, have a look at acpidump. See if the device even exists in your
DSDT but, perhaps, disabled (look at the _STA method for OTDG or XDCI)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl+Sq7sRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQa9txAAk0Xm3NpqkQy/hPkb28ohqHg6ZpDz9vF3
7PV863ejyhbKo0Z+42yf6sVPXfupGC2JwEslUyGW8YWmu2k636yZ9Oc+9PjhuikB
/Z5cpgzyb0CypcNYcIK0JsnWvvAJ5ViAXYTLlTE3VynanV/FMgttChbHCiJQrShn
VFhrxCnBTCaTnS7aB/2uBheWZELoDBbdrvOqKChnnR4CYYIhpuSsHeee6xBPC068
u3WYAYhtB1ngjC4krHtXPTTSxNOaKDqmkNiMwwsr+svi57xR/G8tTsvLzY/Yox1Y
gWXoGK8P0E4HecXw7yn4vf2cusYgFaL0MHOms29s8l7N9lr1uER759r4fCFGgpA2
ROLXVz7NqfJHhyP4V60jjPSA7en79N6jeDkXRBHtDwOyMgY0XS8dsCp3FSez6Qte
69957/h/W1ZrrPFEjH/zLl7y/1vw6XRuJwIwFczGQeDJ59//ASl+/PLE76T23wdN
eJ7hMRGbiGAvnZcU6gMwHeOXpWtxoiwmxrlhBQhhazeAUDeUCcWAxnKkQkkZxD4f
ajpyC7IoEA3lHtCKT4vVhf3q2i9O3wZcnlxONUd+umsO9h7XM+bK+1es0TWPGlxo
gETffu4zSnoju86BVzAtz9QUkBUkvFWLysA2u67Op8EPwy0fCSpGRhQ30gfK3kTD
0JYnU3A/c6c=
=x7Pn
-----END PGP SIGNATURE-----
--=-=-=--
