Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E72A1D498A
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 11:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgEOJ3U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 05:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727803AbgEOJ3T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 May 2020 05:29:19 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 479D2C061A0C
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2020 02:29:17 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id l19so1470049lje.10
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2020 02:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=+L6a1F3oEbjuavYg8O+zs9qUWPJF7otzX4QXDgm+kG4=;
        b=aEwZAK9nvqoz5mkFWpeMzThPWAtm752aecwQUSY8YrxQEFyFYslVz2AlEq98D3iYlu
         2GgkoGgPbtclrjGxy0Am5zD/s/PEBiQbQzih46OdgzgnytpITkGkLbjrwlMK2qfq01eq
         NAiN90EJpHQnK/qJBK9CbgSLyJhzFitMmtf8sKwdiTtzrJBg8BH/EqT03PbH1bPIHrPW
         TAXo/DIMuevXK1BHeGg0McGF+bk4bJfMQ4YHPsVznAc2YQk+qWfZa3QOH1ZQH7NbYCCN
         IlaHyINvgTUqcsWBJwZNbtBWv6wwMfnY5Emvn/JighoELxJ+ua7mlCcH1hiNwkuh/gvn
         AGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=+L6a1F3oEbjuavYg8O+zs9qUWPJF7otzX4QXDgm+kG4=;
        b=B2OjX+5jwty0kT4yO/M4MM8dseTn007Hm7MZDLwAQOLrKGEfQ1lrq+nLb41yZ91EYr
         y0ED7qTXdTjDOrnrMKS62ZzVvfzubWRa/Tw5dyQUVupYb86wS067Lp6xr5x6W7mOruXn
         Vo86lfFIK+UOzv1tYHdi1kxO1NINGmQ9mhOgE6vmnC3U30HR5RgfuY+O8BxyABNSLdmu
         o1q/cXULMjafIfOZdg93XW2eMcrygY+PZzgVj+IQyDVwoCrob1wgQ3kGQV1TyMzN2INz
         /3BAaZKA6mVJTqZ+6dhHYNtFN7agfMFfttPlE2xETTCG+MVB7yuxPrkGwU1TW1kbzOtw
         be1w==
X-Gm-Message-State: AOAM533nVEyoxw58gkFgF2XD2p/Ui0lbk8PyKT80ASr5kgHztd7UQk3y
        sRFoGd5f/+sFcXE/72B28tA=
X-Google-Smtp-Source: ABdhPJyD8/AkQgMhMfH2/LA1m9X+WP9tUzzzUjBkshVno/w4xGsP0WjJyZfbgMXtjd94gUQ+WiXNLw==
X-Received: by 2002:a2e:b043:: with SMTP id d3mr1693277ljl.42.1589534955697;
        Fri, 15 May 2020 02:29:15 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id d23sm1000204ljg.90.2020.05.15.02.29.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 02:29:14 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: Remove old comment
In-Reply-To: <a13a2738dab5a37182396570db68440ed8ff2c6e.1589500544.git.thinhn@synopsys.com>
References: <a13a2738dab5a37182396570db68440ed8ff2c6e.1589500544.git.thinhn@synopsys.com>
Date:   Fri, 15 May 2020 12:29:10 +0300
Message-ID: <87lflt35sp.fsf@kernel.org>
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

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> With the new IP version checking scheme, we're not using the bit 31 of
> dwc->revision as a flag anymore. Remove the stale comment.
>
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> ---
>
> Hi Felipe,
>
> Not sure what happened to the DWC_usb32 patch* when it was merged to your
> testing/next branch, but the old comment was removed in that patch. You c=
an
> apply this or squash it to the patch "usb: dwc3: Add support for DWC_usb3=
2 IP"
> on your testing/next branch.
>
> *Original patch:
> https://patchwork.kernel.org/patch/11484297/

Thanks for the fix up. I had to apply that patch manually and ended up
missing this hunk. I've corrected your original patch now.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6+YOYACgkQzL64meEa
mQb1ag//Xm3TtByKTmWGhf/zTVTJ4q4HrrtOI9et0iLlXRHXCFbx80pG0pQGOmD3
1n8sEDM96gbOISnjd9g2wrw2UdQmvHTMhFeEIy6tMr/z7nNdJTQehgkM+XjVC9aD
Wt2Y7CTT6sjcyB4udPP7/t63iHGcuidWGGpFK7iJhVniaNJafsi90u1RWZbv/hcH
t9pjKlAOcflTF2bfnDDL2L8LdaoYp9IAgy1xOYf7qhohjDRMrdoGDwEBirzagH86
tXTVTiUbbI17EiRvq4N1i854TqcoEqTe2VCb4q0uNWxqqdn/ecAMNn6CZxcFCzZT
rn033+OxJsIrDmODysk8EWQB4bQT0VRBdMRIlk79ySY8oc2UGDSmuJhhnjQO+0kB
p9PJHQKyuzrkaR+ArQBswNdbKolRbctsWL4b6ETleHUGe0E37aYz1n+mvsuszqRv
y9CHMpazIAv/6HKI9+qVm2FUe+rja3RiO9vYOE7og9KWk8YoYX25ABaSnBH/pBbv
xPWpqYR52gUdOklYtxLrKD0ilFAi1FbFuiqsnM+4TSFCXag/RviPluVfwOQ3HSix
KYVVnmY03UlQpVr0npg2pb9ZoB1SvtSYBvYu9/AyhKnevehB+nfBA1cVtYaXCbvQ
F2zEvHqyDav0xivf0JTA7mYX57vgF4VNzMJSypvEzb+xSvXZ0xU=
=3pdZ
-----END PGP SIGNATURE-----
--=-=-=--
