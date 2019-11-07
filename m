Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09E2DF332A
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2019 16:32:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730047AbfKGPch (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Nov 2019 10:32:37 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46829 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729948AbfKGPcg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Nov 2019 10:32:36 -0500
Received: by mail-wr1-f68.google.com with SMTP id b3so3460197wrs.13
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2019 07:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=u37bxfpOo+ottNHej7aScsLLE5K5CfLqDHWxogqE6Z8=;
        b=gGkko/g45G+8WIQJfYsQ88hIpA4YlDXocvq7d9PQXGAYFfIaHyouywvWbyAuR3NADM
         tOx+0+k91WMjh743rto2KzwXJvDHMGaciB5jRqpAPp6jOpc8IaTdc+Wzuulx8O/HY/F2
         iNBewZ7GWNjUkXU4FJDxwdPA+UX89lqYRN9FmppVFTs80SU6xouCNuNPa5dMYurUie1K
         1QPl2w2FGalv/cqV1xCLREOodYMAOgtGU2HnbKzECYKFOLULE2ny4QcMByX7eoxZw0px
         570djjbtNaf0PeD4otVO4vAb7ShMXDl4FilJrbnr3thOjuThlbMcMKQ5f+XoCG1ivGSj
         Xpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=u37bxfpOo+ottNHej7aScsLLE5K5CfLqDHWxogqE6Z8=;
        b=N9UZisSzdjqSZ8UdoJr/1TCG73CBjgd2QqLuLZPdBE1mZM4tDnBJcnqtvOczwRYUfn
         DHx1guCbLjulMQfaZEuJAfH5HX4iaL+/RlKRSBD7Hwe2vCEdgffIrZqoOfjqBsTVEJmj
         PkV+6am9zC+YIDcMAj6IJ7XHtdPXuEijPC73/ebn0W+wzaTctyvkxkj2jl/LByCGQviF
         WrpQhYTdpBBHKNv1QiRzoTXkJg8pyQrJY8GbQZi/CUA7UvZObYUtN2W6Bx+uafh6cLg0
         QKYfN5GIXzqQ7V8ABVzlbSn9K7R0Ppu3HAHZ2oJyDdzblYWPW5Kyn604MUtB+EC/jkF6
         pZSw==
X-Gm-Message-State: APjAAAVhuYtDIGfRctCCmtiFVqvGSmkUUGgnka+eLppMfGqsYBhsbTK+
        PGasj9uiWOQMVDN1GJQvITM=
X-Google-Smtp-Source: APXvYqw0hAODb6sbOA6/PZoTYAHsLaYN0NJ0vnqkvm+qGCPB+dhyiLdPvv9P4sgHeIj9I1TRls4KuQ==
X-Received: by 2002:adf:dc06:: with SMTP id t6mr3577690wri.378.1573140754331;
        Thu, 07 Nov 2019 07:32:34 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id q15sm2427580wmq.0.2019.11.07.07.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 07:32:32 -0800 (PST)
Date:   Thu, 7 Nov 2019 16:32:31 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        linux-usb@vger.kernel.org, Jui Chang Kuo <jckuo@nvidia.com>
Subject: Re: [PATCH] usb: host: xhci-tegra: Correct phy enable sequence
Message-ID: <20191107153231.GC2580600@ulmo>
References: <1572859470-7823-1-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Content-Disposition: inline
In-Reply-To: <1572859470-7823-1-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--lMM8JwqTlfDpEaS6
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

Acked-by: Thierry Reding <treding@nvidia.com>

--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3EOQ8ACgkQ3SOs138+
s6Ewwg//Rr8bacBFU+xus5haqlD4nJaPJ5stctu2+33vUtNqeWuxFvsFH8YwWZrs
SQUUEkr3m1q9vkJpxE231QW2FELTclzyshiAUIzcjbuXuCn6al8DAd2n3vhMAZmr
67F6TZUeJSMwy3INmzDAt6rIAkh+Xfub3Po1gwrZ6HvTaJEl57LJfhnw/etUbc6E
S08h4iV9tXz0u2I1jnmlW2RGLunHWCkhYg/B2YaDWGEgHNi3bFvQvRFRONRaAsNB
RhNBX9TsI74/WOxXIF+2/pTH3Z/6r3H5qM4axZs/K+LIXlXjmGafgPqO/hLsVcIS
OGmouVYWFCjZ4vJAYmeFoUYCa6q2IUZs3CvXFhGgGI5BglEiD+cFng2hIQl2iK+z
vvzkvxE0IuxS+fY1R7HNw35rw+TEV02Hp5TGKEdJTVBD7QxtuVK2AJjUX98xbAoC
Nt/RHh2FcN+6F3sbLj/EN6qBRxLAIH0COCnZx7mnPGa44Cf1ei6F9xxH/tp9oAAA
KqO8cYJEWHLV68Cq/6d4TGCYCZS2lTKHbiICH1unCqDI+wAydlISYWd8YLCbSTxu
2n83eo2nApxWFQ7Afdw1lxi/dG/03NEfcQuMtxE+15YwyHx8NjCja5TSgPG+HY+T
pfBrZEUboBLTt7flTd5A4kmKgPTDeM/lgSG+W8/OwGg94x1todU=
=b6h3
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--
