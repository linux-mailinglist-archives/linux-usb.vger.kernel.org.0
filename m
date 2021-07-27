Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6107F3D7B96
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 19:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhG0RGz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 13:06:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:54108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229818AbhG0RGy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Jul 2021 13:06:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 77C2660FC1;
        Tue, 27 Jul 2021 17:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627405614;
        bh=mFat/twJRE7/pE/PXrNnbNG/3T4ZUp9mxW5y5Cift1A=;
        h=References:From:To:Cc:Subject:In-reply-to:Date:From;
        b=GH5wjdLsBEkMBR3IbFFGSTknqQ1npBGAIS05Gr5qBVrlxvnLi9tWcc8R/mTGTNEnq
         N6SRkOCVSvOCi/Ny+IvZ8QwiIah1S/ioyrddPPmMwg7/Ij+7SotOohawbMKW07iHuD
         Qnq3XhUcN6r9ttfCpEvBBRkyT4CGPmZ4hy9wQoSGLOxXaGOuLUEson9zp2PX8Pcj04
         uWCLlRGdoLfYk2UPBKIUZ0kuo0rY/iNiBMfa7ZaB+ha3CuBtWZb3NOP48anb8GSpYu
         rIVWMYLkuQUeFikXtb4NBfdZAbHU5EHmn/mnu4Uyn4IZBXCopeHZukMrgUwvC0rjLh
         DMFWII3Ant/Fw==
References: <QUKVWQ.1T8HV94AM5X6@gmail.com>
 <CAJpVOidqd+tpNNkHGvC6fUQ7g3Z+FLpiDJrmPWtQmiL-AsYsLw@mail.gmail.com>
 <YP+kqqimY1BYZAwL@kroah.com>
 <a59c1173b77b4ace8db7181b1b0fc446@SVR-IES-MBX-03.mgc.mentorg.com>
 <RBHWWQ.R54EUTRRR5DN@gmail.com>
 <2c9ddbc65d1e4ce3a368c1d894281178@SVR-IES-MBX-03.mgc.mentorg.com>
 <GBNWWQ.KWQ1PXLOHKYW2@gmail.com>
 <adddde7315464623ba329dc4e5dcc5d7@SVR-IES-MBX-03.mgc.mentorg.com>
 <DMVWWQ.LUXSRV2XQXCW2@gmail.com>
User-agent: mu4e 1.4.15; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     AMoonRabbit <razgriz.wilson6@gmail.com>
Cc:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>,
        Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: Fwd: Linux Kernel 5.12.10 Walkman USB DAC support issues
In-reply-to: <DMVWWQ.LUXSRV2XQXCW2@gmail.com>
Date:   Tue, 27 Jul 2021 20:06:51 +0300
Message-ID: <87sfzzu1n8.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

AMoonRabbit <razgriz.wilson6@gmail.com> writes:
> On Tue, 27 Jul, 2021 at 3:05 pm, "Schmid, Carsten"
> <Carsten_Schmid@mentor.com> wrote:
>> Hi,
>>=20
>>>  Dmesg output with the system rebooted and the Walkman kept in DAC
>>> mode
>>>  so the system will only have seen the device in that mode. And
>>> sorry,
>>>  not sure what you mean by no top posts, but guessing it has
>>> something
>>>  to do with leaving the original email I used in the CC?
>> No top posting means:
>> Write your answers _below_ the text that you answer to, not on top
>> of it.
>> When you read books, you read from top to bottom, isn't it?
>> Thanks,
>> Carsten
>> -----------------
>> Siemens Electronic Design Automation GmbH; Anschrift: Arnulfstra=C3=9Fe
>> 201, 80634 M=C3=BCnchen; Gesellschaft mit beschr=C3=A4nkter Haftung;=20
>> Gesch=C3=A4ftsf=C3=BChrer: Thomas Heurung, Frank Th=C3=BCrauf; Sitz der
>> Gesellschaft: M=C3=BCnchen; Registergericht M=C3=BCnchen, HRB 106955
>
> Apologies, but that's not a concept I've heard of until now for

that's okay, we're here to help ;-)

> emails. Will put responses below the chain from now on.

Not necessarily entirely below. We reply below each "topic", as I've
done here. Hope this helps

--=20
balbi
