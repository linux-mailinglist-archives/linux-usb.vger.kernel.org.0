Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAA5027A76
	for <lists+linux-usb@lfdr.de>; Thu, 23 May 2019 12:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728518AbfEWK0K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 May 2019 06:26:10 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34317 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727434AbfEWK0K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 May 2019 06:26:10 -0400
Received: by mail-wr1-f66.google.com with SMTP id f8so5673004wrt.1;
        Thu, 23 May 2019 03:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qFC5SrExE3ziUojUjgB24ZUk3BEaqL7m9QR0bld0BkM=;
        b=RqtKI/vPi9UwhL2g9FW+D+zuyKRGS+pacgVIfmWu1gpQdiuW4J+QHTAlrG7/HyKp2z
         pMa1Uj/DUlJmL3jmrDoTPrc0vnhjIWHb2iub63z4X3soQfv6+343SJaP8cKgA0u/nfeL
         R1naioUF0NrdSn18lg16GlTzOlrzlGgYNstBCrYWMrgHwWlwi23z/RxPzgLXqO2E0Z/+
         JsBeYHK2e0SDGz3594u95mtyHDV0wAiAWn+uixmREeh/pz/0alWgiUte/pH9IVq1sfo0
         W6qQlQqsqPEhJq37QUkVQIK/H5q3gl0+zFXd7DuMM+ahulTEj0OcGBpqt8Ffu7a0+LU1
         6b0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qFC5SrExE3ziUojUjgB24ZUk3BEaqL7m9QR0bld0BkM=;
        b=NghzuoqsCrTM2hTqKoga7NmQokzjHLXPOUCm4ZGQCgWmqM0axIZxQDnqEu8Ua3reRQ
         UkCLVsdx01Ou6RKWpgcCEqzNMGPceU1UwNKuFUkrrAK0QlzpXzVzZWQ4komPdKIPTsht
         Fu/u9i8hLlJpo2z7wzqKEL3lcMY6ZMwShdnLt6P3N5iNrZremIcuVoe2wSqV29mhhEZy
         xNrMIkMOyw3O7nypAPURKoSaRgMA3h8ZbPL2H8xs3AAjb1pPVlwQV3Z1DBQgtI2PuX5h
         XVI52o2ZBUPHdxLpOBhpJ8MKCQ7p1ubPp3fqXqTS1qGLxXzO1zEfroJ/x4ARO9fNOEhn
         F0Nw==
X-Gm-Message-State: APjAAAWKfNtFgaPIQ83R+/guOJDmz6QTuX10w0lAMlweWQhAOW+K5UL9
        ycCWUHeGpU8+49HmJaTHCgo4veIaHX0=
X-Google-Smtp-Source: APXvYqyrsrguH6setE9UOtuWl7arQ0j0JqlR21SDAGfF8QvM3fElNI2ehfHkIDXpJe68HxiEJ/i1Pg==
X-Received: by 2002:a5d:6b03:: with SMTP id v3mr14753858wrw.309.1558607168706;
        Thu, 23 May 2019 03:26:08 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id w13sm8917257wmk.0.2019.05.23.03.26.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 03:26:07 -0700 (PDT)
Date:   Thu, 23 May 2019 12:26:06 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [Patch V3 7/8] usb: gadget: Add UDC driver for tegra XUSB device
 mode controller
Message-ID: <20190523102606.GF30331@ulmo>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-8-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="aPdhxNJGSeOG9wFI"
Content-Disposition: inline
In-Reply-To: <1557988772-15406-8-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--aPdhxNJGSeOG9wFI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 12:09:31PM +0530, Nagarjuna Kristam wrote:
> This patch adds UDC driver for tegra XUSB 3.0 device mode controller.
> XUSB device mode controller supports SS, HS and FS modes
>=20
> Based on work by:
>   Mark Kuo <mkuo@nvidia.com>
>   Andrew Bresticker <abrestic@chromium.org>
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  drivers/usb/gadget/udc/Kconfig      |   10 +
>  drivers/usb/gadget/udc/Makefile     |    1 +
>  drivers/usb/gadget/udc/tegra_xudc.c | 3807 +++++++++++++++++++++++++++++=
++++++
>  3 files changed, 3818 insertions(+)
>  create mode 100644 drivers/usb/gadget/udc/tegra_xudc.c

Looks good to me, but please address Chunfeng's comments:

Acked-by: Thierry Reding <treding@nvidia.com>

--aPdhxNJGSeOG9wFI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzmdTwACgkQ3SOs138+
s6HsmBAAs3zsZ3R7r94PXVAXdD0EvYx1TgGb0Xp/1R/e6nLD85CHeYOwwZ5OJnGH
fmsVUPYAM9S1I3NocnOgMf/eBl5fUCNY8g5EOgfh55j7svLM0hX+yIv8omje8AA4
e745dH6K369HN6bRf7JBrRQmg7P1gf7WUxDJbryUHWg+/aCgNCrVpOquswDczYFa
ThfkYWO6XnfdMeszP5oVQGlguDhBFAzpIs2pEtXR2YGzF3IbM8WzR22vTJtybAif
2HvvM7/lYsCgs3T21S2qEoHDz9i0MwQgFg9vT89iCgo2jsWL+V8Xq0cUPSEkHU40
yx6tsMZ96gwLg6kG8agN1gdXyXEDmueszhRwYcWCZZAHu4XflbtiO0mAN1KSZxNh
X4BeybKLkSUM/iqO1tDgtRU/46TZQKWNwO+bCUpMzntyfi76DbNdQH4Ltt49o3aH
5PkPkG/oc/sfFQx5ikNII+urMhHJIxzAS9+sNRMptQCCrzg4RB/RGyQdyb7fk6Je
pt0t4AM1HHGN1BdZ1ij1Q8m6cz6wyaZUjl1HKJFrZmaaFCkHchfGyvqJOSbH+iig
gJEm6rk12boPc3PzGgL9JsKx4S6P0TUnfQ92c5+DyeA3BTnpC6duvGopVT/yMDZq
BS7+1vbwYb+0XAtfEeEkPrnwG8k6MV0q0QYHHLZ+nE1HdR9APpc=
=vI9Z
-----END PGP SIGNATURE-----

--aPdhxNJGSeOG9wFI--
