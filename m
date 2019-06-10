Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 663263B007
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 09:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388218AbfFJH4P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 03:56:15 -0400
Received: from mga11.intel.com ([192.55.52.93]:17276 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388206AbfFJH4P (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Jun 2019 03:56:15 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Jun 2019 00:56:15 -0700
X-ExtLoop1: 1
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga002.jf.intel.com with ESMTP; 10 Jun 2019 00:56:13 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
        "leoyang.li\@nxp.com" <leoyang.li@nxp.com>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: fsl_udc status?
In-Reply-To: <95d5902538997e340ccf7784406832904d512b51.camel@infinera.com>
References: <95d5902538997e340ccf7784406832904d512b51.camel@infinera.com>
Date:   Mon, 10 Jun 2019 10:56:09 +0300
Message-ID: <87v9xdc1ra.fsf@linux.intel.com>
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

Joakim Tjernlund <Joakim.Tjernlund@infinera.com> writes:
> We are trying to get fsl_udc up and running on a T1042 with without succe=
ss.
> Seems like this driver is lagging behind the corresponding host driver(mp=
h).
> The mph driver has a number of USB errata workarounds while udc has none.
> At least erratas A007792 seems applicable for udc too.
>
> Is the fsl_udc driver functional on 4.14.x(which we use)? What is missing=
 ?

If you're on v4.14, then you need to ask for support from whoever gave
you that kernel. In this forum we treat mainline only, which currently
is at v5.2-rc4. Unless you can try that version of the kernel, we can't
really help you here.

Good luck

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlz+DRkACgkQzL64meEa
mQZBORAAr3+SUIDwUTAgbQhQjSvX/vl7o/zAnSt4aAtWqMT1lWe3V/zSTe2DO2gE
assP2yUl3qp8Hc8YZ0t2HI662PQ7HBF47FoA2k1hJiNTI9hsjHWctZEWDBcWQExM
GX24S33GZS93DiCKWBSFebz5ia4Oj+dIKVfYt8W0q9CBMK2b5qMfbqxM698kSQW4
mSvd8U3Hky1XjSAQWvodLjiPwQReAkMAz6Vv5NLquM0M4Q9Da/2gJz+QyM/yLusF
6yTExNfndIQqtC1FnF213ZeLIjHIc6b/wwh/JtE/Bn3HzAFTeFaubMRpYEs2hWYx
FkyMg07+VeTG7E6bJfjdP2dTrxgUSdHhF+VEtqJKEtg1kCx5338WB8tuQzoAG3zt
da66e9HVWAXqzCCcaNQ2xsCa4gl2CFxD3DQc6IpLwSj+Kf+R/HbIAb34wxcKPyO4
hfT6kcCI4IgBCMQidm6YfEuv13yip8YA7jjLXLBDUD3VVoag66W++LIt8X8/D5WO
02YS2UAC5DmjnE8hGIJmMMZJ23P1IKlgxA4TqwdmAKH5NMKi8e9OC2JKc8Fj4jNA
YSHM5Eg6v1djX0l7QCMD9T5TZIQqPVRRHBDmt+QpEfBec7f2B6wnB1mUMLAyKzAO
8bFf+g68QYahIcZ2HDpWaAB3Oj7YEcBlcZqyCypxB/0C8Mlr12k=
=ZqKi
-----END PGP SIGNATURE-----
--=-=-=--
