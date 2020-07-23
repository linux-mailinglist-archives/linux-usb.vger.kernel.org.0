Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC8722ADD3
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 13:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbgGWLgv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 07:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbgGWLgv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jul 2020 07:36:51 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADF0DC0619DC
        for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2020 04:36:50 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id q6so5960077ljp.4
        for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2020 04:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=65igqvPf2RECVzhmcmx44ADygdWlArWUGY40cVbFPRU=;
        b=bEKLG+fR5AN2/vo75qSuUQHZC3uwTEw9RWJmXLbmSs3fF6vklkdeNGo7GKAPGMrzco
         WlZ7KkYg28IcsdnlUPKDQ9oyWA9CM+V7+I80Qxc9eGDBJEfesJIOTECaOJNEAQW0ltoH
         WK6oFkZr3fHWUof7oIkipvBjhH9kt7lUN30Zmr1S7qXznf6AI3WVX7baOIFNBYpnbkQW
         rw4qeL0ewuUQnNCw7nuhNundntcGXxBkBY+A9cp4IC8EG58uPPMX75SaQvFxSzF8m5nV
         Y5kX5cXLIPByiK5TvH+ituuyOQ7SpSa8iv0Q3/Sl27CXTQT7H9YVOrcwqfVCJp0ESnfL
         BYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=65igqvPf2RECVzhmcmx44ADygdWlArWUGY40cVbFPRU=;
        b=IW9GLUHIy2jRRXujQsvgwQEiovpchU1I1xw1ujVx1VCGH/WcZMchE0L0y99eLWqchi
         IhQuY3q29WOqWqSUtIDxKQH1vIKDqjGZoyntSOZIlZBCk/i+9LUTkvJFvEnDPPBCQfsC
         3lUDriyz7nPaQ64OrbAIsFHZK953clgK7qE04uPhCzl59ozJivxykajMgNd6B8VsKV/n
         HzAdW5vBrQqwzIy8vUBBeYUnXaUt3humqzhvQkkMlKxVv9baEYKlA9foTTbqbsc3DGhM
         FUJPXzDmuRRTwnyrsTdkZ+yybss4ZYQG6E2soTxYC2MtcNvP3GADS0fiL9glm6Cz3dbG
         Q+Og==
X-Gm-Message-State: AOAM532FKgiOrCQ7QPnzWDWUbyhqqu5aguYSDhzqreJB+2jxT/sv+dCd
        bGelItOAxXyEXOLV8B+vtKgSqh6jCV62ng==
X-Google-Smtp-Source: ABdhPJx/RljklVNig36kpA7s5H+fQbHO1NkAa1tqTWUBwm80yXnJiJsvaCYzL5EbfjNU4JboupoIyg==
X-Received: by 2002:a2e:8e36:: with SMTP id r22mr1836442ljk.77.1595504208893;
        Thu, 23 Jul 2020 04:36:48 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id p8sm2593584ljn.117.2020.07.23.04.36.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jul 2020 04:36:47 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>
Cc:     Linux USB <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: f_uac2: fix AC Interface Header Descriptor wTotalLength
In-Reply-To: <CAB=otbT5x5qoPedo854b0e-+Tcw1+i7UsJ6kbBBQRPrSMMtsfA@mail.gmail.com>
References: <20200703134903.5695-1-ruslan.bilovol@gmail.com> <87r1tl6vn0.fsf@kernel.org> <CAB=otbT5x5qoPedo854b0e-+Tcw1+i7UsJ6kbBBQRPrSMMtsfA@mail.gmail.com>
Date:   Thu, 23 Jul 2020 14:36:43 +0300
Message-ID: <87mu3qo438.fsf@kernel.org>
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

Ruslan Bilovol <ruslan.bilovol@gmail.com> writes:

> On Thu, Jul 9, 2020 at 9:38 AM Felipe Balbi <balbi@kernel.org> wrote:
>>
>> Ruslan Bilovol <ruslan.bilovol@gmail.com> writes:
>>
>> > As per UAC2 spec (ch. 4.7.2), wTotalLength of AC Interface
>> > Header Descriptor "includes the combined length of this
>> > descriptor header and all Clock Source, Unit and Terminal
>> > descriptors."
>> >
>> > Thus add its size to its wTotalLength.
>> >
>> > Also after recent changes wTotalLength is calculated
>> > dynamically, update static definition of uac2_ac_header_descriptor
>> > accordingly
>> >
>> > Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
>>
>> Missing a Fixes tag here.
>
> The issue is present since this driver introduction in 2012 in the
> commit 132fcb460839 "usb: gadget: Add Audio Class 2.0 Driver",
> but in older version of the driver it should be fixed in the
> uac2_ac_header_descriptor structure initialization
>
> Should I resend this patch or you'll add this tag to the commit message
> by yourself:
> Fixes: 132fcb460839 ("usb: gadget: Add Audio Class 2.0 Driver")

added, thanks

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8ZdksACgkQzL64meEa
mQZ40g/+LVEZaPsGDsHHIbafn/ePS5CR8B9Xuk0U3hW53/7M5At34NCUzd68YmDN
ph7PcsOQrsGk/SG2kMF9qBMNAF8WFjS9dXj5JhFIC/keWgo7Qfd9Fxgz+PPFLHDQ
Xo/X2SbnmPMuAzQmaO+AMmLBOwogJFvhrlrQSl5vXEH0ya2R2DvZ/gwluDeua8bd
aToLUn5yzAqALdcN9avYgmKz8cEGz12AR7G8xPX2FbuSub5dFt1josMfYAytNwXS
8D0fNJHZ/KU1ggYvvPrPU2RQI5qT/O0ydOlSKbauFuIxDHtcHwG/JTmkyFfk/ybn
4QupPNUTC9+xMwr8puWtFFbXI0WqXbsa+JwrrvAdQSC4bUpi7Iq1LvUoNp8TN6Lr
SwCHyY9jKvv5zDg/iixHe78uIfT0KyVhM0exch1q2qLFaNIQ132vT1yHrB2pDb21
hATvDRVXLde/4Uf1PBzV66IVgnsm/b7jjADzl5QjXo9OCoi6XnS6CqKFlxTnbAId
qrviLktP1K2IvrIEmvo7hIbCQpRNhtIw2N0UZetrK6NWhhwhQhaFvcRqi3ZnpKF2
FTu0nQmBNewnO4EqhB3IrjhklFr4rUIliTwGvSfrsMLtrHoW+lhED/oIPzmBYnjy
WS3LB9Z/tSV0hkWlRfb6cYjEk9+C3QqXd7RMluMRtMxbNxnHSu8=
=gXyI
-----END PGP SIGNATURE-----
--=-=-=--
