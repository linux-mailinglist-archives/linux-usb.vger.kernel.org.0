Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1133276AC2
	for <lists+linux-usb@lfdr.de>; Thu, 24 Sep 2020 09:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbgIXH1V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 03:27:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:42762 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727024AbgIXH1U (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 24 Sep 2020 03:27:20 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A2E9523600;
        Thu, 24 Sep 2020 07:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600932440;
        bh=c5K+DyCSPbUE/T3nJce2kTo7gvVyZyPvKzEIpsAGaXE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=QFK8XpjGdBZ5QXpmGCD8sbsCsAVjKpXMGcJCplSLF7u2TePGlFF072WcAyrz55Jce
         scwun8Gatujfzq+4ZgfyLyQLXUYxtsElaVA97mXe111xj2qoJJA4+ETO+j+aoxqiIj
         997d3X6jM4aC7baWxv2GndF8ZHYx4u6WhpQghOJM=
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH v2 1/8] usb: cdns3: gadget: using correct sg operations
In-Reply-To: <20200910091130.20937-2-peter.chen@nxp.com>
References: <20200910091130.20937-1-peter.chen@nxp.com>
 <20200910091130.20937-2-peter.chen@nxp.com>
Date:   Thu, 24 Sep 2020 10:27:13 +0300
Message-ID: <87ft77eisu.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Peter Chen <peter.chen@nxp.com> writes:

> It needs to use request->num_mapped_sgs to indicate mapped sg number,
> the request->num_sgs is the sg number before the mapping. These two
> entries have different values for the platforms which iommu or
> swiotlb is used. Besides, it needs to use correct sg APIs for
> mapped sg list for TRB assignment.
>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>

fails to apply to my testing/next

checking file drivers/usb/cdns3/gadget.c
Hunk #1 succeeded at 1099 (offset 1 line).
Hunk #2 succeeded at 1165 (offset 1 line).
Hunk #3 FAILED at 1176.
Hunk #4 succeeded at 1221 with fuzz 2 (offset 1 line).
1 out of 4 hunks FAILED

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9sSlERHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZfEBAA2l36WWjmJMEVzolhvEZH0fMuaJthc7ZZ
oTc3eOaEKLXLRjTxo5dNZOZHMl3bYldNB5ZcmCEOp962RhTFgKd/jwMdT2A2hz8n
UgJ/FcNI5VFNuD3GPMz0vB+wRf6theBpq/jWmzTfKUv17HZwZ8aJN8R5y9vnBx6b
Fxjt5VKx4jarmVbMtmM/0QgmNzLBktCrgcZsS0kTJrv5ufuJ5sIEE2Qso6YOyKlm
6OWiHMPG99HDEgQMojxh5SGvgs/HPeyCrb0cJEmj01unpHvP8YAG4fK5SeCLcW3w
xbozYj9Ka0SqSalgtsBOAXTukA9Uc1u6PH195wJHUc2RCoGDACwYvMqcgGA6Ea+P
flq5k3ahdjLGtsokf7w1YR5jHd/UTsx5KJ+VLPvDYTQE/0xOVO+C5gixzuhHAzRX
MqxVK7/l9pBszFaeGw7SnbJ9cfZlozMnpruLGG4lF55e5lt6ck3A/3Ie9hOxiy/O
wnF9pKvLbyvtJ0k88X7Zf5++7gjGOAc7rueQDeELWwVXzWdqO52aY7uMnpOEe4uW
MryMdlogMYtE5Lw1IkqLMJiIdv/gNVDsFwz3mm35czWLw3XLf477C2aP/Em1iMuo
njq2LP5QNgV0JYZW12cbdUfjW7JLlXeK+/BK5uWo8MbMNrXoawOspIBqjQeJDVfe
9sP11VIDg9s=
=TMKC
-----END PGP SIGNATURE-----
--=-=-=--
