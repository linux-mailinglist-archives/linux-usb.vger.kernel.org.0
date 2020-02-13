Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4C1B15BD2F
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 11:57:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729466AbgBMK5n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 05:57:43 -0500
Received: from mail-lj1-f172.google.com ([209.85.208.172]:42967 "EHLO
        mail-lj1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgBMK5n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Feb 2020 05:57:43 -0500
Received: by mail-lj1-f172.google.com with SMTP id d10so6054446ljl.9
        for <linux-usb@vger.kernel.org>; Thu, 13 Feb 2020 02:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=wuMzUFOAyU8DG+tZmUCNe+svrK0kBwOtN80LCt/Sr+c=;
        b=GXre8fSjk6NXlZMiIRMGzkNXFU9iMmlT6g3TvtUkOniZJq5Ajzn4oNLyQTmVnoMDl6
         gSXuZOzDT323bgh+N3TgpEJ7+CKdD0H8cY3OLQ8lUJnZEwVi7DZpwgwA/ydYthm7SCKT
         7a7Uc0lAoXYiSYRV99UICuDj0D1VEAyf9tx8nRoudG7Va8aKPToj8J0KdR0i0hwwV6/6
         Cvt1pm0/kK5AQXFNVLQe5UYAU1cUdvR1NVHAvv4RTdCkeln1fPMF8McNBaaAuP6TrUWe
         GGEC/63YRwOm4btc6sqlw/AJnQta0HeRvENb2NONrDdbyIRLzV89G3J2C8P6p5cR80j7
         L9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=wuMzUFOAyU8DG+tZmUCNe+svrK0kBwOtN80LCt/Sr+c=;
        b=jMpAwS/x8oOMYbDs1MvRKp7Io6hufnRquB+LzatmzeRxugmuyPlKB2L4D3e1FI6lcO
         K6kJgLJKDm5Z4tEkiAQrnCTDfww8sVezDt6mEzJs6kDFPbWxLbTrREcG4iU4r+mEpQ/c
         n6hytu0oChwjekKZmnzHOjbcOMX6/VeSBV9dj52u4Zx964aOjmuAWnpVGWLpx0VPZgOw
         7STy6YA0hglykzw0kYUuPj6ultGmjtdEqarOTXNXOfUxg9fJOl/7+cyWWqGWbD3RBDok
         bEnF13GSFNA5HuMdDoUfWJh9tjuR7BxSqIkuspY2M/AW/2nn7pFiptYfk/8V+RdiGdx0
         6ORA==
X-Gm-Message-State: APjAAAVzR+mLhtmD+nou0xAxln7boDpn3JI70hIbsllv1niHBkposkxy
        vdaQ6O/ieyrdUEb8JNjdaBw=
X-Google-Smtp-Source: APXvYqyAteMTTcFoij7w7091tLKf5vvdkoYzS+v9G/3if/FEKRR9CMsmuWX1IcNITfgZo5z/7To8Lw==
X-Received: by 2002:a2e:8188:: with SMTP id e8mr10898152ljg.57.1581591459821;
        Thu, 13 Feb 2020 02:57:39 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id v7sm1187495ljd.12.2020.02.13.02.57.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 02:57:38 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Pawel Laszczak <pawell@cadence.com>,
        Peter Chen <peter.chen@nxp.com>,
        Jayshri Dajiram Pawar <jpawar@cadence.com>,
        Rahul Kumar <kurahul@cadence.com>,
        Sanket Parmar <sparmar@cadence.com>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "rogerq\@ti.com" <rogerq@ti.com>
Subject: RE: usb.org CV MSC test for CDNS3
In-Reply-To: <BYAPR07MB47094E9FB1CADCF189BA805DDD1A0@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <20200213092051.GA11142@b29397-desktop> <BYAPR07MB47094E9FB1CADCF189BA805DDD1A0@BYAPR07MB4709.namprd07.prod.outlook.com>
Date:   Thu, 13 Feb 2020 12:57:28 +0200
Message-ID: <87mu9mrbzb.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

(no top-posting)

Pawel Laszczak <pawell@cadence.com> writes:

> Hi Peter,=20
>
> Which version kernel exactly do you means ?=20
> In v5.6-rc*  there has been added stream support. I didn't check it with =
CV MSC.
>
> On 5.5 the CV MSC passed some months ago.

How did you load MSC gadget? Did you have the stall flag set or cleared?

I see that cdns3 doesn't implement set_halt for ep0, that should be
implemented.

> #define DEV_VER_NXP_V1		0x00024502
> Did you still use controller version 0x00024502 ?
>
>>Hi Pawel,
>>
>>Does the upstream version Cadence driver pass CV MSC test at your
>>side? I met an issue for =E2=80=9CError Recovery Test=E2=80=9D, It needs =
to clear halt
>>for ep1-out, but ep1-out=E2=80=99s request is pending. After ep is reset,
>>and set doorbell again, the transfer begins at once, and receive TRBERR
>>interrupt, but the host still not sends CBW, so when the host sends CBW,
>>the device side can=E2=80=99t receive any interrupts due to there is no T=
RB is
>>pending.
>>
>>Call __cdns3_gadget_ep_clear_halt for OUT will trigger TRBERR interrupt,
>>and advance the TRADDR value if there is a pending TRB, does it be
>>expected?
>
> I don't remember such issue on my side but the spec say:=20
> "After endpoint reset the software is responsible
> for it to re-set the Endpoint TRADDR."
>=20=20
> Re-arming transfer on the same TRB should not generate TRBERR, it's=20
> means that probably the TRADDR  advance to next TRB.=20
>
> What about saving TRADDR before making reset and restoring it after reset.
>
> If it works we will have simple change only in one place.=20

tracepoints may help here

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl5FK5sACgkQzL64meEa
mQarHxAA0gJqUB0mbN/oF0Pruim0C2Ou8/WUclPkV12bUbEGlmQCmmuHoHqv+Bw+
WnMltpwoCSv50VVBc16SmP3JTqFfrp9nsBBcDcrGisdNx3CWqucohV6VM6RIMNL9
Uf9AXq0Gd99+xHzGlFTGF7XlBhfyPW3TeuqF+pF6VuRf0DPEG3xfIthLQ4g/YQvR
NZXbCyYCalcc/uJqHXhThtCSVJUpf9DQjx1TcTbyL2IiRLT43VU3keizc3zi2Dg3
GIp5EzRFkthk88msCAp1nRhjQN7jlZ8HV1Zj8pDZOFOjYp6whog7cGtZfMJ3pCPe
9rZCXqgdq8i9RtfZc4XNPLU/0xK44DgV9rK5C0Yr282pOFVpG44U1UHRWeuCjvHe
7C0KuY4jytw1ska/gv54Qk170QsFPtoBeE06TWofp/VXy1E842HBp+WimAfOI69L
uoSowEHz03ugEhUepuISLyD1Riw/MMlFZrSXp34h6Q0DRuCGtqTS5WZpXTq3u+3z
ctpIxNvnXU5tojeaedxT4LIQzh0MgYRkdzRAGiW6XDqC4NstLCvUcm8XVSo5m2yB
kjgCXsO/dQV1cVo3upVn7zORE/sXDev+a8riC4sSnkTPYKhk7lfdsZ7okvrDpjnf
sF4P5FEa7fr/Xvr5cXhkZR7Y6ceH82VLLy4rlk//Ol3FMKHVsVM=
=Xct3
-----END PGP SIGNATURE-----
--=-=-=--
