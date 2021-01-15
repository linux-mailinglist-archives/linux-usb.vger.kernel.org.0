Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52BB82F773B
	for <lists+linux-usb@lfdr.de>; Fri, 15 Jan 2021 12:09:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbhAOLJD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Jan 2021 06:09:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:40732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727051AbhAOLJC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 15 Jan 2021 06:09:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4574C223C8;
        Fri, 15 Jan 2021 11:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610708901;
        bh=h9ag6luS2aT352xbEi4AlrgqRnTRQNwEPPVn8+DuzC0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=XnFIY0RrkvG1l8fZwTWIR9dpTiHhN522virsJD3wTf/RibzDt2gyL8QRjhaqO5xie
         YTA3wfMIvwnDZTiH/MBPZkHJo3iO+0z84K9kwMcwzwG0gacAW6lcIA2Nt6CCkycJT5
         u+NrSosBfXtKSNRyOEAWDNy1w+AxIwIgWanGW2HgA2OIdol0BFttxftvn125yKBOtF
         yOqDEBQRiJd1SMFH4tQ9BpfHjVZrZHdnOTmkdAMb3zgOr0riu83gKVbpuvGuD3TmJr
         O/6WpKc03I2llkNex9lNmIZwa3kWEdvkoP+5ROBJ7Rs0woa48F+7508LjwjRktwDTs
         aB8K6WJonrFbg==
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
In-Reply-To: <c36b8a86-404f-0fc5-196f-d15e89f7b200@synopsys.com>
References: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
 <ae9293ebd63a29f2a2035054753534d9eb123d74.1610592135.git.Thinh.Nguyen@synopsys.com>
 <875z3z3km8.fsf@kernel.org>
 <c36b8a86-404f-0fc5-196f-d15e89f7b200@synopsys.com>
Date:   Fri, 15 Jan 2021 13:08:13 +0200
Message-ID: <87y2gu1mqq.fsf@kernel.org>
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
> Felipe Balbi wrote:
>> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>>
>>> In preparation for USB 3.2 dual-lane support, add sublink speed
>>> attribute macros and enum usb_ssp_rate. A USB device that operates in
>>> SuperSpeed Plus may operate at different speed and lane count. These
>>> additional macros and enum values help specifying that.
>>>
>>> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>>> ---
>>> Changes in v6:
>>> - Rebase on Greg's usb-testing branch
>>> - Convert the sublink speed attribute enum to macros and move it to uapi
>>> - Remove usb_sublink_speed struct
>>> - To simplify things, use usb_ssp_rate enum to specify the signaling ra=
te
>>>   generation and lane count
>>> - Update commit message
>>> Changes in v5:
>>> - Rebase on Felipe's testing/next branch
>>> - Changed Signed-off-by email to match From: email header
>>> Changes in v4:
>>> - None
>>> Changes in v3:
>>> - None
>>> Changes in v2:
>>> - Move to include/linux/usb/ch9.h instead of under uapi
>>>
>>>  include/linux/usb/ch9.h      |  9 +++++++++
>>>  include/uapi/linux/usb/ch9.h | 13 +++++++++++++
>>>  2 files changed, 22 insertions(+)
>>>
>>> diff --git a/include/linux/usb/ch9.h b/include/linux/usb/ch9.h
>>> index 604c6c514a50..86c50907634e 100644
>>> --- a/include/linux/usb/ch9.h
>>> +++ b/include/linux/usb/ch9.h
>>> @@ -36,6 +36,15 @@
>>>  #include <linux/device.h>
>>>  #include <uapi/linux/usb/ch9.h>
>>>=20=20
>>> +/* USB 3.2 SuperSpeed Plus phy signaling rate generation and lane coun=
t */
>>> +
>>> +enum usb_ssp_rate {
>>> +	USB_SSP_GEN_UNKNOWN =3D 0,
>>> +	USB_SSP_GEN_2x1,
>>> +	USB_SSP_GEN_1x2,
>>> +	USB_SSP_GEN_2x2,
>>> +};
>> note that xHCI has some private definitions for USB 3.2 support. Maybe
>> add a patch converting xHCI to the generic versions?
>>
>
> Should it be part of this series? I plan to do that after this series is
> merged to help minimize the review effort.

As long as it's part of your TODO list, should be good :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmABd50RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQb06RAApZUaJFrqqMF26mYlrEde6lIXDZ2suphJ
pA/buP5VwzolU+hSKzomi0tbPViCj5Kvtmmm1p5tJsdUH/VUSTtl67RVMn7IvhQI
xVVXxUprlaZzf5E2z7HAjv1Da2fkVn7cidlx/WQ3fOwK541T0aWu39AEJhsbRA2f
0TWNRmy4eizcHuLMf+wbBiotFSuRVmd3w/rZbNxaR3gvlxnqm9pnVVqEVQKjHnCS
TDKTWr2CBIGtKfKAkfQabatufwyhCr5H2874O7CENwB4Nl8r5IjRTNSGqSZ5imR6
YhtW+j3Am0m624/B1WPy9ldWPsxPOBz4kBizqtiMeIvTMZE17rOTa6a6i81WP0Mb
EBcbuqSmGpBh5xwb58gOnDeuJbHJ5J+wpWkJVTdtdbqpLOWcv7sv1OGHEGR+bsRp
CoWJzpDoK0dRURTeTopI9Ns+neWvXOO+DhqL0YAVUzRg1MlrSygeWm4IpiG64dNd
t6NbeEoe4GohI3Wz/L8aiFgNXM/FZ4SJ3jl9G92G90mUe7z2KZWDQcknW/Hh1Xg3
QfKsgMgWC/uR2QsmOx4pggA4SF8hKr3rEDslA+ncH+fuKPDTHvd+Iba3U5oZm96l
aAHbr7fmvzr0V7r7DlAClT8peuuUrD2kJfPbtpKKQpwgsjl6EENHHrHwLQW3RPAx
ANfsotb2t00=
=r5Ft
-----END PGP SIGNATURE-----
--=-=-=--
