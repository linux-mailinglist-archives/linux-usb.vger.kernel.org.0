Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E09A998EA2
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2019 11:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732888AbfHVJEL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Aug 2019 05:04:11 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43]:37258 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbfHVJEL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Aug 2019 05:04:11 -0400
Received: by mail-wm1-f43.google.com with SMTP id d16so4936455wme.2;
        Thu, 22 Aug 2019 02:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dA3XSoMwrPMI58Q8a+wkerU/2zSaJdVuyPcETRQOfjQ=;
        b=ZiHwmnB3149BndQOngAo91os5FUQN3KLMgdM+6ShFFRlg6CbQk31VLo1Wyn3TpxEO1
         UVubY6tjKeYO6ux60ulQrRv7DXkC0xWJ94V2xpWjIV2lKhzmF2jJrIWEKGEaHDcdD/z2
         MPspvEzHnOKE/6zFFB6XUhXf/qVmpn+9wusHBjyAkVmRFw4ITaee4disQT9Ryvm41nv/
         LYlW5ynT7L9XKaCsFHWHOIUNG9aZ4Js5BEmqbiL1Wg+wAgQJt9rEIN2irEbGzpAaEIJB
         xrXGcBobxefRYwCFvoArka/ubnCY2PMhuUmReZsUfuLzTxw/4EPmqKinRf1p/G8YPl2P
         CFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dA3XSoMwrPMI58Q8a+wkerU/2zSaJdVuyPcETRQOfjQ=;
        b=OGS6UG9/VpsqxvAufmiX+VGN/BRuk4+IzJvw7vRveyBHurQ8IDNJ1AqyL7GkaNXeP0
         9HF+0DN3WUx6uwNqwOhI29eIMNHxNqPWXfwmrc/mH+pgmC+FKYI2Oz7gG5rLiObRdSVL
         u/IaDg31juAYALJ9ZJzb8E2oy6muWaF4QqnpDKV9RdrtPPB/jxJz9oSigfcFb6+mMPKU
         XfBpzgwbWNnBLk2oqk+BQG8zhYA0meXG+riK+fGozrKGi2JEQL8xbpI39GrtQ4aMMjLd
         IhvUasPLz9Ztg489J27Wyvw/clXCGOQHRDZiTvhUDz6Db7PbHeS3jNuaR+HgrXpdYC6w
         CYSQ==
X-Gm-Message-State: APjAAAWtqMY95zgYQ7Ar1fmQHFUdpEiwbWwqKvo3zz3rXumUtm+w1mRh
        MFi76jq9rJOpRo3inFWSSUc=
X-Google-Smtp-Source: APXvYqyM1JgKMZ+vZKE2OMqsVkFJVFHCE5zfpkgNBjuL/GR+titmH87d584tGaTOFAwQoyObtshHcg==
X-Received: by 2002:a7b:c0d4:: with SMTP id s20mr4701246wmh.122.1566464648768;
        Thu, 22 Aug 2019 02:04:08 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id i5sm26916945wrn.48.2019.08.22.02.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 02:04:07 -0700 (PDT)
Date:   Thu, 22 Aug 2019 11:04:05 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [Patch V6 3/8] phy: tegra: xusb: Add vbus override support on
 Tegra210
Message-ID: <20190822090405.GA23873@ulmo>
References: <1565257046-9890-1-git-send-email-nkristam@nvidia.com>
 <1565257046-9890-4-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <1565257046-9890-4-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 03:07:21PM +0530, Nagarjuna Kristam wrote:
> Tegra XUSB device control driver needs to control vbus override
> during its operations, add API for the support.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  drivers/phy/tegra/xusb-tegra210.c | 57 +++++++++++++++++++++++++++++++++=
++++++
>  drivers/phy/tegra/xusb.c          | 22 +++++++++++++++
>  drivers/phy/tegra/xusb.h          |  2 ++
>  include/linux/phy/tegra/xusb.h    |  4 ++-
>  4 files changed, 84 insertions(+), 1 deletion(-)

Looks good to me now:

Acked-by: Thierry Reding <treding@nvidia.com>

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1eWmsACgkQ3SOs138+
s6GMXA//Skz6gnJmtE8Ur8PyRUzhgnGTgTmOxKB2Eqph9x640DbHwX3XjzU0DbR7
1gpiy1bwIoeqsfelBbpAXOV6Tuvj6xv83MRJcrTvp8yeg870jhVvF4XuUVs54d7X
ptM/hOpLapZg0AQ9YwKN77j7F1/8JzXymtpAHfUyB78CCM5RjXg3tQXxBjGGQ+z1
niHWBdGHp9xD7yBU/AWrgu4SKPuN1yQrpYImDq2bkY8aAjf2m/yD8gsEPTzrLi21
K4/KwUnrabUs5hFrNx0k+mXQhazvmWo1g/+/6akL5Rk1Weaoll9ArW0UKiOluqDq
JsVVnv0+KUHZamAET9u9zQwKPRIHcC+6q0GvGWp43Ffbr+3zuxbAPT3hxWOfxD9P
c3yHB6FqchaCyDDH3CufuxB6c7yemd95JpSFvMtafFn3szFzt89RYLKLWo6divwD
CrOPfPDC2O8rj/ZYAy/mEYMw7qaFxpDBdkRAYyj95tZmAFBKcbdc9/v1XD4XUYjN
FHSthiL9Q68WBwb3fHh6NMfr/ewCuRKI6bRWP84S3Mwo/hEwDhlmOwrs/23bhStJ
Ll7fhBhV6Ur/FpPRmyhcp+IyxwAJiQfz4zmG0ekcNjthsl/BAnw/j/U74dhpO1D/
kMtQLvtCzWB/NAUMfWD+PVsV2e72IoQ238cEpo6HotLdUeuAvM4=
=IEah
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
