Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED97215810
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 15:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729160AbgGFNKg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 09:10:36 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:35111 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729140AbgGFNKf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 09:10:35 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id C5C5C5C01B5;
        Mon,  6 Jul 2020 09:10:34 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute4.internal (MEProxy); Mon, 06 Jul 2020 09:10:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flameeyes.com;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type:content-transfer-encoding; s=fm2; bh=/Z
        9LJci5aVXyHN1tTQr5u9Gg9+QmPfdTGgXJZgmr9KU=; b=e9AX55rNeLF/ObXX6L
        M391q8wPfwzUA5KvYuLJCHDnzX02YY96hKN+dn0o0Cypx4HyOZqvvrjWnGXLlgfn
        dPU15QqET1SS2SNMfS7JQtXn4CXL7BpuImP/Kuw8z9GgerZQC/zfIt+Jlj+ajOTc
        UAMaTLEcY9crfe23cyYU1HGygnm26NHJwNSiBbfzZxn0OGcG3d12BFBGdU4p9MRS
        ZNOAVj6o4DNp6hCwMNoK1jUdO8Xs/KIkjeLY1cTjOybX7+YwQl0OGlLQptSm/CLG
        7iXzgALiuev3eVQpsxAeuvc6TZnd4E2ojgP28L43ze0Hgch6CQ7KwpTJvCedGUYQ
        h9KQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=/Z9LJci5aVXyHN1tTQr5u9Gg9+QmPfdTGgXJZgmr9
        KU=; b=c6VP2/2I6SnjP6uDP641BPbSgmskbhRHUlVCRbpaFwkcmFMuciNR1JvYS
        Xh9RnV/PHoWg7ggQ+tVR+gz1XkADjqIBIH2ONIqdd0X0L5fLFUrB1I5tdFpnKDGS
        KTtU/9QsNGfT8X7VMolS7YJcgmCREnq5OFs5SmWGGrYywVgCGSLAoCx3W5uVjZbS
        DDpmMfdaj3/R4K9lALjGqdX3npi1jiAOGDuX/6peIaFkIc4by+cPaQbClfu1a7C3
        M2evO5siqBW/kjDmKStfs0xqwHoHXDfo7TqiuKHco2reqbejFOO6hGZy3a49nUFG
        j4jS1W2p7uDUIdStt7K+4aAyWwoFg==
X-ME-Sender: <xms:yiIDXwf-MzjMiQEZzpNUTL0B2B6H1kuxYaIJzuEa90lK0kX2ivwAeQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepffhivghg
    ohgpgfhlihhopgfrvghtthgvnhpjuceofhhlrghmvggvhigvshesfhhlrghmvggvhigvsh
    drtghomheqnecuggftrfgrthhtvghrnhepfffftdfguddvkeeljefgteelgfeggfejheet
    udeutdejleetiedvjeelteffvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepfhhlrghmvggvhigvshesfhhlrghmvggvhigvshdrtghomh
X-ME-Proxy: <xmx:yiIDXyOPxyzyxQUEKu1WKimDpQsfgXyVvm4k45KZC4EXnxsBWagy-w>
    <xmx:yiIDXxi8NaE6bKIaUrqABAche5b6fBbNqJj5fSWe-VQ-tJr8CGhE3Q>
    <xmx:yiIDX18S4mVru_Jz-hGskhC3RNt74pDqDy2mXbrsAoop91QiqYgfnw>
    <xmx:yiIDX5Vqn0828inSfO7S4SJsFxhgl89pTgAS9Lj5m5Jhj_5q8D7GTw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 8BFA4660085; Mon,  6 Jul 2020 09:10:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-576-gfe2cd66-fm-20200629.001-gfe2cd668
Mime-Version: 1.0
Message-Id: <4b2de0b6-5410-4e64-b432-23458e09a97e@www.fastmail.com>
In-Reply-To: <20200706124943.GA2270456@kroah.com>
References: <20200705150225.21500-1-flameeyes@flameeyes.com>
 <20200706121509.26439-1-flameeyes@flameeyes.com>
 <20200706124943.GA2270456@kroah.com>
Date:   Mon, 06 Jul 2020 14:10:14 +0100
From:   =?UTF-8?Q?Diego_Elio_Petten=C3=B2?= <flameeyes@flameeyes.com>
To:     "Greg KH" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, "Pete Zaitcev" <zaitcev@redhat.com>,
        "Paolo Abeni" <pabeni@redhat.com>,
        "Kris Katterjohn" <katterjohn@gmail.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v2]_usbmon:_expose_the_usbmon_structures_and_consta?=
 =?UTF-8?Q?nts_as_an_UAPI_header.?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 6, 2020, at 13:49, Greg KH wrote:
> > -The overall architecture of the API is about the same as the one ab=
ove,
> > -only the events are delivered in binary format. Each event is sent =
in
> > -the following structure (its name is made up, so that we can refer =
to it)::
[snip]
> > +The overall architecture of the API is about the same as the one ab=
ove, only the
>=20
> Why change that line?

The original text says that the structure had a made up name =E2=80=94 s=
ince there was no exposed structures to match. Now there is, it's no lon=
ger made up.

>=20
> > +events are delivered in binary format. The structures and constants=
 are defined
> > +in linux/usb/mon.h.
>=20
> Not your new uapi file location?

That is the new uapi header =E2=80=94 that'd be the location on the inst=
alled system, updated with the location within the repository instead.

> __u64, right?  Same for the rest of this file...

Ack.

> Why drop this?  If you want to clean up the documentation, wonderful,
> but again, don't do that in the same patch.

Okay split that one line change to a separate change. I really should tr=
y to sit down and improve the docs overall, but that's a much bigger und=
ertaking.

> is size_t a value we can pass across user/kernel boundry?  Are you sur=
e
> this isn't __kernel_size_t?

No I'm not sure and I was pondering myself. I'll trust your instinct bec=
ause you know this much better than me.

But=E2=80=A6 I'm not sure how to use that from an uapi header? The __ker=
nel_size_t does not appear to be defined by including linux/types.h. The=
re's only three users of it in include/uapi/ and the only one that does =
not appear to re-define it as a typedef is include/uapi/linux/uio.h, but=
 using the same include doesn't seem to work for me.

So I expect I'll need a v3 for this one ;)
