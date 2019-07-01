Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE00C4B20F
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2019 08:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbfFSGX2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jun 2019 02:23:28 -0400
Received: from mga05.intel.com ([192.55.52.43]:4432 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725899AbfFSGX2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Jun 2019 02:23:28 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Jun 2019 23:23:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; 
   d="asc'?scan'208";a="168149774"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Jun 2019 23:23:24 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Johan Hovold <johan@kernel.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v1 14/22] docs: usb: rename files to .rst and add them to drivers-api
In-Reply-To: <c05aecb424e4f835e3f7872ecb5818e1d2f3267c.1560891322.git.mchehab+samsung@kernel.org>
References: <cover.1560891322.git.mchehab+samsung@kernel.org> <c05aecb424e4f835e3f7872ecb5818e1d2f3267c.1560891322.git.mchehab+samsung@kernel.org>
Date:   Wed, 19 Jun 2019 09:23:20 +0300
Message-ID: <87d0jaf607.fsf@linux.intel.com>
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

Mauro Carvalho Chehab <mchehab+samsung@kernel.org> writes:

> While there are a mix of things here, most of the stuff
> were written from Kernel developer's PoV. So, add them to
> the driver-api book.
>
> A follow up for this patch would be to move documents from
> there that are specific to sysadmins, adding them to the
> admin-guide.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl0J1NgACgkQzL64meEa
mQYhZA//WyWYVQhSfqSZK4mZdZEvIudhabpgzHeZjKLzJAt78TzAZFyjoqqZ+Ntz
sNJF91crs8/FdI8ZgZHge2v6bFR33grFciFYXCe6xDLQ4eFaUPCca+eiMPMiBPzC
ClMJXA8H7JpFVRmYLHtV5znv+LJMLJ1jLWLCNcquZF2aznCLGmMM9haD6tvT05N/
Jkk0PiNWcekVAcgl0DYMPC3BHo0Hso2xcbNYgTp05gQPRSqNv08uTPEG3ELsmYrd
/tUF3dnSM9RGkmLrmzsY1z4FFggmKi4b27wdd75yR7hDswqQRhKYKJO0oA/1Kxuk
Nq1xzwMmhVbIqywf2mOM+bubZa4J6YPA/2mR3LvAxNaP8S9MjhBW++KeBHPsoNxi
0vlBl03fqTe9dSoTTp0z718ygVhms3LBGF1sAiEZU4lWcvs2DhdE0npsWV9BZw7G
soVt3qEiLjyqwIMsAlav1GTxjwwxD6eaVXqvt0NwBxy2qElY8/hUmwCVpZaV99vG
3HUzqGMK5VsyE2HIgHLs4sk61+Fiprav38oNw1tOAjoN+0LLeCSGYNKvGB+C9juA
2VMfH9myIV2+RfYV0AxSKSxiJ1vDwDpDkrtFdxgqXvaL05/gqUlQfRQc0HGN4CBR
cdpmxhwnw2Q3Vu0x7eR3GRfYS2hMBmQv0flpB74/ipcj3FEXC9M=
=JmTg
-----END PGP SIGNATURE-----
--=-=-=--
