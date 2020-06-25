Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F12A20A3E1
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jun 2020 19:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406737AbgFYRS6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jun 2020 13:18:58 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:45497 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2406723AbgFYRS5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Jun 2020 13:18:57 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 0F6A45C014B;
        Thu, 25 Jun 2020 13:18:56 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Thu, 25 Jun 2020 13:18:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=7//y0pvaH/Leo2C5ORpFmdyQyIr52gt
        bW4xLroU8KJY=; b=NqqQuCLaVaxWL2gJBgiWY76Krzn333G3TbSXTMwG9qiWwnW
        t5ugn7KBruIrU0ua2xHT7wUydIsMYC3tXWOJnYNJfYRKmkGO6lsNuYy4vYumLNbI
        he7jJ6fdRL5EL4GkxZKA8Lrw0MDKgnHPcwpowT+BHJiT6rBmUDyMc/o+x1Tuvbu3
        6iKVufxjQGXaDslJU6/CScdClCsMw4sh08QE2gmsgFn7nK1L/MM+5JnrOXbHoxPe
        4pu0HEdCZYCX3Wz8sVr5ze0jjzN4FeEZVjF1YTA1tYxBMTH63tA+2FajHdJWRloh
        +85a7jVtgjMB0w3mJl/bzmCu9VQ4mrNhKYIWrXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=7//y0p
        vaH/Leo2C5ORpFmdyQyIr52gtbW4xLroU8KJY=; b=s2HIR49GzKufBi5+GYbEuO
        4V7EXiEWj3T+cM2rXQpfw3bxdchGfXZYC10+hBkqFsJnRB/G7mHSIaHrNJMGyufD
        +pSuQq8NpyxTsIuIWAWD73cl3NQN02s2CLJw5TSf+tmKypdcU98EznQBn4LXAYud
        D0aWzsLXgf63cbXVu/OGr/OUlO5hZJbghBsc9llHqFtOyi3EtHIqCtWRXqPZEkTF
        YhrPH809+mzmK9T8RIuCBiFK4enb4cdI4WWUSi8GujBvFYd43TfeT+X3ok12F7q9
        +lFKXP9ocG3hklo8x7Q1L8DbSVTwqtGD/aNPaKSdWmdctUDKfk5ZGaTIi0Sbw1dw
        ==
X-ME-Sender: <xms:f9z0Xm-wUjDh4W00tR3kKREbRtIwQuu-HtT5Ata1BCv64Vkd2lLKWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudekledgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfufhi
    ugcuufhprhihfdcuoehsihgusegrvggrmhdruhhsqeenucggtffrrghtthgvrhhnpeevge
    fhveevteetfeetkeejjeehudffffffhfeuffelhfeuffdufeduleejfeeugfenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsihgusegrvggrmh
    druhhs
X-ME-Proxy: <xmx:f9z0Xmv1Ag5CRu6jJOpLrKGRN61r2jwSw7kCh9suf6QtYzEU2OwOXA>
    <xmx:f9z0XsD4xJ_8CO7dQ3KnAS2Mgwjf_5KskJfOFmdSuJoHJSrPgVHJ8w>
    <xmx:f9z0XufVPRTr4XEEGpeH0IGnWUpEP8tbAROkAPtDAVUqwn-gwzvhiw>
    <xmx:gNz0XhYamZOiHK4b92VqRBnPCgX2mtWAS4-Uno7hV1Yx11DcEPpcMg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 85161660085; Thu, 25 Jun 2020 13:18:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-543-gda70334-fm-20200618.004-gda703345
Mime-Version: 1.0
Message-Id: <c7d44079-49f9-4f6f-b6e3-212d10d20c26@www.fastmail.com>
In-Reply-To: <CAP6JJ8_YEAj+kdEaEK_X0Q+7puSLX4odr_HAvS_pX5fOggbT0g@mail.gmail.com>
References: <CAP6JJ88avATE3w7HMn94wTti8GY7uncXKT=zLLRbVTz9xbXKVg@mail.gmail.com>
 <37b88453-7346-400f-94d9-36e8854c9f10@www.fastmail.com>
 <CAP6JJ8_YEAj+kdEaEK_X0Q+7puSLX4odr_HAvS_pX5fOggbT0g@mail.gmail.com>
Date:   Thu, 25 Jun 2020 12:18:22 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Mark Deneen" <mdeneen@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: crash when cleaning up gadget configfs directory on sama5d2
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 25, 2020, at 11:17 AM, Mark Deneen wrote:
> On Thu, Jun 25, 2020 at 12:13 PM Sid Spry <sid@aeam.us> wrote:
> >
> > On Thu, Jun 25, 2020, at 9:18 AM, Mark Deneen wrote:
> > > Am I doing something incorrectly? What can I do to debug this further?
> > >
> >
> > On my device it's impossible to remove anything from the configuration once
> > added. Are you sure it is expected that the gadget can be reconfigured after
> > UDC binding and then unbinding? (This is a general question to the list as
> > well, I'd like an answer to your original post also.)
> >
> > My workaround is creating a new gadget and binding the UDC to that instead.
> > Or just rebooting.
> 
> I was able to remove the gadget configuration on Jetson Nano using
> their BSP Kernel (tegra) without an oops, but I have no idea how much
> that kernel differs from mainline.
> 
> If it is not possible, surely crashing is not the desirable behavior!
> 
> What happens on your device if you attempt to remove the configuration?
>

I get "Device or resource busy" even after ensuring I've unlinked the function
from the configs directory. More recently after putting a FunctionFS filesystem
in the gadget I am now unable to unbind the UDC, and dmesg shows that
unbinding seems to erroneously invoke the binding code with an invalid
argument ('').

I've also been able to unbind the UDC but then been unable to rebind it to
anything else but that is sporadic. More typically if I just use premade functions
I can rebind as much as I want, just not change gadgets after the first binding.

From an expected-functionality standpoint it is fairly obvious that what you (and
I) are trying to do should be supported, but realistically it seems like only setup
was tested in any detail as devices that reconfigure themselves are vanishingly
rare.
