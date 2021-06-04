Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 869A939B1DD
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 07:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbhFDFRp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Jun 2021 01:17:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:37824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229831AbhFDFRo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Jun 2021 01:17:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7070661263;
        Fri,  4 Jun 2021 05:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622783759;
        bh=B7joCF5zRIv2Emfvgfrk+2AGNdJL3EHOBlZtSrf2HTo=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=RKa5eIUzdjHI7GWbmR4qP5e8bGWpBoHm1NN5Gfdjz2Tn0gsQWkhuHs07tZf647hBx
         u8bgz3Hd24DMRoEz07taEFj3MbiwgLEzke7GfTKlIjqp79+8JX1t5y1bwTyCt+RSZb
         Ul/LHnA/uYAv4+sxFAhUHoM87wpsh4YSTJU6KU/L7Njqk0Vet4w4iGHXYyIMoDxXFE
         jhfAl1DiAmDdtQohi6IqDCOSK7nTCD0sxBY+qJiT425JfHgYuuwr0MEDlhSPtgitzs
         zwK8YR7VihZu+i+wv7a2eEc3TAO+P0sYJ9n64cer2qMxkGFbK4VyFDtZibfmEfbYYc
         XSZdDfPRshhjA==
From:   Felipe Balbi <balbi@kernel.org>
To:     "Chow, Watson" <Watson.Chow@Avnet.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [BUG REPORT] usb: dwc3: Bug while setting the USB transfer
 bandwidth on UVC gadget driver
In-Reply-To: <c64f050b25d445ec8342ac25f7a563a4@Avnet.com>
References: <6bc8ab9c4e3f4bafae13a7574b1ae0e3@Avnet.com>
 <87r1i97pkk.fsf@kernel.org> <4c354460a55e40c9938a1fdedfa62144@Avnet.com>
 <878s4h7giv.fsf@kernel.org> <9e8d9a55a0e64ab092ceb464db5f0119@Avnet.com>
 <87zgwu53jc.fsf@kernel.org> <c64f050b25d445ec8342ac25f7a563a4@Avnet.com>
Date:   Fri, 04 Jun 2021 08:15:51 +0300
Message-ID: <871r9icirc.fsf@kernel.org>
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
>>>>> 3. You suggest me to try on kernel v5.12 or the latest v5.13-rc. It l=
ooks not
>>>>> easy in my side to upgrade the kernel version. It would affect those =
other=20
>>>>> device drivers I'm currently using. So, do you think there's any shor=
t cut=20
>>>>> to fix this problem under my current kernel version - v5.4?
>>>>
>>>>In that case, you need to ask for support from whoever forces you to
>>>>stay with such an old kernel. I believe that would be Xilinx.
>>>
>>> I have a thought to back port those changes around the dwc3 and gadget =
driver
>>> from the latest kernel version to my kernel (v5.4). Do you think this i=
s=20
>>> feasible?
>>
>>should be, but it's likely quite a bit of work:
>>
>>$ git rev-list --count v5.4..linus/master -- drivers/usb/dwc3/
>>257
>>
>
> Upgraded the kernel version to 5.9, I can set the g_webcam module pararme=
ters
> as follow (for max bandwidth):
>
> streaming_maxpacket=3D3072
> streaming_maxburst=3D15
> streaming_interval=3D1
>
> Data transfer with above setting is working now - tested with dummy data
> generator in the uvc-gadget app.
>
> This concludes that kernel 5.4 is too old for DWC3 and UVC gadget driver
> in high bandwidth usage

Cool, thanks for letting me know :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmC5twcRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUjgJAf9FWVbQK8uBA5gwZ2C952vQxmlIySMu5cy
TUssVNv0uE0HH6FiXxKP5JmEOAikLcDQhX1B+8st9nqvqfvIhxwUhzicuMnmwol7
QzfS9Cuqvgx19kyIXIufwGw7ozJ7tPmBkJwJqre+tV3/SIcWycvIvwHAv2N5QS6R
pySw6/9ix6Al9FWvR+vXVl4sgPEd9sJsT7yrNLJTokSZw0JEOuL+eVTosNs1VtKQ
ku2YQuCqoFIcfSsE/Q1i4Y/WvmiDraQdfkSSlKgrmOACySLs6kxNlQsfLEwfkE4o
d1ZuI+97Xx6AQddZrQwZletkIYK3QrmEGphlPUT7mwh/Qt1NzvramQ==
=+GnV
-----END PGP SIGNATURE-----
--=-=-=--
