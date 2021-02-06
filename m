Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1EC31207D
	for <lists+linux-usb@lfdr.de>; Sun,  7 Feb 2021 00:40:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbhBFXaC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Feb 2021 18:30:02 -0500
Received: from smtp.bonedaddy.net ([45.33.94.42]:53982 "EHLO
        smtp.bonedaddy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhBFXaB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 Feb 2021 18:30:01 -0500
Received: from [192.168.1.209] (unknown [49.190.168.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pabs3@bonedaddy.net)
        by smtp.bonedaddy.net (Postfix) with ESMTPSA id 02DFD180031;
        Sat,  6 Feb 2021 18:29:25 -0500 (EST)
Authentication-Results: smtp.bonedaddy.net; dmarc=fail (p=none dis=none) header.from=bonedaddy.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bonedaddy.net;
        s=mail; t=1612654168;
        bh=U1KviHR4kz5KFrf2nfsUnLEBwaR8CwmeytPIH989XXg=;
        h=Subject:From:To:Cc:In-Reply-To:References:Date;
        b=qVjijkOKiHSOBEAh0LLK/k+2BexO/RYVZBIbN5ujMJxEx9tSOiEVEJ0xWAA+xwi0X
         vwrvQ9bO3+OuFR2/Gw1zeFx98q96VyRMU2cJuE3r18PbQxwwF11iQlWlbkzS4Uw0L/
         PrwWX867LY6bYSsJQKAMFWEYYIbva/+D/Qby6TaZ9mXfA6mUBVK1rS2LwF/uF1iIdz
         rZTJdY6zeAEDQhvaXbUnVW0QQ4s+oYgvb3+/dNlYVKTLafgAu9mHoIDz23dZa+d/8G
         tyrsM1YxenbJlrIio2T31BEhdewF3RyXttrSDQc8SJv39eYCJAg0FyCtPnzni+TjBM
         hEoYwBeOGCumQ==
Message-ID: <ffd238f1787b8e23f974a220e94aa39eb62b2e60.camel@bonedaddy.net>
Subject: Re: proposal: move Linux userspace USB gadget projects to
 linux-usb GitHub organisation?
From:   Paul Wise <pabs3@bonedaddy.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Krzysztof Opasiak <k.opasiak@samsung.com>,
        Matt Porter <mporter@linaro.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Karol Lewandowski <k.lewandowsk@samsung.com>,
        linux-usb@vger.kernel.org
In-Reply-To: <YB6WKs/6QMWJSS2t@kroah.com>
References: <c38162833d1c8fede734e41eb5ce23cf393d6555.camel@bonedaddy.net>
         <YAhKAiz2U9KQWQPE@kroah.com>
         <86c0f13b298c8584bc7070543637f424075e526f.camel@bonedaddy.net>
         <YB6WKs/6QMWJSS2t@kroah.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-2PbvljVfGWMGkrIGiwPw"
Date:   Sun, 07 Feb 2021 07:28:39 +0800
MIME-Version: 1.0
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-2PbvljVfGWMGkrIGiwPw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2021-02-06 at 14:14 +0100, Greg Kroah-Hartman wrote:

> I still don't see the benefit here, what is this going to change?

All the standard benefits of the GitHub organisations feature and
collaborative maintenance in general; a single location for related
projects, a stable location for projects that doesn't change as people
come and go, a single location for patches to go rather than a
collection of different forks, an easy way to continue maintenance when
people move on, not losing the issue and pull request database every
time there is a new fork, not having to change project name after forks
(see libusbg vs libusbgx), a focal point that leads to more usage and
code review as more people get involved.=20

> If Debian hasn't already packaged up any of these, that's a huge
> indication that no one actually uses them :)

I assume Android have their own thing but Samsung use them in Tizen,
Collabora use them and have a blog series on them. They haven't spread
outside of that due to poor marketing, every other situation seems to
use fiddly, manual and non-dynamic poking of files in configfs.

https://www.collabora.com/news-and-blog/search-results.html?search=3Dgadget=
&id=3D655&simplesearch_offset=3D0

> What projects are not in Debian already that somehow need to be
> there?

All the Linux USB gadget stuff is missing from most distributions; the
core projects libusbg/libusbgx, gt, gadgetd and individual gadgets such
as cmtp-responder, ptp-gadget etc.

With non-Android Linux based phones (Pinephone & Librem) starting to
get a bit of traction, packaging the core + gadgets is needed.

--=20
bye,
pabs

https://bonedaddy.net/pabs3/

--=-2PbvljVfGWMGkrIGiwPw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYQsotVz8/kXqG1Y7MRa6Xp/6aaMFAmAfJiQACgkQMRa6Xp/6
aaMfAxAAjU88K7luciBYg6Gyb+MXfGHtFppcnWNoQFQi57IgPf1E56zK8OssVTCw
YAACMS565XCOGdxpEAKQdUzlgIWvGsXxbvSaGThcku8EhCRNQcrmEhB3jye09tKb
2doUpwKBOjJrRAbMM+k+KuTBTg4Z1W6JarTC3Mw+Nmj/jFsfM7o3WwzVKFBSqQ2r
IjMwM4f5PguE6QWgYt54jks6WsYy41Vd6efvslw4XeCY4BnXoBulLuYiV5GGjkP5
wD28V7YngR3winBRZMlXEfr4SkIyNQmdu1RC+RtiGEMzlfMlI89YKO2uAYx1Vzjm
bz78ul9K9GEzMM0xYgd77JMwHB6Tmo4Y9qZDAhWG1be5VYisk/ew5MGKD6aUYi9M
8MfODBAUIE2oAfbBgY53n/7rjhEU4orT+CEVfQb6v/jE3c//qTaONdv+rioBIqVZ
aoRxM4+LaXSDHfkOLOdiOm67dH2XUkUZKs+sk/06MbfQnR+tjC7Re+qUJvYaDCeh
GeGo9H4c686fk+sWCYEI28luwTFwvxlJW4MUJ4SbuNdrgPo9He2ayXJNVn3d4fNE
irLhMQahq7NOFQz+e+iued+E3bifwGFxrNFJtHrriaNiurbU8mZ3nCbqTirwEGam
ZaxcmfZpJboqD0rpgy4by4itfGLg7KFch0F81ep+w4ubGeGuG2g=
=FnXP
-----END PGP SIGNATURE-----

--=-2PbvljVfGWMGkrIGiwPw--

