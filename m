Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4D87219989
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jul 2020 09:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgGIHLl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jul 2020 03:11:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgGIHLk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jul 2020 03:11:40 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F98C061A0B
        for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2020 00:11:39 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id d17so1200848ljl.3
        for <linux-usb@vger.kernel.org>; Thu, 09 Jul 2020 00:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=c6a2uUB7yh56jdbRVnYpimst4UcONZOKlwaFivx7gVw=;
        b=oyECnKuaIq6kUVWNSw3aqVNtWnAGCad7LmhjTbdZnaT9a08wl4ZJz35zj6L+u00pLl
         sQHLUSD3sxuy7i7VEURNh55ud6ZujxAK2c/pEPkPEUqx6oskHvps250J/8GSQC25sBjF
         Y/+HaEM1Dw8V3QKrVdyXw/AJ77BCvO+ESNE7xXPb6ROm3Ch0SSIlytututq4y+MmsN2A
         BxVO9L0tP8s+EgRhH5PuIl0Tl+15XLHVUkjUNWFSQ8huWL7qZb5rFIxJxZJsCRZKZzeO
         tKE7wIK1tkVr2SJhTr8bL4uvWnA/lUCZycQG6AaVoNZ0Fucl5KtPk3emdNIHxADFlT5a
         E/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=c6a2uUB7yh56jdbRVnYpimst4UcONZOKlwaFivx7gVw=;
        b=o48hN/iypmigWVj2n8dzG0podPVZgXBWT+fr1D4fiMRYcoEv0chPpINmLsDVtyOyYw
         B8hgBDGuIywjqPZ2trGPa5Ee20W7KX9Ifid7XlVo+YxmvwtwPHfWOcZ6548y5347Emwy
         KKCkB/w6hVqZWUiQDe52xDsJTdXI1EK7t9qejTHBNHftjMRKvXUqlbClr2gdt+uDLTSp
         7P1Y8LCmMM5bYYMB2vNv8h8yAetF12yPSm9kEA8v0I2DL0TjT1rtm5nLej6MrRok9ZGJ
         wNaFzxGhZcx9+IvVueddSVeFwel8AB+Zry77ACNACqO4+X5YMXJiRu2mAaXR6M/8iy+T
         Ol/A==
X-Gm-Message-State: AOAM532rau6E9U9brBJDWAnbaH1d8buDGt2ecOHBok/OkuhlRS5LQNCA
        lcHnquDN+BHXAQubi8MDl+I=
X-Google-Smtp-Source: ABdhPJzG8BO9JA8tmFynz54nuhPPR9Ak2Hm4mZG3QLMvNW8++EeH5eBDVsw7wpyYXMTeCKK7t6ZeVw==
X-Received: by 2002:a2e:8e9a:: with SMTP id z26mr37562731ljk.470.1594278698434;
        Thu, 09 Jul 2020 00:11:38 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id g7sm623224lfe.62.2020.07.09.00.11.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jul 2020 00:11:37 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell\@cadence.com" <pawell@cadence.com>,
        "rogerq\@ti.com" <rogerq@ti.com>,
        "gregkh\@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH 1/3] usb: cdns3: ep0: fix some endian issues
In-Reply-To: <AM7PR04MB7157D60ED21E2B29461DC3F08B640@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200603065356.14124-1-peter.chen@nxp.com> <20200603065356.14124-2-peter.chen@nxp.com> <87fta16vb9.fsf@kernel.org> <AM7PR04MB7157D60ED21E2B29461DC3F08B640@AM7PR04MB7157.eurprd04.prod.outlook.com>
Date:   Thu, 09 Jul 2020 10:11:33 +0300
Message-ID: <87d0556u3e.fsf@kernel.org>
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
>=20=20
>> >
>> > Reported-by: kbuild test robot <lkp@intel.com>
>> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
>>=20
>> Fixes?
>> Cc stable?
>>=20
>
> It does not fix a bug, and only improve the code for cross platforms
> So, don't need to go stable tree.

Fair enough, I'll enqueue it for the next merge window.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8GwyUACgkQzL64meEa
mQYSkA/9F6XeDFu8azolxFThqp/bjothKgNhGdzQeudEzfXXZNQ1ndg2lCn6X0Yc
O81IE1wqX0QcyG5kG8QDiz7/0qCf9bsyCKtBTSBqsV0gdPL6toZRttHNBfH7zbDb
WtCEPaIYkM/Bo/32iJjgNUh4cfVe4tXrgIp4h9WotVZ6GgHToGieIWqTvS21u3nJ
Fa+oSH28QkcavQ12eXJCX4JdD9SQdUpcEy2PoiV6lmwnU9pneDle464XwzN9SZmC
224MbymSZsX/oZA6+8DB9eAhJU8tLSMiXdo+ziZVblfO1qRNlK7akXaD6VhrK0IK
oP8Gfbe9sDLUTsxJNXXISuKjpG+KtJAvIse6+C+JoLSqW+NYgcTnm51V5UtcVwsr
BoUWAzUO8QjclSCAmQ4oHi8JPdnX82eK99EgvdgYBrPnnRnsEUzjWrBJhkBmY8v7
dXM7qOiIs6Ksft6VmEz3P6bvcXJkEdBwWKVWFzI8oH4qipG7ME8+1epjes/Ugq4q
M+AeKXpsmO4tPGxruzPatcMxNCmf3Ln7IHPULSHyhJ79pugomGqnwG4wHNBYuCaz
WnW6fQkZXOPpNwErVADfwDiFBB+lCw1ihqO5x2FaZARXGMGZ/DoKBvyPtAojLYrS
NEvtealh/P5D1DK4dXDLnxECEJW/ylgFQDNdKSxQEIVM4FB3FRg=
=jV1e
-----END PGP SIGNATURE-----
--=-=-=--
