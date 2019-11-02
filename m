Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE21ED007
	for <lists+linux-usb@lfdr.de>; Sat,  2 Nov 2019 18:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfKBRnv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 Nov 2019 13:43:51 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41869 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbfKBRnv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 Nov 2019 13:43:51 -0400
Received: by mail-wr1-f68.google.com with SMTP id p4so12699242wrm.8;
        Sat, 02 Nov 2019 10:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eE31/JOAFauYoZdtz+I5F+oVDxMEGV02DbqD23B2eog=;
        b=KrmbEvCMDRTSVTbXemiHiYy64i3BXvCrOvFA/8rAj81DvUMcec7WWZKD5lW6M+QaA5
         5FF03gwKjWJXh7LhvgASNh2pHFm5WEmTcXwSoCHOYVpLvD/NW8LdEN09P86CypL8Gtfn
         9PVRDrUMGwKHN4U8acJQuucDE42Kb8xXLMSmHY8KmF7kZDfCLl0lB14QfZoCnfmLqXRB
         MN2WdDdL7tTbmIh/aRtpg7yPIloFTs14OLIeBpbrZlx8bDhYwa9i2JFzhCEYJsEzyh3I
         wxkszH9DmPRX+NY+hjSASXq0tQRVMPSIMG7TVSdfQKzd7FtdZJ/K9xpjP9F+Ub/VmLVd
         L8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eE31/JOAFauYoZdtz+I5F+oVDxMEGV02DbqD23B2eog=;
        b=HIZQPOLNrmQVi+5BJAU2h1RFg46qB9qmud6Y/jM/xc3+NfedaA+J/+G0HBbQHHVK9E
         LRfq5Pob7FDlqcQivllRedLcu7hDufacbXpjd4HsyvTWYI49XdGammGpfWbxqlzHyNBi
         od5dMQErwtnYI3UguFopAMKuCuXh/O0frJJro+1tiOZMS/4CV1sO/kZQGG79vH8QGjYU
         fTp2kOwTEhB23i7kyyb28ngSj5S+7oYrikMUCPLXLkidAcSUqi1VxinBXyvL2xYzCUEo
         XX24T4pt1mp7GQwGv3xAK8u4on9pmHG3XNcGFCr9fxt9Hl6UV20JryotxmEI+lyjfjGv
         p2TA==
X-Gm-Message-State: APjAAAUasj5y2QxbNtIvuPdNSo4TCiFcaMdxWi2EJmr8i0rw8Vv3txgx
        ApmSY+affhK+SRHMJrPn4zo=
X-Google-Smtp-Source: APXvYqzNZAwGoS2XabAWpDMp77ez7uJypObQLtS7AG13Hm/xdx0zohh4lBzicbg4Hx8aYSsD1yPobA==
X-Received: by 2002:adf:cf11:: with SMTP id o17mr15984322wrj.284.1572716628643;
        Sat, 02 Nov 2019 10:43:48 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id x16sm10157043wrp.91.2019.11.02.10.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 10:43:46 -0700 (PDT)
Date:   Sat, 2 Nov 2019 18:43:45 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Peter Robinson <pbrobinson@gmail.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] usb: host: xhci-tegra: set MODULE_FIRMWARE for tegra186
Message-ID: <20191102174345.GB3862867@ulmo>
References: <20191102172606.26934-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="24zk1gE8NUlDmwG9"
Content-Disposition: inline
In-Reply-To: <20191102172606.26934-1-pbrobinson@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--24zk1gE8NUlDmwG9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 02, 2019 at 05:26:06PM +0000, Peter Robinson wrote:
> Set the MODULE_FIRMWARE for tegra186, it's registered for 124/210 and
> ensures the firmware is available at the appropriate time such as in
> the initrd, else if the firmware is unavailable the driver fails with
> the following errors:

So the MODULE_FIRMWARE macro alone does not ensure that the firmware is
in the correct location, right? Rather, it's the tools that construct
the initial ramdisk that make use of the information added by the
MODULE_FIRMWARE macro to determine whether or not the firmware needs to
be included in the initial ramdisk or not.

> tegra-xusb 3530000.usb: Direct firmware load for nvidia/tegra186/xusb.bin=
 failed with error -2
> tegra-xusb 3530000.usb: failed to request firmware: -2
> tegra-xusb 3530000.usb: failed to load firmware: -2
> tegra-xusb: probe of 3530000.usb failed with error -2
>=20
> Fixes: 5f9be5f3f899 ("usb: host: xhci-tegra: Add Tegra186 XUSB support")
> Fixes: 488a04d4bb2f ("arm64: tegra: Enable XUSB host controller on Jetson=
 TX2")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  drivers/usb/host/xhci-tegra.c | 1 +
>  1 file changed, 1 insertion(+)

The commit message is slightly misleading, but I guess it's ultimately
correct if you run standard tools to generate the initial ramdisk, so:

Acked-by: Thierry Reding <treding@nvidia.com>

> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index 2ff7c911fbd0..d25aba8fa219 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -1433,6 +1433,7 @@ static const struct tegra_xusb_soc tegra186_soc =3D=
 {
>  	.scale_ss_clock =3D false,
>  	.has_ipfs =3D false,
>  };
> +MODULE_FIRMWARE("nvidia/tegra186/xusb.bin");
> =20
>  static const struct of_device_id tegra_xusb_of_match[] =3D {
>  	{ .compatible =3D "nvidia,tegra124-xusb", .data =3D &tegra124_soc },
> --=20
> 2.23.0
>=20

--24zk1gE8NUlDmwG9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl29wE8ACgkQ3SOs138+
s6GezRAAvkE99VnmG28zEgepLXFp9S8WLqt/NHyXcXOTzlyb1HnOcf83HkuVCVMo
q/Dr2oydvc3OlmzKA2/HthpyTBWzFKywJVKrSTD/I3WAUhjsWBftd4vH7uwYY2wg
9hO+JIH/9UO7s74by/NyN4tYwOGMMzmkTtJJcz5EMcKceFU28PpG6u4a/btVKCCq
2qZSM2DNZSoBAwOVw1ABlp9pOdeIiJAGk21MMcz+tSv8iVC0P61YRC/8u0oQcZp+
M/vWMjQAr9c131re3tdUNREalP5XL4h7OkCDaJ0vrht1/xj1Tf++hQlvSYGWqFXd
+T+uoBBrOaMZs2vdIYPaWyzpAg0WPyPdaQYwID/nb6fGZwVzyHMUputfbR7CBqG2
SGlCF8Km7wChwBw7TVmm09Ic1G6F188s7l3qpHMqxpmflmpJ1JZbDpx/AEeasFmy
P4IKhhiY7ZMgAvyssVQnnP/BTrKb77mKQMYEOgzyxPu4l1RrG3qOeTnP8lQN1O9N
wjeKJUrwqqxqsJ4Pq+lHfSijHCSSIWMXD9r0vkgWK7YTBpPThqKrEOpOHy5kYrxX
bMx5YahcyfEhDotFl+aBNYpa/L8J9bftQ++AaDxqAz+TuBj1/bfkhJG4hNoocWQI
W1afMrOfsDSr0NiZox0HnCbymWK2gsj6ESYFuFq3jnFzJUffNRs=
=eGRo
-----END PGP SIGNATURE-----

--24zk1gE8NUlDmwG9--
