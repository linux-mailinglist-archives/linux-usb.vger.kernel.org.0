Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4E424FF61
	for <lists+linux-usb@lfdr.de>; Mon, 24 Aug 2020 15:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbgHXN67 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Aug 2020 09:58:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:51454 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725921AbgHXN6w (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Aug 2020 09:58:52 -0400
Received: from saruman (unknown [194.34.132.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CAA27207CD;
        Mon, 24 Aug 2020 13:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598277531;
        bh=o9BlmvcB5Gr+9lF+n5O9P3SYHUi+Nkxe6s9/2q78T9o=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=IRlJ+6fEFRNWh7fO5RWDUEsjPBW/gE2Zqf6TkWcxeELMFccPEsNlM1rdpKna3i407
         UB7P/OwwzrYz4OiB0ZGDJ1LBR4HxlTCFWy+WHVwXBy7gF4jbwvwn+636w2J6deEe42
         n1qmjG4SdQcnvo+3fqHsXtKhn72zR6YKevnbjcJc=
From:   Felipe Balbi <balbi@kernel.org>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
        "yebin10@huawei.com" <yebin10@huawei.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc:     "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: fsl: Fix unsigned expression compared with
 zero in fsl_udc_probe
In-Reply-To: <f61f4bc3916f852799edb6af9740afb2118ec84f.camel@infinera.com>
References: <20200824080437.229826-1-yebin10@huawei.com>
 <20200824082122.GA336539@kroah.com>
 <f61f4bc3916f852799edb6af9740afb2118ec84f.camel@infinera.com>
Date:   Mon, 24 Aug 2020 16:58:43 +0300
Message-ID: <87d03gjgbw.fsf@kernel.org>
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

Joakim Tjernlund <Joakim.Tjernlund@infinera.com> writes:

> On Mon, 2020-08-24 at 10:21 +0200, Greg KH wrote:
>>=20
>> On Mon, Aug 24, 2020 at 04:04:37PM +0800, Ye Bin wrote:
>> > Signed-off-by: Ye Bin <yebin10@huawei.com>
>>=20
>> I can't take patches without any changelog text, sorry.
>
> Still taking patches for fsl_udc_core.c ?
> I figured this driver was obsolete and should be moved to one of the Chip=
idea drivers.

Nobody sent any patches to switch over the users of this driver to
chipidea. I would love to delete this driver :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9Dx5QRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQawPA/8CqHT6zk1S2J+/qkvq8DEZIXlhm8dbpcE
CqIW15+nNeGyk6JCrLhtG/q2ySPZgkZzfArbcEznTLWBXHf+XUHZiWKsL4FRj0It
mUX4ScgBErd66faiF448UBfTFiVCUUMGJVaU5L896C/haxmlIebZSlPID7MBOyYI
ouJLXSrwIbU+QDhQfFUhSLwqwKK/ayHD02nsRBaWG12WDImuXZ5w3FlKzKzCYDII
Rsic7GjlUj6hBmHrbyt2beOG9k8Z2EDMI96SddAz+wFzQu9nIlqZPNbNK2qFrI0S
N99f58xP1K+cC+tqn0YI3fEFz2HLb6S31PbcWd2slokfgB5DkJt05J2mRMGF04UF
dDs+5Ab/RRGO+ZZFnIDQcI9hdNSdXggZAhH7XVB/LnBgfJwRyiudAt8zaj0/RJO1
KTMJ7O2xjqalazXVAzqiOGPbPqNi6c4Oougsu1Pwoe5PzXOtr+p5i7Jx7yoPwMzg
yamHoVfdtIy2lwD8wcC3Qdx/hzYf0y4sqMgb4cop5YyMFRBFhwlMbEB2zj6rtzz/
NDa4ToWs+azhCchZz4Ow3FjPs/4Ssyy5oyJg7LT2ZzgxaOKU8XRDrHFR0NKnt12a
vcvUkS+MV6snaygCncLFujM1co6zQ5KlD6Olm4q3IlguQidDM7raX2/YO/3It/oN
9HR27WCDbjE=
=BdBv
-----END PGP SIGNATURE-----
--=-=-=--
