Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5C42148F4
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jul 2020 23:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbgGDVn5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Jul 2020 17:43:57 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:50003 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727084AbgGDVn5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Jul 2020 17:43:57 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 4FCF699C;
        Sat,  4 Jul 2020 17:43:56 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute4.internal (MEProxy); Sat, 04 Jul 2020 17:43:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flameeyes.com;
         h=mime-version:message-id:date:from:to:cc:subject:content-type
        :content-transfer-encoding; s=fm2; bh=DUGLX0wvYwPBI7K7yvk34gVfOL
        iMOICafwJNZWOwZt0=; b=pmB3fFZINpafC7fwkLNq8ZpqJH/vMT/ilbUMl8sZjj
        7to5wVMhAUXuVsgxZp1jUkdD1TChE20prYlkFFhwsUqUIuPWsCgt78KG2TBfoQlm
        RDGZaMFipvKWGMWSir06J9Wjrha2gHQexBGlfsxyEpyd2gW6DmF8VB27TuGj6BZU
        8gj49J/jHxt6vhDUlFORTSuXcl/54sgbEVdMzeVnNBD3BK5ho0OXJON8ZFBuoMIw
        W6hAaFFj+zPXL+tgkbLM/tXiD2LC54tnAq4w8YBCi/zEux/CFFw5XcNFldkxMpD2
        daixY4QfEkApbD6GwZew+TW9VveWDbbsAG4bSIbpYXLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=DUGLX0
        wvYwPBI7K7yvk34gVfOLiMOICafwJNZWOwZt0=; b=gyppSLNpWYnDMKg+VDWjn8
        OIAzIQS4a4ygKoeRlt9gYQ+xasSKng095i3uORadjW/rFTi6YI12JbNwZO303PDl
        4r0Vx4JvEVyDhzgoSgvD4Ixyv130z3zED3AIXyYh+rETDmxi+VVJcIKoahr1/5+p
        uE7xZGo5TbsF9Avm07mxUP5Vd92g/RKN2P8s0rujN01Z7j2PZ0KW76vqAiIuAnGV
        EvZqpjA50JxEYq/4N6e5giLW0rto4DFg/J66nLuYLPs32OcoU0F5tlxKuOo/XetI
        QYxa/rJXuJT3M9AE/Yu9gUGkehTvJd23R4ZW+j6m6gYwyxr6Bxa2RNsU6HYqB6gA
        ==
X-ME-Sender: <xms:G_gAXzX69Vip475p508cKmx3GwtBIV-7V2gCNOC8lp60_xpUqaTZEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdelucetufdoteggodetrfdotffvucfrrh
    hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofgfggfkfffhvffutgfgsehtqhertderreejnecuhfhrohhmpeffihgvghhopgfglhhi
    ohgprfgvthhtvghnjpcuoehflhgrmhgvvgihvghssehflhgrmhgvvgihvghsrdgtohhmqe
    enucggtffrrghtthgvrhhnpeekveeiteevgfeuhfekteelteekfedvkeetteeugeevffek
    tdfhhfehvdeifeevteenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlh
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehflhgrmhgvvgihvghssehflhgrmhgvvgihvghsrdgtohhm
X-ME-Proxy: <xmx:G_gAX7lCWcb9hVn3_lV4VNpCx9MoSarh03ZRoQKmG4lQ6RABaRL_2w>
    <xmx:G_gAX_b2342sq5RlDuTWkB7X7a_g4N9fBJFyJMXx0ODjHjRBEN2vPg>
    <xmx:G_gAX-WW6OOH0QxHnZVgpXBrvGApXSZAHDqTlk2Tz4lFih4tfCSUmQ>
    <xmx:G_gAX8u8HAg32stKPNvFJwxryzsjs47q5Yvufd6p1tEjQs20EldZMA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 52AB4660069; Sat,  4 Jul 2020 17:43:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-576-gfe2cd66-fm-20200629.001-gfe2cd668
Mime-Version: 1.0
Message-Id: <ce1a62d3-4fd7-40a3-919f-9f8bb4130884@www.fastmail.com>
Date:   Sat, 04 Jul 2020 22:43:35 +0100
From:   =?UTF-8?Q?Diego_Elio_Petten=C3=B2?= <flameeyes@flameeyes.com>
To:     "Pete Zaitcev" <zaitcev@redhat.com>,
        "Paolo Abeni" <paolo.abeni@email.it>,
        "Kris Katterjohn" <katterjohn@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: usbmon structures headers?
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi folks,

I'm trying to write a quick implementation of usbmon capture in Cython, =
for an Apache-2.0 licensed project[1].

As I followed the documentation[2], I realised that the definition of io=
ctl constants and structures for usbmon are not exposed in headers at al=
l, only in the sources[3]. This makes it=E2=80=A6 a bit of a problem, be=
cause I'm not sure if mimicking the structures in Cython falls into the =
syscall exception at that point.

Interesting enough, libpcap appears to define the same values, but apply=
 an MIT license to them[4], so I could copy them from there, but I thoug=
ht I would at least check first, if this should be exposed in the first =
place.

Please advise!

[1]: https://github.com/Flameeyes/usbmon-tools
[2]: https://www.kernel.org/doc/Documentation/usb/usbmon.txt
[3]: https://github.com/torvalds/linux/blob/master/drivers/usb/mon/mon_b=
in.c
[4]: https://github.com/the-tcpdump-group/libpcap/blob/master/pcap-usb-l=
inux.c

--=20
Flameeyes
