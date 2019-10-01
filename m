Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B847CC2D1B
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 08:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbfJAGJb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 02:09:31 -0400
Received: from mga06.intel.com ([134.134.136.31]:16527 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726672AbfJAGJb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Oct 2019 02:09:31 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Sep 2019 23:09:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,570,1559545200"; 
   d="asc'?scan'208";a="197767956"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Sep 2019 23:09:28 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Cc:     linux-usb@vger.kernel.org,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH V2] usb: gadget: composite: Fix possible double free memory bug
In-Reply-To: <1569842311-10353-1-git-send-email-cchiluve@codeaurora.org>
References: <1569842311-10353-1-git-send-email-cchiluve@codeaurora.org>
Date:   Tue, 01 Oct 2019 09:09:19 +0300
Message-ID: <87d0fhvvxs.fsf@gmail.com>
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

Chandana Kishori Chiluveru <cchiluve@codeaurora.org> writes:
> composite_dev_cleanup call from the failure of configfs_composite_bind
> frees up the cdev->os_desc_req and cdev->req. If the previous calls of
> bind and unbind is successful these will carry stale values.
>
> Consider the below sequence of function calls:
> configfs_composite_bind()
>         composite_dev_prepare()
>                 - Allocate cdev->req, cdev->req->buf
>         composite_os_desc_req_prepare()
>                 - Allocate cdev->os_desc_req, cdev->os_desc_req->buf
> configfs_composite_unbind()
>         composite_dev_cleanup()
>                 - free the cdev->os_desc_req->buf and cdev->req->buf
> Next composition switch
> configfs_composite_bind()
>         - If it fails goto err_comp_cleanup will call the
> 	  composite_dev_cleanup() function
>         composite_dev_cleanup()
> 	        - calls kfree up with the stale values of cdev->req->buf and
> 		  cdev->os_desc_req from the previous configfs_composite_bind
> 		  call. The free call on these stale values leads to double free.
>
> Hence, Fix this issue by setting request and buffer pointer to NULL after
> kfree.
>
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
>
> Changes in v2:
> 	- Modified commit text.

These two lines...

> ---

... should be after this tearline :-)

We don't need that in the commit log

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl2S7ZEACgkQzL64meEa
mQYtlQ//UvIJCNxQ7JGbg5IyQZdednaTN8e/y+J5ghBW84V2kee93gprTMCvz2E5
UCZgRkXXxE5nkjHepyL1zz+N49JE3fAMO6pARUtgnQiaujgtK5AnZUaOn6rLuilB
MEamNDWyJSvG1wRZqgseOB8oiC5z5Cwk/nrGJ15EBLAMO/ibZJ8V5kjDdOO4nr91
1H83J1+8wWVGRSyV1wnyjEM/JvS3eET8SZLafcxx6ffrlSCv8Fn3ArqLC2+5KFvK
RvgV6sfa3Tjqxg/kJGFWUaXKaTOAYrd6gdHzCs6ojEgpuMvy5zfESk6AWg7WqI3r
4YLRaOEqxraQB0fLWjVQbyt473Ir8T/2vCe76pRDFu4PaZgGV47/+2N7BT4AL9ZE
GSmMtOLgrsGAuQHiT2D3qt9DeM4y5xYQ227ffgnaDrj5mVzvl+lvia11WwfYO3/P
Y+4v1TmnvxvtFsGOZXnUM7V06l6HntkqbV3ff7+xPrYSnx8CthabNSE3Dvj5FYfd
AVZyB37xReIOdTJKpLcN7OpbixTtsBNWD4/jCLT/rH+TFNdDZbWmPl85nsAnEAR1
/RYJCRBn0DEdRRm1pTEIFnWyPDeQPLwu4e9AdeX6Jtua2P7B8zw1/6zrg0mxCcap
dfVg8KjE9H7gsgRdv0NHuVOK8dM2npWQ6MoqtnbdXq/rqaRM5Zo=
=VuE+
-----END PGP SIGNATURE-----
--=-=-=--
