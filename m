Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9B4247D6
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 08:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbfEUGMs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 May 2019 02:12:48 -0400
Received: from mga07.intel.com ([134.134.136.100]:30188 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725798AbfEUGMr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 May 2019 02:12:47 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 May 2019 23:12:47 -0700
X-ExtLoop1: 1
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by FMSMGA003.fm.intel.com with ESMTP; 20 May 2019 23:12:45 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, devel@driverdev.osuosl.org
Subject: Re: TODO advice for octeon-usb?
In-Reply-To: <20190520230532.GA3621@darkstar.musicnaut.iki.fi>
References: <20190520230532.GA3621@darkstar.musicnaut.iki.fi>
Date:   Tue, 21 May 2019 09:12:41 +0300
Message-ID: <87d0kcibdy.fsf@linux.intel.com>
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

Aaro Koskinen <aaro.koskinen@iki.fi> writes:
> I'm looking for input what should be done next to get
> drivers/staging/octeon-usb out of staging.
>
> Thousands of checkpatch errors/warnings have been fixed (starting point
> was <https://marc.info/?l=3Dlinux-driver-devel&m=3D137028876225266&w=3D2>=
),
> also the size of the driver has shrunken considerably.
>
> If there are still some other bigger issues with this driver, please
> let me know.

Looks pretty clean to me. I would simply break that single file into
smaller files if possible (see xhci/ehci for example).

my 2 cents

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlzjltkACgkQzL64meEa
mQaO2g//X/k/5DN6vm615lAlxzfGXbUxrst5JgEXj0XR46jM5pQ/HFRDncQK5QoF
tbK6roUUq1u9cxJI+OWrMysqIxdTc87v5lz1+Rr6viBbzRoowx6P4NXUE2tWS1IQ
CyWyrThfKuI1yj9hDqWnF8iY9PVvY+o3wbe8vajuSnzxbNF5E+63XEWdeqB0year
Fap/TAKBpiUcPZwtVq2mKre/vV837yhHYeb3oxIgJ8Z2t9lf3yqw1hyydyT5R4kW
+rCDAfXfpA7M/WExVUeelU1zX7BCZy2QcOGerccF6zauiD83vCdDlbsy9eQOMWjk
jEKcHdYW7SMEEAH0hF0Na82lyH+ecpkr62Zx4Zz5X2+Mj+Rd/olNW1pIBSwd5GzH
sGEjlBWApgtltd+06mfylh7cuEpJxe2uNsEJTLVhEw3LI7B/i5MPGdKoDfaehRuH
w5piM/Ffm0ZW3ka9wdOfR+EvXocMZi73YUlU/30jthn+c+bkuZO3mjQsRTrs5gYF
zGYdyXxphloKcd5w4521PeOw2Yr0TIFD9yOnIedQtRah9z91owFDNVtgYGn3GY2M
2yU0rByEkBFlCXwSQYpyyyN9WWlwZtaNO7mmmdd7qpfdmO76rA+ahRmvVM/1Uhil
BiZvCAVOBp0hSWh8sy8Qt1+goJUMrS/X4EgL83ZEywc+xh5MxvA=
=30aF
-----END PGP SIGNATURE-----
--=-=-=--
