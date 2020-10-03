Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45967282066
	for <lists+linux-usb@lfdr.de>; Sat,  3 Oct 2020 04:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725802AbgJCCH0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Oct 2020 22:07:26 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:40373 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725562AbgJCCH0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Oct 2020 22:07:26 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id ABAC4D05;
        Fri,  2 Oct 2020 22:07:25 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute4.internal (MEProxy); Fri, 02 Oct 2020 22:07:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to
        :subject:content-type:content-transfer-encoding; s=fm2; bh=5kE1+
        iTFDLInIffdVuVV0jXx5w/AvKJ6XDovjiufB3M=; b=VKXHEzPVQiP+MegDVqQqu
        wVmvYjuRvLQneJ/tp+uaf6HpmoLTydSEJKMq9PJPJKDQ4eq4GONoDeX6m6ba94+y
        lmb4LcXT7NCkIT5fNe4AWEq9uNDGofsz3ucKiQOHSnjlvuZgidpEWXdM/whGSJ0x
        PTtw5U4V0d8yD9olwSRr49G8/P6s+WLsmfcW+E4cXeqJDRAJwNcXU6nF57Hqy4hx
        mIJCLF8J3I+6jZnNhva07H54XjolqpOSWIPg/BBBTOZ866s2HJDsP6SjPtnX1czr
        MNLwUixvPsWa3eP7O6LaXasuI0TlebQQ3jBnuadPo8Kjvh9WwxH5a+JcF7rTe63Z
        g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=5kE1+iTFDLInIffdVuVV0jXx5w/AvKJ6XDovjiufB
        3M=; b=sR6tLlVwgSWnLyASlxCF9XR7o0e45LmjmyuVJie9SbcDJld2hjAKnCArb
        t2XGa/wF1sErAMYslK71dsxfPMiES5PlrtWyEN+D5VtNQ3eoV0dY+vndCssWTPA8
        oHZcQGoYibaIHjaeaesYlcu9HD5nZsm4/8UWAoiVA+wCVn/E/RKRVC32HJFufLXG
        7fi01sQA5VgNHviztITi/eUVnbLdol/+17PZrXwx3gwlZLhBYm7/669xkVv8tPoO
        Yent76UTZtBQ8so7EHqlD3uQ8JPJHRm6ct/Fb5DRG7+jZ04Q3+mwBq5t7xT6zeKl
        k1jlacNewqQD/i/neAerr3Jl9Qqlw==
X-ME-Sender: <xms:3dx3X4Nsy6FAdSW0IIsahOe6zyd7uuyWPzqo8AL6APQ8vRHdg4h5Vg>
    <xme:3dx3X-8B1ZERBgOVo3ySI8IefQC-hER3dY-u5HlBuRQsemEPv7WooYocbNy1F9zIm
    b-M8AM1oPOwDL45GYE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeejgdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdfuihgu
    ucfuphhrhidfuceoshhiugesrggvrghmrdhusheqnecuggftrfgrthhtvghrnhepvdetud
    ffudejgfegueeuffekgfejheeuhffffefgteffffffhfehffetjedtgedvnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhiugesrggvrghmrd
    hush
X-ME-Proxy: <xmx:3dx3X_TkInnBe7hABPjjCrEK2WjrwtjSA4Koi2ygnnfrmqlIkLjQ_A>
    <xmx:3dx3XwsgYtvDNUMlncjUd8BcwsuWb0MpBBvcVTO4IDMOqaDNwbnjAQ>
    <xmx:3dx3XwdL-eEmKc0aR1oCytxHRRIjK8cwqS2E-vxbS7zS_gFX9gc6Nw>
    <xmx:3dx3X6rj90D0peGCUI-ewRM4UGso6yDnhLIQ-4zvw7KrXR7ki8p8cg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id A0F2C660069; Fri,  2 Oct 2020 22:07:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-382-ge235179-fm-20200928.002-ge2351794
Mime-Version: 1.0
Message-Id: <7d974f24-c297-4e4f-97aa-76ae85f897db@www.fastmail.com>
In-Reply-To: <87ft6xxgls.fsf@kernel.org>
References: <ce4fc6f6-726e-48b3-97bb-0de2b3801615@www.fastmail.com>
 <87k0wd9jog.fsf@kernel.org>
 <8baba7f6-35aa-49a6-89eb-f57164cab41f@www.fastmail.com>
 <87ft6xxgls.fsf@kernel.org>
Date:   Fri, 02 Oct 2020 21:07:03 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Felipe Balbi" <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: ConfigFS: bcdUSB forced to 0x0210
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 2, 2020, at 1:54 AM, Felipe Balbi wrote:
>=20
> Hi,
>=20
> "Sid Spry" <sid@aeam.us> writes:
> > On Tue, Sep 29, 2020, at 1:33 AM, Felipe Balbi wrote:
> >>=20
> >> Hi,
> >>=20
> >> "Sid Spry" <sid@aeam.us> writes:
> >> > Hi, I can't enable USB3 with e.g. f_ncm because bcdUSB is always =
reset to 0x0210:
> >> >
> >> > $ sudo sh -c 'echo "0x0300" > /sys/kernel/config/usb_gadget/g11/b=
cdUSB'
> >> > $ cat /sys/kernel/config/usb_gadget/g11/bcdUSB=20
> >> > 0x0300
> >> > $ sudo sh -c 'echo "fe800000.usb" > /sys/kernel/config/usb_gadget=
/g11/UDC'
> >> > $ cat /sys/kernel/config/usb_gadget/g11/bcdUSB=20
> >> > 0x0210
> >> > $ tree /sys/kernel/config/usb_gadget/g11
> >> > /sys/kernel/config/usb_gadget/g11
> >> > =E2=94=9C=E2=94=80=E2=94=80 bcdDevice
> >> > =E2=94=9C=E2=94=80=E2=94=80 bcdUSB
> >> > =E2=94=9C=E2=94=80=E2=94=80 bDeviceClass
> >> > =E2=94=9C=E2=94=80=E2=94=80 bDeviceProtocol
> >> > =E2=94=9C=E2=94=80=E2=94=80 bDeviceSubClass
> >> > =E2=94=9C=E2=94=80=E2=94=80 bMaxPacketSize0
> >> > =E2=94=9C=E2=94=80=E2=94=80 configs
> >> > =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 c.1
> >> > =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 bmAttribute=
s
> >> > =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 MaxPower
> >> > =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 ncm.0 -> ..=
/../../../usb_gadget/g11/functions/ncm.0
> >> > =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 strings
> >> > =E2=94=82=C2=A0=C2=A0         =E2=94=94=E2=94=80=E2=94=80 0x409
> >> > =E2=94=82=C2=A0=C2=A0             =E2=94=94=E2=94=80=E2=94=80 con=
figuration
> >> > =E2=94=9C=E2=94=80=E2=94=80 functions
> >> > =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 ncm.0
> >> > =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 dev_addr
> >> > =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 host_addr
> >> > =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 ifname
> >> > =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 os_desc
> >> > =E2=94=82=C2=A0=C2=A0     =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 interface.ncm
> >> > =E2=94=82=C2=A0=C2=A0     =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=
=80=E2=94=80 compatible_id
> >> > =E2=94=82=C2=A0=C2=A0     =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=
=80=E2=94=80 sub_compatible_id
> >> > =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 qmult
> >> > =E2=94=9C=E2=94=80=E2=94=80 idProduct
> >> > =E2=94=9C=E2=94=80=E2=94=80 idVendor
> >> > =E2=94=9C=E2=94=80=E2=94=80 max_speed
> >> > =E2=94=9C=E2=94=80=E2=94=80 os_desc
> >> > =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 b_vendor_code
> >> > =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 qw_sign
> >> > =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 use
> >> > =E2=94=9C=E2=94=80=E2=94=80 strings
> >> > =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 0x409
> >> > =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 manufacture=
r
> >> > =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 product
> >> > =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 serialnumbe=
r
> >> > =E2=94=94=E2=94=80=E2=94=80 UDC
> >> >
> >> > Board is a RK3399 based RockPro64.
> >>=20
> >> what's your max_speed?
> >>=20
> >
> > $ cat /sys/kernel/config/usb_gadget/g11/max_speed=20
> > super-speed
> >
> > Looks ok. From Windows, the xHCI driver reports that the device supp=
orts
> > super speed but chooses high speed. I can't see this info from a Lin=
ux host.
>=20
> It's probably failing Rx.Detect and falling back to high-speed. Which
> USB Peripheral Controller is that?
>=20

It's a dwc3. I recently found that if I plug the device into itself (the=
re are two
dwc3, one on a C port, one on a female A port) the device enumerates at
superspeed with the NCM configfs driver. But connecting to my x86 machin=
es
fails.

In an earlier thread I found that the type C port would not work with US=
B2
or 3 if in the "normal" direction (as opposed to "reversed").
