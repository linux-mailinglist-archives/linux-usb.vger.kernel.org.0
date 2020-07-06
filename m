Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44312215406
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 10:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbgGFIcc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 04:32:32 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:41165 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728012AbgGFIcb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 04:32:31 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 968EB606;
        Mon,  6 Jul 2020 04:32:30 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute4.internal (MEProxy); Mon, 06 Jul 2020 04:32:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flameeyes.com;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type:content-transfer-encoding; s=fm2; bh=Yw
        Sxm3bW46fP+trPqkOuSy+foWH66CQ7JPRxjTFdepo=; b=H3EfJ96R0VgNss0Dfa
        XyIyqrF8GZNV2+dk04xjh0WasxotV6l69qW3FCb2Zqm632rCqUXF07AcU6IT6hLr
        i3/FZjiDMGtZYPLDJKg6sC8+GcNk1nEx7NMnqr7aAi213fNwEl+51WFfqDe8IZP1
        jDsqvGmkXE3e7PMrAEBq/2dcJVIODd+cmk5hlqxgZjyAYDOpjD67/Z3PyxPfRFmx
        Q/tygD24FhG9kmd7Q19TXd0rONEldu+HfDvTIYPrkl1f3KPFN6MoXVIck/mxQkx7
        0MGRb+TLgjYcvmgYDIAYPTbGtZQRrDNTvv7849Kleu5BjGLH+LYUQrEM0R7cE9Cc
        9+hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=YwSxm3bW46fP+trPqkOuSy+foWH66CQ7JPRxjTFde
        po=; b=CWSsM4eWe/ogkKtfmxP9QQ3INjLu02s8rAw7SyIknCjmttm0U1vieF51n
        XifHKeJbtF5jHBHbcVhUHLHYPU0Xr4tpA4Pd8clBEIt2aAtc//Ommkx7vLsoRkG6
        VdDeES0Ie9Cm+XWJhwjULuJA843gm8IQJnQXf/OI3od4iTs8u82JYRwIADNq6KT3
        KqAty5C5JYINvPbKgwZzU1Wg8oQ3QtaFvLwrBm+g0MWFgxPiuxg2SosNnySLpZDj
        Nl3iFa9siQqrNDGXV1G9K4kUB7sWnzsRD4qp/Pjrl+rDYSRzuU/Vvvzq1grxPOss
        UI0oc6eSGN/LEqvaERndMFqckJEcw==
X-ME-Sender: <xms:neECXxb5Zh2hjL5Gn6cmvGprtbrGFCRPtEfPVTIAhcMlX7fKAjf6zQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefgddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepffhivghg
    ohgpgfhlihhopgfrvghtthgvnhpjuceofhhlrghmvggvhigvshesfhhlrghmvggvhigvsh
    drtghomheqnecuggftrfgrthhtvghrnhepfffftdfguddvkeeljefgteelgfeggfejheet
    udeutdejleetiedvjeelteffvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepfhhlrghmvggvhigvshesfhhlrghmvggvhigvshdrtghomh
X-ME-Proxy: <xmx:neECX4bu3wQPrljjTJG8pjijCMlCH5QsUGwOf7T2gyrPBz_pCSF95g>
    <xmx:neECXz9LjVKekITz8JzJRn432ZQxcU_iqL56DIq0fKh4GowVMw9_7g>
    <xmx:neECX_oPu1zOmrEMX1mNjXgUq1SAKCKM98Islf2FgwTLC0l04Ixl0A>
    <xmx:nuECX5BggtMNNlbP9Yp8iS3WXx7dZXkTuOwYY-u8dl1esZ8VLTArOw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id C36F4660085; Mon,  6 Jul 2020 04:32:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-576-gfe2cd66-fm-20200629.001-gfe2cd668
Mime-Version: 1.0
Message-Id: <4125fc72-473b-48b8-b349-1792ddc60958@www.fastmail.com>
In-Reply-To: <20200705223741.496f9603@suzdal.zaitcev.lan>
References: <20200705150225.21500-1-flameeyes@flameeyes.com>
 <20200705223741.496f9603@suzdal.zaitcev.lan>
Date:   Mon, 06 Jul 2020 09:32:09 +0100
From:   =?UTF-8?Q?Diego_Elio_Petten=C3=B2?= <flameeyes@flameeyes.com>
To:     "Pete Zaitcev" <zaitcev@redhat.com>
Cc:     linux-usb@vger.kernel.org, "Paolo Abeni" <pabeni@redhat.com>,
        "Kris Katterjohn" <katterjohn@gmail.com>,
        "Greg KH" <gregkh@linuxfoundation.org>
Subject: =?UTF-8?Q?Re:_[PATCH]_usbmon:_expose_the_usbmon_structures_and_constants?=
 =?UTF-8?Q?_as_an_UAPI_header.?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 6, 2020, at 04:51, Pete Zaitcev wrote:
> I am not sure I follow the logic in the confusion claim above. Since t=
he
> applications define their own headers, they do not use the kernel sour=
ce
> at all. Therefore, there can be no question about any exceptions, and =
no
> confusion. But perhaps I'm missing a turn here. Feel free to educate m=
e.

Most applications rely on one or another kernel header =E2=80=94 this ha=
s been the norm for Linux kernel interface users for many years. The UAP=
I headers are installed on systems and wrapped explicitly for this reaso=
n.

> As for the "duplication", I do not see it as harmful in any way.
> And they do not re-declare, they declare. You're trying to create a
> centralized language definition that did not exist previously.

It is harmful, because these structures *need* to be exactly synchronise=
d or the calls will fail. Or the data will be garbage. Not exposing them=
 on UAPI just doesn't make it as obvious, but it is an issue needing to =
be addressed.

Furthermore there's the problem of whether having to pick up the structu=
res that are defined in a piece of source code that is purported to not =
be covered by the syscall exception =E2=80=94 that would cause require m=
aking the userspace implementations of usbmon a derived work of the kern=
el, which in turn would make them GPL-2.

> > +++ b/include/uapi/linux/usb/mon.h
> > +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>=20
> Yeah, that. You created the confusion first, and then resolved it
> with licensing amendments.

I didn't create the confusion. I stumbled across the confusion.

Either the structure definition is not covered by the syscall exception,=
 or it isn't. If it is covered, then we're all good: anyone can include =
the header, or copy it, or copy part of it, or redefine the structures i=
n whichever language they prefer, and it's not a derived work of the ker=
nel.

If it is, then we have a bit of an issue, as libpcap is not considering =
itself a derived work of Linux and contains a copy of the same structure=
s. So either we say that Paolo had the ability to release it under both =
licenses, or we're going to give a headache to libpcap. If we accept tha=
t Paolo released these structures under both licenses, then the syscall =
exception can be applied, if nothing else by sleight-of-hand by taking t=
he MIT licensed version and restricting it.

> Okay. Our documentation refers to _IO(), which is a system macro,
> so we're not entirely self-containing. I can see an opening for
> some sophistry here.=20
>=20
> Fortunately, include/uapi/asm-generic/ioctl.h already includes
> that "GPL-2.0 WITH Linux-syscall-note" thing, so I think we're
> clear in usbmon.

You _also_ need the structure definition, or at least its size, for the =
_IO macro to be usable.
Which is why it's important that syscall-level interfaces are made avail=
able in UAPI headers with exceptions.

Now that does mean that mon_bin_hdr doesn't strictly need to be there=E2=
=80=A6. but what's the point of not defining the structure that you _nee=
d_ to have to be able to read the data you're requesting?

So in short as for "Why all this?"

Because without this change, making a new userspace implementation of us=
bmon requires straight-out copying code from the kernel in not-quite-cle=
arcut licensing environment. Exposing this on an UAPI header should addr=
ess most of that, without tying your hands any more than already present=
 for compatibility, and without diluting the licensing of the structures=
 more than it is right now.

Unless you plan to argue that libpcap is violating the kernel license, b=
ut I think that'd be making usbmon toxic enough that I wouldn't be the o=
nly one walking away.

Anything else, beside not feeling that we need this?

Diego
