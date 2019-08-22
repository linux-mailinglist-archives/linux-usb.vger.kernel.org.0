Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 974DE98EAE
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2019 11:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732913AbfHVJEz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Aug 2019 05:04:55 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53]:37368 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732071AbfHVJEz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Aug 2019 05:04:55 -0400
Received: by mail-wm1-f53.google.com with SMTP id d16so4938854wme.2;
        Thu, 22 Aug 2019 02:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NnJbFQaYPTPxuDad0em8BVEVOOFuU1SABXnC9tM8iPs=;
        b=ogIqq1PGoMuLjcFxV3aTXnewEGR31pwUSoxDwHYwzxvmTTN7JzlLTQMSAcN+Hsv/SC
         RoyHHSx/luxxUxlb9jQmfvuEHhCjLSemalZvXIj0GnonwzOXS+wew7j66NA5PPqyA1gI
         gYVQd2qcHBZUvOdNt0NsbjlA+wjfF+Nr/luNcaG2/Yia7IdcdHtZN8KDU87Su8nJAkcs
         yo/pMAuro/c4fDYkEAQIvjItyIvDlFAFXcoy0K2yRRklyLrg5TeYxfLXR90EsEziDAoB
         2quBq0M5YZbPDnvuIIFzTYirbEkr/haMlD77SUqM5bF7FfR4cRxP8fsfWprizdEVyz67
         2Mkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NnJbFQaYPTPxuDad0em8BVEVOOFuU1SABXnC9tM8iPs=;
        b=Qkxh8ORqKbHeVgwNRRosTYiDHe19cCG1TPX5Q7MfSkFQljrXpkp2RPZ06fjeKOqXN9
         SLQFBymhWPg2NBs50orXoS5Qdhl8gjeeOzRvy8FjxFbs1qzfg2BYqwoWXL7pEs0PErhk
         WrGyOyEeILZ3yGTT5PTe49Fuisn1ukP00BS5TLI2iaCmd2YnkjrpLJIEhir84WnqEHrK
         aJDOeQHYTeQKhugFMcEkLfdztnIHeCk5qGqMaaUFkLn1YWD0b28HsKkOFdyYEqYpiBf6
         kILeUe4aihxziRfU9B8ZorDtWd5/Jm8cAuyGCFd/GLVF79ik/PgKzyCAh4Yt6EOrFlI/
         3Z0Q==
X-Gm-Message-State: APjAAAU2t4pJiiGjR1YwYFkFBzbvLRzaf+GupTjj+iG288+eCR6+s8EW
        Mz0T8+X++nmpgIrzfdLLuaQ=
X-Google-Smtp-Source: APXvYqx7GBwZmj7yZnSMjVc5xDpzfZ1DB5DZUVp2db1hX9BZF69+CpLZLkw9t9v/ba97wRcqLRApfw==
X-Received: by 2002:a1c:4b15:: with SMTP id y21mr5020536wma.53.1566464693241;
        Thu, 22 Aug 2019 02:04:53 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id b136sm7170619wme.18.2019.08.22.02.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 02:04:51 -0700 (PDT)
Date:   Thu, 22 Aug 2019 11:04:49 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [Patch V6 4/8] dt-bindings: usb: Add NVIDIA Tegra XUSB device
 mode controller binding
Message-ID: <20190822090449.GB23873@ulmo>
References: <1565257046-9890-1-git-send-email-nkristam@nvidia.com>
 <1565257046-9890-5-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Content-Disposition: inline
In-Reply-To: <1565257046-9890-5-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 03:07:22PM +0530, Nagarjuna Kristam wrote:
> Add device-tree binding documentation for the XUSB device mode controller
> present on Tegra210 SoC. This controller supports the USB 3.0
> specification.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> Reviewed-by: JC Kuo <jckuo@nvidia.com>
> ---
>  .../devicetree/bindings/usb/nvidia,tegra-xudc.txt  | 110 +++++++++++++++=
++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xu=
dc.txt

Acked-by: Thierry Reding <treding@nvidia.com>

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1eWrEACgkQ3SOs138+
s6HCgA/+P0KOdIRGToKGv75qZZTKyiLgAYXyeU11HjMEsa+B3Vjb9hXDgN784tvH
3mvdR1fPfRR4KishaQv775hATmz/ah5Qts5UJ78syybB25jrS/OB9BHqp3Ei5be6
CW13xC2WhpInCW/WCnjE0c+xdDUHhrj6RaucQ7lavn+AvQnVWCsOoEgW/O8Xjdyr
4A3sNVC1cbJ+Ir6t3T9kV9vnynDEgBI84fAfBf2jKpW2jlXZ061jLxwuQ8iIzgJp
SOMldCNIzV4b6RW+qb/L9y0eoaG9RMYukgj9/SHFPgwmTMd60gY950xRDU/9M4np
4/A9L0auS3nVNM6SwxmqE7pqgFi1PPplpttLb885MXJ9a1vjIXBaDfjDX68pe93b
czpswuHdYKyVWQJmn7Qnv+X1ztb+yRZchCLHXNFeDZDFUAIOVLWas8Tk+5rmX7kR
1ERvarK32Fg+/PoTLOQ88Dgmq6qmBBmvdZsxF8t1aXzdBOTRF+5F9a07LBKe9sEh
w4sQ0VRAVbMbZjB5ecwZsdYZQYw4BI0tZKJn8ITGeT768kZGTcukBO0CdPy4ZtIs
R6vrMZ95NTqH2c+r31KkTEhIxr5yZvtuhpJmezzuc+SwXUj37KgUtRuxmSQjpu9j
LIHLVXqfSWPFPABLKRN2ulHN7wm9FKDxEt2lIKOStVu13E6XMXg=
=8i7g
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--
