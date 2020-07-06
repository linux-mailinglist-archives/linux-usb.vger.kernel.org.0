Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3357C215727
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 14:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729066AbgGFMXe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 08:23:34 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:51557 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729046AbgGFMXe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 08:23:34 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id C39F25C015B;
        Mon,  6 Jul 2020 08:23:32 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute4.internal (MEProxy); Mon, 06 Jul 2020 08:23:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flameeyes.com;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type:content-transfer-encoding; s=fm2; bh=j6
        1iN4bZs36j6aDWh1E7qeMlc+9PW4nt32wCXHtyaVA=; b=CSlIJhgvR1ccQcXoX+
        RLAGcACLqcl/t3ZhMlvbcEnHxxPOoJjKK4v8cxobjR3gKBa2wwHfbSHYIVnoqXvq
        TGcFRK7e8wRC1z34isCXdVePUKlyk54Ykeb4glh3RYOVnn1PQuKww7wudjjsAUfY
        daO1Q5a01MdJmN/8jiyuQh4LjyLnAllzCtHM9ICUZ9nG4QQrMNtUvB3Kihgsxn/U
        XiJel82lPH0l/s/VO0NP2+rQZfYx/YX4KncXqAi29MxMB89/UoyPoNFiSMr2+Xt9
        oxgCbTUwuUrySn8vZ9adZW8okJ481r2A9aEaGcU0mNEvn/ICt3DXb73ee/+hplAe
        zQUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=j61iN4bZs36j6aDWh1E7qeMlc+9PW4nt32wCXHtya
        VA=; b=bK/DySFRUM34W/bXP6nCyTJFHw+6UySuB0jadgI09pENRKEc87z0WlPak
        KgSJ0O43HbIjPNkX+oHxs+mEypTxLMJMe4bIhQEd7LIJZqrW124hLVV+Mt7MNX3b
        iC/h4mqiQ1kIK3zNqZx/1svqvcoicmmSB7mFOVrsxqco1axVDtBgquUv2UQJTL4b
        74X82gIeSc/U28UdCWaNoVdUvYJhgxsiEzM3BbopqUrhFAScX38L9ZNw9NIu4XBu
        zRdeyapPC0vHbHvW/XlOWKiMWeIA9Pe6TWsL85nfGP9BRaJ4Dnv0vEVYxL92rLNE
        6ZEI4fUkDfA5uYyNJEVfl7awGYSYw==
X-ME-Sender: <xms:xBcDXwjoOEZ-phPqwqSktW83p_vqzCOnXYMb5_-Tgoqi07Mdtb12Zg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefgdehvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepffhivghg
    ohgpgfhlihhopgfrvghtthgvnhpjuceofhhlrghmvggvhigvshesfhhlrghmvggvhigvsh
    drtghomheqnecuggftrfgrthhtvghrnhepfffftdfguddvkeeljefgteelgfeggfejheet
    udeutdejleetiedvjeelteffvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepfhhlrghmvggvhigvshesfhhlrghmvggvhigvshdrtghomh
X-ME-Proxy: <xmx:xBcDX5AXCCYWBwbNbupYeBITKKh_3O5AsQR29O8FjFzAsVShSXKaeA>
    <xmx:xBcDX4HAvQY5T-0yZynz1rr7QPfWXpmW4i4BRgqcKGDsbo2DPH542A>
    <xmx:xBcDXxRJjvOh-O8flbFZEfxdGxLcUW62kAtmULdd1kIkOmQclh3n8w>
    <xmx:xBcDX-ri9dsS6lTpLXeeqzkpmNtyP8BOrov4DSbDgMTX-X9mMaOYww>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 21668660089; Mon,  6 Jul 2020 08:23:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-576-gfe2cd66-fm-20200629.001-gfe2cd668
Mime-Version: 1.0
Message-Id: <c93d4a89-ed87-4fc0-94f2-e6c8a6ef04c3@www.fastmail.com>
In-Reply-To: <20200706103026.GA10624@kroah.com>
References: <20200705150225.21500-1-flameeyes@flameeyes.com>
 <20200706103026.GA10624@kroah.com>
Date:   Mon, 06 Jul 2020 13:21:22 +0100
From:   =?UTF-8?Q?Diego_Elio_Petten=C3=B2?= <flameeyes@flameeyes.com>
To:     "Greg KH" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, "Pete Zaitcev" <zaitcev@redhat.com>,
        "Paolo Abeni" <pabeni@redhat.com>,
        "Kris Katterjohn" <katterjohn@gmail.com>
Subject: =?UTF-8?Q?Re:_[PATCH]_usbmon:_expose_the_usbmon_structures_and_constants?=
 =?UTF-8?Q?_as_an_UAPI_header.?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 6, 2020, at 11:30, Greg KH wrote:
> You can't change someone's copyright lines, sorry.

Then I hope Paolo can send a follow-up patch updating his email address =
=E2=80=94 email.it doesn't seem to exist anymore/doesn't seem to have hi=
s address anymore.

> Put the copyright notices back in here.

Done.

> And you see the kbuild error for this, please fix that up.

This should be fixed now by dropping the conditional, which AIUI is the =
right thing to do in this case? I couldn't find any documentation refere=
ncing what to do with CONFIG_COMPAT for headers, but I assume that anyth=
ing optionally available should be exposed in UAPI and worst case fail a=
t runtime.

> As you are making this a "real" uapi .h file, you have to use the "rea=
l"
> data types as well.  That means using __u32 and not u32.  Same for all=

> others.

Done, and in the documentation.

> Does this cross the user/kernel boundry?  Ick, no wonder we need compa=
t
> fixups :(

I fear so. The usbmon interface is fairly long-living, and I don't think=
 it matches most of the best practices of today.

I keep telling myself I should spend more time trying to figure out what=
 I can improve overall, because I fear this is better served by having a=
 good thought on the design, and be replaced. But that's a topic for ano=
ther thread.

Although if someone is interested in whiteboarding an alternative design=
, I'd be happy to start such a thread or have an offline chat. My curren=
t castle-in-the-sky would involve integrating BPF so that capture filter=
s can be applied =E2=80=94 and I think that the modern way to stream dat=
a from the kernel to userspace would be netlink?
