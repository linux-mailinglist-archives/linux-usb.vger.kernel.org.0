Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 268301D72D7
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2020 10:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgERIVS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 May 2020 04:21:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbgERIVR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 May 2020 04:21:17 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA9BC061A0C
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2020 01:21:15 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id l19so8842668lje.10
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2020 01:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=y4FjeUDbJ7JXN68Ws3FMbELufqj2xEJfI83uvwuD7yU=;
        b=hPYXUUbMBKtP26cvWAAn3YE8QvixqjiVKQ/tA2MLxpwLv+x3y6qwvKCJSvAgLZFMxX
         66JOaTW3rWZvLsoADkXrQMo9Co9w7l2pVTy2N7ugOGuLQxjuHmUItVZnuEHbEpy8x75z
         kr1kMPDJs8ODEEjSVNQo1kbmM9VlBisiQoC0z4eXej3g5d1JnEbzwnICGCWvA+bU9u4Z
         KaHl8BD2lADrjnC0CzHBw5WtccntcggUBn8KJ6uIey3wuU8fjlH+QINgq41pe2E6CsHR
         yggmVPt5mzgECK3zP6t7XpFRp/4ICCu+qBiFGA6R+Of96VNMo/+AkGqbkoXMWT2fDs0z
         8xpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=y4FjeUDbJ7JXN68Ws3FMbELufqj2xEJfI83uvwuD7yU=;
        b=Oc0TpvJxJBD5+dJZA3+TtvOnRksA+8acSMf0gFqdExbBMUmGY/k2evLdWTswTv6pvy
         KeDCRyvSmwCXUnUid9F0kxCV6zhOB6ZjLIetlZ5UdW/Fwj5tT1h0czPRdpbn8vnDBND4
         YE40bdQfTwj1MPmWaycooKB1AOzBd80R6/GrMcZDsdqij0Z+vyCp1mLs+8K8FVfNa9tY
         ZcN/tlBnoZyIC9i6EsVx29bHa4tya8t1jARLb2AGHAUJC/XsNUbK40iAizxCkSlom7KU
         TZ5YWJTip8hKD1afc4TT2rtv9B3zFsK6Lqbq+89Nyf0f0J7kMcNGGhmvqDEBXBxXFOYk
         e1Nw==
X-Gm-Message-State: AOAM533vkzoNNDljX3XJqJhdl1KdiuevRIJwukMa28EaUE045jNQeC5P
        EEmB+DaA7gQOhRqBadPZ1UNUhpa9TxqSIg==
X-Google-Smtp-Source: ABdhPJy9VdW5yIWAM5Wba8ZNE6xpc/ZnCC6xprbUynEbCGZ3/uWRDdfb5ndBrJPIV3X1VglK2Q/POQ==
X-Received: by 2002:a2e:5710:: with SMTP id l16mr3702860ljb.171.1589790074057;
        Mon, 18 May 2020 01:21:14 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id y130sm2527664lfc.22.2020.05.18.01.21.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 01:21:13 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Peter Chen <hzpeterchen@gmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell\@cadence.com" <pawell@cadence.com>,
        "rogerq\@ti.com" <rogerq@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH 1/1] usb: cdns3: ep0: delete the redundant status stage
In-Reply-To: <20200518035015.GB27612@b29397-desktop>
References: <20200426130751.32556-1-peter.chen@nxp.com> <87368ebz3d.fsf@kernel.org> <CAL411-q4euWFrJ5Sp+tocBEsXXYkviQXt_pz_SyHHC=ELNf_sQ@mail.gmail.com> <87ftc135i3.fsf@kernel.org> <20200518035015.GB27612@b29397-desktop>
Date:   Mon, 18 May 2020 11:21:09 +0300
Message-ID: <87367xy7pm.fsf@kernel.org>
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

Peter Chen <peter.chen@nxp.com> writes:
>> >> Is this working against USBCV? What about LeCroy's compliance suite?
>> >>
>> >
>> > For NXP USB certification flow:
>> >
>> > The test mode is only used for USB2 electrical test (eg, Eye diagram),
>> > The HSETT tool is used for device mode which will send command
>> > from Windows PC to let device enter test mode.
>> >
>> > USBCV is used to test protocol level, like USB CH9, Mass Storage proto=
col
>> > etc.
>>=20
>> Entering test modes is part of chapter9 tests, IIRC.
>
> No, test mode is only used for electrical signal test, the communication
> between device and host will be stopped once the controller enters test
> mode.

but it is a standard request, part of chapter 9 ;-)

>> > For Lecroy's compliance suite, we usually use it for Link test for
>> > USB3.
>>=20
>> You need to run the HS compliance suite ;-) USB3 devices must still
>> comply with HS/FS/LS.
>
> No HS compliance suite. Lecroy Compliance Suite are only used for
> link test and PD test. I attached the test items for compliance test.

hmm, maybe they dropped it over the years. I remember using their suite
for this very reason. Oh well.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl7CRXUACgkQzL64meEa
mQYmsRAAq3/MepwsmYAF6FBAnKIQN534DJkgdSoTUCnAmDhO25DNPj20F6ODzbRG
QAtUI4IlM4Crlo1sDZCQ+Pw3JOGBuXhdXbLdUVBiGxw+pUqQ+zuRjav2LvS8hUji
iB74GRZy2pFL35bwNJ7ppXfpVdW0ybkCH3JFFUWTRcTNypI3ftCnGV+tZ7/LHryS
I1R2X13wvd4zwHvchSFehxNM54EynvfisSeggYfH6T9G5SLmOf6cmyg0JdyUqnqQ
0nPrmjQDe1bRJ6yb3/DU2czbDg1dzgjavDnuMfImVqIrG6CIPBHwGU5N0uqNoPpm
AgMwnDU3jKdvUxD6Iws2lGEHLtCsM7q4hw26h5+0JpUoPwkEpnRNXMTbWJ/dpwUU
CEFuK+QUjf763ZhVi9Qh+KGn6+7HMTzWlvgmio81BBlR2nKqFrQ6sYS3gTxXd0SI
0YI4YLPnCLjaFo4rXUA3Pi9KQQHz6rEgt5+E14JP6GjlXkvS+cZF71QYo5USPCGY
ZDk29i82haZif+uh70ywr3iTcd8hiSdJq/u27Br2ItgiEHLerpe6Xlclg2mAkilr
60qZxdoUK3alFYP1Lf6VioS0dw2rsjp1yqU2I3z695ofqYWsiF/RdFB5keDOFnV8
YuASwGwCKZ87dG4xYK2ia8s1H3h+NqIGR9tEn/vOkICKHoV7Xjg=
=y/Mh
-----END PGP SIGNATURE-----
--=-=-=--
