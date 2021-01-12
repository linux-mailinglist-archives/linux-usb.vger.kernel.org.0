Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDE022F29E7
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jan 2021 09:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392327AbhALIVF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jan 2021 03:21:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:48952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732013AbhALIVE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 12 Jan 2021 03:21:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A366C22D2C;
        Tue, 12 Jan 2021 08:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610439623;
        bh=XiFehD8Hc8n1CyVzd3ct7wrIYkvIk9UUZBdnIeOnyVU=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=OWH1RjuNvlRKPnUj9TZvuZX9oEPaAHBde3GDq2+b0BAiaGH6DLfW7tXf4FQac5vWo
         SVM/LLJpj6ZVd3mv6bSmvtjnqzWWU1fI2Y6P6nfrdAzHlG87XMLSWbxOX1NBOqZOpx
         fn7VcQkvp7PsjS46KU4+Xg3bLDW37zi3yqUfyY6huRz0l/9+qaVmB+37fpYwka6g0v
         65o+h3mhS1d1oEYtnAtZ+MKeYg1PHOXmYrfsQL/qZyIwX3g55Z+l6JtAF3J6Ayb4MW
         FQ9m6+fkqLlKLatNMi8QjMH/rspHCi2VuOSW+L6q7TGuT4BU1yyyj5sN1m1IL40pZV
         waqrprvVUBmnA==
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] usb: udc: core: Introduce started state
In-Reply-To: <a7c4112fcd4dc2f0169af94a24f5685ca77f09fd.1610395599.git.Thinh.Nguyen@synopsys.com>
References: <a7c4112fcd4dc2f0169af94a24f5685ca77f09fd.1610395599.git.Thinh.Nguyen@synopsys.com>
Date:   Tue, 12 Jan 2021 10:20:15 +0200
Message-ID: <87zh1e4lds.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> For some UDCs, the initialization sequence by udc_start() should not be
> repeated until it is properly cleaned up with udc_stop() and vise versa.
> We may run into some cleanup failure as seen with the DWC3 driver during
> the irq cleanup. This issue can occur when the user triggers
> soft-connect/soft-disconnect from the soft_connect sysfs. To avoid
> adding checks to every UDC driver, at the UDC framework, introduce a
> "started" state to track and prevent the UDC from repeating the
> udc_start() and udc_stop() if it had already started/stopped.
>
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl/9W78RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZ5PA//drBFL+qAEtUCbURUSBQWJZNH+LHrhDGO
BCamPm+of9MUEDubDjfbH28op5fP/N5AiK25p2KxAVQu2iwYVbV7JJawBDmCIjBy
+gKzQ3/DpsdvBJDc3tlNVqBPX6LGNkRvd/Nvue7ZEiPeZHW6O5sVus0k3C2KXynW
O8Xc4tAYKbgrbArsQpxXufX7ZU2RPCOy1rgYOKIcFi4OaJ8nvQVWr3ME7cha6Oc5
Mokg06SB9wIz7jffsCM3S81jAnsi+X3Sqj91BmTkx0uGICE1OKkPW68o8SyKNB+k
TT4rhZoiGx3toLS+pTUaSZi11iMZ8DKYjWJhAxVAIMtejU3ifWoyvhg0WTtCCONV
vEdu5lEXsvdnUrSF0QHI9dhtqW1gOLL5SFHvpgpJP/wmLoVaRSC1Mm9uUPZD52Av
D5WnXmnh7/SHmFlwolh+T+YJQlUB8hgDAVMARa+hgU1sAffBlHLm5shxxFZtQu0y
adPlPmi2Hu6SBIo2/XsSwcLUyyHgzhLubA4RBJwWjR9dD8FZAt62hXRgDE7PPP47
BQ0FpH7dEBQBy7FPTuxswCOvr3Ai/YHU6x3dnY6AmnINd9n1G+g9FWU+VnIOlVNL
4VnnJKz6pmG4M7cV1drNZTgR39MZNf406Sqofc4yuG45d/2mcAxITlyMu+5P0svI
IeNsTAxgjdM=
=qYTg
-----END PGP SIGNATURE-----
--=-=-=--
