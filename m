Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF1282F5E36
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 11:00:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbhANJ7y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Jan 2021 04:59:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:54414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727974AbhANJ7n (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 Jan 2021 04:59:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6632E23A22;
        Thu, 14 Jan 2021 09:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610618343;
        bh=07yN5lUT3ag6EUOVjq+NXhoRMSbGAVxVDO0NSYzPwO0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=TSdYM1r/arNFrW6fLvDPVNzS4G5r9N2vtD71De1ONw4ErgVZv6ruLmggdAH9O5xSU
         vL0GqsA784pIA9HvdZa7VX86lk1O5lj2qDRCrYVLciAtJTmbsOuJlyM/1P8hcko6kb
         xdnDx6lwutBjrHAzjYMl+nVD09TqtuMswJCwppiw2w+jqGHhcpUNjhfb/mFNvHbf9x
         /y2xWKAxnsZbGxW+7JS1fN8pS5Oz9iAz/WN0JRD/sQOxXUhDkeQ20bl6STYM6+MnmP
         ynnoMPuXy9BZvONdEoUiMz4r8jtWOpFTQg6uHlQlzO0Jmx817wysSyZScQKPQ0k6ql
         JlcfCmdlE4AZQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rob Gill <rrobgill@protonmail.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>, Bin Liu <b-liu@ti.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v6 01/11] usb: ch9: Add USB 3.2 SSP attributes
In-Reply-To: <ae9293ebd63a29f2a2035054753534d9eb123d74.1610592135.git.Thinh.Nguyen@synopsys.com>
References: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
 <ae9293ebd63a29f2a2035054753534d9eb123d74.1610592135.git.Thinh.Nguyen@synopsys.com>
Date:   Thu, 14 Jan 2021 11:58:55 +0200
Message-ID: <875z3z3km8.fsf@kernel.org>
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

> In preparation for USB 3.2 dual-lane support, add sublink speed
> attribute macros and enum usb_ssp_rate. A USB device that operates in
> SuperSpeed Plus may operate at different speed and lane count. These
> additional macros and enum values help specifying that.
>
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
> Changes in v6:
> - Rebase on Greg's usb-testing branch
> - Convert the sublink speed attribute enum to macros and move it to uapi
> - Remove usb_sublink_speed struct
> - To simplify things, use usb_ssp_rate enum to specify the signaling rate
>   generation and lane count
> - Update commit message
> Changes in v5:
> - Rebase on Felipe's testing/next branch
> - Changed Signed-off-by email to match From: email header
> Changes in v4:
> - None
> Changes in v3:
> - None
> Changes in v2:
> - Move to include/linux/usb/ch9.h instead of under uapi
>
>  include/linux/usb/ch9.h      |  9 +++++++++
>  include/uapi/linux/usb/ch9.h | 13 +++++++++++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/include/linux/usb/ch9.h b/include/linux/usb/ch9.h
> index 604c6c514a50..86c50907634e 100644
> --- a/include/linux/usb/ch9.h
> +++ b/include/linux/usb/ch9.h
> @@ -36,6 +36,15 @@
>  #include <linux/device.h>
>  #include <uapi/linux/usb/ch9.h>
>=20=20
> +/* USB 3.2 SuperSpeed Plus phy signaling rate generation and lane count =
*/
> +
> +enum usb_ssp_rate {
> +	USB_SSP_GEN_UNKNOWN =3D 0,
> +	USB_SSP_GEN_2x1,
> +	USB_SSP_GEN_1x2,
> +	USB_SSP_GEN_2x2,
> +};

note that xHCI has some private definitions for USB 3.2 support. Maybe
add a patch converting xHCI to the generic versions?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmAAFd8RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQY/oRAAwGwd0M+4y81Yv7n9zZESjvcH4MNrIBxF
3ZnZzd5xUc3mOokAiInix2k+tLp5Se5aZ4KpbBwznPHpiidm/qWr2eVGuPFoGwsi
Ru1lkOqT/HH3pIWgG+Akx0MqsPdfAItgZBPPLZwsfr92DNJihz2NOGLeAAB+Wfzr
QUKy752kkFZRcL+jOT/9zGDvd12Lw7GlDUEIDs5hq6fJoU55bVDzclUWTWJ6m1C7
SjjrQKmSr05Yd93At8GINrtby78Vli/n9NmCMPrgTggJxjuJok4HXk6a1e3IfnzR
Qx7vIxH1EutvDSZ0UrFt2f1i/k0sUKAiubeq3uaTTfH0/sYf6r5/IhVBU3wgqVsz
0sZNb2iMOCE8PqPMDnTkdJqlTfUzmZd2gmAdT6QYzMjlz3KWdbTXlgmuQ0i1ItWu
HVnftpFtBnkqbksn9TTCSykq4bEpNu8vGGTxEFKWR+GP4WnO2VariMRokgP2s9Ly
UfRhkOzeKEYl+S1Ggnq4dpf/NVzvb4v32mV8VgBDBqe8gHRJ5G8SzlsQM2eWflU8
doRn8PhmsiVsPV220AGZV825fNZ0t4mGXDCYmQtUEIn1EWjmOyQsDju/mTDzEpRc
vKqobP9GZnUt/SgQS/Y1ZK2ol4hp94IXEpzdpgUD1P8AbY15LGZNdQmASoWcYpOc
3+24Fu1qtMk=
=Vfrv
-----END PGP SIGNATURE-----
--=-=-=--
