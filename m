Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6275036A7E1
	for <lists+linux-usb@lfdr.de>; Sun, 25 Apr 2021 17:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbhDYPDm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Apr 2021 11:03:42 -0400
Received: from mx.exactcode.de ([144.76.154.42]:44080 "EHLO mx.exactcode.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230288AbhDYPDl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 25 Apr 2021 11:03:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de; s=x;
        h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:Message-Id:Date; bh=BPw38mSmY2+ATZZUwPnK7hJYJ4PqDdDeOWocH9vBgeo=;
        b=R1LOFOlUoVnYvTRlwe70pmtVORtRaLxGLxTe1bbVSjAjvau0NTvSThDte3kEvUhr+PNmMZVYP/xYzbW/bR9xLdsRTk9g4DJXG8qhYWfQMBBSGZbBAv8RRU0d3/VzecTs60meZ7rEYD8y9Z2BX4933BetzFtK0ammI0JW2+M8CR4=;
Received: from exactco.de ([90.187.5.221])
        by mx.exactcode.de with esmtp (Exim 4.82)
        (envelope-from <rene@exactcode.com>)
        id 1lagHr-0003fm-0C; Sun, 25 Apr 2021 15:03:07 +0000
Received: from [192.168.2.131] (helo=localhost)
        by exactco.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.86_2)
        (envelope-from <rene@exactcode.com>)
        id 1lagEB-0000Kl-EI; Sun, 25 Apr 2021 14:59:19 +0000
Date:   Sun, 25 Apr 2021 17:02:24 +0200 (CEST)
Message-Id: <20210425.170224.894337589208455353.rene@exactcode.com>
To:     stern@rowland.harvard.edu
Cc:     gregkh@linuxfoundation.org, hdegoede@redhat.com,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through for SMART
From:   Rene Rebe <rene@exactcode.com>
In-Reply-To: <20210425144531.GA336783@rowland.harvard.edu>
References: <YIVZ2l9qUfkcyPpG@kroah.com>
        <20210425.141536.1295354861910527121.rene@exactcode.com>
        <20210425144531.GA336783@rowland.harvard.edu>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -3.1 (---)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Alan Stern <stern@rowland.harvard.edu> wrote:

> On Sun, Apr 25, 2021 at 02:15:36PM +0200, Rene Rebe wrote:
> > From: Greg KH <gregkh@linuxfoundation.org>
> > Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through fo=
r SMART
> > Date: Sun, 25 Apr 2021 14:00:26 +0200
> > =

> > > > I would expect that more modern devices to work. Vendors usuall=
y
> > > > linearly allocate their product ids for new devices, and we cou=
ld
> > > > allow list product ids higher than this Seven to unbreak more m=
odern
> > > > devices by default and limit the amount of device quirks needed=
?
> > > =

> > > Vendors do not allocate device ids that way at all, as there is n=
o
> > > requirement to do so.  I know of many vendors that seemingly use =
random
> > > values from their product id space, so there is no guarantee that=
 this
> > > will work, sorry.
> > =

> > I did not say it is a requirement, just that they usually do speaki=
ng
> > of just this Seagate case. What is wrong with using that to
> > potentially significantly cut down the quirk list?
> =

> You didn't read commit 92335ad9e895, did you?  It lists a large numbe=
r =

> of Seagate devices that don't work with ATA pass-through, and three o=
f =

> them have product IDs that are larger than 0xab03.
> =

> Please check the facts before guessing about things that will cause =

> problems for other people.

I really don't appreciate the unfriendly tone on the linux kernel
mailing lists (which is why for 20 years I never felt like contributing=

here mo), and well so far this change has caused a problem for me.
While I did not read that commit I was speaking from my experience
with USB devices and drivers, like the hundreds of Avision scanenrs my
SANE backend support and Canon, Fujitsu and Panasonic et
al. scanners. While you proof the point that proposed condition would
avoid 6 out of the 9 entires.

> > > What is wrong with just allowing specific devices that you have t=
ested
> > > will work, to the list instead?  That's the safest way to handle =
this.
> > =

> > The problem is that out of the box it does not work for users, and
> > normal users do not dive into the kernel code to find out and simpl=
y
> > think their devices sucks. Even I for years thought the drive sucks=
,
> > before I took a closer look. If you long term want more new devices=
 in
> > an allow list than the previous quirk list included (9 or 10 does n=
ot
> > sound that many to me), ... whatever you prefer ,-) I would rather
> > have 10 quirk disable list than potential many more white listed th=
e
> > next years to come. Maybe we shoudl simply restore the prevoius
> > quirks.
> =

> That's a possibility, and in the future we may do it.  But probably n=
ot =

> until the enable list grows to a comparable length.

Yeah, why future proof it now, ... which is exactly what brought us
here from the original regression. The enable list will likely not
grow quickly as most users will just expect a broken device hw/
firmware and not bother looking into it and instead live w/o SMART.

But of course I do rewrite this as requested.

     Ren=E9

-- =

  Ren=E9 Rebe, ExactCODE GmbH, Lietzenburger Str. 42, DE-10789 Berlin
  https://exactcode.com | https://t2sde.org | https://rene.rebe.de
