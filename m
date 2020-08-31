Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F738257711
	for <lists+linux-usb@lfdr.de>; Mon, 31 Aug 2020 12:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgHaKBf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 06:01:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:38980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725964AbgHaKBf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 Aug 2020 06:01:35 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 46A4D20693;
        Mon, 31 Aug 2020 10:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598868094;
        bh=lLx2Ey81TzBg7dE9jWkl1Mkl3hQyRRkBnLH3kHIdR/A=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=LHoK6LQY4zjoTguUOZDfbWaq5q/7l7ph5qW4GHSPBHoInJ17PTQZFTl7MWHVAjl0N
         DXh0KvmwgD2+g7ZdpTaQyQwlE3jZw90HzrzhV27B0WgZ4ul8RQL3KEH5BOXlyczrR6
         3RMpks5P0x12s8sbAaGYSZ/aNUv9txQU1Y2m0TwQ=
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 1/8] usb: cdns3: add runtime PM support
In-Reply-To: <20200522103256.16322-2-peter.chen@nxp.com>
References: <20200522103256.16322-1-peter.chen@nxp.com>
 <20200522103256.16322-2-peter.chen@nxp.com>
Date:   Mon, 31 Aug 2020 13:01:27 +0300
Message-ID: <87sgc39ls8.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Peter Chen <peter.chen@nxp.com> writes:
> Introduce runtime PM and wakeup interrupt handler for cdns3,
> the runtime PM is default off since other cdns3 has not implemented
> glue layer support for runtime PM.

it should be left disabled by default even after every glue implements
it. Enabling runtime PM is a policy decision better left to userspace,
IMO.

> When the controller is in low power mode, the lpm flag will be set.
> The interrupt triggered later than lpm flag is set considers as
> wakeup interrupt and handled at cdns_drd_irq. Once the wakeup

This sentence doesn't parse very well. Do you want to rephrase it?

> occurs, it first disables interrupt to avoid later interrupt
> occurrence since the controller is in low power mode at that
> time, and access registers may be invalid at that time. At wakeup
> handler, it will call pm_runtime_get to wakeup controller, and
> at runtime resume handler, it will enable interrupt again.

Then what? Are you going to, somehow, process pending interrupts? At
what point?

> The API platform_suspend is introduced for glue layer to implement
> platform specific PM sequence.

I really think that's unnecessary. Why can't we rely on parent->child
relationship for this?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9MyncRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQa76A//UvtcEGUdd+qdbcBbsRpdiB6Iy5V6JqTj
resa1jMpM79xV6wRX4lxip4ZOoYBoZUd8t6UWanpbdUOcSO2tGAqFzJA1w7xN7fX
W6EvUZyUUjIdwkPsGBpOfydqxRZEuzx4QbEwKpIwj03QP4FYskNAUPEVSyH/IImS
tTbtvjGk22Xv0cjmLOsO7jhZQQEikecsw6L9/ZPtA9pxBdQWnyUDoZscJIxCxuvz
FzNtMHofAoVXa3e6GVexe8IN2cOZVlbgpYKDiZEICEfcO6KFD+xLD0n5Ozy9vNHs
afr+8puusrMpZVuO3QA10SZfvCkZtw7ZWfp7XGIWBKM0rOHQQeH+j0tKcL6AGCAr
ozuvd4kQY4o++DRjA2iq7fGrDxquKwEQVazazAIcHIWuugH7i7mnjvY8nx8z2fph
vIW48XsyP3SZGs4FhPeJbbQgVice+CsZzz7By2jVAH/JbQ1YPXNES6wLNfgGMyD5
l3IYoLFNsKPiiVZV2U73lq+LZv4hDYjS/CZxPfmUf/5bplXT1rA8t1HPgIiUF9TB
PXEAjAagiCn0cwWjSZxg/KzpeyRIXBpsJIzI7NYSSVo79FUn35Db/UOL1vdhh3rE
9GMezTCK9tMi7Hn+Yq8G7fB4i124/31zGg3VSBj5xLZO1LhvH77DUfO0lWzDsF3n
brRHke1/e0g=
=4CHD
-----END PGP SIGNATURE-----
--=-=-=--
