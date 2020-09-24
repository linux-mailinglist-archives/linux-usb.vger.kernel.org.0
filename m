Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB56276CCA
	for <lists+linux-usb@lfdr.de>; Thu, 24 Sep 2020 11:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727433AbgIXJG4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 05:06:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:60996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727336AbgIXJG4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 24 Sep 2020 05:06:56 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3A49E206CD;
        Thu, 24 Sep 2020 09:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600938415;
        bh=1odkQUMRqD/zPzL+E82ClrVt6KBWiA9z4c4uyHXpAKg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=VnkAiv+Tlv7jpZTFpJYqx/8A0W5RfqOPvg5TrkvexE+hxPz4wHt2R23xLIBVEGykX
         UWxGjZ/45jjdmeNIjudvmzNN6vdB5RZaT4p0OvXDLPJZe9VFjKx/ZLNtmqOwXhZpDx
         AZuYdHvP7M9rxLvC01nbxpklLaZgANwB2+MCrFeY=
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v2 6/7] usb: dwc3: gadget: Rename misleading function names
In-Reply-To: <87v9g3d095.fsf@kernel.org>
References: <cover.1596767991.git.thinhn@synopsys.com>
 <554c6d34c5936630bbe292114fad9c3322a7161e.1596767991.git.thinhn@synopsys.com>
 <874knnehul.fsf@kernel.org>
 <129eda75-c6af-70db-a341-e0ce7fccc38f@synopsys.com>
 <87v9g3d095.fsf@kernel.org>
Date:   Thu, 24 Sep 2020 12:06:47 +0300
Message-ID: <87sgb7czmg.fsf@kernel.org>
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

Felipe Balbi <balbi@kernel.org> writes:

> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>
>> Hi Felipe,
>>
>> Felipe Balbi wrote:
>>> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>>>
>>>> The functions dwc3_prepare_one_trb_sg and dwc3_prepare_one_trb_linear
>>>> are not necessarily preparing "one" TRB, it can prepare multiple TRBs.
>>>> Rename these functions as follow:
>>>>
>>>> dwc3_prepare_one_trb_sg -> dwc3_prepare_trbs_sg
>>>> dwc3_prepare_one_trb_linear -> dwc3_prepare_trbs_linear
>>>>
>>>> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
>>> Tried to apply on top of -rc6:
>>>
>>> checking file drivers/usb/dwc3/gadget.c
>>> Hunk #1 FAILED at 1161.
>>> Hunk #2 FAILED at 1231.
>>> Hunk #3 FAILED at 1266.
>>> Hunk #4 FAILED at 1294.
>>> 4 out of 4 hunks FAILED
>>>
>>
>> I'll rebase send out a new series with a bunch of fixes.
>>
>> Btw, the patches you just merged are not the latest:
>> usb: dwc3: gadget: Resume pending requests after CLEAR_STALL
>> usb: dwc3: gadget: END_TRANSFER before CLEAR_STALL command
>>
>> The latest are on your "testing/fixes" branch
>
> Argh, nice catch. I'll fix it shortly.

should be corrected now. Thanks

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9sYacRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQbPYA/8DWbgffbwiN46j0Py/8PPvECayB11ZSpw
u36OBkagMW/TFBoFoIiR5nq48iHFoPl0FGHuhP6HF6jgjlla2i3jXVrVZBd8ePp1
E8Yl6RhMgRF/Haz/uYeUJ2zjpgRtWYeKfBJFeje9UFJ4xt+9qgkVkyvcg1r8xgsn
lIeBlvpEQ6kMwkhYdCg67yVycXKPX4l5OmF76Wz5s8q4QQzXss2shDXwqvElWZM8
3l07UV6BfJahU2Pi+uKyRlgAHhTeBsTaAh1GRN4EmDuHQmB2TWZSN8+mH6J0qpeU
LWfa8LsNf2kYZIv13yAGL+dJJeKrXLhpP6X8RTklsEhNAZm/ZTspGLm+C117J9HY
WNluBekshYeXd0ca6DzKoCSi+WQZlVNteDVBeQ4JuFoW/CTnfGAFMPB4Rwto+Psx
W8ru7eepwgVLxz3mXpDrYJSAgf/9eN+ZQ/kANkyvwByPqHFkoQ/0FJX4UhJR0rwG
aROIyohAj5bMIVlqLnE99vb7aTQmQ8M8v9kAoMVz0ukTkLMFd3ZiMZUcciCwkUTl
SGaDND7XWAbPrSoNJNI3R9g+zDb3sUhvpiJV856wneH2Wcd0ZAhcmUne+0x5udPn
//xZK8eRuMl5qMDQg+dapMDSOlGxgT7uWmaiL7r4rGOByXbJSg0Brdb2dw5FN9rt
JwEUM6AID8g=
=67YP
-----END PGP SIGNATURE-----
--=-=-=--
