Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE298184993
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2020 15:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgCMOiO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Mar 2020 10:38:14 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42763 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbgCMOiN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Mar 2020 10:38:13 -0400
Received: by mail-lf1-f66.google.com with SMTP id t21so8060691lfe.9
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2020 07:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=Pavr50LYpR4BTDhAonZ3UMOsiIAfY6BTOpr0XKtZUTg=;
        b=sBY7cbsuuDo5TxKhDKUrLX9d8bGA+NthhJIXi6E+xGZKv7mLffVte9eqyomtiCqn0y
         u0OPkIySlWuF+8ei2uuxB1dgFuKolj9gZmzy04nKB/uNz+IVAvR/Z+PisGh2yHkO+qC+
         AbePKcoaW7RkzWnruylLT9q96HFeEA/XNhW3WonCp3HwFgU17MZXHYYbUQwPZRAXRPlt
         8rB33eCdQ68m4XK6GiK8K50WeUddUEvSuBpQb55VpXGnRistBpUUVX0pjnEz5uHRLNb2
         3mdH1nSNuRBazCAj1tybAphcoYXr0SGzcHFXDKVYn8KH/XvlWQrNfKAOIz9nLl6Rg5Of
         K+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=Pavr50LYpR4BTDhAonZ3UMOsiIAfY6BTOpr0XKtZUTg=;
        b=qt+wAXuK6ghXk1vbI2jGeEjq531QqGYhfjTBpTjb0E+On7t6TGaeLAWcOrZnIoOJVV
         7UsZfIzTl7sfNebntOTNaO8CM7pnOAoc6jTqPPyMqEaGFWiPFlNA9EmbFK4M4Tr43qCZ
         LJWq9V9U2cG3zyWYt4GMhj3e3Wl9N87E0xzJbDoPRxEqoW8UiByECOV9ATFXxBXGIzeT
         DMaoe4NS6yEHJruUkr6ArWZQ+gf2Rw6ncDSYbq/6pjXzicn1gi/jtHJW/561Q8oGoi6J
         iKzxlAg7R4A87Ko2X3I7fRjq/uLn0c9XidlpZ+xwnGZR99dyA5c4y8MLVEPHSLcLzKrU
         fwmw==
X-Gm-Message-State: ANhLgQ2qgk3M277KfcolGBs0Nmnss6PCKXp0EkyqPgbse2xrLvt4bvjx
        KmS7+CLCmpe0xKwVdEsHvW7EP/rR
X-Google-Smtp-Source: ADFU+vtHVH7mAxp7ahr514DDepEimhiZqHlkqO2Qs5WEarKqv1HBI0L/2rdqQxtK6cobaoF1e7KarA==
X-Received: by 2002:ac2:5f41:: with SMTP id 1mr8501410lfz.169.1584110291279;
        Fri, 13 Mar 2020 07:38:11 -0700 (PDT)
Received: from saruman (88-113-215-213.elisa-laajakaista.fi. [88.113.215.213])
        by smtp.gmail.com with ESMTPSA id o7sm30893270ljp.95.2020.03.13.07.38.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 07:38:10 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 3/3] usb: dwc3: gadget: Issue END_TRANSFER to retry isoc transfer
In-Reply-To: <ab34698f56f613cdf63d7d955e94c064a185b001.1584065705.git.thinhn@synopsys.com>
References: <cover.1584065705.git.thinhn@synopsys.com> <ab34698f56f613cdf63d7d955e94c064a185b001.1584065705.git.thinhn@synopsys.com>
Date:   Fri, 13 Mar 2020 16:38:06 +0200
Message-ID: <871rpwgw1d.fsf@kernel.org>
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

> After a number of unsuccessful start isoc attempts due to bus-expiry
> status, issue END_TRANSFER command and retry on the next XferNotReady
> event.
>
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> ---
>  drivers/usb/dwc3/gadget.c | 36 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index f1aae4615cf1..a5ad02987536 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -1406,7 +1406,8 @@ static int __dwc3_gadget_start_isoc(struct dwc3_ep =
*dep)
>  	int ret;
>  	int i;
>=20=20
> -	if (list_empty(&dep->pending_list)) {
> +	if (list_empty(&dep->pending_list) &&
> +	    list_empty(&dep->started_list)) {
>  		dep->flags |=3D DWC3_EP_PENDING_REQUEST;
>  		return -EAGAIN;
>  	}
> @@ -1429,6 +1430,27 @@ static int __dwc3_gadget_start_isoc(struct dwc3_ep=
 *dep)
>  			break;
>  	}
>=20=20
> +	/*
> +	 * After a number of unsuccessful start attempts due to bus-expiry
> +	 * status, issue END_TRANSFER command and retry on the next XferNotReady
> +	 * event.
> +	 */
> +	if (ret =3D=3D -EAGAIN) {
> +		struct dwc3_gadget_ep_cmd_params params;
> +		u32 cmd;
> +
> +		cmd =3D DWC3_DEPCMD_ENDTRANSFER |
> +			DWC3_DEPCMD_CMDIOC |
> +			DWC3_DEPCMD_PARAM(dep->resource_index);
> +
> +		dep->resource_index =3D 0;
> +		memset(&params, 0, sizeof(params));
> +
> +		ret =3D dwc3_send_gadget_ep_cmd(dep, cmd, &params);
> +		if (!ret)
> +			dep->flags |=3D DWC3_EP_END_TRANSFER_PENDING;
> +	}

I like this! Pretty good idea :-) I'll wait for your reply to my
question on the other patch, then start queueing again.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl5rms4ACgkQzL64meEa
mQYXxg/8CN2ZKpR4VpFpN6JGnxGRhLQ6c5fmIEcJ0VU8DresKP0JF16QDIuUA8at
PA7PmgrfjgBhSHvG/8AyuJaYWiGhgqONkott7l9x8xmM2+cBJfs3pug+Agddb30Z
uuc3Fd++tKuJpE+7ngdA7whOn8QlpOP8y2pjK457SnFI2xxu1YbHOR8faTQBTNRt
UTkjCzQR9WznxDZ279qUlvEDZ50qq3EP9thBxL/AO7lpsJwDpQ9apeM9KnxNQG0r
EjoyZnpklWgNsELPRUc8C0fatoNdJOR+NaVHmyLwqdV/cpxwUUxwj8mCbKVaR+B4
v07M60Oiu/19ukMopldRf3y26eQaAAw9LSy4dZMx4phkZCkHTrAaa9VTsv+xATJ1
/D+HjQVBYQ430vnEkoM4OERzbJZqExbyTNMw0+dA3Xgz+WFGmBmeE0sS4ALzS/Cx
3b0NMrX2OFN5UqhtCIGIhcje2/4UL8ry3IsoSFZ7AKafJl3qHRRT7HT692wdIOu5
QTEG93LpcG7VCBxHL0inHZiAXQbc7M4okV3FYT8Ghfh90/GN/2b8REDW3BxPknQ9
uIdfKx4Jc1j52yZ08BAT1pGlrSFqJCLPAgoK7D0aHkulfvdKv4YgM1mqpMp+23yQ
p6JsapfhBFSj3Y1H4+bY7tS5LJUiHcsvQGE6lDYA58ay9Lr3hxo=
=prOi
-----END PGP SIGNATURE-----
--=-=-=--
