Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1274E11C6C5
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 09:04:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbfLLIEu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Dec 2019 03:04:50 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40027 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728151AbfLLIEt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Dec 2019 03:04:49 -0500
Received: by mail-lj1-f194.google.com with SMTP id s22so1184881ljs.7
        for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2019 00:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=EWJurhIiuwU9Jj+sya2BK8MYbQOgUSrtoONTTuvtRRs=;
        b=EA2k7Gqv9ySlDo3zVvI1Yj9cZuW5NsXfvy3MyLYpf7nR1JiNcbE3RGacUU2lAFl6Yf
         wXf7bd/NUMfU9MzBNr+x/UIHPl/uhobzYDFAynTzDzY2g6AEem3ol+DwA7SD4A/yu2HD
         2cXZU3Ofqcz4bJeMDDliLARXFEc6hNSYy7PGg4JFPwXrS6RupWAiK2HAoiJp47/6C246
         GYq5C5YnxgLzkznOGafWOp3DyC4VOWsTppSnZe6T6fAqszXDxGFxP9hEVghiou+dwxbn
         GdQwGPDhyqx1vhxJqzg+I6mF0y0+FUrwNpjGSnjoRnp/a/pkJwAVnR4DSbsIunMkHftW
         Nl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=EWJurhIiuwU9Jj+sya2BK8MYbQOgUSrtoONTTuvtRRs=;
        b=ZQ4TldqMGWIhLsrLtr7B3a9GvW33b9CULIiLWYHLSkS3buOVY8io3e8W0UPH28Z1cZ
         xWzLeQiNW1W/LlawoLjPXoHgy3Fta5se8zKLJuRWMigvU8ZM59mJbl/ZNNkwkpv/ieBd
         5+EGF8Rcplp9GUCDfldVoS7DmxuDb+MGeinwpRXGpmZRl7cc9YXm7wqOLqIQcPvw1hf3
         ONi1Gk86qai9YzzjDX5HeDDc7vKGvwWnGRkJjIs9OQoLv0gW4MKHJd3+aj3uSP0x4Esm
         0ukeLNtq0bBp2f37ZCGUaZhP8Rm6GjQHfSdZ3lZcZOVxWvKwI3Qyk261EwRI0CNfTkU9
         WSXg==
X-Gm-Message-State: APjAAAVJVRoG0CVbiNCh6ptiiEDE/xbZE59Xo/HxysxhiVDa1PB+wxhq
        5dA9t89MyRjB0LYbtgKsmq87hEiU6PnPmA==
X-Google-Smtp-Source: APXvYqyhJaJdNm6ixsBnuHY18B96qhLJ2FXAY+dqvIhFFq4sKmBfVAtv5YAgsxwQJVieEfH4WTuZ9Q==
X-Received: by 2002:a2e:9e03:: with SMTP id e3mr5003717ljk.186.1576137887722;
        Thu, 12 Dec 2019 00:04:47 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id b17sm2424645lfp.15.2019.12.12.00.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 00:04:47 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 05/14] usb: dwc3: Update IP checks to support DWC_usb32
In-Reply-To: <a9781ccc256bdd59550e4847144424f18da67eb0.1576118671.git.thinhn@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com> <a9781ccc256bdd59550e4847144424f18da67eb0.1576118671.git.thinhn@synopsys.com>
Date:   Thu, 12 Dec 2019 10:05:32 +0200
Message-ID: <87y2vivuib.fsf@kernel.org>
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
> @@ -1009,7 +1011,7 @@ static int dwc3_core_init(struct dwc3 *dwc)
>  	 * the DWC_usb3 controller. It is NOT available in the

perhaps update the comment here? "It is available ONLY in the DWC_usb30
controller".


=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl3x9MwACgkQzL64meEa
mQZiOQ//YOciJkEFqi8E6LzrNjgagjrAWGKvm51aOoQsCwTeXh8BTPmmumyIZ8eG
7NKkCEohJLpjhGP/Z8NSn5uraF3Sq/TkG2EAb8D4TuVbaJDtzwfRs+1Y6uvX1Cso
ymmIUuMiBmJIG8wgZxY/0JMby846E5G4ML5NhkV7yWvClwG4Qk4x/RWe4G0EVxSd
8Zj87msGcoze2Q3Rh+aZPNFwzjh+jvSZPVtePJqsI0L2fF3poM1jiEYf3xTeZR30
n8L/YESVgh51U47fYT1/c2saxbZZ4pgyH5dZg4wdIfWyW5FL7nNtGPGEfhhd3FEx
ti+CRLJaYXuPqS9B4Y+0P/P7WjdBwJwSc5tyiixddF0DCICiAJX0EBK50WfTjVD3
o8R6n3vVmQrFpClGJuopkPtJK9clvCObyqzdjhXfLPh3jVbKuLDC/jY2CWBnLS9c
h8S+3DpLGC4rU58O2vYpB8qdzKNBtxxaoFzCvDa94i8GzuKWLwPiYm1YSA+CksBB
h+b5ZavqGcQDDunDjlgKaWmGkSoHAC55J8CLxOAUV9ga4Om02T+RtvNuUKebhwrd
IkZv7V3AKBBQHaJKPq2Q+8Ob6d3eBylt1N8NjsuVbAOYULq6kl7uMTDOlw2e+45a
OShKV2Cq3CxxC8sMWYC+3/uLcLtAhK+C27LXh9lf+0WOMAnIa+I=
=IS+J
-----END PGP SIGNATURE-----
--=-=-=--
