Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2088035F0F2
	for <lists+linux-usb@lfdr.de>; Wed, 14 Apr 2021 11:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232795AbhDNJkj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Apr 2021 05:40:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:37184 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231782AbhDNJkh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 14 Apr 2021 05:40:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAAAE61220;
        Wed, 14 Apr 2021 09:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618393216;
        bh=aHf158sT+xsh5S0315bmIxEku1OvT4NN1PFBLn7a4Eo=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Dww3rks5Gq4pxB+OnsnuAbCZ5uFY26SSoRvSATmVOWkbBhxNVq7bmcKKVvNkg7EID
         UXlXPNEwnApl2IHsFHWTke2Qru6u2Arg0XGS/X2XyTEJg3Z7lmZGd2qXlsIMSOAqto
         xinw12k4l1f7XXP+SejbfiIj343K+7uqeOxur9/zhtjTGofumkDj1TKPJGIzc65NTC
         5sAwU3kSqvryyzUy8Z/NAJuArCjghlvPXlNgo5TPlgjo5oMgQyVOPs/pFMHYm8omNa
         a5x/7TufARI/xuRgCgq8WthTth3cnWBkzl6fKtLfeXj0tTtqOQ27iVDPnF6aGbVTeB
         uGaIjwDbMCngw==
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Ignore Packet Pending bit
In-Reply-To: <097ba9e104c143f7ba0195ebff29390ec3043692.1618282705.git.Thinh.Nguyen@synopsys.com>
References: <097ba9e104c143f7ba0195ebff29390ec3043692.1618282705.git.Thinh.Nguyen@synopsys.com>
Date:   Wed, 14 Apr 2021 12:40:09 +0300
Message-ID: <87v98pnr0m.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:

> Currently the controller handles single stream only. So, Ignore Packet
> Pending bit for stream selection and don't search for another stream if
> the host sends Data Packet with PP=3D0 (for OUT direction) or ACK with
> NumP=3D0 and PP=3D0 (for IN direction). This slightly improves the stream
> performance.
>
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmB2uHkRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZnWxAAnlLbvRlPNfIVLnN73FkW+EV12zraPSni
h3Lob1E5HEhKCy3m2vDgpq4LDWPLrUE0Ls9EGg1DlI9mt3RGO4a1jSnwWa9yaeB6
4Bwj/tDqOUeyLpRx78k+K0PqVW1fMvCNQpxUddzrBPAdPoA3JJs7hM4c9jOUbrcR
UhitUQc/fpwt7ZdULGRL2qzPzLVsBNlWS7i5G15l5KEfGfOkl0FdYgAnFNC6HobV
MXjVsFgqG3GxotLbqLb/quPQQ5jZDs8vIxToVp17x1KHTAtFr0SID57rQZU5spfD
SDI66v5jss2Yt1ZkT3RwdSwcVpzxueX/ZV5tRNj2IS/NQio5WyvMwhj97W7C2bxS
c6Go9DtrAbWuhNva/dGLb0tWkfnFTv5ZY3zWjr8Z1OgPXJE2NBCvjEo+NA8arbMk
k2S7nbVt5gj1isbeuemB5T0TqPBZiD4a/OYD9CKTWKAFxH3TC/3DUjWbMnZ+FCot
kprgBqwn98IvV8x/xT3LtJrTrMZMSEcOztpiKmA2maaz9ybul7lMwAsplECsiMPM
BQITuBBVXKWesIw/DZx8xG302//i66CXrVWzkbs9xo5cefsbERxQmZzaeezxb6Ur
p4ug+sj4nhu7cZ80QE1VIej3nX8yg2wzkGElOMIUa5Z5VdjMK6qqiffuBc11dY4W
eEmlv8RqEyQ=
=Jyi3
-----END PGP SIGNATURE-----
--=-=-=--
