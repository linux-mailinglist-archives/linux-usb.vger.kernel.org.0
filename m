Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF9B57F27
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2019 11:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbfF0JVb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jun 2019 05:21:31 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:35407 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbfF0JVb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jun 2019 05:21:31 -0400
Received: by mail-wm1-f47.google.com with SMTP id c6so4913148wml.0;
        Thu, 27 Jun 2019 02:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XYHmvNKfy7VaUIGa95USoScIHooaSeDsjmWpbc/DlZM=;
        b=DK0XgveLOfXKoA649LTTdPi/DSfOwWltI5/VhpCt8qdMXCdG/HDrBfIC9o7AVdaC7n
         G2FD7ZlweT/YtWhN+//m8VLERojrbI+zEVeHJt05Wks+/TgDsALoyUeh/EKaOhGQ+CZt
         vPPFoQ97rYKXUieGTPup6C4WwAnM1r/5ZKKWkhaPs/CcameJY49f2RnPKdj1IIzW5DGO
         GUF2zrBAS2Dyf2IWxi8wQyorAKQYsu2nTGOqFlZ5OewHxoU7U5tLOKED3I+1brS6Pua/
         fvHFq3UwM1bM6ScUNvNea3V6BqOJbOnsEk4mlaQu6GHU/iojbfQaiVwW59jrTxpx0yKu
         X7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XYHmvNKfy7VaUIGa95USoScIHooaSeDsjmWpbc/DlZM=;
        b=TFKZxyTEZ+uG6xlzg6Bj5c70Xv0gsFHgB4bwbuQMQKP1z8XOoT2h1vTmckMpe8vQak
         cQW0IdaDGIb9+i49nbxfq032m8hHoLerkSbrig0d2DluKd/og0eu1LSxOuqL1Zdyd4RG
         9iZoDqLOJYDC0jBh02NcICNEEUH4m6OZa0Fwp7E3Relrxcj/4vlxUptOE4hAav4cGW3a
         +FLCUSTFaJnyUQyizmJm3wpAfayMfJ5RwHN/LJmSKF24LHKXOYL4MmZ+ej0TCq9ZguqY
         u9Bt7XIjkVRt//m0/z5raXU57MHFZrlshb2IZ7DstC0ndsy7PeqhebE+JgrhHPc2Od6X
         Lz+A==
X-Gm-Message-State: APjAAAVyDOk6trHNpetywvRaWUF97aUxreOXlh93Mpg0mazYCVpEDP4R
        2Js410SlFAfbgI2MIYWH/GM=
X-Google-Smtp-Source: APXvYqwYL8z8jMUPRofjPKuNLXPr3ImEkCSknCI7b4LFfUESMzeJ8hzWZnq7kotQ0Gmb0f0NNk1H5g==
X-Received: by 2002:a05:600c:2218:: with SMTP id z24mr2510332wml.84.1561627288941;
        Thu, 27 Jun 2019 02:21:28 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id d5sm1351023wrc.17.2019.06.27.02.21.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 27 Jun 2019 02:21:27 -0700 (PDT)
Date:   Thu, 27 Jun 2019 11:21:26 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [Patch V4 2/8] phy: tegra: xusb: t210: add usb3 port fake support
Message-ID: <20190627092126.GA21242@ulmo>
References: <1560161949-26031-1-git-send-email-nkristam@nvidia.com>
 <1560161949-26031-3-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
In-Reply-To: <1560161949-26031-3-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2019 at 03:49:03PM +0530, Nagarjuna Kristam wrote:
> On Tegra210, usb2 only otg/peripheral ports dont work in device mode.
> They need an assosciated usb3 port to work in device mode. Identify
> an unused usb3 port and assign it as a fake USB3 port to USB2 only
> port whose mode is otg/peripheral.
>=20
> Based on work by BH Hsieh <bhsieh@nvidia.com>.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  drivers/phy/tegra/xusb-tegra210.c | 56 +++++++++++++++++++++++++++++++++
>  drivers/phy/tegra/xusb.c          | 65 +++++++++++++++++++++++++++++++++=
++++++
>  drivers/phy/tegra/xusb.h          |  2 ++
>  3 files changed, 123 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0UipMACgkQ3SOs138+
s6Hecg/+JCCGEunVOF6lHr9nPIXV42u9d0szF6m1qKtcHCVItNkzqPKrOu4f3UrD
b/tj93rC6g5qp1SWgv/APmLDb5jwi8enZOrXBsffw8wVnxzYgQ6XInIIY2v4Jkvr
3hFEvAfsIZoDVmEMVTSxMqCMxgixKvEvURD8NPw367PSt1+K/OCpFAiFZpADmov9
x8HHQPyD/GjNk4bhrP9XfZYErApF60JKiSq7J8dke/VH/hH97b0Wb8s4k5hCzDsv
cWYClQEvIAzwM0g8NwuRqxAi07qlZsaBoOtX53MysagRjuUbv7yO706qGlcUpsen
SEICZIR68OSx4iCcAcFfFvMPjOy3JwUYZI8PTO05PISKp+jdRzyDO+da2rQrYzkH
X/Wb8TKYUE+otEH+PmQ+Rf/9yks1vTWCdkPN9JbsDVpHYBuoaVCrxel0h5WwRBVk
yXR/t5qKEX0t5IapnISMrZNf+o5kGMl/jDV9OWZyG/Z1XCvNCxss1sQHFu6qffqT
TR02FMqBYbkMnWaPBxgWYk7IgJhHs0/dKakgzRedjLVyrZXC+uV+KXnUdu7oNgy+
6HQJg3ML4OjoXhzdDAxyGkb0dvP8YKckpBhZUdYVBihVglhPAgc26mKxOXmNi1yp
7jLPGQItg2J3Fp1Qb5EIIhjHnrYIkM6kD0uRRj9uvxBpAlpAifw=
=fS/u
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
