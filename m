Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DBCF27A8B
	for <lists+linux-usb@lfdr.de>; Thu, 23 May 2019 12:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729762AbfEWKaq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 May 2019 06:30:46 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42094 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727466AbfEWKaq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 May 2019 06:30:46 -0400
Received: by mail-wr1-f66.google.com with SMTP id l2so5658225wrb.9;
        Thu, 23 May 2019 03:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=neBs/yiQpGrDacuRSHIGWUE7O7z1Q8eUFAQh1cTDFYY=;
        b=YKmTQoInzb/M7lUvBPhH4xEqjtzMhYOyEHlkkMz5uvCu1bo1Va53B2EqUxnGmccYWQ
         ikAyxZb72rvmQqAoOlrqTvE9FypyV1q4cqjrTPYdjPDO3u8D+MgFhkYF12g5yhIrbYD9
         tf/uKO/UxVjKv1QNuvyFzycNB2fpLJBu2EaUzD79KfIIf9QZGqZTr8a6yDhFIA1V1OZz
         9gpwrdkPZQmbDRWz6cINrLG2WtqRhrvWyV5HAoEIw4+UwGpG27GIM5jizhVUf1UxAI7l
         vdpx/iWpIxCqTy6Mlf+Q2IFtRph2ZzsipZFBA8H1bcjxx/YzlZmmEFWf8h9SJdblVl9Q
         W9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=neBs/yiQpGrDacuRSHIGWUE7O7z1Q8eUFAQh1cTDFYY=;
        b=MrmgxEOU5+1iqnOjUJORI+73pt4EGp58U09agkGyt/nu2x3vvgX6O6I/IxLX9j0wLl
         MjaeET0VRDtGkt+fjNz9T5V308nTzeT2yo1X/X4iGZZhENKFJj+j4EPxA9C7ff3k2pEs
         MDTwHZM6qg1VBj4iaVEs9fKCqrVLzLGAyuiE5EMyIfD/Eq/Vam4ztBsZDiEAuumaNvwC
         7ZA2XA6OK/cQ2pgo2rv8h5fQijJBKNG4Wfx4E9agQEFADGB6vsjOkKDnorq3gHLkG5K7
         WO/9/RoBKvCAA+4q6EfNR3zXkmVIdxyY8mh9ZBemeLsoEmbNcFpO+VCUX1Hkcp5nFy1F
         WcFA==
X-Gm-Message-State: APjAAAXCBvKDFTD23qMup6jyQLzqz4Z9qitAqG2jWdzCUbOBuFC6MLIy
        vKBBKecv9dZ/Okn2WeyI4zU=
X-Google-Smtp-Source: APXvYqy9AElth6ojst8O+hubrg4OawSoqRUKLM6T3kt76Ds9otowaEgvpMlS09Xoi8gu1xsdILWtJA==
X-Received: by 2002:adf:f4ce:: with SMTP id h14mr1728379wrp.17.1558607443926;
        Thu, 23 May 2019 03:30:43 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id v5sm56935714wra.83.2019.05.23.03.30.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 03:30:43 -0700 (PDT)
Date:   Thu, 23 May 2019 12:30:42 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [Patch V3 8/8] arm64: defconfig: Enable tegra XUDC driver
Message-ID: <20190523103042.GH30331@ulmo>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-9-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cW+P/jduATWpL925"
Content-Disposition: inline
In-Reply-To: <1557988772-15406-9-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--cW+P/jduATWpL925
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 12:09:32PM +0530, Nagarjuna Kristam wrote:
> Enable support for Nvidia XUSB device mode controller driver.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index b605b7f..bf1437c 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -575,6 +575,7 @@ CONFIG_USB_ULPI=3Dy
>  CONFIG_USB_GADGET=3Dy
>  CONFIG_USB_RENESAS_USBHS_UDC=3Dm
>  CONFIG_USB_RENESAS_USB3=3Dm
> +CONFIG_USB_TEGRA_XUDC=3Dy

This driver is fairly large, do we really want to make it built-in by
default? Are there any downsides to making this a loadable module?

Thierry

--cW+P/jduATWpL925
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzmdlIACgkQ3SOs138+
s6Hjig//a8Z5vwgiC76NnBHuHQKcalA6kpCMsG8UH90QVcUGJBWlvniGczTopMKL
EVqkTE+myEuiE6fVErzhkpbQix41hUf7I68pL/bxvX29N+3KcKH9VlY+vv0iWnL0
rQB9D+KhWe0gBeaufIBqKcuPvzz2OuQ1uRcpubfW9cE9hqgkRJ/wH28uWSmqk1+n
pDdO5iL+DUq7Wj2UW/R7o+T0xy455AoG3RIgV0sn8E9wPhXDj7sg3z1fudQBnoh8
CqmEVvS7ruWeQhIShLJIEzvQFsKFHzEs0DAZ1gyma4JdprSr4s5cdmBNoi69jbvs
0BVFcVTH1V9uaGT5mgHaBHQry7cGBm0VQPGOS4FNQJ3YFdg8CBwdbHHG13MzCYLx
FpwU9UGUJ+YRwWXQzpd03+YCBl/KdG5fdvr77KqQLHY+SzDrLTBoKb4E5oX1nNw2
wjiHXuz+8vHMG0QJWaAoQz7GcZzCfpfSNfgEc4uJpZD7K5RtK4JW7Urr2XKs0xyY
xTs4oRhSyJ+2t74NLiDYe3Oxjd5BWQzJGA6L/Z8LxZi6JXchQbzE8+0I5Dx0IlHV
Ra75Zs4La2Qx7zOnQwqukccqIL8Hn3bvorl/XLZ+ExRlb/lRVc9+nEz8ekO/wyaG
xOCuIWJ/un8VDWJRQpp3I6aq6BpQhPlwZJJSc4kXD3mXlWKvOac=
=YWPc
-----END PGP SIGNATURE-----

--cW+P/jduATWpL925--
