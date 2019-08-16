Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0818FA8E
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2019 07:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbfHPF6i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Aug 2019 01:58:38 -0400
Received: from mga06.intel.com ([134.134.136.31]:53270 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726571AbfHPF6i (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 16 Aug 2019 01:58:38 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Aug 2019 22:58:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,391,1559545200"; 
   d="asc'?scan'208";a="188717814"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga002.jf.intel.com with ESMTP; 15 Aug 2019 22:58:12 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] USB: phy: fsl-usb: convert platform driver to use dev_groups
In-Reply-To: <20190815125903.GA17065@kroah.com>
References: <20190806073235.25140-2-gregkh@linuxfoundation.org> <20190815125903.GA17065@kroah.com>
Date:   Fri, 16 Aug 2019 08:57:55 +0300
Message-ID: <87sgq1abz0.fsf@gmail.com>
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

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> Platform drivers now have the option to have the platform core create
> and remove any needed sysfs attribute files.  So take advantage of that
> and do not register "by hand" any sysfs files.
>
> Cc: Felipe Balbi <balbi@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl1WReUACgkQzL64meEa
mQaiVg/+PLz7Wut/m5FKe5khZqYZxwPPavDXRSRtsCB48Wa2F1NF7SjANtiuNYfN
3e6cVykBRdhSyptPsWIcYZnhhArHcwKO+ezWcrzrcNLxU26ILPRpvscdoBI0vzSH
I5BFEn46RRUulOj2tt0l/Try2c6TT7Oa27KuSoD4Kf4d3rA0lNf4+DeDDHyygcom
FBmNndygXs1VIrfkXNBsUp0zqYO2BaBem7zVcrFurMHOryXCiYfOEUz/l9x5upHl
IOWAPuBXy7RDqvd974Z0VjO0dAURAWXmuZ5jAE6gk30Rmfa6+SEks017etJex97N
K5Z3gYCs1sB1Yrc6g9rPLCzY3JJsLGBVKDX3B8/FAx2bwWKQfUOcX2mAC6obuY0A
o/gT6lvRK+5XWbYGY5W2RgfG7tUL1tqHUHddquSSdoSZDA+PW8EUT1xPwREtGzsY
JMGZvKZgUMdxcsW5Mupa141dUu0roFvuffQMayQVXdJvYlxYdBBOEdn3yCZrYpYc
5mFSWrrZwfSvzSoqRUG1hdybfVQHXO6JhcKsgrfSzEbxBlw+XoJ7ifPCGQts1B6B
uWRIOTEFP8lWHZUe8efSWipHRZ+ENxtvC2vrBuMlMxCliZZT4HtwHjc+HPLLtE27
3orSQx+4vcUM70xJ2XfyKl1JxJ+8dQdDhe8Sr6nCGJElD3vmlHI=
=U4ex
-----END PGP SIGNATURE-----
--=-=-=--
