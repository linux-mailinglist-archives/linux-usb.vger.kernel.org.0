Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 062CA280D96
	for <lists+linux-usb@lfdr.de>; Fri,  2 Oct 2020 08:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbgJBGoJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Oct 2020 02:44:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:45634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725971AbgJBGoH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 2 Oct 2020 02:44:07 -0400
Received: from saruman (91-155-214-30.elisa-laajakaista.fi [91.155.214.30])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5DC27206DD;
        Fri,  2 Oct 2020 06:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601621047;
        bh=7DN33o+1q+CpmChlD33WdZgJqqF+GTLG3bkXYfZnEiQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=zQ8RsTscNz0wqIlOaJPApxFyCVjuScMOavrj5UJXICdFkt6x4+TuC/xOogkUvuiRJ
         lptxOge46bAhfUI3fMogZ+cDddb9tqXLPUcelOirQgcYwgSrJRZn68CmuwPHGHvXW2
         fBDXmNQRXGPX2AWYUDK4mwwSy667syyQ65z1mOzM=
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     linux-usb@vger.kernel.org, pawell@cadence.com,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH for felipe/next 1/1] MAINTINAERS: correct Peter Chen's
 email address
In-Reply-To: <20201001050837.14499-1-peter.chen@nxp.com>
References: <20201001050837.14499-1-peter.chen@nxp.com>
Date:   Fri, 02 Oct 2020 09:43:54 +0300
Message-ID: <87k0w9xh3p.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Peter Chen <peter.chen@nxp.com> writes:
> Correct Peter Chen's email address
>
> Reported-by: Pawel Laszczak <pawell@cadence.com>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
> Hi Felipe,
>
> I am sorry I wrote my email address wrongly, the related patch
> 746a439775fb ("MAINTAINERS: add Cadence USB3 DRD IP driver entry)
> is still at your test branch. If you agree, you could squash
> it, or apply on top of your test tree, both are ok. Thanks.

fixed

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl92zCoRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYkDBAAn/PDHxav+UIUXMgajy86TpNrwHmlDAsq
qdETeUAR+bqpeUHulFC4BJrYgj9WgaY3++i2NOlppONiPsbeyUEa6rrzHimyFCrK
o/Znbyxv5OvD436IkYaU//uG4+XxkTDYLVlOXXDMC8rnf7SF19Lc7EyH7xq6YZZh
QYsNTavfOxmXQbm2/WKB3TGZycS3/dMGPFreRoYADHMmAiMAjUNWOyae4e3EgE/3
j2ne2sAYNeQ61+IY9R+lhfnplWJMzurX7e1cHeqrfo7hYfmW7okVYXWGrlZ6esDR
QyR4G0dj3bUMyww8AT1YrB8AIt6W69poCeU0NJ+WZS87V+FGdD6jOZEr3Cz1LPPq
W2Wi/Bnr5MPMw2YDcoO1mpXnm2km96FoCy72i7N8hhQ1KHFJXPodS9nmVnnxAVGB
IYLjm4rShLbrB4dpjA1BPLkKMiiMw0fnWU89DYFarnZSPQIx8NVykUkRj+vXL2n+
c79gv4ndkUNt+NHp636XHZX6DAzNAfxCAl4sk4aOkdJ+a46nK0Zua5m/zlxclQ4W
ubYvo9OQu6rV8wpXEsgLvrEA/C82WYBJ5WnB0+/Tq/22VzsFijW40yALmueUM9Sh
NkSMZ1mDlkDdQYXBez9EzD0u+nJSJP3pT15Z1yqh0H/3NKQuoujEWmrWTQnaHs3G
Q+kUmpqjRYg=
=a+it
-----END PGP SIGNATURE-----
--=-=-=--
