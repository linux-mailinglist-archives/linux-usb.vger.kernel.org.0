Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2503D22EA
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jul 2021 13:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbhGVLJW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Jul 2021 07:09:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:47916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231627AbhGVLJW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Jul 2021 07:09:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9676761289;
        Thu, 22 Jul 2021 11:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626954597;
        bh=LhMgqiK5rY+9wTReFg+DsbzvD6irzWq37Oz6s4iwxaE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=NcD+VSv0b/m6X/AsEfvNfYrlyfLYjvTYHFPyG4swsJE7boLKyQWNvjF/JyDBEpneX
         6V2zKy7TnmyKo/jFomLdy6A9p4pyR+tnY38K0JRNgKPYKEjXaypJVTMsPhNN0kd2SI
         KQ+RAjHEigt1j/eFbMn2QXPW6mYeqbrPF9UUWVRIO2jfudX3kzMf3NyjL6gKXduHe3
         MaHBmnOsInfFC6HDo+kTmstZhm+xeyiM84HsDi3W+SExiI7vm8Hd2DkfVJGoZ+g6M3
         TgT6bOetyj/8JMozSqlAud5gAv3C4FWt55CaywLnDTIsEShWtx3NU06YEVyR4i4PGo
         SBgCkpfDCICcw==
From:   Felipe Balbi <balbi@kernel.org>
To:     Maxim Devaev <mdevaev@gmail.com>
Cc:     gregkh@linuxfoundation.org, sandeen@redhat.com,
        linux-usb@vger.kernel.org, mdevaev@gmail.com
Subject: Re: [PATCH] usb: gadget: f_hid: added GET_IDLE and SET_IDLE handlers
In-Reply-To: <20210721180351.129450-1-mdevaev@gmail.com>
References: <20210721180351.129450-1-mdevaev@gmail.com>
Date:   Thu, 22 Jul 2021 14:49:38 +0300
Message-ID: <87y29ylga5.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Maxim Devaev <mdevaev@gmail.com> writes:

> The USB HID standard declares mandatory support for GET_IDLE and SET_IDLE
> requests for Boot Keyboard. Most hosts can handle their absence, but othe=
rs
> like some old/strange UEFIs and BIOSes consider this a critical error
> and refuse to work with f_hid.
>
> This primitive implementation of saving and returning idle is sufficient
> to meet the requirements of the standard and these devices.
>
> Signed-off-by: Maxim Devaev <mdevaev@gmail.com>

yeah, I don't see any issues with this. If you have access to the tool,
mind running USBCV on the f_hid gadget? Would be cool to get some
confirmation that we're within spec.

That shouldn't gate $subject though.

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmD5W1IRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUgnNQf/bJRse2DeAjgR9Zf9ZqbUvXVI1DfaCYt9
d+QlYONYsaSDHlI4SLYQ4B7GaN7UP4ETFEKpxfA+bWz9GT1EY8l9cINsN/Yq8AP4
Tr3wH4ubptgmFxR0B07cva7XSXa0lcSMlRZ/c+sgntF6X+oxf9M7r4oCUkYz2vh2
qSo1jJ8tQobBibeg4WcS+mNcIoWMRJ6Mmx7C5LJGIQRsP9K81Gmap5PH7tpqnZ2H
F+rEkMCZwFMmMHsDOZPGpivKxxRERkNW46aEv0vgM5Idp1vGt1/7BzUSXWEU9mjg
rP7rC2/9akyq1nUq8ECMufaCExKWOHlSEv1P44YktPx6Jz8yxyHI1w==
=QiB+
-----END PGP SIGNATURE-----
--=-=-=--
