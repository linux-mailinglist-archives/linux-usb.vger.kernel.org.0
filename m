Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2980013C260
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 14:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgAONO2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 08:14:28 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37657 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726220AbgAONO2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 08:14:28 -0500
Received: by mail-lj1-f195.google.com with SMTP id o13so18498727ljg.4
        for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2020 05:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=afdXFIrCVgynMwPn5QvFZ61RufmbQKROQifhxkZV1I8=;
        b=LP4kRY5ZJDZDC+QtMEIfk/bViwERLhiD0Q8Iys1ujPDO1cc6zBt0WqWi6KvaltyTQi
         a9Q7gSVluG0uVsk+h+2zAcjJEFC6lO3HxJ3ExM5vzp2ZdW04TzMF0+nm29+1j2++NvLD
         fq0Vn/ZkzIStvUoy4A2Yi716KyJD1T8rcFIO4tsBBpR7ze7PreeL9lxBbUEi1JWiG1ED
         WNO89oTMUMZlhKE3Cs63qQvLUq77P0HsuyKocxg14C/o+wrJ3BuExifmNgkQ5RIip4r2
         ihBXSyoDWozzKZGSPVCk/2TvlYnFjo+fxp+Akd1U6XCk/3DywbwMey4pDKyJ1NcdMd2g
         YfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=afdXFIrCVgynMwPn5QvFZ61RufmbQKROQifhxkZV1I8=;
        b=OVffmGINeoZu44jO/Zu0amX9LknbZw5HoPpP1rEsAIBFZW8Q7yKw6NFQ582LMuijfL
         upgbvjqPBso6nzxLwD95AJ238pG13b+gme1ghgMEy/ZmCqhRG6Y8bQbUvFDU3tuJPno6
         mGghm6qMdnlbheqeSET/L+pZsghX88hKo+Kh6ODXEOouzef38To7VQmPQuXX6mbxBMEj
         4Fqc7e5U0p3GAE96tmW8b8oljcmrkOexphqxM+fEQ9fvspWvNfUKzmxjNtJDnZ+BtMmq
         ETdM1hTDLMXJnASbQ1NcimTYZmpG2vRdmo80CS/bjoM9R7xQM/VIr9Q3G88D9wwwhNPL
         vDkQ==
X-Gm-Message-State: APjAAAV9fZ7HKNYvHXFNPk0swkesDYRA+qT4e9vMF0QvXu9DBJJ2jSi4
        EOZEy4aKhoxSd4CWDIAjJ1TnExj44ItUlg==
X-Google-Smtp-Source: APXvYqz0c/4xfXYCp7lLdldwb6hPPQXu0eXUR4Yf99ksu6C/f+XGp7FUtUxxfrqEpgUWn65AlXqntw==
X-Received: by 2002:a2e:b0f5:: with SMTP id h21mr1843024ljl.9.1579094065680;
        Wed, 15 Jan 2020 05:14:25 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id j22sm8905763lfh.93.2020.01.15.05.14.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 05:14:24 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Lukas Wunner <lukas@wunner.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc2: Drop unlock/lock upon queueing a work item
In-Reply-To: <e417bbba-f2dd-3ffc-0db9-149b08b11913@synopsys.com>
References: <77c07f00a6a9d94323c4a060a3c72817b0703b97.1574244795.git.lukas@wunner.de> <e417bbba-f2dd-3ffc-0db9-149b08b11913@synopsys.com>
Date:   Wed, 15 Jan 2020 15:15:26 +0200
Message-ID: <87r2006ett.fsf@kernel.org>
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


Hi Greg,

Minas Harutyunyan <Minas.Harutyunyan@synopsys.com> writes:

> On 11/20/2019 2:15 PM, Lukas Wunner wrote:
>> The original dwc_otg driver used a DWC_WORKQ_SCHEDULE() wrapper to queue
>> work items.  Because that wrapper acquired the driver's global spinlock,
>> an unlock/lock dance was necessary whenever a work item was queued up
>> while the global spinlock was already held.
>>=20
>> The dwc2 driver dropped DWC_WORKQ_SCHEDULE() in favor of a direct call
>> to queue_work(), but retained the (now gratuitous) unlock/lock dance in
>> dwc2_handle_conn_id_status_change_intr().  Drop it.
>>=20
>> Signed-off-by: Lukas Wunner <lukas@wunner.de>
>> ---
>
> Acked-by: Minas Harutyunyan <hminas@synopsys.com>

Do you mind picking this one up as a patch?

Acked-by: Felipe Balbi <balbi@kernel.org>

ps: if you don't have the patch anymore, I can dig it up and resend with
all appropriate acked-by tags.

cheers

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4fEG4ACgkQzL64meEa
mQaMXA/9HPKZTIryEKCoeQ6d/+fNlLifh1ir8v/fPjp9KIUK7uUHCwv+HjlLfLJW
lQKoO1QG0qlJMh58D6xTU0L7j9UHydwFxJ8DHDec0vwe+hOukHKJ6dWZ85PSCQhb
JQLUrNK9xKf8CikxNp85kG46Ttom2nb+GsPF5KW67GJ8vzqkZAyF+MLHdKBkUz7t
5I87t7gxCGeozufuXv49FMjA2n4vI4FLdu40KIBY3jKDGcif89wLCNl4La+rcVYt
HJfOzlJfpnUCq3KI2xht2Bte+ZWOUg3w+AMnKNKFBNmO/Tq0ch+CUnZswv/fmjKk
AAz+oiQtuaI0KuFb992XmZgem1c9PXQZkMsnouJKH77YdIHJO8u+kr1q4BXSTxiQ
IWLPGdsinSO9lGSYbRPAePBJn61YDvXuM/7OAkoYEPGjklGOw77GbIrm0TTkvLGG
eH5GK0NHxL6BiQpm2IBk1EhqqdSzDRloNVApL4xbGplr4bjZRDojIVAEHZJ/XKuI
tEY1+gJGSHkIoXTwloSq3wpDUEzHSyD7NGFfCLnXyppNX+Sc6tIaGxQKH3ww7XQP
kK1fzqK0kJ5zqzjUONo3fb4nqG4u8GYf0Ov9LhGVFVQoxjUNVWG5WS4ImtLXXJcP
jQJ9WdytpSUdJ97oYNIRnQbFxpIPFyEZHOJkMn4j2BvMMeOv6Lk=
=CUsj
-----END PGP SIGNATURE-----
--=-=-=--
