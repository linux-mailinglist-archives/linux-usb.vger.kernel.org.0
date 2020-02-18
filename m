Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA8F1628A8
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 15:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbgBROi3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 09:38:29 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43895 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbgBROi3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 09:38:29 -0500
Received: by mail-lf1-f68.google.com with SMTP id 9so14670330lfq.10
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 06:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=sY61Fr9YVI4lh18cQUNO718Eme0LNQbuaZGESudFpqw=;
        b=WkYtu/dY2ovNW0qm1LPax22Q4ht0NjynYZX0mFpft4GmvaT/S1qohqDprHO5yTlvPE
         iHPkhaniJM0xjfnc17QDfJNnSSzsmymKt5qJJMFrmQrh65BEEXi9cUhdcWCe3FJ1x7FR
         4MiltQNY6cttJuMusjW7t1OGsk9/VKM83dT7wNF/p+6oe3GKuU2g3b1whNtWF+RyOPDs
         E73V26fjaLZ6/wON2vlj2LaAoWTcNn5cxzY4c8aSsmdTsyMbQbCRRhLpOs0QZ+GX+xi0
         pQx7b4d6wDl39AEciUbFF6vgKozZHYuA6Eirj3yvA/dl/Bhe+Mdkppf/AtgKowV+yKO5
         pPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=sY61Fr9YVI4lh18cQUNO718Eme0LNQbuaZGESudFpqw=;
        b=RWVlISXuHbdokM63LbWVFRM8k7WSyVpBSq1hezTBH2Boasca0XeQoqnFzHu9jsqzuO
         0ZyQUAtwGUIVJQ0D1J9oS38rKu0ROc+Fv9UEusa75biXxRnN+iMoEMn84nKHzFlTC4jS
         dDbIi2MTFfvTmqmBZbg0V6JcvXSt3q1HV7waqdJ12A7SoS4lQvPLFSSwIgrwZhpUmC/t
         VwTPSUO3OH98SAvX22Yg1XAdADijLOv6G/Az0NohMO31V2DMgsfTCufvHJGWDbKJlH2o
         93k3OngE+OGRFfuFR1/17ohjAUzO4eKfjNPqh/ftZnAkgBc4IXy/zX2g7yAkYXSdNB/4
         5uwA==
X-Gm-Message-State: APjAAAXyMZZ9+3FI9XFZu9TSlvUmjgbbIXlc7n0T0g3zUjoyJjRZtkdg
        OIQs9nR9gwqLs4mz0xP82IA=
X-Google-Smtp-Source: APXvYqyYFSUC/ZLttO0aNVrvRVKGcY8Z7trWKa6BH0+B9JtbKN9J/5DS8qqqwXChycZplrJC1aM6EQ==
X-Received: by 2002:a19:c7d8:: with SMTP id x207mr10920235lff.142.1582036707423;
        Tue, 18 Feb 2020 06:38:27 -0800 (PST)
Received: from saruman (88-113-215-213.elisa-laajakaista.fi. [88.113.215.213])
        by smtp.gmail.com with ESMTPSA id z3sm2609100ljh.83.2020.02.18.06.38.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 06:38:26 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] usb: dwc3: Add ACPI support for xHCI ports
In-Reply-To: <20200218124257.8734-1-andriy.shevchenko@linux.intel.com>
References: <20200218124257.8734-1-andriy.shevchenko@linux.intel.com>
Date:   Tue, 18 Feb 2020 16:38:16 +0200
Message-ID: <87zhdgezaf.fsf@kernel.org>
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

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

> The ACPI companion of the adapter has to be set for xHCI controller
> code to read and attach the ports described in the ACPI table.
> Use ACPI_COMPANION_SET macro to set this.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/usb/dwc3/host.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index fa252870c926..86dbd012b984 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> -/**
> +/*

trailing change, at least mention it in commit log ;-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl5L9toACgkQzL64meEa
mQZ7ZQ/9FcIuztTwsJxUcmmS+s4pGQsKN+wlTJ0H+43v1x9AP4JQmfAh47Yqth8l
l0gr1Okd8/2BnW+MAuy/V8FCcbqkVYuRmOjVmNjQILQLguw2P/pRn9qfaYgE+QIT
EHnqBiukVTC7cnKH41zfCMEEvhnHh52i0uvirKmlSV2Gu3DjxeVM7SVFmjCAYE9V
bOiKMg72WKIs2wKWi1EzZ0F3BXId5Vtiz/1Djg4lGUafx73Q4Wgrnv60/3BwlTKx
c/ke+JnONw43etGiLhVYW0xIZ/EA6k613iYBSwHlW+yfI0FHN/BU9C6yTmRc7Cnz
G+0sb3AERclStCC1ojNa64zaRL4fhAc8zm6k47Mz+B7K8jaCjGx1XY24b/Voj3tT
naKjpY5umea+YbK9R8MwuSMsVn+SWEmaxVwLWDvw7LEqslK1dcX4VnlapFduk45h
Pmax1n4vmkZYXAUR8u936CsnDfW9XXVf3WzByLJk+wvDafDR+qZrbCBn/ydB4gs8
t7he2ey6oajJ5LCp+hQM0WSt1Bx4PCMgFBw/An5LUm8ZDe71u3UMZktOFGhYe/2j
F5DVvg/PEn42NAAzpaqLL4oFs8Ut7/W7kFYgKB1KzpwLRHmxhQZCLwraSZVnJa2Y
IZxDKYk75yRDTqrGG077unxBtEhxrjOhcxP04icSfMiVXPAITIE=
=uhmp
-----END PGP SIGNATURE-----
--=-=-=--
