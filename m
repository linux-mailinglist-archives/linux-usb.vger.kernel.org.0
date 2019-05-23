Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16EC827A84
	for <lists+linux-usb@lfdr.de>; Thu, 23 May 2019 12:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729972AbfEWK2m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 May 2019 06:28:42 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34641 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbfEWK2m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 May 2019 06:28:42 -0400
Received: by mail-wr1-f65.google.com with SMTP id f8so5681645wrt.1;
        Thu, 23 May 2019 03:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BdE6Z50qohkAbZlD+A59mn2UeuwE91nxc0ixl5L5n6U=;
        b=CCGhj8rvsU6yrFXg3a4aYoNH4oQmEKCI+eXk6MwKPd4QQnZ5tIsOiALYqWZUQ53asu
         2Z06sTn4nIusnmb1qIsHWSzXmaGIhOyY7crjd112pddG34M04AqbABpBESFgG3pORZhs
         g3qWg2T0abdG2BieJzqD7FiHVpCXCzCk0u+NolIFutdV/YUmd0NPfM+lGjmkWn3sFuiO
         Xjy9z0qojWpheVUS4SHc1Is0QuM897WU5xzfjXxI77IZ3s87vpkEJdmYj7RK4DDTk7Ee
         jvPG21/dwiYlBVL3yQRk1jKSXzZQswtYXVEgLuK5OpVovbtBW4UKMYKvPsUNHcQp7slI
         rVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BdE6Z50qohkAbZlD+A59mn2UeuwE91nxc0ixl5L5n6U=;
        b=MLAQL6+q6JvI3YZyuZi5pW9tf3VRNmXngc2Ov+6UndwFJGSqTiRsGZ1jvEKnlAK1Bn
         hxSSUKu+Ig//Vq+JTQgMqsM6NLnGRPvRB+ynwCpjlrl9P3nQmzA6uPcWW8E7C/yJjPKi
         13eThd1dTRn/11p0RUWZOvkU0/TQCka295fm9QV9Vz++ZunSKrJSjeOys8KOJgWdWc5f
         ZFq3wNQTk/yPOHwDITCWns6p7FN+afjmqkILqMvwNTLMDwOoIk+zhq/CZfQ6Kj5liqoV
         TVveEyCl6X+etsKO5Hj2XPgapfyUe5in4ZUCPOHXbDjzZ9o/NPpc7hfNWoz8UG2vMcSi
         JksA==
X-Gm-Message-State: APjAAAUidlScdEY2k2bvhS+matArQBWzN8QLXYppkSqEoAl4olvUa9qO
        aRJwpejTEnjn0NzynyCUU4c=
X-Google-Smtp-Source: APXvYqyJlhOj15fNkGnHrCmjXgIuTqmr9weQroMELPGZZB1e/Lt+3AdGpdFKBkYW9Fqv+pqjvEkwDg==
X-Received: by 2002:a5d:53d2:: with SMTP id a18mr6062589wrw.97.1558607320786;
        Thu, 23 May 2019 03:28:40 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id s127sm10488581wmf.48.2019.05.23.03.28.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 03:28:39 -0700 (PDT)
Date:   Thu, 23 May 2019 12:28:38 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [Patch V3 7/8] usb: gadget: Add UDC driver for tegra XUSB device
 mode controller
Message-ID: <20190523102838.GG30331@ulmo>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-8-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="aYDVKSzuImP48n7V"
Content-Disposition: inline
In-Reply-To: <1557988772-15406-8-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--aYDVKSzuImP48n7V
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
[...]
> +MODULE_AUTHOR("Andrew Bresticker <abrestic@chromium.org>");
> +MODULE_AUTHOR("Hui Fu");

Andrew was credited in the commit message, but what about Hui Fu? From
this line it sounds like she was also involved, so perhaps credit her in
the same way in the commit message?

It might also be useful to add yourself as author here to increase the
chances of somebody finding you as contact person if there are any
issues with this driver.

Thierry

--aYDVKSzuImP48n7V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzmddYACgkQ3SOs138+
s6FsdQ/7BUwiFERnDiHKMfSHMrfaZx9OxjFEhW6jEc0MwjLCcf8X/723012CZrCV
awalz9xEuHLCG7rvSMcwScykePXXCHri0LXmlP98S4wUxEjX0A5F45uJJ0tsrKWK
F08kmCaW0bGxkLbLhh+tTSKuJ1/jI8B3h7qusAbYY8+J6hOUBj1AHuY6+pul1PiF
Y2oj62J6FeBWpE7llKFQS6eZUCG3zKZormAv34hG4WREktOsa/MLRgijYkFjIkKc
xiKXKqJIHdj9qM273Uat/fbR/4db/Wb0Gh7vWXqJkn0CwgjE/f8JH7J31YGvs1R3
tIkDErUg6NHbnlW0jMzU5bsq5PBe0MinRVkMLWsjBKjTpzW+H5LK89ueeM+l1eSH
rHyGs8sCuvmPFmZQ5ZemOd+TI3YDTCwjp3LZ5sc3wcbhTir186Ku9rKsas/dKeTD
TJ92qocJNNZpZby54TsIVU/yUE9kGvrT2IQmF7capV1PHLx4UHQeBG7NV6I3xAiz
TABLNum30y8Y4Z454b6N7A0en9Di6snqdlS7o0bl7oZbRLFPxgeNMOO15IJjOG5R
jDbUIG8IafQOZSgKmjw73RCaCF0fZ/zcLaHeYyKNzWJ6035y+uN8nRPL6mZbS1j2
ElvKHi6t+1nH30usXxvU4ZW5/CO1dO4OXV/gxpCv5UUjPiKXrsg=
=Kc9c
-----END PGP SIGNATURE-----

--aYDVKSzuImP48n7V--
