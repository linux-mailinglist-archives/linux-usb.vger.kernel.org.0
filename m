Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD0D214D1E
	for <lists+linux-usb@lfdr.de>; Sun,  5 Jul 2020 16:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbgGEO3T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Jul 2020 10:29:19 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:44231 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726781AbgGEO3T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 5 Jul 2020 10:29:19 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 9A7085C00BE;
        Sun,  5 Jul 2020 10:29:17 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute4.internal (MEProxy); Sun, 05 Jul 2020 10:29:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flameeyes.com;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type:content-transfer-encoding; s=fm2; bh=wk
        eD6F1N8EyLPqckYafibFKRSdBSLSRxgShxgLIn2zE=; b=h7OY7Ht7u1J3WnYB7w
        A3i3mtN23SIcVlSZ3mzSlEceUaleBSTy7xqdlh6Htayra/iVRGeqrLRi6aTvsBdY
        +i5d8txOaEJ4I5g+VJt65INEvDmO4hEo9jCzy9T6JxWxjlxND6IsMKvYfQZzLIQR
        tkASpoA17wcEQIF1Rb0/ExMnbK9plbAm5KnZgbGZsGy8Z+EBRmV6i2tw90I611C9
        n73lNYm1nvHJeO/cA2hVi7eL+TLb2/G1IfEoH6tQBszMIqFC/p6H7BaZJLCkoEN8
        fmuXiwZIfw+hviA8O6GGGEJBtaJW2QPYEn7DpsDqSLvWxjXgrMHgxTljBhQB867Q
        oB2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=wkeD6F1N8EyLPqckYafibFKRSdBSLSRxgShxgLIn2
        zE=; b=IWy6oeuU3r8BG/UF02JZyoF2tocG/JSdOtN3iYf5rG+F3jsjyyAnP3CDe
        fFa8hd/hGbfGBiKQOeIlmv8P0vgonUJPvnqyFJjIZ70PZ+Kk8frqRL+CVzHhqJBY
        949OtfF30U00pjc8CD5I3+2kym7O8NLSUS0PLtDr2+7YIg0ZBaosDj58iqTX4qgx
        vXKRFBCe/EAhcyU/acR1wpt717PnyTzScq+j2K/3h00/gZW1Q/OZyXeNwOhYZSaf
        61niNC6PSgRU5z76inXSyAoXlGtwbiOjx06oFg0TzqzKzMZBvkqlJwndszNI8NkA
        t0IPYktrvu+At/9WmNLjUHDB6lF4Q==
X-ME-Sender: <xms:vOMBX-BzSC1WotoOgA2LH-T-dVcizg7NIJu5fxpEYKiE-VVLKHLqzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddugdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepffhivghg
    ohgpgfhlihhopgfrvghtthgvnhpjuceofhhlrghmvggvhigvshesfhhlrghmvggvhigvsh
    drtghomheqnecuggftrfgrthhtvghrnhepgedvheeufeehgedtudeljeevieeuieekteej
    udfgteeiieegveekueehudehudejnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkh
    gvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepfhhlrghmvggvhigvshesfhhlrghmvggvhigvshdrtghomh
X-ME-Proxy: <xmx:vOMBX4iyarqpCKKtFgkwCb_2IiE6P4HmNRvUGudvsXuegL84dLring>
    <xmx:vOMBXxmMlLhzJafX69etp8lFAgXQ8y4PG45nr2y6_IGgUvBkGPSGsg>
    <xmx:vOMBX8yIDSeK9PHwXjZ45xc1OpzayyEEgR1p_7Hin7pS5e-FAHRmEA>
    <xmx:veMBX6JhiAXCufClMIYMubjEDX1H6B4YPJMz47LaH7lk81rJeRWY_A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id D69CE660069; Sun,  5 Jul 2020 10:29:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-576-gfe2cd66-fm-20200629.001-gfe2cd668
Mime-Version: 1.0
Message-Id: <8a6ffcf3-908f-4ddc-aa48-61fe46e1a708@www.fastmail.com>
In-Reply-To: <20200705142403.GA1629177@kroah.com>
References: <ce1a62d3-4fd7-40a3-919f-9f8bb4130884@www.fastmail.com>
 <74a26b91-489f-4c04-a53e-8930a9df9bd6@www.fastmail.com>
 <20200705142403.GA1629177@kroah.com>
Date:   Sun, 05 Jul 2020 15:28:56 +0100
From:   =?UTF-8?Q?Diego_Elio_Petten=C3=B2?= <flameeyes@flameeyes.com>
To:     "Greg KH" <gregkh@linuxfoundation.org>
Cc:     "Pete Zaitcev" <zaitcev@redhat.com>,
        "Paolo Abeni" <paolo.abeni@gmail.com>,
        "Kris Katterjohn" <katterjohn@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: usbmon structures headers?
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Yep sounds good (at least I'll try to do it right.)

On Sun, Jul 5, 2020, at 15:24, Greg KH wrote:
> On Sat, Jul 04, 2020 at 10:46:09PM +0100, Diego Elio Petten=C3=B2 wrot=
e:
> > (Updating Paolo's email, that is out of date in both sources.)
> >=20
> > On Sat, Jul 4, 2020, at 22:43, Diego Elio Petten=C3=B2 wrote:
> > > Hi folks,
> > >=20
> > > I'm trying to write a quick implementation of usbmon capture in Cy=
thon,=20
> > > for an Apache-2.0 licensed project[1].
> > >=20
> > > As I followed the documentation[2], I realised that the definition=
 of=20
> > > ioctl constants and structures for usbmon are not exposed in heade=
rs at=20
> > > all, only in the sources[3]. This makes it=E2=80=A6 a bit of a pro=
blem, because=20
> > > I'm not sure if mimicking the structures in Cython falls into the=20=

> > > syscall exception at that point.
> > >=20
> > > Interesting enough, libpcap appears to define the same values, but=
=20
> > > apply an MIT license to them[4], so I could copy them from there, =
but I=20
> > > thought I would at least check first, if this should be exposed in=
 the=20
> > > first place.
> > >=20
> > > Please advise!
> > >=20
> > > [1]: https://github.com/Flameeyes/usbmon-tools
> > > [2]: https://www.kernel.org/doc/Documentation/usb/usbmon.txt
> > > [3]: https://github.com/torvalds/linux/blob/master/drivers/usb/mon=
/mon_bin.c
> > > [4]: https://github.com/the-tcpdump-group/libpcap/blob/master/pcap=
-usb-linux.c
>=20
> Yeah, we really should put those structures in include/uapi/ with the
> proper license.  Care to make a patch for it?
>=20
> thanks,
>=20
> greg k-h
>
