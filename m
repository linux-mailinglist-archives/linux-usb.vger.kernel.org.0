Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB1B30CC1B
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 20:46:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234387AbhBBTpA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 14:45:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239969AbhBBTov (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Feb 2021 14:44:51 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B28C06174A
        for <linux-usb@vger.kernel.org>; Tue,  2 Feb 2021 11:44:10 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id y10so8821316plk.7
        for <linux-usb@vger.kernel.org>; Tue, 02 Feb 2021 11:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=be7aBeIY/8GVSevF3q1F/dqUWCcQlFIIlaYYOVflylo=;
        b=sdNBl36acOZEVoIf9GpSfHHlHwntB72XtuUKJhldfLmaYNcslLPkajfu93vSPFEa02
         nL6lt8tMT27Fa9S8KDIVWVenltIyVKMZcCh8N79IjNDz1rvM8ZoJLVRAOn/jvHMibObh
         J5XsmUTm2FpHJczthvW3mwhO2DH72u32qnCr7SPWnYSS/a9Erlb5D2wrXbOrPpVMy135
         i+lqTR24UiEODyseZYNe+zIyL/Qz4fxMx/j7sMQs1/GqNuzryXJsRVCQPZrNZ9/1M2nG
         x4GU7Q8f8kw7C3VhYweFsf2ktxHD9erANuA2g/Cuj8sm+KLdl7/RmA5vKnIu+Bm6qT11
         BE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=be7aBeIY/8GVSevF3q1F/dqUWCcQlFIIlaYYOVflylo=;
        b=r3Ni8orIKEH61I5jhG4KpMJg2pfmqzNTE5b37i7niNSqU8tMeL47PQMy6WkBZHFLKm
         mF6I2h3GIJ0JwtZm8GbFwkbaS3YX7G8/i3XvaTHhuH+eclGMbsT/zg7YD3+lcPSmo0X/
         khgQ/jeP6gp1Ln/+aHtz9sZngcQvf+9U9za1dscwq03PwQ4fZkCpQDj5TEnWpTe19zbC
         fuVjuNhYMZk/y8Zg6yLCNQ9X9qJDqaJL/isvYA5dyAHO5zmyWfaUplpGFqKFN0WDrKln
         L7cnUIwGZA3jWw7Id8Rn+kslLwOMLvciUbcpbRrjijTG3L6FlF5GTWCwI5wjmEzYcocr
         1cUg==
X-Gm-Message-State: AOAM530ygcSzeCnzqcZP/VlL5mVNCKLZoR2Xo/j74cWBD7/NOiGWOjcY
        d7AkNd6fxbZVWwQSO7bzbQwklg==
X-Google-Smtp-Source: ABdhPJx1/aUcWTdTWq0Qh9m8KnI3edPhARgNztAGZ/DGRuijGaT4Qj6RIGSY7bSAYZiJB6f1Y+erFg==
X-Received: by 2002:a17:90a:4611:: with SMTP id w17mr6042809pjg.18.1612295049928;
        Tue, 02 Feb 2021 11:44:09 -0800 (PST)
Received: from google.com ([2620:15c:202:201:f693:9fff:fef4:fc72])
        by smtp.gmail.com with ESMTPSA id r22sm23075435pgu.68.2021.02.02.11.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 11:44:08 -0800 (PST)
Date:   Tue, 2 Feb 2021 11:44:03 -0800
From:   Benson Leung <bleung@google.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Benson Leung <bleung@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Prashant Malani <pmalani@chromium.org>,
        "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Kyle Tso <kyletso@google.com>
Subject: Re: [PATCH v2] platform/chrome: cros_ec_typec: Fix call to
 typec_partner_set_pd_revision
Message-ID: <YBmrg+hxqNQkUUPg@google.com>
References: <20210202164531.3982778-1-bleung@chromium.org>
 <YBmFo5L1eeUwCJ9B@kroah.com>
 <CANLzEkuFgLK9saqHhHdrKhOjsiG001d1N9EYXsnohoMPHsAPGg@mail.gmail.com>
 <YBmaLi5hhEj1zy8J@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2wqZXJn6hDALmgK+"
Content-Disposition: inline
In-Reply-To: <YBmaLi5hhEj1zy8J@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--2wqZXJn6hDALmgK+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 02, 2021 at 07:30:06PM +0100, Greg KH wrote:
> On Tue, Feb 02, 2021 at 09:52:13AM -0800, Benson Leung wrote:
> > Hi Greg,
> >=20
> > On Tue, Feb 2, 2021 at 9:02 AM Greg KH <gregkh@linuxfoundation.org> wro=
te:
> > >
> > > On Tue, Feb 02, 2021 at 08:45:31AM -0800, Benson Leung wrote:
> > > > typec_partner_set_pd_revision returns void now.
> > > >
> > > > Fixes: cefc011f8daf ("platform/chrome: cros_ec_typec: Set Partner P=
D revision from status")
> > > > Signed-off-by: Benson Leung <bleung@chromium.org>
> > > > ---
> > > >  drivers/platform/chrome/cros_ec_typec.c | 6 +-----
> > > >  1 file changed, 1 insertion(+), 5 deletions(-)
> > >
> > > What changed from "v1"?
> > >
> >=20
> > Just the "Fixes" line in the commit message.
>=20
> That should always go below the --- line, remember, some of us deal with
> hundreds of patches a day :)
>=20
> I'll go take this...

Thanks so much, Greg!

Benson

>=20
> thanks,
>=20
> greg k-h

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--2wqZXJn6hDALmgK+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCYBmrgwAKCRBzbaomhzOw
wrbtAP0cTRnK7uxA4/uovfcaIbD41XJv7FBIOjtwyY7s75QBlAEA0Zb3xNXFZNp2
fFkEELg2P2sRLhCj2T69DXlKTPm9IwM=
=geEL
-----END PGP SIGNATURE-----

--2wqZXJn6hDALmgK+--
