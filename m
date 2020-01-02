Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02FDA12E5A1
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2020 12:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbgABL0K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jan 2020 06:26:10 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35025 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728135AbgABL0K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jan 2020 06:26:10 -0500
Received: by mail-lf1-f66.google.com with SMTP id 15so29707030lfr.2
        for <linux-usb@vger.kernel.org>; Thu, 02 Jan 2020 03:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=IumP070neiSwgdvf8S1SDpXSMBJc7mXdK9Izz4HQVrw=;
        b=f2Zzvw0ciPX9DZGFv9ZW8mJ/WhRI+xZhCdU6qhnPGQnIR2hZnmZS7D4tjLOtcES6Ti
         WU3mAn2rHwZ2nT4sUcpXqdWPkZ7Gz9HiJRl038pQVQaLFZONXG9YBxuE1uhERa9ZnsZe
         WNFKpBMD8W9Mkz0UwuUurwXUQmyfdQe27mQnqXpmlI2eo5UaOF9b+3ubFKDdgp25RadT
         7tdibNUPD4khKCzGGxpeljGAoQ4nh52QXD4asUc7gcFGPjuFwlw4XbX4Y5+EJVwbnkSc
         eVF3YIRqghnbxv7ZaY9z2Y9cJ7GmSA/VYlmQoQaLen22qhb72q7EXuLgnvmk53dS+NLL
         7ViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=IumP070neiSwgdvf8S1SDpXSMBJc7mXdK9Izz4HQVrw=;
        b=ZxF2YNMedzc3m3NJZAqojJLx+LbrPXHlo//C3amOSlfwDCiLvAQoKwPtB4usbpiPqo
         Q7SIExKu3vGfKVAbaxMvouQLarUTkVcdV8uTtk0t/THk4JsZ+HMH4aXtr7WjGLnC7rth
         oA8jAhi9hT7OoiVXpR/546NfSpfU48t+dvmHDr7nbfYeGR+ZInrE+AsDFXQiD62I1zmZ
         yNWtA3808ZjaCSLlmEkIWyurZ0nBizYmA7d66HSZcIqEMgAC8Q67zWPQo8ZpwBd3wlkz
         vEzaZBWKtVm5RDE47ehVtTEZe8S+NSaIQBIf30S31WhY8JwrUM7BH83exiRfXhrgpAbJ
         vYuQ==
X-Gm-Message-State: APjAAAVMMpJEXLxW7mp4dz9zSkXaEVjlnXYpGMce+9sjM/EdghSwn/LZ
        Y1SfTb2taxtVgoannhidKfw=
X-Google-Smtp-Source: APXvYqzhsuHgh1zwvdsGTA+5F08Sy3LJhqDdAc7wLASBI1GiJQqaL+mAm5niLAHxWwHfiQ1BiASqgA==
X-Received: by 2002:ac2:465e:: with SMTP id s30mr47836548lfo.134.1577964368005;
        Thu, 02 Jan 2020 03:26:08 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id x23sm23103683lff.24.2020.01.02.03.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 03:26:07 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 1/1] usb: cdns3: add NXP imx8qm glue layer
In-Reply-To: <1577426348-31227-1-git-send-email-peter.chen@nxp.com>
References: <1577426348-31227-1-git-send-email-peter.chen@nxp.com>
Date:   Thu, 02 Jan 2020 13:26:51 +0200
Message-ID: <878smqksjo.fsf@kernel.org>
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

Peter Chen <peter.chen@nxp.com> writes:

> There is a Cadence USB3 core for imx8qm and imx8qxp SoCs, the cdns
> core is the child for this glue layer device.
>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  drivers/usb/cdns3/Kconfig     |  10 ++
>  drivers/usb/cdns3/Makefile    |   1 +
>  drivers/usb/cdns3/cdns3-imx.c | 220 ++++++++++++++++++++++++++++++++++
>  3 files changed, 231 insertions(+)
>  create mode 100644 drivers/usb/cdns3/cdns3-imx.c
>
> diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
> index 2a1e89d12ed9..b1f526d20f03 100644
> --- a/drivers/usb/cdns3/Kconfig
> +++ b/drivers/usb/cdns3/Kconfig
> @@ -53,4 +53,14 @@ config USB_CDNS3_TI
>=20=20
>  	  e.g. J721e.
>=20=20
> +config USB_CDNS3_IMX
> +	tristate "Cadence USB3 support on NXP i.MX platforms"
> +	depends on ARCH_MXC

I want to be able to compile this in any arch. Please add COMPILE_TEST
and make sure it works

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4N03sACgkQzL64meEa
mQZ21Q/+J16pRmoJ6zx1fGUiImWVfXRioism6bJPkeeE3sdIZVafoZbxW2Ez2nPq
4B090Vjt7sMp5e5pqdpLhu4j39q6MCh3Ugb2xmfaTqXS2aAxVawwRqFQ5JbzDMw9
79H0meYaIbhzyqSVEc95W0DvNp+ET1+U1dJImSKMUoJ4hUOz0/oL2B2WCNm7ZJbc
AQA0g/ydi9wKmctcWgTpWOFw1oeQB8NiqyVIf7WXroDOXlIH10uUUrZLS1gmKaER
sdoSag3Ht3XrHZY4sp1SLZqTIDSIdbVt3QFQcSbFNpKzD5blOx8MoHnuKjbRcQ8+
WVpOLGR3FQ/9l716sM8o4m7aNk2w1DBMOqgPpwZ57y0lxSd2bLpQ9rg8dMF7z1vv
HcAx7aEVQ+lGcO3SnCT2muhfVnGoPLtdygujkAYBrZpHtRJaewPUZib6MimILi8M
dawYwKjccBnJofMOhQuDSVq93KktCk1zfXgt6VjMIOmNiM/x3BAdLgdrNzbxR/sY
4o3Y04YswqxN7vlrYeWUW+JMthB8n4LVMtMgaCdkc5Fls59OXZ8ra/2fgvXyLuVu
Or+Yg+t6L5doQcmzV4OSx0qCLDRTxRoe1Uq5oZSx6JKKeggTtHALsEBnELLP5gaG
2my5+H3u9TYRs7cQDl8OV5sOD3CEFmjGpaRAXuydRUyKYyvrc5Q=
=TuSh
-----END PGP SIGNATURE-----
--=-=-=--
