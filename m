Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93775348CC9
	for <lists+linux-usb@lfdr.de>; Thu, 25 Mar 2021 10:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhCYJ16 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Mar 2021 05:27:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:36854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229782AbhCYJ1x (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Mar 2021 05:27:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AADA6619DC;
        Thu, 25 Mar 2021 09:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616664468;
        bh=HuoMuF8A1sneti8s9tErHxcPxOFCwX7WOppBA3+SoOE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=HlimVlgPYKhl4oG0502jiGnXXvty46va3OBMzG9wI7I8E9z+oEj9QLAkmiDWWtQAl
         nQocJo6IC7aPnmDOKUbADwel/wIKoh+arhR4GZSeQ7pXAvFW/mffyu4uqSvmkQrGOl
         d1yga9QX9dMhgeX81aIx5HYocuJ8qaLNuxgRQYaU/RRqhk0nP//Rdvgo3JGuTCXi9Y
         s1PlmXXbJ3WCjwdaPuFC/apZ2DSmEAHLdot1fT4h3w7sRIhZIV/WTZ8+/pKE4HcN73
         Sr9vnI5Sju7c6hVqC11wawa8SOQLqfBSiL5EApeMLrnCI/avDM6oga/1RyBAiVWvcD
         FGLQoBAm53yew==
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: trace: Print register read and write offset
In-Reply-To: <cb38aa7dec109a8965691b53039a8b317d026189.1616636706.git.Thinh.Nguyen@synopsys.com>
References: <cb38aa7dec109a8965691b53039a8b317d026189.1616636706.git.Thinh.Nguyen@synopsys.com>
Date:   Thu, 25 Mar 2021 11:27:41 +0200
Message-ID: <874kgzlh0y.fsf@kernel.org>
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

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> Currently dwc3 only prints the virtual address of a register when doing
> register read/write. However, these hashed addresses are difficult to rea=
d.
> Also, since we use %p, we may get some useless (___ptrval___) prints if t=
he
> address is not randomized enough. Let's include the register offset to he=
lp
> read the register read and write tracepoints.
>
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
>  drivers/usb/dwc3/trace.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/dwc3/trace.h b/drivers/usb/dwc3/trace.h
> index 97f4f1125a41..3cbeb9854532 100644
> --- a/drivers/usb/dwc3/trace.h
> +++ b/drivers/usb/dwc3/trace.h
> @@ -32,8 +32,10 @@ DECLARE_EVENT_CLASS(dwc3_log_io,
>  		__entry->offset =3D offset;
>  		__entry->value =3D value;
>  	),
> -	TP_printk("addr %p value %08x", __entry->base + __entry->offset,
> -			__entry->value)
> +	TP_printk("addr %p offset %04x value %08x",
> +		__entry->base + __entry->offset,
> +		__entry->offset,

might be better, then, to print base and offset separately. Other than
that:

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmBcV40RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYewQ/+PnWOAWDudBIKnRpM1LVRPgJs3eNvfhu/
LXaalTVcLe85jZ9nkeXKPMzI/Hmt0Kl7NTMgcQK3A6KIjJR552hKyR/K84PFt1GC
WE/Z31sDAlDHqB94jeiQr4Keiz55VLhRNH7XkQf+oSBcwbhdtjGdW+f9XpClJxic
oTK0HQt/ezcx69aBAyNoUKnjkhKyUwbhXQBcfADgVG0J7bNEGMK03Qchwr16kw6r
2NbpMnXg57AWN6r8xZk/4X1ot9edYtHA7MJxlMhnErKAR6OO1XsFj1bp5+l0iiEW
bhfpjtzNb5u2IXOR/uGiV/pJQguQZvYFhTCKpzsTPc6Nj6CwkQ8/cPmmKT6ei8iE
sfnYVz+BM8MXCK0mfRza3GWmzb7W61YMGwQooLl04v5vb5XOVobQKvHlyKout4Ha
Am0gyTZKSpZ8VAiq8cH8mWmr1zwscTVrxSIGM0wA+FfkUk17oCBzbvxzNL+i1o/S
5EXaf1GDFsP2dbUhSgq6bySA+MlrmHwgYwHoz68lm62DrEaKl6QGJCFsVNaYkRB9
AjJzr10KVouiLgUOrfqSTHkyO0/Dv+KLjX2sViEDQPCyK5udWdTri8u/S1tqXArB
AydUVn4OgV9JQZMhYxXCEYRMBKqWMlyIi90MxB9AAuPBQBvwPlKGhsN/Fy5PV4Dm
vi0nOEzb/5k=
=1teC
-----END PGP SIGNATURE-----
--=-=-=--
