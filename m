Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC0CBEBB2
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2019 07:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392323AbfIZFp7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Sep 2019 01:45:59 -0400
Received: from mga11.intel.com ([192.55.52.93]:52499 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725870AbfIZFp6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Sep 2019 01:45:58 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Sep 2019 22:45:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,550,1559545200"; 
   d="asc'?scan'208";a="189009469"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga008.fm.intel.com with ESMTP; 25 Sep 2019 22:45:56 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     David Laight <David.Laight@ACULAB.COM>,
        'Mathias Nyman' <mathias.nyman@linux.intel.com>,
        alex zheng <tc0721@gmail.com>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "xiaowei.zheng\@dji.com" <xiaowei.zheng@dji.com>
Subject: RE: BUG report: usb: dwc3: Link TRB triggered an intterupt without IOC being setted
In-Reply-To: <f5cd8ff1767c48a0bd86e743ae128b10@AcuMS.aculab.com>
References: <CADGPSwj3aTJjjHvPSZVgxNRGikznL5i=-8Q2hOUb1LoLbWcRDA@mail.gmail.com> <87a7avh8uu.fsf@gmail.com> <CADGPSwjTn1KwMcxKdajNwxbLi09-SQ1Eu=1m57Z+LNnj0i2BeA@mail.gmail.com> <106544ca-7a01-0a86-e785-c7c520ebdc4b@linux.intel.com> <CADGPSwi87a5+3mCGAgptHgpBsQk9STQrEKs-kC6Nw55nPdRtOw@mail.gmail.com> <5431a9df-3816-b525-c3bc-4e7462d0f38f@linux.intel.com> <f5cd8ff1767c48a0bd86e743ae128b10@AcuMS.aculab.com>
Date:   Thu, 26 Sep 2019 08:45:52 +0300
Message-ID: <87d0fny5in.fsf@gmail.com>
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

David Laight <David.Laight@ACULAB.COM> writes:
> From: Mathias Nyman
>> Sent: 25 September 2019 15:48
>>=20
>> On 24.9.2019 17.45, alex zheng wrote:
>> > Hi Mathias,
> ...
>> Logs show your transfer ring has four segments, but hardware fails to
>> jump from the last segment back to first)
>>=20
>> Last TRB (LINK TRB) of each segment points to the next segment,
>> last segments link trb points back to first segment.
>>=20
>> In your case:
>> 0x1d117000 -> 0x1eb09000 -> 0x1eb0a000 -> 0x1dbda000 -> (back to 0x1d117=
000)
>>=20
>> For some reason your hardware doesn't treat the last TRB at the last seg=
ment
>> as a LINK TRB, instead it just issues a transfer event for it, and conti=
nues to
>> the next address instead of jumping back to first segment:
>
> That could be a cache coherency (or flushing (etc)) issue.

XHCI has a HW-configurable maximum number of segments in a ring. AFAICT,
xhci driver doesn't take that into consideration today. Perhaps the HW
in question doesn't like more than 3 segments.

Mathias, what was the register to check this? Do you remember?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl2MUJAACgkQzL64meEa
mQbp7RAA29UhryY8ZvesqrBPLKC0YqDrnqshqI4lAIWNaGoceXtglXKBI0sP7a7R
PR1otqYYRPQ08HZdcssrb+0/JUqN1254diTxGWiWKfRDh0XUCVO9ltobxL+nAK5H
52kgCHUIFb/+wnpYcBb8PZgvucXiHYyokVzdQTkw9h3hwlURM12zhnu2KhJyLjHM
V08LJcyKU8jJM9yFOhygVNTBLHKeBITKHXgCSCxUwKUIg6cdmFv8IQvdn+ypIbBC
2hkbt3IjWPy4RI5+YS+JpB2HlnLb9TWjKM1xXtma6deBRApD2in7o1As7APGbq+Z
NZjlhAUgc7cGc7N0xjofaxaaYHPxnjc3cmE/2PIcntfazAe90Z2sRMK6S+SJ0E4j
iUYnqAQg4x9dlm7Np9U+L0Vd9C1TAvrPS4Q+X19grvD6Lb2BGjh0CDH7UbYkefhH
yLhExhk2Ir2C1kN/cdw6HC7uKj2MSpm42/x61/Gx1i2NWp0Hv7T4jfKrCr2x/hBZ
MLDAxHIyKFfcVbuNPBH8pyG22VqSAeLHgDDIsu4RwPKUugiVWsZjTFf5eS0fzeAs
iiacktq1G6nbiJn6yHd2mu0skQ0EZJze65+AOAO+L7iRdsc0kKl6zbk7UHmo8gKP
YQ5qeXahUTYGHXVYG8UbCHMOie5hVX7zkaarWLwYqARbCSQ/51s=
=o8PF
-----END PGP SIGNATURE-----
--=-=-=--
