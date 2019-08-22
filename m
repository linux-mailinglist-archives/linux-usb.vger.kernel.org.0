Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7FA298EDF
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2019 11:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733019AbfHVJMy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Aug 2019 05:12:54 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50552 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730869AbfHVJMy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Aug 2019 05:12:54 -0400
Received: by mail-wm1-f65.google.com with SMTP id v15so4861894wml.0;
        Thu, 22 Aug 2019 02:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XKRo6mMmk6UTDUxA82Y4sbQTofDypb2gfF6/SKwjllg=;
        b=ViU7qvn4LOu80yrZBOeLky9q4V8zVOYnloA/VyCUWJPodlV7gtEIaifwyy0nqdhNL/
         XbLpccfu/t11Ysoz7358n+Bfgw27R6hiFIQFEZiZdhAq5sbpNtZNSx7piPExHwybJztI
         WrQC3yv6Wv8xYNJ/qugCSDe2FPma2f1jyN2FLcAkNz9Vy2Z7M0ATwiCFpGeeTS2VidLN
         nvL6dhTnuBY/UVDZvssNyGCSoPEXkUpqdy3OSQBb+UypRhy/qfucATIOulsBfASD88II
         aih1IB7Y+SCP+qhM8Ia4WwdgHjZMaKdGfe1oTlmcjrZt3/kY33qorbz+wqqGSSnH865t
         pHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XKRo6mMmk6UTDUxA82Y4sbQTofDypb2gfF6/SKwjllg=;
        b=TzIzPrZFJ2gweiMvFfK4KmKp6lwhY48o3QtWsWFR2J3aHz249LVUq14er81+jUU0lb
         dYuBenB0GlAn1uYkZeU6D4E4K46xJIRqGh3UAvmPuyqxhejm8Y3C4F+dVjwPC5hUPgUk
         YCag4W7A8ZBGLo7f3DvOeuxw+E8qtLNxiIY0MqMQ1icx563v3sus5i0TKLXzS6HVPYnl
         WC2gmWhvltZ+vjwzJPb8mhHS1leKlYCtcOvGqcZoxc8Sw5IR9tyfnnz9eNNamfyQSSE2
         hDG5k3+y1LDuwYha53dX0lU8yc/XDpGHXGpLc1R/x6YOVRuon58XSms4UA1kOU2v7/U0
         +U3A==
X-Gm-Message-State: APjAAAW0TSAiq3AM+DQdrh5WxvilGyObwYcby9pcpewsAavfRJRPEQRN
        zKYjYCc/wHSXZjAEqd+mefM=
X-Google-Smtp-Source: APXvYqxfzmjdcyix5W+xrmns0Ftiu58QY56zX8/xsguSlFvKa3Liy+fik16KI0K4A4i2381rZsalVw==
X-Received: by 2002:a1c:a008:: with SMTP id j8mr5045320wme.57.1566465171513;
        Thu, 22 Aug 2019 02:12:51 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id k124sm9221350wmk.47.2019.08.22.02.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 02:12:50 -0700 (PDT)
Date:   Thu, 22 Aug 2019 11:12:48 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [Patch V6 7/8] usb: gadget: Add UDC driver for tegra XUSB device
 mode controller
Message-ID: <20190822091248.GD23873@ulmo>
References: <1565257046-9890-1-git-send-email-nkristam@nvidia.com>
 <1565257046-9890-8-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="k4f25fnPtRuIRUb3"
Content-Disposition: inline
In-Reply-To: <1565257046-9890-8-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--k4f25fnPtRuIRUb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 03:07:25PM +0530, Nagarjuna Kristam wrote:
> This patch adds UDC driver for tegra XUSB 3.0 device mode controller.
> XUSB device mode controller supports SS, HS and FS modes
>=20
> Based on work by:
>   Mark Kuo <mkuo@nvidia.com>
>   Hui Fu <hfu@nvidia.com>
>   Andrew Bresticker <abrestic@chromium.org>
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/usb/gadget/udc/Kconfig      |   11 +
>  drivers/usb/gadget/udc/Makefile     |    1 +
>  drivers/usb/gadget/udc/tegra_xudc.c | 3808 +++++++++++++++++++++++++++++=
++++++
>  3 files changed, 3820 insertions(+)
>  create mode 100644 drivers/usb/gadget/udc/tegra_xudc.c
>=20
> diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kcon=
fig
> index ef0259a..fe6028e 100644
> --- a/drivers/usb/gadget/udc/Kconfig
> +++ b/drivers/usb/gadget/udc/Kconfig
> @@ -440,6 +440,17 @@ config USB_GADGET_XILINX
>  	  dynamically linked module called "udc-xilinx" and force all
>  	  gadget drivers to also be dynamically linked.
> =20
> +config USB_TEGRA_XUDC
> +	tristate "NVIDIA Tegra Superspeed USB 3.0 Device Controller"
> +	depends on ARCH_TEGRA
> +	select USB_ROLE_SWITCH
> +	help
> +	 Enables NVIDIA Tegra USB 3.0 device mode controller driver.
> +
> +	 Say "y" to link the driver statically, or "m" to build a
> +	 dynamically linked module called "tegra_xudc" and force all
> +	 gadget drivers to also be dynamically linked.
> +
>  source "drivers/usb/gadget/udc/aspeed-vhub/Kconfig"
> =20
>  #
> diff --git a/drivers/usb/gadget/udc/Makefile b/drivers/usb/gadget/udc/Mak=
efile
> index 897f648..1c55c96 100644
> --- a/drivers/usb/gadget/udc/Makefile
> +++ b/drivers/usb/gadget/udc/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_USB_BCM63XX_UDC)	+=3D bcm63xx_udc.o
>  obj-$(CONFIG_USB_FSL_USB2)	+=3D fsl_usb2_udc.o
>  fsl_usb2_udc-y			:=3D fsl_udc_core.o
>  fsl_usb2_udc-$(CONFIG_ARCH_MXC)	+=3D fsl_mxc_udc.o
> +obj-$(CONFIG_USB_TEGRA_XUDC)	+=3D tegra_xudc.o

Nit: I have a slight preference for tegra-xudc.o over tegra_xudc.o. We
use dashes rather than underscores pretty consistently on Tegra, so it
would be good to keep the same pattern here, unless somebody feels
strongly about the underscore.

It doesn't matter that much because module utilities treat them the same
way I think, so the Acked-by remains valid either way.

Thierry

--k4f25fnPtRuIRUb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1eXJAACgkQ3SOs138+
s6Fo0A/+PcXssvrJYWWYKpxgFdlOkAIIxEyJ/AS4fYY2prFqg02XnHeXAB5qviis
7sifgfXRt7WIrD+7k4FlNZuIMG8+MlzyyJoL7OHACrNnsszL+8d38ex+IF3+jqie
DbR4HafAU+yGeRzGApZV1eADlFYws6VpKHLHYq5cCpei6OEajBYl+fjJNKixbg44
qdC/Sekg1gZs4cpezwZmmD6Z6bK+l0qIkmWWFpf1N+l7Sqj3lJXZnnxjEEpfkAVB
awHvYSzBlcnl2aGLNQbFHxh5IuU8gpFmeK5TAmywpcVZ1ZgYlIC6RzXs0E/avCCJ
RrvKNkx2BI3eowo4cWVDQEOsZu5BH3HA62P2VEahJDzOB2D92nJ5lcIPQO+e/dge
PmMUbnMRAR0K/OaPzwgiaUeswH68ZcM5HHzGF01etp4chGgcvScFTXgPpbwgO/si
+w6yDW517EiQ/cWleUssClqC+RRkEeSgOQxVHMMYLCFoO472N1RUrKxFgIzgxnHW
MJ7miFhoBO3VAz5puIxfdpVNEKxVD0GUQ3d0b4TIwTUReCIFsSWYkTxw80CmgQc6
2lbtcgkCGLWvXfmkcI4sHrAHLNnaHx4aFrH8QWtfqktvZuYAoxS0n46LVLto5NiV
wSUsu0tRK8hrfy5FpWU0vWyPhXbKr5lqXqTlEtcOpBuR/RTvPLc=
=xJFJ
-----END PGP SIGNATURE-----

--k4f25fnPtRuIRUb3--
