Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 553FF29A7CB
	for <lists+linux-usb@lfdr.de>; Tue, 27 Oct 2020 10:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2509916AbgJ0J1G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Oct 2020 05:27:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:35096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2509914AbgJ0J1F (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Oct 2020 05:27:05 -0400
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4A6832225C;
        Tue, 27 Oct 2020 09:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603790825;
        bh=YsSHHWHsNURaEl80/v5bZ/pRGNVu7REojN77UQpnsoc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=wBNjKtxHPjdhpK+Gkha8aNuR33XUGFITTR/m1ls+HzjXTEVhqgjaA3PIf0W9c8wSy
         u9GXdhPzuChAOmVQT2rJMzcIIJadH6zLT0Ax69cNt5z1fHUIX1ZCLBvdM1nlzzEmb5
         dcZBbx8enK26ElAd75cSmTAah13vco6LsVDrA6UY=
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>, pawell@cadence.com, rogerq@ti.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH v2 2/3] usb: cdns3: gadget: own the lock wrongly at the
 suspend routine
In-Reply-To: <20201022005505.24167-3-peter.chen@nxp.com>
References: <20201022005505.24167-1-peter.chen@nxp.com>
 <20201022005505.24167-3-peter.chen@nxp.com>
Date:   Tue, 27 Oct 2020 11:26:56 +0200
Message-ID: <87blgoc93z.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Peter Chen <peter.chen@nxp.com> writes:

> When the system goes to suspend, if the controller is at device mode with
> cable connecting to host, the call stack is: cdns3_suspend->
> cdns3_gadget_suspend -> cdns3_disconnect_gadget, after cdns3_disconnect_g=
adget
> is called, it owns lock wrongly, it causes the system being deadlock after
> resume due to at cdns3_device_thread_irq_handler, it tries to get the loc=
k,
> but can't get it forever.
>
> To fix it, we delete the unlock-lock operations at cdns3_disconnect_gadge=
t,
> and do it at the caller.
>
> Fixes: b1234e3b3b26 ("usb: cdns3: add runtime PM support")
> Signed-off-by: Peter Chen <peter.chen@nxp.com>

comment from previous thread is still valid. Missing __releases() and
__acquires() annotation.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl+X5+ARHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZy+hAAqnDEBW4FY7AUXeEBSWPTiXCCBRGI7fet
pypIw8W4VP7+QBSsIoYFKcVYgBwInjyjVmyrHnrfnHAyaSVi5WwXUSWttKoiAf1v
tDL/Feu/rIlKplGb3VedPlMPHQM+yAkxbFEP/Qa9VeQZ3cuF9HfW5UVb23N7fFXx
BYfiLLq9IQWO5GQ8JwSL1Qlk4k41HPLGsBKoHzAhOG+xKcVRW6lmRS/Vtk92ZxHA
XJshAZgsEk1zUaQMUZPDyGuwEBmQaA3SWkX23yk/QOl9i8Rf+2Q/coH8TZU1AlM9
8hE75xf1OpvilumOSBMZjIqd2cH1CJnsWVSPivkCURzXNEHG26wzGdg8eMejLQmC
QWv9CNjtXDta3ks7OB19WaEp2d8g1llkrnOFckrIu4/rPHAcGl4bXsTHqfxKzQ6I
TOeh0VLJV+t2f3Xz4VwQ0jMaL1IWIS4dDu5IIJl2yfPgxsmutptMPWcBPAZb0xQV
vXHWAsO06sURF3g8ZX8KaZ1A+8LCM/fnVc2mbqrR2EDwY4jIacII7VuLmN3CwM6z
4pCdvWAvrdtb90LaPi2wh6R3GSZJkLUKvVBOC+WQwqZzz/MSnvI00vW1xiV873lP
hEMUuCodU3+lOKa8ZSNO9RKii6VeuVpb4yWe0plKVT3YjblNfzB/L6oXr6+LLd5j
AtWMrCxs8zw=
=Ghoe
-----END PGP SIGNATURE-----
--=-=-=--
