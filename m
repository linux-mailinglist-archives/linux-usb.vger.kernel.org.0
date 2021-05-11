Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A285537A394
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 11:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbhEKJ2D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 05:28:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:44332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231222AbhEKJ2D (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 May 2021 05:28:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 48590613C0;
        Tue, 11 May 2021 09:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620725217;
        bh=kKFzHMfxkdL8bsSXm/GlAAih6jsbq/I+Gfl9YAD7Gw0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=cycZD0diOZJtPgiEBm5DacD5N7OVgyO0zGo4TMhEQv3uktfr+xgi7b1LsaZYeBchL
         blHdKxyLAcYW4VicZiHMzpoCjgV3kqsXznJoc6yIe79JaFtvRg++nTzA/oTiU8zssN
         0LiTKZngses1I4G9Jr6LjknR3PEtz8bmxXYkEiNbSjlPVff/HCyY5e6p6KSL0xlNkR
         eib1I3HM/Gqq0CwGpQWROAzVPuxtl0B22lWOXxv9YKIg45qOkboHOKWNCsbOTbqjZD
         0phEF2C1314gr9nszZ9GoXc8D0kwcgXdGN1J0WEkK+9l4x+2PqPKhjUWlJ2iqTN8Y4
         TepV+X6Ipui0A==
From:   Felipe Balbi <balbi@kernel.org>
To:     Jun Li <jun.li@nxp.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "thunder.leizhen@huawei.com" <thunder.leizhen@huawei.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compatible
 string
In-Reply-To: <VI1PR04MB5935DE5731476311DE94009A89539@VI1PR04MB5935.eurprd04.prod.outlook.com>
References: <1619765836-20387-1-git-send-email-jun.li@nxp.com>
 <8735v8ji31.fsf@kernel.org>
 <VI1PR04MB5935F1D26E1F281B7273993F895E9@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <87r1ishz2t.fsf@kernel.org>
 <VI1PR04MB5935825AD977B4180894541589589@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <87h7jggch0.fsf@kernel.org>
 <VI1PR04MB59354B7D5843B612D50937B589579@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <YJo5Tl7SDuv4Yu6D@kuha.fi.intel.com>
 <VI1PR04MB5935DE5731476311DE94009A89539@VI1PR04MB5935.eurprd04.prod.outlook.com>
Date:   Tue, 11 May 2021 12:26:47 +0300
Message-ID: <87o8dhfwo8.fsf@kernel.org>
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

Jun Li <jun.li@nxp.com> writes:
>> > > > Good suggestion, but if extcon notifier listener can't work for
>> > > > me, my understanding is this *teach* in glue layer driver still
>> > > > need access
>> > > > dwc3 core instance struct, right?
>> > >
>> > > for now, maybe. But it may be better to implement a notifier method
>> > > in role switch class.
>> >
>> > I am not sure if introduce notifier in role switch class is a good
>> > idea, I had the impression extcon is not encouraged to use if possible.
>>=20
>> I'm not against role switch notifiers. They were proposed before already
>> couple of years ago, but at that time there just were no users them noti=
fier,
>> so the patch was just dropped from the series [1].
>> But I don't think anybody was against the idea. Please feel free to add =
them
>> to the class if you have use for them.
>
> So I had the incorrect impression.
>
> Yes, that's the Felipe was referring to, I think.
>
> I will pick up [1] and improve my driver as Felipe suggested.

sounds great, thahnks Li Jun

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCaTdcRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUgQiwgAobJTCBmvEXlh32RfwlFOvb6yeVRxrm0n
9Q8dxwkB1QecD4aKUcT+5C7VwW4DpUwklwolDJvpyb35nu5tm1FUReay8gJ5AKgK
yUuWTz43QCDhJYzXLni9ZABGH/olcUwzH6qDryqQGHdTUYaz4YyVQHZ/k7VFjTXZ
JSdWmJh9oCuDTtBrTKngAcJkLMnJsoBxL5JHVpEoGTY22IFdhFVhikezXdGDgIIS
/ALgg7jj2//oIN8yCS4/LNorLmPFWm4NmLDCnnnF+G82AJJKoj/ZztouidEOCgx2
CR/m3RShFAzIgajFf30UK/yQpEQfoGD/CXBAxob8gZsufMYZNc0MUg==
=/JMz
-----END PGP SIGNATURE-----
--=-=-=--
