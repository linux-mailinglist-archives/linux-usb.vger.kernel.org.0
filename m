Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 711B919AADD
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 13:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732414AbgDALfF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Apr 2020 07:35:05 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35384 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728485AbgDALfF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Apr 2020 07:35:05 -0400
Received: by mail-lj1-f193.google.com with SMTP id k21so25406840ljh.2
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2020 04:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=tjHRamMMv5QvDVKxEAqiLccLsFDlp99zeyj2/U9vK+E=;
        b=dlWiAsqiasV81fzWmL85ym2F8AGq8XxdZ9L2QG+1sZuZDfDooq3Z2F6kQl6fdd3YN8
         kWZk4uhr006matjFTitchAqAnunO7blA8ro+TWBpZ2zTZAb9tKMBwfRBt0elveDJBxIp
         BhjVicUyaC1opwwpql5CWrJAWlUfFzUPYIdF/2a34Hs4b6k4usqr6Ijic2qRJ/aHQSOD
         xpBZCjKMCE0Rr30u4qlPuZf92L2GPJxRI4Cxl0RcAGzFZVgVMopJee35gu87RUUHJnxV
         MNjxk5U3Qjidp19fFxRwXg+r7AO5rUZ4Mswm/aEcKXEAow5zVqLlh83aF6iGBN53DrUw
         0Img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=tjHRamMMv5QvDVKxEAqiLccLsFDlp99zeyj2/U9vK+E=;
        b=OUnP1Nn31N7ruMWyWobdV3+L6lK9y2n/Hx1GMHrWZAYsK9QF6zIRGiWVssdSROcEJr
         ZIjD5WbeDEYkYXaJMohJVvdCKrilfp7Wi4seQhVZPs1rGvUif5FSHaiUrulz7WM5BmET
         InFF+n3H5cQPsHSPJT3fSfAW7TK8D0V7yxGVU/MIvKQhq6vE5E9fNK8a/hHnIE03Znao
         AkreNn1huNdjqeCdo1fdZ4d0UhY4wcZ4eam/I7OiRzNDd3lSAflMtuQuhs3khHfrUZ1L
         wPvO/XFEAZ/i/xLqYETtLJ1+63d3v3uZVvIDxdSoYJGhPUD3M9RlQkFKjrELUeYghtPt
         1XDg==
X-Gm-Message-State: AGi0Puar0/J/zuC2uM7vTnosAuMtOTpd/gP/iwT372a9+PpKI1Nf9gVd
        /zLHUrZ1pzGGTFTLKVsux1Pse117
X-Google-Smtp-Source: APiQypL4FI4/qwZ9SoAtC+kFSqw76OKeqR8ADg6AHV8kgbGUAfsHZpWMoC80+I52y2hifY+hWaEx6g==
X-Received: by 2002:a2e:b4cb:: with SMTP id r11mr13366352ljm.201.1585740901095;
        Wed, 01 Apr 2020 04:35:01 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id a22sm1048126ljm.28.2020.04.01.04.35.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Apr 2020 04:35:00 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 0/7] Universal Serial Bus: Removing Acronyms
In-Reply-To: <AM7PR04MB7157968F8BC12AC42CD397B38BC90@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200401073249.340400-1-balbi@kernel.org> <20200401073806.GA2019004@kroah.com> <87pncr1wgn.fsf@kernel.org> <AM7PR04MB7157968F8BC12AC42CD397B38BC90@AM7PR04MB7157.eurprd04.prod.outlook.com>
Date:   Wed, 01 Apr 2020 14:34:50 +0300
Message-ID: <87v9mja17p.fsf@kernel.org>
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
>> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
>> > On Wed, Apr 01, 2020 at 10:32:42AM +0300, Felipe Balbi wrote:
>> >>  764 files changed, 86304 insertions(+), 86304 deletions(-)
>> >
>> > Ah, a nice tiny patchset, I'll try to sneak this in during the merge
>> > window now :)
>>=20
>> That's great, Greg. It'll help hundreds of people, I'm sure.
>>=20
>> > nice job...
>>=20
>> Thank you
>>=20
>> > greg "I know what day this is..." k-h
>>=20
>> felipe "I've been mostly confined" balbi
>>=20
>> --
>
> Just one small comment, it may let the code line exceed 80 characters oft=
en,
> is it OK? Or the 80 characters per line is not mandatory?

80-chars per line died once 4K monitors became mainstream. I thought
that was documented in kernel-doc already. Isn't it? Looks like there's
more work to be done.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6EfFwACgkQzL64meEa
mQYS/RAAsDMyYiuUzfe4LLosSPt6yUe2BRiNajbns1DLEA4SHab8NSGoizUiRGwt
73/4AlkMzLDm8QJak7it0YGJUZw4Rd+yL1pHfYQsKJIx58MptKTc4u1XmSWoCrIM
UtUpAVBnLq5JElNQDa2CxKzJRlUwTk1laiEHh+++VlhYzWUGQIEg29cFXQzR08tc
T02vzlt7ma0PbScEOKzN1vIR58EZ3TZS7rmuZCdhrJciW8zErtuDDmYuCDTpkriU
wpGBjuLq8Zb0AMcJMV0VsUcC64zmWoSFy7e8pc/ikdpbgvQcis1NoVJxC27JekUF
2JKsckhGmIHlGrMECiGjcuwdml+S86smxVq0HgyqcVEPGUg/6lpkfExbJlcq3qds
/tLym5advalzFixgwPqZ59pTqhSWlw994G1VutLa0FE5SZv6Sfb9+/vAt9f2qz0Z
u2MpW8azA4m0zkk/ANoU0voVVgX7xW6avkeH8+ZzTgcpRhUg3wVXBpOzYZKJ8BJg
II5lFjEKXGl6vQQjm5RL8S1JB4mmCxyWGDQrSqzAz3uoUffcRY+1a3mLY2O97hxQ
53/Infn+VJ8RQ9sKWGBfhtCQMd7dLF0WkKIF7zTK376l2K6m/AAyCKFWZgP+dAD1
Ego8++++8QYlncdBuydM7v3eW+Em0eAAWGYEekRLnCVRdVOZXZM=
=xxkz
-----END PGP SIGNATURE-----
--=-=-=--
