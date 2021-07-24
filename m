Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A63643D482E
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jul 2021 16:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbhGXOJ0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Jul 2021 10:09:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:60928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229545AbhGXOJ0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 24 Jul 2021 10:09:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9DC7560E91;
        Sat, 24 Jul 2021 14:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627138197;
        bh=ITetXwkBC4Qi0UQsbPUxVMmbhoqv2WeZYd61YJqfmNY=;
        h=References:From:To:Cc:Subject:In-reply-to:Date:From;
        b=QO7foexdgn42SguJdmEHw81chtUt65zlCdyBFkDilfviI76CdCjhHzDIdfOPU/Gw2
         jqH2JBMvF9+1AQOnVBiBn6AOPnCPuriNlLU5hFWJUj9xENSFN4cShTfowM8hN2AwsE
         5O29R1jukiwBsgSNIPXEK1RRUTaQA42V9TWdyWw6Cilr5dk/o+p7F91l5dl5WlzCL8
         VDMca0ks06E2RLSDOGXDiY0JWWIAsu1X+MWofNbMd5Fh6fFlIG+hTh5ejY3E0+CMwY
         Rteb8hx8kGz37jfpsn9NCv3ZRciCqAYNwDvtlh1bc163Myfz93vU7o+Dwvg4bV/JX0
         S6UG9rYAZXp6w==
References: <YPvjYIsu0G0HSu5I@pevik> <YPvrpUZ/VRc0eHvA@kroah.com>
 <YPwYlvh4DqaUsPCF@pevik>
User-agent: mu4e 1.4.15; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Petr Vorel <petr.vorel@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-sunxi@googlegroups.com
Subject: Re: Mainlining Linux Sunxi SoC AW USB
In-reply-to: <YPwYlvh4DqaUsPCF@pevik>
Date:   Sat, 24 Jul 2021 17:49:54 +0300
Message-ID: <87zgub6a25.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Petr Vorel <petr.vorel@gmail.com> writes:
>> > [1] https://github.com/linux-sunxi/sunxi-livesuite/blob/master/awusb/awusb.c
>
>> Why is this even a driver at all, it looks like you can write a small
>> userspace program using libusb to do everything it does, right?  What
>> exactly is this driver needed for?
>
> I'm sorry for not providing more info at the beginning. This is a driver for
> host computer (i.e. developers laptop) used by LiveSuit tool [2] to flash Images
> to the NAND of Allwinner devices. LiveSuit itself [3] is unfortunately provided
> only in binary form. The only open source code with GPL v2 license is awusb
> driver. Thus I thought I could ease my life with upstreaming at least the
> kernel driver. But maybe it's not a good idea. I'm using LiveSuit for flashing
> Allwinner A31, but it requires quite old distro due libqtgui4. Maybe sunxi folks
> use something newer nowadays, but I haven't found anything in their wiki.

looks like you could implement that entirely in userspace with libusb ;-)

-- 
balbi
