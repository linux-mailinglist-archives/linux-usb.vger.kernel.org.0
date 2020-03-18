Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A227B18A926
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2020 00:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbgCRXU2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Mar 2020 19:20:28 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37485 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgCRXU2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Mar 2020 19:20:28 -0400
Received: by mail-wm1-f67.google.com with SMTP id d1so87969wmb.2;
        Wed, 18 Mar 2020 16:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YNvgc32Yj8B/ZWFedujmba0NXwHYk4Zaqs+FyfA8qBs=;
        b=NnYTEH/vji7QJ/cBb1SBkDh3tsEaYb9r/E2AyOjUQ88QLPsAizJjvC5k0PrMHclQrk
         GB6Mw5pkMn3snPkARWPMsoRyThXTkqfsjpdJ7etrFYrqLECkMmZA8sN4stdoZvy8RHDg
         MMJ4jgtSzm9yv7ryTAU3xfuvrEIsZZfZShGXPSyt4rOXVejDtXc5SrPSiS9CgdngR7iE
         mMDLZ8KQ/LCASacwjAXorK1KmymdQRKsCxOFpPuP/9whHVxKmeZAqHBs76LDvB53vt92
         qVgBL5ZhQEB7WlWGWBBUOBclf6UIAliZ1uTKkHcViSF6fVYzcgddVGwMfiC+5iRf+BY7
         cIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YNvgc32Yj8B/ZWFedujmba0NXwHYk4Zaqs+FyfA8qBs=;
        b=jXUKphQHG7MWBugb15Q4gVUlDI3KOztFuasXKCplHWpUmZaacxNb3nNVrFzOQUhoEU
         i3jvmxoTauLaKFme5SFZjZVwKDdO3SWKK5rnD+S7/wyXs30Q8tN9+S5V6wOIkGEv6gvB
         807UfKLmmR54F63oiYlZ8vaKcsSFZqWztPdZAJQ/gRvnUjqOusBLFLbxY53mXwttJuUI
         G+1e5ZbZxeZSDbKlVSyysAkQeQ4Cdd/mCgUvPo4PHDcE1A01o5HBxaHgCWh0760ly51l
         DK1y1JfxSTkYHy5EH+q7y6Xq5LVUoSptGIuIvevEH3X1rOeHo19s2poMOjW/1rozTr6d
         nj3w==
X-Gm-Message-State: ANhLgQ38OZtKpd6pqm0KxvWSkip4JSAPxZhL2N4i0GJG1TloiJoJ72LO
        wz2PhAdNtYu0B9VZ8HClD/5AQFbj
X-Google-Smtp-Source: ADFU+vvFamwi0x2RLmnTMOcPWCZYogHZ/mH/TzgVKwbxYHLdsPam/oqMa+XXC2vCMvGlQjxZk2ikxQ==
X-Received: by 2002:a1c:7207:: with SMTP id n7mr92577wmc.138.1584573624939;
        Wed, 18 Mar 2020 16:20:24 -0700 (PDT)
Received: from localhost (pD9E51CDC.dip0.t-ipconnect.de. [217.229.28.220])
        by smtp.gmail.com with ESMTPSA id h81sm465786wme.42.2020.03.18.16.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 16:20:23 -0700 (PDT)
Date:   Thu, 19 Mar 2020 00:20:22 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL] usb: tegra: Changes for v5.7-rc1
Message-ID: <20200318232022.GB2885069@ulmo>
References: <20200313170730.2924259-1-thierry.reding@gmail.com>
 <20200317185835.GC1480055@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline
In-Reply-To: <20200317185835.GC1480055@kroah.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2020 at 07:58:35PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Mar 13, 2020 at 06:07:30PM +0100, Thierry Reding wrote:
> > Hi Greg, Felipe,
> >=20
> > The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea098=
62b9:
> >=20
> >   Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)
> >=20
> > are available in the Git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/fo=
r-5.7-usb
> >=20
> > for you to fetch changes up to 9dd4fbef2f88ccf46f5294805bf121d6554791e8:
> >=20
> >   usb: gadget: tegra-xudc: Support multiple device modes (2020-03-13 17=
:16:28 +0100)
> >=20
> > It occurred to me that I could just as well send this pull request to
> > you guys, rather than take it via ARM SoC. Kishon already acked all the
> > patches for the PHY tree that this series depends on, so I've included
> > them here as a dependency.
> >=20
> > Let me know if you'd prefer that I take this through ARM SoC.
>=20
> I tried to merge this into my usb-next branch, but get merge issues in
> drivers/usb/gadget/udc/tegra-xudc.c that I really don't know how to
> resolve.
>=20
> Can you give me a clue as to what to do here?

Let me rebase this on top of your usb-next branch and resend this PR
after resolving the conflict.

Thierry

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5yrLYACgkQ3SOs138+
s6H07hAAoRtKHCeERZPuj3qTdFkm/k6KVMKDmmjN2Aj7jLVTbGGNrcjplf5J5bWO
9x905oLXFCmcerVaX/oK6Q68feEWkpEEC6dQrDssixyN6hmEDH534KpM9NxFqUFR
XL4FYYcwlhIyQtMSx/8i3gs8efPdjreKg0BPXbej4fWYWc4/IwD+WMJa7B5bzYfJ
F5spv1T08zEn5QXzOJ6rdmTBHKZ6ximxHZbbrmltm7YvCQweOGykmnuo+FNNmMOm
IvjBaYQZ9iqhfc2cEWzKmyV8Oitwx07McTEtUcr/AfKHEA29jGNSafyQJVxUo2Un
FMoi9WNnUR4fRAAHLSnYqiKH2yoYqFAZOIrLDWs92eRlHUia2x6+5ZdxXaZbQ4Ln
kozSV9D240VBWZUb0BW5g4oSjYkIkC8O/hYxah1T3aTIeHAcS2Jv4kWBfO3VL2K6
BJIJxJOniwGIy6gRlPvYHLHffmqJD05aDDZXthSyawdp81EUmj3qBfjN1slQH3mk
anW8v+/DaaNons4dlnVXt+uc7Y2ZDcD0h/i+FODe5EgFtSd1+HNbgbVNNVIRw0ts
BAF0EG1U1+kpJr8W6y6vcgaeSRjxjmQ5A/ZKgiTEsbU/kwudkCKBXCVddHYpo6rv
fTBjr3t+jDNnavS5/LDVNj05bEDglTKZQy03z95XinXgl47ulOA=
=tYCX
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
