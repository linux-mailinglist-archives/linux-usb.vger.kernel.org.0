Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 554A22F9E3C
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 12:35:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390355AbhARLda (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 06:33:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:59796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390323AbhARLcx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 06:32:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 735F7223E4;
        Mon, 18 Jan 2021 11:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610969532;
        bh=GZhaRK7Y7xGF1iV5xIvu47kMOz6bTUGeKzYOCHg2zo0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=evahgaDu8QBDY/7iFZ3Wmy2sS7Inx52Mk34H1jSY60rkAwnIOAQb5XIk+FG3yY6gd
         eopa0lyuQj9xOvlVl97t2QRAq5FzwQxFg31F1qUIiC1Pbm6nZcYlRdqOwqiwAB2Mvx
         HSRH9oNaFX3BMNmxTYCtCkE80Jpb8vAG66St/A5h5yXpULvCac1/uuMtPM9RrupE1A
         oDjcYSClWSlzfCN1wVoj2HMZloZywaH8rI7PRX2lBnBT2SGdwMefN3NW7WxQCZ5i7n
         /PCH3JiYXtQizKV2OCbHW3K91NPPmptrjfoSUql5iVYqqVGPX/4FQXmEKH9s7yZSaZ
         4BclhiKQweb9w==
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rob Gill <rrobgill@protonmail.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>, Bin Liu <b-liu@ti.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v6 01/11] usb: ch9: Add USB 3.2 SSP attributes
In-Reply-To: <c59f49fb-4ac4-d8a5-736e-5ad77a2831b4@synopsys.com>
References: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
 <ae9293ebd63a29f2a2035054753534d9eb123d74.1610592135.git.Thinh.Nguyen@synopsys.com>
 <875z3z3km8.fsf@kernel.org>
 <c36b8a86-404f-0fc5-196f-d15e89f7b200@synopsys.com>
 <87y2gu1mqq.fsf@kernel.org>
 <c59f49fb-4ac4-d8a5-736e-5ad77a2831b4@synopsys.com>
Date:   Mon, 18 Jan 2021 13:32:03 +0200
Message-ID: <875z3uwkek.fsf@kernel.org>
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
>>>>> In preparation for USB 3.2 dual-lane support, add sublink speed
>>>>> attribute macros and enum usb_ssp_rate. A USB device that operates in
>>>>> SuperSpeed Plus may operate at different speed and lane count. These
>>>>> additional macros and enum values help specifying that.
>>>>>
>>>>> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>>>>> ---
>>>>> Changes in v6:
>>>>> - Rebase on Greg's usb-testing branch
>>>>> - Convert the sublink speed attribute enum to macros and move it to u=
api
>>>>> - Remove usb_sublink_speed struct
>>>>> - To simplify things, use usb_ssp_rate enum to specify the signaling =
rate
>>>>>   generation and lane count
>>>>> - Update commit message
>>>>> Changes in v5:
>>>>> - Rebase on Felipe's testing/next branch
>>>>> - Changed Signed-off-by email to match From: email header
>>>>> Changes in v4:
>>>>> - None
>>>>> Changes in v3:
>>>>> - None
>>>>> Changes in v2:
>>>>> - Move to include/linux/usb/ch9.h instead of under uapi
>>>>>
>>>>>  include/linux/usb/ch9.h      |  9 +++++++++
>>>>>  include/uapi/linux/usb/ch9.h | 13 +++++++++++++
>>>>>  2 files changed, 22 insertions(+)
>>>>>
>>>>> diff --git a/include/linux/usb/ch9.h b/include/linux/usb/ch9.h
>>>>> index 604c6c514a50..86c50907634e 100644
>>>>> --- a/include/linux/usb/ch9.h
>>>>> +++ b/include/linux/usb/ch9.h
>>>>> @@ -36,6 +36,15 @@
>>>>>  #include <linux/device.h>
>>>>>  #include <uapi/linux/usb/ch9.h>
>>>>>=20=20
>>>>> +/* USB 3.2 SuperSpeed Plus phy signaling rate generation and lane co=
unt */
>>>>> +
>>>>> +enum usb_ssp_rate {
>>>>> +	USB_SSP_GEN_UNKNOWN =3D 0,
>>>>> +	USB_SSP_GEN_2x1,
>>>>> +	USB_SSP_GEN_1x2,
>>>>> +	USB_SSP_GEN_2x2,
>>>>> +};
>>>> note that xHCI has some private definitions for USB 3.2 support. Maybe
>>>> add a patch converting xHCI to the generic versions?
>>>>
>>> Should it be part of this series? I plan to do that after this series is
>>> merged to help minimize the review effort.
>> As long as it's part of your TODO list, should be good :-)
>>
>
> Yeah, it's on my list. Currently Linux xHCI driver doesn't really check
> for USB 3.2. It's missing the root hub sublink speed capability
> descriptors for gen1x2 and gen2x2. So it's missing some xHCI defined
> default port speed ID as SSID for gen1x2 and gen2x2. The Linux xHCI
> right now may think that the connected dual-lane device may not be a SSP
> device because it doesn't match the SSID from the extended port status.
>
> There are more patches for dwc3 and some for xHCI on queue that
> hopefully get cleaned up and pushed out eventually.

Sounds great, Thinh. Thanks for all the effort you've been putting here
:-)


=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmAFcbMRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQazWxAAqqdnxnC5VBoqmriV5ylcQWbfzMbWKUz3
2xRRw+MEHBGlXg+mw1AsNY4azLzDkM8eIr1laf1tg2b5XceVeG/PJ8mQAG1/5CKw
4Qe7G6KeXuDNfP3eplvDwr+yFLyHFa9D0jOSRaiaE7Oo/mcENKfyVYwVZbaMVaV7
G4hFZRnHxfH2YP/50UcUf6sLenEX8PSBok+cHrHuumdycdk23NXRow6wHOpBesiT
I8Mv7gn9KDf2La8DBbS3RJhaCn7XaGAgcrHZKkLcM/hd/lRzuG94IdypxYI2U9xh
BS0zuj5kXwj1emoBhCOWYx4VpkVSKz06hV07rWRyQ5SoOLkvlepf6V/Ss7ygLJJZ
2I4K+cNVEWJzdO29R+Qqakq7VF4U45EuX/f1kCN8DeUp8xUGoRXi/YMs9vtua7DU
PVk5bEoyYgjwGRfzZiKehXO1Cd//KLSb0Hqa49nn/GpPD2R36BaQZK/exRTHu4PI
QytvGSsOnjtV+MGNnuT4hw7DyDpyDwZ0PV2iV5+Jv6oIrfdgoczwNYm+uOA6h082
KDd2TD7afbyPHX0p/TerUVikEUvhlWvoBlK+1cZWxZxDep3OHWwfbWeCgt52ViBm
ABQPHNYgtOw0MlLFAkiXcNnbFMx5/1eVtX8WlN4rZLcH31HQhAcLHqsGajx0Y6AD
ekEuDZb2roI=
=ggqD
-----END PGP SIGNATURE-----
--=-=-=--
