Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6DD82F1765
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jan 2021 15:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388124AbhAKOGA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jan 2021 09:06:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:59350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388401AbhAKOFy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Jan 2021 09:05:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1465A2071C;
        Mon, 11 Jan 2021 14:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610373914;
        bh=4EBTzzSDpJtlq4nXYgd8uhU5VLbAky7rvE2jQKIA46s=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=XaiFjnMQJCVqXZbi72thQn+nS9bz9yCJ5I/Fl2JK7RlTSObcMkvSavsJ+Fec1FfdD
         83rz+pNrgr19b2IaURMz2w/3w4jS/QAiTmTTcPAIwAuyxlfFigvCA4qdz3Iq1rBdPc
         K41IkRe46l7Lxj3zvCecwusRqHuWwEPTQgbE6iz35d1cMdy6gbeLBsMxeyWgtVc5y/
         C7xHs1R7tAF+txVyDsplMe5+XeuOYEjYf78i+C/dAOYobbXdDwpGKUR8Y9KkmFb7hM
         3UuBXndm2QzkgWESDr0ndvzrZ8i0TckZnww8C2a+X3dl3aORQufdTfU5rfpJBHxeW7
         +cNqGAtX45A6Q==
From:   Felipe Balbi <balbi@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [RESEND PATCH v1] usb: dwc3: keystone: Simplify with
 dev_err_probe()
In-Reply-To: <20210111135539.57234-1-andriy.shevchenko@linux.intel.com>
References: <20210111135539.57234-1-andriy.shevchenko@linux.intel.com>
Date:   Mon, 11 Jan 2021 16:05:03 +0200
Message-ID: <875z436034.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

> Common pattern of handling deferred probe can be simplified with
> dev_err_probe(). Less code and the error value gets printed.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl/8Ww8RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQY5Xw//SoP6HIIO/VPD1DAgT4xteQi0DggvGuf7
riqqwH08RnKVNMMvL64SmLMAXjeLoONWI2IiS+509qs6AP12WwhefB127Jw3WwbO
fwHp02Q+knFidDhgbUZmYN2YQB2+15pPZg0LvraiY6iPc3susRjTPJJAc+e8e3Tf
/pvhkMVXR0ffiwnIgrpRLHZL049N95bO+QyA5l62GxeQFt80rV0e1qNFue7N47/O
ljBA1gqvn3HwvtgBsolq9u6eR8W4g0ApSRPv29KEhIfFmcNzpsFtfjTfKxhRpkze
nGyzpWdKciVOxMpLOrriQWHTvrUwyrBUYMwGBBZVdH1IC3wl5/p8qeuMBlLrLnvg
Y7JUdWCRybVSSjnl1f1yqWT3PbiCpISAuXluPrdP67P44ucAUpUTDPwL1hMjdFnR
EADNH9mb8X5MLtbJm5S8U1+1Usfbyq069Ic2SSVcb9t7K4tJWgYB0PsSSBD1tztQ
xwEIoEBue53WfkdmlMf0NnHKM44w1RXI34nqhDHXi/8sc5mKYwPMTafKDAS21KsY
MU8n2/1s40etIgOREvQvZQHZIahlfmNSkQq3tq0QJNWekfsEYam38bO8+yRep5Cm
tvvRNBMp9S3Q+MIFHWs3VXxOXyhEIOVLtbGr65yOO2CuCuvEULEN8fnosJxOj2B2
VH17kOj73D0=
=CNd1
-----END PGP SIGNATURE-----
--=-=-=--
