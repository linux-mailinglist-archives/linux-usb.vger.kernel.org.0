Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16FD7276C70
	for <lists+linux-usb@lfdr.de>; Thu, 24 Sep 2020 10:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727309AbgIXIxU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 04:53:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:56822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727300AbgIXIxU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 24 Sep 2020 04:53:20 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6D46623772;
        Thu, 24 Sep 2020 08:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600937599;
        bh=258zIvWka2irDjhBXdTbAihERSYBCQYmQWoH7138GD4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=cmK2jbqYbc19c12/w4MhLJnL8XLbcFvq3R9Fi8lg7BbsGpMmk5yk+JVzEqYntIr8c
         3NZRNPH87MmFsBulbnNYUpd/ytDzt/mnFwNgjnzdsFUzu5Snkdg85CZTSVFM3JpgZx
         HcAyOUyfAs4bZq8duS4sgMqRzL7mmoOjWvSPtkDM=
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v2 6/7] usb: dwc3: gadget: Rename misleading function names
In-Reply-To: <129eda75-c6af-70db-a341-e0ce7fccc38f@synopsys.com>
References: <cover.1596767991.git.thinhn@synopsys.com>
 <554c6d34c5936630bbe292114fad9c3322a7161e.1596767991.git.thinhn@synopsys.com>
 <874knnehul.fsf@kernel.org>
 <129eda75-c6af-70db-a341-e0ce7fccc38f@synopsys.com>
Date:   Thu, 24 Sep 2020 11:53:10 +0300
Message-ID: <87v9g3d095.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:

> Hi Felipe,
>
> Felipe Balbi wrote:
>> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>>
>>> The functions dwc3_prepare_one_trb_sg and dwc3_prepare_one_trb_linear
>>> are not necessarily preparing "one" TRB, it can prepare multiple TRBs.
>>> Rename these functions as follow:
>>>
>>> dwc3_prepare_one_trb_sg -> dwc3_prepare_trbs_sg
>>> dwc3_prepare_one_trb_linear -> dwc3_prepare_trbs_linear
>>>
>>> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
>> Tried to apply on top of -rc6:
>>
>> checking file drivers/usb/dwc3/gadget.c
>> Hunk #1 FAILED at 1161.
>> Hunk #2 FAILED at 1231.
>> Hunk #3 FAILED at 1266.
>> Hunk #4 FAILED at 1294.
>> 4 out of 4 hunks FAILED
>>
>
> I'll rebase send out a new series with a bunch of fixes.
>
> Btw, the patches you just merged are not the latest:
> usb: dwc3: gadget: Resume pending requests after CLEAR_STALL
> usb: dwc3: gadget: END_TRANSFER before CLEAR_STALL command
>
> The latest are on your "testing/fixes" branch

Argh, nice catch. I'll fix it shortly.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9sXnYRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQarfhAAlPjg50r4FmB4TPDJLmKpdxvWgrEoCGhF
G9zooWUuPh/1bwWiPEYKT60vaKMJR4AiIEsK1j9pjXxohX0wJHiDdPDGJPVqahkE
o0/AE610RkjjXRHicw1i0uDxZwovSHLPSfTYJeNGb1X0qH8VOPP6owKzJz9L1ZDA
5T7bwhgGMSSXY1fzh2/69nHqwQ8lJH/88TOOO4wKDf7jOKlgmbKxTyt2f7tTaK2z
nwTB6HCtOsTERz/koRPBOa56clECiN6sDKCMD2pHy65eRUS6cZI2As/x4/znSJU2
wv1+MCgO67QCr8PjJuVptiZgNl+sEAw4ZTge3loWDEpek6ARFC96r9JxogerRwQj
06Q7lE2POSEyHUVWiHz+LsgAz4dEFDhSldxjuvxj4wIDqJoHe1NZE6I1lhWsIYQQ
tBB/YPQAFmaqAhNDD9mo2t3rgLILtH+6VPIQicKZLbErYvziNK0M7ipRbivNMjDo
Vi67ntmsxDtUYknugQPelFbmgLqkxf0uem3Yi+FJuwQTw8b6TENDz2r4L0p7HXWx
LcT6K21f0DR7OCg7LpKvsk0WIhTtJTlWHK+uS7GwW/olvf93lK+EgdqEVjgdI68U
I2w0owkMLA2jOy4+xE807IU0ddpxs6zYR0g0mnUMK2swfrnS1j08tx0anZ22BYMM
oXLgrHX0Rzw=
=qUCR
-----END PGP SIGNATURE-----
--=-=-=--
