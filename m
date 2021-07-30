Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F03103DB489
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jul 2021 09:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237616AbhG3Hcp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Jul 2021 03:32:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:44510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230337AbhG3Hcp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Jul 2021 03:32:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0FAF60EFF;
        Fri, 30 Jul 2021 07:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627630361;
        bh=Wvmt3PqhF+La46KiWUqXk24gl0d0yz66XxfkfrERMZQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c+4itrRR6YxhzkPAb0Mjb6Y/zCV6S73SDLJMNdrFZpwSwgSNZPvRv6o43YUB2MgwC
         HBaIabTokZeHyma/GjWX+QyS/6iMFgQ301qqCRgc/6PwHDopMtt/JNfDV6DwZcMnhq
         J75DjQKPQINxTW0P7wuan7gDtTied2TTp/JtEbX/LW/1lVGbm5jtT/yzJ9urMJImI2
         Oa7Jj/KVx8EgK5uK1rLH9NJtEJLNPSvrRs8MJcSVOzkyiYhWdG1uZtrh58CDIpVw39
         IMSLfoHNhXYiuKihoqDPig4/lNxJh/Q0z4r9gOPoYMNeDIunwrE4HwDft8KGAVnzpX
         1aY/Tos+oJelw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1m9Mzz-0005zt-3U; Fri, 30 Jul 2021 09:32:03 +0200
Date:   Fri, 30 Jul 2021 09:32:03 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Chris <chris@cyber-anlage.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: pl2303 : unknown device type
Message-ID: <YQOq8+734fzFfq8U@hovoldconsulting.com>
References: <2560053.x2KRyp2eMa@cyber-bucket>
 <YQJ+pLPIGc4Qwrf8@hovoldconsulting.com>
 <4913832.LPSoa04KD1@cyber-bucket>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="74tji5SJr2cUAW/2"
Content-Disposition: inline
In-Reply-To: <4913832.LPSoa04KD1@cyber-bucket>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--74tji5SJr2cUAW/2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 29, 2021 at 03:55:48PM +0200, Chris wrote:
> On Thursday, July 29, 2021 12:10:44 PM CEST Johan Hovold wrote:
> > Do you have any idea what kind of chip this is?
>=20
> No, sorry, I don't. Do I have to open the device to check? (I'd rather no=
t...=20
> I'd have to crawl into the attic to get to it)

No, that's alright. It's most likely an HXD and the difference to HX is
just the maximum line speed as far as we know currently.

I'll add a special case for the bcdDevice of this device for now.

Johan

--74tji5SJr2cUAW/2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCYQOq7gAKCRALxc3C7H1l
CCVkAP9ewEE5YxlvJTLGwgWCQ1me56bz6NYctKIVeDXFrONKFAEAlkWBU/i8w4tS
q1gCr5+5o1rQYPbc/3otApdLFllmCAk=
=g1ba
-----END PGP SIGNATURE-----

--74tji5SJr2cUAW/2--
