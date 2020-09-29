Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA1127DC8C
	for <lists+linux-usb@lfdr.de>; Wed, 30 Sep 2020 01:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbgI2XRB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 19:17:01 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:47879 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728206AbgI2XRB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Sep 2020 19:17:01 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id B36725C01B7;
        Tue, 29 Sep 2020 19:17:00 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute1.internal (MEProxy); Tue, 29 Sep 2020 19:17:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to
        :subject:content-type:content-transfer-encoding; s=fm2; bh=UZQus
        BmYk+20Lo+h5akVoOg62n+utPgekj+0Z64SmXY=; b=Z6qGxHLHT2C1vil8A5rvl
        9/yyyLPuC0RTzHpOkG35/w+QeGj/mgxGGIOdV9ai2MKryx25if5KjPaxlviX8F/w
        h2+rtVGCy6vTh7oLFsDXmRrBs6lTaokWvKPqybXraKMjU7vGnijTaJXAoRWql0oG
        97Ehaw8k5gtPKD87e0/DNpI0zbKdCYnsdR9PCzMfN+8YY0DL1pYeg+kleuklMm76
        l22FvaBGOJk6sNQUXZDm+WRQnqf4koJhifM8w/jt8NhuSabAw7sftXKNEfSdVZzp
        p0L2lMFYKVlavQeF+6HM00CQMdYW7lB2Qav5LwRXaOuIwQnS4a4etCfy69cjTMfa
        Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=UZQusBmYk+20Lo+h5akVoOg62n+utPgekj+0Z64Sm
        XY=; b=PmkUVF/TWbZNcloZiZcXMVsLjbUke3gYb5hS8rBGLovixUlC0IJUYyVCt
        GCkynMc4CMMj3fIo0fUJQMMcKqxKrMCmHA9L+5DrYr5+VkGxrZhgCqXBqzl7UJRr
        Czfm1oD5ULXID0HYFFqrZGZUKnyvGsGpEIVGQBP0MEbM73K4T718/KUECsm2XAbD
        jePNyQE4wtjIeMz4RTsaZxO8jMuAHaUAy+u6UvfAgPZAdN7huAc0Dfc53tdIvz8l
        SKhUpgR2VTDuc89xAj7gn7aWgeRt9bOFHKyp8MMVMpnal24Yt0lTCsy0o+TdpMU/
        y9P2MtWDzBKBX0nPzsNJ/+n/bG22g==
X-ME-Sender: <xms:bMBzX4yeR78Dw79AqRFYd7cDFvHn8ImEJts_knhaCobfw8PwIn2Eag>
    <xme:bMBzX8Rl9qJnZDP8LRNd8mGK1zowIC9yPPGc8exqAqouQdBh2gGLFpc8W6wGjq3mv
    wwx8kxj4UnkjkgwYF8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfedtgddujecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdfuihgu
    ucfuphhrhidfuceoshhiugesrggvrghmrdhusheqnecuggftrfgrthhtvghrnhepvdetud
    ffudejgfegueeuffekgfejheeuhffffefgteffffffhfehffetjedtgedvnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhiugesrggvrghmrd
    hush
X-ME-Proxy: <xmx:bMBzX6XEZ4KmQpZgMcXY2WUZgCoreC6NVadRFOApTCSzCbIgFDR8wA>
    <xmx:bMBzX2hk2mNRXwjDU-icXJioZ-eo_AymkdkvzPWDX8qb4IvwSd8c6g>
    <xmx:bMBzX6D0VbZRLUfFwPshW7os92r-keCpr0jZCJHOEmNq0NxNXR33Eg>
    <xmx:bMBzXx8NEOxCdFCyzusqIW-GGuKIL2SBsyy8iV0KAr5xrg-bUQAllQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 5A7D9660069; Tue, 29 Sep 2020 19:16:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-382-ge235179-fm-20200928.002-ge2351794
Mime-Version: 1.0
Message-Id: <8baba7f6-35aa-49a6-89eb-f57164cab41f@www.fastmail.com>
In-Reply-To: <87k0wd9jog.fsf@kernel.org>
References: <ce4fc6f6-726e-48b3-97bb-0de2b3801615@www.fastmail.com>
 <87k0wd9jog.fsf@kernel.org>
Date:   Tue, 29 Sep 2020 18:16:40 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Felipe Balbi" <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: ConfigFS: bcdUSB forced to 0x0210
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 29, 2020, at 1:33 AM, Felipe Balbi wrote:
>=20
> Hi,
>=20
> "Sid Spry" <sid@aeam.us> writes:
> > Hi, I can't enable USB3 with e.g. f_ncm because bcdUSB is always res=
et to 0x0210:
> >
> > $ sudo sh -c 'echo "0x0300" > /sys/kernel/config/usb_gadget/g11/bcdU=
SB'
> > $ cat /sys/kernel/config/usb_gadget/g11/bcdUSB=20
> > 0x0300
> > $ sudo sh -c 'echo "fe800000.usb" > /sys/kernel/config/usb_gadget/g1=
1/UDC'
> > $ cat /sys/kernel/config/usb_gadget/g11/bcdUSB=20
> > 0x0210
> > $ tree /sys/kernel/config/usb_gadget/g11
> > /sys/kernel/config/usb_gadget/g11
> > =E2=94=9C=E2=94=80=E2=94=80 bcdDevice
> > =E2=94=9C=E2=94=80=E2=94=80 bcdUSB
> > =E2=94=9C=E2=94=80=E2=94=80 bDeviceClass
> > =E2=94=9C=E2=94=80=E2=94=80 bDeviceProtocol
> > =E2=94=9C=E2=94=80=E2=94=80 bDeviceSubClass
> > =E2=94=9C=E2=94=80=E2=94=80 bMaxPacketSize0
> > =E2=94=9C=E2=94=80=E2=94=80 configs
> > =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 c.1
> > =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 bmAttributes
> > =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 MaxPower
> > =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 ncm.0 -> ../..=
/../../usb_gadget/g11/functions/ncm.0
> > =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 strings
> > =E2=94=82=C2=A0=C2=A0         =E2=94=94=E2=94=80=E2=94=80 0x409
> > =E2=94=82=C2=A0=C2=A0             =E2=94=94=E2=94=80=E2=94=80 config=
uration
> > =E2=94=9C=E2=94=80=E2=94=80 functions
> > =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 ncm.0
> > =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 dev_addr
> > =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 host_addr
> > =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 ifname
> > =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 os_desc
> > =E2=94=82=C2=A0=C2=A0     =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=
=94=80 interface.ncm
> > =E2=94=82=C2=A0=C2=A0     =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=
=E2=94=80 compatible_id
> > =E2=94=82=C2=A0=C2=A0     =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=
=E2=94=80 sub_compatible_id
> > =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 qmult
> > =E2=94=9C=E2=94=80=E2=94=80 idProduct
> > =E2=94=9C=E2=94=80=E2=94=80 idVendor
> > =E2=94=9C=E2=94=80=E2=94=80 max_speed
> > =E2=94=9C=E2=94=80=E2=94=80 os_desc
> > =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 b_vendor_code
> > =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 qw_sign
> > =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 use
> > =E2=94=9C=E2=94=80=E2=94=80 strings
> > =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 0x409
> > =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 manufacturer
> > =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 product
> > =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 serialnumber
> > =E2=94=94=E2=94=80=E2=94=80 UDC
> >
> > Board is a RK3399 based RockPro64.
>=20
> what's your max_speed?
>=20

$ cat /sys/kernel/config/usb_gadget/g11/max_speed=20
super-speed

Looks ok. From Windows, the xHCI driver reports that the device supports=

super speed but chooses high speed. I can't see this info from a Linux h=
ost.
