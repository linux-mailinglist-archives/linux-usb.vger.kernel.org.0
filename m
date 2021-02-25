Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4BE1325073
	for <lists+linux-usb@lfdr.de>; Thu, 25 Feb 2021 14:29:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbhBYN2A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Feb 2021 08:28:00 -0500
Received: from smtp.bonedaddy.net ([45.33.94.42]:36568 "EHLO
        smtp.bonedaddy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232549AbhBYNZn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Feb 2021 08:25:43 -0500
Received: from [192.168.1.209] (unknown [49.190.168.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pabs3@bonedaddy.net)
        by smtp.bonedaddy.net (Postfix) with ESMTPSA id AF43B180031;
        Thu, 25 Feb 2021 08:25:08 -0500 (EST)
Authentication-Results: smtp.bonedaddy.net; dmarc=fail (p=none dis=none) header.from=bonedaddy.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bonedaddy.net;
        s=mail; t=1614259510;
        bh=l9ox4oomw7AvSHRWxyOMM+zog34/obe+hrjTxQ/6v+Q=;
        h=Subject:From:To:Cc:In-Reply-To:References:Date;
        b=B8EvCP5aauH/9Z8UT5Lkr0+S5J5YiLKocPcmZAiP6hIbNqY+H+P2FLt/uFZocIDbF
         LB/qfLXOAdZvFw56+IjsBEPeloptNxq0S2HkbQ73EE7tDw8RPmRdqWt1IgGFf5WeGQ
         u5usEV8t9MXx9/Wp1De4pmgzNcVuEWGeOp0QQXRJXdRKvxb2j7gBhzSV5ckxbGzF8f
         N+O1JRLqK7QsNFAFh1q2RpZeyyqIk/VVJ0kobMAyjliPEelrAPEtP8bDCVlE8ySufQ
         vOeGXG9CvkY2e0ELpmny10sSgnYt/nLgRd0yixQV9CdtUEzyc2MesJFGkjp5zjayHl
         XWMIMia3hXkcg==
Message-ID: <e6e918148b817e88efff77d3366cde057924fb45.camel@bonedaddy.net>
Subject: Re: proposal: move Linux userspace USB gadget projects to
 linux-usb GitHub organisation?
From:   Paul Wise <pabs3@bonedaddy.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matt Porter <mporter@kernel.crashing.org>
Cc:     Krzysztof Opasiak <k.opasiak@samsung.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Karol Lewandowski <k.lewandowsk@samsung.com>,
        linux-usb@vger.kernel.org
In-Reply-To: <8f31baea8cad893f416fac972a3a64922c97bcc5.camel@bonedaddy.net>
References: <c38162833d1c8fede734e41eb5ce23cf393d6555.camel@bonedaddy.net>
         <YAhKAiz2U9KQWQPE@kroah.com>
         <86c0f13b298c8584bc7070543637f424075e526f.camel@bonedaddy.net>
         <YB6WKs/6QMWJSS2t@kroah.com>
         <ffd238f1787b8e23f974a220e94aa39eb62b2e60.camel@bonedaddy.net>
         <8f31baea8cad893f416fac972a3a64922c97bcc5.camel@bonedaddy.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-lWNG8N82Go5Reint21xU"
Date:   Thu, 25 Feb 2021 21:24:45 +0800
MIME-Version: 1.0
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-lWNG8N82Go5Reint21xU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2021-02-14 at 10:17 +0800, Paul Wise wrote:

> Since the linux-usb GitHub organisation isn't yet available for
> collaborative maintenance of Linux userspace USB gadget projects on
> GitHub, we will create a linux-usb-gadgets GitHub organisation and can
> move gadget projects to the linux-usb org when it becomes available.

I have now created the linux-usb-gadgets GitHub organisation and
invited everyone who owns or committed to one of the relevant GitHub
repositories or otherwise might be interested in participating. If you
are one of the repository owners, please transfer it to the new org. If
there is anyone else interested in joining the org, please let us know.

https://github.com/linux-usb-gadgets

--=20
bye,
pabs

https://bonedaddy.net/pabs3/

--=-lWNG8N82Go5Reint21xU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYQsotVz8/kXqG1Y7MRa6Xp/6aaMFAmA3pRkACgkQMRa6Xp/6
aaOJKA//ck40uhPo1tdBrdoBKWcMC6yoX6cSA47+Eqcos3JgFZTk78nBTbBWupWm
jj+tEoMycPW+L18vdWZpxNABbGisap2J76R351x2y5ll337UPLCkYtacN5TwQY//
P0YzrKxWErugM3saBXJ6cegeP7VBETPEvErKxbYUArdaSCcb/JAmNhy4CCLc5yU7
rq/HNh+s0mEbLkirJzb2f7fn/fFVMN/neox/+QMr1qTczjSqnBkA7HQN/KxRDuZx
NqPBMwkQuvdkKOrwBEYQLQ7Pu3xGpSdYNDDoUe8s99KB27x5t89zTvMaTzULzcdA
9qdhe/lpnkjpjkX7gQO1GZoW7NWbAqOoKk74IJ2WUx2xiZtqRNjlDGyNuQXkwPXj
m2rxxpNr8h7qntM78leoqsVqI9V7YKx44Jt8hD5jsSGteCjP5sqNmeOxf7Zmbya/
3/3gyateiProOmk8CsoZsdTwSXqIMp6CiVA2bMoj/XTrSTvIugJ6Gvwacuf9aoSQ
QxOphzIcYEgaNBFHFR3wXaTGivr+coxeqiKt1zHt+xBACQTp6NjNBBfLAXblQLq4
r8nrT2LQiMhtKRmoh+QNN+vFZzJ4UulbQMDqVPalbSnIrYEGh7TG6YzUWpbCo1RK
C4AtucmXRB2heNl71FczaYtCb2jqcfG26VH2tQXPfe2nMhOQz4c=
=a4qB
-----END PGP SIGNATURE-----

--=-lWNG8N82Go5Reint21xU--

