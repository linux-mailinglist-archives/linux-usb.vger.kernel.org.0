Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67E9319AADF
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 13:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732308AbgDALgx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Apr 2020 07:36:53 -0400
Received: from mail-lj1-f173.google.com ([209.85.208.173]:44903 "EHLO
        mail-lj1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728485AbgDALgx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Apr 2020 07:36:53 -0400
Received: by mail-lj1-f173.google.com with SMTP id p14so25377919lji.11
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2020 04:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=0qdZoVeClfsm+MHHycrD5Xma4kaS3r9A2qEXfkZNtI0=;
        b=fRIsE/KEc7NBBi2IbYcagzr5oSN1JZcAO+r/1BgAcfFl0mAA4WHtC0eJcHoQa/gWzG
         37oS5BkAT0SO5FJ+hwePCckHuBk3HrJbMLe4GDN8d0wLnTty5AaEKQc62j5twq5Ui4KB
         iELYl2YM+ubrj0+1KEUpZQw2c7V6IgRHGjTfA9V7AY1TZ/G7ztFnAR7UAij28I57UlBS
         dp8hZhFWGzuMEdJ3ZGoK51svTeUo2UVxQIHRoyQJXp2OKwLSUWVEmmHWZHnNcJEDclFb
         NWY6/7vO7TMIRwAX4DyUcFo4qTPrJs7aYZ+PNgMV3ctOocq26JhXMD8wG3Hi7NTBZTT0
         8Spw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=0qdZoVeClfsm+MHHycrD5Xma4kaS3r9A2qEXfkZNtI0=;
        b=qgniwhQalR51tPtEJd/bxjiDzaRWMdTLwvOlyUncmOhFLl55pwaffLv5ciw70AIkYt
         mFZIW913x7YZeOLTJvovAjsXQeM36QCoPANUXunmWE6dN1vFaOJleWCIYJLqNqV6WREg
         10b/rfMUTJjsWH7/QGt3qpdVtiPBsBthV3oePfkB9Fr7iknoHVrbKK763PQoEXJbCqLq
         KPN1oeuG4rQ1LEHlZO2cSJ45L81DpsilHuaM6RYNNhOSNmmFgHsRl74aPK7R5ZE2+DvA
         GrMpUyr6VbgENhFisWMiWeCZBNOA1XMznrqmgGJW8F2mDalJFajW8KDEekdlwQ9v5GHS
         K63A==
X-Gm-Message-State: AGi0PubXOCisPD23HoIauKstHyKOpLCwTgdb6wZymSi8c9825cQQIeaW
        lwG8CRbAGgDOek1G2Z0kb04=
X-Google-Smtp-Source: APiQypIoYXj1zmTIiQ4jc+bVamihYp+euHg8t74+y1tbfB4oxwsrlyfl+rzoBasa9hAqh+jXc5aNcA==
X-Received: by 2002:a2e:9a89:: with SMTP id p9mr12837370lji.222.1585741011390;
        Wed, 01 Apr 2020 04:36:51 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id b17sm1435754lfa.15.2020.04.01.04.36.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Apr 2020 04:36:50 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Oliver Graute <oliver.graute@kococonnector.com>,
        Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, oliver.graute@gmail.com,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: using cdns3-imx driver on imx8qm
In-Reply-To: <20200401103434.GA38169@archlinux.localdomain>
References: <20200326170109.GA28051@optiplex> <20200327090554.GA31160@b29397-desktop> <20200327095028.GA19809@ripley> <20200327132153.GA31668@b29397-desktop> <20200331142528.GA2246@portage> <AM7PR04MB715728ED4EF3715A7798A5A08BC80@AM7PR04MB7157.eurprd04.prod.outlook.com> <20200401103434.GA38169@archlinux.localdomain>
Date:   Wed, 01 Apr 2020 14:36:46 +0300
Message-ID: <87sghna14h.fsf@kernel.org>
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

Oliver Graute <oliver.graute@kococonnector.com> writes:
>> Make sure the five clocks in dts are correct, and print the USB3_SSPHY_S=
TATUS if
>> timeout still exists.
>
> ok I got this for USB3_SSPHY_STATUS
>
> [    3.057122] cdns3-imx 5b110000.usb3: wait clkvld timeout 0xb0b03827
>
> Unfortunally my imx8qm spec is incomplete regarding the
> USB3_SSPHY_STATUS register.

for testing purposes, you could just have the bootloader enable the
necessary clocks and use dummy fixed-clock in your DTS.

At least you could get something working from USB-side and focus on the
clock tree after that.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6EfM4ACgkQzL64meEa
mQaZ1hAAzCSKcBJEGoGB73g2fZlxFSYm8s+PO2sto7sCI/VFdiha4Hj7ojPDrA3o
vA1jccdjRB8um49iTGq8ZJoFjc3P/5LM6CYnzf839h86O01ZIWlNPPayPFZD6qaK
IGhcCRYm3CUQTcbhj3yqGCOtwGcRqK9TEIcalYVOHqLDFnTPmuei9h77KVBUjAmS
SJO7yTVziBr2jXCaEuYqxhCW6MAGy6jdEMG9yTKkP+U5rHjAbvPbUOxXp6Pc8ed9
GUiHIY7Og+65Jn+EQSkrYRkVfzN/09nCIF1MqYnOUe7DJWmIbsVRFu5I/yqyQSky
NH/NELJ5ugZr787PSz6DHpD/TB7EmccLIyyRfHtwpv/YnVnBsrycqGkHRTCjjYWs
eu8lOaIIg4/iNiwrBuzJQxi7asGofxboK6g/qB5dWrUX8R0RzoqmU3oN9zVdSDE6
89aQ15OOqImYEd7P+0wQZsVIxTkbIwfL71jJvKlX6AIIdAA+9yPEb8J+ZbavpXpA
2qxvqwwKGVKPZdtabjQ/Tends8KBnef2NWgU4cXkSvFvbht+vA2igmPmEc6vfdFA
2AuC60pQ0BqgJAyvjAJ2rbAKCRTi5ETVgHwMNNiuHzVBpKOGZRMyGxAD72wYCKAC
LRfhlGecMh7VFwDzf+CKQ9F3V4mmkZ+RAWSa/HmMoTtZoUPnb1A=
=I7mU
-----END PGP SIGNATURE-----
--=-=-=--
