Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 221C93119CC
	for <lists+linux-usb@lfdr.de>; Sat,  6 Feb 2021 04:22:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbhBFDTx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Feb 2021 22:19:53 -0500
Received: from smtp.bonedaddy.net ([45.33.94.42]:53484 "EHLO
        smtp.bonedaddy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbhBFDNt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Feb 2021 22:13:49 -0500
Received: from [192.168.1.209] (unknown [49.190.168.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        (Authenticated sender: pabs3@bonedaddy.net)
        by smtp.bonedaddy.net (Postfix) with ESMTPSA id 8C542180043;
        Fri,  5 Feb 2021 18:35:21 -0500 (EST)
Authentication-Results: smtp.bonedaddy.net; dmarc=fail (p=none dis=none) header.from=bonedaddy.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bonedaddy.net;
        s=mail; t=1612568123;
        bh=xc2Zn8tRjJLUBwNsFpwpeeVZvez58jLSAdIESjdnecM=;
        h=Subject:From:To:Cc:In-Reply-To:References:Date;
        b=ftN9WfVgclc7dYJwUfZgQ7DdJ1WoADh5yBsBiGBVN93ON05jiO2KWwbSVaKzWv+tL
         tnwvPQ5y+wRgfcEtdes+3sQjw1t8VDgbBz5qxvDgyBLR4XCqN3QXc9xm1cgX3nAmmP
         EW3IAkPf8jMUCGIcQQfh027NTZrl8IgdYL8Kt+PLPv1zmQEM4XEgrzSkamkULRwhvh
         5lfxNOGCGzIv/pjbY5hP+epYK0PwBtXBwZ4JpRVATUJGTX+xc1GJFBdxs5T2EulE2x
         MfW1+tTtywtv6Fn+rJnq20152SY8iXDALS5su2J74IjxzO3hA9VYXjqvKAmnvIh3TQ
         B5mC6mWhSfbrQ==
Message-ID: <86c0f13b298c8584bc7070543637f424075e526f.camel@bonedaddy.net>
Subject: Re: proposal: move Linux userspace USB gadget projects to
 linux-usb GitHub organisation?
From:   Paul Wise <pabs3@bonedaddy.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Krzysztof Opasiak <k.opasiak@samsung.com>,
        Matt Porter <mporter@linaro.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Karol Lewandowski <k.lewandowsk@samsung.com>,
        linux-usb@vger.kernel.org
In-Reply-To: <YAhKAiz2U9KQWQPE@kroah.com>
References: <c38162833d1c8fede734e41eb5ce23cf393d6555.camel@bonedaddy.net>
         <YAhKAiz2U9KQWQPE@kroah.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-Zjynoq+tlv08fFY8HfVp"
Date:   Sat, 06 Feb 2021 07:35:00 +0800
MIME-Version: 1.0
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-Zjynoq+tlv08fFY8HfVp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-01-20 at 16:19 +0100, Greg Kroah-Hartman wrote:

> If you can get the "owners" of these repos to agree, than sure.

A couple of owners of these repos have already agreed.

If you would like me to do the transition, I'm @pabs3 on GitHub.

Do you think the Linux Foundation, Samsung, Collabora or another
company might be interested in investing in maintenance of the Linux
userspace USB gadget projects? If so I would be happy to be paid to do
some initial polish on the projects and to shepherd continued community
maintenance afterwards as well as package them for Debian and other
distributions. If not I'll have less time for that but might at least
bring the projects up to where they can be added to Debian.

--=20
bye,
pabs

https://bonedaddy.net/pabs3/

--=-Zjynoq+tlv08fFY8HfVp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYQsotVz8/kXqG1Y7MRa6Xp/6aaMFAmAd1iAACgkQMRa6Xp/6
aaNeFxAAqwcExv4Cq+cep6ruqSy8a56HHUeAb9WBA1j6CWz6GyMbF+OXxPeNXETP
zPNceJp528G6O2UpAKD57rFLNMGYX9I4yxposHHwbA54IzuLhqO11z7y1zfP5ZIT
xzVWc0BVAiQTA9RKzubISfo5OXo6J/AeStRu/UrzudlnqwRV0llq7SwrF8zfVwZh
QT7psdJGE4Gr4ZaJeNcv20o0tIjIiny9vy8tFl6zhoRvA6g4ZeRWdgsDKsExob0m
lFpQIvOmNsoqwvnDiw4PyGh9wsxU+W3FqIZps6mpbje8wer078WedpWU7MMk1na8
PCasWyAdNc7Rv8sZ0sBcsc305ZTU4KF6EkmV0OiYAZE184R4zd1Gxpuysykl/bGl
bbK+C9xYy8IHDx0PTP32REr0in96vf7z/uBsNGb0bNeb12Y8zp28NLbffTTY5q88
8vqGmF6bkwGz/mMfgQmm3nZMJ2psUa9yRDoqN1oXj8//hpH+WlPEmUPcK0FL+G5+
/ANKyMyt1BRNGVobHRM3Lpjjf7NUQto4yk4u7znIu5+cGmIdRTzD+ZEsDjcAT7n9
88q9rDM/+jDF2fafd62xYhhSaheGQQ6eLUPwnzG1vKCsQCloP5TuFTrwx1ExElVH
UalhUSQ8+4EoNIvY8Qi0Xi8MSoXGiOjKZFaUqjj17lR870NijnY=
=2haV
-----END PGP SIGNATURE-----

--=-Zjynoq+tlv08fFY8HfVp--

