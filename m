Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8BF25F437
	for <lists+linux-usb@lfdr.de>; Mon,  7 Sep 2020 09:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgIGHmo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Sep 2020 03:42:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:53180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726419AbgIGHmn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Sep 2020 03:42:43 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0ED4F207C3;
        Mon,  7 Sep 2020 07:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599464562;
        bh=TIs5JwlDQRvebAekInbuV/2Ii2UXnxsq8CLe4ACPU+M=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ZdAosuz8jovwbxcvibwH+AMwYlv8fVIdxYehYYIMNofF7Hdu8yCh/CLKMCMmpbTgw
         4wamX9ZzzgWOMEl58JmSh533zvU4viY96+uz2MYAE2tQi9xDLG6ywD80olFAs0Zg7N
         rFTtOIOwjPflEPKvMzFCPqdDhFOPaMT+g+n/5do8=
From:   Felipe Balbi <balbi@kernel.org>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/7] usb: mtu3: convert to
 devm_platform_ioremap_resource_byname
In-Reply-To: <1595404275-8449-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1595404275-8449-1-git-send-email-chunfeng.yun@mediatek.com>
Date:   Mon, 07 Sep 2020 10:42:35 +0300
Message-ID: <87d02y1190.fsf@kernel.org>
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

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> Use devm_platform_ioremap_resource_byname() to simplify code
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

why is it so that your patches always come base64 encoded? They look
fine on the email client, but when I try to pipe the message to git am
it always gives me a lot of trouble and I have to manually decode the
body of your messages and recombine with the patch.

Can you try to send your patches as actual plain text without encoding
the body with base64?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9V5GsRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQbf5A/9GQSFGsCjJVDMN491TnVJU2UcuvE0m1yH
PuO6qqWoETNQrMIeT0hIx8IED30Szqy7LB/i1VRA/xIaN354CvgWKNyIooryvqXe
G7E9zb/0BmiTGLoCzt0cKl12pLDz+vGQ4/F4iMm5Aqw+FoaMIPbI+VxWt1TRmdFu
akic1csqJULetfSI7aqxuMnUJ9FFijZRTFMkLUnxYS1HNH0Ox8rncv1HmRgd+M+E
Dmpezs3HLQH2bL6vv+k9Cf75JR5agb8fAbxKvsI00uSK6SdNVmNtOaoJCdE3eaj3
oG5YdX+lvRW3xO+oPyPypxke3FgQdqZwaRBxBduVsVptgZ5zEmEmjKHfqKCv1nvw
r8aTppriB+8UNkNjnMLmvbkRRaOFtHlxXGM45vNDGrQGFnMgHcsixmfXiy65/AoK
cNXPN8TTUm0A9CZ6sAe34raZ3H3LPAX1Mg/GuP7Is6Lm7FiiA6X9J0fC46YzK4ZE
EEhfn9VNYzDbgVpcgPDdMIe+Lvrzm5ATkFvpVrhz/WUcCT0stSPpXZIHjkAyrmUD
n47a1pTiVpN3ChKyFMH5IlZSihwpMdkG19LRFnryn2NRaiNQEng3qhpJ9YpekN5Z
cHprLCzqjPM5FzafSiOVLr3mwKhMcQoL7e9M5T1q2OZ26Rharbx2iMHjoDSW8Jbn
NyfsrIki6cs=
=vjAN
-----END PGP SIGNATURE-----
--=-=-=--
