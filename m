Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE5E4588C
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2019 11:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbfFNJY7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Jun 2019 05:24:59 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42177 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726693AbfFNJY7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Jun 2019 05:24:59 -0400
Received: by mail-wr1-f67.google.com with SMTP id x17so1724828wrl.9;
        Fri, 14 Jun 2019 02:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RA9l0BEeZynxxj4w4/QWzfOBdVHkhiLmhP2+gVBi2Fg=;
        b=Alaz0Ac9kNQkV3HkFEkPMY2Dc8SYxPYvWt56KnVOPcQsZl8+jNI7P/IspmGxZmmpkd
         EGUm89ZjHJOesgJdgj6FyKsdc9CB1kJstYU4MuBDe/IxkmVI5LwFeKuyZcAwKv++cSwO
         BzwMz8RlqokCRDbhIe8cO+kEhvuYxfIyPPKfDzSUjbKPiGuiQ2ZvpYXhAUKNbptuqMsn
         iYSPNkRar/l4j/n7cNV32AEx24BzkJvavJ9d9KNnz4jy7iOoWZu4FfYyY1egF/Ymi/JG
         xOSxGvwyq083T+xzqW9PIMaienxVRJRh2sZ11hscyFM1qTrOeuQzLfE7+k5q9xfUna+n
         GMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RA9l0BEeZynxxj4w4/QWzfOBdVHkhiLmhP2+gVBi2Fg=;
        b=Qea+NDqtUctrixtQe7BSlrH5TpZbka1EC2mKmvEmlsEPHlTziEAAFeBfMhp0E0oSHw
         iI+w7cVzUWUQ3mHrAkkgs2X6bgKgciRHVOyH1m3geyfBzn1/yo50hQuCmvZYuAX9ywnR
         zTxLmBxvYqjiZIFdBwf2yiDBHFdKI6WmmaxYbsaeHiv5OgQourkZ+R3kvPn7jDti2f1d
         0XnfVTy9sF8SkqdqjKdSQhHMU/MXOSKBKDAs/xOtTqw/JIGz9BXO2cU3nWnHmGHN0qM1
         KK9GkXqTXXDkEb1D+icg7kt7r4UenaqBqwRMYwTzaJRS8qA6QQX4++5v8vvIXZdvgPeL
         YgPQ==
X-Gm-Message-State: APjAAAVrY/8AJDYtj09yuQjOPRWhD/0JSQfz63KFUjbUNwe6es18bqLl
        0IRQOcglBT7J65TD9xUEcJ4=
X-Google-Smtp-Source: APXvYqzN7+zKceXuKosNMSVcam1PBBgmRJ4eysEuN6GJP+NsLtll6o/FS015QM1wz4up+brfqPcB1w==
X-Received: by 2002:a5d:4310:: with SMTP id h16mr53743318wrq.331.1560504297290;
        Fri, 14 Jun 2019 02:24:57 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id y18sm2604327wmd.29.2019.06.14.02.24.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 02:24:56 -0700 (PDT)
Date:   Fri, 14 Jun 2019 11:24:55 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nathan Huckleberry <nhuck@google.com>
Cc:     mathias.nyman@intel.com, gregkh@linuxfoundation.org,
        jonathanh@nvidia.com, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] usb: host: xhci-tegra: Fix Wunused-const-variable
Message-ID: <20190614092455.GA15526@ulmo>
References: <20190613184450.GA896@kroah.com>
 <20190613185838.251806-1-nhuck@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline
In-Reply-To: <20190613185838.251806-1-nhuck@google.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2019 at 11:58:38AM -0700, Nathan Huckleberry wrote:
> Clang produces the following warning
>=20
> drivers/usb/host/xhci-tegra.c:357:27: warning: unused variable
> 'mbox_cmd_name' [-Wunused-const-variable]
> static const char * const mbox_cmd_name[] =3D {
>=20
> Looks like it was intended for logging or debugging, but was
> never implemented. Removing mbox_cmd_name.
>=20
> Cc: clang-built-linux@googlegroups.com
> Link: https://github.com/ClangBuiltLinux/linux/issues/533
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> ---
>  drivers/usb/host/xhci-tegra.c | 23 -----------------------
>  1 file changed, 23 deletions(-)

I wonder why we're not seeing this with regular GCC builds. This code
has been in the kernel for a long time. Oh... looking at the git log, I
see that -Wunused-const-variable was moved to W=3D1 about 3 years ago, so
these are no longer showing up by default. That would explain it.

Anyway:

Acked-by: Thierry Reding <treding@nvidia.com>

> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index 294158113d62..dafc65911fc0 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -354,29 +354,6 @@ enum tegra_xusb_mbox_cmd {
>  	MBOX_CMD_NAK
>  };
> =20
> -static const char * const mbox_cmd_name[] =3D {
> -	[  1] =3D "MSG_ENABLE",
> -	[  2] =3D "INC_FALCON_CLOCK",
> -	[  3] =3D "DEC_FALCON_CLOCK",
> -	[  4] =3D "INC_SSPI_CLOCK",
> -	[  5] =3D "DEC_SSPI_CLOCK",
> -	[  6] =3D "SET_BW",
> -	[  7] =3D "SET_SS_PWR_GATING",
> -	[  8] =3D "SET_SS_PWR_UNGATING",
> -	[  9] =3D "SAVE_DFE_CTLE_CTX",
> -	[ 10] =3D "AIRPLANE_MODE_ENABLED",
> -	[ 11] =3D "AIRPLANE_MODE_DISABLED",
> -	[ 12] =3D "START_HSIC_IDLE",
> -	[ 13] =3D "STOP_HSIC_IDLE",
> -	[ 14] =3D "DBC_WAKE_STACK",
> -	[ 15] =3D "HSIC_PRETEND_CONNECT",
> -	[ 16] =3D "RESET_SSPI",
> -	[ 17] =3D "DISABLE_SS_LFPS_DETECTION",
> -	[ 18] =3D "ENABLE_SS_LFPS_DETECTION",
> -	[128] =3D "ACK",
> -	[129] =3D "NAK",
> -};
> -
>  struct tegra_xusb_mbox_msg {
>  	u32 cmd;
>  	u32 data;
> --=20
> 2.22.0.rc2.383.gf4fbbf30c2-goog
>=20

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0DZ+cACgkQ3SOs138+
s6Hzmw/+NXBsjCfa7XW074kwXfqZlMW8r66Dl02qb7iXCIrUolXtQFVGUpzQU/yl
G8rQUYlsBD5L/PSVRDO6HLXaIxog7sq+ei9Z8U2+NRTbdqxMQqZvS4WN40RkWcNG
dbOMgQqpIDdu7djZ6HAEZ/Vj8fEfBuxkOw/kPMnjAdLHRM3IYEAWS96S6Myc2Lq8
mwtV+xzsvgvjUAYj4SSPUbJeoh7XYqkmEcGIPajHPNc4gcY5ZdvqWBla9YGphwPo
xLML+BselEUYepjrRK2D/D97a9MbGW1M2JjQMsofqBCQCSHMHQ3AOaQ4PVQtlK0u
VfduSFgQNNBYCY3J2R8lRRS0cocyOu4iKR2Q/uvOyGx3Ae8S9xhM5xQXbDbBnLxg
UO8l8j8yWF4q2uEYvHO4kRTJ81jr8NT5V2MEomFLCvqufC+spwW7IdKvVy4e4zwc
vS/+J/o5+Np5mdQ1hbO++NZOdHmCUceUgqcgoUnOZimbHAExx3m4+o87ILhDk7lQ
qKKIe3u+kUQQx2GkDTDE3kr/wsXRhV13+16H4Gl5L+E2bfH5Fp2/XP1AHcW/gFTT
+09dJoxshZUXH84WLAysfwF/JjXnLj247C0yGN9Rp9bJ5ODwkPAE8kiH+7LhQuCv
eIrPCuuT77zr79gkSB8SMXrlmZL1JBx+UA01O/Qa0SgBbw1qw70=
=A35G
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
