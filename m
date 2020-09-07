Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 526F625F328
	for <lists+linux-usb@lfdr.de>; Mon,  7 Sep 2020 08:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgIGG2g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Sep 2020 02:28:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:53246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725823AbgIGG2e (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Sep 2020 02:28:34 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4B10321582;
        Mon,  7 Sep 2020 06:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599460113;
        bh=KDfuZUVFVJlmOuj3B2RVfMNQSlyiYDhEicxZoELt1Ik=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=M4gGJdTyBpmuy8UQghe5e9NdtiKHs1hq/r1rqBnd52ywEJv8+59gZOcYMYzbGEJc4
         x6ABQ8Ig/ONU0vzXNR2I9v21Kwa7LBVQTb80uCRXEQUnG4oJR+9GaJPkljYxlOTpjt
         y9ylrLZDi78DIVZUdl2/baF1e6/m6FACo664a7Oo=
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v3 2/4] usb: dwc3: gadget: Account for extra TRB
In-Reply-To: <3a914ab743485860aeffeb55d46b312491d7d811.1599098161.git.thinhn@synopsys.com>
References: <cover.1599098161.git.thinhn@synopsys.com>
 <3a914ab743485860aeffeb55d46b312491d7d811.1599098161.git.thinhn@synopsys.com>
Date:   Mon, 07 Sep 2020 09:28:26 +0300
Message-ID: <87imcq14ol.fsf@kernel.org>
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
> When checking for how many TRB remaining, make sure to account for extra
> TRBs for ZLP or MPS alignment transfers. Since the dwc3_prepare_trb*
> functions should know if we need the extra TRBs, make those functions
> return a status code -EAGAIN if there isn't enough TRB. Check against
> those status when preparing TRB instead.
>
> Fixes: c6267a51639b ("usb: dwc3: gadget: align transfers to wMaxPacketSiz=
e")
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>

this is quite extensive for a fix and it also depends on the previous
refactoring from what I can tell. In that case, you can break this down
into smaller patches.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9V0woRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZNNA/+NbpX5f5ZjsU1yGbUWlE+lzgR8f7w9fsG
VhgNB5Ce9paBcyw+/NXmYfY3ZqPOvb1EJgQ7kUZGqlbFEE7OcPWQLPt4DxVZ+9Tb
PCcdPAwraks+UP7V7A+rAm3hOqvjR/vSuzFneGw2NwwZNvwU1t4Yp973nYPdTeAw
8LxY5GxyfASwch6/zhI1FtPRsCv6TEq1qtiYzMAR6jIa31cgrjPWeL1FTfNapPuG
BSwZVRAnGbueKrNJcb0PTPiw9nQFLbbRrJkGgUcLW9UBO0mSnf/8+ppeU0RG87Rm
bl78cZxGEebQdBiziMkm2HaNrtr8UQYcLP58kewc4GLLcoheeCMV/0xgSkt37ay5
240Iyzwuw6Sc4J5oWxGNBXtJGBtxE039MdIspIArsD3gBWWTNTUGtITQxQIV/UW9
nb6xmppgIRMDldW3YU8zIbL1oA+cRX9/M8bFkN2yqKK4BzMdaCemw+QzskzfY7MH
jqoTg/7iYSIdWs/lYnf4jJcfi0BI/ZHfYMqZ7D4kMFkqLEwiinMx1g2f5V49b58I
ecIjvemNQmRv1P7lCq3yP2um/cUAG1B1L41Xs8AdB7G+HTpfHXoUGSfAFBK4OhLS
tqln9xLy6l2eExWTZWYp7r4NrPcItPDn89ekJJD6UtsB6+AHNzEpoH06KjC6omSs
CJPR81Mr65g=
=JBV5
-----END PGP SIGNATURE-----
--=-=-=--
