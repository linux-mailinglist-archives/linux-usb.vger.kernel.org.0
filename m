Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99F70153EB7
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2020 07:25:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbgBFGZF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Feb 2020 01:25:05 -0500
Received: from mail-lf1-f45.google.com ([209.85.167.45]:33119 "EHLO
        mail-lf1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727787AbgBFGZF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Feb 2020 01:25:05 -0500
Received: by mail-lf1-f45.google.com with SMTP id n25so3261963lfl.0
        for <linux-usb@vger.kernel.org>; Wed, 05 Feb 2020 22:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=blB8K+p+8GyEDz5nzSM2nZ8eCDlwgbIKAi6w3tM3vPk=;
        b=KMO8m7BzGI4stMzoTOpx0JuSj5lVEkmRyXcXsAndjdXjjCI8qQMiRHznVwkt6f0OwE
         Wel4mZE+YjwFn/K4+LrzQQaY6ioz032Qngivbfw07ZdQNJAxwchPx1iyW32DgCNYrDnA
         V9z32e2IaAnxQ/ulM90TGy8ba+u/R5qe05Q5d6Rz2/KCajDPpOMcMc4M46AuzHl9v5KY
         DvGG6ZoDyGbfFmxeMcyX2UIZJasPhVik3VPQsyNvfBn960v0P/bTlScnr7QoGW0z9wG3
         nHq2hwinzS6EUxIdi1mCgrwCQNGhjgQBfz53mA5zK6bk+CPPOXTmPuwtBAZiP+SMz//Z
         X9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=blB8K+p+8GyEDz5nzSM2nZ8eCDlwgbIKAi6w3tM3vPk=;
        b=TNNhQ8y8Y/6/u7KarHANUnM6DPXqX7zj33wjWafBKRwJehw7C6zo1lqGS9pz3cjV1C
         9wMB6vvAELKN7jypuRHZzFF2r2UGX2r4NwYiCLi2ZstRydy9YGE1RK+AGBZeAEuYVVzO
         q/NtsuzGqJA2f/hQlgPdQXHAJ58QywOIzb8gnItDFZ9ZhYXKdU1BkgAFCJNo1aodIPoj
         ff53UyuG+Z566Aq1S+jfdT4fNp/f1WftSAquqoc2D+x5U3MG9oWleknpM6ZHeTiNz6m8
         CwK15+ErwYOU0fCGRP+MuIgj7LNoQfWVNrqzEFupWEJP74JFUguBQVmlMbLUDkeLHic+
         yzcA==
X-Gm-Message-State: APjAAAXboJNL9LVNwXs0Z/inMXDjEqGHqQhK1mE0c3QWrNp+FRC5A3V6
        oGoq7tnRSELCyJ8IC6niE9oboLb+Fvg=
X-Google-Smtp-Source: APXvYqxA6hyK4DeOtMkYVvNAO19BBH4bAcy481aegpDYm1bVmzLpzAVNBX1FuKxW7aj+B5IiyYyUwA==
X-Received: by 2002:a19:4a92:: with SMTP id x140mr909994lfa.29.1580970302966;
        Wed, 05 Feb 2020 22:25:02 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id i19sm721396lfj.17.2020.02.05.22.25.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 22:25:02 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     bugzilla-daemon@bugzilla.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [Bug 206435] dwc3 dwc3.3.auto: no usb2 phy configured
In-Reply-To: <bug-206435-208809-u32ma0j2gb@https.bugzilla.kernel.org/>
References: <bug-206435-208809@https.bugzilla.kernel.org/> <bug-206435-208809-u32ma0j2gb@https.bugzilla.kernel.org/>
Date:   Thu, 06 Feb 2020 08:24:56 +0200
Message-ID: <87imkk5j2f.fsf@kernel.org>
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


Hi,

bugzilla-daemon@bugzilla.kernel.org writes:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D206435
>
> --- Comment #1 from youling257@gmail.com ---
> kernel 5.6 coming soon, test the master branch, dwc3 not work on my z3735=
f,
> work on z8350.

What is z3735f and z8350? Are these platforms supported upstream? Who
maintains those platforms?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl47sTgACgkQzL64meEa
mQbYwQ/8C2VWlusxAPufXfR2rP7KNlM7mTVvn+UfkAChVRDOW0bZysoMzBixgyM4
TtbzatjdE8EqN9ZnqXKx/gVh6fOEMY6/QrZ04D+mpWHhQxDxo9FN8x4bm2wFPuWr
1uG/VD1AZme9WbhEFao1/DypizKSuBXNFPqR7L3+7FdAZkv4c9NRv7l4ChVCfvuD
iFjU+wrPos+VJlPgT3ttqkXmMdY6ajZyPbOeG+GS6JYV7SXYo/ghkApeequ6h+QW
zDES/dgp+FtmM4oRrZNF8ovP5XiOKuC9tb1wu5fKAcOrkEWhWCLbBE+AOXTliUvM
WDCohunULIYPuImsjm1O8erijCovOgDK4lxCpbcuFUZ2Fp4/3l/z/D6F55amglfD
bzGp4SVRC//xrc/Z6uchPzX4zk3cgf3okIjCoI6lojGsOzYEep17he0AR3wUv0Ht
/eLvaq8mgHK/6ycNvisM9nFk1VLX3cSi7v74NHolibQQdtGFrUlTq9d6zwiD26Nx
UhKmeQaptrYuox4+axUpoM8rZYZlInRV5CncOh33KBLPE5yAuF+cZMaT3bJBMtxH
bdo0TpsJSufSfN7SXYgg7/jniwNqPfn5AtpqpHHbppKfQgooS8RyvQKSJwnQpXo6
ryjXKZqL5JLOGe4D6TcGpWJRlqV/GeiLOltQ8qYQLysXXG7981E=
=yTwQ
-----END PGP SIGNATURE-----
--=-=-=--
