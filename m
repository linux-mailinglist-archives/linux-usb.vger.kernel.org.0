Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38EDB16A66F
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2020 13:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbgBXMvF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Feb 2020 07:51:05 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39061 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727290AbgBXMvF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Feb 2020 07:51:05 -0500
Received: by mail-wr1-f68.google.com with SMTP id y17so1442014wrn.6;
        Mon, 24 Feb 2020 04:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xOoYcG+N4+4l53Wn2k4999dEy1zUb0WdX2MPvZTx+ss=;
        b=JFdRPu4Y+aYlf9azjYkAQ9J4dtN/mvJv8KTGujlnEy1QuCB2B8V13GuzmnlLRibLfh
         bolvFMuVX8tKd1AUSkXa/8JnnoikHujVAylZlhk6iOJr80Q2IpqbDy9VY74vPxlHWD3v
         2hvrxo+MXbXM8i51YCzOdqe36o4KJ/BdbvZ+F+L8QYmpw51RJv4KOxZimCuswbDwmslD
         fxSzYMwEHbr1FrUuK1qBnHoZt5+j7Wk2+vzoGAyVrrVU2WLNmv2hdaL6df0nr2M4vAlq
         7Aj5Sy4d/8bMjmutFWCH/nrbzxFMYJULlTjfvDtZLyXuVaz6q5lK3/6lsVCvHlHcm23v
         VqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xOoYcG+N4+4l53Wn2k4999dEy1zUb0WdX2MPvZTx+ss=;
        b=mbJiAm5Qlnah2fpHV1V3MFT+FMWi/EiSHsLGJi45z3gKsY9XaS6xvYJn1MTeaA0bsV
         LoKr7UBBCkx5DqCUUDeVmuqa/NvpL1ZQ9esv0xbpcG61iwMkm/cDHGsrKAhXXkObwQoT
         9Tfl1ZGcnnx+tpMp2FRwnmO7fa8pbsVLX47BqAuw97llL8TywH7aUc7JHxz3vPkf3IMc
         zSoW78NOwH/atVD8ySzhQOPKR5a6Q0ivoln/Pwm1aTkOKHXBVG/cja2mlnxepjXMcsha
         bq+6JduMVwA5e7p3JHXyBIdKwSOpH+VtNx7BQiH5nEBrv6RUKXKiJr/6HDCmK3dNGPgW
         R1xg==
X-Gm-Message-State: APjAAAXcFWNWmfKst7lYLZVF+2YwHwv5/aPABNfULBk2OP1z1FspylfA
        4F1X/1zhOnz+0cH10/EKXCY=
X-Google-Smtp-Source: APXvYqxUXizEvELPQRXJr94wcEMHuuFDaQhAkpQ+VPOlqCExUBP88HA9GaJhg7wIVWi131xWyrJA0g==
X-Received: by 2002:a5d:534b:: with SMTP id t11mr66060918wrv.120.1582548663273;
        Mon, 24 Feb 2020 04:51:03 -0800 (PST)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id y17sm18299539wrs.82.2020.02.24.04.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 04:51:01 -0800 (PST)
Date:   Mon, 24 Feb 2020 13:51:00 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     mathias.nyman@linux.intel.com, gregkh@linuxfoundation.org,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH] usb: host: xhci-tegra: Tegra186/Tegra194 LPM
Message-ID: <20200224125100.GA2108060@ulmo>
References: <20200224062145.25785-1-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <20200224062145.25785-1-jckuo@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2020 at 02:21:45PM +0800, JC Kuo wrote:
> Tegra186 and Tegra194 xHC supports USB 3.0 LPM. This commit enables
> XHCI_LPM_SUPPORT quirk for Tegra186 and Tegra194.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
>  drivers/usb/host/xhci-tegra.c | 7 +++++++
>  1 file changed, 7 insertions(+)

I see that Mathias has already queued this up, but for the record:

Acked-by: Thierry Reding <treding@nvidia.com>

JC, is there some way that we can test this? I see that there are some
sysfs files that can control LPM enablement on a per-device basis, but
is there some way to check that this works as expected? Or do we just
assume everything is fine as long as all the devices continue to operate
properly? Perhaps there are some state transition counters or something
that would indicate that devices are properly transitioning?

Thierry

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5TxrAACgkQ3SOs138+
s6HBvg/+JM4X5jwAIB8LBR3PfROxqVLlxVwGE+pixWhI7HgPOhdWH4O+DXM43vpk
JOYvOuVQGtT4I2IMlO4fUJTUoJxLORidr/6yLitVYlizwPrv5CR/BufR3mclEm3z
Jcr1W9ljDrupb+xsisrCmN5MlMUXTvJVhGNuRYrE01LebPkHTCabko1TCVP8Zup7
JZ+FGI3XSgqWn0/+TyrDSiV+RYvT7moE30fIP8jFi3ML50htn9mHt1yNwE2scDM2
JxSkSYGt0SRmq4WFSDcK4vlO2R9PBJpbXz5Gn6ym3mdqxRqPgCpWMYuqV4z3BKvR
mEcXlFGAFecwhk97gSfD5ykbaetceWDjsOTUkYlFZPC+Fx7AwIdLh1/NMq6hg8I2
FZ+zCnnFpO7q/uziqeUBBqteAoEFi094TJ9SlWTfm4esudxPNvU7r3TJZipqiqom
aq9yof+0f9uz4y8uKYk8z7OVWq3w6onXa0/VjqsDCucRPqQnfdxBctRcFFKzUHBH
PqRXRPWAjWVJriqWhWW4+Hl+NsnGbA7SnHN0XNZDQRjPQmgEyz3jFX5hQ04HFhLA
PL8J2WLxcTjkesYO5sadp/3h715v7zpXmlgG9AewN+BZGv964qIfWD93dNBdYy7s
2xiwhqhLI0TN+vhtsFGJARVr8FAGuAKSBAl/lR/u8EA9mw+aPck=
=obLV
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
