Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 426DE185B60
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2020 10:21:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728090AbgCOJVp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Mar 2020 05:21:45 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40729 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728065AbgCOJVp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Mar 2020 05:21:45 -0400
Received: by mail-lj1-f194.google.com with SMTP id 19so15212863ljj.7
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2020 02:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=/Zo1yIv46IM3MkDcXFD8ykVTy5LlPcPYccPISWQk9+c=;
        b=IBheqZISxtMWdUgENcNah/Zt4QVYlVJzwkfG7xjdnnIP8vhlsVFLPT4QV2liWlBZAX
         sZKJND/1FqOmt0ZCh5BXPRVzQzZkVQW/WBRVgO48c/BnFkP3rFuVqr3cLI4N2E7xQR+w
         60QOYCOzyJTYmrWRNV/yqjhfGgPZZKTaNWM56PmLy1jpcVBi/swkCC+u4drPbKsw5HUu
         FuvqIVllibZtsa4RYufvL6rnXoy1Eh8An8sDL2KoKpGY4ySoFtPhKE3ik24Gr69IgJ3g
         LWb2AQUJAzme+yd3UDbvmcKjNVSERwF7p3CJlykzXt/vs1is4lBSXDNHGdC+2OSVDOFG
         4Oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=/Zo1yIv46IM3MkDcXFD8ykVTy5LlPcPYccPISWQk9+c=;
        b=UrxChTsff97WBKbsaJgI+UUvocX3tDg5GWvn2S/g0SaityH6YXhS/l+iA6owfAcZD5
         LpuQVcOOnB53epMBhHdB6cUAvlUZaSVx6ynX5jJb5OiQ1/p6eAEUADFvR9hKwDWKhnqQ
         sYwPOV4cLTdNNy+Ft5mAXqzg5Lw0ynHoh72mn8wvxVfdzeWzXJPoti3H4h1iPtK+17HA
         bQNx1bZf2ma05ZTkQfrBbMV4lztRbWdc9stxYipHagyRTeR75heUVStDODiekMHNwjVb
         5s5tofIGRHzBfLKIR8d1ujRj/CTN1ySwMab4QI6cvDAdGuR0FFGDDb7Apvx9Jruj3z81
         bQRA==
X-Gm-Message-State: ANhLgQ1RuVZA3iaVcczTj6/UsmhF1XDbn5O2JoBdMbl6Lzt+JDLEPFzI
        /C01PKiaA8mLSTG9uhKnwuo=
X-Google-Smtp-Source: ADFU+vseog/IlSMWtZPWVgMkeRy41iUIXCwKwfuJmwT5d+DcSKnusVJD9d7Uk/cY2/5rvphPNOFrdQ==
X-Received: by 2002:a2e:88d7:: with SMTP id a23mr13536492ljk.225.1584264103577;
        Sun, 15 Mar 2020 02:21:43 -0700 (PDT)
Received: from saruman (88-113-215-213.elisa-laajakaista.fi. [88.113.215.213])
        by smtp.gmail.com with ESMTPSA id g28sm11929977ljn.99.2020.03.15.02.21.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Mar 2020 02:21:42 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 2/6] usb: dwc3: gadget: Properly handle ClearFeature(halt)
In-Reply-To: <4f9b6acbff2cd0be417fd4a943c1975bf41f8fda.1583443184.git.thinhn@synopsys.com>
References: <cover.1583443184.git.thinhn@synopsys.com> <4f9b6acbff2cd0be417fd4a943c1975bf41f8fda.1583443184.git.thinhn@synopsys.com>
Date:   Sun, 15 Mar 2020 11:21:38 +0200
Message-ID: <87a74iezx9.fsf@kernel.org>
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
> @@ -1627,13 +1633,37 @@ int __dwc3_gadget_ep_set_halt(struct dwc3_ep *dep=
, int value, int protocol)
>  		else
>  			dep->flags |=3D DWC3_EP_STALL;
>  	} else {
> +		/*
> +		 * Don't issue CLEAR_STALL command to control endpoints. The
> +		 * controller automatically clears the STALL when it receives
> +		 * the SETUP token.
> +		 */

we have a separate dwc3_gadget_ep0_set_halt() to handle that. How was
this triggered?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl5t86IACgkQzL64meEa
mQZochAAg2ECVuR7uEJegSqKYqkC1qOyDEu1nqa7MyznY4KFFC6Vd1CTvyQXn3Xj
qlZ5xo8aP8Q58IYWoDsJc9h3/8cblk+8fVbsa8FJJgZgiATHYNnAu63WCF6oTF+s
1I6557RRSPilEiw3UDvj8PWDvQsF9RigSnU2KZxKYSsa7dlGxCnkgsdavPZhqQLA
czOJZjjbtbCPbIuAj0nK1xf11FgvvIrPRYdqoElDJ534hevh+89jQBQ2+6mAKbPJ
wvc90vyd5PsMCmvMT4x/wWx/ISBrgp+VXk25cbCJdxs3lyMkhMNi8D6uglhphIZ7
dTO2VmryOX/R5y87JS/aLBlo/LNx52wEYc5EVmOqbBwGCVzpcSoWY0uIo8j7vsQt
CR1waPSIityXwRuTp3KUPoKYHN7jPi14GyAejMqEa/gsStnO3GPhiMtokow+7yq0
MdToivmsASs5M9dsiPL77IHlWqLxwSxipc1WUgKbabwb994Z+LyPTl98jvOSTOub
ELPGlA9YSR0U+1WROJ/31zq6VlCnfR9XSF8Q61hnM2GlgPSbiH5x8IYsC420furf
ijtBIwmAoyIjr2CFiVUyH3JFsk9VmeFUE5FWy4P8K+buniMEqH2oLACMJJhLye2t
utc4WV4Y0/PO+esKBnFOfWLWamsRZMd0n6VbqwYoZ0pB2bW+at4=
=ey9K
-----END PGP SIGNATURE-----
--=-=-=--
