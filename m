Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE00C161CD4
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 22:39:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729129AbgBQVjP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 16:39:15 -0500
Received: from foss.arm.com ([217.140.110.172]:41948 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728935AbgBQVjO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Feb 2020 16:39:14 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02E721FB;
        Mon, 17 Feb 2020 13:39:14 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73E253F703;
        Mon, 17 Feb 2020 13:39:13 -0800 (PST)
Date:   Mon, 17 Feb 2020 21:39:11 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc:     balbi@kernel.org, lee.jones@linaro.org, linux-usb@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [RFC 1/9] regmap: Add USB support
Message-ID: <20200217213911.GV9304@sirena.org.uk>
References: <20200216172117.49832-1-noralf@tronnes.org>
 <20200216172117.49832-2-noralf@tronnes.org>
 <20200217121149.GB9304@sirena.org.uk>
 <f9cb6d05-300b-f6c8-8f88-2e6c014c1ba3@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4QzzFpAwbwI4hdN6"
Content-Disposition: inline
In-Reply-To: <f9cb6d05-300b-f6c8-8f88-2e6c014c1ba3@tronnes.org>
X-Cookie: There was a phone call for you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--4QzzFpAwbwI4hdN6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2020 at 10:33:58PM +0100, Noralf Tr=F8nnes wrote:
> Den 17.02.2020 13.11, skrev Mark Brown:

> > This looks like you just don't support a straight write operation, if
> > you need to do this emulation push it up the stack.

> After going through the stack I realise that I have a problem.
> What I have failed to fully comprehend is this regmap requirement:

> 	if (val_len % map->format.val_bytes)
> 		return -EINVAL;

> There will be a spi and i2c driver down the line which will transfer
> buffers of any size, and having to use 8-bit register values will not be
> great.

Out of interest why are 8 bit registers going to be a problem?

--4QzzFpAwbwI4hdN6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5LB/8ACgkQJNaLcl1U
h9CjnQf/WqXHZ+HYhaq9rua4mPrl31R3MHfe58SVBofCsrAp1awFn/nzYpOgGTj3
GYD5KH9FgSG9icZTx7RP8+0k00O8yEsuLLy+1lf72mbid6iE9VxwdhYWfAKHHeV+
mTXQcSoCJmXzOrfLN1cZvTihVjAqfJTZieaywu/BJhqOOGOPmECyhAMhIXHok8Q/
XvP/pRS5RiXWD/RtEfM2rEP6e2c1X7bNjyiRrSJ75AnnhKq4yYdWR7AoUaSckn6x
W+djRroZ+Rgel+Mv8Ts+WFDQNRWViXSwd58LUK/qAvItiTjz3aA997sx9LDxdzJ8
hjS3crc2kuvqYYvTn0r3FFi/6zQldg==
=+16T
-----END PGP SIGNATURE-----

--4QzzFpAwbwI4hdN6--
