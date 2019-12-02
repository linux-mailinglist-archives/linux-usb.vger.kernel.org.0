Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0E710E664
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2019 08:36:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbfLBHgN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Dec 2019 02:36:13 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44032 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbfLBHgN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Dec 2019 02:36:13 -0500
Received: by mail-lj1-f193.google.com with SMTP id c19so11797803lji.11
        for <linux-usb@vger.kernel.org>; Sun, 01 Dec 2019 23:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=iflRo20WW3/o72EerJWV0OKpVRwacHcTCE+8HbAYpxE=;
        b=Ue8qRlw245IHLWKIHD71NPCdNbnd0jKelRZwNvQtarlYS8dujAsOG8EqITWa0McSKp
         4j/BcRRjMJ1CXxA4ClP5mja6JOh9oi2DhMgM1XUbf6gUgMTuKyqQRl4DQ/IGZyV8PrrT
         nnBFKCpuHf/Wb7wqSVd4X/59/FVz7PpOgkd/EI76sGEyEi2+xjyYf8WG9Sf6GYpJTVYm
         7n09CIuL1A/u0ZtR5iAV9iQDjDzomsuiwcxB0flTIu9lBAmcUX9LBRaZBZ67qk9DAY3B
         CiMU6rzUuGywCntwsLUFQaxUg0hmdZs0TQ2RX8BPgsRcRQhkzav42Oyx9G6tD4wofIpO
         +EXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=iflRo20WW3/o72EerJWV0OKpVRwacHcTCE+8HbAYpxE=;
        b=K4W3p89znu+iIaXoTQP+fffYddcahU/AhABLhFbA8CsEL73qmfnSiSmGOKc+rNc0wn
         SUzk1la+sDjm1/sYKDfIP9WpRPurT8ERCmezTaN3ZFXK7Q/IR+t+z/4M2+0IMkpZRGZB
         WFPy5Velu5a8ecSbevgwj5BMxTpGY3iB0TMzWgbCEMlQ22S0JY5QzPOp7Cs4gjI+YPf+
         pMHKE4iDIvZT9EJ/TwG3jsObCiH0KnFWVb2d6qnlnntxnBBTufNzz/LbaEnPDSeuWBI+
         7G414B/CXNlqVVJEqTh8kFVLMBtCGwizSYadQVsxDEZFR/BnCZbGNV7Be0i0oqpMcmh4
         WybA==
X-Gm-Message-State: APjAAAUVlotIhDhieb9UYG2dgtwqskcCASf7pM1UZudVuOqAF99p6R58
        RYJWhR0KpIpadbARpFGb0fM=
X-Google-Smtp-Source: APXvYqwfYdmi3fE4FksfYS0fxVgY5q5U14+Tl+qdOop3r4ZvY4jv7xEny72epx0WpfTjXGHztinoVw==
X-Received: by 2002:a2e:894b:: with SMTP id b11mr45660272ljk.118.1575272171503;
        Sun, 01 Dec 2019 23:36:11 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id n19sm13950750lfl.85.2019.12.01.23.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2019 23:36:09 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Sriharsha Allenki <sallenki@codeaurora.org>,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     jackp@codeaurora.org, mgautam@codeaurora.org,
        Sriharsha Allenki <sallenki@codeaurora.org>
Subject: Re: [PATCH] usb: dwc3: Do not process request if HWO is set for its TRB
In-Reply-To: <1575270714-29994-1-git-send-email-sallenki@codeaurora.org>
References: <1574946055-3788-1-git-send-email-sallenki@codeaurora.org> <1575270714-29994-1-git-send-email-sallenki@codeaurora.org>
Date:   Mon, 02 Dec 2019 09:36:54 +0200
Message-ID: <87tv6jch61.fsf@gmail.com>
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

Sriharsha Allenki <sallenki@codeaurora.org> writes:

> If the HWO bit is set for the TRB (or the first TRB if scatter-gather
> is used) of a request, it implies that core is still processing it.
> In that case do not reclaim that TRB and do not giveback the
> request to the function driver, else it will result in a SMMU
> translation fault when core tries to access the buffer
> corresponding to this TRB.

This is not entirely true. There are cases where driver *must* clear HWO
bit manually and driver currently accounts for that. Care to explain
what problem you actually found? Preferrably with tracepoint data
showing the fault.

> Signed-off-by: Sriharsha Allenki <sallenki@codeaurora.org>
> ---
>  drivers/usb/dwc3/gadget.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index a9aba71..4a2c5fc 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -2476,6 +2476,14 @@ static int dwc3_gadget_ep_cleanup_completed_reques=
t(struct dwc3_ep *dep,
>  {
>  	int ret;
>=20=20
> +	/*
> +	 * If the HWO is set, it implies the TRB is still being
> +	 * processed by the core. Hence do not reclaim it until
> +	 * it is processed by the core.
> +	 */
> +	if (req->trb->ctrl & DWC3_TRB_CTRL_HWO)
> +		return 1;

I'm pretty sure you're regressing a bunch of other cases here.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl3kvxYACgkQzL64meEa
mQbL2g/9EYrF0l1GM7YXr+nmMHwrUjbr8rE2LGxV+Nn0pNExkGzRlvKGRZ9xPxU6
GeE5hI4MP+hNrnHhDC03pMMxWt0EkTOqJDYyzHRRNzb20qsbSNh0BlFwRwWX0r5j
QHR78Xekv3awIGjXMwxyT93167FEWVp1wQXifDZQCkXs9Zjo16yiRxR8MPsVG0HU
lqowBfh6Xtoy8D1Vhl6tlDHx147C9A9HRZskG58LBo6h2K/iwYUMj8VKVvRq11BT
0aNnGsJoUuHn3cN8jj0Pw6hzNXKYBzO6Smk2CietJ2jR5DiJHYh5RCY4cYd3ClPd
AMNk6O7kzflh1CDZDljVNhHDnO9hdbdqEYMNC/vDkz4L+LPvYcMzopvbfJtXTJEc
t50ffDv8BhmTX1YV7qMMtyWpb4/T0lsRq4TV7+8FLfEirAPzhk2zL//y4YKfa4Cw
uHrRijULtqQ2A9qqJ7nlwxGihnQs6RAmPs+oMiNw7ot2OV6pjcAB+DCk5BZZ4fVO
ryCh1DW/3j+DyUfRP1pl8MKrJGpbvBpoJSfA+0wZZapOl2iMo1oo/37Pp7VkX4xB
A4n105gO3EFgqA4xF6wpBXeH2AW0Wz2K85XVj9TNJ6eKZHMCGRVou94c54pGtYh8
NbXV926Xl+OM8fvddUYiK+qifJhM6PXHvrjzr3embsPTQMkEeUg=
=Bd5O
-----END PGP SIGNATURE-----
--=-=-=--
