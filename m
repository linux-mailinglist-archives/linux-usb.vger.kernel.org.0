Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C243D1D09FA
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 09:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730273AbgEMHey (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 03:34:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728988AbgEMHey (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 May 2020 03:34:54 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 304EDC061A0C
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2020 00:34:54 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id s9so12752566lfp.1
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2020 00:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=hO05pbtDYWnBJuKeAGBUlNlCYRQCiALn8rY6ERHaqVA=;
        b=s+mbb024owIrMKzGr8HILZUTVXvZWG1Obks9bdEjIr38skgiuqdtZZgc+GI2Wn+seb
         kP9D60vSf/5ANbxBG/hjdxYdrjVggygvFgOHKkTiTp81shkW1/YNN/91uV3xMS2ydbPD
         tJ2dT+U0bd6BXqb0c7hbbRSnBwsHiLJb0vG4SmGMcit8uf6fcGMT8q2pgusaPzaQbl7C
         fTc5SbWEYE70Emk1a/ijj5ZH2ZRyYe2flQuzZGEoQYqWlATcM4wIBTSCjwbk9ryQFE64
         MhAk+5aNQwH+3YbK/Hj9L6+5rC5hmsKEHGEeJDHeCbxLSliuMBDBxRAcpDEH9UdMq1Tz
         Nzow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=hO05pbtDYWnBJuKeAGBUlNlCYRQCiALn8rY6ERHaqVA=;
        b=SmYVUSLYmjtH7C1otKcD0XfyGBdId9LeyMdvaTqrjRbZ63yIgQHkRDOKxnhrD3UFTP
         SgFqxLtYc/4T9QtGgQOVITCX3AkQRdqUWPif1j5cbckTBpnOC6tCZy6546mQBuhhf5aX
         6FgwYNP++vd3WF7z1lupCLFX+tx2ihObCJ5H6Fc1RE6eGmjGk+qFZwB/JTTfHbR0sPYH
         YMwtG9ULCTdM7D491J3zV9cFFErKELWlVfPYWK+k+60TzasJhjLJPNZGN6GOcSjZPaXs
         nBep5SeOM8f83Z/zvFEviMn4qEfIrMMeZaiwCyIVm6LX8Esia8pS1ZECJq168xF1IWON
         f+rQ==
X-Gm-Message-State: AOAM533FzGmv49Q2njOqjlJS0oYHWPAkktrcStJg5WV0DDTrp64fGU3v
        yGkhn8BCAzyNkUVRXSa3OPHyPxF+
X-Google-Smtp-Source: ABdhPJxEuRFvdUmO4QEk2QF5LJQdSZHiQCX9UVwrcNJzNvGf6zA1mu8/GCeDd48S78zJPb+w967nJA==
X-Received: by 2002:a19:c50c:: with SMTP id w12mr16848364lfe.23.1589355292365;
        Wed, 13 May 2020 00:34:52 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id d3sm15262501lfq.2.2020.05.13.00.34.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 May 2020 00:34:51 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Claus Stovgaard <claus.stovgaard@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Options for forcing dwc3 gadget to only accept superspeed
In-Reply-To: <6d19d49dcfe7467556b0462b16e76677c1999875.camel@gmail.com>
References: <8943a225c6d8354f2f5fe0ea7270dc0fa1293180.camel@gmail.com> <20200512195231.GA26080@rowland.harvard.edu> <6d19d49dcfe7467556b0462b16e76677c1999875.camel@gmail.com>
Date:   Wed, 13 May 2020 10:34:47 +0300
Message-ID: <87k11gp9t4.fsf@kernel.org>
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

Claus Stovgaard <claus.stovgaard@gmail.com> writes:
> On tir, 2020-05-12 at 15:52 -0400, Alan Stern wrote:
>> On Tue, May 12, 2020 at 09:25:38PM +0200, Claus Stovgaard wrote:
>> >=20
>> > In a certain scenario I would like to force the dwc3 to only
>> > connect
>> > via superspeed and not fall back to USB2.
>> >=20
>> > What options exist for forcing the dwc3 to keep retry?
>>=20
>> The USB-3 spec forbids devices from operating only at SuperSpeed.=20=20
>> Devices must be able to connect at high speed, although possibly
>> with=20
>> reduced functionality.
>>=20
>> Alan Stern
>>=20
>
> I understand the requirement from the USB 3 specification. Though in
> the scenario for this specific device, it is not about comply with the
> USB 3 specification, but my question is rather what options I have for
> not comply with the specification here, and then force retry of USB 3,
> using the dwc3 as device.
>
> The device is in a fixed mounting with a fixed host. Sometimes when the
> host and device is powered up, it ends in high-speed instead of super-
> speed. I would like the option for "I will not be compliant with USB,
> but rather retry super-speed".

If it's "ending in super-speed" this means it tried RX.Detect and it
failed, thus falling back to high-speed. It's likely that the signal
quality in your setup has degraded or is, at least, sub-par.

Forcing a SS-only setup would just give you a device that doesn't even
enumerate in some cases.

Could you capture dwc3 tracepoints of the problem?

Also, which kernel version are you running? Which platform?

best

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl67oxcACgkQzL64meEa
mQZ88BAAhDtycEnyz+JdayzOvNJL5IuMtRlSqJcrdBEkU3EmEe5s9zLje/EE3KPF
kk+0y3pgSK1orYPw+6atjo8bpCSD93akqqyoMAZOmwX9N/Io0ufQcz8igBRucUaE
DigFFBm6zMGZCNZADkongCG5kWSrEMN43M7nsSHaBmxm0uYBZGeXX/mwyEJcPBR0
+zr0PulCuKxhImIp5CkEaCAbu0m+fNAK//nKX4Jrzt1gxls3UwguCfBQczQJDFbK
PiLfVr2HeAO3gRvmtIQ1sy7OkoxupVNMR1/25csTp9BKZFK5HQcTciWlqQCOhWze
ZgaodgOZwalhNwZmP7M1a52cBS0HgnP3taqykiAv/6UXWv/a4obmz/0VTSL0T/Ke
TQLK1JNK80yUNdZVoqK4J+R6C+MlgSLgXwZ78/Rxd8ijok6x/9s3a3g/kpw2blsJ
oRaQ9icJX6cQePBzLX1I5Re17MTcYxuShksjeoMrzVRog1u4kWVixkG9UWN4Nnis
F/0thPA9DlLmjmNQNVhDwRUsBasXMsr3eMvZWOWmSAHAKvB1WJV6W9etMuZNaqKe
nvAuiHb/dpM4ttnn8FbQ1or7ogKWkYJ9ue5r7uOByei6fzCI2dzxyLhXGXET/xEU
MUJXYf7tsXbC/Pkzmb+XDDfKeh1JPGzDllXpWFL8xtKc66Gwd2w=
=SnvB
-----END PGP SIGNATURE-----
--=-=-=--
