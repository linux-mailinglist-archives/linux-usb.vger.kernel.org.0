Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4EB93823B9
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 07:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234255AbhEQFdb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 01:33:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:50228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232343AbhEQFda (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 May 2021 01:33:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 59D4B60FD7;
        Mon, 17 May 2021 05:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621229535;
        bh=3WUSAQpfnVl4CyirhaRFz1tkrF0ZSDo3z3ZhFe9SLmI=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=O5M2bLKLm5fJ/yktDuD+aMpmiZl3a2BoTDIeBhcFdG9lBIVw9SgB7k3QMXWokNgcp
         WvZnuo7rMTjGRYTu3Gre3gbE7Qjhel4Wq3tAjSTjI5Z3NqCGzi9Qnnjpd41M3YLkvF
         T0eSeznGCHCSWuw5H3YolV21Es7EhrL6f4WodhJrhTBLe/jWMmLyjVnM05aLltnkY5
         sPgluAhjv3tXz2MErLDohGB6keRkdXIVnU1iApQszWNvB2BG7uapj7sfyIq8Xpm5qY
         sVBSphWOWUP1x7NBCwJwS2whpP7zno+uqlFH3Sqcqv0Nxo/liRP/X+ZWVouma4Drmh
         BwYFHCsxEkOkw==
From:   Felipe Balbi <balbi@kernel.org>
To:     "Chow, Watson" <Watson.Chow@Avnet.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [BUG REPORT] usb: dwc3: Bug while setting the USB transfer
 bandwidth on UVC gadget driver
In-Reply-To: <9e8d9a55a0e64ab092ceb464db5f0119@Avnet.com>
References: <6bc8ab9c4e3f4bafae13a7574b1ae0e3@Avnet.com>
 <87r1i97pkk.fsf@kernel.org> <4c354460a55e40c9938a1fdedfa62144@Avnet.com>
 <878s4h7giv.fsf@kernel.org> <9e8d9a55a0e64ab092ceb464db5f0119@Avnet.com>
Date:   Mon, 17 May 2021 08:32:07 +0300
Message-ID: <87zgwu53jc.fsf@kernel.org>
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

"Chow, Watson" <Watson.Chow@Avnet.com> writes:
> Hi,
>
>>Hi,
>>
>>(please don't top-post :-)
> I have tried my best to meet the format requirement

Thanks

>>"Chow, Watson" <Watson.Chow@Avnet.com> writes:
>>> Balbi,
>>>
>>> Thanks for your quick reply.
>>>
>>> Some questions
>>>
>>> 1. You mentioned that the max bandwidth in isoc mode (USB3.0) should be=
=20
>>> around 4Gbps.=20=20
>>>
>>> I have the below calcuation on bandwidth:
>>> In USB3.0, 1 micro frame would take 125us and can transfer max 45000 by=
tes
>>> So, in 1 sec, we will have 8000 micro frames
>>>
>>> Max bandwidth =3D 8000 x 4500 x 8 =3D 2.88Gbps
>>>
>>> Is my understanding correct?
>>
>>probably, It's been a while since I've dug through the spec, to be frank
>>
>>> 2. To achieve the max throughput, I need to configure the uvc gadget dr=
iver=20
>>> with below parameters. Am I right?
>>>
>>> # modprobe g_webcam streaming_maxpacket=3D3072 streaming_maxburst=3D15=
=20
>>> streaming_interval=3D1
>>
>>right, but there's an assumption here that the gadget will be able to
>>feed data in a timely manner.
>
> How does the DWC3 driver or the gadget driver handle the case with interm=
ittent
> drop of the input video streaming?
>
> Any recover mechanism?

yeah, the missed ISOC is reported to the gadget driver and that has to
queue new requests.

>>> 3. You suggest me to try on kernel v5.12 or the latest v5.13-rc. It loo=
ks not
>>> easy in my side to upgrade the kernel version. It would affect those ot=
her=20
>>> device drivers I'm currently using. So, do you think there's any short =
cut=20
>>> to fix this problem under my current kernel version - v5.4?
>>
>>In that case, you need to ask for support from whoever forces you to
>>stay with such an old kernel. I believe that would be Xilinx.
>
> I have a thought to back port those changes around the dwc3 and gadget dr=
iver
> from the latest kernel version to my kernel (v5.4). Do you think this is=
=20
> feasible?

should be, but it's likely quite a bit of work:

$ git rev-list --count v5.4..linus/master -- drivers/usb/dwc3/
257

>>> 4. I read through the procedures to capture debug info by debugfs. Howe=
ver,
>>> in my test with "streaming_maxburst" set to 10 or above, my system woul=
d=20
>>> crash and I can't pick the log from that point. Any suggestion?
>>
>>have a look at ftrace_dump_on_oops.
>
> I will explore how to enable this
>
>>
>
> Btw, do you know which SoC platform can run the UVC gadget in max through=
put.
> Raspberry Pi/TI Beaglebone/i.MX ???

Raspberry Pi uses dwc2
Beaglebone uses musb
i.MX, I think some of them use dwc3 at least.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCh/9cRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUjsPQgAkgP2nZcJIHeYvr1ZRaDGiaLO0DjfRPG1
nBAA976I17y7xSsdYucIPjFc6q6RcRBhVcjqcJndJWiKNVIucacyPrF7BRw+ON8D
r5GFBywkFZJl5o8zvRQrXHy4/4dQy6UGr6MpvOysPvvrzxDGyaj+CGR2JU1JaWQM
waJnvWZkYY2VRqrqr4xjSNKhJa1az+B1G0MQAraOZHgkzl1K2OQcscMo0NrbBmAM
M2Tc+DtPB98YlvQ+g4SDj7/KSrQeswZ5qIdgqE0Fep1ABZh54NTFRtQQh8o0vabj
LWKEO/qfVgKmQSjTg8qDG4cDYIaE5QTb3aHzZxZyN99TNmUKSmbXHA==
=mWUr
-----END PGP SIGNATURE-----
--=-=-=--
