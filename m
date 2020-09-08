Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 935E7260AFF
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 08:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728881AbgIHGcl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 02:32:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:56226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728501AbgIHGck (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Sep 2020 02:32:40 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6894621532;
        Tue,  8 Sep 2020 06:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599546760;
        bh=LDmsHL3DQ4URTc3baYzAPV7L0ehViAp8EDOHAcMV0w0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=0Zo8nv/iIp80xU3BfhRzuZ5ajcjKmsZ/ZNLg5/UH+S8l4za6vwYK2aDNC2V6LU+7r
         n5b4q0m3nCaxwx+35PFIB7rIG7vAjgr08vGv4GTkXw80fFI71IEaHY9aDOguq83CCa
         QIEK3yJS6F6ouSQXpyPwrjqlACe4mX21mWVmLU44=
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 8/8] usb: cdns3: gadget: enlarge the TRB ring length
In-Reply-To: <20200901084454.28649-9-peter.chen@nxp.com>
References: <20200901084454.28649-1-peter.chen@nxp.com>
 <20200901084454.28649-9-peter.chen@nxp.com>
Date:   Tue, 08 Sep 2020 09:32:32 +0300
Message-ID: <871rjcn5hb.fsf@kernel.org>
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

Peter Chen <peter.chen@nxp.com> writes:
> At Android ADB and MTP use case, it uses f_fs which supports scatter list,
> it means one request may need several TRBs for it. Besides, TRB consumes
> very fast compared to TRB has prepared for above use case, so we need to
> enlarge the TRB ring length to avoid "no free TRB error".

can you give a little more detail here? How many sg entries do you get
with ADB? What's the size of each TRB? How many memory does 600 TRBs
actually amount to? How many segments are you using per endpoint?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9XJYARHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZafA/9HzsX9Z05Qsxptp26d5DennrLvm0+Q6SJ
CON+DiVehh44PYnohZXrxSTNScwayBoEadeLz8xTYUddLOeB2yNKiSpui3j+Hz0Y
e0I1fAXF0qJcZf1lD4to9nqbAU/FuZfEgjIzFA06ABPzYmGf9ND06MAozyMYFKvW
ZM/v+Uw20gqiP2qe+0fFMbrScslnQQV76D+CLyRCyeKFt+8eUqXLehDg1o/h8n/5
pY/LQJimG78DlP9nFLcpLqzeaJrFGhVqjrmX8bi5zZmEXD/vllzGzpNCszMpuvrb
aaQYHRRPeidCXgC2CnitUlLFyxho83Tf1F8uFI4x4CSp+8xN8j9hX/TCQCtiFHYz
+97oeosLHT6r+3UPe38Inp26a3YK+l8TJDB2S465cz57ab7q/7pF2jSpC6Xjk/BG
j1CScX72Ml1ca6Pb6QDlIJK87f6VmIMl+JnuDUWS5okk8NMzn8kseMzFrTI9oCnc
3HG9dLyaZKMWb8qjcKt+BZ4knAnLHTeMzX3GGfVyAj3UfXzzd6NF1LSRSWAfQkC6
v1PI/XinHH98zQ+EVvURcBBVJhnq1vSDWr04uvwR+fWxSNWs+zUCdDFku76mD8uo
TUpDmY75lR+5WOVdxY1Nv4wxKaSeny2VwQsWN/ARV6A02CPy+3us1UayoRMEysYn
us2ScLsfeeY=
=he4s
-----END PGP SIGNATURE-----
--=-=-=--
