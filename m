Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A66D2796B
	for <lists+linux-usb@lfdr.de>; Thu, 23 May 2019 11:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbfEWJjh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 May 2019 05:39:37 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33171 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbfEWJjh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 May 2019 05:39:37 -0400
Received: by mail-wr1-f65.google.com with SMTP id d9so5508586wrx.0;
        Thu, 23 May 2019 02:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VqgPKu0gSFv5Y9MgofwXxsJTg3Zs9svrm1t+cEMwWFw=;
        b=uk1WA9NXQMS/rcDfT7Fy8+o/7iUNdShe4xDzoz8xsI76R/FmQWl3VaBVBL8/5qx7nx
         kKA+ljoGyAKn6RWTFI4fECfxnxJw9I9qwWHs5weZj863Xr1lNioBjs8bdbh6MY5r8j0d
         UXLl1K/39OBmz7yPiggLmHQfCdKuvXv83rlVGQolyzDDjULPmHnG9FnyECgVNo8H+q4u
         TODDsZhjMfHBe4DMXwLnX6HRsVXXYEgiIHAxrxh11HllRh4kyTBgJ6hXomT9F4LrXrtg
         5SYs92qv7Nea/O7bMlN0jQEYDcGXwWLmJfIisyiVYvussB8ul8RKqNceORbwk78uzb9M
         /JDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VqgPKu0gSFv5Y9MgofwXxsJTg3Zs9svrm1t+cEMwWFw=;
        b=KdDWgGfU/9yc4oK6hMbd91as5F2F5C+6Ll9mpEwjbQGrwkuUIk0iHhUBnd434bZ13b
         mKAzVtIi/Y5BKFpRDgF035NBhBwJxA5PB4X5cg1+7A2rHYQ86DjXr98uE2LE23BHJfuJ
         qyVNkA1+QCp835oTQaea2BKITdNBvWHO7/ElcgDtHBHcVS5oVSjhFlnaF2+mrshvny4a
         83Ol6Ff6eCviW1a3mpq1kUA+c486U3J2UjlwMUMpOS4TUys1K3Due9ZiaN3GvQMbWfzw
         oEOgcCCZvXR8be04SWwuPs/rKyjBC3bTaRQmcVjoKYTJ5Yk5M9lmMq//JoiIdEYn3Nlc
         ZgLQ==
X-Gm-Message-State: APjAAAV5VaY9LJKHFPgiOSZVBYydEQbHIIQcQdHABxWT7Nnh8+Zvj3Ki
        ohXi+f2vEI45FN6WBoTwZ+o=
X-Google-Smtp-Source: APXvYqzEm3gB/petN+QaSxriUMLhWKcWdJ3PmvFqAD7GsO69F/LCeSFh57ZpdowF5g1kO3aAJYy2SA==
X-Received: by 2002:adf:e408:: with SMTP id g8mr25693238wrm.143.1558604375131;
        Thu, 23 May 2019 02:39:35 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id 16sm7393025wmx.45.2019.05.23.02.39.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 02:39:34 -0700 (PDT)
Date:   Thu, 23 May 2019 11:39:32 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [Patch V3 1/8] phy: tegra: xusb: t210: add XUSB dual mode support
Message-ID: <20190523093932.GA30331@ulmo>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-2-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
In-Reply-To: <1557988772-15406-2-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 12:09:25PM +0530, Nagarjuna Kristam wrote:
> Configure the port capabilities based on usb_dr_mode settings.
>=20
> Based on work by JC Kuo <jckuo@nvidia.com>.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  drivers/phy/tegra/xusb-tegra210.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzmakIACgkQ3SOs138+
s6HqrBAAh1I9ZpDHggSxfIdrB2BJGE9ome+J+MrxPp7RJStGx/jG7N9ChEhBFkRw
36c7vnIokb/5cN/wIxqUQordGrK5eNzYtVk9NEn00Qc+jNqp/pIlJ9TAf7xhDjIP
ucVEQ4N31B0oEnT1siIbXsnWzbh4/apBUUUiEXY1DtgBntfizcUXrcsZwXy6+mIL
Y2FDmknz2kGrIHzHIgsTh4qU3p3P2Rr5XUFAKURnZJK1YTu5bK05gI4mwuqnSy1S
ZktoXTBV/FQHTyxy2UsK9M2UV8yLgfiIc9LoK5ZbouoIWHUnb5Lig5bkh4OwoEey
5nGAPGGby+yPg9qEnAGF5oDn8LU/4mc1ISz1wqJ8vv3C/uLagyeSUr5EZDG4TC2L
KZ0JjzWzLPHub9MuAgviacmSTuV0v1x14fgHXqURh5z+iW4MiGdmRbSy6PrQB7Fa
O/5xephgkozime0SFGHCgDt7Y3cU4h9q4NCQL5JopV6amTytp3usmezUqWpXHGf6
+L6uNd8A0yE5h5diJ9usDouCZyo1p+yGAlj1DKNMC1WmbQFdPx3U6hDYc/7klvTa
XV3/IKYGJTHhrtBHkLtCtBelKPajOHeZF4MUXBQ+C0dfd49LLXF986W61030ig9F
8MPmcaE044JuYXXiaicjLHcLHAfuiDysOshEe3/EsZ5TPm/Sqtc=
=CaMa
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
