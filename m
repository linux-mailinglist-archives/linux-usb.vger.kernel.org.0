Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9269C154B2B
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2020 19:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbgBFScV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Feb 2020 13:32:21 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33692 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727358AbgBFScV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Feb 2020 13:32:21 -0500
Received: by mail-lf1-f66.google.com with SMTP id n25so4832727lfl.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Feb 2020 10:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=RwKT4BnMT40bXj8AWfdIporV7xfVJGRMuPctPQAkO0U=;
        b=MXNy/+fyDiL8Kku1avhMadNrzJosiFvhOxI3CMMapnUv/Y1G+iewO4SxAt3kNysMSq
         VE39vWsGuYmEuUe5gp7GN7lrzEOIfYHWgVGvxd+SSdNP3P3jfv8hewAo96GV3AAEvTvN
         Hl9DGieqlOiGAG+JohxCuUnx/J73dW3xZWAsu8Cl1LtQyltKRT8VuS7Z7zsmHAFAJ+Xc
         LBCq4EeF2xzKuGjDQFGOK2XSCLKGJOaQcrMPwCboMAfy++0NKzP7kwUaQVJxEYx6breT
         1st15cmkvIg4e0j7JkahFuuPJkdhUn6SBgeAR1Dh+GBjFTuabR3vFPX0noaKN9+ZYsCf
         wp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=RwKT4BnMT40bXj8AWfdIporV7xfVJGRMuPctPQAkO0U=;
        b=U/H0+WGBQV62kqRouamj8ZhsM0Y6P4NNR8SugFU61LeoXsIIrYnyWRnLf8jW0EWr2X
         fIPqXUP+gyaAk4+/vOgtT1FqLIlILBN6CYyNai2hxve+oIG31Rv7FmlDoVGp7aIVFYYL
         r3WSEZ7xIEjSaEdOQMtIkbq1JLoJoAPaqaf9wQaFkBwcFbW3S1uvikIhjeJ4jhZf1RYQ
         +/TKmoOn1ddLVKJ5zkUPRLPxk2vX4uQPAcffyqK9mwsItqvcBBp7kFqSWu7Edr+52vrY
         TvTf5HQADq4L8oGvRAbP3MDs4hioDnkNs0ip/AhvRLnyQu0pvNFNJiBa1CGGssIukJc8
         zb8g==
X-Gm-Message-State: APjAAAUiovTUI38RNbUfi+nzOS/Wc2Qrrdv6PNcgoxJH2zowkM3JYYwy
        dudj5JYm3J5DUvFTq05q1Fg1uNNfJwc=
X-Google-Smtp-Source: APXvYqwGMrA/lEQiBScCleGP8ifbdZhQQFVLTJa4dO+iwCOaIzoyQUCeIdt+VcVu8iUR8VvpCWD99w==
X-Received: by 2002:ac2:597b:: with SMTP id h27mr2538274lfp.12.1581013938193;
        Thu, 06 Feb 2020 10:32:18 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id 135sm95985lfb.28.2020.02.06.10.32.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 10:32:17 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     bugzilla-daemon@bugzilla.kernel.org, linux-usb@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [Bug 206435] dwc3 dwc3.3.auto: no usb2 phy configured
In-Reply-To: <bug-206435-208809-nsmttjrqU7@https.bugzilla.kernel.org/>
References: <bug-206435-208809@https.bugzilla.kernel.org/> <bug-206435-208809-nsmttjrqU7@https.bugzilla.kernel.org/>
Date:   Thu, 06 Feb 2020 20:32:13 +0200
Message-ID: <87d0ar5zyq.fsf@kernel.org>
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
> --- Comment #3 from youling257@gmail.com ---
> Revert 987351e1ea7772cf2f0795e917fb33b2e282e1c1 phy: core: Add consumer d=
evice
> link support, dwc3 work for my z3735f device.
>
> android_x86:/ $ su
> android_x86:/ # dmesg | grep dwc
> [    9.724606] dwc3 dwc3.3.auto: changing max_speed on rev 5533210a
> [   47.488501] udc dwc3.3.auto: registering UDC driver [g1]

reverting that commit makes dwc3 work? Then you don't have a bug on
dwc3. You have a regression caused by another commit.

Alexandre, any idea what's going on?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl48W60ACgkQzL64meEa
mQbBbxAAm6zjZqt3ZRqfkpw1Fxs9BPdzvoD5TjHMJ2xJ7RFiGXl18cSf1FEbQks8
D78DjqlbfTYg4hhTUlMD0K29mscSzTZnLF50nAbDVj+LAil82MEforYoFjhXfSnJ
rqEeoXqkKC+l3E11wM8cQyzcJvAewbA3q4BwO6f3DRO66h/3adutINnFVA25DMXQ
Kj1AfQFLHSgxGRJeMimmwZwYDW+329i2rhD+OKNmSa0VtlWeULgqI9UrH/9US7jB
7Evf+/f916LycYyXJWh0SIaOj4S5riZI++KSd+cpUshhucLgCeNWmROBc/regJXX
2DfQDEDgo6eWxLY2hTa//DkgUj/1+MAcTVnxf5YHovg0MlUMvoUlKdspU2blbLti
2+2fL5fPD7x3FstLdJUZvUGvU4vVm8GL9NMDSrq7mINFXhv1DUg18ElZ8iN7UtWC
ETd4cDDFBaAOCXikglJN0y8hIaLGPU7Dh5aDtCnrFK1KyRXeCa7IzE+bHnI9eXoL
9PdRHue2Kt8yQVfq6FU8pAWTwZOyz7NH9glD9zGGrXFjfERZ3ltlbwhidmHJROy7
PZW6SWBQi+BHr722auWjlJXjIfb5LyG7C2fahSaKfCEWr1Fx+5DMwDmGMcPgLPXz
SRi+GKnX6kgGQkIsv57IGXi/mns0CkGlYTukg2l6q9OtH7MPEDw=
=3qU6
-----END PGP SIGNATURE-----
--=-=-=--
