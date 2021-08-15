Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBDAE3EC833
	for <lists+linux-usb@lfdr.de>; Sun, 15 Aug 2021 10:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236803AbhHOI4i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Aug 2021 04:56:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:57770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231274AbhHOI4h (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 15 Aug 2021 04:56:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F7D860E76;
        Sun, 15 Aug 2021 08:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629017768;
        bh=SynAQCVqoXDYF9ncAWO53agt+rego7XbUT5tLubN+nQ=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=CyONEpY4uAL8WHLWVeNzlI7vzf6qIuS4psI86o+ZYDHl6bPYwX/8Far165HRlns2Z
         s2RPI0kLYrXRZCxvboDJwNB8xbiEYFlN74JKuxR7pPpH2nIhAMolf4vxV5bkQaX8EX
         sYJSo3O2oCZXwWxOLGFaf002z1hX8w4LwvRUu1m4GKM5mfvmkDsc662QucpnmcTeuB
         S/Qs/It6lZcxv/xO/qoR2QsDob+zAVIROmZ2uumUhq7lHDxyqXRJ09a9A4BFNxbrP5
         t1HxOwNPG5NLePaCsS5QXX/KqcguYjp/wnmU42T1HgBY1RYC0yvDjSECG/hab7qzct
         jcYM7NXIAI6Rg==
References: <3481f401-1d52-d5a1-d983-4b5f7046704b@eyal.emu.id.au>
 <YRi0ICEZM+1eAyNu@kroah.com>
 <588377e9-9775-e885-7f37-26eff44f7299@eyal.emu.id.au>
User-agent: mu4e 1.6.3; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Eyal Lebedinsky <eyal@eyal.emu.id.au>
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB hub problem
Date:   Sun, 15 Aug 2021 11:54:07 +0300
In-reply-to: <588377e9-9775-e885-7f37-26eff44f7299@eyal.emu.id.au>
Message-ID: <878s13jdcq.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Eyal Lebedinsky <eyal@eyal.emu.id.au> writes:
> On 15/08/2021 16.28, Greg KH wrote:
>> On Sun, Aug 15, 2021 at 09:32:06AM +1000, Eyal Lebedinsky wrote:
>>> I have an external 4-way USB3.0 hub (I actually have two of them) That do not behave as expected.
>>> It is an XCD XCDESSUSBH4BK. It is unpowered. I am on fedora 34, kernel 5.13.8-200.fc34.x86_64
>>>
>>> For starters, I found that attaching a USB SSD does not allow booting from it.
>> That is up to your BIOS, not Linux.
>
> Attaching the USB SSD directly to the PC does boot from it though.

right, booting happens way before the OS gets a chance to run. Sounds
like a BIOS issue.

>>> I then found that when attaching my phone it is not recognized.
>> In what way?
>> 
>>> I searched the hub model and IDs but did not find relevant information.
>>> Is there an official list of supported hubs (or devices)?
>> No, as any list would instantly be out of date.
>> 
>>> Here is what it looks like.
>>>
>>> When the hub is attached (no phone) I see
>>>          Bus 001 Device 048: ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub
>>> and
>>>          /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/16p, 480M
>>>              |__ Port 5: Dev 5, If 0, Class=Hub, Driver=hub/4p, 480M
>>>                  |__ Port 2: Dev 48, If 0, Class=Hub, Driver=hub/4p, 480M
>>> Attaching the phone does not add a device.
>>>
>>> Detaching/attaching the hub (with the phone already plugged in) I get
>>>          Bus 001 Device 052: ID 04e8:6860 Samsung Electronics Co., Ltd Galaxy A5 (MTP)
>>>          Bus 001 Device 051: ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub
>>> and
>>>          /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/16p, 480M
>>>              |__ Port 5: Dev 5, If 0, Class=Hub, Driver=hub/4p, 480M
>>>                  |__ Port 2: Dev 51, If 0, Class=Hub, Driver=hub/4p, 480M
>>>                      |__ Port 1: Dev 52, If 1, Class=Communications, Driver=cdc_acm, 480M
>>>                      |__ Port 1: Dev 52, If 2, Class=CDC Data, Driver=cdc_acm, 480M
>>>                      |__ Port 1: Dev 52, If 0, Class=Imaging, Driver=, 480M
>>>                      |__ Port 1: Dev 52, If 3, Class=Vendor Specific Class, Driver=, 480M
>>> and the phone is recognized and accessible as MTP device.
>> Great, so when does this not work?  This shows a successful device
>> found.
>
> Yes, this does show success, but earlier there is this failure shown:
> 	## plug phone:
>         	(no new messages)
>
> In other words, the system did not notice the phone when it was
> plugged into that hub.

does anything work when plugged to that hub? Is the hub self-powered or
bus powered?

> I then attached the hub to the machine with the phone already plugged
> into it and it was noticed.
>
> My suspicion is that the hub is at fault and it fails to report the
> (phone plugged in) event so linux probably has no knowledge of this.
>
> What I failed to mention is that plugging a USB disk into this hub IS
> recognized as expected.  Something is not happy between the phone and
> this hub.
>
> Plugging the phone to other USB 3.0 ports on this machine is
> recognized properly.

do you have other hubs around to test?

-- 
balbi
