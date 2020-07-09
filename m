Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD1662198BE
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jul 2020 08:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726064AbgGIGiT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jul 2020 02:38:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgGIGiS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jul 2020 02:38:18 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 675B3C061A0B
        for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2020 23:38:18 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id c11so508318lfh.8
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2020 23:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=0LgOGn7XIvePN8pMh//Gwx36HxA4NPtTap8ERgm6KsM=;
        b=qbmPj8om/ugomXxEgS6LP3bJf1Oci+7iDLfS96He8nJPaG7cs7XWGrxhlBGMrZkLs+
         mj7OBMsXX4lyYVNxiGDhmOmxh7uaS/7e6bnqeBs/HV3/Z+UfocJz8CPpABkb/O7bBNrC
         RyVjkUE8NnOsjSwM4pCURw6EUL/d1qTG4WdwzFjbaNhW2D2901cwrJ1qJYu4lqQE7pXS
         WsoSg757IYfcnEtviYM/zdmDmYiH61MJqU9zqUPVWKQkJffpZ/Ius53DqvDkMHz0ktOe
         hFKFRgPelZetFWzBb9mia0SliTcTvYABYKJVcBGzMn5ezr30wXD4V3zpPoXaNAiaUAp0
         8Ofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=0LgOGn7XIvePN8pMh//Gwx36HxA4NPtTap8ERgm6KsM=;
        b=K86lbqMMppkD3SkY5/JcJfSn0dFeh06OWVL8ouFmywTnnb0f0mTweZtQqUhx+4a1yg
         mU0agslQ+7LTuIOV30fTM2WiuD9brL2C5lWWBd/gP5LrULkIc+/uNhMKineQRZRqV2XO
         Gpkr/9gtHiQn35swjRYvFc47EYHSqVJ7LfUJ771EmNSxeOt9ZJJdtJyevki9ie5sTkZG
         Qz43KgdJGcWSXjq06a8Syejd5oJ0a2FQxjEF4eCPVSe9qK0sOVVnXhxiPrKDENSgdGZz
         Z9Ni4+Z/Nt+mmgJvbGjCB0SN82u08z5+xqG73DTTM01U6ITsXGT/WuDR6AyBvjHQ85g+
         LQWQ==
X-Gm-Message-State: AOAM530+yjSN104fc7TIjQENe4+lL0rDde9wC9jdP4/szQzF56k5v+0l
        v8KVbJhBvhVEfkX2LzWJ1AZH8+1L
X-Google-Smtp-Source: ABdhPJy4ojckA0wouoeZ3fP0heqwy3DzbVY6imYE1abGf5zJzuqzFHtWgDu/xnaODO1SOREmoaNc6A==
X-Received: by 2002:ac2:4889:: with SMTP id x9mr39082684lfc.162.1594276696591;
        Wed, 08 Jul 2020 23:38:16 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id a5sm609776lfh.15.2020.07.08.23.38.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jul 2020 23:38:15 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_uac2: fix AC Interface Header Descriptor wTotalLength
In-Reply-To: <20200703134903.5695-1-ruslan.bilovol@gmail.com>
References: <20200703134903.5695-1-ruslan.bilovol@gmail.com>
Date:   Thu, 09 Jul 2020 09:38:11 +0300
Message-ID: <87r1tl6vn0.fsf@kernel.org>
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

Ruslan Bilovol <ruslan.bilovol@gmail.com> writes:

> As per UAC2 spec (ch. 4.7.2), wTotalLength of AC Interface
> Header Descriptor "includes the combined length of this
> descriptor header and all Clock Source, Unit and Terminal
> descriptors."
>
> Thus add its size to its wTotalLength.
>
> Also after recent changes wTotalLength is calculated
> dynamically, update static definition of uac2_ac_header_descriptor
> accordingly
>
> Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>

Missing a Fixes tag here.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8Gu1MACgkQzL64meEa
mQYlbQ/+PPdxc372Nc4Q6toqRSfwY+PY3IZ1rk3KNIEPg4bLZyy72lJdxk6QbDy5
ex2qbEpu6Mlxi8kIcKdawJNrP8Nhs087imU6TJpkemMimTuwP6RYLbhhfyIt9ywq
+z8VoU4lnr+TJW2R8qAgyN+ZY/MBHt627Q3k7cH/zjVUW1cu/iOWkBSrXrbGv7Ay
FFPzay2eWuy4SjJD9TL/PU7a3TAkRnoDb5EUWCnfMm0uTiLI8e1aLGN4Mr6ojPSe
EtpAMEK3HXIMGQ733ZjaUsV8/FaZEJgMA41RYUCsCo4GthYmCEqSiHqQLhKq8H9S
G+8SfI1uAPmXIIKfn2lRMY6jW+YMIMgTo3lNiYtnXWsNc2skM3sS2O5iUulG+fFz
LaCDJE9gOAbIt7vQa4LwvYjnndo6+qBniShvauallaPQ/lq1fWzroQ3p7CzJkovC
/LieNTfh/7dVORAxWfINRJYaK8tLgwkYkeJ90SQPEcEOqucILSGgl9PE7L4dGFlw
S/Tntv0mXEm01v1LguAyB/7MrQIIxLBzIMN4r93RWv26xsXcrT4f+sujnoynei8k
ag62bkAf92TSyBLJcmU1KzE2YOYRBcm8QnMKjsKp1hpt10HzLospxLDOPiC28Seg
tjJf1jo+6Je35K2r9UMKlzgwDuR9IC39RAVGFDhiS/tEHA5m91s=
=DgtJ
-----END PGP SIGNATURE-----
--=-=-=--
