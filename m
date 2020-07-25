Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0444A22D562
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 08:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgGYGMn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 02:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726273AbgGYGMm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 02:12:42 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51913C0619D3
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2020 23:12:42 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id x9so12083497ljc.5
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2020 23:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=sWR4nAYQ+wcrljLowUt5oeOxRqmUWqlhm5fJxQ0ATbM=;
        b=Yr6Bt+MHVBera5VEoh+2bABOTjPdRSspWQkVPO2PhgxdMDDcvLbFYn5+OL34Y6fsy0
         MfwDGWTTQX5RVRlvxmUntj10+NLjtOQMiCS9xyB7dzPnRKdQKI6S459Qq9lVXbhu2BPI
         IZpnqQLPWwpJUP5P8unD7NA3yelJAuMwa91WUkUshVnrC761f1GelOwBUF9fL2vM7BIQ
         aQun/P/ZR9rZgTn4SYhSIg1fxi/Ye6E3pLd0aS1/JweNExeP4ucHYG2OV2suUkQWCHMr
         HEa6+KBlaDtGBrnpaJBtOvppuBk8YAfPd/g55Hi4JStxiD1VVOm2bYk/xzdnlIQ49TBn
         m7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=sWR4nAYQ+wcrljLowUt5oeOxRqmUWqlhm5fJxQ0ATbM=;
        b=n5ZmJ2VnKhVWcnvOgT5mhNkIzrA5am6FpokqyE62tVt8owGBmUCzcnPHJtQjztCIAG
         kjU6sxoTbFctwOWPyWYUIPShZm8WBOgWS5aPADL5B0T/0ssK8tIEyX5wCWtFoy7Sd1i5
         Zli3H8fDpKVbQvcohy20TJRROezaNdwzPuDuJhBybw3RwrVU3seBjAGEg2xDYpkYbPtJ
         OsxUgbAy1fVBgCfmW+f8sfWhYGL4uCBtoI94rXPB5FF/b1FW71SerCxzJ9DKtiuhFn9c
         ixFzX98AKQrAbPvLS1y3SCdcly5g7IJ2fAocRVf3PhMyfcC1vCdmBtqxwUkkLlTO+5uJ
         JD9w==
X-Gm-Message-State: AOAM532j+Y6NJCYJp6Y8S3jKWGeHcy+YAzYY9l87ksSrnmAda738aSL/
        ugKJGBoLKO8jScbXBWZcvKnR0zQ/W38=
X-Google-Smtp-Source: ABdhPJy1Q7lx6I6NEYKqsYOJRnWUsgRDTjByRI9lTvmHXod6j2RwOhn51VMDpuTxqsZwnMX4CjNC+Q==
X-Received: by 2002:a05:651c:102d:: with SMTP id w13mr5921007ljm.29.1595657560719;
        Fri, 24 Jul 2020 23:12:40 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id m27sm975823lfq.19.2020.07.24.23.12.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 23:12:39 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Chris Dickens <christopher.a.dickens@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>, andrzej.p@samsung.com,
        Chris Dickens <christopher.a.dickens@gmail.com>
Subject: Re: [PATCH] usb: gadget: composite: Remove dedicated OS Feature Descriptors request
In-Reply-To: <20200703083534.5292-1-christopher.a.dickens@gmail.com>
References: <20200703072436.GB2225285@kroah.com> <20200703083534.5292-1-christopher.a.dickens@gmail.com>
Date:   Sat, 25 Jul 2020 09:12:35 +0300
Message-ID: <87y2n8nmwc.fsf@kernel.org>
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

Chris Dickens <christopher.a.dickens@gmail.com> writes:

> Currently Microsoft OS Feature Descriptors are handled using a
> separately allocated USB request, however everything about this USB
> request is identical to the USB request used for all other control
> responses. Simplify the code by removing this separate USB request and
> using the same USB request as all other control responses.
>
> While at it, simplify the composite_ep0_queue() function by removing the
> req and gfp_flags arguments. The former is no longer necessary with a
> single USB request and the latter is always GFP_ATOMIC.

I would rather move the removal of the extra arguments to a separate
patch.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8bzVMACgkQzL64meEa
mQZwxhAArLolI3DAshVwpxPJ1HYaPOb8DbLhr5PgvFtuiXeJsF90bAvUypDnmQLD
DudWLxs7sTMdPSiGM7ReWIselrUzNhVI6ItbMf40joIqUlOBVPbDEHiCbbVekZZ7
3N5WKAFCwtpACXhnbb9iMu1p0/gEpw4ml0jMfblXXc8EaNRo1orTfQaHTDXuu145
uQXlGUapvcGNOaIPneXia1P7UdipSbt7OweoOoD0R6PFsgBU/hgLPMPML0VL+lhj
ie4pMzSazbah/fo83stc1H40nhCfV+9q7uwIKjN3fNn+5jWHq/EfEYpzNxCiQdIa
nYB1TwRSkMu3ygD6T1O3bFvYaa6qafHOCvQ6Gu2QHbF0yiRMdF4V4niTNe8s+iMJ
G54mpzbI86OAfqfl21Q3e6uUnDbCfXK/IiIrt++yx4S9f8Ih81bUOmktji66zLgI
KylAZkX4D2V3hRfDmxv6AtSTkieZQTLo5qkLpeqwi7bx/2BLwua6kex/A6HTCYav
sRBTXtG7jmlgPPrJktkJ4ILe8x21MoT735BAr2RetYmNq/kja9N62f4x4WQYa/Su
VOc8rNXJJbNnqwCPXrJ8nJLb0FJhvJdHpsffYngDZkfC1D0Tngz95iO/PMlt/dQk
U4O5iuhaJYpqHr0e4U1QmV6+pkfhND15Q+U/Hs4P0jxV02lpNp0=
=yMB0
-----END PGP SIGNATURE-----
--=-=-=--
