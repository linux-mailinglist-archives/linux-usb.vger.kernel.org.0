Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61FF9246788
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 15:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728786AbgHQNm2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 09:42:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:42938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728778AbgHQNmZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 09:42:25 -0400
Received: from saruman (unknown [194.34.132.59])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AD8CC20786;
        Mon, 17 Aug 2020 13:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597671745;
        bh=JyxU5w0+jdQZ9gcCrDN6RzF8LRBFi5n4EoRES8+MYaw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=rKf7xAIGIEO07qprlLKVUC10KtLVWpnLhyo8G/4vA19Xra/ENqTlfPZN3t9469C7m
         KiKzbwfAWwCfQAVVwy7e6BMDSGZx647suFJ+JDDDvUCR9wGANH/lH46li7tSnl62N9
         xAgiIaFKFA6hLXDe7iqiwbPdERGdM5fJdBC/jvbg=
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v2 4/7] usb: dwc3: gadget: Refactor preparing TRBs
In-Reply-To: <6f67c1a81052389225a95fbccec93b0af0151cf1.1596767991.git.thinhn@synopsys.com>
References: <cover.1596767991.git.thinhn@synopsys.com>
 <6f67c1a81052389225a95fbccec93b0af0151cf1.1596767991.git.thinhn@synopsys.com>
Date:   Mon, 17 Aug 2020 16:42:17 +0300
Message-ID: <878sedz8w6.fsf@kernel.org>
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

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> There are a lot of common codes for preparing SG and linear TRBs. Let's
> refactor them for easier read. No functional change here.
>
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>

patches 1-3 will be merged for the -rc cycle. Because following patches
depend on this, I have to delay the others for v5.10 merge
window. Unless you want to rebase to make this the final patch in the
series and make sure all fixes come before any refactoring on code
clean-ups.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl86iToRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZ7BxAAxaT37b2ykdHXWwJOCgfDHULz/UMl1q/a
yuEaKj7OO99UojneagsmLh1SftZo8+OhJ9nJK1PiWVWIeEsBtwop8kYuCTK1bac+
rV8IBH71sCKhXKxHuYK93tA6Wj/6xmKB0H5G1akHXDm7kLXNQH8CUg8Wpr5mlxHz
kZ5YTMK+HfTXnKxipfhmshGf24cmsnW52T4xxbshFwggApgQjXQ+kBlD1bexYnFd
5M6d00QsJEkNMiyS8QHyWBECeMmlRXSQ7ruV5bwW7QBVuvkxxVqEEJ+02jAWhx9/
055l6hrGEBqhuNL+FhvExLnN9jq5po/vMhBymv/+fFSh4OHI/XPVHWg3HSSJ1LRX
Pt3Sy2hCv8UyBN6n7QRJrlWIiJBD9y84xW7eF8oFYHPvo3wO7Ccvw7BzD1TNaBR9
MdFkjm7s+obWKJ9NLjBopLvpdan43WKAxOo6hOWD87+GgynIp62E+2DGulvx5ors
OhxlJk7EDbIZjMdrZyNyxlL3DFrUdfPd+lgz/LyLsAHmHPB29lSdFEAccQZNfXXs
7qm5NVF7x26b8yPmoYts/YzalSYrLsVH1FdD7LZEwBW6fn13gguwfIF3J5wWNfIO
A5A2nnLc25sNYOGP/pThP7vqvSFvDqcoTWl5k9ey3XX7iubEgCkYHVHA+oY5qqTi
YmmyxwFw4Is=
=LpXS
-----END PGP SIGNATURE-----
--=-=-=--
