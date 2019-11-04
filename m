Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6898EDBEF
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 10:52:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727419AbfKDJwx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 04:52:53 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43207 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbfKDJwx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Nov 2019 04:52:53 -0500
Received: by mail-wr1-f67.google.com with SMTP id n1so16239226wra.10
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2019 01:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kep0R/Ob1fD71DGcYtFIvYWLxUv5FwtN/9zm9SAYrco=;
        b=gRdQ1MuF6zqDUSFSery9j/k5QjhtOA+PzojzzeaB5cTbQWwnZf4g0Gc3MzjOI3kwE+
         knxHJBTEVPbNWlWE/NgCDQXZ3Ao4Eb/tqNL4n1msXwR37pBCqz0B/z21oBixONgN8QtA
         cmxKEOswFgW92WtdYW6JcCw+ccvLHc+aSNMLrj6IVsFP9tPYUE6uX3FHE/WuJ0mbSe4l
         HLARoClqoXwHvYpmrYKfbN1rpdyhV8f34LtEmZmMl7enT7aEZw56vN3rFCf9yUE47fVh
         7yT9RYBeOfMAXyAEaSqkAZ3/7IZbfEzWVGf+J0DR59HBO5r3OriTalxilMtUuEtg3eGw
         /A5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kep0R/Ob1fD71DGcYtFIvYWLxUv5FwtN/9zm9SAYrco=;
        b=FCCHG+ZP+CX/V+rKantS/h+4LVjkH+nBJF7a/0wu7Ncexm6r+W7g4BAoNcOZOV6Y0c
         UIhz3Y7dmb6WukswSVzu1AKjSnCX/NI/HPCUiZyQ/RU2MdCFdAmZgcRU10Zs1xHnmRzk
         1G16zGhQS6EaU1zRNIRco2yRdfGDebdg6zAFXFQ2SKjW82eHGdGK4G/vzmlI09T6S4R4
         wolQxPYUfzt4ckmBF/afg6ZvcHczgI3/qMfT/uxpOZ2V0wkwLMCDcEfJrWqPpBjX2jVQ
         cTgRcmrthw+AfKmJfcyU5XaW0T5p+UwN6a+DULZ3D2mmDurjmAJRZy+EfpeaGXuEealy
         XjZA==
X-Gm-Message-State: APjAAAVPLBOaBcfc5K7qbcvZuuFg9cOGQ/p/1xQk3vV5FjFM+LbvItAz
        8DNCuVXY2JIzrtnXi8VIncPrUpE9
X-Google-Smtp-Source: APXvYqy61DoQqYgxp8nNKBEHPFOgsOeLbfqy5yIP9lrJJn2lvhxp3hdiDXgtrD1kt4Nxv1MdTCPrFw==
X-Received: by 2002:adf:d18b:: with SMTP id v11mr23564650wrc.308.1572861170359;
        Mon, 04 Nov 2019 01:52:50 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id q6sm16856193wrx.30.2019.11.04.01.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 01:52:49 -0800 (PST)
Date:   Mon, 4 Nov 2019 10:52:47 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        linux-usb@vger.kernel.org, Jui Chang Kuo <jckuo@nvidia.com>
Subject: Re: [PATCH] usb: host: xhci-tegra: Correct phy enable sequence
Message-ID: <20191104095247.GC985882@ulmo>
References: <1572859470-7823-1-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="V88s5gaDVPzZ0KCq"
Content-Disposition: inline
In-Reply-To: <1572859470-7823-1-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2019 at 02:54:30PM +0530, Nagarjuna Kristam wrote:
> XUSB phy needs to be enabled before un-powergating the power partitions.
> However in the current sequence, it happens opposite. Correct the phy
> enable and powergating partition sequence to avoid any boot hangs.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> Signed-off-by: Jui Chang Kuo <jckuo@nvidia.com>
> ---
>  drivers/usb/host/xhci-tegra.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)

Do you know what the amount of power is that the PHYs drain? We're now
no longer able to power off the PHYs when the XHCI controller goes into
runtime suspend. That's a little unfortunate, but given the powergate
sequence, there's no easy way around that.

If the amount of power we're now consuming the idle state is significant
enough, it may be an incentive to look into a way that allows us to save
it. If it's insignificant, it might not be worth looking into it much
further.

My understanding is that the only reason we can't do this right now is
because the generic power domains are always enabled before the device's
->runtime_resume() is called and disabled after ->runtime_suspend() is
called. So one possibility would be to add a mechanism to mark a device
as wanting explicit control over the generic power domain. That way we
could order the power domain vs. PHY in a way that's compatible with the
powergate sequence.

Again, it may not be worth the extra effort, but without numbers that's
a difficult call to make.

Thierry

> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index 540b47a..bf90654 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -763,7 +763,6 @@ static int tegra_xusb_runtime_suspend(struct device *=
dev)
>  {
>  	struct tegra_xusb *tegra =3D dev_get_drvdata(dev);
> =20
> -	tegra_xusb_phy_disable(tegra);
>  	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
>  	tegra_xusb_clk_disable(tegra);
> =20
> @@ -787,16 +786,8 @@ static int tegra_xusb_runtime_resume(struct device *=
dev)
>  		goto disable_clk;
>  	}
> =20
> -	err =3D tegra_xusb_phy_enable(tegra);
> -	if (err < 0) {
> -		dev_err(dev, "failed to enable PHYs: %d\n", err);
> -		goto disable_regulator;
> -	}
> -
>  	return 0;
> =20
> -disable_regulator:
> -	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
>  disable_clk:
>  	tegra_xusb_clk_disable(tegra);
>  	return err;
> @@ -1188,6 +1179,12 @@ static int tegra_xusb_probe(struct platform_device=
 *pdev)
>  	 */
>  	platform_set_drvdata(pdev, tegra);
> =20
> +	err =3D tegra_xusb_phy_enable(tegra);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to enable PHYs: %d\n", err);
> +		goto put_hcd;
> +	}
> +
>  	pm_runtime_enable(&pdev->dev);
>  	if (pm_runtime_enabled(&pdev->dev))
>  		err =3D pm_runtime_get_sync(&pdev->dev);
> @@ -1196,7 +1193,7 @@ static int tegra_xusb_probe(struct platform_device =
*pdev)
> =20
>  	if (err < 0) {
>  		dev_err(&pdev->dev, "failed to enable device: %d\n", err);
> -		goto disable_rpm;
> +		goto disable_phy;
>  	}
> =20
>  	tegra_xusb_config(tegra, regs);
> @@ -1282,9 +1279,11 @@ static int tegra_xusb_probe(struct platform_device=
 *pdev)
>  put_rpm:
>  	if (!pm_runtime_status_suspended(&pdev->dev))
>  		tegra_xusb_runtime_suspend(&pdev->dev);
> -disable_rpm:
> -	pm_runtime_disable(&pdev->dev);
> +put_hcd:
>  	usb_put_hcd(tegra->hcd);
> +disable_phy:
> +	tegra_xusb_phy_disable(tegra);
> +	pm_runtime_disable(&pdev->dev);
>  put_powerdomains:
>  	if (!of_property_read_bool(pdev->dev.of_node, "power-domains")) {
>  		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBC);
> @@ -1321,6 +1320,8 @@ static int tegra_xusb_remove(struct platform_device=
 *pdev)
>  		tegra_xusb_powerdomain_remove(&pdev->dev, tegra);
>  	}
> =20
> +	tegra_xusb_phy_disable(tegra);
> +
>  	tegra_xusb_padctl_put(tegra->padctl);
> =20
>  	return 0;
> --=20
> 2.7.4
>=20

--V88s5gaDVPzZ0KCq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2/9O0ACgkQ3SOs138+
s6FYpg//RWO21Xe6kZjFJQa8a60fhuLtxMP28UifR4/tD3pCrmMsdjTfZdaF4ETU
LQSx3kPr4ZOc75VS76/hwV2nrzqCFRBsJXFAkIFRpOAdh4iCib3kFBHE3ip345A2
cDQX/XjJzZVry9mEmo+KfLuSoYMu7YAfokJhRQc06llQDpsqyjDaabf8ty5lp3kb
GVUGHqJpu3/Z/X4sWfACVNzD3w3izyQnOLhEmecOJY9o44xX8wl/2emBIXcOAPfA
IMjfy3pTkc53QRnA1HjJ9ck+dnrvvNEkfe63drYmkkkfEqPVZwlsOVCBmogP28cv
1N+EQQgCFAyzantt/hizR6h9CQdHh9MKEGXBq8F9EuQ4lY0vFbQwWxlgmdYJPNiK
nYyHZ/2brwGm+KArRYvdVoWY64rdLJH/sz2lgVuCEtBHSrnf9cj4RvgzUhstkRk6
5AT2ObWXFLrOuCuK2Jzd+oJj4M8Wx/WUuJchTOmg735+z2ZTmPn19FAOC3rur5Wa
cwfyxETUviz7fnmC0rQM5Kw9z4dUopxFXRMqCV11pivzNRnp2bcd50D8acEsUMG+
1/y9+jZrh77H8JEZOhzhmbEzqMa+fHUGGcKteijSLnGIzH7e3p/80T9AXlgRVBLb
juz+dNFYBg5wSKgRqJqnCbK2ivUhkKs24u/bYAyfFpWTWr/SKZQ=
=PEKC
-----END PGP SIGNATURE-----

--V88s5gaDVPzZ0KCq--
