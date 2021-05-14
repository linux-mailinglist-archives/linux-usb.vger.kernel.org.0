Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECC1338073C
	for <lists+linux-usb@lfdr.de>; Fri, 14 May 2021 12:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbhENKdV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 May 2021 06:33:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:42908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230375AbhENKdU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 May 2021 06:33:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C3E3613B5;
        Fri, 14 May 2021 10:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620988329;
        bh=lnBPNR8YzGpc23fB/WUkdgFbUwRLsBqZB65u8nAakRg=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=iMlui5xLUSDWhHwFQDOsXBqj5YC73nxOlBGHKTprOgHUbFr/YIy4+SfNysPErW4NK
         o8yUVkbwZ5oz3FsjQ2b6pd/+h/bPRxonY/Trp7sm9dF/16c7fr8vVAM7Xl57VnZYIP
         SAf0Mi8vxTMt+/4dIznyA96WMvneGoaa6IIpNk1nWnFmEsNG5OlBFfm4a0rYcKq5eg
         iQaUbUw+xMMUnWxUOJXzvvcgFIwXcVpV8eTN3Qs9UjY6k1hLsytFbGnG78IQPYDOXC
         3xJfZk4JtRvSrJtafjRidpNhhYpXzIe7x2meDz7O17Q/yM/Pm23AYlURgh7JkC/0LG
         Qq2rDmPzKzP1Q==
From:   Felipe Balbi <balbi@kernel.org>
To:     "Chow, Watson" <Watson.Chow@Avnet.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [BUG REPORT] usb: dwc3: Bug while setting the USB transfer
 bandwidth on UVC gadget driver
In-Reply-To: <4c354460a55e40c9938a1fdedfa62144@Avnet.com>
References: <6bc8ab9c4e3f4bafae13a7574b1ae0e3@Avnet.com>
 <87r1i97pkk.fsf@kernel.org> <4c354460a55e40c9938a1fdedfa62144@Avnet.com>
Date:   Fri, 14 May 2021 13:31:52 +0300
Message-ID: <878s4h7giv.fsf@kernel.org>
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

(please don't top-post :-)

"Chow, Watson" <Watson.Chow@Avnet.com> writes:
> Balbi,
>
> Thanks for your quick reply.
>
> Some questions
>
> 1. You mentioned that the max bandwidth in isoc mode (USB3.0) should be=20
> around 4Gbps.=20=20
>
> I have the below calcuation on bandwidth:
> In USB3.0, 1 micro frame would take 125us and can transfer max 45000 bytes
> So, in 1 sec, we will have 8000 micro frames
>
> Max bandwidth =3D 8000 x 4500 x 8 =3D 2.88Gbps
>
> Is my understanding correct?

probably, It's been a while since I've dug through the spec, to be frank

> 2. To achieve the max throughput, I need to configure the uvc gadget driv=
er=20
> with below parameters. Am I right?
>
> # modprobe g_webcam streaming_maxpacket=3D3072 streaming_maxburst=3D15=20
> streaming_interval=3D1

right, but there's an assumption here that the gadget will be able to
feed data in a timely manner.

> 3. You suggest me to try on kernel v5.12 or the latest v5.13-rc. It looks=
 not
> easy in my side to upgrade the kernel version. It would affect those othe=
r=20
> device drivers I'm currently using. So, do you think there's any short cu=
t=20
> to fix this problem under my current kernel version - v5.4?

In that case, you need to ask for support from whoever forces you to
stay with such an old kernel. I believe that would be Xilinx.

> 4. I read through the procedures to capture debug info by debugfs. Howeve=
r,
> in my test with "streaming_maxburst" set to 10 or above, my system would=
=20
> crash and I can't pick the log from that point. Any suggestion?

have a look at ftrace_dump_on_oops.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCeUZgRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUi5DAf7BoMm1Jjaboxzn2+IxooqRKUjHV4jCXPn
MJxqdGYPoBb6K6YQiXdakpknwHxfc8inieVKqo3ttXWPBOvsA5l+h6lgErH07ETs
rUOCtKOagsg4YF/vu+b8148ZGokl2H3PQxs3Q3zjBGZ2dzTV8Pfdm5Svxbj8IMvw
CLaTMzmdtWzk1gDdNFinNqaKz/IpeysaVRBe+u2zknH6EyB2Yu2JiSlK+5FCl+14
nn3NCo3AKciAA/BvRCePsdZrtUMY8Etvsg4xFgKQ0nNAcdPIdK0SuR5IJoPeVDHe
1T/RRYCxWaDXEA045mq8p4CjvE+ZreFvtmG0/INixTEYGqHblOyJ8A==
=RkZt
-----END PGP SIGNATURE-----
--=-=-=--
