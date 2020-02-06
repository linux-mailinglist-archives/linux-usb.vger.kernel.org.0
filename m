Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 858DA154B34
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2020 19:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgBFSd0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Feb 2020 13:33:26 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36322 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727358AbgBFSdZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Feb 2020 13:33:25 -0500
Received: by mail-lj1-f195.google.com with SMTP id r19so7196445ljg.3
        for <linux-usb@vger.kernel.org>; Thu, 06 Feb 2020 10:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=mQviOQVgc21ZSiSRASF/rFdkslJmgHwnCqRtXFKEEuA=;
        b=ASopOj0HKcq5EK4RRAGkwdowwtx1X3QOweCvqr2TnUarfP9PjtXtLODHuBmC+eqXXB
         hmcQHFXIr5sZ15nCEUG3h5kt0HSR/pLaWZgmcO5OFheniBMFgJIBd/+2f0vZaRQnQ7UT
         M6V3el2NNewQsfdaV03p+BS5Nw5tH2c3QuuxIhlg4dgzNGOokt0iZbpibFogIHkTfK52
         mzhfQsYHsuX7SPfh4sW9PA4hN410q1whNca/YAHx7++oXqztDyRZ88MPetFqeDT/Q0lW
         a0cxIoTAy1pJOa8DtsGuT6R5S+NiAncMikczWZFk7nJkYNgZe6GBPpqo5rlJDsCTtRt6
         nHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=mQviOQVgc21ZSiSRASF/rFdkslJmgHwnCqRtXFKEEuA=;
        b=b37dRSwM56OKRHuIJdpEnkYla7LDTp2MuPVtYSwY940WgXKvexoss+rkpX4bmxBzDh
         85SuiknGH45QNsrqpeFmnjZGNjsKgnW5ZsMVER69CBpktqWtp3VkeM38VIB0GwRq3mub
         Ra1xa+z6QWfWXY1HZCppXdD1+2VlpzaK7yfJA0ckIzZfI6fn+fc/ODwaWyWt54PzS3MC
         9JEpxOfgjt1udIREXJJkriwhbGgbQqorrWIRaSeosHU3Fo/gZ35dhRwBf3XqB83qzsP9
         Xb4hIcPghh/kQQ5Esf8WIaovQEVNX6jL6y7OWEdfcdo0lAsYo0UDXhSv3efTgQaYH184
         /PWw==
X-Gm-Message-State: APjAAAXKp5oukzJ5e6FKDAQ7WZ4/jxgNQw1P98BN+R6B7fTyKsrdevAN
        gRLgu+ZvQMHmH38FN2jvkoWpf40BUBw=
X-Google-Smtp-Source: APXvYqxaDmfJHU3nelJmL9y3wfuHNoI4Te9+X9DM6gW8l6OPvXGvFA/KmZJhDn3q+4XVjtvmzw3U8Q==
X-Received: by 2002:a2e:9008:: with SMTP id h8mr2860155ljg.217.1581014002262;
        Thu, 06 Feb 2020 10:33:22 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id d4sm89960lfn.42.2020.02.06.10.33.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 10:33:21 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     bugzilla-daemon@bugzilla.kernel.org, linux-usb@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [Bug 206435] dwc3 dwc3.3.auto: no usb2 phy configured
In-Reply-To: <87d0ar5zyq.fsf@kernel.org>
References: <bug-206435-208809@https.bugzilla.kernel.org/> <bug-206435-208809-nsmttjrqU7@https.bugzilla.kernel.org/> <87d0ar5zyq.fsf@kernel.org>
Date:   Thu, 06 Feb 2020 20:33:16 +0200
Message-ID: <87a75v5zwz.fsf@kernel.org>
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


+ Heikki, since this is, apparently, Bay Trail

Felipe Balbi <balbi@kernel.org> writes:

> Hi,
>
> bugzilla-daemon@bugzilla.kernel.org writes:
>> https://bugzilla.kernel.org/show_bug.cgi?id=3D206435
>>
>> --- Comment #3 from youling257@gmail.com ---
>> Revert 987351e1ea7772cf2f0795e917fb33b2e282e1c1 phy: core: Add consumer =
device
>> link support, dwc3 work for my z3735f device.
>>
>> android_x86:/ $ su
>> android_x86:/ # dmesg | grep dwc
>> [    9.724606] dwc3 dwc3.3.auto: changing max_speed on rev 5533210a
>> [   47.488501] udc dwc3.3.auto: registering UDC driver [g1]
>
> reverting that commit makes dwc3 work? Then you don't have a bug on
> dwc3. You have a regression caused by another commit.
>
> Alexandre, any idea what's going on?

Heikki, any ideas?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl48W+wACgkQzL64meEa
mQZliA//YZF3B1Vy1WyU4xix4fZJ4hIERKyxJFoqUaYHe9BO9KJWSL/n7gI4eyN1
APvUCZaeCi1TfFnYD4R8ZHJwOzUWX22u2Zhxk+GuDGqJjrE/C17NesM6xqBhs2GF
LRTWpQfjW9J7XsmRCZN0vexyPgXMhxLRN/BIVQDhd1ZNHROoNiTIzIyk0TMEWmZC
1hoOQx2qYEmFlVFQDgpTx9gCRTq0BTv7of9vlyqtyWH6F7xOPXHQCHs/w444ztoE
q2uefvAS1KynpSsltgYzcgV+Xni4m8cvRORArzxGUuFlZt3c3Te+yugboC/OZyvt
bjrNtn0XwVIX8LRWRzIKErT1BS3JbAIzZqh+YocRAvIGZiuJUZt94tM67iob1X4i
B6ApHdmiJndimmmdp3arkrVg8CaGW6sw9J8o1QSgipcJviizKamZoOkcROLCzfvG
klJpyi2W28hX2PFQEhev//j3dRh5D6HYRybqaHH4+ErmQWMq6t1yRp3M0GmJZLqx
F9QmNWNg9ROtUrmDTlPs0wU/RRJBryMy4k2QNgWtvzVnY1QkQodzOysPSSH18GQw
xecQfPzlOh1sAtPzKcT1xnzR6VRBmCdT+VEH8wYQ+OM95ltzWZVd6/QwIwyTZjuL
XxSbz9e0u5WZmPaGI9agdoBzVgMe9ZHweOjZsO8GC/gli1o/mC0=
=3n0Z
-----END PGP SIGNATURE-----
--=-=-=--
