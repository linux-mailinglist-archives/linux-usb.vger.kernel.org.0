Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64A26E173F
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 12:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404290AbfJWKCA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 06:02:00 -0400
Received: from mga12.intel.com ([192.55.52.136]:17813 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404097AbfJWKB7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Oct 2019 06:01:59 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Oct 2019 03:01:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,220,1569308400"; 
   d="asc'?scan'208";a="201087087"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga003.jf.intel.com with ESMTP; 23 Oct 2019 03:01:57 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     alex zheng <tc0721@gmail.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        David Laight <David.Laight@aculab.com>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "xiaowei.zheng\@dji.com" <xiaowei.zheng@dji.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: BUG report: usb: dwc3: Link TRB triggered an intterupt without IOC being setted
In-Reply-To: <CADGPSwiCY9=kUpKmcUwAhvCHmvGDSrxoBXEkzgQpEpiakKEv6A@mail.gmail.com>
References: <CADGPSwj3aTJjjHvPSZVgxNRGikznL5i=-8Q2hOUb1LoLbWcRDA@mail.gmail.com> <87a7avh8uu.fsf@gmail.com> <CADGPSwjTn1KwMcxKdajNwxbLi09-SQ1Eu=1m57Z+LNnj0i2BeA@mail.gmail.com> <106544ca-7a01-0a86-e785-c7c520ebdc4b@linux.intel.com> <CADGPSwi87a5+3mCGAgptHgpBsQk9STQrEKs-kC6Nw55nPdRtOw@mail.gmail.com> <5431a9df-3816-b525-c3bc-4e7462d0f38f@linux.intel.com> <f5cd8ff1767c48a0bd86e743ae128b10@AcuMS.aculab.com> <87d0fny5in.fsf@gmail.com> <52a7b158-ab76-432a-4d2c-7b731dc9c2a2@linux.intel.com> <CADGPSwgJMKfQChfxMNU4S_xv1vfHr7_GY6rGwgeDOVuW6+mpVg@mail.gmail.com> <CADGPSwhCPvdu=KmQP6RHMJnh292UO0uBAt+KyJqqOWY5DWDc3w@mail.gmail.com> <CADGPSwiCY9=kUpKmcUwAhvCHmvGDSrxoBXEkzgQpEpiakKEv6A@mail.gmail.com>
Date:   Wed, 23 Oct 2019 13:01:52 +0300
Message-ID: <87v9sfixv3.fsf@gmail.com>
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

(please don't top-post)

alex zheng <tc0721@gmail.com> writes:
> Hi, all
>
> We found that this is a known issue of synopsys DWC3 USB controller,
> when the PARKMODE_SS of DWC3 is enable, the controller may hang or do
> wrong TRB schedule in some heavy load conditions.
>
> Setting DISABLE_PARKMODE_SS to 1 can work around this bug.

Is this something that affects some versions but not others? If the
case, we should teach the driver to handle this based on a revision
check.

cheers

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl2wJRAACgkQzL64meEa
mQYvExAAm3XtJkJmA0HCwR6XRgpAkax/SmKAVzlzU1ariCFfzvK/4mOo9jaR1/tn
bC8E8fIAEZMWYK1ekGg2fk6ySP3Far5JIKcdw7XdYQlAigjL/TqLWxAxLzsNZkqy
aHJg3RCK5DC0TtlCO3E6kGZwoCRfEPZMVb+t1FquUL2S9Mg0WbqQBw9wTpudL8/g
vRKVa0DBaJu0n6Or7gHRof3EpnCmfnjUkZOl6zJr0d1XAnE/uuYsTi3SbNL7hg7k
tun1CATKUzE/mnBD1vMh/x0XnrfSeRE1G5bK439Udce18/L0FRxVNQvHRJcBSGCh
hRIOBp7hojyKSsoJGvTGXtonkVqnj30T77DeA0wBqrIg/t1XI8TTODBn5B8to2y6
2U0CLNXjLOpdGow/BvYAwhtvjDW3UDbYWBKb3IkKpDqVt5rRlpY+Zt0DKeHZkBK9
8JS9iyuif0ljEquS9BgyE5ruZfYFj2ianCCnbvyhqoRsXYxEswbD/L/+nuoa8fN8
Hxz3sIKCz4G11urNmjU6/1XKPILg8ReWyShHzU4tT9V3Dk0EoYXf2vFjKaoUO2vE
AKS3sXACJSXb3GVic3DREcOmDSxh9+IB6UZLeuonmqxpQDzgTqi55tdc9Jo1SvTy
341ruOZhJ3rUv+wi2euclt1V+F71Iw990ucz71FHZoCGEtlGnHE=
=liYh
-----END PGP SIGNATURE-----
--=-=-=--
